---
name: pagekit-claim-check
description: Run a skeptical claim-check pass on a PageKit first-page draft, at light/normal/hard severity. Step 07 of the PageKit method. Use after a first-page draft exists and you want to validate it before treating it as publishable. Delegates to the pagekit-claim-checker subagent.
---

# PageKit step 07 — Claim Check

You are running the optional durability pass on a first-page draft.

## Read first
- `./references/prompt.md`
- `./references/framework.md` — claim-check flag types, severity calibration, principle
- `./references/template.md`
- `../pagekit/references/anti-slop.md` — the slop pattern catalog

## Inputs
- `runs/<run-name>/first-page-draft.md`
- `runs/<run-name>/proof-map.md`
- Severity: light, normal, or hard. Ask the user if not specified; default to `normal`.

## Procedure

### Option A — delegate to the subagent (preferred)
Invoke the `pagekit-claim-checker` subagent (`agents/pagekit-claim-checker.md`). Pass:
- the path to the draft
- the path to the proof map
- the severity

The subagent runs read-only, produces the audit, and writes:
- `runs/<run-name>/claim-check.md` — the audit (flagged lines, types, rewrites, recurring patterns)
- `runs/<run-name>/first-page-draft-corrected.md` — the corrected draft (only if any line was rewritten)

### Option B — run inline
Use `scripts/claim-check.sh <draft> <proof-map> --severity <severity>` to expand the canonical prompt for paste. Save outputs to the same paths.

## After the pass
1. Save the audit and corrected draft.
2. Update `working-log.md` with the severity used, count of flags by type, and any recurring patterns.
3. **If the same slop pattern showed up more than once,** add it to `../pagekit/references/anti-slop.md` (or strengthen the existing entry) and to `../pagekit-page-argument-shape/references/template.md`'s drafting-constraints list. The framework absorbs what the claim-check kept catching.

## Quality gate
A strong claim-check pass:
- names specific lines, not general impressions
- separates claim types (overclaim / vague / unsupported / outrun proof map / editorial voice / unsourced quantitative / clinical drift / ai-slop tell)
- proposes replacements that are sharper and more accurate than the originals, not simply softer
- ends with a recurring-patterns summary so upstream constraints can absorb them

## Next
Do not stop at claim-check. Continue:

1. Write `runs/<name>/evaluation.md` — the run's own honest read of what worked, what stayed thin, where outputs drifted generic.
2. Invoke **`pagekit-evaluator-pass`** to produce the adversarial second read.
3. Ensure `runs/<name>/working-log.md` has real entries per step (replace all scaffold `*[Fill in]*` placeholders).
4. Invoke **`pagekit-run-check`** — it must return `tier: FULLY LOGGED` or `tier: PUBLISHABLE` before the run is done.
