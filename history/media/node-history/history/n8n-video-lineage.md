# n8n video history — separate workflow families

This is attributed synthesis, except the separately attributed [internal-method summary](../sources/NODE-N01-n8n-pattern-summary.md). It is not an executable workflow. The [source catalog](../sources/SOURCE-CATALOG.md) resolves each evidence ID.

## Historical layers

- **April 11, 2026 internal note (NODE-N01):** n8n handles event/schedule triggers and HTTP routing; a model handles reasoning. Error paths should alert and retain a durable failure record. The note is explicitly inferred, so its deployment statements are not promoted as verified results.
- **April 23, 2026 internal research synthesis (NODE-N07):** locate an existing template, validate it, and test the configured workflow before treating it as complete. This is a proposed build discipline, not evidence that a video workflow ran.
- **May 7, 2026 migration metadata on third-party template READMEs (NODE-N02, NODE-N03):** two different video-related designs were retained. This date establishes archival intake, not original authorship or creation time. Their containing archive name must not be used to infer an earlier execution date.

## The actual JSON artifacts located

| Family | Artifact / evidence | Inspected structure | Meaning and disposition |
|---|---|---|---|
| Chase AI, UGC Machine | `ugcMachine.json` / NODE-N04 | 13 nodes; webhook, Airtable, Gemini analysis, LLM prompting and structured output | Reference-video analysis and prompt preparation. Its node inventory does not establish a video-rendering step. Withheld: third-party prompt bodies, pinned examples and credential references; no redistribution grant established. |
| Loopsera, product-photo video generator | `47_AI Ads Sora.json` / NODE-N05 | 11 nodes; form input, Drive storage, image analysis, creative direction, subworkflow call, download, final storage and Baserow | Parent pipeline for product image → creative instructions → generated video → asset metadata. Withheld: third-party content and integration-specific identifiers; no redistribution grant established. |
| Loopsera, generation subworkflow | `kie sora 2 image to video test.json` / NODE-N06 | 5 nodes; subworkflow trigger, HTTP submit/query, wait and switch | Async provider-job orchestration, distinct from the parent creative workflow. Withheld: third-party content, pinned examples and credential references. |

These are three separate artifact byte versions, not three successful productions and not three versions of one workflow. Their READMEs attribute the first family to Chase AI and the second to Loopsera. No original graph was copied into this public proposal. JSON node counts are structural observations only; embedded code, expression correctness and provider contracts were not executed or runtime-validated.

## Useful contracts for a developer

| Input meaning | Producer → consumer | Action / output | Review feedback |
|---|---|---|---|
| A reference video the operator has rights to use | Media intake → video analysis → prompt preparation | Describe the reference, then produce new creative instructions (NODE-N02/N04). | Check duration, scene coherence and independent creative expression; an analysis is not proof of advertising performance. |
| A product photo, aspect ratio and description | Form → storage → image analysis → creative direction | Pass structured product context and video instructions into the generator subworkflow (NODE-N03/N05). | Review product fidelity and output legibility before delivery. |
| A generation request and later provider job status | Parent workflow → submit/query/wait/switch | Wait for completion, then deliver the generated asset reference (NODE-N06). | Proposed implementation check: bound polling, surface failure and avoid duplicate paid submits. These safeguards were not proven in the historical artifact. |

The source READMEs' quality, speed, pricing and conversion claims are not reproduced as measured results. Retain only the input/output and asynchronous-job lessons above. Do not import these old automations as the proposed implementation; use agent-selected tools with current verified contracts.
