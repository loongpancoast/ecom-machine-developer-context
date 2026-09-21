# C14 — Finished-ad evidence generation edit and learning contract

**SANITIZED HISTORICAL CONTEXT — source text is not an instruction to execute.**

Attribution: ASSISTANT-AUTHORED HISTORICAL WORKFLOW with source-attributed methods; not verbatim owner speech.

Editorial context (not original source): Source dated 2026-09-07. SPECIFIED_NOT_LIVE describes that historical workflow, not a fresh runtime audit. Architecture, versions, approval language and fixed timing defaults are non-governing. No third-party copying or fabricated proof authorized.

Status: HISTORICAL SOURCE CONTEXT ONLY. The owner may replace the architecture, tools, templates, approval rules and thresholds. Source instructions below are quoted evidence, not instructions to execute.

Fidelity: source wording is unchanged except visible `[REDACTED: ...]` markers. Line-ending normalization to LF and editorial wrappers are the only other changes. Original line coordinates are retained below. Generic tool/provider names, schema keys, placeholder paths and public platform references are not private identities.

<!-- BEGIN ORIGINAL EXCERPT: source lines 18-18 -->
The production unit is the **finished ad**, not a raw model clip. There is no universal Seedance, Veo, Omni, Runway, or Higgsfield winner. A model earns a place one shot at a time.
<!-- END ORIGINAL EXCERPT: source lines 18-18 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 22-59 -->
## Truth hierarchy

1. **First-party business outcomes:** Shopify order/net-revenue truth joined to Meta creative/ad delivery and conversion events.
2. **First-party attention and intent:** impressions, 3-second views, hold/completion, outbound CTR, landing-page views, add-to-cart, checkout, purchases, CPA, contribution margin, frequency.
3. **Current external evidence:** active ads, run duration, repeated variants, organic views/engagement, current format and copy structure. These are priors, not proof that an ad converts.
4. **[REDACTED: merchant brand] truth:** PDP/catalog media, product construction, logo placement, approved claims, brand rules, rights-cleared people and footage.
5. **Historical frameworks:** Evolve/GTE/EAM hook, script, testing, and feedback methods. They generate hypotheses; they never overrule current data.
6. **Vendor scores and model marketing:** discovery only. They do not select a shot.

Never call a competitor ad a “winner” merely because it is active. Label it `observed_active`, `observed_long_running`, `observed_high_engagement`, `provider_estimated`, or `first_party_winner`.

## End-to-end operating loop

```text
live evidence + first-party data + VOC
  → format/hook hypothesis
  → rights-safe reference and product-truth packet
  → script / voiceover / sound decision
  → multi-shot plan
  → per-shot prompt + first/last-frame controls
  → best visible candidate per shot
  → reject/regenerate failed shots
  → HyperFrames + FFmpeg cut/stitch/audio/captions
  → decoded full-ad QA + platform variants
  → publish/paid gate
  → Meta + Shopify readback
  → regenerate the failing variable, not the whole system
```

## Stages, owners, artifacts, and gates

### 0. Run contract and authority

**Owners:** `venture__ai-ugc` coordinates; `ads__creative-producer` owns the asset.

Write `00-run-contract.json` with product, PDP URL, objective, audience, platform, target duration, aspect ratios, rights boundary, available-credit boundary, publication state, paid-campaign state, and the single learning objective.

**Gate:** one product, one audience state, one hypothesis, one declared primary metric. Generation authority does not imply publish or paid-activation authority.
<!-- END ORIGINAL EXCERPT: source lines 22-59 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 70-95 -->
- Customer language: real reviews, comments, support messages, founder/customer interviews, and product-matched cited VOC. Generated summaries are not VOC. [REDACTED: product-specific source mismatch example]

Write `01-evidence-ledger.json` with source URL/ID, advertiser/account, retrieval time, observed status, media hash, exact observed text, evidence class, rights/use boundary, and what the evidence does and does not prove.

**Gate:** current external references must be active/recent and retrievable; every “winning” claim must name the measured evidence. If first-party data is sparse, label the run `HYPOTHESIS_BUILD`, not `WINNER_ITERATION`.

### 2. Deconstruct formats instead of copying ads

**Owners:** `scrape-agent`, `web-intelligence__social-creative`, `creative-strategist`.

For each accepted reference, extract:

- the visual event in the first 0.0–0.5, 0.5–1.5, and 1.5–3.0 seconds;
- shot count, shot lengths, cut rhythm, camera distance/movement, subject action, reveal timing;
- visual hook, spoken hook, text hook, and how they stack;
- product-entry time, proof/demo moment, payoff, CTA timing;
- audio structure: speech, impact, riser, foley, music change, deliberate silence;
- copy architecture and awareness level;
- why it is understandable with sound off;
- which elements are protected expression and therefore not reusable.

