# Scripts

Tooling for the PageKit method. Every script here exits 0 on success, non-zero on failure, so the scripts work in hooks and CI without extra glue.

## Quick reference

| Script | Purpose |
|---|---|
| `new-run.sh <name>` | Scaffold a fully-logged run folder (`runs/<name>/`). |
| `run-check.sh <path>` | Validate a run against the logging tiers defined in `frameworks/run-logging.md`. |
| `claim-check.sh <draft> <proof-map> [--severity ...]` | Expand the canonical claim-check prompt for pasting. No LLM call. |
| `slop-check.sh [paths...]` | Heuristic regression check for AI-slop patterns. |
| `doctor.sh` | Pre-flight repo health check. Used by the SessionStart hook. |

All are wrappable through `make` — see the `Makefile` at the repo root.

---

## new-run.sh

Scaffolds `runs/<name>/` with the full fully-logged layout: `goal.md`, `models.md`, `working-log.md`, `sources/README.md`, `prompts/01–07-*.md` (copied from canonical `prompts/` with a top-of-file note), `outputs/NN-*-output.md` placeholders, per-step artifact placeholders, `evaluation.md` and `evaluator-pass.md` templates.

Matches the `fully_logged` tier in `pagekit.yaml`. If the manifest changes, update this script.

## run-check.sh

Reads a run folder and classifies it as **fully-logged**, **summary-logged**, **artifact-only**, or **incomplete**. Lists missing files for the highest tier not met. Designed for agents to call at the end of a run to verify they actually did the logging work, not just the drafting.

Exit 0 on fully-logged or summary-logged; exit 1 on artifact-only or incomplete.

## claim-check.sh

Template expansion only. Reads `prompts/07-claim-check.md`, substitutes `{{SEVERITY}}`, `{{DRAFT}}`, `{{PROOF_MAP}}`, writes to stdout. Paste the result into the model of your choice. Save the model's output as `claim-check.md` and the corrected draft as `first-page-draft-corrected.md` inside the run folder.

## doctor.sh

Verifies every file and directory referenced by `pagekit.yaml` exists; every script is executable; the slop-check runs clean against the tracked de-slopped drafts. Called by the SessionStart hook in `.claude/settings.json`.

## slop-check.sh

A heuristic grep-level regression check for AI-slop patterns in PageKit drafts.

### What it checks
It covers the mechanically detectable subset of `frameworks/anti-slop.md`:

- `not-x-not-y-heading` — two consecutive markdown headings that both begin with "Not "
- `not-x-not-y-sentence` — a "Not X. Not Y." sentence pair on one line
- `em-dash-stacking` — a line with two or more em-dashes (U+2014 or `--`)
- `intensifier-actually` — "actually" used outside of verification flags or explicit pattern lists
- `copula-avoidance` — `boasts / showcases / empowers / serves as`
- `signposting` — `let's dive in / here's the thing / that's the deal / here's what matters`
- `filler` — `in order to / due to the fact that / at this point in time / it should be noted that / for the purposes of`
- `significance-inflation` — `pivotal moment / critical juncture / reimagining how / redefining the`
- `anaphora` — three or more consecutive non-empty body lines sharing the same leading word
- `rule-of-three` — three or more consecutive short body lines (< 10 words each)
- `intensifier-vocabulary` — `testament to / landscape of / genuinely / truly understand / truly different`
- `quoted-antithesis` — two quoted phrases connected by `and` or `or` on one line

### What it does not check
The semantic patterns: editorial voice narrating brand restraint, unsourced quantitative modifiers ("most", "usually"), clinical drift, marketing-punchy enders that read as slogans. Those require a human or the claim-check step.

### Usage

```sh
# Check all draft files under runs/ (default)
scripts/slop-check.sh

# Check specific files or directories
scripts/slop-check.sh runs/openclaw-web-hosting/homepage-draft.md
scripts/slop-check.sh runs/
```

Output format: `file:line  pattern-name  snippet`.

Exit code is 1 if any pattern fires, 0 if the scan is clean. You can wire this into CI or a pre-commit hook if you want slop to fail builds.

### What the script excludes

- `slop-pass.md` files (they necessarily quote slop lines being rewritten)
- `*-original.md` files (preserved before-state drafts)
- `anti-slop.md` (the framework itself quotes slop examples)

### Relation to the rest of PageKit

The script is a cheap pre-filter. It catches the mechanical tells so the claim-check step can focus on the harder semantic issues. See `frameworks/claim-checking.md` for the full claim-check method. See `frameworks/anti-slop.md` for the authoritative list of patterns.

If the script fires on a draft, the fix is usually:
1. Rewrite the flagged line.
2. If the same pattern fires repeatedly on new drafts, add it (or strengthen it) in the page-argument-shape drafting constraints so drafts stop producing it in the first place.

### Limits

This is a heuristic. It will have false positives (rule-of-three will flag legitimate short-sentence passages; the `actually` check will flag legitimate uses of the word). It will also miss patterns that require semantic understanding. Treat the output as "lines worth looking at," not "lines that must change."

### Pre-existing slop in historical runs

Running the default scan will surface slop in older logged runs that predate the anti-slop framework. For example, `runs/taskpilot-first-pass/homepage-draft.md` and `runs/vegan-dog-food-first-pass/homepage-draft.md` carry patterns the script correctly flags, but those drafts are preserved as evidence of what the process produced at the time. Rewriting them retroactively would falsify the record. The honest behaviour is to leave them as-is and accept that a default scan will not exit 0 until the historical runs are either retired or re-logged under the new rules.

If you only want to validate the current, actively-maintained drafts, pass them explicitly:

```sh
scripts/slop-check.sh \
  runs/openclaw-web-hosting/homepage-draft.md \
  runs/personal-crm-founders/homepage-draft.md \
  runs/vegan-dog-food-fresh-run/homepage-draft.md
```
