# Agent frontmatter profile — July

> HCA07 — Sanitized historical source excerpts. Date basis: 2026-07-05 source frontmatter. Status: documented schema profile; not executable routing.
> Historical gates, model choices, thresholds and provider preferences are optional context, not current requirements. No runtime execution is asserted.

Schema namespace and illustrative runtime location generalized. This is a documentary profile, not a compatible drop-in for the original registry. A routeable flag proves metadata only.

---

## Required frontmatter fields

```yaml
name: machine-readable-name
display_name: Human readable name
solmd_schema: generic-agent-spec-v0
description: Natural language capability summary
intents: [natural language trigger, ...]
provider_order: [official_apis_clis, exa, firecrawl, apify, browser_fallback]
approval_gates: [oauth, paid_api, browser_login, external_write, publish_send_spend, pii_upload, fact_promotion]
outputs: [artifact.md, manifest.json]
tools: [Read, Write, Edit, Grep, Glob, Bash]
```

## Dashboard-normalized fields

The dashboard exposes each agent as:

```json
{
  "slug": "web-intelligence__seo-serp",
  "display_name": "SERP / SEO Intelligence",
  "description": "...",
  "spec_path": "agents/seo-serp.md",
  "spec_schema": "generic-agent-spec-v0",
  "intents": [],
  "provider_order": [],
  "approval_gates": [],
  "outputs": [],
  "routeable": true
}
```

## Safety boundary

SolMD metadata authorizes local routing and artifact generation only. It does not authorize OAuth/login, paid credits, browser login, external writes, publishing/sending/spend, PII upload, or fact promotion.
