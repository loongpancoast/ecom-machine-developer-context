# Methodology reference notes

[Requirements](../REQUIREMENTS.md) defines the intended application. This repository is methodology reference only, not a software handoff. Historical architecture, tool choices, stage labels, approval rules and budgets are context, not requirements. Supplier/3PL references describe secondary work, not mandatory integrations for this delivery.

Use [SOURCES.md](SOURCES.md) to browse files and [manifest.json](manifest.json) to resolve IDs, classifications and hashes. U IDs identify requirement summaries; H IDs identify historical-intent summaries. Older aliases resolve to the appropriate included summary, source excerpt or derived explanation. A derived explanation does not make an unavailable original accessible.

The [upgrade demonstration](../methodologies/agent-led-execution.md#upgrade-demonstration) defines how to prove adaptability. Historical references are methods, not additional acceptance requirements.

## Methods

| References | Useful content | Limits |
|---|---|---|
| C04, C05, C09 | Brief and brand system → model prompts → graph/reference wiring | Prose contracts, not validated JSON payloads or runnable graphs. Pletor-attributed patterns and named dependencies require separate evaluation. |
| C07, C06, C08 | Reference-ad analysis → video plan → edit/export | A plan is not a finished video. Historical provider availability and free-tier claims need confirmation. |
| C13, C10, C11 | Research → script → performance feedback | Fixed counts, copy order and numbered stages are replaceable. Diagnostic tables suggest hypotheses, not causal proof. C13 omits its original Step 7; C07 is a separate reference-analysis method. |
| C12 | Supplier selection, negotiation, samples and diligence | Partial method, not a purchasing/order-routing integration. Supplier-tier, response-speed and cultural generalizations are not universal rules. |
| C14 | Evidence, generation, editing and learning relationships | Historical specified workflow, not a live implementation. Fixed timing and approval language are not binding. |
| C15 | Test actual output before expanding architecture | Historical lesson, not an instruction to resume an old experiment. |
| C17 | Sourcing fields and downstream catalog meaning | Documentary redactions change numeric types; not executable data. Repeated placeholders do not imply equal values. Marketplace defaults illustrate one sourcing route; they do not add supplier-integration requirements to the current scope. |

Reference-ad transcripts, customer language, production scripts and rendered-output transcripts serve different purposes. Preserve their source and version relationships; do not turn customer research into fabricated testimonials or competitor claims into product facts.

## Research OS reference code

Files are under `reference-implementations/research-os/files/`. Paths beginning `files/` inside `field-map.json` are relative to `reference-implementations/research-os/`.

- **DLC01 — SQL:** PostgreSQL reference schema, not deployed. Requires `pgcrypto` and CREATE privileges. No row-level security, role grants or automatic update-timestamp triggers are supplied. Nullable unique keys may not deduplicate missing IDs. The conversion view detects metric presence, not profitability.
- **DLC02–DLC09 — CSV:** headers only. SQL, CSV and JavaScript shapes differ; implement explicit validation, splitting and joins rather than positional imports.
- **DLC10 — brief compiler:** Node.js ESM using `node:crypto`. Produces Markdown, not ads or pages. It selects `products[0]` without filtering other arrays; supply a product-scoped snapshot. Display limits truncate evidence. Validate URLs and retain the full evidence elsewhere. Status strings are caller-supplied; JSON property ordering affects its hash.
- **DLC11 — connector contract:** not standalone: `../engine.mjs` is absent. The validator does not execute tests, and receipt construction does not perform readback. Its key-name redactor is incomplete and misses free text, URLs and several pass-through fields. Do not use it as a privacy boundary.
- **DLC12–DLC14 — variables, video brief and continuity:** historical excerpts. State management, quote-bank verification, image archetypes and related prompt files are not bundled. An image brief is not a finished image; a fixed duration is not a production requirement.
- **DLC15 — field map:** derived mapping of actual headers, SQL definitions and JavaScript accesses. Not an import adapter or runtime test.

The blank asset manifest is a template. The revenue-readback schema does not define all creative/order/experiment joins. The edit-lineage field map describes relationships without providing a real edit run.

## Integrations and commercial operations

The [integration index](../sources/integrations/index.md) covers auth names, response shapes and implementation gaps. Source IDs Sxx in those excerpts use the namespace IN-Sxx in the main catalog.

Historical broker setup, identity checks and schema comparisons do not prove current account access or full runtime functionality. Support, retention, fulfillment and bookkeeping references contain methods and partial handoffs, not a complete helpdesk, refund, 3PL or general-ledger implementation.

## Attribution and rights

Some methods are course-derived or attributed to third parties. Preserve attribution and resolve applicable licensing restrictions before broader reuse. This repository is public. Historical references do not grant redistribution rights to underlying courses, prompt libraries or media. Examples and redacted schemas are documentation, not evidence of successful business outcomes.
