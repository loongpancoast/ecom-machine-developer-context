# Reference implementation limits

All artifacts are historical references, not a deployable application. Nothing was imported into n8n, no model was called and no reference script was executed. JSON parsing and Python syntax parsing are packaging checks only. See [source identities](sources/media-source-catalog.json).

## MEDIA-01 — first-party Business OS n8n export

[WF-CREATIVE-01.json](implementations/business-os/WF-CREATIVE-01.json) was authored for the July 2026 Business OS pack. The source version note (MEDIA-11) pins **n8n 1.71.0** and explicitly says live import, credential binding, activation and rollback were not demonstrated. The pin is provenance, not a recommendation to deploy that old release.

Actual node sequence: Webhook Trigger → Verify Signature → Set Correlation ID → Deduplicate → Generate Asset → QA Review → Action Gateway → Asset Pack Recorded / Dead Letter Route. Preserved `active:false`. Host placeholders were changed to reserved `example.invalid` domains. Credential names contain environment-variable names, not keys or account IDs. No provider integration exists behind the placeholders.

Important static-review limitations:
- `Generate Asset` is a generic HTTP call, not a working video adapter, model choice, shot loop, polling/downloader or editor.
- The source's `Set` node and HTTP result handling need execution-version testing to confirm payload retention. `QA Review` explicitly returns a new object without `correlationId`; the next node still expects that field. This is a real contract gap, not corrected silently in this historical export.
- HMAC verification assumes the request body is the exact signed bytes. Validate body type, signature encoding, missing secret handling and crypto availability. Code-node credential labels are not secret bindings by themselves.
- Correlation IDs need mandatory validation. The static-data dedup map has no expiry/bound and needs durable/concurrent replay semantics verified; its presence does not prove queue-safe idempotency.
- QA trusts provider-returned booleans. It does not perform visual or rights review. The `hasClaims` output is assigned `asset.hasClaims === false`, an inverted/ambiguous field meaning that the adapter must resolve.
- The explicit dead-letter route is attached to Action Gateway, not all earlier failures; full retry/error coverage is absent.
- Hashing an absent base64 value can hash an empty buffer. Validate actual output bytes and media before accepting an artifact.
- Its historical paid `CREATIVE_MODEL_KEY` pattern is **not** the current cost architecture. Route non-video work through permitted Codex/Claude subscription capabilities; only video generation may use a paid API.

## MEDIA-02 / MEDIA-03 — two distinct owned image batch templates

[batch_generate.py](implementations/ima2/batch_generate.py) and [generate_image_batch.py](implementations/ima2/generate_image_batch.py) come from two Hermes skills, both declaring `version: 1.0.0`, `author: Hermes Agent`, `license: MIT` (MEDIA-10 and MEDIA-09). They are **sibling variants**, not proven chronological v1/v2 releases.

Both invoke the real ima2 Node entry, generate sequentially, skip existing files, record receipts and reject newly created outputs below a minimum size. The first resolves the ima2 installation dynamically, has an empty shot list and stores a truncated hash. The second originally hardcoded a machine-local installation path, has generic placeholder shot prompts and creates its output directory at module import. Packaging neutralizes output paths and replaces the hardcoded installation path with APPDATA/home lookup. It does not retrofit new execution behavior.

Limitations: existing files are skipped without revalidation; file size is not an image decode or quality check; process metadata/logs can contain sensitive input and must not be publicly exported; receipts use host-local paths; counts include existing PNGs; the first template's hash is truncated, not a full SHA-256. Neither script enforces the stricter explicit model/provider/effort flags described by the later expanded skill. Configure prompt input, installation, authenticated subscription access and actual parameters, and add validation before operational use. Never run the placeholder prompts as a production brief.

## MEDIA-12–14 — actual ComfyUI graph inventory, bodies withheld

The installed ComfyUI skill declares version **5.1.0**, authors **kshitijk4poor, alt-glitch, purzbeats**, license **MIT**. Its graph bodies are not included pending complete attribution/license-notice review. Do not describe this as a no-license discovery or as owned code.

- `wan_video_t2v.json`: nine `class_type` nodes. Text/negative CLIP encoders + UNET/CLIP/VAE loaders + empty video latent → KSampler → VAEDecode → `VHS_VideoCombine`. The actual model token is `wan2.1_t2v_1.3B_fp16.safetensors`; 33 frames at 832×480 and a 16-fps combine setting. This is a generic animal-scene template, not evidence of an ecommerce production run.
- `sd15_txt2img.json`: seven `class_type` nodes. Checkpoint + empty latent + positive/negative text → sampler → VAE decode → save image. Uses a generic landscape prompt and SD1.5 model filename.
- The available workflow directory also names SDXL text-to-image, img2img, inpaint, Flux Dev, 4× upscale and AnimateDiff. Those remaining bodies were only filename-inventoried, not full-reviewed or licensed for public export here.
- README lists a Wan2.2 filename while the actual inspected graph uses Wan2.1. Preserve that discrepancy; do not silently normalize it.

No ComfyUI server/model availability, custom-node installation, runtime compatibility, memory requirement or successful render is asserted by this audit. The `_comment` metadata keys may need removal before raw API submission, depending on the runner. A generic workflow installed with a skill is not a recovered prior business attempt.
