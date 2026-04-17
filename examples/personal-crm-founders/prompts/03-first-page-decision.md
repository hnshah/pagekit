<!--
This file starts as a copy of prompts/03-first-page-decision.md (the canonical prompt for this step).
When you run the step:
1. Substitute the required inputs into the prompt.
2. Save the version you actually sent to the model here.
3. Save the raw output to outputs/03-first-page-decision-output.md.
-->

---
step: "03"
name: first-page-decision
title: Decide the First Page
inputs:
  - signal-doc.md
  - message-spine.md
outputs:
  - first-page-decision.md
framework: frameworks/first-page-decision.md
template: templates/first-page-decision-template.md
notes: |
  This step exists to stop the method from quietly defaulting to a
  homepage. The decision must list candidates considered and rejected.
---

# Prompt: 03 — First-Page Decision

## When to use
After the message spine has reduced the signal into a small set of truths. Before any argument-shape or proof work.

## What good output looks like
- chooses the first page on purpose
- explains why this page beats the obvious default
- makes the trust burden and proof burden explicit
- lists candidates at the same intent-commitment level as a homepage (not downstream pages)
- states a paragraph-long case FOR each candidate before rejecting any of them
- names the confidence basis (data / signal / hypothesis)
- the object (not the category) drove the choice

## The Verdel pattern (reference)
`runs/vegan-dog-food-verdel/first-page-decision.md` is the working example of this step done well. Four labeled candidates, a paragraph of affirmative case for each, a deliberate non-homepage choice (a trust/safety landing page) with specific reasoning against the other three. A new step 03 output that does not match that shape is not meeting the step's quality bar.

## Prompt

```text
Using the message spine below, decide what page should exist first.

Do not assume homepage by default.

Consider at least three candidate first pages. The candidates must be peer first-page alternatives at the same intent-commitment level as a homepage — not later-funnel pages. A pricing page, a features page, a docs page, an integrations page are NOT first-page alternatives. Those are downstream pages that assume someone has already decided to evaluate the product.

First-page alternatives are pages at the same level as a homepage: audience-specific landing pages, trust-and-safety landing pages, mechanism or ingredient-detail pages, category explainers, founder or brand-story pages, use-case or specific-scenario pages.

For a trust-heavy object, the minimum candidates to consider are:
- homepage
- category-explainer page
- mechanism or ingredient-detail page
- founder or brand-story page
- use-case or specific-scenario page

For each candidate (the chosen one and every rejected one), write ONE PARAGRAPH stating the case FOR the candidate BEFORE any reason to reject. If you cannot write a credible case for the candidate, you have not actually considered it — go back and think about what would make that candidate strong for this object, or drop it and replace it with one you can argue for.

Define:
1. candidates considered (case FOR each, one paragraph each — including the chosen one)
2. the best first-page candidate (with the paragraph from above, plus the decision)
3. why this page first (beyond the case FOR — why it beats the others for THIS object)
4. candidates rejected, with the specific reason each is rejected for THIS object
5. the page's job
6. visitor state on arrival
7. main trust burden
8. main proof burden
9. what this decision rules out for now
10. confidence basis (data / signal / hypothesis) — state which, and why

Message spine:
[PASTE HERE]
```

## If the decision feels forced
The signal doc or the message spine is probably too thin. Do not advance just to keep the chain moving. Go back upstream and strengthen what is missing before deciding.
