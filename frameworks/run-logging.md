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
- final artifacts (signal doc, message spine, first-page decision, page argument shape, proof map, first page draft, claim check — plus the corrected draft if claim check rewrote any lines)
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

## Why this matters
This is not overhead.
This is how PageKit turns a run into reusable evidence.
Without this layer, examples become hard to trust and hard to learn from.
