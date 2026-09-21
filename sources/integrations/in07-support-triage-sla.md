# IN07 — Support triage, SLA state and response contract

**SANITIZED HISTORICAL CONTEXT — no fresh live capability test.**

**Editorial context (not source wording):** Original disabled role specification: reusable intake/tier/fact-gap/SLA/draft contract, not a live helpdesk connector. Historical draft-only/human-send policy is context, not the new application autonomy requirement. No ticket write, RMA, refund execution, helpdesk vendor/auth scope or webhook contract is established.

These are source-worded excerpts, not a fresh capability test or a new architecture requirement. Marked redactions replace selected text; omitted ranges are not silently joined. Source IDs and line ranges resolve in the [catalog](../../catalog/manifest.json).

## Original excerpt — S11:L38–L46

## Triage tiers

- **Tier 1 (auto-draftable):** order status, shipping ETA, return-policy question, generic product question. Draft a reply from known store/policy state.
- **Tier 2 (needs context):** damaged item, wrong item, delayed order past SLA window, negative review needing a substantive response. Draft a reply AND flag the specific fact gap (order id, tracking number, refund eligibility) that a human must confirm before sending.
- **Tier 3 (escalate, do not draft a resolution):** legal threat, chargeback dispute, safety complaint, anything implying refund/credit/compensation amount. Draft only an acknowledgment-of-receipt reply; the resolution itself is a HARD-STOP handed to [REDACTED:OWNER].

## SLA tracking

Every inbound item gets a received timestamp and a tier-based SLA target (read from the venture's stated support policy where one exists; otherwise flag SLA-UNKNOWN rather than inventing a number). sla-tracker.json is append-only per item: id, channel, tier, received_at, sla_target, status (drafted / awaiting-human-send / sent-confirmed-by-human / escalated). The agent never marks an item "sent" — that field is only set after a human confirms the send occurred.

## Original excerpt — S11:L54–L64

## Handoff contract

**Consumes:** { intent_id, channel: ticket|dm|review|comment, venture, raw_item: text or export path }

**Produces (draft-only):** { status: "DRAFT_ONLY", tier: 1|2|3, draft_reply: text, fact_gaps: [ ], sla_target: timestamp or "SLA-UNKNOWN", escalation_required: true|false, evidence: [ probe outputs / export paths ] }

## Stop gates

- enabled: false (frontmatter). First live dispatch is a [REDACTED:OWNER] decision — no helpdesk/review-platform connector is assumed live until probed per test-dont-assume-gate.md.
- Every approval_gates category is a hard stop, not a suggestion.
- Never auto-sends a message, never posts publicly, never closes or refunds a ticket, regardless of tier.
