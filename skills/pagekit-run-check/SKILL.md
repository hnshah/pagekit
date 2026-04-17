---
name: pagekit-run-check
description: Validate a PageKit run folder against the logging tiers (fully-logged / summary-logged / artifact-only / incomplete). Wraps scripts/run-check.sh. Use at the end of a run to confirm the fully-logged tier is met before declaring done.
---

# PageKit — Validate a Run

Wraps `scripts/run-check.sh`. Reads a run folder and classifies it per `../pagekit/references/run-logging.md`. Lists missing files for the next tier up.

## Procedure
1. Run: `bash scripts/run-check.sh runs/<run-name>`.
2. If the result is **FULLY LOGGED**, report success.
3. If the result is **SUMMARY LOGGED** or below, list the missing items to the user and propose what to fill in to reach fully-logged.

## When to invoke
- At the end of any run produced via the `pagekit` orchestrator skill.
- Before treating a run as validation evidence or as a public example.
- When picking up an existing run to extend.

## Hard rule
Do not declare a run "done" if `pagekit-run-check` returns anything other than FULLY LOGGED. The whole point of mechanized checks is to stop logging from being the part that gets skipped.
