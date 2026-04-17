---
name: pagekit-evaluator-pass
description: Run the adversarial evaluator pass on a completed PageKit run. Post-evaluation skeptical second read. Use when a run has an evaluation.md but no evaluator-pass.md, or when the orchestrator needs an evaluator pass. Delegates to the pagekit-evaluator-pass subagent.
---

# PageKit Evaluator Pass

You are invoking the adversarial evaluator pass on a completed run.

## When to use

- After the run's `evaluation.md` is written.
- Before declaring the run fully-logged (the fully-logged tier requires `evaluator-pass.md`).
- When a reviewer asks "is this run as good as the evaluation says?"

## Read first
- `../pagekit/references/run-logging.md` — where the evaluator pass fits in the run-logging tier
- `agents/pagekit-evaluator-pass.md` — the subagent you will delegate to

## Inputs
- path to the run folder (e.g., `runs/kind-bowl-real/`)

## Procedure

1. Confirm the run has `evaluation.md`. If not, the evaluator pass is premature — finish the evaluation first.
2. Invoke the `pagekit-evaluator-pass` subagent. Pass the run-folder path.
3. The subagent runs read-only, produces `runs/<name>/evaluator-pass.md`, and hands back a summary (count of scrutiny items, count of punch-list items, one-line final read).
4. Relay the result to the caller. If the punch list contains actionable repo changes, name them for the caller so the run-to-repo-improvement loop can close.

## Quality gate

A strong evaluator pass:
- names specific quiet claims from the run, not general impressions
- writes an "implication" for each scrutiny item (what this suggests for the method or the repo)
- ends with a concrete punch list of file-level changes
- does not reward defensiveness

If the subagent's output is general rather than specific, ask it to retry with more direct reference to the run's artifacts.

## Relationship to `pagekit-claim-checker`

- `pagekit-claim-checker` reviews the **draft** line by line at a chosen severity.
- `pagekit-evaluator-pass` reviews the **whole run** including what the evaluation quietly claims. Different target, different voice.
