# Run Logging Framework

Every serious PageKit run should log the work as it happens.

## Two logging levels

### Fully logged
A fully logged run must include:
- goal
- working log
- models used
- prompts (per step)
- outputs (per step, raw)
- final artifacts
- evaluation
- evaluator pass (skeptical review after the run)

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
