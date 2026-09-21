# IN04 — Dated connector revalidation and supersession

**SANITIZED HISTORICAL CONTEXT — no fresh live capability test.**

**Editorial context (not source wording):** Assistant-authored historical execution report, not current runtime evidence. September 14 supersedes September 9 catalog counts/continuation inputs. Selected source report claims only quota/usage reads plus catalog sync, not all tools, output schemas, research quality or writes. Actual account/auth IDs are removed. Counts below are quoted historical counts; IN05 contains only five selected catalog objects.

These are source-worded excerpts, not a fresh capability test or a new architecture requirement. Marked redactions replace selected text; omitted ranges are not silently joined. Source IDs and line ranges resolve in the [catalog](../../catalog/manifest.json).

## Original excerpt — S06:L9–L14

## Verified account and catalog state

- **Helium 10:** Composio toolkit `CUSTOM_HELIUM10`, account `[REDACTED:CONNECTED_ACCOUNT_ID]`, auth config `[REDACTED:AUTH_CONFIG_ID]`, owner identifier `[REDACTED:BROKER_USER_ID]`. Exact connected-account GET returned `ACTIVE`. DCR OAuth; provider endpoint `https://mcp.helium10.com/mcp`.
- **WinningHunter:** Composio toolkit `CUSTOM_WINNINGHUNTER`, account `[REDACTED:CONNECTED_ACCOUNT_ID]`, auth config `[REDACTED:AUTH_CONFIG_ID]`, owner identifier `[REDACTED:BROKER_USER_ID]`. Exact connected-account GET returned `ACTIVE`. API-key auth injected by Composio; provider endpoint `https://app.winninghunter.com/mcp`.
- Paginated native and Composio tool catalogs reconcile: **108/108 Helium 10 tools and 43/43 WinningHunter tools**. Zero missing/extra tools and zero input-schema differences. The older 30-tool WinningHunter statement is a historical catalog count, not the current catalog.
- Catalog/input-schema parity is not an assertion that all tools, all result types, output schemas, write operations or future versions are runtime-equivalent. No mutating provider tools were tested.

## Original excerpt — S06:L51–L57

## First-party implementation references

- https://docs.composio.dev/docs/extending-sessions/custom-mcp.md
- https://docs.composio.dev/reference/api-reference/tools/postToolsExecuteProxy
- https://docs.composio.dev/reference/api-reference/toolkits/postCustomToolkitsUpsert
- https://app.winninghunter.com/docs/mcp
- https://hermes-agent.nousresearch.com/docs/user-guide/features/mcp

## Original excerpt — S07:L1–L19

# Market-intelligence MCP revalidation — 2026-09-14

## Result

Existing Composio accounts for Helium 10, WinningHunter and Brandsearch are ACTIVE and passed live native MCP quota/usage reads. No new OAuth flow, credential entry, account creation, native Hermes configuration change, purchase or provider business mutation was needed.

Proceed ground: reuse established accounts and the documented Custom MCP sync endpoint to repair observed schema drift. This is bounded connector maintenance, not approval to execute every imported tool. Composio Custom MCP remains an explicitly experimental provider feature already used by these connections.

## Actual repair and readback

| Provider | Before | After | Verified read |
|---|---|---|---|
| Helium 10 | 108 imported versus 107 native tools; 107 input-schema differences; obsolete `DOWNLOAD_TOOL_RESULT` import | 107/107 tools, zero missing/extra tools and zero input-schema differences; version `20260914_00` | Native raw MCP usage read and imported typed usage read after sync |
| WinningHunter | 43/43 tools but five input-schema differences | 43/43 tools, zero missing/extra tools and zero input-schema differences; version `20260914_00` | Native raw MCP credit read and imported typed credit read after sync |
| Brandsearch | 48/48 tools, no input-schema differences | No resync needed; version `20260910_00` retained | Native raw MCP usage read |

Helium 10's current native schemas no longer expose the historical continuation argument. The dated September 9 continuation evidence remains valid for that earlier protocol behavior, not a mandatory current input. Discover current schemas before supplying arguments. Preserve full raw MCP responses for metadata-sensitive calls rather than assuming typed execution is lossless.

Brandsearch's current exact-account binding reports auth config `[REDACTED:AUTH_CONFIG_ID]`; the older setup report names a different config. This run records the live binding without guessing why it changed. It performed a usage read, not a new provider-identity check; the earlier owner-confirmed identity remains historical evidence.

## Original excerpt — S07:L31–L35

## Limits

Catalog/input-schema parity and these selected read probes do not certify exhaustive runtime parity, output-schema parity, all search filters, all pagination paths or any write operation. WinningHunter credit checks consume existing quota; no additional credits were purchased. No Shopify, advertising campaign, database business record, browser login or publication was changed.

The prior chat statement that the providers remained disconnected was stale and is superseded by this live verification. The reconciliation directory remains untracked in the current checkout; no commit or push was performed. This connector repair does not finalize positioning, resolve physical-product facts, or establish memory convergence.
