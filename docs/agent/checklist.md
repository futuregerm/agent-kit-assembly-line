# Review Checklist

Used by the **reviewer** stage. Returns a verdict plus findings graded P0/P1/P2.

---

## Verdict format

```text
Approved? yes | no
P0 (blocker): ...
P1 (should fix): ...
P2 (nice to have / defer): ...
Summary: <one or two lines>
```

- **P0** — must fix before commit (broken behavior, security hole, scope violation, failing tests, failed prove).
- **P1** — should fix before commit; may defer only with explicit human sign-off.
- **P2** — capture as follow-up in `.agent/follow-ups/`; do not block.

`Approved? yes` requires **zero open P0 and P1**. It is allowed with an explicit `ui: deferred` or `ui: skipped`. It is **not** allowed when the kind is `values` or `both` and values is not `pass`. The summary line must include the prove evidence (`values` / `ui` / env / what was seen). See `prove.md`.

---

## Checklist

### Scope

- [ ] Change stays within the locked slice. Out-of-scope work captured in `.agent/follow-ups/`.
- [ ] Matches the design doc (for `full` / `write-security`).
- [ ] Matches the decision log / owning study law when the slice cites one. P1 if it contradicts locked decisions.

### Correctness

- [ ] Does what the slice specifies.
- [ ] Edge cases and error paths handled.
- [ ] No obvious regressions in touched areas.

### Tests

- [ ] New/changed logic has tests.
- [ ] Existing tests still pass.

### Prove

Judge the evidence in `workflow_state` (Prove this slice). Do not re-run the path. Passing tests are not a values substitute. See `prove.md`.

- [ ] If the kind is `values` or `both`, `values` is `pass`. P0 if it is missing, `fail`, or `blocked` (implementer should have stopped; still P0 if they reached review). `none` and `ui`-only may record values `n/a`.
- [ ] If UI **ran** and failed, that is a P0.
- [ ] `ui: deferred` or `ui: skipped` is not a P0 when the click path is on the card or in `.agent/follow-ups/`.
- [ ] Unavailable, skipped, passed, and failed are not treated as the same outcome.

### Security (mandatory for `write-security`)

- [ ] AuthZ/authN enforced; no tenant/ownership bypass.
- [ ] No secrets in code, logs, or fixtures.
- [ ] Input validated; no injection surface.
- [ ] Migrations reversible / safe.

### Quality

- [ ] Readable; follows project rules in `docs/core/` and project rules files.
- [ ] No dead code, no debug leftovers.
- [ ] Public contracts unchanged unless the slice intends it.

### Docs

- [ ] If the slice locked product/contract/identity meaning and the project defines a docs owner map, the owning `docs/` page was updated (or explicitly N/A in the summary). See docs-on-commit in `.agent/project_config.md`. P1 if missing when clearly required.

---

## Remediation loop

- Reviewer finds P0/P1 -> implementer fixes -> re-prove kinds that still apply -> reviewer re-runs.
- **Maximum 3 cycles.** After the 3rd unresolved cycle, stop and ask the human. Do not commit.
- The cap counts **failed** prove (values or UI ran and was wrong). Values-not-runnable blocks without burning a cycle. Deferred or skipped UI does not burn a cycle.
