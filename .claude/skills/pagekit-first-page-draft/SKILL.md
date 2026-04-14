---
name: pagekit-first-page-draft
description: Draft the first page from the full PageKit chain. Step 06 of the PageKit method. Use when steps 01-05 are done and you are ready to write the page itself. The draft must respect the anti-slop drafting constraints.
---

# PageKit step 06 — First Page Draft

You are running step 06 of the PageKit method. **This is where slop prevention bites.** The drafting constraints in `frameworks/anti-slop.md` are not optional.

## Read first
- `prompts/06-first-page-draft.md`
- `frameworks/page-argument-shape.md` (drafting constraints live here)
- `frameworks/anti-slop.md` (the patterns to avoid)

## Inputs
All five upstream artifacts:
- `runs/<run-name>/signal-doc.md`
- `runs/<run-name>/message-spine.md`
- `runs/<run-name>/first-page-decision.md`
- `runs/<run-name>/page-argument-shape.md`
- `runs/<run-name>/proof-map.md`

## Procedure
1. Load `prompts/06-first-page-draft.md`. Note the embedded anti-slop constraints; do not strip them when substituting inputs.
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

If the draft is weak: stop, ask what upstream artifact is too thin. Rarely fix at the draft level — fix at the source.
