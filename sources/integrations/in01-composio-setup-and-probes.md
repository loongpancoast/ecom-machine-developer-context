# IN01 — Broker setup, scopes, proxy payloads and readiness

**SANITIZED HISTORICAL CONTEXT — no fresh live capability test.**

**Editorial context (not source wording):** Composio is a replaceable auth/execution adapter, not the application database. These local reusable instructions document prior behavior. `latest` is historical discovery guidance, not a production pin. Only named scopes in these excerpts are established here; full provider OAuth consent manifests and webhook contracts are not. All account/token placeholders are names or generic shapes, never usable credentials. The source instructions to retain nonsecret IDs concern private execution receipts; this candidate contains no actual account IDs.

These are source-worded excerpts, not a fresh capability test or a new architecture requirement. Marked redactions replace selected text; omitted ranges are not silently joined. Source IDs and line ranges resolve in the [catalog](../../catalog/manifest.json).

## Original excerpt — S01:L17–L39

## Core endpoints (v3.1, `https://backend.composio.dev/api/v3.1`)

| Purpose | Call |
|---|---|
| Run a toolkit tool | `POST /tools/execute/{TOOL_SLUG}` body `{connected_account_id, user_id?, version:"latest", arguments:{...}}` |
| Arbitrary provider API call (OAuth token injected) | `POST /tools/execute/proxy` body `{connected_account_id, endpoint, method, body?, binary_body?, parameters?}` |
| List auth configs | `GET /auth_configs?app=<slug>` |
| Create auth config (add scopes) | `POST /auth_configs` body `{name, app, toolkit:{slug}, scopes:[]}` — `toolkit` is an OBJECT, `app` is a string |
| Create Connect Link (new connection) | `POST /connected_accounts/link` body `{user_id, auth_config_id}` → `{link_token, redirect_url, connected_account_id}` |
| Re-initiate auth on existing account | `POST /connected_accounts/{id}/refresh` body `{}` → `{status:"INITIATED", redirect_url}` (DEPRECATED but functional; reuses SAME scopes) |

Auth: header `x-api-key: <COMPOSIO_API_KEY>` (project key; proxy execution may require `proxy_execute`-scoped key for some projects).

## Execute response envelope

`{"successful": bool, "data": ..., "error": ...}` — data may be nested under `data.data…` or `data.results`. Preserve the original sanitized envelope first; unwrap only a separate working view after inspecting the actual response keys. Never discard sibling errors, pagination, content blocks, or continuation metadata while extracting records.

## Proxy execute rules (learned the hard way)

- Response: `{"status": <provider HTTP>, "data": <provider body>, "headers": ...}` — always check `status`, never assume 200.
- **JSON APIs** (HubSpot marketing, most REST): send `body` as an object. Stripe-style form APIs: send `binary_body = {"base64": b64encode(urlencode(fields)), "content_type":"application/x-www-form-urlencoded"}` — the field is `base64`, NOT `base64_data` (an unknown field name = HTTP 400).
- `endpoint` is relative to the toolkit's base URL. Stripe base already includes `/v1` — do NOT write `/v1/v1/...` (a clean provider 404, harmless but wasted round).
- Proxy headers use `parameters:[{name:"X-Runway-Version",value:"2024-11-06",type:"header"}]`. `in:"header"` is rejected with `payload.parameters.0.type: Required`; do not repeat the wrong shape.

## Original excerpt — S01:L41–L49

- Never set `Authorization` yourself; Composio injects it. Cross-domain proxy calls are rejected by design.
- Idempotency: for POSTs that create resources (payment links, forms), check for pre-existing duplicates first and DON'T blind-retry — a single retry can duplicate a charge.

## Scope management (the #1 auth gotcha)

