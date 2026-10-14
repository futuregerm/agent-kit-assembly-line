---
name: plain
description: Translates shorthand, jargon, flags, and thread dump into full plain-English explanations. Use when the user invokes /plain or says they cannot follow the shorthand.
disable-model-invocation: true
---

# plain

The human can lose a long thread. Shorthand, flags, and jargon that the agent can follow, they cannot. Translate — do not do more work.

## Do

1. Take what they pasted, numbered, or pointed at. If they named nothing, translate the last assistant report they are reacting to.
2. Cover every item. Do not skip the hard ones.
3. For each item, in **full sentences**: what it means, why it is there, and what it does or does not do.
4. **Plain English. No jargon.** If a term must appear, define it in that same sentence.
5. Assume they did not follow the rest of the thread. Do not say "as above" or point at earlier jargon.
6. Lead with meaning. Do not recap the question or the pipeline.

## Do not

- Do not run jobs, delete, commit, push, or Slack unless they asked for that in the same message.
- Do not answer with `/oneline` brevity. That command is the short version. This one is the full version.
- Do not invent decisions. If something is unknown, say so in a full sentence.
