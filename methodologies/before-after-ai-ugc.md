# Before/after references, AI UGC and node-based video workflows

This document makes the creative workflow explicit. It combines inspected historical UGC/node-agent definitions, the archived D7 frame-pair design and the [finished-ad methodology](../history/media/VIDEO-PRODUCTION-METHODOLOGY.md). It is an implementation contract, not evidence that the archived design ran successfully.

## Distinguish three meanings of before/after

1. **Generation anchors:** a shot's designed start frame and end frame. They constrain an animation; they do not demonstrate a real product result.
2. **Reference versus our output:** the source video, analysis, abstracted structure, generated takes and final edit shown side by side for creative review. Keep reference and generated media IDs separate.
3. **A claimed customer/product transformation:** evidence of an actual outcome. Do not fabricate it with generated imagery or use a synthetic actor as a real customer testimonial. Preserve source, conditions, timing, rights and substantiation; check applicable platform restrictions.

## Reference videos are inputs, not decorative links

Capture authorized playable video or a permitted source link with media-access status, platform/ad ID, source URL, capture time, advertiser, format, metric provenance, usage rights and content hash when the bytes are available. A screenshot, transcript or ad-library HTML page is not a downloaded video. Record inaccessible media as unavailable rather than manufacturing a shot breakdown.

Analyze the actual clip: shot boundaries; start/middle/end frames; spoken and on-screen text with timestamps; opening visual/audio hook; product-entry time; A-roll/B-roll; demonstration/proof; cut rhythm; CTA; audio cues; sound-off comprehension. Cross-reference each observation to a time interval and the media hash. A transcript alone cannot establish camera movement or visual quality.

Save a comparison package: reference link/asset → timestamped breakdown → original adaptation brief → input frame pair → every generated attempt → chosen take → final export → review decision. A reviewer must be able to play the reference and final output and inspect why a failed take was rejected.

### Available reference versus missing demonstrations

The owner supplied this existing reference for the developer challenge: [YouTube reference](https://youtube.com/shorts/Um7gmblnUjg?is=AIKpCuIuaB2CTUpP). It is a reference link, not an owned asset, a measured winner, a verified before/after example or permission to copy the footage. Its visual content was not newly reviewed for this document.

No rights-cleared matched before/after demonstration video pair is bundled in this public repository. The frame-pair design and workflow are included; playable evidence remains a distinct missing deliverable. Developers must not substitute a diagram or invented sample for it. Private or third-party media requires an authorized delivery route, not a public Git upload by default.

## The before/after frame-pair workflow

1. Select a shot purpose from the original script and reference analysis. Specify one physical action, duration, framing, product facts and acceptance criteria.
2. Build the **start frame** and **end frame** with consistent authorized identity, exact product, scene geometry and lighting. Keep product-truth, identity, composition and style references typed separately.
3. Inspect both anchors before spending on video. Reject identity/product drift or an endpoint that implies an unsupported result. Use supported subscription-backed image operations, not a hidden billed image API.
4. Select a video model with verified support for the required frame controls. Store the actual parameter names and capability/version evidence; do not assume every image-to-video endpoint accepts an end frame.
5. Generate motion between the anchors with explicit action and camera instructions. Store job ID, prompt/settings, reference hashes, cost, output hash and terminal status. A fixed seed does not guarantee reproducibility across provider versions.
6. Review motion and endpoint fidelity. Regenerate the diagnosed variable rather than hiding defects with fast edits. Preserve failed attempts and the reason for rejection.
7. Pass only accepted takes to the editable timeline and full-export QA.

The archived D7 design used a `FramePair` with `shot_id`, `role`, `start_frame` and `end_frame` objects containing `prompt`, `ref_images`, `image_url`, plus `motion_prompt`, `duration_s` and `seed`. Those names describe historical source fields, not an executable adapter. It proposed reference decomposition, engineered anchors, model routing and editing; it did not prove a live before/after engine.

Implementation must preserve one set of shot boundaries when extracting frames and calculating timings. The historical decomposition pseudocode invoked different detectors in separate passes; copying it without reconciling those boundaries risks mismatched frame/shot IDs. Historical examples also contained hypothetical performance visuals; those are not product proof and are not reproduced here.

## AI UGC: creator-style delivery tied to the research

**Input:** supplier/product URL or the [research brief](course-derived-product-research.md), brand voice, product-truth media, audience/angle, supported claims, authorized identity/voice and desired format.

1. Write an original spoken hook and script from the selected customer situation and objection. Real customer language informs writing; it is not permission to assign someone else's experience to a generated person.
2. Plan A-roll and B-roll separately. A-roll carries the creator's explanation; B-roll demonstrates the product, illustrates the point or supplies legitimate proof. Choose a setting, delivery and framing that fit the message rather than an interchangeable avatar monologue.
3. Establish the authorized actor/identity reference, voice route and product reference. Store consent/license scope. Historical actor-variation counts and vendors are optional, not mandatory spend.
4. Use a supported talking-performance route or a staged generation/lip-sync route. Check pronunciation, timing, mouth motion, gaze, expression, hands and actual product interaction. Do not clone an unconsenting person's voice or likeness.
5. Generate or shoot purposeful B-roll. Where exact product fidelity cannot be maintained, use owned real footage instead of a visually similar invented product.
6. Assemble selected A-roll/B-roll, captions, sound and CTA. Preserve takes, trims, subtitle timings and the edit decision list. Audio must use allowed local/subscription/owned routes within the video-only paid-API constraint.
7. Review the entire rendered ad for natural delivery, coherent motion, product accuracy, readable captions, pacing, audio and ad-to-page consistency. Technical pass, creative pass and owner acceptance are separate.
8. Produce controlled variations tied to an actual learning question. Return first-party results to the research/angle/script stages, not merely another batch of random prompts.

## Node-based execution and inspection

Preserve an inspectable graph:

`source capture → research packet → angle/brief → script → shot breakdown → reference bindings → frame pairs / actor plan → per-shot generation → take selection → edit timeline → export → QA → measured feedback`

Every node needs an ID/type/version, input/output artifact IDs, dependency edges, prompt/settings where relevant, status, failure reason, retry history, cost and selected output. Keep alternatives on separate branches until an explicit selection node. Resume only failed/stale dependents; never silently rerun paid upstream nodes or mix outputs from different briefs.

The developer can implement this in custom code with a node inspection/editing surface. The historical recommendation to make the visual editor optional is a past architecture opinion, not a reason to erase the requested node-based workflows. Current custom-build preference and full-system scope govern.

**Actual packaged source:** [inactive nine-node n8n export](../history/media/implementations/business-os/WF-CREATIVE-01.json), [two image runners and their limitations](../history/media/IMPLEMENTATION-NOTES.md), [historical node contract](../sources/context/C09-node-graph-and-reference-wiring-contract.md), [Pletor lineage](../history/media/node-history/history/pletor-node-video-methods.md). The n8n export is a skeleton, not this complete shot-level pipeline. No executable Flora or complete D7 renderer is claimed.

## What the developer must demonstrate

Using authorized evidence, show the source product/problem → real research and cross-checks → chosen angle → reference-video breakdown → inspectable node execution → approved frame/identity inputs → actual video generation → edited playable ad → review and one corrected iteration. Retain exact inputs, prompts, versions, receipts and failures. For a before/after capability, show the anchor pair and actual resulting motion, not only two stills. Commercial success requires subsequent measured results, not a vendor score.
