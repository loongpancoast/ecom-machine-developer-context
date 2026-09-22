# Questions to settle before starting

Current scope reconciliation: 2026-09-22. These questions specify implementation and evidence for the **complete commissioned system** in [REQUIREMENTS.md](REQUIREMENTS.md), not a choice to reduce it to a pilot or smaller core. We are engineers using Codex, Claude and vibe coding. Give specific, commercially grounded answers; honest technical pushback is welcome.

## Complete delivery and operating dependencies

- Which advertising, Shopify, supplier, warehouse/3PL, support, retention and financial providers will deliver every required function? What supported operations, account access, legal/KYC and owner approvals are needed, who provides them, and what affects schedule? Dependencies do not exclude capabilities.
- How will you connect research, economics and offers to original finished ads, functioning stores, live campaigns, fulfillment and post-purchase profitability? Show where data and external IDs join, not just a diagram of disconnected tools.
- How will the engine complete **60 live product tests per month**, including the final monthly acceptance run? Propose the named monthly window/timezone, launch cadence, per-product observation/attribution windows, spend thresholds, stop/scale criteria and deduplicated result ledger. How will you handle reporting lag, access delays and genuine zero-sales results without counting variants, rows, simulations or blocked tests?
- What separately approved ad/media/platform/model, hosting and operational budgets are needed beyond engineering? State capacity constraints and exhaustion behavior without assuming or authorizing spend.

## Research, creative and storefronts

- How will you research/scrape top ads and pages, analyze hooks, pacing, narrative, CTA and angles, then produce original product-specific ads/pages? How are source rights, product claims and first-party outcomes distinguished from vendor estimates?
- Which useful capabilities from Amboras, Arcads, Higgsfield, Atria, Brandsearch, WinningHunter and Kalodata will you create inside the owned engine? Explain end-to-end workflow and asset/data ownership, not a list of SaaS links. We are not asking for every vendor feature.
- How will you produce and review finished image/UGC/avatar/video ads, including editing, captions, audio, transitions and exports? Show decoded visual/audio and functional page review against references, followed by an iteration grounded in measured performance. Prompts, job receipts and isolated clips are not finished outputs.
- How will you create complete Shopify stores with domains, branding, native Liquid, responsive navigation, policies, checkout/payment and shipping? Which plan/extension constraints need supported alternatives?
- How will catalogs handle products, variants, collections, media, copy, prices, metafields and templates through bulk mutation/import and migration? Specify representative batch sizes, stable IDs, draft review, item-level errors, duplicate-safe retries and recovery without overwriting unrelated data.
- How will offers, bundles, upsells, cross-sells, post-purchase flows and SEO/AEO/GEO be implemented and tested, including mobile purchase-path and conversion checks?
- How will you create/configure Meta Facebook Pages, connect business/ad accounts and catalogs, link Instagram where applicable, and verify Pixel/CAPI events, consent, product/value fields and deduplicated purchases against Shopify?
- What will visual summaries show for products, scraped pages and competitor ads, and how will selections enter actual execution?

## Operations, autonomy and evolution

- How will quotes, supplier discovery/negotiation/diligence/QC, purchasing, order routing, 3PL fulfillment/tracking, returns, support, retention and accounting/profitability work together? Identify real supported readback and representative transaction/exception evidence. This is connected functionality, not a separate physical warehouse, payment rail or unrelated ERP build.
- How will both Codex AND Claude power development and the deployed engine through officially supported access? What terms, capacity, automation permissions and limit-recovery behavior will you verify? Do not assume subscriptions include API usage.
- Which direct image AND video APIs will you use? If you propose an aggregator such as Higgsfield, show how its skill/full workflow improves the rendered result and remains inside our owned creative engine with an export/replacement path.
- How will spending, brand/account separation, validation and duplicate prevention remain enforced outside prompts as agents act autonomously?
- How will the system keep up with newer models, better agents and increasingly AGI-like capabilities? Demonstrate replacement of a model/provider, skill and whole workflow, including combining/removing obsolete stages, without losing context, source, history, data or assets. No literal AGI or permanent future-immunity promise is expected.
- What repeatable quality/cost/speed/reliability comparisons, human visual/functional review, versioning and restore procedure will let us adopt improvements without dependence on you? How will you avoid confusing configuration restore with undoing live spend/actions?

## Commercial terms and evidence

- What fixed price do you propose within the negotiable $6,000-$8,000 range? $8,000 is the ceiling, not the automatic fee. Break out custom work, component reuse, integrations, creative finishing, tests and deployment. Unsupported padded manual-from-scratch estimates and invented coding-hour savings are not acceptable.
- What complete-delivery milestones and schedule can you support around the roughly one-month target, including monthly live-test measurement? Final price, milestones and schedule must be agreed before hiring; milestones cannot quietly reduce scope.
- What exact outputs and evidence prove every acceptance requirement? A demo, scaffold, disconnected automation or partial build is unacceptable as final delivery. Acceptance fixes and upgrade demonstrations are included. Extra paid work needs prior written scope and price approval; optional ongoing maintenance is separate.
- Link relevant work you personally built and state your contribution and substantiable outcomes. An existing walkthrough is welcome initially; promising candidates may be asked for a short personal Loom. Applicant samples are not final acceptance and no unpaid custom build is required. Write in your own words and identify real constraints rather than agreeing to everything.

The repository is methodology reference, not supplied working software or a guarantee of reusable components. Historical architectures, source counts and examples do not prove delivery-time savings. No account action, hiring or spend is authorized by these questions. Use the [five short screening questions](UPWORK-JOB-POSTING.md#screening-questions) for the initial application; these detailed questions support pre-hire agreement.
