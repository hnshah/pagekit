# CLAUDE.md

Agent-facing repo contract for PageKit. PageKit ships as a Claude Code plugin plus a chat-paste path.

## What this repo is

- `skills/`: 12 skills (orchestrator, 7 method steps, 4 tooling skills)
- `agents/`: 2 subagents (claim-checker, evaluator-pass)
- `.claude-plugin/`: plugin and marketplace manifests
- `scripts/`: new-run, run-check, claim-check, slop-check, doctor
- `examples/`: worked runs (vegan-dog-food-verdel, personal-crm-founders)
- `prompt-paste/`: 7 prompts for non-Claude-Code chat windows
- `runs/`: user scratch space

## Running PageKit end-to-end

Invoke the `pagekit` skill. The orchestrator walks steps 01–07, scaffolds `runs/<name>/` via `pagekit-new-run`, fills artifacts via each step skill, runs `pagekit-slop-check` on the draft, dispatches `pagekit-claim-checker` for the audit, writes `evaluation.md`, dispatches `pagekit-evaluator-pass`, and closes with `pagekit-run-check`.

If you are running by hand: `bash scripts/new-run.sh <run>` → work through `prompts/NN-*.md` → `bash scripts/run-check.sh runs/<run>`. All canonical prompts live at `skills/pagekit-<step>/references/prompt.md`.

## Hard rules

- **Do not hard-code homepage-first.** Step 03 picks the first page from the object. Name rejected candidates.
- **Do not invent proof.** Mark unverified product-specific claims with `*[verification flag: ...]*` inline.
- **Do not ship a draft with AI-slop patterns.** See `skills/pagekit/references/anti-slop.md`. The full pattern list is there with examples. Run `pagekit-slop-check` (or `scripts/slop-check.sh`) and resolve every hit.
- **Do not skip run logging.** Fully-logged runs are defined in `skills/pagekit/references/run-logging.md`. A draft is not the deliverable; a logged run is.
- **Edit canonical references in place.** Framework, template, and prompt files live under each skill's `references/` folder and under `skills/pagekit/references/` for shared material. Do not duplicate.

## Quality rules

- avoid AI slop. See `skills/pagekit/references/anti-slop.md` for the pattern list.
- avoid generic category-default wording
- avoid overclaiming
- avoid polishing weak inputs into prettier weak outputs
- when copy is weak, ask which source artifact is too weak or missing
- when copy carries AI-slop patterns, name the pattern and rewrite

## What must stay variable

- what page comes first
- what shape the page takes
- how trust lands
- how proof lands
- how the argument is ordered

The object decides. Category habit does not.

## Repo behavior guidelines

- improve user-facing clarity when possible
- keep examples honest and tied to real runs
- mechanize structural work via `scripts/`; do not hand-roll run folders
- the SessionStart hook in `.claude/settings.json` runs `scripts/doctor.sh` on every session start
- skills under `skills/pagekit*` orchestrate the method end-to-end; the subagents under `agents/` run the read-only adversarial passes

## Good vs bad agent behavior

Good:
- strengthens skill references when runs expose weak spots
- makes the process more object-driven, not more rigid
- keeps the repo honest about what it can and cannot yet do

Bad:
- assuming every object wants the same homepage
- filling proof gaps with smooth language
- shipping drafts with AI-slop patterns
- skipping `pagekit-slop-check` or running it only after committing
