#!/usr/bin/env bash
# slop-check.sh
#
# Heuristic regression check for AI-slop patterns in PageKit drafts.
# Covers the mechanically detectable subset of frameworks/anti-slop.md.
# Not a replacement for the claim-check step; a cheap filter that catches
# the obvious cases before claim-check looks for the harder ones.
#
# Usage:
#   scripts/slop-check.sh <file-or-dir> [<file-or-dir> ...]
#
# If no argument is given, runs against homepage-draft.md /
# first-page-draft.md / first-page-draft-corrected.md under runs/.
#
# Exit code:
#   0  no hits
#   1  one or more hits

set -u

HITS_FILE="$(mktemp -t slopcheck.XXXXXX)"
trap 'rm -f "$HITS_FILE"' EXIT

red()    { printf "\033[31m%s\033[0m" "$*"; }
yellow() { printf "\033[33m%s\033[0m" "$*"; }
dim()    { printf "\033[2m%s\033[0m" "$*"; }

report() {
  local file="$1" line="$2" pattern="$3" snippet="$4"
  printf "%s:%s  %s  %s\n" \
    "$(yellow "$file")" \
    "$(red "$line")" \
    "$pattern" \
    "$(dim "${snippet}")"
  printf "x\n" >> "$HITS_FILE"
}

# ----- detectors ------------------------------------------------------------

check_not_x_not_y_headings() {
  local file="$1"
  awk -v F="$file" '
    /^#{1,6}[[:space:]]+/ {
      heading_line = NR
      heading_text = $0
      sub(/^#{1,6}[[:space:]]+/, "", heading_text)
      if (prev_heading != "" && prev_heading ~ /^[Nn]ot[[:space:]]/ && heading_text ~ /^[Nn]ot[[:space:]]/) {
        printf "%d\tnot-x-not-y-heading\t%s\n", heading_line, heading_text
      }
      prev_heading = heading_text
      next
    }
    /^[[:space:]]*$/ { next }
    { prev_heading = "" }
  ' "$file" | while IFS=$'\t' read -r line pattern snippet; do
    report "$file" "$line" "$pattern" "$snippet"
  done
}

check_not_x_not_y_sentences() {
  local file="$1"
  grep -nE '(^|[[:space:]])[Nn]ot [^.]+\.[[:space:]]+[Nn]ot [^.]+\.' "$file" 2>/dev/null \
    | while IFS=: read -r line rest; do
        report "$file" "$line" "not-x-not-y-sentence" "$rest"
      done
}

check_em_dash_stacking() {
  local file="$1"
  awk -v F="$file" '
    # Skip markdown table lines (both data rows and separators).
    /^[[:space:]]*\|/ { next }
    /^[[:space:]]*[-|: ]+$/ { next }
    # Also skip indented list items whose content is only table-style.
    {
      n = 0
      s = $0
      while (match(s, /—/)) {
        n++
        s = substr(s, RSTART + RLENGTH)
      }
      # Count ASCII -- occurrences separately, excluding markdown table dashes
      t = $0
      m = 0
      while (match(t, /[^|-]--[^|-]/)) {
        m++
        t = substr(t, RSTART + RLENGTH)
      }
      total = n + m
      if (total >= 2) printf "%d\tem-dash-stacking\t%s\n", NR, $0
    }
  ' "$file" | while IFS=$'\t' read -r line pattern snippet; do
    report "$file" "$line" "$pattern" "$snippet"
  done
}

check_actually() {
  local file="$1"
  # Exclude lines that are meta-markers (verification flags, placeholders,
  # draft notes, scenario placeholders) since those do not ship as copy.
  grep -nEi '([[:space:]]|^)actually([[:space:]]|[[:punct:]])' "$file" 2>/dev/null \
    | grep -vi 'anti-slop' \
    | grep -vF '*[' \
    | grep -viE '^[[:digit:]]+:\*?\[?(Verification flag|Placeholder|Scenario|Note|Format|Optional|Draft note|If |If true)' \
    | while IFS=: read -r line rest; do
        report "$file" "$line" "intensifier-actually" "$rest"
      done
}

check_copula_avoidance() {
  local file="$1"
  grep -nEi '([[:space:]])(boasts|showcases|empowers|serves as)' "$file" 2>/dev/null \
    | grep -vi 'anti-slop' \
    | while IFS=: read -r line rest; do
        report "$file" "$line" "copula-avoidance" "$rest"
      done
}

check_signposting() {
  local file="$1"
  grep -nEi "(let'?s dive in|here'?s the thing|that'?s the deal|here'?s what matters)" "$file" 2>/dev/null \
    | grep -vi 'anti-slop' \
    | while IFS=: read -r line rest; do
        report "$file" "$line" "signposting" "$rest"
      done
}

check_filler() {
  local file="$1"
  grep -nEi "(in order to|due to the fact that|at this point in time|it should be noted that|for the purposes of)" "$file" 2>/dev/null \
    | while IFS=: read -r line rest; do
        report "$file" "$line" "filler" "$rest"
      done
}

check_significance_inflation() {
  local file="$1"
  grep -nEi "(pivotal moment|critical juncture|reimagining how|redefining the)" "$file" 2>/dev/null \
    | while IFS=: read -r line rest; do
        report "$file" "$line" "significance-inflation" "$rest"
      done
}

