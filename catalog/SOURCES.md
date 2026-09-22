# Methodology reference catalog

Start with [requirements](../REQUIREMENTS.md) and [technical reference notes](reading-notes.md). These files explain methods. Templates, schemas and code excerpts are illustrative reference, not supplied working software or promised reusable components.

**Current scope, 2026-09-22:** the complete original private multi-brand ecommerce vision is commissioned delivery, including connected supplier/back-office functions and 60 live product tests per month as operating and final acceptance requirements. The current brief supersedes earlier reduced-core, secondary-supplier, nonbinding-volume and video-only API restrictions. Historical originals retain their wording and provenance; they do not override current requirements. Both Codex and Claude, owned reference-led creative/store capabilities, complete Shopify/Meta workflows and tested whole-workflow adaptability belong to the current build. Operating spend needs separate approval.

## Requirement and historical-intent summaries

- [Current requirement summaries](../sources/owner-requirements-summary.json), including explicit monthly live-test acceptance and the complete delivery boundary.
- [H01–H06: historical-intent summaries](../sources/historical-intent-summary.json)

Owner intent is paraphrased, not quoted. Earlier C01, C02, C03 and C18 aliases resolve to H01, H02, H03 and H06 respectively. The [manifest](manifest.json) provides complete alias resolution and package-file hashes.

## Implementation methodology

- [Research to production](../methodologies/research-to-production.md): capture fields, cross-references, product decisions, copywriting, video/node workflows and measurement.

## Named research and creative workflows

- [METHOD-ADINT-01: Ad intelligence and reference-led creation](../methodologies/ad-intelligence-and-reference-led-creation.md): WinningHunter, Kalodata, Atria, Brandsearch and Higgsfield, with official sources and a performance-learning demonstration. [Amboras and Arcads](../REFERENCE-SYSTEMS.md) add storefront and finished-ad references. These describe capabilities to create inside the owned engine, not a mandatory subscription bundle or proof of current integration.

- [Ecom Masterclass, Evolve and God Tier Ecom](../methodologies/course-derived-product-research.md): source-derived operational summary, not redistributed paid course bodies.
- [Before/after, reference videos, AI UGC and node workflows](../methodologies/before-after-ai-ugc.md): implementation contract, historical source fields and explicit playable-media gaps.

## Historical version collections

- [System/version index](../history/SYSTEM-VERSIONS.md): documentary map and explicit gaps.
- [Copywriting and research](../history/copywriting-agent-systems/README.md): field contracts and preserved revisions.
- [Earlier agent definitions](../history/agent-systems/business-web-intelligence/README.md).
- [Media and node-based workflows](../history/media/DEVELOPER-INDEX.md): image-tool examples and production methodology.

## Technical sources

