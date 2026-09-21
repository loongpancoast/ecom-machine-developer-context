# IN03 — Shopify account binding and host normalization

**SANITIZED HISTORICAL CONTEXT — no fresh live capability test.**

**Editorial context (not source wording):** Generic existing original with example.myshopify.com placeholders. Separates broker identity, CLI theme access and Admin GraphQL. The docs-only shopify-dev-mcp does not itself prove authenticated store operations. No required Admin scope list, fulfillment webhook or write contract is supplied by this source. Commands are reference text only.

These are source-worded excerpts, not a fresh capability test or a new architecture requirement. Marked redactions replace selected text; omitted ranges are not silently joined. Source IDs and line ranges resolve in the [catalog](../../catalog/manifest.json).

## Original excerpt — S05:L1–L58

# Shopify connected-account identity and host normalization

Use when a Composio Shopify connection reports ACTIVE but provider calls fail, or when several Shopify stores/accounts exist.

## Failure shape

The Shopify toolkit may construct the Admin host by appending `.myshopify.com` to the configured shop value. If the connection was authorized with a full host such as:

```text
example.myshopify.com
```

provider calls can target:

```text
example.myshopify.com.myshopify.com
```

and fail before auth is meaningfully tested (DNS/TLS/SSL errors). `status: ACTIVE` still describes stored connection metadata, not a working provider path.

## Fix

Reconnect or update the connection with the **bare shop slug**:

```text
example
```

not the full `.myshopify.com` hostname. The operator must enter the fresh Admin token through Composio's hosted credential UI; never copy the token into logs or repo files.

## Verification sequence

1. List every current Shopify connected account; do not trust a default when multiple stores exist.
2. Execute the exact zero-write identity call `SHOPIFY_GET_SHOP_DETAILS` through the candidate account.
3. Require provider success and returned store identity matching the intended `example.myshopify.com`.
4. Independently cross-check through official Shopify CLI stored store-auth when available:

```bash
shopify store auth list --json --no-color
shopify store info --store example.myshopify.com --json --no-color
shopify store execute --store example.myshopify.com \
  --query 'query { shop { name myshopifyDomain primaryDomain { url } } }' \
  --json --no-color
```

5. Classify each layer separately:
   - Composio metadata ACTIVE
   - Composio provider call LIVE
   - Shopify CLI theme access LIVE
   - Shopify CLI Admin GraphQL E2E

A broken Composio account does not prove Shopify Admin is unavailable; valid Shopify CLI `store auth` can remain live while old env tokens and the broker connection are stale.

## Safety

- `SHOPIFY_GET_ALL_CUSTOMERS` is a poor identity probe because it exposes PII and does not establish the returned store cleanly. Prefer `SHOPIFY_GET_SHOP_DETAILS`.
- Never print provider tokens, refresh data, or full connection credential blobs.
- Do not blindly create another connection. Reuse the intended auth config when possible and remove stale duplicates only with operator approval.
