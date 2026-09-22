# Research → copy → page → next experiment

> **Current status — 2026-09-22:** This field map supports the [full approved system](../../sources/owner-requirements-summary.json), not a brief-only or partial-build acceptance. Connect research, economics and offers to finished original ads, complete Shopify stores/catalog operations, live campaigns and verified purchase tracking, then sourcing/fulfillment, returns, support, retention and reconciled profitability. Review actual decoded media and rendered/functional storefronts against references and iterate from measured results. **60 live product tests per month** is mandatory operational/final acceptance; changing historical variant counts below cannot replace it. Preserve evidence and asset/result lineage when replacing models, providers, skills, stages or whole workflows.

This is an original analytical field map, not a transcript, course prompt, tested software schema or record of a successful campaign. It summarizes selected historical Evolve, GTE and EAM learning and connects it to the included project-local source contracts. Field names below are **proposed normalized fields** unless expressly called original. No customer quotations or actual product records are included.

Source IDs resolve in [source-index.json](source-index.json). HCS IDs are **summary-only**: their private originals are deliberately not publicly accessible. Attribution: Evolve course-derived agent adaptations (HCS01–HCS08); GTE / Anthony Camacho workshop synthesis (HCS09); EAM / Zakaria Module 5 synthesis (HCS10). The workshop synthesis credits Evaldo Albuquerque's *The 16-Word Sales Letter* and Eugene Schwartz's *Breakthrough Advertising*. This package does not redistribute those works or certify their course claims.

## 1. What to collect and what each source can establish

For every capture preserve `source_id`, `source_type`, `source_url`, `provider`, `query`, `captured_at`, `observed_period`, `market`, `language`, `raw_artifact_ref`, `access_status` and `limitations`. Keep the underlying bytes privately with an integrity hash. An empty API response is an access/result condition, not proof that market demand is absent. Use only permitted collection routes; minimize personal data and retain the right to use any quoted evidence separately from permission to access it. HCA02, HCA03, HCA10.

| Source / capture | Fields to retain | Cross-reference before deciding | Decision supported | Downstream consumer |
|---|---|---|---|---|
| Product page, manufacturer specification, authorized product documentation | model/variant, materials, dimensions, features, stated mechanism, stated limitations, price and currency, stock date | Match exact variant against supplier quote, sample/QA findings and owned product facts | Which factual claims and variants can be offered | Product truth record; creative brief; PDP; support answers |
| TikTok Shop product intelligence, historically Kalodata; current equivalent if suitable | product identity, category, unit price, estimated units/revenue, window, trend direction, estimate flag | Match product identity against listing and supplier; compare another demand source and seasonality | Candidate worth a feasibility review, not a guaranteed winner | Candidate queue and economics screen |
| Meta Ad Library / TikTok Creative Center and permitted ad-intelligence provider | advertiser/domain, ad identifier, observed first/last dates, active flag, placement, format, hook, primary text, CTA, destination URL, creative reference | Resolve same-name advertisers to domains; join destination page to offer and product; separate repeated creatives from unique concepts | Competitor angle and creative pattern worth investigating | Competitor matrix, angle hypotheses, reference analysis |
| Competitor landing/product pages | headline, problem framing, mechanism claim, price/currency, bundle tiers, shipping terms, guarantee, proof type, FAQ, page/funnel type | Compare to the ad that sends traffic there; compare promises with customer complaints and owned evidence | Where ad-page continuity or differentiation is possible | Offer brief, message hierarchy, landing-page variant |
| Similarweb or analogous traffic estimate | domain, traffic estimate, period, geography, model/provider and uncertainty | Cross-check product price/AOV assumptions and observed store breadth; do not mix domain traffic with single-product demand | Plausibility scenario only | Research memo, not a revenue fact |
| Amazon or other permitted review source | item/variant, review date, rating, quoted text if authorized, theme, context, provenance; omit reviewer identity when unnecessary | Separate positive/negative themes, shared syndicated reviews, variant mismatch, repeat wording; compare independent forums and own support data | Desired outcome, objection, failure mode and product weakness | Voice-of-customer bank and QA questions |
| Reddit/forum discussions | thread/permalink, date, situation, desired outcome, attempted alternative, failure reason, objection, quoted language if authorized | Check thread relevance and independence; join phrases to the specific problem/segment rather than treating all comments as buyers | Concrete situations and language to test | Segment cards, objections, hooks |
| YouTube/TikTok/Instagram content and permitted comments | original content ID, date, topic, observed view/engagement counts and window, transcript provenance, creator vs commenter distinction, format, hook, recurring question | Distinguish organic entertainment from purchase behavior; connect the exact comment to its video context | Demonstration style, topic or unanswered question | Reference brief and research backlog |
| Search results, Google Trends, question tools | query, locale, date/window, ranked result URL, relative trend vs absolute volume distinction, related questions | Compare seasonality and market geography; reconcile question intent with reviews and competitor FAQs | What customers investigate before buying | FAQ map, educational hooks, SEO/page brief |
| Supplier quotations and quality evidence | exact variant, unit cost/currency, MOQ, lead time, shipping destination/method, packaging, customization, compliance-document availability, sample/QA status | Join to actual offered variant, landed costs, current selling price and fulfillment constraints | Feasible test/fulfillment route or evidence hold | Purchasing, economics, storefront delivery promises |
| Own store/ad/support results | creative/page/offer versions, spend, impressions, video definitions, clicks, sessions, carts, orders, refunds, return reasons, attribution window | Reconcile ad metrics to commerce and costs; compare equivalent time windows; inspect tracking and stock/fulfillment failures | Next experiment, offer repair, supplier issue or scaling candidate | Hypothesis log, revised brief and operations |

