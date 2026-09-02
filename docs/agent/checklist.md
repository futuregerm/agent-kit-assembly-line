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

- **P0** — must fix before commit (broken behavior, security hole, scope violation, failing tests).
- **P1** — should fix before commit; may defer only with explicit human sign-off.
- **P2** — capture as follow-up in `.agent/follow-ups/`; do not block.

`Approved? yes` requires **zero open P0 and P1**.

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

### Security (mandatory for `write-security`)

- [ ] AuthZ/authN enforced; no tenant/ownership bypass.
- [ ] No secrets in code, logs, or fixtures.
- [ ] Input validated; no injection surface.
- [ ] Migrations reversible / safe.

### Quality

- [ ] Readable; follows project rules in `docs/core/` and project rules files.
- [ ] No dead code, no debug leftovers.
- [ ] Public contracts unchanged unless the slice intends it.

---

## Remediation loop

- Reviewer finds P0/P1 -> implementer fixes -> reviewer re-runs.
- **Maximum 3 cycles.** After the 3rd unresolved cycle, stop and ask the human. Do not commit.
