---
name: pagekit-first-page-decision
description: Decide which page should exist first for the object — without defaulting to homepage. Step 03 of the PageKit method. Use when the user has a signal doc + message spine and needs to choose the first page, or asks "should this be a homepage?" or "what page should we build first?"
---

# PageKit step 03 — First-Page Decision

You are running step 03 of the PageKit method. **This step is the one that stops the method from quietly defaulting to a homepage.**

## Read first
- `prompts/03-first-page-decision.md`
- `frameworks/first-page-decision.md`
- `templates/first-page-decision-template.md`

## Inputs
- `runs/<run-name>/signal-doc.md`
- `runs/<run-name>/message-spine.md`
- For trust-heavy objects, also: `runs/<run-name>/sources/04-mechanism-brief.md`, `05-proof-brief.md`, `06-comparison-brief.md` (if they exist; absence is itself a signal that the decision will be weaker).

## Procedure
1. Load `prompts/03-first-page-decision.md`.
2. Substitute the message spine and the relevant source briefs.
3. Save the substituted prompt to `runs/<run-name>/prompts/03-first-page-decision.md`.
4. Prompt the model.
5. Save the raw response to `runs/<run-name>/outputs/03-first-page-decision-output.md`.
6. Distill into `runs/<run-name>/first-page-decision.md`.
7. Update `working-log.md` with the chosen page and one-sentence-each rationale for rejected candidates.

## Hard requirement
The decision MUST list at least three candidate first pages. Minimum candidates for a trust-heavy object:
- homepage
- category-explainer page
- mechanism or ingredient-detail page
- founder or brand-story page
- use-case or specific-scenario page

Candidates must be peer first-page alternatives (same intent-commitment level as a homepage), NOT later-funnel pages. A pricing page, features page, docs page, integrations page, or comparison page is NOT a first-page alternative. If the rejected candidates are downstream pages, the step has not been done.

**For each candidate — the chosen one and every rejected one — write one paragraph stating the case FOR the candidate BEFORE any reason to reject.** If you cannot write a credible case for a candidate, you have not actually considered it. Either think harder about what would make that candidate strong for this object, or drop it and replace it with one you can argue for.

If any candidate is dismissed in one sentence, the step has not been done.

## The Verdel pattern
`runs/vegan-dog-food-verdel/first-page-decision.md` is the working example. Four labeled candidates (A: homepage, B: trust/safety landing, C: allergy landing, D: nutrition deep-dive), a paragraph-long case for each, a deliberate non-homepage choice with specific reasoning against the other three, plus a confidence basis. If the output you are producing does not match that shape, go back and rework it.

## Quality gate
A strong first-page decision:
- chose the first page on purpose
- explains why this page beats the obvious default
- names trust burden and proof burden explicitly
- the object drove the choice, not the category default

## Decision check
If the chosen page is "homepage," the rationale must explain why homepage actually earns it for *this* object — not simply because that is what people usually build first. If you cannot articulate the why, the message spine is probably too thin; go back to step 02.

## When to escalate to the user
- The decision is genuinely close between two candidates: surface both, ask for input.
- Mechanism / proof / comparison briefs are missing for a trust-heavy object: ask for them before deciding.
