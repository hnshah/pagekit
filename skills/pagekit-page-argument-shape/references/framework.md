# Page Argument Shape Framework

The page argument shape is how a specific page earns its own structure instead of inheriting a default section rhythm.

## What it is for

Deciding, before drafting:
- what the visitor needs to understand first
- what must be earned next
- the order the argument should move in
- which sections this page actually needs
- which sections would be unnecessary or harmful
- where trust should land
- where proof should land
- the constraints the draft must respect

## Why this exists

Default homepage rhythms (hero, features, social proof, CTA) are a habit, not a structure.
Different objects want different shapes.
The argument shape step forces the structure to come from the object.

## Principle

The structure of the page should fall out of the argument the page has to make.
If the shape looks like every other page in the category, the shape has not done its job.

## Failure modes

- reusing a familiar section rhythm without earning it
- inventing sections the proof map cannot support
- hiding the trust burden inside a section that cannot carry it
- planning too many sections and losing the argument
- producing a shape that is honest but too long or too dense to be read through

## Length and density

The shape's job includes guarding against a page that is correct but unread.
If the approved section plan is long enough or dense enough that a skeptical reader would stop before the trust-carrying sections land, shorten or cut sections at the shape step.
Do not defer this to drafting. A draft cannot save a shape that is too heavy.

## Anti-slop drafting constraints

The shape step produces drafting constraints that the draft must respect.
These must include the hard anti-slop rules. See `frameworks/anti-slop.md` for the full reference and examples.

Minimum constraints every shape must pass to drafting:

- no `Not X. Not Y.` headings or sentence pairs
- no `Not-X-but-Y` or `X-not-Y` rhetorical pivots unless they carry specific content
- no three parallel short sentences used for cadence (rule-of-three clustering)
- no sentence-start anaphora across three or more consecutive sentences
- no editorial voice narrating brand restraint, virtue or honesty
- no more than one em-dash per paragraph
- no `actually`, `additionally`, `testament`, `landscape`, `showcasing`, `genuinely`, `truly` as intensifiers
- no marketing-punchy one-liners as section enders
- no scare-quoted antithesis (`the gap between "A" and "B"`)
- no copula-avoidance verbs (`serves as`, `boasts`, `features`, `showcases`, `delivers`, `empowers`)
- no signposting (`let's dive in`, `here's the thing`, `that's the deal`)
- no filler (`in order to`, `due to the fact that`)
- no significance inflation (`pivotal moment`, `critical juncture`, `the future of`)

Patterns that show up repeatedly across claim-check passes should be added to this list so the draft step stops producing them.

## Inline verification flag convention

When the draft makes a product-specific claim that has not been verified against source briefs or ground truth, mark it with an inline verification flag:

```
*[verification flag: confirm X against Y before publishing]*
```

This convention came out of real runs and is now expected in any first-pass draft that ships without fully verified product facts. The flag keeps the draft honest and makes the claim-check pass faster.

## Relationship to the rest of PageKit

- upstream: first-page decision
- downstream: proof map, first page draft, claim check

The proof map inherits this shape.
The draft should follow it and should not add sections the argument shape did not approve.
The claim check validates the draft against the drafting constraints defined here and flags any slop patterns as `ai-slop tell`.
