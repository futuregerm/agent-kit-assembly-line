---
name: intake
description: Turn raw business input (feature requests, notes, CSV) from .agent/_imports into a structured summary. Plan-only, never writes code. Use at the start of the discover track.
---

# intake

Follow `docs/agent/README.md` (discover stage). Do not restate the process here.

1. Read everything in `.agent/_imports/` (and any path the human points at).
2. Read `.agent/project_config.md` and `docs/core/` for domain context.
3. Produce a structured summary: themes, candidate work, open questions, discovered risks.
4. Do **not** write production code, contracts, or migrations.
5. Hand off to `backlog` to turn the summary into ordered slices.

Output location: a summary note the human can review (chat or `.agent/_imports/<name>-summary.md`).
