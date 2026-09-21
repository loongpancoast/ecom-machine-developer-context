# Requirements

## 1. Hosted application

A private frontend, backend and operational database for one business managing multiple brands, stores and ad accounts. Include secure login, team roles, brand/account separation, media storage and background processing. The interface should support direct control as well as autonomous execution.

## 2. Research and product testing

Collect product, market, competitor and customer-language evidence. Compare demand signals, offers, creative approaches, supplier options and economics. Turn findings into product briefs and test plans. Retain sources and prior learning rather than re-creating research at every step.

Test new products while scaling successful ones. The initial monthly objective is 60 tests, 2–3 scalable winners and a majority reaching break-even through iteration. The system must accurately measure outcomes; it cannot guarantee commercial winners.

## 3. Creative production

Produce complete image ads, video/avatar ads, transcripts, scripts and briefs. Use relevant brand references to understand hooks, pacing, visual direction, objections and offers. Create original product-specific work using accurate product information and supported claims.

Preserve the relationship between reference, brief, script, prompt, generation job, selected asset and final edit. Use the best-performing production service or model for the job. Initial owner review establishes creative quality; routine production and improvement should become autonomous.

Explicitly support reference-video analysis, before/after start-and-end-frame workflows, AI UGC A-roll/B-roll and inspectable node dependencies with generation/edit lineage. Demonstrate actual playable outputs, not only stills, prompts or graph screenshots. See the [detailed creative workflow](methodologies/before-after-ai-ugc.md). Synthetic transformations are not evidence of real product outcomes.

## 4. Pages and storefronts

Build and edit landing pages, product pages and storefronts with coherent branding, strong ad-to-page continuity and functioning commerce behavior. Support products, variants, offers, pricing, cart, checkout and tracking.

Use analytics and heatmaps to diagnose friction, generate improvements and test page variants. Amboras is a relevant reference for prompt-driven storefront construction and autonomous optimization; Arcads is a reference for ad/video/avatar production.

## 5. Advertising and learning

Connect advertising accounts and commerce data. Launch and manage campaigns, track spend and join results to the exact creative, page, offer and product versions.

Use attention, click, page and purchase data to decide what to revise. Preserve experiments, decisions, unsuccessful attempts and subsequent outcomes. Allocate effort between discovery and scaling using both commercial performance and the value of learning.

## 6. Private suppliers and purchasing

Discover private suppliers, conduct outreach, negotiate, compare quotes and manage existing relationships. Record samples, quality checks, lead times, shipping terms, capacity, pricing and purchasing decisions.

Support private-supplier dropshipping for testing and bulk/private-label purchasing with warehouse or 3PL fulfillment for scaling.

## 7. Post-purchase operations

Operate order management, fulfillment, shipment exceptions, returns, refunds, support and retention. Connect these workflows to the relevant commerce, logistics, communication and accounting systems.

Feed customer issues, refund reasons and fulfillment costs back into product research, supplier selection, public messaging and economics.

## 8. Shared database and memory

Link brands, products, suppliers, sources, customer-language research, briefs, scripts, prompts, media, page versions, ads, campaigns, tests, orders, costs and decisions.

Preserve provenance, version history and the meaning of each field. Distinguish observed facts, estimates and hypotheses. Keep missing information separate from zero values. Make the history searchable by the operator, developer and authorized AI workers.

## 9. Build versus integrate

The application owns its interface, data and workflow history. External generation engines and SaaS products may provide individual capabilities when their quality, APIs, export options and economics are suitable.

Custom, agent-led development is preferred. Agents must choose tools, inspect results and revise plans rather than rely on a static n8n-style automation as the operating brain. Keep deterministic tools for reliable execution, permissions, validation, duplicate protection and rendering. Historical workflows survive only as useful methodology or supporting primitives, not a prescribed stack. See [current execution direction](methodologies/agent-led-execution.md). Existing MCPs are not a preferred stack; historical stage labels, approval processes and budgets do not override the current contract.

The fixed development fee is capped at $8,000, with the full system delivered within one month of kickoff. Definition of done is every scope area in this document working together in the deployed system, with real outputs and verified integrations. A discovery phase, MVP, partial build, placeholder workflow or dashboard alone is not acceptance. Milestones divide delivery, not scope.

Run the engine on Codex and Claude subscriptions through officially supported access. Paid API usage is limited to video generation; do not require separately billed LLM, copywriting, image-generation or other API calls. Verify actual subscription capabilities, limits and unattended-use support without bypasses. Disclose hosting, storage and other non-API operating costs before contracting. These requirements do not authorize new spend.

### Adaptability as AI improves

Build for practical longevity, not a dashboard or thin SaaS wrapper that loses its value as agentic AI advances. The owner retains source code, operational data, business context and history. Agents, models and providers must be replaceable without losing that history or rebuilding the entire system. Demonstrate how an upgrade can be evaluated and introduced safely while preserving core business operations. This is an outcome requirement, not a prescribed architecture or a guarantee that technology never changes.

## 10. Deliverables

- Deployable application source, frontend, backend and database migrations.
- Documented integrations, data contracts and background workflows.
- Working end-to-end demonstrations using appropriate development/test accounts.
- Functional, visual and operational tests; monitoring and maintainable deployment configuration.
- Clear technical documentation and handoff.

## 11. Research methodology and developer background

Implement the [research-to-production methodology](methodologies/research-to-production.md): source selection and capture fields, product matching, independent cross-checks, customer-language analysis, competitor/offer comparisons, supplier economics, product selection, copywriting, node-based video production, finished-output QA and measured improvement. Prior workflows, agents and course-derived methods are reference context; preserve attribution and distinguish historical guidance from verified results.

The named [Ecom Masterclass, Evolve and God Tier Ecom workflows](methodologies/course-derived-product-research.md) must be available as attributed methodological context, including product-first/problem-first discovery, source cross-references, desire/angle distinctions and evidence-to-creative handoffs. Course summaries are not a claim that full licensed transcripts or prompt libraries are publicly bundled.

Preferred background includes dropshipping, product research and demonstrated work on high-converting stores and ads. Applicants should show their personal contribution and measured results. Engineering delivery remains the complete system, not only the developer's strongest specialty.

## 12. Context and privacy

Requirements are assistant-written summaries, not word-for-word owner messages. Technical schemas, code and methodologies remain separate reference material. No personal data, actual tested products, private supplier identities, customer records, account credentials or private source history should be included in the handoff.

The [structured requirement summary](sources/owner-requirements-summary.json) retains stable IDs for traceability. [Reference systems](REFERENCE-SYSTEMS.md) separates product capabilities from unverified integration assumptions.
