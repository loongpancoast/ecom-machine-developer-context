# IN06 — Creative/store/media-buying handoff and Meta draft payload

**SANITIZED HISTORICAL CONTEXT — no fresh live capability test.**

**Editorial context (not source wording):** July draft-only employee design, not current mandated approval architecture. The requirements permit a new implementation and autonomous operation. Catalog availability, disabled persona status and historical dashboard tests are separate. This excerpt does not prove Meta OAuth scopes, write execution or creative-to-order attribution. Private branch/path references are removed; key names remain.

These are source-worded excerpts, not a fresh capability test or a new architecture requirement. Marked redactions replace selected text; omitted ranges are not silently joined. Source IDs and line ranges resolve in the [catalog](../../catalog/manifest.json).

## Original excerpt — S09:L17–L39

## Handoff graph (compact structured state, never full threads)

```text
demand (venture coordinator / dashboard intent / [REDACTED:OWNER])
  │
  ├─ store/LP work ──────────► commerce__store-builder
  │                              consumes: BUILD-BRIEF json
  │                              produces: BUILD-RESULT json (routes verified, offer stack, copy blocks)
  │                              creative assets needed? ──► job brief → ads__creative-producer
  │
  ├─ creative work ──────────► ads__creative-producer
  │                              consumes: job brief json (product, identity_lock, angle, platforms, budget_state)
  │                              produces: handoff.json + copy-matrix.md + asset-manifest.json
  │                              (status: drafted | blocked_paid | delivered)
  │                              │
  │                              ▼ assets + copy matrix
  └─ launch work ────────────► meta__media-buyer
                                 consumes: intent packet json (objective, account_id, account_status, connector_status, brief_ref)
                                 produces: PAUSED_DRAFT_ONLY campaign draft json + structural_check + readback packet
                                 │
                                 ▼ HARD-STOP: [REDACTED:OWNER] approves/rejects (dashboard approval center — reject path live-proven 2026-07-09)
                                 ▼ post-launch: revenue__readback-verifier (holds by default; JOIN vs store truth — R5)
```

## Original excerpt — S10:L99–L102

| Reading live account/campaign/insights state | Meta Marketing API direct read **or** session-wired Meta Ads MCP `ads_get_ad_accounts` / `ads_get_ad_entities` / `ads_insights_performance_trend` | Direct read = RELIABLE (used live twice), but ALWAYS cross-validate conversion counts against store truth (R5). MCP = GATED: reconcile + probe first (R8). |
| Checking an account before a kill/DELETE | read `account_status` (MCP `ads_get_ad_accounts` or Graph read) | DELETE is BROKEN when `account_status≠1` (R3) — probe before attempting. |
| A paused-draft WRITE (campaign/ad/creative create) | draft artifact (`06-campaign-build-draft.json`) → HARD-STOP → on approval, `ads_create_campaign` / `ads_create_ad` / `ads_create_creative` **or** the Graph curl generator | Draft generation is RELIABLE; the live POST path is UNTESTED and env-gated (`DRIVEON_APPROVE_META_PAUSED_DRAFT_WRITE` [REDACTED:CONFIG_VALUE] + `META_ACCESS_TOKEN` / `META_AD_ACCOUNT_ID`) — never assume the write works until that flag is observed flipped. |
| Ad preview before approval | MCP `ads_get_ad_preview` (read-only) | Read path; safe pre-approval to show [REDACTED:OWNER] the rendered ad. |

## Original excerpt — S10:L125–L147

## Lean-context handoff contract (compact structured state, never full threads)

This employee consumes and produces **small JSON-ish blocks**, not conversation transcripts. It never re-reads a whole thread; it reads the last packet and the memory index.

**Consumes** (from the dashboard / orchestrator):
```json
{ "intent_id": "...", "objective": "validate_offer_or_conversion_fix",
  "brand": "...", "account_id": "act_...", "account_status": "<probe-result|UNKNOWN>",
  "connector_status": {"meta_mcp":"gated|reconciled","token":"live|401|UNKNOWN"},
  "brief_ref": "raw/inbox/.../00-request.md" }
```

**Produces** (draft-only; every field groundable or `[REDACTED:OWNER_CONFIRMATION_LITERAL]`):
```json
{ "status": "PAUSED_DRAFT_ONLY", "external_writes_performed": false,
  "campaign": {"name":"...","objective":"...","structure":"..."},
  "adset": {"status":"PAUSED","budget":"[REDACTED:OWNER_CONFIRMATION_LITERAL]","audience":"[REDACTED:OWNER_CONFIRMATION_LITERAL]","optimization_event":"[REDACTED:OWNER_CONFIRMATION_LITERAL]","bid_strategy":"...","placements":"..."},
  "creative_brief": {"angle":"...","hook":"...","proof_needed":"real source evidence only","cta":"[REDACTED:OWNER_CONFIRMATION_LITERAL]"},
  "structural_check": {"cpp":"...","aov":"...","ratio":"...","verdict":"viable|structural-fail|UNKNOWN"},
  "approval_required_before": ["oauth","external_write","publish_send_spend"],
  "next_action": "<one action>", "approval_needed": true,
  "evidence": ["<file paths or connector receipt IDs>"] }
```
