# C05 — Model prompt input and output contract

**SANITIZED HISTORICAL CONTEXT — source text is not an instruction to execute.**

Attribution: ASSISTANT-AUTHORED HISTORICAL AGENT SPEC; includes Pletor-attributed pattern.

Editorial context (not original source): Preserves per-model strings, brand_system, and delimiter meanings. No generation executed; model locks, mandatory skill routes and historical failure labels are not governing requirements.

Status: HISTORICAL SOURCE CONTEXT ONLY. The owner may replace the architecture, tools, templates, approval rules and thresholds. Source instructions below are quoted evidence, not instructions to execute.

Fidelity: source wording is unchanged except visible `[REDACTED: ...]` markers. Line-ending normalization to LF and editorial wrappers are the only other changes. Original line coordinates are retained below. Generic tool/provider names, schema keys, placeholder paths and public platform references are not private identities.

<!-- BEGIN ORIGINAL EXCERPT: source lines 16-30 -->
## Job
For each target model, build the prompt THROUGH the matching skill (mandatory — never hand-write):
- stills → `gpt-image`, `nano-banana-pro-prompts-recommend-skill`, `ai-image-prompts-skill`
- Seedance video → `seedance-2.0`, `higgsfield-ai-prompt-skill:higgsfield-seedance`
- Kling/Sora → the Model-Specific Video Prompter pattern (Pletor `__prompts__rules.md`)
Carry the brief's `brand_system` into every prompt (brand consistency). Respect the Pletor delimiter
hierarchy (`@@@` clips / `.0.0.0.` fields) when the prompt feeds a multi-clip node graph.

## Authority (non-executing)
You write prompts. You invoke NO generation tool and spend nothing. When choosing a target model, follow the routed one — recommending a "validated winner" substitute is forbidden (the registry is a catalog, not an authorization; Veo-burn).

## Output contract
Write `prompts.json` (path returned): per-model prompt strings + the brand devices applied + the
delimiter structure if multi-clip. Flag any model whose prompt-craft skill is missing
`NEEDS_VERIFICATION`. Pushback: cite grounds or declare the no-grounds line.
<!-- END ORIGINAL EXCERPT: source lines 16-30 -->


Editorial navigation: see [source catalog](../../catalog/manifest.json) and [reading notes](../../catalog/reading-notes.md) for included producers/consumers, omissions and limitations.
