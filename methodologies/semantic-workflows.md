# Semantic workflows — developer reading map

This map explains how information moves through the intended application. [Requirements](../REQUIREMENTS.md) defines the scope; historical contracts are optional implementation references.

## The information chain

| Step | What arrives | What the system does | What must survive for the next step |
|---|---|---|---|
| Product and market research | Product or supplier description, geography, brand context, competitor ads/pages, customer reviews/comments and available demand data | Discover relevant evidence, distinguish observed data from estimates, identify customer desires, objections, competitors and plausible offers | Original source/time, exact useful language, metric definition, product identity, unknowns and the rationale for pursuing a direction |
| Brief and script | Product facts, supplier economics, chosen audience/angle, reference ads/pages and customer language | Make an original persuasive direction: hook, promise, proof, objections, offer, visual style, script and page message | Which source supports each factual claim; reference beats; product/brand truth; how image, copy, page and offer fit together |
| Image/video production | Brief, script, original/authorized media, product reference and style reference | Use the best available SaaS or generation engine; produce images, avatars, clips, audio and final edits | Exact prompt/settings, input references, provider/job identity, source timing, revisions, selected assets and reasons for rejection |
| Product/landing page | Approved direction, product variants, price/offer/policy, imagery and reference page structure | Build a usable editable page with intentional visual hierarchy and working cart/checkout behavior | Page/section/version identity, copy and asset bindings, destination/offer identity, actual build result and quality observations |
| Campaign and distribution | Finished ads, destination pages, audience/channel context and launch configuration | Create and run the campaign through supported platform operations | Actual returned platform IDs, creative/page/offer versions, exposure period, spend and tracking identities |
| Performance and learning | Ad engagement/delivery, traffic behavior, page events/heatmaps, orders/refunds and actual costs | Diagnose the most likely weakness, retain uncertainty, select a next creative/offer/page change and allocate effort | Exact version being evaluated, metric scope/window/source, decision reason, next hypothesis, and connection to the next production run |

**Historical source support:** Research Document, brief.json, prompts.json, Campaign specification and results, and Dossier contracts in [historical-workflow-contracts.json](historical-workflow-contracts.json), which carry source IDs and original line ranges. Current scope and developer freedom are defined in [requirements](../REQUIREMENTS.md) and the [requirement summary](../sources/owner-requirements-summary.json).

## What not to lose between steps

A developer should be able to follow:

`source observation → useful customer wording → angle → brief/script → prompt/job → selected asset/edit → ad/page version → measured result → next decision`

Product facts, supplier terms and brand context join this chain rather than being rediscovered independently by every worker. An update to a product fact should identify affected copy/assets; changing a video provider should not sever the history of the creative concept.

The older source uses stage names and Markdown sections to carry these relationships. The new application may use a different database and workflow engine. Preserve the meanings and lineage, not necessarily the old names.

## Transcripts are different data types

- **Methodology/course transcript:** informs how research or production should work. Redistribution rights need review.
- **Reference-ad transcript:** records what a competitor ad says and when. It supports analysis; it is not the merchant's original script or evidence that a claim is true for its product.
- **Customer quotation:** source-attributed language about a desire, experience or objection. Do not present a third-party customer's statement as an authentic testimonial for another product.
- **Original production script:** the words intended for the new ad.
- **Rendered-output transcript:** what the final generated or recorded ad actually says. Comparing it with the intended script can reveal omitted words or altered meaning.

The application must define explicit joins across these types. The historical references do not provide a complete implementation.

## Supplier and post-purchase feedback

The intended application also handles:

`private supplier discovery → outreach/conversation → quote/negotiation → sample/QC → selected terms → purchase/order → shipment/fulfillment → support/return/refund → updated economics and product knowledge`

Historical supply-chain and COGS contracts support inputs such as supplier, warehouse, unit cost, freight, tariffs, last-mile cost and evidence. The required scope includes private-supplier discovery and negotiation, dropship testing, bulk/private-label purchasing and 3PL fulfillment. Support, retention and accounting are also required; the references provide partial methods rather than complete implementations.

Do not export actual suppliers, private negotiations or customer/order data. The developer needs structures and semantics, not those identities.

## Different questions require different evidence

- **Did the request run?** Job/API return and actual artifact.
- **Is the output usable?** Finished visual/audio/page review, including product truth and function.
- **Did it work commercially?** Correctly joined performance and commerce data.

An AI score cannot answer all three. A historical JSON field saying `verified` is not an authenticated event. A competitor ad being active does not prove its profitability. A page preview is not a functioning purchase flow.

## Initial artifact examples and their limits

The [original blank asset template](../reference-implementations/asset-manifest.original.json) retains `run_id`, `assets`, `generated_assets`, `missing_assets`, and a rights-status field. It is deliberately only an empty template.

The [sanitized historical readback schema](../reference-implementations/revenue-readback.sanitized.schema.json) associates an action with measured KPI values, source paths, attribution confidence, a decision and gaps. It does **not** define all the creative/variant/experiment/order joins required by the intended application. Its legacy promotion fields are context, not a requirement.

The [technical catalog](../catalog/SOURCES.md) also includes SQL, a brief compiler, connector contracts and a derived edit-lineage map. These are implementation references, not a running application.
