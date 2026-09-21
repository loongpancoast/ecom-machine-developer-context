# Ad intelligence and reference-led creation

Public capability references checked 2026-09-21. This is a contractor brief and methodology reference, not supplied working software. Official descriptions below establish what vendors advertise or document, not the quality of a tested integration. No generation, account connection or performance test was run for this update.

## What the system should do

Find products worth testing, show the relevant ads and landing pages, explain which patterns are worth trying, then produce original ads and usable Shopify pages for our product. Return measured results to the same records so the next batch uses what was learned. Research and creative production should work together rather than become separate dashboards.

## Capability references

### WinningHunter: product and competitor discovery

The [official site](https://winninghunter.com) describes ad search, store/sales tracking, Magic AI competitor matching and product importing. Its [developer index](https://app.winninghunter.com/llms.txt) documents ad-library search, TikTok Shop discovery, Shopify store search, trends and REST/MCP access.

Use this as a reference for matching the same product across competitors, finding related creatives, tracking changes and comparing source signals. Bring the ad, product and destination page into one research view. Keep provider revenue/spend estimates separate from verified first-party results; an ad running for weeks does not prove it is profitable. The website's broad feature list is not proof that every operation is available through MCP. Verify the exact route and cost before adopting it.

### Kalodata: product, creator and content relationships

[Kalodata](https://www.kalodata.com) describes TikTok Shop research across products, shops, creators, videos and livestreams. The useful pattern is to inspect the content and creators associated with a product's reported sales trend, not choose products on view counts alone.

Its homepage says it collects public-channel information, refines it with AI, and trains/updates models daily. It also warns that transaction and ad-spend figures can differ from real values and should not be used for high-precision settlement. Those are vendor statements, not an independent model or accuracy audit.

A current [official API guide](https://www.kalodata.com/blog/kalodata/how-to-access-tiktok-shop-api-in-2026) documents ranking/detail APIs and links to [Open Center documentation](https://www.kalodata.com/open-center/docs). Earlier notes saying Kalodata has no public API are not current authority. Account entitlement, allowed use, fields, limits and prices still require verification. TikTok Shop operational APIs and Kalodata market-intelligence APIs serve different purposes.

### Atria: creative research tied to account results

[Atria](https://www.tryatria.com) describes competitor and landing-page research, review mining, creative tagging, performance-based briefs, image-ad cloning, variations and recommendations about what to improve. Raya's advertised ad-spend training corpus is a vendor claim; it does not establish that each connected customer's account fine-tunes a model.

The [official API/MCP page](https://www.tryatria.com/mcp) documents ad and brand libraries, saved boards, connected-account performance data and reference-grounded image-generation jobs. The [quickstart](https://docs.tryatria.com/docs/quick-start) provides a documented API route. Verify individual operations rather than treating the whole website as API-accessible.

The capability to reproduce is a usable connection between reference ads, creative characteristics, actual account performance and the next brief. We should be able to ask which hooks or formats worked for our product, see the supporting ads and metrics, and produce a controlled next version.

### Brandsearch: brand, ad and landing-page context

[Brandsearch](https://brandsearch.co) describes brand and product research, ad discovery, swipe files and Spectre monitoring of competitor ads and landing pages. Its Supergen presentation describes rebuilding formats around a supplied product, including hook, claim, offer and proof, through its research and creation tools. It advertises REST and MCP access.

Use this as a reference for the visual product dossier: competitor, product, ad, landing page, offer, dates and source links belong together. Ad analysis should produce a usable recreation brief, not just a summary of what is visible. Verify current Supergen availability, operation coverage, data rights and costs; a research-tool catalog or successful connection does not prove generation works.

### Higgsfield: complete creative workflows, not just model access

[Marketing Studio](https://higgsfield.ai/marketing-studio-intro) documents product import, reusable product/avatar references, templates, editable layouts and Recreate. Its [UGC guide](https://higgsfield.ai/blog/how-to-make-ai-ugc-videos) describes an Ad Reference input that rebuilds a permitted reference ad's structure around the user's product.

The [MCP guide for marketers](https://higgsfield.ai/blog/mcp-for-marketers) describes ready-made skills for marketing, UGC, faceless content, localization, motion/design and website building. It distinguishes website-building availability in Claude/CLI-style agents from the ChatGPT plugin. The [Factory skills guide](https://higgsfield.ai/blog/faceless-videos-ugc-ads-2026) explains concept/script, generation, narration, assembly and subtitle workflows. These are documented vendor workflows, not simply a dropdown of video models, and not proof of accepted output for this project.

Study and test a supported complete workflow before rebuilding its steps. It may outperform a custom chain. Keep product and identity references consistent, inspect the finished result, and use additional editing only when it improves the ad. Website generation must still be tested as a functioning Shopify page, not accepted because it produced HTML.

## How references become our ads and pages

1. Save an authorized reference with its source, date, product/audience match and reason for selection. Label whether it is a competitor signal, provider estimate or a first-party measured winner.
2. Break down the hook, script, shot rhythm, product reveal, demonstration, proof, offer and CTA. For a landing page, capture section order, imagery, offer, objections, proof, mobile behavior and purchase path. Keep the ad-to-page connection.
3. Make an explicit reference-to-output map: which elements stay as a method, what changes for our product, which facts support the claims, and which media we have permission to use. Exact recreation is appropriate for owned/licensed work; otherwise adapt the format and structure using original copy and authorized assets. Do not carry over a competitor's reviews, identity or unsubstantiated claims.
4. Use the best permitted skill, vendor workflow or custom method to create finished ads and editable Shopify pages. Keep prompts, inputs, selected/rejected generations and edit history. The system should not ask an operator to manually reassemble every provider output.
5. Show the reference and output together for review. Check visual quality, product accuracy, pacing and ad/page consistency, then test cart/checkout and conversion events. Retain a control and state what each variant changes.

These are required information and output relationships, not a fixed agent count or permanent sequence of prompts. Better models can combine stages while preserving the evidence and results.

## What learning from ad data means

Maintain an owner-controlled library of creative examples, tags, hypotheses and observed results. Tie each result to the exact product, ad, page version, audience and measurement window. Keep weak and failed tests too. Retrieve relevant evidence when preparing the next brief, update recommendations as results arrive, and retain earlier conclusions and their reasons.

Separate three different things:

- A vendor saying its models were trained on advertising data.
- Our application learning operationally through stored results, retrieval, comparisons and revised briefs.
- Actually changing model weights through fine-tuning or training.

The second is required. The third is not assumed or necessary merely because a vendor uses the word trained. If proposing training, explain the licensed dataset, target task, baseline, held-out evaluation, cost and benefit before making it part of the agreed scope. A static prompt describing a product is not a learning loop.

Do not turn correlations into causal proof. Use suitable comparison groups or controlled tests, account for tracking issues, audience, offer and time, and label insufficient evidence. A replay can demonstrate software behavior, not prove that the next ad will convert better. Retain source observations so a future model can reassess old conclusions rather than inherit them as truth.

## Demonstration and cost boundary

Use an agreed product and permitted references. Show the visual research dossier, the reference-to-output map, a finished ad and Shopify page, then a revised brief or variant informed by joined performance data. If only historical data is available, label the replay and do not invent a new live result. Preserve the same evidence library through the model/workflow replacement test in [agent-led execution](agent-led-execution.md#upgrade-demonstration).

These services are capability and output-quality references, not a requirement to buy or integrate all of them, reproduce their proprietary datasets, or add a separate SaaS-cloning project. Choose the needed capabilities within the agreed fee. Use supported integration routes and authorized data access; specify what can be automated and what still needs manual input.

An MCP connection does not make a paid API or generation free. Bundled workflows can charge separately for images, audio, research and video. The existing video-only paid-API rule still applies. Verify account-specific allowances and offer a compliant route; any exception or new subscription needs owner approval. Keep reference selection, generation services and learned records replaceable as models improve.
