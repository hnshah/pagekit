#!/usr/bin/env bash
# new-run.sh — scaffold a fully-logged PageKit run folder.
#
# Usage:
#   scripts/new-run.sh <run-name>
#
# Creates runs/<run-name>/ with the full fully-logged layout per
# frameworks/run-logging.md. All files start as placeholders and carry
# instructions on what to fill in.
#
# The scaffold matches pagekit.yaml's fully_logged tier. If pagekit.yaml
# changes, update this script.

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "usage: scripts/new-run.sh <run-name>" >&2
  echo "example: scripts/new-run.sh kind-bowl-second" >&2
  exit 2
fi

RUN_NAME="$1"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RUN_DIR="$REPO_ROOT/runs/$RUN_NAME"

if [ -e "$RUN_DIR" ]; then
  echo "error: $RUN_DIR already exists" >&2
  exit 1
fi

mkdir -p "$RUN_DIR/sources" "$RUN_DIR/prompts" "$RUN_DIR/outputs"

# ----- goal.md ------------------------------------------------------------
cat > "$RUN_DIR/goal.md" <<EOF
# Goal

*[Fill in: one paragraph on what this run is for. Name the object, the intended output (a first page draft on X), and why this run exists — new validation, follow-up to a prior run, test of a specific step, etc.]*

## Success conditions

