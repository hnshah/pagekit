# Prompt 07 — Claim Check (hard)

## Step
07 — Claim check

## Objective
Run a skeptical, hard-severity claim-check pass over the first-page draft, then produce a corrected draft.

## Model
Claude (Claude Code, Opus 4.6)

## Severity
Hard. Flag anything that even slightly outruns the product brief, mechanism brief or proof brief. Flag anything that reads as editorial voice in a page whose job is to show the work.

## Inputs used
- first-page-draft.md
- proof-map.md
- sources/02-product-brief.md
- sources/04-mechanism-brief.md
- sources/05-proof-brief.md

## Prompt

```text
Review the draft below as a skeptical claim check at high severity.

For every claim that sounds stronger than the product, the mechanism brief or the proof map supports, flag it.
Also flag any editorial voice that a show-the-work page should not carry.
Also flag any phrasing that could be read as legal, regulatory or clinical advice.

For each flagged claim, give:
1. the exact line
2. the type (overclaim, vague, unsupported, outruns proof map, editorial voice, regulatory/clinical drift)
3. why it is weak
4. a sharper, more accurate replacement, or a recommendation to cut

Then produce a corrected draft that resolves every flagged claim.

Do not reward defensiveness. Precision over intensity. If a corrected line feels smaller, that is usually correct.

Draft:
[first-page-draft.md pasted]

Proof map:
[proof-map.md pasted]

Product brief, mechanism brief, proof brief:
[pasted in full]
```
