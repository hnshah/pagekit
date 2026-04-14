---
name: pagekit
description: Run the full PageKit method end-to-end on an object. Use when the user asks to "run PageKit on X", "build a page for X using PageKit", or "produce a fully-logged PageKit run for X". Orchestrates steps 01-07 (signal doc, message spine, first-page decision, page argument shape, proof map, first-page draft, optional claim-check) and produces a fully-logged run on disk under runs/<name>/.
---

# PageKit Orchestrator Skill

You are running the full PageKit method end-to-end. The method, the manifest, the canonical prompts, the scripts and the rules all live in this repo. Use them.

## Read first

1. `pagekit.yaml` — the canonical method manifest. Steps, artifacts, frameworks, templates, prompts, paths.
2. `AGENTS.md` and `CLAUDE.md` — agent contract and operational rules.
3. `frameworks/anti-slop.md` — hard no-go patterns for the draft.
4. `frameworks/run-logging.md` — what counts as fully-logged.

## Procedure

For any object the user gives you:

### 1. Confirm scope

Ask the user (briefly):
- Run name (slug for the folder under `runs/`).
- Is the object real or a training fiction? If fictional, what concrete facts should serve as ground truth?
- Severity for the eventual claim-check pass: light, normal, or hard.

### 2. Scaffold

Run `scripts/new-run.sh <run-name>` (or invoke the `pagekit-new-run` skill). This creates `runs/<run-name>/` with the full fully-logged layout.

### 3. Source briefs

Fill `runs/<run-name>/sources/`:
- `01-source-capture.md` — what raw material exists, what is missing.
- `02-product-brief.md` — concrete product facts. **No `[Product name]` placeholders.** For trust-heavy objects, also create `03-wedge-definition-brief.md`, `04-mechanism-brief.md`, `05-proof-brief.md`, `06-comparison-brief.md`.

### 4. Run steps 01-06 in order

For each step:
1. Invoke the per-step skill: `pagekit-signal-doc`, `pagekit-message-spine`, `pagekit-first-page-decision`, `pagekit-page-argument-shape`, `pagekit-proof-map`, `pagekit-first-page-draft`.
2. The per-step skill loads its canonical prompt from `prompts/NN-*.md`, substitutes the run's inputs, prompts the model.
3. Save the prompt actually used (with substitutions) to `runs/<run-name>/prompts/NN-*.md`.
4. Save the raw output to `runs/<run-name>/outputs/NN-*-output.md`.
5. Distill the output into the canonical artifact in the run root (`signal-doc.md`, `message-spine.md`, etc.).
6. Update `runs/<run-name>/working-log.md` with what changed and any decisions made.

**Quality gate at every step:** if the artifact does not meet the quality bar in the corresponding `frameworks/*.md`, stop and fix upstream source material before advancing. Do not paper over weakness with downstream effort.

**Step 03 (first-page decision) is special.** Do not default to homepage. List candidates considered and rejected. The object decides the first page.

### 5. Pre-claim-check slop check

Run `scripts/slop-check.sh runs/<run-name>/first-page-draft.md`. Resolve every flagged pattern by rewriting the line. Re-run until clean.

### 6. Claim check (step 07)

Invoke the `pagekit-claim-check` skill at the chosen severity. Internally it delegates to the `pagekit-claim-checker` subagent (read-only, hard severity by default). Save:
- `runs/<run-name>/claim-check.md` — the audit (flagged lines, types, rewrites)
- `runs/<run-name>/first-page-draft-corrected.md` — the corrected draft, if any line was rewritten

### 7. Evaluation and evaluator pass

Write `runs/<run-name>/evaluation.md` (honest, names what stayed thin) and `runs/<run-name>/evaluator-pass.md` (adversarial second read; lists repo-improvement candidates if the run exposed any).

### 8. Validate

Run `scripts/run-check.sh runs/<run-name>` (or invoke `pagekit-run-check`). It must classify the run as **FULLY LOGGED** before you declare the run done. If it does not, fix the missing items.

### 9. Hand off

Tell the user:
- The run is at `runs/<run-name>/`.
- The first page chosen at step 03 (and which candidates were rejected).
- The slop-check and claim-check results.
- Any repo-improvement items the evaluator pass surfaced.

## Hard rules (do not violate)

- **Do not default to homepage.** Step 03 must consider alternatives.
- **Do not invent proof.** Use `*[verification flag: ...]*` for unverified product-specific claims.
- **Do not skip slop-check before the claim-check step.** The script catches the obvious cases; the claim-check catches the rest.
- **Do not skip the evaluator pass** at the fully-logged tier.
- **Do not edit the canonical prompts** in `prompts/` to fit a single run. They are shared.

## When to ask the user

- First-page decision is borderline (homepage vs. non-homepage close call): show both candidates and ask.
- Claim-check at hard severity is rewriting more than 25% of the draft: pause and check whether the proof map needs strengthening rather than the draft.
- Source briefs are too thin to support a meaningful run: stop and ask for more material.

## When to delegate

Use the `pagekit-claim-checker` subagent (`.claude/agents/pagekit-claim-checker.md`) for the claim-check step. It is read-only and has a tighter focus, which keeps the main session uncluttered.

For tooling steps, invoke the corresponding skill rather than calling the script directly so the rationale is logged in the conversation.