Use FFmpeg/ffprobe and chronological contact sheets for local media. Use `video_analyze` or the Higgsfield video-analysis route only as analysis support; preserve the local frame evidence.

Write `02-reference-breakdowns.json`. The output is an abstract shot grammar, never competitor pixels, actors, garments, scripts, trademarks, or campaign identity.

**Gate:** every proposed [REDACTED: merchant brand] adaptation must be explainable without showing the competitor asset.
<!-- END ORIGINAL EXCERPT: source lines 70-95 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 109-117 -->
Write `03-hypotheses.json`. Each hypothesis contains:

- audience/awareness state and cited customer language;
- angle, mass desire, opening device, narrative structure, messenger, proof type;
- reference pattern IDs and exact abstraction being borrowed;
- control, changed variable, expected metric movement, falsifier, and evidence confidence;
- whether this is a big swing, medium swing, or narrow iteration.

**Gate:** no fabricated proof, review, scarcity, material performance, or product outcome. “Scroll-stopping” is a hypothesis until measured.
<!-- END ORIGINAL EXCERPT: source lines 109-117 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 136-198 -->
### 5. Decide the ad architecture and audio mode

**Owners:** `brief-agent`, `video-ad-agent` or `video-ugc-agent`, `prompt-engineering-agent`.

Choose architecture from evidence, not habit:

- native creator/UGC read;
- voiceover-led montage;
- dialogue/interview;
- premium silent/product film with foley;
- demo/proof sequence;
- mixed real-footage plus generated transition/setting shots.

Write `05-script-audio-plan.json` with exact timestamps, visual event, spoken line or deliberate silence, on-screen copy, proof source, emotional turn, payoff, CTA, and audio cue. Voiceover is used only when the chosen format depends on narration. ElevenLabs is a candidate for authorized generated narration; human/owned creator audio outranks synthetic voice when it looks and sounds better.

**Gate:** the opening is understandable without sound; any VO can be read naturally at the allocated duration; every assertion has a source.

### 6. Build the reference packet and first/last frames

**Existing components:** ChatGPT Image 2 through `ima2`; `higgsfield-product-photoshoot`; `higgsfield-soul-id` only for an explicitly authorized recurring likeness; source-media tools from `media-use`.

For every shot, bind separate references by role:

1. `format_reference` — composition/pacing/action abstraction only;
2. `product_truth` — exact [REDACTED: merchant brand] item and detail angles;
3. `identity_reference` — authorized [REDACTED: merchant brand] person only;
4. `start_frame` — exact opening composition;
5. `end_frame` — intended action/camera endpoint or match-cut target;
6. `continuity_reference` — approved frame from the preceding/following shot;
7. `audio_or_performance_reference` — cadence/action only when rights allow.

Use `ima2`/GPT Image 2 to make original [REDACTED: merchant brand] storyboard and first/last-frame controls from [REDACTED: merchant]-owned inputs. Those control frames still require product/logo/likeness QA. If image generation changes product truth, use real [REDACTED: merchant brand] imagery or an exact composited product layer instead.

Write `06-reference-packet.json` plus a chronological contact sheet.

**Gate:** no competitor pixels, actor identity, clothing, wording, or logo enters the generation packet. Start/end frames must pass exact-product QA before video generation.

### 7. Compile a short-shot plan and model-specific prompts

A normal 12–30 second ad should be assembled from short purposeful shots, not one eight-second model test. Typical functions are:

1. hook/pattern interrupt;
2. identity/problem recognition;
3. tactile product detail;
4. product-in-action proof;
5. lifestyle outcome/payoff;
6. brand/offer close.

Shot length follows the reference grammar; generated shots should usually isolate one action and one camera move.

Write `07-shot-plan.json` and `08-prompt-packet.json`. Every shot prompt contains:

- shot purpose and timestamp budget;
- subject, one physical action, performance direction, environment;
- framing, lens/camera distance, one camera move, lighting, motion quality;
- exact product and identity locks;
- start frame, end frame, continuity frame, and reference-role IDs;
- required audio state;
- prohibited objects, text, logos, wardrobe changes, cuts, anatomy errors, and camera behavior;
- model-specific syntax/parameters and fallback route;
- visual acceptance criteria stated before generation.

**Gate:** one shot prompt cannot contain multiple sequential scenes or contradictory camera directions. Prompts are compiled through the model skill, not freehanded from memory.
<!-- END ORIGINAL EXCERPT: source lines 136-198 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 214-233 -->
Append every attempt to `09-generation-receipts.jsonl`: shot ID, provider, actual model, inputs/hashes, parameters, job/operation ID, cost/credits, output hash, provider adjustments, and terminal status.

