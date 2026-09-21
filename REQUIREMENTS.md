# Requirements

## The main job

Build a private, hosted system for one business running multiple ecommerce brands. Connect product research, finished creative, storefronts and campaign testing. Let the owner approve the initial direction, then run routine work within agreed permissions and budgets.

We are engineers. Explain tradeoffs and verify the parts that matter rather than promising everything.

## Research

Collect product facts, competitor ads and pages, customer language, supplier costs and other evidence needed to decide whether a product deserves a test. Keep source links and dates. Use the research to choose an offer and write a brief, scripts and a test plan. Keep rejected ideas and previous results so the next test does not start from scratch.

## Creative and stores

Produce finished image ads, video/avatar ads and usable landing pages, product pages and stores. The output must fit the product and brand, use accurate facts and carry the same offer from ad to page. Include the editing needed to turn generated clips into a finished ad.

The methodology references include before/after frames, AI UGC, customer research and reference-video analysis. They explain possible methods, not a required node editor, model or architecture. Judge the build by the finished output.

## Shopify catalog creation and management

Create and manage catalogs across the agreed Shopify stores. Include products, variants, collections, descriptions, media, prices, relevant metafields and inventory references. Support bulk creation and updates rather than one-product-at-a-time entry. Preserve stable product/variant IDs and the link back to source research.

Show draft review before publication, progress and item-level errors, safe retries and duplicate prevention. Do not silently overwrite unrelated store data. Agree and test a representative catalog batch size before contracting; the business needs catalog-scale operation, not a single demo listing.

## Pixels and conversion tracking

Set up and verify tracking for the agreed stores and ad platforms, including Meta Pixel and CAPI where applicable. Check view-content, add-to-cart, checkout and purchase events, their value/currency and product or variant IDs. Respect customer consent and avoid counting browser and server reports of the same purchase twice.

Use test orders to prove the events arrive in the destination tools and reconcile with Shopify. Keep test traffic separate from commercial results. Document missing permissions or approval dependencies rather than claiming a pixel is working because its code is installed.

## Visual research dashboard

Give each scraped product a visual summary: product images, landing-page previews and links, competitor ad thumbnails or playable previews where permitted, prices/offers, source dates and a short assessment of the opportunity and concerns. Link ads and pages to the correct product. Missing evidence should remain visible rather than filled with invented numbers.

Allow side-by-side comparison and filtering by product, brand and test status. Open the underlying sources from the summary and pass a selected product into the research, creative and store workflow. This is a useful review surface over real work, not a dashboard-only deliverable.

## Campaigns and improvement

Connect the agreed advertising and commerce platforms. Set up and manage tests within approved spend limits. Bring back spend, conversions and orders, linked to the exact ads, offers and pages used. Use those results to propose and test changes.

Choose the initial platforms and access requirements before contracting. Do not promise integrations with unnamed providers. External platform approvals and unavailable permissions must be identified before dates are agreed.

## Supplier and fulfillment work

These are secondary to research, creative and testing. Include basic supplier/product-cost records and the order information needed to evaluate tests. Keep the design open to later supplier and fulfillment connections.

A custom ERP, warehouse system, autonomous supplier negotiation, comprehensive 3PL integration, full accounting, returns/support or retention suite is not required for this delivery. Further operational automation needs its own agreed scope; it is not an unwritten condition of acceptance.

## Records and reliability

Keep brands and accounts separate. Store sources, product facts, briefs, prompts, media, page versions, campaigns, costs and results. Preserve earlier versions rather than overwriting them.

Include secure access, media storage, background jobs, logs, cost limits and recovery from failures. Retrying a failed request must not create duplicate campaigns, purchases or posts. Check that external actions actually succeeded.

## Future-proofing

The system must be future-proofed for improving agentic AI. We own the source, data, business context and history. Changing an agent, model or tool must not require rebuilding the application or losing previous work. Demonstrate a tested replacement and show that the saved records still work.

Choose the implementation. Custom development is preferred where it serves the business; reliable existing tools are welcome. Do not make one provider, dashboard or rigid automation sequence the permanent center of the business.

## Budget, costs and schedule

Budget: $6,000-$8,000 fixed fee, negotiable. $8,000 is the ceiling, not a committed fee. The aim is about one month, with required access ready. Price, milestones and schedule must be agreed before hiring.

The fee covers the complete research, creative, store and testing work agreed here. Milestones should produce working results. They are not permission to deliver disconnected screens or an unfinished demo.

Use Codex and Claude subscriptions through officially supported access. Paid API usage is limited to video generation. Verify the actual runtime, image-generation route, allowances and recovery when limits are reached before making a commitment. Do not assume that subscriptions include API credits or use unofficial bypasses. If a requirement cannot be met, identify the specific conflict before contracting. A different cost arrangement requires owner approval.

Disclose hosting, storage and other non-API costs. No new spending is authorized by this document.

The business aims to reach 60 product tests per month. Document realistic capacity and costs; do not promise commercial winners or treat that goal as a requirement to run 60 paid tests during development.

## Acceptance and handoff

Agree representative products, platforms, access and acceptance checks before kickoff. The demonstration must cover:

- Research that produces a product decision and a usable creative brief.
- Finished image and video ads and a functioning store or product-page workflow.
- Shopify product, variant and collection creation plus a bulk update on the agreed representative catalog, with errors and retry behavior shown.
- Verified pixel/conversion events for a test purchase, correct product/value data and browser/server deduplication.
- A visual summary of scraped products, their landing pages and competitor ads, linked to the actual sources.
- A controlled campaign test on the agreed platform, with results returned to the correct ad, offer and page records.
- A subsequent change based on those results, with the earlier version retained.
- Safe retries, account separation, spend limits and an agent or provider replacement without losing history.

Supply the source, database migrations, deployment instructions, tests and documentation. Use authorized test or development accounts where appropriate, and distinguish test-mode proof from live account activity. Do not label a blocked integration complete.

## Methodology and privacy

The repository is methodology reference only. Agent definitions, code snippets, schemas and historical examples explain methods; they are not supplied working software or promised development savings.

Use the [research guide](methodologies/research-to-production.md), [course-derived methods](methodologies/course-derived-product-research.md) and [creative references](methodologies/before-after-ai-ugc.md) where useful. They do not prescribe the implementation. The present scope supersedes older wording that made every supplier, logistics and back-office function mandatory.

Keep private products, account records, customer and supplier information, credentials and applicant conversations out of this public repository. Preserve attribution for reference material.
