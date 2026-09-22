# Lessons retained from retired automation

> **Current status — 2026-09-22:** Under the [approved full-system scope](../../sources/owner-requirements-summary.json), agent-led replacement is a working connected delivery requirement, not permission to stop at the plan/graph described below. Keep dependable execution controls while allowing models, providers, skills and whole workflows to be replaced, stages combined or removed, and prior versions restored without losing source context, data, history or assets. Compare actual quality, cost, speed and reliability; improved AI capabilities must be adoptable without promising literal AGI.

Status: methodology only. The inactive Business OS n8n export was removed from the current developer handoff on 2026-09-21. The original remains in Git history and the private evidence archive, not as a recommended implementation. No canonical source system was deleted.

## What is worth retaining

- Authenticate incoming commands and preserve their input provenance.
- Carry a stable run/action identity through tool calls, generation receipts and review.
- Prevent duplicate paid actions with durable idempotency and reconciliation, not an in-memory flag.
- Treat a provider job as pending until a terminal result and the actual output bytes are verified.
- Distinguish technical validation, creative review and authority to publish/spend.
- Keep failed attempts and enough context to resume or repair the affected stage.

These are dependable execution primitives underneath agents, not a fixed creative decision tree.

## What not to carry forward

The old export used placeholder endpoints, provider-supplied QA flags, incomplete error coverage and a broken correlation-field handoff. It was never proof of a complete renderer. Its node version, generic paid-model gateway, static branches and integration settings are not a build starting point.

## Agent-led replacement

An agent inspects the task, evidence and current state; chooses the next justified action; calls a bounded tool; inspects the real result; then revises or continues. Scripts and services enforce input schemas, permissions, budget limits, durable state, timeouts and duplicate protection. The agent can change its plan without bypassing those controls.

For creative work, the inspectable node graph records research, prompt/reference versions, shot dependencies, alternatives, selected takes and edits. It is a working representation of the agent's plan and outputs, not a requirement to recreate a static n8n automation.

See the [current architecture direction](../../methodologies/agent-led-execution.md) and [before/after and AI UGC method](../../methodologies/before-after-ai-ugc.md).
