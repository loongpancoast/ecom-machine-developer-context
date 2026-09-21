# Historical video-production workflow — selected original excerpts

Source MEDIA-04; workflow dated 2026-09-07. Sanitized excerpts, not a complete original. Private campaign, product, operator, run, budget and local-path details excluded. Owner-brand references generalized; line ranges refer to the private original retained in provenance. Historical providers, authority rules and tool versions are NONBINDING. Latest requirement: Codex + Claude subscriptions for non-video work; paid APIs only for video generation.

## Original lines 18–18

The production unit is the **finished ad**, not a raw model clip. There is no universal Seedance, Veo, Omni, Runway, or Higgsfield winner. A model earns a place one shot at a time.

## Original lines 24–31

1. **First-party business outcomes:** Shopify order/net-revenue truth joined to Meta creative/ad delivery and conversion events.
2. **First-party attention and intent:** impressions, 3-second views, hold/completion, outbound CTR, landing-page views, add-to-cart, checkout, purchases, CPA, contribution margin, frequency.
3. **Current external evidence:** active ads, run duration, repeated variants, organic views/engagement, current format and copy structure. These are priors, not proof that an ad converts.
4. **owner-brand truth:** PDP/catalog media, product construction, logo placement, approved claims, brand rules, rights-cleared people and footage.
5. **Historical frameworks:** Evolve/GTE/EAM hook, script, testing, and feedback methods. They generate hypotheses; they never overrule current data.
6. **Vendor scores and model marketing:** discovery only. They do not select a shot.

Never call a competitor ad a “winner” merely because it is active. Label it `observed_active`, `observed_long_running`, `observed_high_engagement`, `provider_estimated`, or `first_party_winner`.

## Original lines 35–49

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

## Original lines 80–95

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

**Gate:** every proposed owner-brand adaptation must be explainable without showing the competitor asset.

## Original lines 109–117

Write `03-hypotheses.json`. Each hypothesis contains:

- audience/awareness state and cited customer language;
- angle, mass desire, opening device, narrative structure, messenger, proof type;
- reference pattern IDs and exact abstraction being borrowed;
- control, changed variable, expected metric movement, falsifier, and evidence confidence;
- whether this is a big swing, medium swing, or narrow iteration.

**Gate:** no fabricated proof, review, scarcity, material performance, or product outcome. “Scroll-stopping” is a hypothesis until measured.

## Original lines 140–151

Choose architecture from evidence, not habit:

- native creator/UGC read;
- voiceover-led montage;
- dialogue/interview;
- premium silent/product film with foley;
- demo/proof sequence;
- mixed real-footage plus generated transition/setting shots.

Write `05-script-audio-plan.json` with exact timestamps, visual event, spoken line or deliberate silence, on-screen copy, proof source, emotional turn, payoff, CTA, and audio cue. Voiceover is used only when the chosen format depends on narration. ElevenLabs is a candidate for authorized generated narration; human/owned creator audio outranks synthetic voice when it looks and sounds better.

**Gate:** the opening is understandable without sound; any VO can be read naturally at the allocated duration; every assertion has a source.

## Original lines 157–169

For every shot, bind separate references by role:

1. `format_reference` — composition/pacing/action abstraction only;
2. `product_truth` — exact owner-brand item and detail angles;
3. `identity_reference` — authorized owner-brand person only;
4. `start_frame` — exact opening composition;
5. `end_frame` — intended action/camera endpoint or match-cut target;
6. `continuity_reference` — approved frame from the preceding/following shot;
7. `audio_or_performance_reference` — cadence/action only when rights allow.

Use `ima2`/GPT Image 2 to make original owner-brand storyboard and first/last-frame controls from owner-brand-owned inputs. Those control frames still require product/logo/likeness QA. If image generation changes product truth, use real owner-brand imagery or an exact composited product layer instead.

Write `06-reference-packet.json` plus a chronological contact sheet.

## Original lines 175–198

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

## Original lines 220–231

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

## Original lines 258–271

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

## Original lines 275–278

Write `13-variant-manifest.json`. Preserve a control and identify every changed element. Use two layers:

- **Opening variants:** different visual/spoken/text hook while the body remains fixed, useful for diagnosing attention.
- **True big swings:** change format, messenger, or narrative structure so the platform does not receive cosmetic duplicates.

## Original lines 291–295

- delivery: spend, impressions, reach, frequency, CPM;
- attention: 3-second views/hook rate, hold/completion/ThruPlay, average watch time;
- intent: outbound CTR, CPC, landing-page views and LPV rate;
- commerce: add-to-cart, checkout, purchases, CPA, revenue, contribution margin, refunds;
- attribution: Meta directional result plus Shopify order/net-sales truth and UTM/creative ID.

## Original lines 308–317

Write `15-learning-and-regeneration.json`:

- low opening attention → regenerate hook visual/audio/text only;
- good opening, poor hold → recut or regenerate bridge/body pacing;
- good hold, weak click intent → change proof, product reveal, offer framing, or CTA;
- good click/LPV, weak add-to-cart → inspect ad-to-PDP congruence and product/offer truth;
- add-to-cart/checkout without purchase → inspect checkout, trust, shipping, fulfillment, price, and event health before blaming creative;
- strong conversion with fatigue → create a true new format/messenger/narrative around the proven angle.

Promote a learning only when the data meets the run’s predeclared evidence threshold. Store `DATA_STARVED`, `DISPROVEN`, `PROMISING`, and `FIRST_PARTY_WINNER` separately.