check_anaphora() {
  local file="$1"
  awk -v F="$file" '
    function is_skippable(s) {
      return s ~ /^[[:space:]]*$/ || s ~ /^#{1,6}[[:space:]]/ || s ~ /^[[:space:]]*[-*][[:space:]]/ || s ~ /^[[:space:]]*[0-9]+\./ || s ~ /^[[:space:]]*\*\[/ || s ~ /^[[:space:]]*\|/
    }
    function first_word(s,   w, arr) {
      sub(/^[[:space:]]*[*_`]*/, "", s)
      split(s, arr, /[[:space:],.:;!?]/)
      w = arr[1]
      gsub(/[^A-Za-z0-9'\'']/, "", w)
      return tolower(w)
    }
    BEGIN { streak = 0; prev_word = "" }
    {
      if (is_skippable($0)) { streak = 0; prev_word = ""; next }
      fw = first_word($0)
      if (length(fw) < 3) { streak = 0; prev_word = ""; next }
      if (fw == prev_word) { streak++ } else { streak = 1 }
      if (streak >= 3) {
        printf "%d\tanaphora\t(\"%s\" as first word for %d consecutive lines)\n", NR, fw, streak
      }
      prev_word = fw
    }
  ' "$file" | while IFS=$'\t' read -r line pattern snippet; do
    report "$file" "$line" "$pattern" "$snippet"
  done
}

check_rule_of_three() {
  local file="$1"
  awk -v F="$file" '
    function is_skippable(s) {
      return s ~ /^[[:space:]]*$/ || s ~ /^#{1,6}[[:space:]]/ || s ~ /^[[:space:]]*[-*][[:space:]]/ || s ~ /^[[:space:]]*[0-9]+\./ || s ~ /^[[:space:]]*\*\[/ || s ~ /^[[:space:]]*\|/ || s ~ /^[[:space:]]*```/
    }
    function word_count(s,   n, arr) {
      n = split(s, arr, /[[:space:]]+/)
      return n
    }
    BEGIN { streak = 0 }
    {
      if (is_skippable($0)) { streak = 0; next }
      wc = word_count($0)
      if (wc > 0 && wc < 10) { streak++ } else { streak = 0 }
      if (streak >= 3) {
        printf "%d\trule-of-three\t(3 short lines ending at: \"%s\")\n", NR, $0
        streak = 0
      }
    }
  ' "$file" | while IFS=$'\t' read -r line pattern snippet; do
    report "$file" "$line" "$pattern" "$snippet"
  done
}

check_other_intensifiers() {
  local file="$1"
  grep -nEi '([[:space:]])(testament to|landscape[[:space:]]+of|genuinely|truly understand|truly different)' "$file" 2>/dev/null \
    | grep -vi 'anti-slop' \
    | while IFS=: read -r line rest; do
        report "$file" "$line" "intensifier-vocabulary" "$rest"
      done
}

check_quoted_antithesis() {
  local file="$1"
  grep -nE '".+" (and|or) ".+"' "$file" 2>/dev/null \
    | grep -vi 'anti-slop' \
    | while IFS=: read -r line rest; do
        report "$file" "$line" "quoted-antithesis" "$rest"
      done
}

# ----- driver ---------------------------------------------------------------

scan_file() {
  local f="$1"
  [ -f "$f" ] || return 0
  case "$f" in
    *.md|*.txt) ;;
    *) return 0 ;;
  esac
  check_not_x_not_y_headings "$f"
  check_not_x_not_y_sentences "$f"
  check_em_dash_stacking "$f"
  check_actually "$f"
  check_copula_avoidance "$f"
  check_signposting "$f"
  check_filler "$f"
  check_significance_inflation "$f"
  check_anaphora "$f"
  check_rule_of_three "$f"
  check_other_intensifiers "$f"
  check_quoted_antithesis "$f"
}

scan_target() {
  local t="$1"
  if [ -d "$t" ]; then
    find "$t" -type f \( -name '*.md' -o -name '*.txt' \) \
      ! -name 'slop-pass.md' \
      ! -name '*-original.md' \
      ! -name 'anti-slop.md' \
      -print0 | while IFS= read -r -d '' f; do
        scan_file "$f"
      done
  else
    scan_file "$t"
  fi
}

main() {
  if [ "$#" -eq 0 ]; then
    find runs -type f \( -name 'homepage-draft.md' -o -name 'first-page-draft.md' -o -name 'first-page-draft-corrected.md' \) \
      ! -name '*-original.md' \
      -print0 | while IFS= read -r -d '' f; do
        scan_file "$f"
      done
  else
    for t in "$@"; do
      scan_target "$t"
    done
  fi

  local hits
  hits=$(wc -l < "$HITS_FILE" 2>/dev/null || echo 0)
  hits=$(echo "$hits" | tr -d ' ')
  if [ "${hits:-0}" -gt 0 ]; then
    printf "\nslop-check: %d pattern(s) flagged.\n" "$hits" >&2
    exit 1
  fi
  printf "slop-check: clean.\n"
  exit 0
}

main "$@"