The historical collection breadth comes from HCS02–HCS03. Supplier and post-purchase requirements are explicit in HCA02. HCS02's revenue formula and ad-longevity shortcut are assumptions, not validated commercial evidence; see [corrections](lineage-and-lessons.md).

## 2. Cross-reference records, not disconnected summaries

Use stable joins across versions; do not join solely by display name. The application should preserve the following relationships. This is a derived schema proposal, not an assertion that the old workflows implemented these joins.

| Record | Minimum fields | Producer → consumer |
|---|---|---|
| `product_fact` | `product_id`, `variant_id`, `fact_id`, `claim_text`, `evidence_ids[]`, `valid_as_of`, `status: observed/inferred/unknown`, `claim_limits` | Product/supplier research → brief, page and support |
| `customer_language` | `language_id`, `source_id`, `exact_text_or_authorized_excerpt`, `context`, `theme`, `sentiment`, `segment_hypothesis_id`, `independent_source_group`, `permitted_use` | Review/forum analysis → segment and copywriter |
| `desire_objection` | `theme_id`, `desired_outcome`, `objection`, `failed_alternative`, `failure_reason`, `evidence_ids[]`, `frequency_denominator`, `inference_flag` | Research synthesis → angle selection |
| `competitor_offer` | `competitor_id`, `domain`, `product_match_confidence`, `ad_ids[]`, `page_capture_id`, `price`, `currency`, `bundle`, `guarantee`, `claimed_mechanism`, `proof_type` | Ad/page capture → gap analysis and offer design |
| `angle_hypothesis` | `angle_id`, `segment_id`, `desire_id`, `objection_ids[]`, `awareness_hypothesis`, `sophistication_hypothesis`, `mechanism_fact_ids[]`, `evidence_ids[]`, `counterevidence_ids[]`, `expected_response` | Research analyst → brief writer |
| `creative_brief` | `brief_id`, `version`, `source_packet_id`, `angle_id`, `product_fact_ids[]`, `voice`, `offer_version`, `claim_limits`, `proof_assets[]`, `success_measure` | Strategist → copywriter and production |
| `copy_variant` | `copy_id`, `version`, `brief_id`, `hook`, `body`, `CTA`, `claim_citations[]`, `platform`, `placement`, `character_counts`, `page_variant_id` | Writer → reviewer, creative production and campaign |
| `experiment` | `experiment_id`, `hypothesis_id`, `control_ids[]`, `variant_ids[]`, `changed_dimension`, `metric_definition`, `time_window`, `stop_condition`, `result_evidence_ids[]`, `decision`, `next_hypothesis_id` | Campaign setup/results → next research and creative batch |

