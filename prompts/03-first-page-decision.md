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
- lists candidates considered and rejected with reasons
- the object (not the category) drove the choice

## Prompt

```text
Using the message spine below, decide what page should exist first.

Do not assume homepage by default.
Consider at least three candidate first pages and reject the ones that do not earn it.

For a trust-heavy object, the minimum candidates to consider are:
- homepage
- category-explainer page
- mechanism or ingredient-detail page
- founder or brand-story page
- use-case or specific-scenario page

Define:
1. the best first-page candidate
2. why this page first
3. the page's job
4. visitor state on arrival
5. main trust burden
6. main proof burden
7. what this decision rules out for now
8. candidates considered and rejected, with why

Message spine:
[PASTE HERE]
```

## If the decision feels forced
The signal doc or the message spine is probably too thin. Do not advance just to keep the chain moving. Go back upstream and strengthen what is missing before deciding.
