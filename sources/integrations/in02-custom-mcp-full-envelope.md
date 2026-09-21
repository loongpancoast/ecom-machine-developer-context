# IN02 — Custom MCP import and full-envelope preservation

**SANITIZED HISTORICAL CONTEXT — no fresh live capability test.**

**Editorial context (not source wording):** Experimental Composio Custom MCP lifecycle; Brandsearch DCR discovery; SpyStack local adapter transport diagnosis; typed versus raw SSE/JSON-RPC return semantics. Historical Helium 10 continuation behavior MUST NOT be forced into later schemas: see IN04. Current OAuth, catalog and runtime behavior must be verified before implementation.

These are source-worded excerpts, not a fresh capability test or a new architecture requirement. Marked redactions replace selected text; omitted ranges are not silently joined. Source IDs and line ranges resolve in the [catalog](../../catalog/manifest.json).

## Original excerpt — S04:L1–L53

# Composio Custom MCP with full native response preservation

Verified 2026-09-09 local (2026-09-10 UTC) against official Helium 10 and WinningHunter MCP servers. This is an experimental first-party Composio capability, not a homemade shim. Re-read live docs before setup.

## Official contracts

- https://docs.composio.dev/docs/extending-sessions/custom-mcp.md
- https://docs.composio.dev/reference/api-reference/toolkits/postCustomToolkitsUpsert
- https://docs.composio.dev/reference/api-reference/tools/postToolsExecuteProxy

## Existing-first lifecycle

1. Discover toolkit/auth config/account before creating anything. A missing built-in toolkit does NOT mean Custom MCP is unavailable.
2. `POST /api/v3.1/custom/toolkits/upsert` with `{slug:"NAME",toolkit_config:{name:"...",app_url:"https://provider/mcp",auth_schemes:[...]}}`. Composio returns `CUSTOM_NAME`. API-key mode uses `{mode:"API_KEY",headers:{"X-API-Key":"{{generic_api_key}}"}}` for providers expecting that header. DCR mode uses `{mode:"DCR_OAUTH",discovery_url:"<official discovery URL>"}`. Server URL/auth scheme are immutable: do not attempt to change them or delete/replace without explicit scope.
3. Create/reuse an auth config with `authScheme:"API_KEY"` or `"DCR_OAUTH"`, `type:"use_custom_auth"`, `credentials:{}`, and `is_enabled_for_tool_router:true`. Create a hosted connection link for the actual operator identity. Interactive authorization remains human-gated. ACTIVE cannot be asserted from a link or INITIATED receipt.
4. Read back the exact connected account and require ACTIVE plus actual provider read results. Never print or persist token-bearing connection responses. Credential values remain runtime-only; local credential source is `[REDACTED:PRIVATE_CREDENTIAL_FILE]` where applicable.
5. Initial tool sync is automatic; use the documented custom sync endpoint after native catalog changes. Page both native `tools/list` and Composio `GET /tools?toolkit_slug=...`; compare exact names and normalized input schemas. Store raw catalogs and counts. Tool catalog parity is not exhaustive runtime proof.
6. Execute imported `CUSTOM_*` tools using explicit `connected_account_id`, `user_id`, `version` and `arguments`. Version-pin established workflows after discovery; v3.1 defaults can move.

## Brandsearch OAuth and provider-identity gate

Official MCP: `https://api.brandsearch.co/v1/mcp`; DCR discovery: `https://app.brandsearch.co/.well-known/oauth-authorization-server`; public docs: `https://docs.brandsearch.co/mcp`. The protected-resource metadata points to the app domain as authorization server, not the API domain. Use the same Custom MCP DCR workflow above. Observed imported catalog: 48 tools (version-specific, not exhaustive runtime clearance).

After OAuth, read exact account status, then both `get_usage` and `whoami`. A Composio `user_id` is the broker's routing identity, NOT proof of the authenticated provider account. Brandsearch `whoami` returns `name` and `email` at the top level of its data, not under a `user` object. Inspect them before querying private saved folders or doing research against the account. If the provider identity differs from the intended account, stop further use and ask the owner; passing auth/quota alone is not permission. Never persist the `api_key` object, bearer token, or token fingerprint from identity responses. Keep only necessary redacted evidence.

## SpyStack connectivity diagnosis before upstream auth repair

SpyStack's local MCP catalog may load even when its REST API is down. Trace the effective `MCP_API_BASE_URL` using the same launcher environment, then check that endpoint, socket listener and backend process before touching provider credentials. In the observed Windows setup the wrapper called `http://localhost:8000`; `All connection attempts failed` coincided with no API listener and unavailable Docker Desktop engine. That is a local transport failure, not proof of WinningHunter auth failure. Do not blindly start the complete Docker stack: inspect restart policies and worker/beat behavior first so diagnostics do not revive external-action automation.

