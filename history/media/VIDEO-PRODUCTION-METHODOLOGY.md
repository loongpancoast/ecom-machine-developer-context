# Video production methodology — evidence to finished ad to learning

This is a **source-driven synthesis**, not a copied course, transcript or promise that the pipeline already runs. It draws primarily on the September finished-ad workflow (**MEDIA-04**, [sanitized original excerpts](sources/video-production-workflow-excerpts.md)), the historical UGC/node/editing specialists (**MEDIA-05–08**), and the historical node-workflow packet. Source identities and representations resolve in [the source catalog](sources/media-source-catalog.json).

**Current operating requirement:** Codex + Claude subscriptions are the engine for research reasoning, copy, prompts, image work and orchestration where their authenticated subscription capabilities permit. Paid API use is limited to **video generation**. Historical paid image, voice, analysis and orchestration routes below are not authorization or required architecture. Do not silently fall back to billable APIs. Verify subscription functionality and permitted automation before implementation; a subscription is not an unlimited API entitlement.

## 1. Research and scrape a reference-ad evidence packet

Collect actual retrievable ad/post media, not merely a search result or a vendor's winner score. Use authorized platform sources, existing specialist integrations or subscription-assisted research. Preserve separate source roles:

- **Reference ad:** teaches format, hook, pacing and editing. It does not substantiate this product's claims.
- **Customer language:** real cited reviews, comments or authorized support/interview evidence. A generated summary is not a quotation or a testimonial.
- **Product truth:** owned catalog media, specification, demonstration and approved claim evidence.
- **First-party results:** delivery, attention, click and commerce records. These—not competitor activity—establish performance.

A reusable collection record needs `source_id`, source URL/provider object ID, retrieval timestamp, advertiser/brand reference, observed active/run-duration/engagement signals, evidence class, media hash, exact observed text, permitted use and explicit limits. Add timestamped transcript segments with speaker/source attribution, language, confidence and media offsets. Keep third-party assets/private source records in access-controlled operational storage; the public developer repo carries the **contract**, not the evidence itself. (MEDIA-04 original 24–31, 61–95; raw private fields not exported.)

Cross-reference each record before it influences production:

| Join | Why it matters |
|---|---|
| Reference media ID ↔ transcript segment ↔ frame/shot timestamp | Prevents invented hook wording or a still being treated as evidence of motion |
| Customer quote ID ↔ audience/awareness hypothesis | Preserves whose problem and language informed the angle |
| Product/claim ID ↔ script assertion ↔ proof shot | Stops competitor claims or fabricated testimonials entering the ad |
| Reference pattern ID ↔ abstract adaptation | Distinguishes borrowed structure from copied expression |
| Ad/variant ID ↔ platform result ↔ store/order result | Makes later iteration attributable to the exact version |

## 2. Deconstruct the reference before writing

Inspect the opening at 0–0.5, 0.5–1.5 and 1.5–3 seconds, then the full sequence. Record visual/spoken/text hooks separately; shot lengths and cut rhythm; camera framing/motion; product-entry time; proof/demo; payoff; CTA; sound cues; sound-off comprehension; awareness level and copy architecture. Preserve chronological frame evidence alongside the transcript. (MEDIA-04 original 80–95.)

The result is an **abstract shot grammar**. Do not copy competitor actors, scripts, wording, logos, garments, campaign identity or protected pixels. Extract why the structure works as a hypothesis; do not call it a winner just because it is active.

## 3. Compile a brief and script tied to evidence

The brief names one audience state, objective, angle, customer-language references, product/rights constraints, format, learning objective and primary metric. Record the reference patterns being adapted, control, changed variable, predicted effect, falsifier and evidence confidence. Separate big format/messenger/narrative changes from narrow iterations. (MEDIA-04 original 109–117.)

Write a timestamped script/audio plan: `time_range`, shot purpose, visual action, spoken line or deliberate silence, on-screen copy, claim/proof source, emotional turn, payoff, CTA and audio cue. Select creator read, interview, voiceover montage, silent product film, demonstration or mixed real/generated footage based on evidence—not on the generator's default. Hook → bridge/hold → proof → payoff/CTA is a useful historical organizing principle, not a compulsory formula. Test whether the line fits the available spoken duration and whether the opening works muted. (MEDIA-04 original 140–151.)

**Historical attribution:** the internal workflow explicitly cites Evolve, GTE and EAM hook/script/testing methods and Pletor creative patterns. This packet summarizes their role through the inspected internal workflow; it does **not** reproduce their courses or claim that a complete course-transcript corpus was independently reviewed here. Their original prompt bodies are omitted for public redistribution. The owner/developer may supply licensed private course material separately.

## 4. Turn the script into shots, reference roles and a node plan

Every shot should have an ID, script-segment IDs, purpose, duration, one principal physical action, one coherent camera move, model-control requirements and acceptance criteria. Bind references by role: format abstraction, exact product, authorized identity, start frame, end frame, adjacent-shot continuity and authorized audio/performance. Product and identity locks remain separate from style references. Generate original control frames through the subscription-backed image route; use real product imagery when generation changes product truth. (MEDIA-04 original 157–198.)