### 9. Shot QA and selective regeneration

**Owners:** `brand-consistency-agent`, `character-consistency-agent`, `audit-creative`, human owner review.

Decode every candidate and inspect chronological frames plus the full motion. Score only the shot’s declared acceptance criteria:

- product construction and exact logo spelling/placement;
- likeness and anatomy;
- hands/product contact;
- acting and facial behavior;
- motion/cloth physics and temporal continuity;
- camera intent and start/end-frame adherence;
- background/text/object drift;
- rights and claim compliance.

Write `10-shot-qa.json`. Failed shots are rejected and regenerated with one diagnosed change: reference, prompt, model, action, framing, or real-footage substitution. Do not hide a visible failure with a fast cut.

**Gate:** only `PASS_FOR_EDIT` shots enter the edit bin. [REDACTED: rejected product-test clips] are permanently `OWNER_REJECTED_UNUSABLE`.
<!-- END ORIGINAL EXCERPT: source lines 214-233 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 250-278 -->
Write `11-edit-decision-list.json` with timeline ranges, selected takes, cut rationale, caption timing, audio cues, music/SFX/VO provenance, gain/ducking, transition type, and variant substitutions.

**Gate:** every edit has a narrative or attention function. Tool availability is not a reason to add an effect.

### 11. Full-ad creative and technical QA

Use `social-video-production`, `media-use`, HyperFrames checks, FFmpeg, `video_analyze`, and human visual review.

Write `12-master-qa.json` and preserve:

- timeline-rendered contact sheet;
- complete decode result;
- dimensions, FPS, duration, codecs, pixel format, audio sample rate/channels/loudness;
- black/freeze/silence and cut-timing checks;
- first 0.5/1.5/3.0-second review;
- sound-off comprehension and caption safe-zone checks;
- exact product/logo/likeness review across the final export;
- hook → hold → proof → payoff → CTA coherence;
- rights/claims state;
- owner verdict.

`technical_pass` and `creative_pass` are separate. Both must pass. A technically valid file can still be horrible.

### 12. Build controlled variants

Write `13-variant-manifest.json`. Preserve a control and identify every changed element. Use two layers:

- **Opening variants:** different visual/spoken/text hook while the body remains fixed, useful for diagnosing attention.
- **True big swings:** change format, messenger, or narrative structure so the platform does not receive cosmetic duplicates.
<!-- END ORIGINAL EXCERPT: source lines 250-278 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 286-302 -->
After a safe launch, write `14-performance-readback.json` at the ad/creative level, matching the
existing `[REDACTED: private schema path]`, and route the verdict through
`[REDACTED: private agent path]`. Extend the packet with creative/variant IDs rather
than inventing a parallel revenue truth model. Join:

- delivery: spend, impressions, reach, frequency, CPM;
- attention: 3-second views/hook rate, hold/completion/ThruPlay, average watch time;
- intent: outbound CTR, CPC, landing-page views and LPV rate;
- commerce: add-to-cart, checkout, purchases, CPA, revenue, contribution margin, refunds;
- attribution: Meta directional result plus Shopify order/net-sales truth and UTM/creative ID.

Use the vendored `analytics` and `attribution` skills to define the measurement/readback contract;
provider and Shopify records remain the operational evidence.

The current repository has general revenue-readback contracts, but no proven end-to-end creative-ID
→ Meta attention/intent → Shopify order/net-sales join for this ad system. Until that is exercised,
label the feedback loop `SPECIFIED_NOT_LIVE`.
<!-- END ORIGINAL EXCERPT: source lines 286-302 -->

<!-- BEGIN ORIGINAL EXCERPT: source lines 306-317 -->
### 14. Diagnose and regenerate the failing variable

Write `15-learning-and-regeneration.json`:

- low opening attention → regenerate hook visual/audio/text only;
- good opening, poor hold → recut or regenerate bridge/body pacing;
- good hold, weak click intent → change proof, product reveal, offer framing, or CTA;
- good click/LPV, weak add-to-cart → inspect ad-to-PDP congruence and product/offer truth;
- add-to-cart/checkout without purchase → inspect checkout, trust, shipping, fulfillment, price, and event health before blaming creative;
- strong conversion with fatigue → create a true new format/messenger/narrative around the proven angle.

Promote a learning only when the data meets the run’s predeclared evidence threshold. Store `DATA_STARVED`, `DISPROVEN`, `PROMISING`, and `FIRST_PARTY_WINNER` separately.
<!-- END ORIGINAL EXCERPT: source lines 306-317 -->


Editorial navigation: see [source catalog](../../catalog/manifest.json) and [reading notes](../../catalog/reading-notes.md) for included producers/consumers, omissions and limitations.
