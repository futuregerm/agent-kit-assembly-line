# Schema — project_config.md

The per-project runtime config. Lives at `.agent/project_config.md`. Committed if team-shared, gitignored if personal. Read at session start.

This is where a consuming project injects its **domain and limits**. The kit ships the schema; the project fills the values.

---

```markdown
# Project Config

**Project:** <name>
**Last updated:** YYYY-MM-DD

## Repos in scope

| Repo | Role |
|------|------|
| <repo> | primary / reference / archived |

## Source of truth hierarchy

1. <published contracts, e.g. docs/core/api-contracts.md>
2. <security rules, e.g. docs/core/auth.md>
3. <engineering rules file>
4. .agent/workflow_state.md
5. code (HEAD)

## Limits

| Rule | Value |
|------|-------|
| WIP (locked slices) | 1 |
| Remediation cycles (run) | 3 then human |
| Pre-PR CI auto-fix loops (ship) | 3 then stop |

## Commit policy

- Auto-commit: OFF by default.
- Never push unless the human says "push" or "open a PR".

## Human checkpoint gates

| Situation | Required action |
|-----------|-----------------|
| write-security slice before implement | Stop, show design, wait for approval |
| Public API contract change | Stop, confirm intentional |

## CI command (used by ship)

- Windows: <path to pre-pr-check.ps1>
- Bash: <path to pre-pr-check.sh>
```

---

## Rules

- The kit never hardcodes these values; it reads them here.
- `Limits` defaults (WIP=1, remediation=3) match the constitution — change per project only with intent.
