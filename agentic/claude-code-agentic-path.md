# Claude Code Agentic Path

The most mechanized way to run PageKit. The agent produces a fully-logged run on disk without you orchestrating each step.

## What you need

- [Claude Code](https://docs.claude.com/claude-code) installed.
- The PageKit repo cloned locally.

## First run

1. `cd` into the repo.
2. Start a Claude Code session. The `SessionStart` hook in `.claude/settings.json` will run `scripts/doctor.sh` and report repo health.
3. Give the agent an object to run on. Examples:
   - "Run PageKit on a new plant-based dog food brand called Kind Bowl."
   - "Use PageKit to produce a first-page draft for this B2B invoicing product: [paste product description]."
4. The agent will invoke the `/pagekit` skill (or you can invoke explicitly: `/pagekit`). The skill drives the full chain.

## What the skill does

`.claude/skills/pagekit/SKILL.md` orchestrates:

1. Calls `scripts/new-run.sh <name>` to scaffold `runs/<name>/`.
2. Asks you for (or infers from your prompt) the source material — product brief, audience hypothesis, etc. Saves source briefs to `runs/<name>/sources/`.
3. Runs each step 01 through 07 by loading the corresponding per-step skill (`.claude/skills/pagekit-signal-doc/`, etc.). Each per-step skill loads its canonical prompt from `prompts/NN-*.md`, prompts the model, saves the raw output to `runs/<name>/outputs/`, distills the artifact into the run root.
4. Runs `scripts/slop-check.sh` against the first-page draft before running the claim-check step. Flags resolved before continuing.
5. Runs the claim-check step at the severity you specified. The `pagekit-claim-check` skill delegates to the `pagekit-claim-checker` subagent (`.claude/agents/pagekit-claim-checker.md`) which is read-only and hard-severity by default.
6. Writes `evaluation.md` and `evaluator-pass.md`.
7. Calls `scripts/run-check.sh runs/<name>` to verify the fully-logged tier is met. Reports the result.

## What you do during a run

- Provide source material when asked.
- Approve or refine the first-page decision at step 03. The agent will list candidates and its choice; you can override.
- Review the claim-check output. If a flag is wrong, tell the agent and it will revise.
- Sign off on the run at the end.

## When to intervene

- If the first-page decision drifts to homepage by default, challenge it.
- If the draft reads machine-cadenced even after slop-check, paste the slop line back and ask for a rewrite.
- If the proof map feels thin, ask the agent to add a source brief (mechanism, proof, comparison) before drafting.

## Per-step skill invocation

You can invoke a single step without the full orchestrator:

- `/pagekit-signal-doc` — builds just the signal doc
- `/pagekit-message-spine`
- `/pagekit-first-page-decision`
- `/pagekit-page-argument-shape`
- `/pagekit-proof-map`
- `/pagekit-first-page-draft`
- `/pagekit-claim-check` — runs against an existing draft, takes `--severity hard|normal|light`

Tooling skills:

- `/pagekit-new-run <name>` — scaffolds a run folder
- `/pagekit-run-check <name>` — validates a run's logging tier
- `/pagekit-slop-check [paths...]` — runs the regression check

## Typical failure modes

- **Agent scaffolds but does not fill source briefs.** Remind the agent that source briefs must be concrete before step 01.
- **Agent produces abstract signal doc.** Usually because the product brief is abstract. Sharpen the brief first, not the signal doc.
- **Agent lands on homepage without considering alternatives.** The `pagekit-first-page-decision` skill requires listing candidates considered and rejected. If that list is missing, ask explicitly.
- **Draft passes slop-check but still reads machine-cadenced.** The script is a heuristic. Claim-check at hard severity catches what the script does not.

## Files this path uses

```
.claude/
├── settings.json                          # SessionStart hook
├── skills/
│   ├── pagekit/SKILL.md                   # orchestrator
│   ├── pagekit-signal-doc/SKILL.md
│   ├── pagekit-message-spine/SKILL.md
│   ├── pagekit-first-page-decision/SKILL.md
│   ├── pagekit-page-argument-shape/SKILL.md
│   ├── pagekit-proof-map/SKILL.md
│   ├── pagekit-first-page-draft/SKILL.md
│   ├── pagekit-claim-check/SKILL.md
│   ├── pagekit-new-run/SKILL.md
│   ├── pagekit-run-check/SKILL.md
│   └── pagekit-slop-check/SKILL.md
└── agents/
    └── pagekit-claim-checker.md           # read-only subagent
```

All of these are committed to the repo. Cloning gives you the agentic bundle for free.