## Revalidation before OAuth or schema reuse

Check exact established accounts and live provider reads before restarting OAuth after a context gap; a historical failed login may already be superseded. Re-list native and imported catalogs even when counts match: parameter enums and optional fields can drift without a count change. Preserve pre-sync catalogs, invoke the documented sync endpoint only for drifted imports, then paginate the exact postwrite toolkit readback, compare input schemas, and run a version-pinned harmless imported read. Do not replace or delete accounts merely to refresh schemas.

Treat continuation behavior as version-specific. In a later verified Helium 10 catalog, the native server removed the historical continuation argument and download helper while the imported catalog still exposed them. Do not force historical arguments into current calls. The continuation workflow below records an earlier protocol; apply it only when current discovery/results advertise it. Full-response preservation remains the conservative route for metadata-sensitive workflows.

## Critical Helium 10 result-envelope trap

Native `analyze_keywords` returns structured data AND a second native content block with server-issued continuation metadata. Composio imported typed tool execution returned identical structured data but DROPPED this second block. Do not claim that a typed wrapper is lossless just because input schemas match.

Composio's existing authenticated proxy fixes this without a custom bridge or provider-token extraction:

`POST https://backend.composio.dev/api/v3.1/tools/execute/proxy`

Body fields:
- `connected_account_id`: exact active custom MCP account;
- `endpoint`: complete official MCP HTTPS URL;
- `method:"POST"`;
- `parameters:[{name:"Content-Type",value:"application/json",type:"header"},{name:"Accept",value:"application/json, text/event-stream",type:"header"}]`;
- `body`: native JSON-RPC message.

Perform MCP `initialize` and `notifications/initialized`; then `tools/call`. Honor negotiated protocol and any transport session header. The tested H10 gateway negotiated `2025-06-18` and did not require a transport session header. Carry `MCP-Protocol-Version` on later calls. Composio injects OAuth/API-key auth; do not manually put Authorization in proxy headers.

The proxy response has `{status,headers,data}`. Check outer HTTP, provider `status`, native RPC `error`, and result `isError` separately. `data` can be raw SSE text. Parse every SSE event's complete data block and preserve JSON-RPC result content, structuredContent, _meta, and any continuation metadata. Never keep just the first text block. Echo the server-issued `session_id` argument on later H10 tools; do not invent it or expose it in user-facing output. Typed structure-only calls may be used after proper bootstrap; raw proxy remains preferred when the full envelope matters. Native direct MCP remains fallback.

## Original excerpt — S04:L55–L67

## Audit-closure proof packet

Use this for connector migrations and claims of native/typed parity:

1. **Account binding:** retain a sanitized exact-account readback containing the necessary account ID, broker user, toolkit, auth-config ID and auth scheme. Setup attempts or an ACTIVE flag alone do not establish the final association. Probe provider identity separately where needed.
2. **Request-level evidence:** save actual UTC request-start and response-received times, the selected account, endpoint/method, tool/version, nonsecret arguments, safe protocol headers and sanitized response. Never persist authentication headers or OAuth material. For MCP, distinguish the initialize response, initialized notification acknowledgement and tool result; preserve provider and RPC error fields.
3. **Historical limits:** response-only evidence does not prove the exact historical request/header sequence. First inspect the original receipt schema for existing timing and request fields. If missing, mark that limitation. A fresh harmless probe can verify the current route, not retroactively prove an earlier analytical call.
4. **Semantic fixtures:** record transport success separately from `PROBED_EMPTY`, `REJECTED_ENTITY_MISMATCH` and admitted corroboration. Derive returned counts from records and distinguish them from provider totals/has-more. A successful response containing the wrong domain stays rejected.
5. **Portable manifests:** use repository-relative paths, exact SHA-256 and byte counts; include all connection JSON receipts except the manifest itself. Each research fixture should bind request/response times, returned count, transport outcome and semantic disposition. Inspect actual field names before building the manifest; do not guess them from prose. Do not reconstruct unavailable timestamps from file modification times.
6. **Explicit citations:** the summary must name the auth-binding, toolkit/server-registration, native-config (if claimed) and continuation receipts that support its assertions. A file merely being present in the directory or aggregate manifest is insufficient when the claim's source is unclear.
7. **Review closure:** retain the independent verdict unchanged. Record subsequent fixes and deterministic closure checks separately; do not relabel a review that failed on one citation as an independent PASS. Re-check referenced files and hashes after the last edit, and keep full-runtime/production clearance separate.

This checklist came from a bounded connector audit: response-only handshake evidence, an unbound auth-config claim, an omitted registration citation and a nonportable/incomplete fixture manifest were separate findings. Closing one did not close the others.
