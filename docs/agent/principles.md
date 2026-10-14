# Design Principles

The rules that keep the kit portable, safe, and maintainable. When a decision is ambiguous, these break the tie.

---

1. **Single source of truth (SSOT).** Process prose lives only in `docs/agent/`. Tool adapters point at it; they never restate it.

2. **DRY via adapters.** `.cursor/` and `.claude/` are thin wrappers over the same skill bodies/docs. If you copy stage prose into both, you've broken the kit.

3. **Separation of concerns.** Kit = process. Project = domain (`docs/core/`, project rules). Scratch = experiments (`.agent/scratch/`, `_imports/`).

4. **Progressive disclosure.** Front doors (`AGENTS.md`, `CLAUDE.md`) stay thin and link deeper. Load specs/checklists only when the stage needs them.

5. **Fail closed on risk.** `write-security`, contract changes, CI, and **values prove** are hard gates (human approval / hooks / a live row), not polite reminders. UI prove is deferrable. See `prove.md`.

6. **WIP = 1 / focus.** One locked slice. No parallel mystery work.

7. **Idempotent entry.** `run` resumes from `workflow_state.md`, not from chat memory. Re-running is safe.

8. **Explicit over implicit.** Weight (`light`/`full`/`write-security`), gates, and the remediation cap (3) are written down, not assumed.

9. **Least privilege.** Each agent gets only the context/tools its stage needs. Architect designs; implementer codes; reviewer judges; ship pushes.

10. **Portability.** No product, company, or stack names in the kit. Inject domain via `project_config.md` + `docs/core/`.

11. **Observability / recoverability.** State, decisions log, and follow-ups make the next session pick up cleanly.

12. **YAGNI.** Don't add modes/commands until the sweet path is boringly solid.

13. **Human-in-the-loop is a feature.** Checkpoints are designed pauses, not failures.

14. **Compatibility without coupling.** Cursor and Claude Code share the same `docs/agent/`; neither owns the process.

15. **Reversibility.** Promoting scratch -> kit is deliberate and archivable; nothing silently becomes load-bearing.
