---
name: pagekit-page-argument-shape
description: Design the page argument shape — what sections the chosen first page should and should not have. Step 04 of the PageKit method. Use when the first-page decision is made and you need a structure for the draft.
---

# PageKit step 04 — Page Argument Shape

You are running step 04 of the PageKit method.

## Read first
- `./references/prompt.md`
- `./references/framework.md`
- `./references/template.md`
- `../pagekit/references/anti-slop.md` — the drafting constraints the shape produces must include the anti-slop rules

## Inputs
- `runs/<run-name>/first-page-decision.md`
- `runs/<run-name>/message-spine.md` (for context)

## Procedure
1. Load `./references/prompt.md`.
2. Substitute the first-page decision.
3. Save the substituted prompt to `runs/<run-name>/prompts/04-page-argument-shape.md`.
4. Prompt the model.
5. Save the raw response to `runs/<run-name>/outputs/04-page-argument-shape-output.md`.
6. Distill into `runs/<run-name>/page-argument-shape.md`. **Make sure the drafting-constraints section includes the anti-slop block** from `./references/template.md`.
7. Update `working-log.md`.

## Quality gate
A strong page argument shape:
- structure comes from the object, not category habit
- names sections the page does not need, not only sections it does
- makes trust placement and proof placement explicit
- carries the anti-slop drafting constraints forward to the draft step
- passes the length/density check (a page that is honest but unread does not earn trust)

## Anti-slop
The shape's drafting-constraints section is where slop prevention starts. If those constraints are missing or watered down, every step downstream is weaker.

## Next
After the shape is in place, invoke **`pagekit-proof-map`** (step 05). Do not stop here.
