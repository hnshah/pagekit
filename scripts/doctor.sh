#!/usr/bin/env bash
# doctor.sh — pre-flight check for the PageKit repo.
#
# Verifies structural integrity. Used by the SessionStart hook and by
# users / agents picking the repo up.
#
# Exit code:
#   0  healthy
#   1  at least one check failed
#
# This script is conservative: it reports what exists vs what is
# expected per pagekit.yaml. It does not fix anything.

set -u

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

FAIL=0

red()    { printf "\033[31m%s\033[0m" "$*"; }
green()  { printf "\033[32m%s\033[0m" "$*"; }
yellow() { printf "\033[33m%s\033[0m" "$*"; }

ok()   { printf "  %s  %s\n"   "$(green ok)"   "$1"; }
miss() { printf "  %s  %s\n"   "$(red MISS)"   "$1"; FAIL=1; }
warn() { printf "  %s  %s\n"   "$(yellow WARN)" "$1"; }

check_file() {
  local path="$1"
  if [ -f "$path" ]; then
    ok "$path"
  else
    miss "$path (expected file)"
  fi
}
check_dir() {
  local path="$1"
  if [ -d "$path" ]; then
    ok "$path/"
  else
    miss "$path/ (expected directory)"
  fi
}
check_exec() {
  local path="$1"
  if [ -x "$path" ]; then
    ok "$path (executable)"
  elif [ -f "$path" ]; then
    miss "$path (exists but not executable; run: chmod +x $path)"
  else
    miss "$path (expected executable file)"
  fi
}

echo "PageKit doctor — $REPO_ROOT"
echo

echo "Manifest and agent contract:"
check_file "pagekit.yaml"
check_file "AGENTS.md"
check_file "CLAUDE.md"
check_file "START-HERE.md"
check_file "README.md"
echo

echo "Frameworks:"
for f in anti-slop claim-checking first-page-decision message-spine page-argument-shape proof-map run-logging signal-doc; do
  check_file "frameworks/$f.md"
done
echo

echo "Templates:"
for t in claim-check-template first-page-decision-template message-spine-template output-judgment-template page-argument-shape-template proof-map-template signal-doc-template wedge-definition-template; do
  check_file "templates/$t.md"
done
echo

echo "Canonical prompts:"
for p in 01-signal-doc 02-message-spine 03-first-page-decision 04-page-argument-shape 05-proof-map 06-first-page-draft 07-claim-check; do
  check_file "prompts/$p.md"
done
check_file "prompts/README.md"
echo

echo "Guided runs:"
for g in 01-build-signal-doc 02-reduce-to-message-spine 03-decide-first-page 04-design-page-argument 05-map-proof-to-pages 06-draft-first-page 07-claim-check; do
  check_file "guided-runs/$g/README.md"
done
echo

echo "Guides and quickstarts:"
check_file "guides/README.md"
for g in chatgpt claude perplexity grok openai; do
  check_file "guides/$g-prompt-path.md"
done
check_file "quickstart/README.md"
check_file "quickstart/start-with-prompts.md"
for q in chatgpt claude perplexity grok openai; do
  check_file "quickstart/$q.md"
done
echo

echo "Agentic tier:"
check_file "agentic/README.md"
check_file "agentic/claude-code-agentic-path.md"
check_file "agentic/codex-agentic-path.md"
check_file "agentic/claude-cowork-agentic-path.md"
echo

echo "Scripts:"
check_exec "scripts/new-run.sh"
check_exec "scripts/new-source-brief.sh"
check_exec "scripts/run-check.sh"
check_exec "scripts/claim-check.sh"
check_exec "scripts/slop-check.sh"
check_exec "scripts/doctor.sh"
check_file "scripts/README.md"
echo

echo "Claude Code bundle (legacy .claude/ locations — removed in a later commit):"
check_file ".claude/skills/pagekit/SKILL.md"
for s in signal-doc message-spine first-page-decision page-argument-shape proof-map first-page-draft claim-check evaluator-pass new-run run-check slop-check; do
  check_file ".claude/skills/pagekit-$s/SKILL.md"
done
check_file ".claude/agents/pagekit-claim-checker.md"
check_file ".claude/agents/pagekit-evaluator-pass.md"
check_file ".claude/settings.json"
echo

echo "Plugin manifest:"
check_file ".claude-plugin/plugin.json"
check_file ".claude-plugin/marketplace.json"
echo

echo "Skills (top-level plugin layout):"
check_file "skills/pagekit/SKILL.md"
for s in signal-doc message-spine first-page-decision page-argument-shape proof-map first-page-draft claim-check evaluator-pass new-run run-check slop-check; do
  check_file "skills/pagekit-$s/SKILL.md"
done
echo

echo "Shared orchestrator references:"
for r in anti-slop run-logging method; do
  check_file "skills/pagekit/references/$r.md"
done
echo

echo "Per-skill references (framework, template, prompt):"
# first-page-draft has its own prompt but inherits framework/template from
# upstream page-argument-shape and proof-map; it is intentionally lighter.
for s in signal-doc message-spine first-page-decision page-argument-shape proof-map claim-check; do
  check_file "skills/pagekit-$s/references/framework.md"
  check_file "skills/pagekit-$s/references/template.md"
  check_file "skills/pagekit-$s/references/prompt.md"
done
check_file "skills/pagekit-first-page-draft/references/prompt.md"
echo

echo "Subagents:"
check_file "agents/pagekit-claim-checker.md"
check_file "agents/pagekit-evaluator-pass.md"
echo

echo "Slop regression against tracked drafts:"
if [ -x scripts/slop-check.sh ]; then
  # Default-target scan: every homepage-draft / first-page-draft /
  # first-page-draft-corrected under runs/. If runs/ is empty or the
  # drafts are all clean, this is clean.
  if bash scripts/slop-check.sh >/dev/null 2>&1; then
    ok "slop-check on tracked drafts (clean)"
  else
    warn "slop-check flagged a pattern on a tracked draft (see: bash scripts/slop-check.sh)"
  fi
else
  miss "scripts/slop-check.sh not executable"
fi
echo

if [ "$FAIL" -eq 0 ]; then
  echo "$(green PASS)  repo healthy."
  exit 0
else
  echo "$(red FAIL)  one or more checks failed. Fix the MISS items above."
  exit 1
fi
