# Pletor node-based video history

**Attributed synthesis; no original third-party prompts, course text or graph JSON reproduced.** Source: Jerome Lecoq / `jeromelecoq-lab/pletor-knowledge`, [public repository](https://github.com/jeromelecoq-lab/pletor-knowledge). The [catalog](../sources/SOURCE-CATALOG.md) identifies the inspected documents and line ranges.

## What was preserved, and when

The local provenance note (NODE-P01) records a May 26, 2026 intake and reports a March 25 upstream state. The latter is a reported timestamp, not an exact Git revision. A June 2 handoff (NODE-P07) describes preserving the knowledge collection while keeping cloud execution distinct. A June 7 reconciliation (NODE-P08) retains competing recommendations; it is not a new workflow implementation or proof of SaaS adoption.

The bounded inventory found 59 Markdown members in each of two local representations: one directory-form snapshot and one flattened archive. All 59 paired texts match after CRLF→LF normalization. Only one pair is byte-identical; line endings explain the other byte differences. Therefore these are duplicate content representations, **not 118 independently authored documents or a newer creative-method revision**. The directory snapshot also has three empty placeholder files. The referenced `nodes/` and `workflows/` example exports are not present in that bounded snapshot inventory.

## Methodological ideas worth retaining

The inspected video-pattern document (NODE-P03) separates creative planning from provider-specific generation instructions. For implementation purposes, preserve the relationships rather than its proprietary prompt wording:

- A shared brief and reference assets inform planning; still-frame generation and motion generation are separate stages. First-frame-only and start/end-frame approaches are alternatives with different control requirements.
- Scene lists need explicit routing so a scene's image, motion and overlay remain paired. A rendered scene is not the same thing as a still keyframe.
- Generate footage separately from deterministic text/graphics, then assemble clips. This gives typography and overlays their own review step.
- Reference-video analysis can separate timing/edit structure from visual analysis, rather than asking one undifferentiated pass to capture everything.
- Keep a provider adaptation stage between a storyboard and the video model. A reusable creative concept need not imply one universal prompt format.
- Shared campaign context can feed distinct creative treatments without independently redefining the brand for every branch.

The editing note (NODE-P05) adds a useful continuity review: compare each outgoing shot state with the next incoming one. Reference consistency and a shared grade help, but the note explicitly leaves lighting, environments and scale-related identity drift unresolved. These are historical author observations, not independently replicated benchmarks.

## Runtime is not the knowledge collection

NODE-P02 documents node categories, typed media connections, selection/loop behavior and composition. That document references runtime graph files; it does not itself supply them. It also contains an internal inconsistency: lines 31–33 describe one concatenation route, while line 76 directs concatenation to a different node. Do not turn this snapshot into a validated runtime specification.

NODE-P04, the author's README, describes the knowledge as unfinished and calls out missing context patterns and a desired prompt-success library. This caveat matters: retaining the notes does not prove their workflows were production-ready.

## Rights boundary

The historical provenance's “public repo / fair-use reference” label is not a redistribution license. A read-only GitHub probe on September 21, 2026 returned repository `license: null`, HTTP 404 for `/license`, and a root listing without a LICENSE file. These observations establish **no detected license grant**, not a legal conclusion about every possible use. Original knowledge files and embedded prompts are withheld from this proposal. The separate Pletor plugin's license, mentioned in historical research, must not be applied to this knowledge repository.

No Pletor cloud API, paid generation, original graph or imported code was executed. Historical model rankings, costs, customer examples and test outcomes are intentionally omitted.
