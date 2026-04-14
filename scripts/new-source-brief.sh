#!/usr/bin/env bash
# new-source-brief.sh — scaffold a single source brief inside a run.
#
# Usage:
#   scripts/new-source-brief.sh <run-name> <brief-type>
#
# <brief-type> is one of:
#   wedge         — wedge-definition brief (when signal is still category-level)
#   mechanism     — mechanism brief (how the product does what it claims)
#   proof         — proof brief (what evidence exists; what does not)
#   comparison    — comparison brief (what the product is and is not compared to)
#
# Creates runs/<run-name>/sources/NN-<brief-type>-brief.md where NN is the
# next available number in the sources/ folder (02 and up; 01 is source-capture).
#
# Scripted source briefs keep runs structurally consistent and stop agents
# from reconstructing brief layouts from memory on every run.

set -euo pipefail

usage() {
  cat <<EOF >&2
usage: scripts/new-source-brief.sh <run-name> <brief-type>

brief-type options:
  wedge         wedge-definition brief
  mechanism     mechanism brief
  proof         proof brief
  comparison    comparison brief

examples:
  scripts/new-source-brief.sh kind-bowl wedge
  scripts/new-source-brief.sh kind-bowl mechanism
EOF
  exit 2
}

[ "$#" -eq 2 ] || usage

RUN_NAME="$1"
BRIEF="$2"

case "$BRIEF" in
  wedge|mechanism|proof|comparison) ;;
  *) usage ;;
esac

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RUN_DIR="$REPO_ROOT/runs/$RUN_NAME"
SRC_DIR="$RUN_DIR/sources"

[ -d "$RUN_DIR" ] || { echo "error: run folder not found: $RUN_DIR" >&2; exit 1; }
[ -d "$SRC_DIR" ] || { echo "error: sources/ not found in $RUN_DIR; scaffold the run first with new-run.sh" >&2; exit 1; }

# Pick the next two-digit index. Start at 02 (01 is reserved for source-capture).
next_index() {
  local max=1
  local f n
  # shellcheck disable=SC2045
  for f in $(ls "$SRC_DIR" 2>/dev/null); do
    n="$(echo "$f" | grep -Eo '^[0-9]{2}' || true)"
    [ -z "$n" ] && continue
    # strip leading zero for arithmetic
    n="$((10#$n))"
    [ "$n" -gt "$max" ] && max="$n"
  done
  printf "%02d" $((max + 1))
}

INDEX="$(next_index)"
OUT="$SRC_DIR/${INDEX}-${BRIEF}-brief.md"

# Canonical content per brief type. Kept in one place so the four briefs stay consistent.
case "$BRIEF" in

  wedge)
    cat > "$OUT" <<EOF
# Wedge Definition Brief

*[Use this brief when the signal doc is still too category-level to support a strong message spine. Commit to a concrete wedge that narrows the object for this run.]*

## Working decision
*[Treat this product as a \_\_\_ for \_\_\_. One sharp sentence.]*

## First audience hypothesis
Primary:
- *[Who feels this pain most directly?]*
- *[Who should the first page be for?]*

Secondary (explicitly not served yet):
- *[Audiences the first page is not for. Narrow on purpose.]*

## Sharp pain framing
The pain is not "*[generic framing]*."
The pain is: "*[sharper framing the object actually addresses]*."

## What this is closer to
- *[Comparable category, positioning, or object type — be concrete]*

## What this is farther from
- *[What this is not, and why the distinction matters]*

## First-page implication
The first page should optimize for:
- *[X]*
- *[Y]*

Do not assume this page is a homepage.

## Claims we still cannot make
- *[Claim we would like to make but cannot defend yet]*
- *[Claim that overstates the mechanism]*
- *[Claim that needs data the run does not yet have]*
EOF
    ;;

  mechanism)
    cat > "$OUT" <<EOF
# Mechanism Brief

*[Use this brief when the trust question hinges on HOW the product does what it claims. The mechanism cannot be hand-waved — spell it out in terms specific enough to defend.]*

## Why this brief exists
*[The mechanism is the core trust question. Name it.]*

