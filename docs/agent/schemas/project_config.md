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

## Domain docs on commit (optional)

When a slice is review-approved and at commit prep (same commit when possible):

1. If the slice locked a **product / contract / identity** decision, update the **one owning published doc** under `docs/` (a few lines, not the full design).
2. Designs (`.agent/designs/`), Notion, and `workflow_state` **point** to that doc — they are not a second SSOT.
3. **Skip** when the slice is pure test/refactor with no meaning change.
4. Prefer one short subsection or decision-log row over rewriting whole articles.

**Owner map (fill per project):**

- <domain area> -> <owning docs/ page>
- <domain area> -> <owning docs/ page>

## Limits

| Rule | Value |
|------|-------|
| WIP (locked slices) | 1 |
| Remediation cycles (run) | 3 then human |
| Pre-PR CI auto-fix loops (ship) | 3 then stop |

## Commit policy

- Auto-commit: OFF by default.
- Never push unless the human says "push" or "open a PR".

## Prove (per project)

See `docs/agent/prove.md`. The kit ships the slots; the project fills them. No secrets (persona and how-to only).

- Kinds in scope: `values` | `values+ui` | `none`
- UI prove: `auto` | `skip`
- Local: how to detect/boot, base URL, persona
- Designated test env: URL, git ref it tracks, how to confirm deploy SHA (or "ask: is this merge live?")
- Never: production
- Learned URLs: labeled, dated; do not promote to the default test env unless the human says so

## Human checkpoint gates

| Situation | Required action |
|-----------|-----------------|
| write-security slice before implement | Stop, show design, wait for approval |
| Public API contract change | Stop, confirm intentional |
| Values prove not runnable | Stop. Do not review or commit. |

## CI command (used by ship)

- Windows: <path to pre-pr-check.ps1>
- Bash: <path to pre-pr-check.sh>
```

---

## Rules

- The kit never hardcodes these values; it reads them here.
- `Limits` defaults (WIP=1, remediation=3) match the constitution — change per project only with intent.
- **Domain docs on commit** is optional per project; when used, the `commit` stage and the review checklist enforce it. The owner map stays project-local (the kit ships the pattern, not the mappings).
- **Prove** is required process (`docs/agent/prove.md`). Kinds, UI `auto|skip`, and env how-to stay project-local. Unverifiable deploy SHA means the remote env is unusable.
