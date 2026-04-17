---
name: pagekit-new-run
description: Scaffold a new fully-logged PageKit run folder by name. Wraps scripts/new-run.sh. Use when starting any PageKit run; prefer this over creating run folders by hand so structure stays consistent with the run-logging framework.
---

# PageKit — Scaffold a New Run

Wraps `scripts/new-run.sh`. Creates `runs/<run-name>/` with the full fully-logged layout: goal, models, working-log, sources/README, prompts/01-07-*.md (copied from the canonical per-step prompts), outputs/NN-*-output.md placeholders, per-step artifact placeholders, evaluation and evaluator-pass templates.

## Read first
- `../pagekit/references/run-logging.md` — the fully-logged tier definition
- `../pagekit/references/method.md` — the method at a glance

## Procedure
1. Confirm the run name with the user. Use a slug (lowercase, hyphenated).
2. Run: `bash scripts/new-run.sh <run-name>`.
3. Tell the user where the scaffold landed and what to fill next (`goal.md` and `sources/`).

## Why use this skill instead of the script directly
- The conversation logs the choice and the name, which helps later when the run is reviewed.
- It is the on-ramp to `pagekit` (the orchestrator skill) for a complete run.

## Failure modes
- `runs/<run-name>` already exists → suggest a different name.
- Repo not at the root → `cd` to the repo root and retry.

## Next
Hand off to the `pagekit` orchestrator, or invoke `pagekit-signal-doc` directly if the user wants to drive step by step.
