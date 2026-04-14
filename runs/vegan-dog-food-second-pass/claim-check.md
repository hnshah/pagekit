# Claim Check — Second Pass

## Page
Kind Bowl nutritional-adequacy page.

## Severity
Hard.

## Claims flagged

| # | Line (excerpt) | Type | Action |
|---|---|---|---|
| 1 | "most adult dog foods in the US" | unsourced quantitative modifier | narrow |
| 2 | "a six-month AAFCO feeding trial" | outruns proof map (unsourced duration) | narrow |
| 3 | "We think that distinction matters, so we say it on the first page." | editorial voice | cut |
| 4 | "residency in clinical nutrition and passed the ACVN board exam" | outruns proof map (external-credential specifics) | narrow |
| 5 | "most commonly cited" / "generalist vet" | vague + editorial voice | cut |
| 6 | "not a real regulatory status..." | editorial voice + regulatory drift | cut |
| 7 | "relevant to heart muscle health in dogs" | clinical drift | rewrite |
| 8 | "D2 is not well-utilized by dogs" | clinical drift / outruns proof map | cut |
| 9 | "If you are not yet ready for that, you should not have to go there." | editorial voice | cut |

## Strongest remaining risks
- The model's reflex to soften with "most" and to describe external credentials in detail will recur in future drafts. This is a prompt-level pattern the claim-check framework should name.
- Editorial voice (claims 3, 5, 6, 9) is a distinct pattern worth a dedicated label: the brand narrating its own restraint instead of showing the work.

## Where proof is the real gap
None. The proof map held. All flags were about precision and voice, not missing proof. This is a meaningful and slightly surprising result given how thin the first-pass proof was; the addition of mechanism, proof and comparison briefs in this run closed the gap.

## Upstream artifact to repair
None for this run.
For the repo: the claim-check framework and template should name two new flag types:
- **editorial voice** (brand narrating its own restraint)
- **unsourced quantitative modifier** (most / usually / typically without support)

## Corrected draft
See `first-page-draft-corrected.md` for the post-claim-check version of the page.
