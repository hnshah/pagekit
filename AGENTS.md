# AGENTS.md

Neutral agent contract for PageKit. Readable by Codex (primary `AGENTS.md` consumer), Claude Code (which also reads `CLAUDE.md`), Claude Cowork, and any agent reading the repo cold.

## What PageKit is

A system for producing better pages by strengthening the source materials that shape the copy. Markdown-first. Method-over-prompts.

## Where to start

Read these files in this order:

1. **`pagekit.yaml`** — canonical method manifest. The source of truth for every step, artifact, framework, template, guided-run and prompt. If you need to know what step N does and where its output goes, this file tells you.
2. **`CLAUDE.md`** — fuller operational contract, including the quality rules, the anti-slop rules, and the "Running PageKit end-to-end as an agent" section.
3. **`README.md`** — human-facing overview.

## Method in one glance

```
signal-doc → message-spine → first-page-decision → page-argument-shape → proof-map → first-page-draft [ → claim-check ]
```

Canonical prompts: `prompts/01-signal-doc.md` through `prompts/07-claim-check.md`.

## Running a fully-logged run

```sh
scripts/new-run.sh <run-name>           # scaffold the folder
# … work through the steps, filling prompts/NN-*.md and outputs/NN-*.md
scripts/run-check.sh runs/<run-name>    # validate the run meets the fully-logged tier
```

Or via make:

```sh
make new-run NAME=<run-name>
make run-check RUN=<run-name>
```

## Anti-slop

Drafts must respect `frameworks/anti-slop.md`. The regression check is `scripts/slop-check.sh`. Run it on the draft before the claim-check step; run it again after.

## Claim-check

```sh
scripts/claim-check.sh runs/<run>/first-page-draft.md runs/<run>/proof-map.md --severity hard
```

Outputs a ready-to-paste prompt. Paste into the model, then save the result as `runs/<run>/claim-check.md` and the corrected draft as `runs/<run>/first-page-draft-corrected.md`.

## Pre-flight

```sh
scripts/doctor.sh
# or
make doctor
```

## If you are Claude Code

See `.claude/skills/pagekit/SKILL.md` for the orchestrator skill. Per-step skills live under `.claude/skills/pagekit-<step>/`. The custom subagent for claim-check is `.claude/agents/pagekit-claim-checker.md`. The SessionStart hook in `.claude/settings.json` runs `scripts/doctor.sh` on session start.

Agentic path: `agentic/claude-code-agentic-path.md`.

## If you are Codex

This file is your contract. Read `pagekit.yaml` for the method. Scripts in `scripts/` are the tooling you will drive. Custom prompts / skills for Codex live alongside your own installation (see Codex docs); the canonical prompts in `prompts/` are what they should wrap.

Agentic path: `agentic/codex-agentic-path.md`.

## If you are Claude Cowork

The skill bundle at `.claude/skills/` is the plugin body. See `agentic/claude-cowork-agentic-path.md` for local installation and eventual published-plugin notes.

## Hard rules

Non-negotiable across tools and agents:

- **Do not hard-code homepage-first.** Step 03 is where the first page is chosen. The object decides.
- **Do not invent proof.** Mark unverified product-specific claims with `*[verification flag: ...]*` inline.
- **Do not ship a draft with AI-slop patterns.** See `frameworks/anti-slop.md`. Run `scripts/slop-check.sh` and resolve every hit.
- **Do not skip run logging.** Fully-logged runs are defined in `frameworks/run-logging.md`. If you are producing a run that claims to be fully-logged, it must meet that tier. `scripts/run-check.sh` tells you if it does.
- **Edit the canonical prompts in `prompts/`, never duplicate.** Guides reference them.

## Getting unstuck

- Output of a step feels generic → fix upstream source material, not the step output.
- First-page decision reluctant → add a mechanism / proof / comparison brief in `sources/` and rerun.
- Claim-check flagging the same pattern every run → update `frameworks/anti-slop.md` and the argument-shape drafting constraints so the pattern does not return.

## What this file is not

A full user manual. The full method lives in `frameworks/` and `guided-runs/`. The tool-specific paths live in `guides/`, `quickstart/` and `agentic/`. This file is the doormat that tells you where to look.
