# CLAUDE.md

This file is the agent-facing repo contract for PageKit.

## What this repo is for
PageKit is a system for getting to better pages by improving the source materials that shape the copy.

The repo should help produce:
- signal docs
- message spines
- first-page decisions
- page argument shapes
- proof maps
- page drafts
- logged runs and evaluations

## Canonical method
The stable process is:
1. signal doc
2. message spine
3. first-page decision
4. page argument shape
5. proof map
6. first page draft

Optional durability pass: 7. claim check.

The canonical manifest is `pagekit.yaml`. Canonical prompts are `prompts/01-signal-doc.md` through `prompts/07-claim-check.md`. **Edit the canonical prompts, never duplicate.** Guides, skills and scripts all read from those files.

## Running PageKit end-to-end as an agent

If you are an agent being asked to run PageKit on object X, do this exact sequence:

1. **Read `pagekit.yaml`.** It lists every step, artifact, framework, template, guided-run, and canonical prompt path. This is the source of truth.
2. **Scaffold a run folder** with `scripts/new-run.sh <run-name>` (or `make new-run NAME=<run-name>`). This creates `runs/<run-name>/` with all required files for the fully-logged tier.
3. **Fill `runs/<run-name>/goal.md` and `sources/`** with the object's ground truth. For fictional training objects, commit to concrete facts up front — no `[Product name]` placeholders in source briefs.
4. **Work through steps 01 through 06 in order.** For each step:
   - Save the prompt used as `runs/<run-name>/prompts/NN-<step>.md` (copy from `prompts/NN-*.md` and substitute inputs).
   - Save the raw model output as `runs/<run-name>/outputs/NN-<step>-output.md`.
   - Distill the output into the canonical artifact: `signal-doc.md`, `message-spine.md`, `first-page-decision.md`, `page-argument-shape.md`, `proof-map.md`, `first-page-draft.md`.
   - Record what changed in `working-log.md`.
   - Do not advance if the step's quality bar is not met. Go back upstream and fix source material.
5. **Run `scripts/slop-check.sh runs/<run-name>/first-page-draft.md`.** Resolve every flagged pattern before continuing.
6. **Run step 07 (claim check) at the severity you intend:** `scripts/claim-check.sh runs/<run-name>/first-page-draft.md runs/<run-name>/proof-map.md --severity hard`. Paste the expanded prompt, save `claim-check.md` and `first-page-draft-corrected.md`.
7. **Write `evaluation.md` and `evaluator-pass.md`** per `frameworks/run-logging.md`. The evaluator pass is adversarial; do not skip it at the fully-logged tier.
8. **Validate with `scripts/run-check.sh runs/<run-name>`** (or `make run-check RUN=<run-name>`). Fix anything it flags.

If you are inside Claude Code, the `.claude/skills/pagekit/` skill orchestrates steps 2 through 8 for you. Invoke with `/pagekit` or describe the job ("run PageKit on X") and the skill will auto-load.

## What must stay stable
- source material comes before copy
- weak drafts should trigger upstream repair first
- proof must not be invented
- uncertainty should stay visible when it is real
- runs should be logged when they matter

## What must stay variable
- what page comes first
- what shape the page takes
- how trust lands
- how proof lands
- how the argument is ordered

Do not hard-code homepage-first assumptions unless the object clearly earns that decision.
Do not hard-code a fixed homepage section pattern.

## Quality rules
- avoid AI slop. Specifically: no "Not X. Not Y." pairs, no three parallel short sentences in a row, no sentence-start anaphora, no editorial voice narrating brand restraint, no em-dash stacking, no "actually / testament / landscape / showcasing / truly" as intensifiers, no copula-avoidance (`serves as`, `boasts`), no signposting (`let's dive in`), no significance inflation (`pivotal moment`). See `frameworks/anti-slop.md` for the full list and examples.
- avoid generic category-default wording
- avoid overclaiming
- avoid polishing weak inputs into prettier weak outputs
- when copy is weak, ask which source artifact is too weak or missing
- when copy carries AI-slop patterns, name the pattern from `frameworks/anti-slop.md` and rewrite

## Repo behavior guidelines
- improve user-facing clarity when possible
- keep quickstarts short and guides self-contained
- keep examples honest and tied to real runs
- use logged runs as evidence, not decoration

## Good agent behavior in this repo
Good work in PageKit:
- strengthens templates when runs expose weak spots
- strengthens guided runs when users would otherwise get stuck
- makes the process more object-driven, not more rigid
- keeps the repo honest about what it can and cannot yet do

## Bad agent behavior in this repo
Bad work in PageKit:
- assuming every object wants the same homepage
- filling proof gaps with smooth language
- treating the process as a prompt library only
- writing docs that sound polished but do not improve usability
- shipping drafts with AI-slop patterns
- running the slop-check script (`scripts/slop-check.sh`) only after committing, or skipping it
