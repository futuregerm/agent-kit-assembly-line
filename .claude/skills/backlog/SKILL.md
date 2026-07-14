---
name: backlog
description: Convert an intake summary into an ordered backlog of slices, each with a weight (light/full/write-security). Plan-only. Use after intake, before locking any slice.
---

# backlog

Follow `docs/agent/README.md` (discover stage) and `docs/agent/classes.md` for weights.

1. Read the intake summary and `docs/core/` domain truth.
2. Break work into small, shippable **slices** (one shippable chunk each).
3. Assign each slice a **weight** per `docs/agent/classes.md` (`light` / `full` / `write-security`). When unsure, pick heavier.
4. Order slices by dependency and value.
5. Write the backlog to `.agent/slices/<scope>-slices.md`.
6. Stop for human approval of the backlog before any slice is locked.
