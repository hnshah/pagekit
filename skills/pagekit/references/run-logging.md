# Run Logging Framework

Every serious PageKit run should log the work as it happens.

## Two logging levels

### Fully logged
A fully logged run must include:
- goal
- working log
- models used
- sources (the source briefs used as ground truth)
- prompts (per step)
- outputs (per step, raw)
- final artifacts (signal doc, message spine, first-page decision, page argument shape, proof map, first page draft, claim check, plus the corrected draft if claim check rewrote any lines)
- evaluation
- evaluator pass (skeptical, adversarial review after the run)

All of these are required. An evaluator pass is not optional at this tier; a run without one is summary-logged.

Use this level for runs meant as validation evidence or reusable examples.

### Summary logged
A summary-logged run includes:
- goal
- working log
- models used
- final artifacts
- evaluation

It does not preserve the per-step prompts and raw outputs.
It is cheaper to produce but less inspectable.
Do not call a summary-logged run a validation run without flagging that distinction.

## For every step, capture (when fully logging)
- what step this is
- objective
- model used
- exact prompt
- inputs used
- raw output
- short judgment
- what changed before the next step

## Inline verification flag convention

When a draft makes a product-specific claim that has not been verified against source briefs or ground truth, the convention is to mark it inline with:

```
*[verification flag: confirm X against Y before publishing]*
```

This convention came out of real runs. It keeps first-pass drafts honest and makes the claim-check pass faster. A first-pass draft that ships without any verification flags on product-specific claims is suspect.

## Why this matters
This is not overhead.
This is how PageKit turns a run into reusable evidence.
Without this layer, examples become hard to trust and hard to learn from.

## Mechanized run creation

Use the scripts. Hand-rolling a run folder is the most common place fully-logged tier slips.

```sh
scripts/new-run.sh <run-name>      # scaffold a fully-logged folder
scripts/run-check.sh runs/<name>   # validate the folder against this framework
```

Or via make:

```sh
make new-run NAME=<run-name>
make run-check RUN=<run-name>
```

`scripts/new-run.sh` must stay in sync with the fully_logged tier above. If this framework changes, update the script too.

`scripts/run-check.sh` exits 0 if the run is fully-logged or summary-logged, exits 1 if artifact-only or incomplete. Wire it into your end-of-run checklist.

## Related
- `./anti-slop.md` — hard no-go patterns for drafts produced by any run
- `scripts/slop-check.sh` — regression check a run's draft should pass
- `scripts/new-run.sh`, `scripts/run-check.sh` — mechanized scaffold and validation
- `./method.md` — the canonical method manifest the skills read from
