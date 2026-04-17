---
name: pagekit-first-page-draft
description: Draft the first page from the full PageKit chain. Step 06 of the PageKit method. Use when steps 01-05 are done and you are ready to write the page itself. The draft must respect the anti-slop drafting constraints.
---

# PageKit step 06 — First Page Draft

You are running step 06 of the PageKit method. **This is where slop prevention bites.** The drafting constraints in `../pagekit/references/anti-slop.md` are not optional.

## Read first
- `./references/prompt.md`
- `../pagekit-page-argument-shape/references/framework.md` (drafting constraints live here)
- `../pagekit/references/anti-slop.md` (the patterns to avoid)

## Inputs
All five upstream artifacts:
- `runs/<run-name>/signal-doc.md`
- `runs/<run-name>/message-spine.md`
- `runs/<run-name>/first-page-decision.md`
- `runs/<run-name>/page-argument-shape.md`
- `runs/<run-name>/proof-map.md`

## Procedure
1. Load `./references/prompt.md`. Note the embedded anti-slop constraints; do not strip them when substituting inputs.
2. Substitute the five artifacts above.
3. Save the substituted prompt to `runs/<run-name>/prompts/06-first-page-draft.md`.
4. Prompt the model.
5. Save the raw response to `runs/<run-name>/outputs/06-first-page-draft-output.md`.
6. Distill into `runs/<run-name>/first-page-draft.md`.
7. **Run `scripts/slop-check.sh runs/<run-name>/first-page-draft.md` immediately.** Resolve every flagged pattern by rewriting the line. Re-run until clean.
8. Update `working-log.md`.

## Hard rules
- Stay inside the proof map. If the draft wants to say something the proof map cannot defend, mark the line with `*[verification flag: ...]*`.
- Stay inside the argument shape. Do not add sections that were not approved at step 04.
- Stay outside the anti-slop pattern list. The script will catch the obvious cases; the claim-check step (07) will catch the rest.

## Quality gate
A strong draft:
- inherits structure from the argument shape
- stays inside the proof map
- reads as written by a person with a voice, not by a machine
- uses `*[verification flag: ...]*` for any product-specific claim not verified against briefs
- passes `scripts/slop-check.sh` clean before being handed to step 07

If the draft is weak: stop, ask what upstream artifact is too thin. Rarely fix at the draft level, fix at the source.

## Next
**The draft is not the deliverable. The logged run is.** After the draft is clean, do not stop. Continue the chain:

1. Invoke **`pagekit-slop-check`** on the draft. Resolve any flags.
2. Invoke **`pagekit-claim-check`** (step 07) at a severity you choose and log. This produces `claim-check.md` and, if any line was rewritten, `first-page-draft-corrected.md`.
3. Write `evaluation.md` — the run's own honest read of what worked and what stayed thin.
4. Invoke **`pagekit-evaluator-pass`** to produce `evaluator-pass.md` — the adversarial second read.
5. Fill in `working-log.md` across every step (replace all scaffold `*[Fill in]*` placeholders).
6. Invoke **`pagekit-run-check`** — it must return `tier: FULLY LOGGED` or `tier: PUBLISHABLE`.

Only once run-check reports FULLY LOGGED (or PUBLISHABLE) is the run done. Stopping at this step leaves the run at ARTIFACT-ONLY, which does not count.
