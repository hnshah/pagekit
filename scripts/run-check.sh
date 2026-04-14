#!/usr/bin/env bash
# run-check.sh — validate a PageKit run folder against the logging tiers.
#
# Usage:
#   scripts/run-check.sh <run-path>
#
# Classifies the run as fully-logged, summary-logged, artifact-only, or
# incomplete, per frameworks/run-logging.md. Lists missing files for the
# highest tier not met.
#
# Exit code:
#   0  fully-logged
#   0  summary-logged (also treated as valid)
#   1  artifact-only or incomplete

set -u

if [ "$#" -lt 1 ]; then
  echo "usage: scripts/run-check.sh <run-path>" >&2
  exit 2
fi

RUN="$1"

if [ ! -d "$RUN" ]; then
  echo "error: $RUN is not a directory" >&2
  exit 2
fi

# Expected files per tier (kept in sync with pagekit.yaml's run_logging section).
FULLY_LOGGED_FILES=(
  "goal.md"
  "working-log.md"
  "models.md"
  "evaluation.md"
  "evaluator-pass.md"
)
FULLY_LOGGED_DIRS=(
  "sources"
  "prompts"
  "outputs"
)
FULLY_LOGGED_ARTIFACTS=(
  "signal-doc.md"
  "message-spine.md"
  "first-page-decision.md"
  "page-argument-shape.md"
  "proof-map.md"
  "first-page-draft.md"
)
# The 7 per-step prompt files expected inside prompts/ and their paired outputs.
STEP_SLUGS=(
  "01-signal-doc"
  "02-message-spine"
  "03-first-page-decision"
  "04-page-argument-shape"
  "05-proof-map"
  "06-first-page-draft"
  "07-claim-check"
)

SUMMARY_FILES=(
  "goal.md"
  "working-log.md"
  "models.md"
  "evaluation.md"
)
SUMMARY_ARTIFACTS=(
  "signal-doc.md"
  "message-spine.md"
  "first-page-decision.md"
  "page-argument-shape.md"
  "proof-map.md"
  "first-page-draft.md"
)

missing_fully=()
missing_summary=()

# Check fully-logged requirements.
for f in "${FULLY_LOGGED_FILES[@]}"; do
  [ -f "$RUN/$f" ] || missing_fully+=("missing file: $f")
done
for d in "${FULLY_LOGGED_DIRS[@]}"; do
  [ -d "$RUN/$d" ] || missing_fully+=("missing dir: $d/")
done
for a in "${FULLY_LOGGED_ARTIFACTS[@]}"; do
  [ -f "$RUN/$a" ] || missing_fully+=("missing artifact: $a")
done
# Per-step prompt/output pairing.
for s in "${STEP_SLUGS[@]}"; do
  p="$RUN/prompts/${s}.md"
  o="$RUN/outputs/${s}-output.md"
  [ -f "$p" ] || missing_fully+=("missing prompt: prompts/${s}.md")
  [ -f "$o" ] || missing_fully+=("missing output: outputs/${s}-output.md")
done

# Check summary-logged requirements.
for f in "${SUMMARY_FILES[@]}"; do
  [ -f "$RUN/$f" ] || missing_summary+=("missing file: $f")
done
for a in "${SUMMARY_ARTIFACTS[@]}"; do
  [ -f "$RUN/$a" ] || missing_summary+=("missing artifact: $a")
done

# Any of the 6 core artifacts present → at least "artifact-only."
artifact_count=0
for a in "${SUMMARY_ARTIFACTS[@]}"; do
  [ -f "$RUN/$a" ] && artifact_count=$((artifact_count + 1))
done

echo "run-check: $RUN"
echo

if [ "${#missing_fully[@]}" -eq 0 ]; then
  echo "tier: FULLY LOGGED"
  exit 0
fi

if [ "${#missing_summary[@]}" -eq 0 ]; then
  echo "tier: SUMMARY LOGGED"
  echo
  echo "This run does not meet fully-logged. Missing for fully-logged:"
  for m in "${missing_fully[@]}"; do
    echo "  - $m"
  done
  exit 0
fi

if [ "$artifact_count" -gt 0 ]; then
  echo "tier: ARTIFACT-ONLY"
  echo
  echo "This run does not meet summary-logged. Missing for summary-logged:"
  for m in "${missing_summary[@]}"; do
    echo "  - $m"
  done
  echo
  echo "Missing for fully-logged (in addition to the above):"
  # Print the fully-logged items that are not already in summary-logged.
  for m in "${missing_fully[@]}"; do
    found=0
    for sm in "${missing_summary[@]}"; do
      if [ "$m" = "$sm" ]; then found=1; break; fi
    done
    [ "$found" -eq 0 ] && echo "  - $m"
  done
  exit 1
fi

echo "tier: INCOMPLETE (no core artifacts found)"
echo
echo "Expected at least one of:"
for a in "${SUMMARY_ARTIFACTS[@]}"; do
  echo "  - $a"
done
exit 1
