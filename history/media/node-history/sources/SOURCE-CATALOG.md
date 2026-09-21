# Source catalog — bounded evidence, not redistributed originals

Paths in this document are relative to this `sources/` directory. The package root is its parent. Source IDs resolve to the representations below. Original local paths and original SHA256 fingerprints are intentionally private and are not required to read this proposal.

**Resolution labels:** `EXCERPT` = labeled sanitized original included; `SYNTHESIS` = newly written attributed summary only; `STRUCTURE` = JSON structure inspected, original withheld. A summary is not an accessible original and must not be quoted as one. Dates below are document/intake labels, not independently verified creation or execution dates.

| ID | Original evidence / date | Inspected ranges or pointers | Public representation |
|---|---|---|---|
| NODE-N01 | Internal n8n Workflow Patterns, April 11, 2026; marked inferred | Entire note inspected by worker; public original omitted | SYNTHESIS: [method summary](NODE-N01-n8n-pattern-summary.md); authorship rights not independently certified |
| NODE-N02 | Chase AI, UGC Machine README; migrated May 7, 2026 | Entire README read; architecture 63–86, creator 255–258 | SYNTHESIS: [n8n history](../history/n8n-video-lineage.md); attribution [Chase AI](https://www.skool.com/chase-ai) |
| NODE-N03 | Loopsera, Sora 2 + n8n README; migrated May 7, 2026 | Entire README read; pipeline 25–81, attribution 136–148 | SYNTHESIS: [n8n history](../history/n8n-video-lineage.md); attribution [Loopsera](https://loopsera.com) |
| NODE-N04 | Third-party `ugcMachine.json`, in the Chase AI template family | `/nodes` types/count, `/connections` keys, presence of `/pinData` and node credential references; not full prompt review | STRUCTURE: [artifact summary](../node-video-evidence.json), [n8n history](../history/n8n-video-lineage.md); original withheld |
| NODE-N05 | Third-party `47_AI Ads Sora.json`, in the Loopsera template family | Same structural inspection; parent-workflow role from README | STRUCTURE: [artifact summary](../node-video-evidence.json), [n8n history](../history/n8n-video-lineage.md); original withheld |
| NODE-N06 | Third-party `kie sora 2 image to video test.json`, in the Loopsera family | Same structural inspection; HTTP/wait/switch types | STRUCTURE: [artifact summary](../node-video-evidence.json), [n8n history](../history/n8n-video-lineage.md); original withheld |
| NODE-N07 | Internal Claude Code + n8n E-Commerce Stack research synthesis, April 23, 2026 | Entire note read; 17–30 describes discover/validate/test loop | SYNTHESIS: [n8n history](../history/n8n-video-lineage.md); no runtime proof |
| NODE-P01 | Internal provenance for May 26, 2026 Pletor knowledge intake | Entire note read; source metadata 1–15, distinction 25–31, rights 133–141 | SYNTHESIS: [Pletor history](../history/pletor-node-video-methods.md) |
| NODE-P02 | Jerome Lecoq / Pletor knowledge: `platform/nodes.md` | Entire 169-line text read; runtime/example boundary 134–150; composition inconsistency 31–33 versus 76 | SYNTHESIS: [Pletor history](../history/pletor-node-video-methods.md); original withheld |
| NODE-P03 | Same upstream: `patterns/video-pipelines.md` | Entire 283-line text read; high-level workflow ideas in 6–41, 43–69, 131–146, 188–225, 227–283 | SYNTHESIS: [Pletor history](../history/pletor-node-video-methods.md); original withheld |
| NODE-P04 | Same upstream: README | Entire 23-line text read; limitations 2–10 and proposed feedback loop 12–23 | SYNTHESIS: [Pletor history](../history/pletor-node-video-methods.md); original withheld |
| NODE-P05 | Same upstream: `reference/video-editing.md` | Entire 65-line text read; continuity 7–39 and unresolved coherence 57–65 | SYNTHESIS: [Pletor history](../history/pletor-node-video-methods.md); original withheld |
| NODE-P06 | Internal Pletor research report, May 26, 2026 | Entire report read; architecture 14–52, separate plugin 66–77 | SYNTHESIS: [Pletor history](../history/pletor-node-video-methods.md); historical findings only, no current SaaS validation |
| NODE-P07 | Internal Pletor preservation handoff, June 2, 2026 | Entire handoff read; preservation/execution distinction 37–50 and supersession 186–187 | SYNTHESIS: [Pletor history](../history/pletor-node-video-methods.md); agent account, not independently verified native owner speech |
| NODE-P08 | Internal Pletor/design reconciliation, June 7, 2026 | Entire document read; proposals 71–87; unrelated business content excluded | SYNTHESIS: [Pletor history](../history/pletor-node-video-methods.md) |

## Pletor upstream attribution and license evidence

Repository: [jeromelecoq-lab/pletor-knowledge](https://github.com/jeromelecoq-lab/pletor-knowledge). The historical snapshot is preserved as a reference, not a sublicensed content library. Live read-only metadata/license/root probes on September 21, 2026 detected no license declaration. No knowledge file, proprietary prompt body, customer example, original graph or third-party course body is included here.

## Explicit exclusions and gaps

- Pletor collection: most members are fingerprinted only, not semantically read. Only the selected evidence above informs the methodology summary. Placeholder files are not prompts or workflow exports.
- n8n graphs: original JSON, system prompts, pinned data, embedded expressions/code, credentials and integration identifiers withheld. Presence of a JSON artifact does not prove it ran.
- Two byte-identical nonvideo ads/analytics workflow copies were inventoried privately and excluded from the video families.
- [Flora remains unresolved](../history/flora-evidence-gap.md). No fabricated source ID or retrospective workflow is supplied.
- No actual product tests, customer/supplier data, raw interviews, account IDs or source-environment configuration were exported.
