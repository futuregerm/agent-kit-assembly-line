---
name: commit
description: Prepare a single commit for the approved slice and wait for human go-ahead (auto-commit OFF). Use after review approves a slice.
disable-model-invocation: true
---

# commit

Follow `docs/agent/README.md` (ops stage) and the project commit policy in `.agent/project_config.md`.

1. Confirm the reviewer returned `Approved? yes` with no open P0/P1.
2. **Docs on commit (if the project uses it):** if the slice locked a product/contract/identity decision, update the one owning published `docs/` page (a few lines) and stage it with the code. See the docs-on-commit rule + owner map in `.agent/project_config.md`. Skip for pure test/refactor or when the project defines no owner map.
3. Stage only files belonging to this slice.
4. Draft a short, functionality-level commit message (Conventional Commits style).
5. **Auto-commit is OFF:** present the staged diff + message and wait, unless the human already said "commit"/"ship it".
6. Never push here. Pushing/PR is `ship`.
