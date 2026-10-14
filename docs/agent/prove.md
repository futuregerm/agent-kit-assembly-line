# Prove

Live proof that a slice's behavior matches real data and, when in scope, a real screen. **Not a pipeline stage, specialist, or weight.** The implementer runs it as the Dev exit; the reviewer judges the evidence. It sits between implement and review (`docs/agent/README.md`).

Automated tests stay in `checklist.md`. Passing tests are **not** a values substitute.

---

## Kinds

| Kind | When |
|------|------|
| `values` | Slice reads or writes persistence, an API, or a contract that maps to real rows |
| `ui` | Slice changes a user-visible surface |
| `both` | Values and UI |
| `none` | Docs-only, or no behavior to prove outside tests |

Call this **Prove**. Do not call it Manual QA — some projects already use that phrase for human review labels.

---

## Who decides

The planner writes **Prove** on each slice card: the kind, plus the steps (the values check and/or the click path, or `none`).

If the field is missing, **infer and write it onto the card**. Do not stop to ask, and do not invent a click path the slice does not need:

- API, persistence, or a contract mapped to rows → `values`
- A user-visible surface as well → `both` (or `ui` alone if there is no data path)
- Docs-only / no behavior change → `none`

Project config **`UI prove: auto | skip`** decides whether the browser runs. `skip` does not delete the click path from the card. It overrides inference for the browser only. A project whose kinds in scope omit `ui` never looks for a screen.

---

## Auto-baked

The implementer **always** runs the required kinds. Do not ask "should I QA?" or paste a fresh testing essay and wait.

Ask the human **only to unblock values** (local will not start, or a URL that already has this change). UI skip is the config switch, not a per-slice question.

---

## Env ladder

No stack or product names here. The project fills detect/boot, URLs, and persona in `.agent/project_config.md`. Persona and how-to only — **no passwords, tokens, or secrets.**

1. **Local** — detect or boot per project config. Always preferred. An uncommitted `run` almost always means local: a remote env cannot contain uncommitted work.
2. **Designated test URL** — only if **this slice's SHA** is on it: the change is merged **and** that env has deployed the merge. Merged is not deployed. **If the deploy SHA cannot be verified, treat remote as unusable.** Do not try the test env anyway.
3. **One ask** — if values still has nowhere to run, ask once for a URL that has this change. Persist it as a labeled, dated learned URL. Do not promote it to the default test env unless the human says so.
4. **Never production.**

UI uses the same ladder only when the card requires `ui` and `UI prove` is `auto`. If no UI env is reachable, defer UI. Do not block the slice for a missing screen.

---

## Outcomes

| Result | Slice |
|--------|--------|
| Values ran and failed | Block. P0. Fix ≤ 3, then human. |
| Values not runnable | **Block.** Integrity proof is required. Start local, or get a URL whose deploy SHA is this change, or the human unblocks. Do not review. Do not commit. Does **not** burn a fix cycle. |
| UI ran and failed | Block. P0. Fix ≤ 3, then human. |
| UI not runnable | Do not block. Record the click path in `.agent/follow-ups/` (env tried, why). Tell the human. |
| Human skip auto UI (`UI prove: skip`) | Do not block. The click path stays on the card. Record `ui: skipped`. |

**Unavailable ≠ skipped ≠ passed ≠ failed.**

`Approved? yes` is allowed with an explicit `ui: deferred` or `ui: skipped`. It is **not** allowed when `values` is required and is not `pass` (or the kind is not `none`).

---

## Remediation cap

The cap of 3 counts **failed** prove only: values or UI **ran** and was wrong. That is a product bug.

Values-not-runnable blocks the slice and sets status `blocked` with an open blocker. It does not consume a fix cycle. After the env is up, a later failure starts the clock.

Deferred or skipped UI does not consume a fix cycle.

On a fix cycle that still changes data or a screen, re-run the kinds that apply. Do not hand the clicks to another agent.

---

## Evidence

Write **Prove this slice** in `.agent/workflow_state.md` (see `schemas/workflow_state.md`):

- `values`: `pass` | `fail` | `blocked` | `n/a`
- `ui`: `pass` | `fail` | `deferred` | `skipped` | `n/a`
- env used
- one line: what was seen (or why it did not run)

When UI is deferred, **Next 3 actions** must name that follow-up. Do not open a second testing queue.

---

## Writes

For a slice that writes, values means **confirm the row just written**, then stop. It is not a dump of the store, and it is not production.

---

## Reviewer

Read-only. Judge the evidence line against this file and `checklist.md`. Do not re-run the path. If the implementer reached review with values required and not `pass`, that is still a P0.
