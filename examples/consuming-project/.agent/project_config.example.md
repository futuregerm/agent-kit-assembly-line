# Project Config (example)

Filled-in example of `docs/agent/schemas/project_config.md` for a fictional project.

**Project:** acme-web
**Last updated:** 2026-01-01

## Repos in scope

| Repo | Role |
|------|------|
| acme-web | primary |
| acme-api | reference |

## Source of truth hierarchy

1. docs/core/api-contracts.md
2. docs/core/auth.md
3. .cursor/rules/engineering.mdc
4. .agent/workflow_state.md
5. code (HEAD)

## Limits

| Rule | Value |
|------|-------|
| WIP (locked slices) | 1 |
| Remediation cycles (run) | 3 then human |
| Pre-PR CI auto-fix loops (ship) | 3 then stop |

## Commit policy

- Auto-commit: OFF.
- Never push unless the human says "push" or "open a PR".

## Prove (per project)

- Kinds in scope: values+ui
- UI prove: auto
- Local: boot with the project's local runner; app at http://localhost:3000; persona "admin" (no secrets in this file)
- Designated test env: https://test.example.invalid — tracks `main`; confirm deploy SHA matches the merged commit, or ask "is this merge live?"
- Never: production
- Learned URLs: none yet

## Human checkpoint gates

| Situation | Required action |
|-----------|-----------------|
| write-security slice before implement | Stop, show design, wait for approval |
| Public API contract change | Stop, confirm intentional |
| Values prove not runnable | Stop. Do not review or commit. |

## CI command (used by ship)

- Windows: scripts/pre-pr-check.ps1
- Bash: scripts/pre-pr-check.sh