- A 403 with `category: MISSING_SCOPES` / `requiredGranularScopes` means the connection's OAuth consent lacks the scope. Re-running the same flow does NOT fix it: **`refresh` re-issues the ORIGINAL scope set.**
- To ADD scopes: create a new auth config with the wider scope list, then create a Connect Link with it, then have the user approve.
- **Always read the `&scope=` param in the generated OAuth/consent URL before handing it to a user** — if the needed scope isn't in the string, the whole flow is wasted. (Real case: Composio's default HubSpot config lacks `forms`; the consent screen lists ~30 scopes, none of them `forms`.)
- Connect Link URL: `https://connect.composio.dev/link/<token>` — user opens, signs in, Composio creates/stores/refreshes the token; returns `connected_account_id` immediately.

## Original excerpt — S01:L81–L93

## API-key Connect forms (verified 2026-09)

Discover `/toolkits/{slug}` first. For HeyGen and Runway, create or reuse an auth config, then give the operator a hosted Connect form rather than asking for keys in chat. The live v3.1 custom-auth create contract uses **camelCase `authScheme`**, not `auth_scheme`:

`POST /auth_configs` with `{toolkit:{slug:"heygen"}, auth_config:{name:"<scoped name>", type:"use_custom_auth", authScheme:"API_KEY", credentials:{}}}`.

Treat HTTP 200 **and 201** as successful creation responses; a 201 must not trigger a blind duplicate retry. Read back `/auth_configs/{id}` and verify toolkit/scheme. Then `POST /connected_accounts/link` with explicit `auth_config_id`, correct `user_id`, and purpose alias. Open `redirect_url` locally without persisting or printing its token. Store only nonsecret IDs/status/expiry. Read back the exact account; `INITIATED` is not connected. After user completion, require `ACTIVE` plus a read-only provider identity/quota probe. HeyGen/Runway API-key routes can have separate API billing; onboarding does not authorize a purchase. HeyGen's official OAuth MCP (`https://mcp.heygen.com/mcp/v1/`) instead uses existing HeyGen plan credits, per its first-party MCP docs. Probe that route before recommending an API subscription. `fal_ai` is the correct Composio slug (not `fal`). An ACTIVE connection under a `pg-test-*` user is not automatically operator authority.

## Pitfalls

- Connected-account IDs are per-toolkit and must be looked up (`GET /connected_accounts` or cached metadata); an EXPIRED/old duplicate account with the same toolkit will 403.
- Treat connected-account `data`/`params` token fields as potentially masked. Check redaction/placeholder status without printing values before any direct-provider authentication; a nonempty token field is not a usable secret. Prefer broker execution. A failed protocol test with a masked field is invalid evidence about the real account's credentials.
- Some tools need `user_id` in the execute body (the CLI-driven connections) — include it when the first attempt errors `user not linked`.

## Original excerpt — S02:L14–L49

## Proxy execute — JSON body (HubSpot marketing API)

```python
POST /tools/execute/proxy
{"connected_account_id": cid, "endpoint": "/marketing/v3/forms", "method": "POST",
 "body": {"name": "...", "fieldGroups": [...], "legalConsentOptions": {...}}}
# 403 MISSING_SCOPES requiredGranularScopes:["forms"] => token lacks scope (see scope flow below)
```

## Proxy execute — form-encoded body (Stripe v1 API)

```python
import base64, urllib.parse
form = urllib.parse.urlencode([("line_items[0][price]", price_id), ("line_items[0][quantity]", "1"),
                               ("billing_address_collection", "required"), ...])
POST /tools/execute/proxy
{"connected_account_id": cid, "endpoint": "/payment_links", "method": "POST",
 "binary_body": {"base64": base64.b64encode(form.encode()).decode(), "content_type": "application/x-www-form-urlencoded"}}
```
- Field is `base64` — sending `base64_data` yields HTTP 400 before the provider.
- Stripe base URL already contains `/v1`; use `/payment_links`, NOT `/v1/payment_links`.
- Read back with `/payment_links/{id}` and `/payment_links/{id}/line_items` (GET, no body).
- Deactivate a link: POST with `active=false` in the form fields; verify by GET.

