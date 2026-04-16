#!/usr/bin/env bash
# claim-check.sh — expand the canonical claim-check prompt for pasting.
#
# Usage:
#   scripts/claim-check.sh <draft-path> <proof-map-path> [--severity hard|normal|light]
#
# Reads prompts/07-claim-check.md, substitutes {{SEVERITY}}, {{DRAFT}},
# and {{PROOF_MAP}}, prints the expanded prompt to stdout.
#
# This script does not call an LLM. Paste the output into the model of
# your choice, then save the model's response as claim-check.md and the
# corrected draft as first-page-draft-corrected.md inside the run folder.

set -euo pipefail

SEVERITY="normal"

usage() {
  cat <<EOF >&2
usage: scripts/claim-check.sh <draft-path> <proof-map-path> [--severity hard|normal|light]
EOF
  exit 2
}

if [ "$#" -lt 2 ]; then usage; fi

DRAFT="$1"
PROOF="$2"
shift 2

while [ "$#" -gt 0 ]; do
  case "$1" in
    --severity)
      [ "$#" -ge 2 ] || usage
      SEVERITY="$2"
      shift 2
      ;;
    --severity=*)
      SEVERITY="${1#--severity=}"
      shift
      ;;
    *)
      usage
      ;;
  esac
done

case "$SEVERITY" in
  light|normal|hard) ;;
  *) echo "error: severity must be light, normal, or hard (got: $SEVERITY)" >&2; exit 2 ;;
esac

[ -f "$DRAFT" ] || { echo "error: draft not found: $DRAFT" >&2; exit 2; }
[ -f "$PROOF" ] || { echo "error: proof map not found: $PROOF" >&2; exit 2; }

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
# Prefer the skill-bundled canonical prompt; fall back to legacy prompts/ during migration.
PROMPT_FILE_NEW="$REPO_ROOT/skills/pagekit-claim-check/references/prompt.md"
PROMPT_FILE_OLD="$REPO_ROOT/prompts/07-claim-check.md"
if [ -f "$PROMPT_FILE_NEW" ]; then
  PROMPT_FILE="$PROMPT_FILE_NEW"
elif [ -f "$PROMPT_FILE_OLD" ]; then
  PROMPT_FILE="$PROMPT_FILE_OLD"
else
  echo "error: canonical claim-check prompt not found at $PROMPT_FILE_NEW or $PROMPT_FILE_OLD" >&2
  exit 1
fi

# Extract the body of the ```text fenced block from the prompt file.
# The canonical prompt has exactly one ```text block.
PROMPT_BODY="$(awk '
  /^```text/ { inblock = 1; next }
  /^```/ && inblock { inblock = 0; exit }
  inblock { print }
' "$PROMPT_FILE")"

if [ -z "$PROMPT_BODY" ]; then
  echo "error: could not extract prompt body from $PROMPT_FILE" >&2
  exit 1
fi

DRAFT_CONTENT="$(cat "$DRAFT")"
PROOF_CONTENT="$(cat "$PROOF")"

# awk substitution avoids sed delimiter collisions with multi-line content.
output="$PROMPT_BODY"
output="${output//\{\{SEVERITY\}\}/$SEVERITY}"
# Use python for the large multi-line substitutions if available; fall back to awk otherwise.
if command -v python3 >/dev/null 2>&1; then
  export PAGEKIT_PROMPT_BODY="$output"
  export PAGEKIT_DRAFT="$DRAFT_CONTENT"
  export PAGEKIT_PROOF="$PROOF_CONTENT"
  python3 - <<'PY'
import os
body = os.environ["PAGEKIT_PROMPT_BODY"]
body = body.replace("{{DRAFT}}", os.environ["PAGEKIT_DRAFT"])
body = body.replace("{{PROOF_MAP}}", os.environ["PAGEKIT_PROOF"])
print(body)
PY
else
  # awk-only fallback: write content to temp files and stream through awk.
  DRAFT_TMP="$(mktemp)"; printf '%s' "$DRAFT_CONTENT" > "$DRAFT_TMP"
  PROOF_TMP="$(mktemp)"; printf '%s' "$PROOF_CONTENT" > "$PROOF_TMP"
  trap 'rm -f "$DRAFT_TMP" "$PROOF_TMP"' EXIT
  awk -v draft_file="$DRAFT_TMP" -v proof_file="$PROOF_TMP" '
    function slurp(fname,   line, out) {
      out = ""
      while ((getline line < fname) > 0) {
        out = out line "\n"
      }
      close(fname)
      sub(/\n$/, "", out)
      return out
    }
    BEGIN {
      draft = slurp(draft_file)
      proof = slurp(proof_file)
    }
    {
      gsub(/\{\{DRAFT\}\}/, draft)
      gsub(/\{\{PROOF_MAP\}\}/, proof)
      print
    }
  ' <<<"$output"
fi
