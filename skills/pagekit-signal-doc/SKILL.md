---
name: pagekit-signal-doc
description: Build a PageKit signal doc from a product description and any source briefs. Step 01 of the PageKit method. Use when the user asks to "build a signal doc," "extract signal from this material," or is starting a PageKit run on a new object.
---

# PageKit step 01 — Signal Doc

You are running step 01 of the PageKit method.

## Read first
- `./references/prompt.md` — the canonical prompt for this step
- `./references/framework.md` — what makes a signal doc strong
- `./references/template.md` — the artifact shape
- `./references/wedge-definition-template.md` — use when the first signal pass is too category-level

## Inputs
- A product description and any source briefs in `runs/<run-name>/sources/` (especially `02-product-brief.md`).

## Procedure
1. Load `./references/prompt.md`.
2. Substitute the product description and source briefs in place of `[PASTE HERE]`.
3. If invoked inside a fully-logged run, save the substituted prompt to `runs/<run-name>/prompts/01-signal-doc.md`.
4. Prompt the model with the substituted prompt.
5. Save the raw response to `runs/<run-name>/outputs/01-signal-doc-output.md`.
6. Distill the response into `runs/<run-name>/signal-doc.md` per `./references/template.md`.
7. Append a short note to `runs/<run-name>/working-log.md`.

## Quality gate
A strong signal doc:
- separates observation from assumption
- gives sharper language than the category default
- exposes what is still unknown
- distinguishes audiences where it matters

If the doc is too generic or too category-level, **do not advance to step 02.** Create a wedge-definition brief (`./references/wedge-definition-template.md`) or a sharper product brief, then rerun this step.

## Anti-slop
Signal docs themselves rarely produce slop, but if the output uses confident-sounding empty words ("comprehensive," "deeply understands," "transforms"), strip them. Real signal is specific. See `../pagekit/references/anti-slop.md` for the full catalog.

## Next
After this step's artifact is in place, invoke **`pagekit-message-spine`** (step 02). Do not stop here. The signal doc is not the deliverable; the draft is, and the chain must run to completion (see the orchestrator's self-check).
