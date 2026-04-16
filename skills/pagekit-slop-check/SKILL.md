---
name: pagekit-slop-check
description: Run the heuristic AI-slop regression check on PageKit drafts. Wraps scripts/slop-check.sh. Use before and after the claim-check step, and any time you want to sanity-check a draft for the mechanically detectable slop patterns.
---

# PageKit — Slop Check

Wraps `scripts/slop-check.sh`. Heuristic regression check covering the mechanically detectable subset of `../pagekit/references/anti-slop.md`: Not-X-Not-Y headings and sentences, em-dash stacking, "actually" intensifier, copula avoidance, signposting, filler, significance inflation, anaphora, rule-of-three short-sentence clustering, intensifier vocabulary, quoted antithesis.

## Read first
- `../pagekit/references/anti-slop.md` — the authoritative pattern catalog

## Procedure
1. Run: `bash scripts/slop-check.sh [paths...]`. With no args, scans every `homepage-draft.md` / `first-page-draft.md` / `first-page-draft-corrected.md` under `runs/`.
2. If any pattern fires, report the file:line and the pattern name.
3. For each hit, propose a rewrite or recommend cutting the line.
4. Re-run until clean.

## When to invoke
- Right after `pagekit-first-page-draft` produces a draft, before invoking `pagekit-claim-check`.
- After the corrected draft is produced by claim-check.
- Anytime a user asks "does this read like AI?"

## Hard rule
Do not advance to the claim-check step until slop-check is clean on the draft. The claim-check should focus on semantic issues; the slop-check should have already cleared the obvious cadence problems.

## Limits
The script is heuristic. It will flag false positives (some rule-of-three clusters carry real content; some uses of "actually" are correct). Use judgement; do not blindly rewrite. The script's job is to surface lines worth looking at.
