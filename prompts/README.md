# Prompts

These are the canonical prompts for the PageKit method.

Every guide, quickstart, skill and script that runs a step of the method pulls from these files. **Edit here. Do not edit copies.**

## Why one place

Before this directory existed, the same seven prompts were duplicated across five tool guides (5 × 7 = 35 copies). They drifted. This was visible in real runs: different bots using different guides produced measurably different output at the same step.

One canonical source per step fixes that.

## Files

- `01-signal-doc.md`
- `02-message-spine.md`
- `03-first-page-decision.md`
- `04-page-argument-shape.md`
- `05-proof-map.md`
- `06-first-page-draft.md`
- `07-claim-check.md`

Each file has:
- YAML frontmatter: step number, step name, inputs, outputs, severity options where relevant
- A prompt body ready to paste into a model (or expanded by `scripts/claim-check.sh`, or wrapped by a skill in `.claude/skills/`)

## How guides use these

Tool guides (`guides/*.md`) reference the canonical prompt for each step by path. They keep the per-tool narrative (what the tool is good at, what to gather before starting, how to iterate) but stop carrying the prompt text itself.

## How skills use these

Each per-step skill under `.claude/skills/pagekit-<step>/SKILL.md` loads the corresponding prompt file as procedural content. The skill description determines auto-invocation; the prompt body is the instruction.

## Editing rules

- Changes here are the method changing. Review against `frameworks/` before editing.
- Keep the `## Prompt` section copy-paste-ready: the reader should be able to paste the fenced block into a model without stripping anything out.
- Do not embed severity or verification-flag text in the prompt; those come from the frontmatter or from the caller.
