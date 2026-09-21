# IN08 — Bookkeeping reconciliation and landed-cost calculation

**SANITIZED HISTORICAL CONTEXT — no fresh live capability test.**

**Editorial context (not source wording):** Assistant-authored report-only role plus source skill excerpts. This supplies source-cited COGS/spend/P&L input/output contracts and cost components, not general-ledger posting or accounting SaaS integration. No supplier identity, product-specific example or actual financial number is exported. Tariff rates/classification and shipping-cost overlap must be freshly validated before financial use; the historical tariff claims and worked examples were deliberately excluded.

These are source-worded excerpts, not a fresh capability test or a new architecture requirement. Marked redactions replace selected text; omitted ranges are not silently joined. Source IDs and line ranges resolve in the [catalog](../../catalog/manifest.json).

## Original excerpt — S12:L42–L46

## Reconciliation scope

- **COGS reconciliation:** per-SKU cost vs. sale price, composing the supplier-cogs skill's existing logic; never re-implement its cost lookups.
- **Ad-spend ledger:** pull spend from platform-exported reports or read-only API calls (Meta, Google, TikTok), reconcile against the revenue attributed by revenue-readback-verifier's outputs where available — never invent an attribution figure the readback verifier has not produced.
- **P&L rollup:** compose COGS + ad-spend + platform fees into a per-venture or cross-venture summary. Every line item carries a source-path citation; a number with no traceable source is flagged NEEDS-VERIFICATION, never silently included.

## Original excerpt — S12:L54–L64

## Handoff contract

**Consumes:** { intent_id, venture, period: date range, sources: [ order export path, ad-spend export path, supplier cost sheet path ] }

**Produces (report-only):** { status: "REPORT_ONLY", reconciliation: { cogs: {...}, ad_spend: {...}, pl: {...} }, needs_verification: [ line items lacking a source citation ], evidence: [ source paths per figure ] }

## Stop gates

- enabled: false (frontmatter). First live dispatch is a [REDACTED:OWNER] decision.
- Every approval_gates category is a hard stop, not a suggestion.
- Never moves money, never executes a transaction or transfer, never touches banking credentials — this holds even when a reconciliation clearly indicates an action is needed; the agent reports the finding and stops.

## Original excerpt — S13:L16–L19

## Env (names only)

- CJ key — env name `CJ_API_KEY` (optional; enables the CJ MCP route; without it, fall back to the Apify CJ scraper)
- Apify token — env name `APIFY_TOKEN` (required for the Section 301 / IEEPA tariff overlay lookup)

## Original excerpt — S13:L34–L40

### 4. Compute all-in landed cost per supplier
```
landed_unit = unit_cost + variant_cost + inbound_freight_per_unit
            + (customs_value * effective_tariff_rate)
            + last_mile_shipping
```
Carry full precision; round only in the table.

## Original excerpt — S13:L72–L74

## Failure handling

If CJ AND the fallbacks return nothing, or the tariff actor is unavailable, do **not** write a placeholder landed cost — write an explicit `(blocked: no supplier/tariff data)` note and escalate. A missing input is a BLOCK, never a "proceed on a guess". (Same law as `.claude/rules/test-dont-assume-gate.md`: an unavailable metric is `unavailable`, not zero.)
