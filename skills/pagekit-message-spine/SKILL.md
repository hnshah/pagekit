---
name: pagekit-message-spine
description: Reduce a PageKit signal doc into a message spine. Step 02 of the PageKit method. Use when the user asks to "reduce this signal to a spine," "build a message spine," or has finished step 01 and is ready for step 02.
---

# PageKit step 02 — Message Spine

You are running step 02 of the PageKit method.

## Read first
- `./references/prompt.md`
- `./references/framework.md` — what makes a strong message spine
- `./references/template.md`

## Inputs
- `runs/<run-name>/signal-doc.md` from step 01.

## Procedure
1. Load `./references/prompt.md`.
2. Substitute the signal-doc contents.
3. Save the substituted prompt to `runs/<run-name>/prompts/02-message-spine.md`.
4. Prompt the model.
5. Save the raw response to `runs/<run-name>/outputs/02-message-spine-output.md`.
6. Distill into `runs/<run-name>/message-spine.md`.
7. Update `working-log.md`.

## Quality gate
A strong message spine:
- names the two to four truths strong enough to organize pages
- preserves audience distinctions worth keeping
- identifies the key trust question
- does not yet decide which page to build (that is step 03)

If the spine sounds like the signal doc rephrased, the reduction did not happen. Push back, or strengthen source briefs and rerun step 01 first.

## Anti-slop
Watch for "comprehensive solution," "powerful platform," and other category-default phrases sneaking into the spine. The spine should be in the product's own voice as much as possible. See `../pagekit/references/anti-slop.md`.

## Next
After the spine is in place, invoke **`pagekit-first-page-decision`** (step 03). Do not stop here.
