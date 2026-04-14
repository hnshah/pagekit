# First-Page Decision Framework

The first-page decision is the step that stops the method from quietly defaulting to a homepage.

## What it is for

Deciding, on purpose, what single page should exist first for this object.
Not all objects earn a homepage as the first page.
Some earn a use-case page, a profession-specific page, a comparison page or a trust-heavy entry page instead.

## Inputs

- signal doc
- message spine

## What it must answer

- what page should exist first
- why this page before any other
- what job this page should do
- what visitor state it meets on arrival
- the main trust burden it carries
- the main proof burden it carries
- what this decision rules out for now

## Principle

The object decides the page shape.
If the decision cannot explain why this page beats the obvious default, the signal doc or message spine is usually still too thin.

## Failure modes

- defaulting to homepage because homepage is familiar
- choosing a page the proof map cannot yet support
- deciding before the message spine is reduced enough to point at a specific page

## Relationship to the rest of PageKit

- upstream: signal doc, message spine
- downstream: page argument shape, proof map, first page draft

The page argument shape step inherits this decision.
If the first page is wrong, every downstream step drifts.
