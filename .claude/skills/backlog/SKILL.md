---
name: backlog
description: Convert an intake summary into an ordered backlog of slices, each with a weight (light/full/write-security). Plan-only. Use after intake, before locking any slice.
disable-model-invocation: true
---

# backlog

Follow `docs/agent/README.md` (discover stage) and `docs/agent/classes.md` for weights.

1. Read the intake **decision log** + summary and `docs/core/` domain truth. If no decision log exists for a new scope, go back to `intake` first (see Recovery in `docs/agent/README.md`).
2. Break work into small, shippable **slices** (one shippable chunk each). Prefer many thin cards over few fat ones.
3. Give each slice the required fields: **Done when**, **Depends on**, **Weight** (`light` / `full` / `write-security`, per `docs/agent/classes.md`; when unsure pick heavier), **Prove** (`values` / `ui` / `both` / `none` plus the steps, per `docs/agent/prove.md`), and the **owning decision-log section** it implements. If Prove was omitted, infer the kind per `prove.md` and write it on the card. Do not invent clicks.
4. Order slices by dependency and value.
5. Write the backlog to `.agent/slices/<scope>-slices.md`.
6. Stop for human approval of the backlog before any slice is locked.
