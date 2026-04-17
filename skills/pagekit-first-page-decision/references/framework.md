# First-Page Decision Framework

The first-page decision is the step that stops the method from quietly defaulting to a homepage.

## What it is for

Deciding, on purpose, what single page should exist first for this object.
Not all objects earn a homepage as the first page.
Some earn a use-case page, a profession-specific page, a comparison page, a nutritional-adequacy page or a trust-heavy entry page instead.

## Inputs

- signal doc
- message spine
- mechanism brief, proof brief and comparison brief when they exist (strongly recommended for trust-heavy objects)

## Why upstream source briefs matter here

A first-page decision made only from the signal doc and message spine will often name the right page type abstractly. A first-page decision made with mechanism, proof and comparison briefs present will also name the right sections, proof burden and scope.
If a first-page decision feels generic or reluctant, the real repair is usually an additional source brief upstream, not more effort at step 03.

## What it must answer

- what page should exist first
- why this page before any other
- what job this page should do
- what visitor state it meets on arrival
- the main trust burden it carries
- the main proof burden it carries
- what this decision rules out for now
- candidates considered and rejected, with why

## Candidates considered and rejected

A strong decision lists the alternatives that were considered and says why each was rejected.
At minimum, a trust-heavy object should have considered:
- homepage (and why it was or was not earned)
- a category-explainer page
- a mechanism or ingredient detail page
- a founder or brand story page
- a use-case or specific-scenario page

Naming rejected candidates makes the decision auditable. It also prevents the step from appearing to choose a non-homepage by default, which would be the mirror-image mistake of always choosing homepage.

### First-page alternatives vs later-funnel pages

A pricing page, a features page, a docs page, an integrations page, a comparison page are NOT first-page alternatives. They are later-funnel pages — they assume the visitor has already decided to evaluate the product and is going deeper. Dismissing them as first-page candidates ("a pricing page comes later, so homepage wins") is not a first-page decision; it is a ranking of homepage-vs-subpages, which answers the wrong question.

First-page alternatives sit at the same intent-commitment level as a homepage. They are pages a visitor could plausibly land on first, via organic search, direct link, or paid ad, without having committed to evaluate the product yet. Examples of real first-page alternatives:

- audience-specific landing pages (for a specific buyer, profession, or use case)
- trust-and-safety landing pages (for trust-heavy objects where the gating question is "is this safe/responsible?")
- mechanism or ingredient-detail pages (when the mechanism IS the reason to believe)
- category explainers (when the category itself is unfamiliar)
- founder or brand-story pages (rarely the right first page, but legitimate for some B2C objects)
- use-case or specific-scenario pages (for products where one use case dominates the buyer's intent)

If the rejected candidates are all downstream pages, the step has not been done. Go back and propose alternatives at the same level as a homepage.

### The affirmative-case requirement

For every candidate — the chosen one AND every rejected one — write one paragraph stating the case FOR the candidate before any reason to reject it. A one-sentence dismissal is not a rejection; it is a non-consideration. If you cannot write a credible case for a candidate, either (a) think harder about what would make that candidate strong for this specific object, or (b) drop the candidate and replace it with one you can argue for.

This is how the method avoids the "list and dismiss" anti-pattern. The four pre-Verdel artifact-only runs in this repo all fell into that trap. The Verdel run (`runs/vegan-dog-food-verdel/first-page-decision.md`) is the working example of the step done right.

## Principle

The object decides the page shape.
If the decision cannot explain why this page beats the obvious default, the signal doc or message spine is usually still too thin.

## Failure modes

- defaulting to homepage because homepage is familiar
- choosing a page the proof map cannot yet support
- deciding before the message spine is reduced enough to point at a specific page
- deciding without mechanism, proof or comparison briefs for a trust-heavy object, then landing on a homepage by default of information rather than by reason
- listing rejected candidates in a single sentence each, without real reasoning

## Relationship to the rest of PageKit

- upstream: signal doc, message spine, source briefs
- downstream: page argument shape, proof map, first page draft

The page argument shape step inherits this decision. That step is also where the anti-slop drafting constraints get attached (see `../../pagekit/references/anti-slop.md`). A wrong first-page decision at this step propagates through every downstream step including the slop-prevention layer.

If the first page is wrong, every downstream step drifts.
