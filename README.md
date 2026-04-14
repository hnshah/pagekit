# PageKit

*A practical system for getting to better pages by strengthening the source materials that shape the copy.*

PageKit helps you go from:
- vague market understanding
- weak source material
- generic page direction

to:
- a sharper signal doc
- a clearer message spine
- a deliberate first-page decision
- a page argument shape that fits the object
- a proof map with honest constraints
- a page draft grounded in better inputs

This repo gives you a guided, markdown-first way to improve the materials that drive page copy.

## Who this is for

PageKit is for:
- founders
- marketers
- product marketers
- operators
- AI-native teams who want faster website work without generic output

## Choose your starting path

### I am new here
Start here:
- `START-HERE.md`

### I just want prompts (lightest entry, one step)
Start here:
- `quickstart/README.md`
- `quickstart/start-with-prompts.md`

### I want a full tool-specific path in one file (chat tools)
Start here:
- `guides/README.md`

### I want to drive this agentically (Claude Code, Codex, Cowork)
Start here:
- `agentic/README.md`

### I want the full method
Start here:
- `guided-runs/01-build-signal-doc/README.md`

### I want to see worked examples
Start here:
- `examples/README.md`

## The artifact chain

The canonical PageKit workflow is:

**signal doc -> message spine -> first-page decision -> page argument shape -> proof map -> first page draft**

An optional durability pass follows:

**claim check**

That order matters.
The whole point is to get the upstream structure right before asking AI to write final pages.

## What makes this different

- starts upstream, with signal
- improves the source materials before chasing better copy
- preserves audience differences
- lets the object decide the page shape
- does not default to homepage
- maps proof to specific argument moves
- keeps AI inside a real workflow
- keeps intermediate artifacts visible and reusable
- treats AI-slop patterns as hard no-go rules (`frameworks/anti-slop.md`) with a regression script (`scripts/slop-check.sh`)

## Repo structure

```text
AGENTS.md         neutral agent contract (Codex, Claude Code, Cowork)
CLAUDE.md         Claude Code agent contract; full operational manual
START-HERE.md     first-time entry doc
README.md         this file
pagekit.yaml      canonical method manifest (single source of truth)
Makefile          discoverable wrappers around scripts/
quickstart/       low-friction prompt-first entry (one step)
guides/           fully self-contained tool-specific chat paths
agentic/          third tier: Claude Code, Codex, Cowork agentic paths
guided-runs/      step-by-step workflows
frameworks/       the durable method docs
templates/        copyable artifact templates
prompts/          canonical prompts (one per step; do not duplicate)
runs/             logged validation runs
examples/         packaged examples and run summaries
research/         planning docs for future rigor
scripts/          tooling (new-run, run-check, claim-check, slop-check, doctor)
.claude/          Claude Code skills + subagents + SessionStart hook (also the Cowork plugin body)
```

## Current scope

PageKit v0.1 is intentionally narrow.
It focuses on one core workflow:

**signal -> spine -> first-page decision -> argument shape -> proof map -> first page draft**

With an optional claim-check pass on top.

That keeps the system honest and usable.

## Logged runs

The repo includes validation runs so the process can be judged against real objects, not theory alone.

See `frameworks/run-logging.md` for the definition of "fully logged" vs "summary logged."

**Fully logged**
- `runs/taskpilot-first-pass/` — goal, sources, prompts, outputs, working log, evaluation, evaluator pass. Chose homepage as first page.

**Summary logged**
- `runs/vegan-dog-food-first-pass/` — sources, final artifacts, evaluation. No per-step prompts or raw outputs.

**Artifact-only runs** (below the summary-logged bar; final artifacts plus working log, no sources, no per-step prompts, no raw outputs, no evaluation, no evaluator pass, no claim check)
- `runs/personal-crm-founders/` — first page chose homepage
- `runs/vegan-dog-food-fresh-run/` — first page chose homepage
- `runs/openclaw-web-hosting/` — first page chose homepage

**Synthetic self-tests**
- `runs/high-trust-professional-tool-architecture-test/` — not a real object run

The three artifact-only runs ship with accompanying `homepage-draft-original.md` files that preserve the original pre-de-slop state, and `slop-pass.md` audit trails. See individual run folders.

## What comes later

Later versions can add:
- more non-homepage real-object runs
- exhibit packaging
- agent/skill-powered paths
- deeper page-family generation

The system should also keep getting better through fully logged runs that expose weak prompts, weak templates and weak process steps.

But the core system needs to hold first.

## Core principle

**Better page copy usually starts with better source materials.**
