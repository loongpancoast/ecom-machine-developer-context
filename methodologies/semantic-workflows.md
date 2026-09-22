# Semantic workflows — developer reading map

This map explains how information moves through the full commissioned owner-controlled, multi-brand private-cloud autonomous ecommerce engine. [Requirements](../REQUIREMENTS.md) defines the scope; historical contracts are optional implementation references, not permission to deliver a reduced core or leave the full business system as a future vision. The completed system, not a demo, scaffold, disconnected automation or partial build, is the final deliverable.

## The information chain

| Step | What arrives | What the system does | What must survive for the next step |
|---|---|---|---|
| Product and market research | Product or supplier description, geography, brand context, competitor ads/pages, customer reviews/comments and available demand data | Discover relevant evidence, distinguish observed data from estimates, identify customer desires, objections, competitors and plausible offers | Original source/time, exact useful language, metric definition, product identity, unknowns and the rationale for pursuing a direction |
| Sourcing and economics | Candidate identity/variant, demand hypothesis, supplier leads, quotes and destination market | Connect sourcing, supplier diligence, quotation/negotiation and sample/QC; calculate landed economics and establish approved purchasing terms | Supplier/quote/sample identities and versions, evidence, terms, capacity/lead times, assumptions, costs and commitment authority |
| Brief and script | Product facts, supplier economics, chosen audience/angle, reference ads/pages and customer language | Make an original persuasive direction: hook, promise, proof, objections, offer, visual style, script and page message | Which source supports each factual claim; reference beats; product/brand truth; how image, copy, page and offer fit together |
| Image/video production | Brief, script, original/authorized media, product reference and style reference | Create original product-specific finished ads inside the owned engine; prefer direct image AND video APIs, using an aggregator only for a demonstrated full-workflow/skill improvement through an owned adapter | Exact prompt/settings, input references, provider/job identity, source timing, revisions, selected assets, decoded-output/reference review and reasons for rejection |
| Full Shopify stores and catalog | Approved direction, product variants, price/offer/policy, imagery and reference page structure | Build domains/branding, native Liquid stores, responsive navigation, policies, payment/shipping and working checkout; bulk create/manage/import/migrate products, variants, collections, media, copy, prices, metafields and templates with duplicate-safe retries | Brand/store/catalog/platform IDs, page/section/version identity, copy and asset bindings, destination/offer identity, actual build result, functional purchase tests and quality observations |
| Conversion and discovery improvement | Functional store, offers, customer journey and baseline | Run bundles, upsells, cross-sells, post-purchase flows and SEO/AEO/GEO tests | Control and changed version, measurement window, exposure, source-qualified results, decisions and next iteration |
| Meta accounts and tracking | Owner-authorized business/ad accounts, brand identities, commerce catalog and consent configuration | Configure Facebook Pages, Instagram links as applicable, catalogs, Pixel/CAPI and consent; verify browser/server deduplication and purchase events against actual test orders | Account/Page/catalog/event identities, product/value/currency fields, permission/consent state, deduplication and purchase-verification receipts |
| Campaign and distribution | Finished ads, functioning checkout destinations, audience/channel context and approved launch configuration | Create and run live budgeted campaigns through supported platform operations; read back actual state | Actual returned platform IDs, creative/page/offer versions, exposure period, approved budget, recorded spend and verified tracking identities |
| Purchasing and fulfillment | Approved supplier terms, purchases, customer orders and stock/routing rules | Connect purchasing, order routing, 3PL fulfillment, shipment tracking and exceptions | Purchase/order/shipment IDs, selected terms, status readbacks, costs, delivery promises and exception decisions |
| Post-purchase and finance | Orders, delivery events, customer requests, payments, refunds and costs | Operate returns, support, retention, accounting and profitability reconciliation | Order/customer linkage under privacy controls, resolutions, consent, ledger/reconciliation records and actual contribution economics |
| Performance and learning | Ad engagement/delivery, traffic behavior, page events/heatmaps, orders/refunds and actual costs | Diagnose the most likely weakness, retain uncertainty, select a next creative/offer/page change and allocate effort | Exact version being evaluated, metric scope/window/source, decision reason, next hypothesis, and connection to the next production run |

**Historical source support:** Research Document, brief.json, prompts.json, Campaign specification and results, and Dossier contracts in [historical-workflow-contracts.json](historical-workflow-contracts.json), which carry source IDs and original line ranges. Current scope and developer freedom are defined in [requirements](../REQUIREMENTS.md) and the [requirement summary](../sources/owner-requirements-summary.json).

## What not to lose between steps

A developer should be able to follow:

`source observation → useful customer wording → angle → brief/script → prompt/job → selected asset/edit → ad/page version → measured result → next decision`

Join the creative chain to `supplier/quote/QC → accepted economics/offer → catalog/store/checkout → campaign/tracking → purchase/order → fulfillment → return/support/retention → accounting/profitability → next product and creative decision`. Preserve brand/account boundaries, approved spending authority and stable IDs across both chains.