## The mechanism in plain language

### 1. Formulation / composition / architecture target
*[What standard or spec is the product built against? AAFCO, SOC 2, WCAG, a specific codified standard. Name it.]*

### 2. What the mechanism specifically does
*[Three to six specific behaviors or components. Each one concrete enough that a skeptical reader could verify it against reality.]*

- *[Behavior / component 1]*
- *[Behavior / component 2]*
- *[Behavior / component 3]*

### 3. Verification
*[How is the mechanism checked? Third-party test? Audit? Internal QA with a specific cadence?]*

### 4. Who designed it
*[Credentialed person or team. Specific role, not "our experts."]*

## What this mechanism does not do
*[Name the limits. The mechanism is defensible because it is narrow.]*

## Language the page can earn
- *[Claim 1 the mechanism supports]*
- *[Claim 2 the mechanism supports]*

## Language the page cannot earn
- *[Adjacent claim the mechanism does NOT support]*
- *[Category-level claim that exceeds what this mechanism actually does]*
EOF
    ;;

  proof)
    cat > "$OUT" <<EOF
# Proof Brief

*[Use this brief to name what proof exists today and what does not. The proof map (step 05) will commit to specific lines based on what is in here.]*

## What the product has as proof today

### Formulation / design-level proof
- *[Built to standard X]*
- *[Reviewed by credentialed person Y]*

### Testing / validation-level proof
- *[Third-party test of Z, against criterion W]*
- *[Per-batch / per-release verification]*

### People-level proof
- *[Named credential of someone involved, with their role]*

## What the product does not have

### Testing / validation
- *[No formal trial / audit / study of the specific outcome we would most want to claim]*

### Long-term outcome data
- *[No longitudinal data on what happens over time]*

### Broad endorsement
- *[No general endorsement beyond named individuals]*

### Customer / user proof
- *[No meaningful corpus of testimonials, reviews, or case studies yet]*

## What this means for the first page

### Safe proof moves
- *[Name the specific standard met]*
- *[Name the credential, not a generic "expert-approved" phrase]*
- *[Name the testing practice — what, how often, against what criterion]*

### Unsafe proof moves
- *[Bare "approved" or "backed by science" without naming who or what]*
- *[Outcome claims without outcome data]*

### Honest acknowledgements the page can make
- *[Scope limits the product honestly ships with]*
- *[What the product is not for]*
EOF
    ;;

  comparison)
    cat > "$OUT" <<EOF
# Comparison Brief

*[Use this brief to name what the product is implicitly compared against and where it honestly sits. Keeps the page from drifting into defensive or overreaching positioning.]*

## What the product is implicitly compared against

### The dominant incumbent
- *[The default choice most buyers compare this against]*
- *[What it does well; what it does poorly]*
- *[This product's honest positioning vs. the incumbent]*

### Direct competitors in the same category
- *[A handful of real comparable offerings]*
- *[What varies: positioning, mechanism, trust level, audience]*
- *[This product's honest positioning in the subset — specific differences, not gestures]*

### Adjacent categories that serve a related job
- *[A category that solves a similar-shaped problem differently]*
- *[Why this product is NOT in that category and should not be confused with it]*

### Disqualifying comparisons
- *[Categories or products this should not be compared against]*
- *[Why the comparison would be misleading]*

## What this product should not do
- *[Frame itself as superior on dimensions it has not validated]*
- *[Claim specific-checkable differences it cannot specifically check]*
- *[Be forced into a category it is deliberately not in]*

## What the first page can fairly claim as comparative framing
- *[Claim 1 — specific and checkable]*
- *[Claim 2 — specific and checkable]*

These are specific, checkable, and narrower than category-average marketing.
EOF
    ;;

esac

echo "Scaffolded $OUT"
echo
echo "Next steps:"
echo "  1. Fill in the bracketed sections with the object's ground truth."
echo "  2. If the run already has a signal doc, rerun step 01 (or refine it) with this brief in the inputs."
echo "  3. Run \`scripts/run-check.sh runs/$RUN_NAME\` when the run is complete."