Count recurrence with a disclosed denominator. Repeated captures of one review are not independent corroboration. Do not infer precise demographics, health attributes or a person's identity from sparse text; segment hypotheses describe situations, not invented individuals. Customer research is not permission to fabricate a testimonial or attribute a competitor's result to a new product. HCS03–HCS05, HCA03, HCA10.

## 3. How research becomes copy

1. **Choose the audience situation and desired outcome.** Link it to authorized customer-language evidence and failed alternatives. Keep the buyer and user distinct where relevant. Evolve adaptations emphasize sub-segments and desires; EAM adds awareness and market saturation as separate dimensions. HCS04, HCS10.
2. **Identify a specific objection or existing belief.** Compare negative comments, reviews and forum alternatives with competitor promises. The GTE workshop frames copy around a belief change; use this as a research question, not permission to claim the product is the only solution. HCS09.
3. **Separate the actual mechanism from the positioning hypothesis.** A novel explanation is not scientific proof. State what the product physically does, what evidence supports the outcome, what remains unknown, and which wording is off-limits. HCA02–HCA03; HCS11.
4. **Create a testable angle.** Record segment, desire, objection, hook approach, evidence and counterevidence. Distinguish an evidence-led hypothesis, a competitor-inspired adaptation and a broad exploration batch. Preserve the original source-ad relationship without copying its protected expression. HCS05.
5. **Produce connected copy assets.** Script hooks and body share the same audience/angle; the landing-page headline, proof and offer must continue that promise. The Evolve writer separates hook, connective section and body, with visual instructions; its page writer continues the angle through mechanism, proof, offer, FAQ and CTA. These are summarized functions, not reproduced templates. HCS06–HCS07.
6. **Preserve citations while editing for voice.** The included July [quote-bank contracts](originals/2026-07-research-brief-quote-contracts.md) retain original keys: `evidence[].quote_id`, `source_endpoint`, `raw_value`, `meaning`; `angles[].evidence_quote_ids`; `citations[].claim` and `quote_id`; and `kill_gate.from_packet`. Carry the packet's decision through the brief instead of silently recalculating it in copy. HCA06.
7. **Review the actual surface.** Character counts are placement-specific and must be checked against current platform documentation, not frozen old limits. Storefront edits need exact-string matching, structural preservation and JSON parsing, including section defaults/presets, empty states and alt text. HCS14–HCS16; HCA04–HCA05.

A product may support several angles; a single asset should have a coherent message. Historical fixed word counts, prompt order, numbers of variants, score bands and all-or-nothing stage gates are not application requirements. The developer may replace the architecture while retaining the semantic relationships.

## 4. Feedback must change the next action

HCS08's feedback analyst connects observed attention/click/purchase behavior to the next creative batch. Treat its diagnostic table as competing hypotheses, not causal certainty:

| Observation | Investigate first | A bounded next test |
|---|---|---|
| Weak initial video attention | Opening/frame relevance, audience and placement; confirm metric definition | Hold offer/body/page constant and vary the hook |
| Good opening, weak later retention | Message continuity, demonstration and proof timing | Change the middle section with the same opening |
| Engagement without purchases | Entertainment-versus-buying intent, page mismatch, checkout, stock, price and tracking | Test the most evidenced friction, not automatically louder copy |
| Clicks but weak conversion | Ad-page promise match, proof, delivery terms, offer and checkout | One named page/offer change against a stable control |
| Little/no delivery | Account approval, budget, auction eligibility, targeting and measurement | Verify delivery first; do not declare the audience/angle rejected |
| A promising result | Exact angle, segment, hook, format, proof, offer and economics version | Preserve a control, vary one dimension, and record uncertainty |

Record `observation → alternative explanations → changed variable → expected metric movement → evidence window → result → next decision`. Feed refund/support themes back to supplier quality and product facts, not only into stronger persuasion. HCA02–HCA03.

## 5. Honest completion states

`Captured` means source artifacts exist; `normalized` means claims resolve to evidence; `briefed` means downstream fields are supplied; `drafted` means copy exists; `rendered` means an actual asset exists; `published` requires platform readback; `commercially validated` requires reconciled results. A dashboard artifact, role definition, routing plan or promising competitor signal does not substitute for any later state.
