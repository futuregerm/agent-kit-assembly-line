---
name: intake
description: Turn raw business input (feature requests, notes, CSV) from .agent/_imports into a structured summary. Plan-only, never writes code. Use at the start of the discover track.
disable-model-invocation: true
---

# intake

Follow `docs/agent/README.md` (discover stage). Do not restate the process here.

1. Read everything in `.agent/_imports/` (and any path the human points at).
2. Read `.agent/project_config.md` and `docs/core/` for domain context.
3. Produce a structured summary: themes, candidate work, open questions, discovered risks.
4. **Lock a decision log** — the required exit for this stage: headline question, locked rules/decisions, explicit out-of-scope. When decisions are non-trivial, ask **one at a time** and record each. Do not call intake done while open questions block scope.
5. Do **not** write production code, contracts, or migrations.
6. Hand off to `backlog` to turn the summary + decision log into ordered slices.

Output location: a summary note the human can review (chat or `.agent/_imports/<name>-summary.md`).

**Recovery:** if the human jumps straight to backlog/lock/build for a **new** scope with no decision log, start here first. If the scope already has published law, treat that as the decision log and continue. See Recovery / skip guards in `docs/agent/README.md`.
