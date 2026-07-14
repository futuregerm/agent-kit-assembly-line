---
name: commit
description: Prepare a single commit for the approved slice and wait for human go-ahead (auto-commit OFF). Use after review approves a slice.
---

# commit

Follow `docs/agent/README.md` (ops stage) and the project commit policy in `.agent/project_config.md`.

1. Confirm the reviewer returned `Approved? yes` with no open P0/P1.
2. Stage only files belonging to this slice.
3. Draft a short, functionality-level commit message (Conventional Commits style).
4. **Auto-commit is OFF:** present the staged diff + message and wait, unless the human already said "commit"/"ship it".
5. Never push here. Pushing/PR is `ship`.