Product facts, supplier terms and brand context join this chain rather than being rediscovered independently by every worker. An update to a product fact should identify affected copy/assets; changing a video provider should not sever the history of the creative concept.

The older source uses stage names and Markdown sections to carry these relationships. The new application may use a different database and workflow engine. Preserve the meanings and lineage, not necessarily the old names.

## Transcripts are different data types

- **Methodology/course transcript:** informs how research or production should work. Redistribution rights need review.
- **Reference-ad transcript:** records what a competitor ad says and when. It supports analysis; it is not the merchant's original script or evidence that a claim is true for its product.
- **Customer quotation:** source-attributed language about a desire, experience or objection. Do not present a third-party customer's statement as an authentic testimonial for another product.
- **Original production script:** the words intended for the new ad.
- **Rendered-output transcript:** what the final generated or recorded ad actually says. Comparing it with the intended script can reveal omitted words or altered meaning.

The application must define explicit joins across these types. The historical references do not provide a complete implementation.

## Included supplier and post-purchase operations

The historical references inform this included operational flow:

`private supplier discovery → outreach/conversation → quote/negotiation → sample/QC → selected terms → purchase/order → shipment/fulfillment → support/return/refund → updated economics and product knowledge`

Historical supply-chain and COGS contracts explain supplier, warehouse, cost and evidence fields. Current delivery includes connected sourcing, quotes, supplier diligence, negotiation, sample/QC, purchasing, order routing, 3PL fulfillment/tracking, returns, support, retention, accounting and profitability, with verified external outcomes and failure handling. This is not a requirement to own a warehouse or payment rail. Owner/KYC/legal approvals, credentials and commercial access are dependencies to resolve with the owner, not scope exclusions. Commitments and spend stay within separately approved authority. See the current [requirements](../REQUIREMENTS.md).

Do not export actual suppliers, private negotiations or customer/order data. The developer needs structures and semantics, not those identities.

## Different questions require different evidence

- **Did the request run?** Job/API return and actual artifact.
- **Is the output usable?** Finished visual/audio/page review, including product truth and function.
- **Did it work commercially?** Correctly joined performance and commerce data.

An AI score cannot answer all three. A historical JSON field saying `verified` is not an authenticated event. A competitor ad being active does not prove its profitability. A page preview is not a functioning purchase flow.

## Operating and final-acceptance evidence

The system must operate **60 live product tests per month**, not merely generate a queue or demonstrate hypothetical capacity. Every qualifying test joins completed research/economics/offer, finished ads, a functioning checkout destination, a live budgeted campaign, verified tracking, recorded spend/results and an explicit decision. Candidate rows, catalog entries, ad variants, simulations and replays do not count as separate live product tests. Preagree measurement windows and decision criteria and obtain separate operating-spend approval. A failed commercial hypothesis can be valid recorded evidence; a predicted winner cannot substitute for a live test, and profitable outcomes are not an engineering guarantee.

Analyze permitted scraped ads/pages for hooks, pacing, narrative, CTA and angles; create ORIGINAL product-specific finished outputs. Compare actual decoded ads and rendered/functional pages with their references, inspect the whole purchase path and produce the next measured iteration. Initial work samples and bounded upgrade demonstrations are distinct from final commissioning. Milestones stage complete delivery without reducing scope.

## Runtime and upgrade continuity

Codex AND Claude power both development and the deployed engine through verified official supported access, capacity and runtime terms. The former video-only paid-API cap is superseded. Prefer direct image AND video APIs; aggregator use needs a full-workflow/skill benefit to the rendered result and an owned replaceable adapter, not merely convenient model access. All operating costs require approval. Amboras, Higgsfield, Arcads, Atria, Brandsearch and other references describe capabilities to create within the owned engine, not mandatory subscriptions, SaaS links or every proprietary vendor feature to clone.

Replace models, providers, skills and whole workflows, including combining/removing obsolete stages, without losing source assets, data, business context, decision history or stable external IDs. Compare actual output quality, cost, speed and reliability, version configurations and evidence, and demonstrate restore. This is practical adaptation to newer models, better agents and increasingly AGI-like capabilities, not a literal AGI-immunity promise. See [agent-led execution](agent-led-execution.md).

## Initial artifact examples and their limits

The [original blank asset template](../reference-implementations/asset-manifest.original.json) retains `run_id`, `assets`, `generated_assets`, `missing_assets`, and a rights-status field. It is deliberately only an empty template.

The [sanitized historical readback schema](../reference-implementations/revenue-readback.sanitized.schema.json) associates an action with measured KPI values, source paths, attribution confidence, a decision and gaps. It does **not** define all the creative/variant/experiment/order joins required by the intended application. Its legacy promotion fields are context, not a requirement.

The [technical catalog](../catalog/SOURCES.md) also includes SQL, a brief compiler, connector contracts and a derived edit-lineage map. These are implementation references, not a running application.
