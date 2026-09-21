# Integration and commerce references

Historical setup notes, schemas and operating methods. Use [requirements](../../REQUIREMENTS.md) for the intended scope and autonomy; these references do not establish current provider access or a working application. Source aliases and classifications resolve in the [manifest](../../catalog/manifest.json).

## [IN01 — Composio auth and execution](in01-composio-setup-and-probes.md)

Toolkit execution, hosted auth setup, OAuth scope changes and JSON/form proxy requests.

- **Auth and data:** `COMPOSIO_API_KEY`, `x-api-key`, `OAuth`, `API_KEY`; named scopes `forms`, `forms.write`. Toolkit returns `{successful,data,error}`; proxy returns `{status,headers,data}`.
- **Limits:** Full least-privilege scopes and webhook contracts are not supplied. Replace `latest` with a deliberate version pin in production.

## [IN02 — Custom MCP and response preservation](in02-custom-mcp-full-envelope.md)

Catalog import, DCR OAuth, schema synchronization and full SSE/JSON-RPC responses.

- **Auth and data:** `API_KEY`, `DCR_OAUTH`, `generic_api_key`, `X-API-Key`, `MCP_API_BASE_URL`, `MCP-Protocol-Version`. Preserve `content`, `structuredContent`, `_meta`, errors and continuation metadata.
- **Limits:** Historical instructions describe experimental Custom MCP and immutable URL/auth settings. Catalog parity is not runtime/output parity; continuation fields can change.

## [IN03 — Shopify identity and store binding](in03-shopify-identity-and-host.md)

Bind an operation to the intended store; distinguish broker auth, theme CLI access and Admin GraphQL.

- **Auth and data:** Admin token, hosted credential UI or Shopify CLI store auth. `SHOPIFY_GET_SHOP_DETAILS` and GraphQL `shop {name myshopifyDomain primaryDomain {url}}` are identity references.
- **Limits:** Admin scope lists and order/fulfillment/return payloads are not supplied. Documentation/validation MCP access is not store authorization.

## [IN04 — Historical market-intel connector behavior](in04-market-intel-dated-revalidation.md)

September 14 source descriptions of Helium 10, WinningHunter and Brandsearch usage reads and catalog revalidation.

- **Auth and data:** `DCR_OAUTH`, `API_KEY`. Historical schema versions include `20260914_00` and `20260910_00`.
- **Limits:** Dated source claims, not current operation tests. A usage read is not necessarily an identity check; writes, pagination and output parity remain separate concerns.

## [IN05 — Native research and P&L schemas](in05-native-tool-schemas.json)

Selected tool objects for keyword analysis, Amazon seller P&L, ad transcripts, Shopify-store search and product discovery.

- **Auth and data:** Preserves input schemas and available output schemas. H10 output includes errors, caveats, currency, timezone and pagination; selected WH/Brandsearch objects do not declare output schemas.
- **Limits:** `generate_if_missing` can trigger paid transcript generation. Seller P&L is not general DTC accounting. Zero COGS may mean unconfigured; provider estimates are not observed commerce results.

## [IN06 — Advertising handoffs](in06-ads-handoff-contracts.md)

Research/creative/store inputs → campaign, ad-set and creative packet → target-bound readback.

- **Auth and data:** `META_ACCESS_TOKEN`, `META_AD_ACCOUNT_ID`, `DRIVEON_APPROVE_META_PAUSED_DRAFT_WRITE` are historical configuration names. Includes draft payload and `connector_status` fields.
- **Limits:** Historical draft-first design, not a new approval mandate. OAuth scope lists, proved write execution and complete creative-to-order attribution are not supplied.

## [IN07 — Support triage and SLA](in07-support-triage-sla.md)

Intake, severity, fact gaps, draft response and escalation tracking.

- **Auth and data:** Input: `intent`, `channel`, `venture`, `raw_item`. Output: `DRAFT_ONLY`, `tier`, `draft_reply`, `fact_gaps`, `sla_target`, `escalation_required`, `evidence`.
- **Limits:** Historical disabled/draft-only role. Helpdesk auth, send/close, RMA and refund integrations need implementation.

## [IN08 — Bookkeeping and landed cost](in08-bookkeeping-and-landed-cost.md)

COGS reconciliation, spend ledger, P&L inputs and unit/freight/customs/last-mile costs.

- **Auth and data:** Historical source names `CJ_API_KEY`, `APIFY_TOKEN`. Period and source records feed `REPORT_ONLY` reconciliation with per-figure evidence and `needs_verification`.
- **Limits:** No general ledger, journal posting, accounting SaaS connector or bank-reconciliation engine. Verify shipping-cost overlap, tariff classification and actual quotes.

## [IN09 — Contribution margin and cash planning](in09-financial-analysis-method.md)

First/repeat cohort economics, payback, LTV and cash-out timing.

- **Auth and data:** AOV, loaded COGS, new-customer CAC, fees, retention, payment terms and OpEx feed margin and cash analysis.
- **Limits:** Course-derived method. Fee defaults and repeat-order acquisition assumptions require validation. No accounting connector or cash-movement implementation.

## [IN10 — Supplier selection and quality checks](in10-supplier-selection-negotiation-qc.md)

Supplier modes, MOQ negotiation, samples and certification/QC.

- **Auth and data:** Product, operating stage, market and needs feed negotiation options, comparable samples and certification evidence.
- **Limits:** Method only. No purchasing, supplier communication, PO/invoice, 3PL stock/order-exception or RMA adapter. Custom-product-development coverage is incomplete.

## [IN11 — Retention and fulfillment touchpoints](in11-retention-and-fulfillment-touchpoints.md)

Abandoned checkout, welcome, post-purchase, shipment and review flows.

- **Auth and data:** Historical OmniSend/DSers/17Track configuration examples; trigger/timing/content descriptions rather than provider event schemas.
- **Limits:** Vendor/API availability is not established. Consent, suppression, unsubscribe, eligibility, send idempotency, order routing and returns require implementation. Historical prices and revenue claims are not targets.

## [IN12 — Platform execution schema](in12-platform-execution.schema.json)

Provider-neutral request, dry-run, idempotency, readback and rollback fields.

- **Auth and data:** `action_id`, `execution_id`, surface, connector type, mode, approval, request, safety, expected artifacts and readback path.
- **Limits:** Historical schema identity is redacted; assign an intentional identity before use. Validation neither executes requests nor establishes permission. Vendor enums and `budget_cap` are not required design choices.

## Common implementation gaps

Webhook registration, signature validation, retries, event idempotency and resource-level scopes require explicit design and testing. Missing examples in this selection do not mean a provider lacks the capability.

Keep app-owned data/history separate from auth brokers and production engines. Validate the exact store/account, operation, version and returned data; a catalog entry or active account record is not end-to-end functionality.

Historical September connector observations apply only to the named services and operations, not every connected account. Supporting installers and dependency bundles are not complete. Course-derived and third-party material remains subject to applicable licensing restrictions.