We finish this run with:
- a fully logged run per \`frameworks/run-logging.md\` (fully logged tier)
- a signal doc, message spine, first-page decision, page argument shape, proof map, first page draft
- a claim-check pass with severity recorded
- an honest evaluation naming what stayed thin
- an evaluator pass that stress-tests the run from a skeptical angle

## Non-goals

- *[List things this run is explicitly not trying to accomplish.]*

## Object

*[Fill in: the object. If fictional, commit to concrete facts in sources/02-product-brief.md. No [Product name] placeholders in source briefs.]*
EOF

# ----- models.md ----------------------------------------------------------
cat > "$RUN_DIR/models.md" <<EOF
# Models Used

## Run session
*[Fill in: single-model / multi-model. Single session or multiple.]*

## Model(s)
*[Fill in: specific model name and version. e.g., Claude (Claude Code, Opus 4.6).]*

## Settings
- default settings for the session (unless noted)
- no external tools, no web search, no retrieval augmentation (unless noted)
- all context is in \`sources/\`, prior-step artifacts, and the prompt

## Date
*[YYYY-MM-DD]*
EOF

# ----- working-log.md -----------------------------------------------------
cat > "$RUN_DIR/working-log.md" <<EOF
<!--
DO NOT DELETE. This file is required for the fully-logged tier per
frameworks/run-logging.md. Fill in the entries as you work through the
steps; do not leave the \`*[Fill in]*\` placeholders intact at the end.
The orchestrator skill's "Are you done?" self-check requires real log
entries across every step, not just the scaffold.
-->
# Working Log

Chronological notes. Each entry marks a step transition or a mid-step decision.

## Start
- branched off \`main\` at commit *[hash]*
- source-brief state: *[fresh / carried from prior run]*

## Step 01 — signal doc
- *[Fill in as the step runs]*

## Step 02 — message spine
- *[Fill in]*

## Step 03 — first-page decision
- *[Fill in: candidates considered, rejected, chosen, why]*

## Step 04 — page argument shape
- *[Fill in]*

## Step 05 — proof map
- *[Fill in]*

## Step 06 — first page draft
- *[Fill in]*

## Step 07 — claim check
- severity: *[light / normal / hard]*
- *[Fill in: number of flags, categories, outcome]*

## Evaluation
- *[Fill in]*

## Evaluator pass
- *[Fill in]*
EOF

# ----- sources/README.md --------------------------------------------------
cat > "$RUN_DIR/sources/README.md" <<EOF
# Sources

Source briefs for this run. Every brief here is ground truth; the run is not allowed to make claims the briefs do not support.

## Expected files

Minimum:
- \`01-source-capture.md\` — what raw material we have and what we need
- \`02-product-brief.md\` — the product in concrete terms

Recommended for trust-heavy objects:
- \`03-wedge-definition-brief.md\`
- \`04-mechanism-brief.md\`
- \`05-proof-brief.md\`
- \`06-comparison-brief.md\`

For templates see \`templates/wedge-definition-template.md\` and the pattern established in \`runs/vegan-dog-food-verdel/sources/\`.
EOF

# ----- prompts/ placeholders ----------------------------------------------
# Copy the canonical prompts into the run with a note at the top.
CANONICAL_PROMPTS=(
  "01-signal-doc.md"
  "02-message-spine.md"
  "03-first-page-decision.md"
  "04-page-argument-shape.md"
  "05-proof-map.md"
  "06-first-page-draft.md"
  "07-claim-check.md"
)
for p in "${CANONICAL_PROMPTS[@]}"; do
  dst="$RUN_DIR/prompts/$p"
  cat > "$dst" <<EOF
<!--
This file starts as a copy of prompts/$p (the canonical prompt for this step).
When you run the step:
1. Substitute the required inputs into the prompt.
2. Save the version you actually sent to the model here.
3. Save the raw output to outputs/$(echo "$p" | sed 's/\.md$/-output.md/').
-->

EOF
  cat "$REPO_ROOT/prompts/$p" >> "$dst"
done

# ----- outputs/ placeholders ----------------------------------------------
for p in "${CANONICAL_PROMPTS[@]}"; do
  out_name="$(echo "$p" | sed 's/\.md$/-output.md/')"
  cat > "$RUN_DIR/outputs/$out_name" <<EOF
# Raw Output: $p

## Model
*[Fill in]*

## Raw output (as produced)

*[Paste the raw model output here, unedited. The distilled artifact goes in the run root (e.g., signal-doc.md).]*
EOF
done

# ----- final artifact placeholders ---------------------------------------
cat > "$RUN_DIR/signal-doc.md" <<EOF
# Signal Doc

*[Filled in by step 01. See \`frameworks/signal-doc.md\` and \`templates/signal-doc-template.md\`.]*
EOF

cat > "$RUN_DIR/message-spine.md" <<EOF
# Message Spine

*[Filled in by step 02. See \`frameworks/message-spine.md\` and \`templates/message-spine-template.md\`.]*
EOF

cat > "$RUN_DIR/first-page-decision.md" <<EOF
# First-Page Decision

*[Filled in by step 03. Do not assume homepage. List candidates considered and rejected. See \`frameworks/first-page-decision.md\` and \`templates/first-page-decision-template.md\`.]*
EOF

cat > "$RUN_DIR/page-argument-shape.md" <<EOF
# Page Argument Shape

*[Filled in by step 04. Structure comes from the object, not category habit. Include drafting constraints, including anti-slop rules. See \`frameworks/page-argument-shape.md\` and \`templates/page-argument-shape-template.md\`.]*
EOF

cat > "$RUN_DIR/proof-map.md" <<EOF
# Proof Map

*[Filled in by step 05. Commit to what can be said; name what cannot. See \`frameworks/proof-map.md\` and \`templates/proof-map-template.md\`.]*
EOF

cat > "$RUN_DIR/first-page-draft.md" <<EOF
# First Page Draft

*[Filled in by step 06. Respect the anti-slop rules in \`frameworks/anti-slop.md\`. Mark unverified product-specific claims with \`*[verification flag: ...]*\`. See \`frameworks/page-argument-shape.md\` for drafting constraints.]*
EOF

cat > "$RUN_DIR/claim-check.md" <<EOF
<!--
DO NOT DELETE. This file is required for the PUBLISHABLE tier per
frameworks/run-logging.md. Fill it in when you run step 07 (claim-check).
Use the \`pagekit-claim-check\` skill — it delegates to the
\`pagekit-claim-checker\` subagent which will replace this placeholder
content with the real audit.
-->
# Claim Check

## Severity
*[light / normal / hard — record the choice and why]*

*[Filled in by step 07. See \`frameworks/claim-checking.md\` and \`templates/claim-check-template.md\`. If any line is rewritten, also save \`first-page-draft-corrected.md\`.]*
EOF

# ----- evaluation.md -----------------------------------------------------
cat > "$RUN_DIR/evaluation.md" <<EOF
<!--
DO NOT DELETE. This file is required for the fully-logged tier per
frameworks/run-logging.md. Fill it in after step 07. This is the run's
own honest read of what worked, what stayed thin, where outputs drifted
generic. The adversarial voice goes in evaluator-pass.md (written
afterward via the pagekit-evaluator-pass skill).
-->
# Evaluation

## Logging level
Fully logged per \`frameworks/run-logging.md\`.

## What worked
- *[Fill in]*

## What felt weak
- *[Fill in]*

## What stayed thin
- *[Fill in]*

## Where outputs drifted generic
- *[Fill in]*

## Publication readiness checklist
What is still missing before this page can publish:
- *[Name specific gaps: missing testimonials, unconfirmed claims, sections that need real data, etc.]*

## Added rigor layer
Evaluator pass included.

## Final run judgment
*[Fill in]*
EOF

# ----- evaluator-pass.md -------------------------------------------------
cat > "$RUN_DIR/evaluator-pass.md" <<EOF
<!--
DO NOT DELETE. This file is required for the fully-logged tier per
frameworks/run-logging.md. It carries the adversarial second read of
the run. Produce it by invoking the \`pagekit-evaluator-pass\` skill,
which delegates to the \`pagekit-evaluator-pass\` subagent and replaces
this placeholder with real content.
-->
# Evaluator Pass

Skeptical second read of the run. Not the same voice as \`evaluation.md\`; this pass is deliberately adversarial.

## Things the run is quietly claiming that deserve scrutiny

### 1. *[Claim]*
*[Evaluator reasoning]*

**Implication:** *[What this suggests for the method or the repo.]*

## Punch list for repo improvement
*[If the run exposed any gaps in templates, frameworks, or scripts, list them here. Apply them in a separate commit on the branch after the run is committed.]*

## Final evaluator read
*[One paragraph. Is the run real? What does it prove? What does it not prove?]*
EOF

# ----- done --------------------------------------------------------------
echo "Scaffolded runs/$RUN_NAME/ (fully-logged tier)."
echo
echo "Next steps:"
echo "  1. Fill runs/$RUN_NAME/goal.md and sources/"
echo "  2. Work through prompts/01 through 07"
echo "  3. Validate: scripts/run-check.sh runs/$RUN_NAME"
