# Reference implementation limits

> **Current status — 2026-09-22:** [Current owner scope](../../sources/owner-requirements-summary.json) requires a completed deployed system, not these templates as the deliverable. Prefer direct image and video APIs through owned adapters; subscription-backed historical image runners are optional implementation references, not an API spending prohibition. Verify supported access, terms, capacity, decoded output and reference-led quality. File-size checks and receipts alone cannot satisfy finished-ad acceptance. Model/provider/skill and whole-workflow replacement must preserve source context, data, assets and history with version/restore and quality/cost/speed/reliability comparison.

All artifacts are historical references, not a deployable application. Nothing was imported into n8n, no model was called and no reference script was executed. JSON parsing and Python syntax parsing are packaging checks only. See [source identities](sources/media-source-catalog.json).

## MEDIA-01 — retired static automation

The placeholder-heavy n8n export was removed from the current handoff. Its old version pins and node configuration are not implementation guidance. Only [provenance, duplicate-protection and failure-handling lessons](automation-method-lessons.md) are retained. The original is preserved in history/private evidence.

## MEDIA-02 / MEDIA-03 — two distinct owned image batch templates

[batch_generate.py](implementations/ima2/batch_generate.py) and [generate_image_batch.py](implementations/ima2/generate_image_batch.py) come from two Hermes skills, both declaring `version: 1.0.0`, `author: Hermes Agent`, `license: MIT` (MEDIA-10 and MEDIA-09). They are **sibling variants**, not proven chronological v1/v2 releases.

Both invoke the real ima2 Node entry, generate sequentially, skip existing files, record receipts and reject newly created outputs below a minimum size. The first resolves the ima2 installation dynamically, has an empty shot list and stores a truncated hash. The second originally hardcoded a machine-local installation path, has generic placeholder shot prompts and creates its output directory at module import. Packaging neutralizes output paths and replaces the hardcoded installation path with APPDATA/home lookup. It does not retrofit new execution behavior.

Limitations: existing files are skipped without revalidation; file size is not an image decode or quality check; process metadata/logs can contain sensitive input and must not be publicly exported; receipts use host-local paths; counts include existing PNGs; the first template's hash is truncated, not a full SHA-256. Neither script enforces the stricter explicit model/provider/effort flags described by the later expanded skill. Configure prompt input, installation, authenticated subscription access and actual parameters, and add validation before operational use. Never run the placeholder prompts as a production brief.

## MEDIA-12–14 — generic node patterns, not current model recipes

The inspected ComfyUI starter graphs illustrate typed dependencies: text/reference inputs, model components, generation/sampling, decoding and export. They do not establish a prior ecommerce production run. Generic prompts, old model filenames, resolutions, frame counts and installation recipes are intentionally not carried forward as guidance.

Keep the methodological separation of inputs, generation and validated outputs. Choose current providers and tool contracts through demonstrated quality and supported access. No server, model, custom-node compatibility or successful render is asserted. Source attribution remains in the catalog; third-party graph bodies are not bundled.
