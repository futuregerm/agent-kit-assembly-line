# commit

Ops-track. Prepare a single commit for the approved slice. Auto-commit OFF.

Follow `.claude/skills/commit/SKILL.md` and `docs/agent/README.md` (ops stage). Do not duplicate the process.

Quick path:
1. Confirm reviewer `Approved? yes` (no open P0/P1).
2. Docs on commit (if the project uses it): if the slice locked product/contract/identity meaning, update the owning `docs/` page and stage it too (see SKILL step 2 + owner map in `.agent/project_config.md`).
3. Stage only this slice's files.
4. Draft a short functionality-level message.
5. Present staged diff + message and wait, unless the user said "commit"/"ship it". Never push here.
