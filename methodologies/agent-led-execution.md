# Agents and reliable tools

The system should become easier to run as models improve. Keep business knowledge and operational records separate from the current way an agent reasons about them. Replacing a model should also make it possible to simplify the workflow, not just change a name in a dropdown.

## What stays and what changes

Keep owner-controlled product and brand records, sources, assets, catalog/platform IDs, costs, performance history and action receipts. Store explicit versions and exports. Do not depend on a proprietary chat history to recover the business.

Treat prompts, skills, instruction files, agent roles, reasoning stages and providers as replaceable. Preserve their versions for comparison, but retire unnecessary steps from active execution. Markdown and automation tools may still be useful; the requirement is freedom to replace them, not a ban on particular formats.

Use tested software for permissions, spending, account identity, validation, safe retries and checking external results. The model cannot change its own authority. A timed-out request is an unknown result to reconcile, not permission to create the same campaign again.

## Upgrade demonstration

Agree representative inputs and acceptance checks before kickoff. Use development accounts or isolated draft targets; this demonstration does not authorize live publishing or spending.

1. Run an agreed research-to-draft task with the original configuration. Save the evidence, output, model/runtime and workflow versions, time, cost, corrections and errors. Include a representative Shopify catalog update and tracking test in the regression checks.
2. Run the same inputs through a second available, supported model or runtime using the same record formats. Show the actual outputs. State exactly what was replaced and which other replacement paths remain untested. A mock response or edited model label does not count.
3. Replace or bypass a real planning, prompt or agent stage while preserving its required result. Do not add a pointless stage just to remove it in this test. If the original workflow is already minimal, demonstrate an alternative reasoning implementation with the same inputs and required outputs.
4. Compare accuracy, finished output quality, catalog/event correctness, cost, time and manual repair. Review visual work independently of model self-scores. Agree the quality/cost decision before adopting the change; a newer model is not automatically a better choice.
5. Restore the original configuration and run again without losing records, changing external IDs or repeating committed actions. Configuration rollback does not undo an ad already published or money already spent; external corrections require their own approved action.
6. Show that spend and account permissions still hold when instructions change. Restore representative exported records, media references and configuration into a clean test environment.

Deliver the runnable checks, comparison evidence and a short operator guide. The guide should show how to change a model/runtime, edit or remove a workflow stage, run the checks and restore the previous setup. Another competent engineer must be able to operate it without a proprietary contractor service.

These tests prove the boundaries actually exercised, not compatibility with every future model. Limited connector/configuration work may still be needed for a new provider. Production upgrades remain controlled changes, not automatic self-modification.

## Keep the build small

Use supported existing tools where they fit. Custom code should serve business needs rather than rebuild authentication, databases or a general-purpose agent platform. Do not multiply agents or instruction files to inflate the work. The upgrade demonstration is included in the agreed build; any later maintenance arrangement is separate.

Use Codex and Claude subscriptions through supported access; paid APIs are limited to video generation. Verify access, capacities and costs before contracting. This repository supplies methodology reference only. [Requirements](../REQUIREMENTS.md) defines scope and acceptance.