## Scope-add flow (HubSpot `forms` case)

1. `GET /auth_configs?app=hubspot` — existing configs have `scopes: null` (managed).
2. Create a config with a wider scope list:
   `POST /auth_configs` `{"name":"...with-forms","app":"hubspot","toolkit":{"slug":"hubspot"},"scopes":[...broad list...,"forms","forms.write"]}`
   → 201 `{"auth_config":{"id":"ac_..."}}` (toolkit must be an OBJECT, not a string).
3. `POST /connected_accounts/link` `{"user_id":"...","auth_config_id":"ac_..."}`
   → 201 `{link_token, redirect_url: "https://connect.composio.dev/link/<token>", connected_account_id: "ca_..."}`.
4. BEFORE handing the link to the user, decode it and confirm the HubSpot consent URL's `scope=` query contains the required scope — the default Composio HubSpot config lists ~30 scopes and DOES NOT include `forms`.
5. After approval, retry the API call that previously 403'd.

`POST /connected_accounts/{id}/refresh` (deprecated) returns `{status:"INITIATED", redirect_url}` but re-issues the ORIGINAL scopes — useless for adding scopes.

## Original excerpt — S03:L1–L29

# Connector census and authoritative read probes

## Core rule

A Composio connected account with status `ACTIVE` proves only that Composio has an active account record. It does **not** prove provider authentication, scopes, tenant identity, URL configuration, or tool execution. Never map `ACTIVE` directly to `VERIFIED-E2E`.

## Honest state machine

- `SCAFFOLD`: desired toolkit exists in architecture, no account.
- `CONFIGURED`: desired toolkit and account/auth metadata exist; provider authentication is not yet verified.
- `ACCOUNT_ACTIVE`: Composio reports an active account; authoritative provider identity/read validation is pending.
- `VERIFIED_READ`: the named harmless provider-backed read succeeded against the intended identity/resource and a sanitized receipt was persisted. Record exactly which operation was tested.
- `BLOCKED` or `DEGRADED`: the selected account is failed/expired/inactive, a required binding is unresolved, or its authoritative read failed.

Use a workflow-level `VERIFIED_E2E` label only when that workflow's explicit acceptance criteria pass. An identity/quota probe does not clear writes, all toolkit tools, publication or production operation.

When an account is `ACTIVE` but its provider read fails, **demote it to `BLOCKED` or `DEGRADED`** and retain the exact sanitized error. Do not leave it green.

## Probe procedure

1. `GET /connected_accounts?limit=100` and group by toolkit slug.
2. Prefer an `ACTIVE` account; do not accidentally select an expired duplicate.
3. Discover tools from `GET /tools?toolkit_slug=<slug>&limit=1000`.
4. Inspect the chosen tool’s `input_parameters`; do not guess required arguments or slugs.
5. Choose a harmless read: current user/profile, auth test, list calendars/bases/projects, credit usage, Drive about, or Stripe balance via proxy.
6. Execute with `{connected_account_id, user_id? , version:"latest", arguments:{...}}`.
7. For tool calls, require HTTP success **and** `successful: true`. For proxy calls, require Composio HTTP success **and** provider `status < 300`.
8. Persist a sanitized receipt with provider, exact tool/endpoint/version, actual request-start/response-received times, transport and provider outcomes, and the necessary nonsecret account/auth-config/resource IDs that bind the result to its target. Keep broker routing identity distinct from provider identity. Preserve only provider fields needed by the authorized probe; never store access tokens, auth headers or token-bearing URLs. Do not publish private identity details, balances or continuation/session data in the user-facing summary.
9. Surface the verified operation and its receipt separately from account status in the operator UI. Inspect the original JSON keys before extracting fields; do not invent nested `user`, `data` or `readbacks` paths from a remembered schema.
