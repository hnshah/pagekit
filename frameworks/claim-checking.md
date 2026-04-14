# Claim Checking Framework

Claim checking is the durability layer.
It runs after the first page draft exists.

## What it is for

Finding claims that:
- overclaim what the product actually does
- sound specific but are actually vague
- are not supported by the proof map
- outrun the mechanism the product can honestly explain
- narrate brand restraint instead of showing the work
- carry unsourced quantitative modifiers
- read as machine-written regardless of whether they are accurate

## What it is not for

- polishing language
- defending existing claims
- adding new marketing intensity

## Claim types to flag

- **overclaim** — the claim is stronger than the product reality
- **vague claim** — the claim sounds concrete but resists being checked
- **unsupported claim** — the claim is plausible but proof is missing
- **outrun claim** — the claim needs proof the proof map did not commit to
- **editorial voice** — the brand narrates its own restraint, virtue or honesty instead of demonstrating it. A show-the-work page earns trust by showing the work, not by announcing that it is showing the work.
- **unsourced quantitative modifier** — `most`, `usually`, `typically`, `often`, `many` without a source to anchor the quantity. At hard severity, any unsourced quantity is a flag.
- **clinical or regulatory drift** — phrasing that reads as clinical, nutritional, legal or regulatory advice when the briefs do not support it.
- **ai-slop tell** — the line carries one of the patterns in `frameworks/anti-slop.md` (negation stacking, rule-of-three clustering, anaphora, em-dash stacking, intensifier vocabulary, marketing-punchy ender, quoted antithesis, copula avoidance, signposting, filler, significance inflation). Slop lowers reader trust in every other claim on the page, which makes it a proof issue, not only a voice issue.

## Severity calibration

Pick the severity level deliberately and log the choice.

- **light** — flag only clear overclaims, unsupported claims and the strongest slop tells.
- **normal** — flag the full list above, but tolerate mild editorial voice and `most-scale` modifiers where they sit inside common usage.
- **hard** — flag any unsourced modifier, any editorial voice, any clinical drift, any external-credential description beyond what the briefs support, any slop pattern however small.

Record the severity used in the run log. A claim check run at one severity is not comparable to one run at another.

## Principle

A claim should get stronger when it is corrected, not weaker.
Precision usually beats intensity.
If a corrected claim feels smaller, the original was probably doing more work than it earned.

## Relationship to the rest of PageKit

- signal doc names the language worth preserving
- message spine decides which truths carry the page
- proof map commits to what the page can defend
- page argument shape defines drafting constraints, including the anti-slop rules
- claim checking is how the draft is held to those commitments

When claim checking surfaces a real gap, the fix usually lives upstream in the proof map or the source briefs, not in the copy.

## Upstream absorption

If a pattern shows up in claim checking on every run (for example, editorial voice or rule-of-three cadence on every page), the fix belongs in the page-argument-shape drafting constraints and in `frameworks/anti-slop.md`, not in the claim-check step. Claim checking is a safety net. It should not be the primary place a category of problems gets caught.

## Relation to the slop-check script

`scripts/slop-check.sh` is a fast grep-level regression check for slop patterns. It runs before claim-check, catches the obvious cases, and fails fast so the claim-check pass can focus on semantic issues. The script is not a replacement for this step; it is a filter that removes the mechanical tells before the harder review begins.