The historical node-builder expected explicit nodes, edges, split/selection/composition behavior and a run boundary; its definition is not itself an executable graph. A developer's graph should preserve these relationships:

`source evidence → brief → approved script → shot plan → per-shot prompt/reference bundle → generation job → accepted take → edit timeline → export variant → measured result`

Carry `run_id`, `brief_version`, `script_version`, `shot_id`, `prompt_version`, reference-role IDs/hashes, node dependencies and output IDs across every edge. Branches may explore hook/actor/format options, but do not silently mix their inputs. Keep provider-specific delimiters and node payloads behind adapters. Pletor patterns informed historical planning; neither Pletor SaaS nor its proprietary graph syntax is a current dependency. (MEDIA-06; historical node packet.)

The stale Business OS n8n export has been removed. Its useful [method lessons](automation-method-lessons.md) survive: authenticated actions, stable correlation, duplicate protection, verified artifacts and failure recovery. Implement these beneath agent-led planning; do not rebuild the old static skeleton.

## 5. Generate a small candidate set and preserve every attempt

Choose the video route by the shot's required controls—first/last frames, identity, action, lip-sync, camera or extension—not by a blanket model ranking. Verify actual provider parameters before submission. Paid generation permission does not grant publication or campaign activation permission.

Each receipt should preserve shot ID, provider and actual model, generation operation/job ID, prompt/reference versions and hashes, parameters, estimated and actual cost/credits, output hashes, adjustments and terminal status. Failed validation, rejected jobs and produced-but-unusable clips are distinct outcomes. Never relabel a downloaded reference as a generated result. No generation was performed for this package. (MEDIA-04 original generation/QA stages; MEDIA-07 historical UGC handoff.)

## 6. Review individual shots before editing

Review chronological frames **and motion**, not just a thumbnail. Check product construction, exact marks, authorized likeness, anatomy/hands, object contact, acting, physical motion, temporal stability, frame-control adherence, background/text drift, rights and claims. Only accepted shots enter the edit bin. Diagnose one failure and change its reference, prompt, model, action or framing; substitute real footage when exact fidelity cannot be obtained. A fast cut must not disguise an unacceptable product error. (MEDIA-04 original 220–231.)

## 7. Edit into a finished ad, not a collection of model clips

Use a deterministic, editable timeline with selected take IDs, source in/out points, transitions, captions, graphics, VO/music/SFX provenance, gain/ducking, safe zones and platform variants. Each cut needs a narrative or attention purpose. Historical options include FFmpeg, HyperFrames and CapCut draft tooling; the developer can replace them. The [editing agent excerpt](sources/editing-assembly-agent-excerpt.md) preserves the actual earlier job/output contract. (MEDIA-05.)

Audio must fit the current cost boundary: owned/licensed recordings or subscription/local functionality where supported; a historical ElevenLabs recommendation does not authorize a paid non-video API. Do not fabricate testimonials or impersonate a creator.

## 8. Separate technical QA, creative QA and owner acceptance

Technical review: complete decode; dimensions/aspect ratio; duration/FPS/codecs; pixel format; audio sample rate/channels/loudness; black/freeze/silence checks; cut/caption timing; contact sheet. Creative review: opening clarity, sound-off comprehension, hook/hold/proof/payoff/CTA coherence, pacing, exact product/identity, claims and rights. Preserve independent `technical_pass`, `creative_pass` and owner decision. A valid MP4 does not prove a good ad. (MEDIA-04 original 258–271.)

## 9. Publish only through authorized operations, then read back results

Keep opening tests against a constant body distinct from true format/messenger/narrative changes. Join each deployed ad to its creative/variant, landing page, offer and product versions. Measure spend/impressions/reach/frequency/CPM; hook/hold/completion/watch time; outbound CTR/CPC/landing-page visits; cart/checkout/purchases/CPA; net revenue, margin and refunds. Reconcile platform directional attribution with first-party commerce truth. Insufficient volume is `DATA_STARVED`, not failure or victory. (MEDIA-04 original 275–278, 291–295, 308–317.)

| Observed weakness | Next diagnostic step |
|---|---|
| Opening attention | Test hook visual, text or audio |
| Attention good, hold poor | Examine bridge/body pacing and recut |
| Hold good, intent weak | Revisit proof, reveal, offer framing or CTA |
| Clicks good, cart weak | Check ad-to-page continuity and product/offer truth |
| Checkout weak | Check trust, shipping, price, fulfillment and event health before blaming the ad |
| Conversion holds, fatigue rises | Explore a genuinely new format/messenger/narrative around the supported angle |

Keep these as hypotheses, not causal diagnoses. Promote learning only against a declared evidence threshold. The inspected September source explicitly labels its full creative-ID→platform→commerce feedback join **specified, not live**. This package preserves the method and implementation inputs—not fabricated performance proof.