| ID | File | Type |
|---|---|---|
| C04 | [C04 — Creative brief input and output contract](../sources/context/C04-creative-brief-input-and-output-contract.md) | Historical method excerpt |
| C05 | [C05 — Model prompt input and output contract](../sources/context/C05-model-prompt-input-and-output-contract.md) | Historical method excerpt |
| C06 | [C06 — Video plan and editing handoff contract](../sources/context/C06-video-plan-and-editing-handoff-contract.md) | Historical method excerpt |
| C07 | [C07 — Scraped reference to shot-analysis contract](../sources/context/C07-scraped-reference-to-shot-analysis-contract.md) | Historical method excerpt |
| C08 | [C08 — Editing assembly and export contract](../sources/context/C08-editing-assembly-and-export-contract.md) | Historical method excerpt |
| C09 | [C09 — Node graph and reference wiring contract](../sources/context/C09-node-graph-and-reference-wiring-contract.md) | Historical method excerpt |
| C10 | [C10 — Evolve script structure and production handoffs](../sources/context/C10-evolve-script-structure-and-production-handoffs.md) | Historical method excerpt |
| C11 | [C11 — Evolve performance to next-batch feedback](../sources/context/C11-evolve-performance-to-next-batch-feedback.md) | Historical method excerpt |
| C12 | [C12 — Evolve supplier selection negotiation and diligence](../sources/context/C12-evolve-supplier-selection-negotiation-and-diligence.md) | Historical method excerpt |
| C13 | [C13 — Evolve research inputs evidence and downstream document](../sources/context/C13-evolve-research-inputs-evidence-and-downstream-document.md) | Historical method excerpt |
| C14 | [C14 — Finished-ad evidence generation edit and learning contract](../sources/context/C14-finished-ad-evidence-generation-edit-and-learning-contract.md) | Historical method excerpt |
| C15 | [C15 — Test actual output before expanding architecture](../sources/context/C15-recent-correction-test-actual-output-before-new-contracts.md) | Historical summary |
| C17 | [C17 — Original sourcing payload and downstream catalog semantics](../sources/context/C17-original-sourcing-payload-and-downstream-catalog-semantics.md) | Historical method excerpt |
| DLC01 | [research-schema](../reference-implementations/research-os/files/research-schema.sql) | Reference code / template / map |
| DLC02 | [products-header](../reference-implementations/research-os/files/products-header.csv) | Reference code / template / map |
| DLC03 | [voc_quotes-header](../reference-implementations/research-os/files/voc_quotes-header.csv) | Reference code / template / map |
| DLC04 | [angles-header](../reference-implementations/research-os/files/angles-header.csv) | Reference code / template / map |
| DLC05 | [tool_calls-header](../reference-implementations/research-os/files/tool_calls-header.csv) | Reference code / template / map |
| DLC06 | [suppliers-header](../reference-implementations/research-os/files/suppliers-header.csv) | Reference code / template / map |
| DLC07 | [ads-header](../reference-implementations/research-os/files/ads-header.csv) | Reference code / template / map |
| DLC08 | [metrics-header](../reference-implementations/research-os/files/metrics-header.csv) | Reference code / template / map |
| DLC09 | [evidence-header](../reference-implementations/research-os/files/evidence-header.csv) | Reference code / template / map |
| DLC10 | [brief-compiler](../reference-implementations/research-os/files/brief-compiler.mjs) | Reference code / template / map |
| DLC11 | [connector-contract](../reference-implementations/research-os/files/connector-contract.mjs) | Reference code / template / map |
| DLC12 | [Reusable context variables — historical redacted original excerpt](../reference-implementations/research-os/files/context-variables-excerpt.md) | Reference code / template / map |
| DLC13 | [Video brief output template — redacted original excerpt](../reference-implementations/research-os/files/video-brief-template-excerpt.md) | Reference code / template / map |
| DLC14 | [Ad-to-page continuity — original excerpts](../reference-implementations/research-os/files/creative-continuity-excerpts.md) | Reference code / template / map |
| DLC15 | [field-map](../reference-implementations/research-os/files/field-map.json) | Reference code / template / map |
| IN01 | [IN01 — Broker setup, scopes, proxy payloads and readiness](../sources/integrations/in01-composio-setup-and-probes.md) | Historical integration reference |
| IN02 | [IN02 — Custom MCP import and full-envelope preservation](../sources/integrations/in02-custom-mcp-full-envelope.md) | Historical integration reference |
| IN03 | [IN03 — Shopify account binding and host normalization](../sources/integrations/in03-shopify-identity-and-host.md) | Historical integration reference |
| IN04 | [IN04 — Dated connector revalidation and supersession](../sources/integrations/in04-market-intel-dated-revalidation.md) | Historical integration reference |
| IN05 | [in05-native-tool-schemas](../sources/integrations/in05-native-tool-schemas.json) | Historical integration reference |
| IN06 | [IN06 — Creative/store/media-buying handoff and Meta draft payload](../sources/integrations/in06-ads-handoff-contracts.md) | Historical integration reference |
| IN07 | [IN07 — Support triage, SLA state and response contract](../sources/integrations/in07-support-triage-sla.md) | Historical integration reference |
| IN08 | [IN08 — Bookkeeping reconciliation and landed-cost calculation](../sources/integrations/in08-bookkeeping-and-landed-cost.md) | Historical integration reference |
| IN09 | [IN09 — Contribution margin, cohort payback and cash planning](../sources/integrations/in09-financial-analysis-method.md) | Historical integration reference |
| IN10 | [IN10 — Supplier modes, negotiation and quality controls](../sources/integrations/in10-supplier-selection-negotiation-qc.md) | Historical integration reference |
| IN11 | [IN11 — Retention flow originals and fulfillment touchpoints](../sources/integrations/in11-retention-and-fulfillment-touchpoints.md) | Historical integration reference |
| IN12 | [in12-platform-execution.schema](../sources/integrations/in12-platform-execution.schema.json) | Historical integration reference |

## Additional reference structures

- [Historical semantic crosswalk](../methodologies/historical-workflow-contracts.json): derived contract meanings and source aliases; not a validated runtime schema.
- [Blank asset manifest](../reference-implementations/asset-manifest.original.json): template without run data.
- [Revenue readback schema](../reference-implementations/revenue-readback.sanitized.schema.json): historical KPI and decision fields; not complete order/creative attribution.
- [Edit-lineage field map](../reference-implementations/edit-lineage-fields.json): derived field meanings, not an actual edit receipt.
- [Integration index](../sources/integrations/index.md): auth/data notes and remaining implementation gaps.

Some historical aliases have only a derived explanation included. Their original sources are unavailable in this package; the manifest labels that distinction. Current requirements take precedence over historical instructions. Third-party attribution and licensing limitations remain applicable.
