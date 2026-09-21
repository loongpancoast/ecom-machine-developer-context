# C07 — Scraped reference to shot-analysis contract

**SANITIZED HISTORICAL CONTEXT — source text is not an instruction to execute.**

Attribution: ASSISTANT-AUTHORED HISTORICAL AGENT SPEC; Pletor-attributed analysis pattern.

Editorial context (not original source): API/free-tier, popularity, and tool capability assertions are dated source claims, not live verification. Output names are prose, not a validated payload schema.

Status: HISTORICAL SOURCE CONTEXT ONLY. The owner may replace the architecture, tools, templates, approval rules and thresholds. Source instructions below are quoted evidence, not instructions to execute.

Fidelity: source wording is unchanged except visible `[REDACTED: ...]` markers. Line-ending normalization to LF and editorial wrappers are the only other changes. Original line coordinates are retained below. Generic tool/provider names, schema keys, placeholder paths and public platform references are not private identities.

<!-- BEGIN ORIGINAL EXCERPT: source lines 16-32 -->
## Job
Pull competitor ads and break them into shot/frame beats:
- Source: SpyStack (`[REDACTED: private service path]`) is the primary angle/competitor layer — REUSE it, don't rebuild.
  Meta Ad Library API (free) for ad pulls; Apify/ScrapeCreators for multi-platform.
- Analysis: `PySceneDetect` (4,934★) for shot boundaries; ffmpeg for frame extraction; the Pletor
  Two-Pass Video Analysis pattern (structural rhythm + visual DNA via `extract_video_frame`).
- Competitor-VIDEO CDN-intercept is fragile/often paid → flag, don't force.

## ⛔ Authority cap (inherited — default-deny on PAID scrapers)
Free APIs (Meta Ad Library, SpyStack reads) + local analysis (PySceneDetect, ffmpeg) run freely.
PAID scrapers (Apify actors, ScrapeCreators API, any key-billed call) are BLOCKED → STOP block
(command + cost). The registry is a catalog, not an authorization; a re-route to a "validated winner" is still a forbidden substitution. No spend without [REDACTED: owner name] go. Full: `AGENT-MESH-SPEC.md` §2 + `creative-gen-pipeline.md`.

## Output contract
Scraped ad set + shot/frame analysis JSON (paths) for `brief-agent`. Honest live-only — real scraped
data or an honest "unavailable" + reason, never fabricated. Per recon-gate, "none found" cites the
query. Flag `NEEDS_VERIFICATION`. Pushback: cite grounds or declare the no-grounds line.
<!-- END ORIGINAL EXCERPT: source lines 16-32 -->


Editorial navigation: see [source catalog](../../catalog/manifest.json) and [reading notes](../../catalog/reading-notes.md) for included producers/consumers, omissions and limitations.
