# Prompt 01 — Build Signal Doc

## Step
01 — Signal doc

## Objective
Produce a signal doc strong enough to support a real message spine, grounded in the Kind Bowl source briefs.

## Model
Claude (Claude Code, Opus 4.6)

## Inputs used
- sources/02-product-brief.md
- sources/03-wedge-definition-brief.md
- sources/04-mechanism-brief.md
- sources/05-proof-brief.md
- sources/06-comparison-brief.md

## Prompt

```text
I want to build a web page through the PageKit process.

Do not write page copy yet.
Do not assume which page we are building.
Help me build a signal doc first.

Using the product-brief, wedge-definition, mechanism, proof and comparison briefs below, produce a signal doc with these sections:
1. what the product appears to be
2. likely target audience(s)
3. recurring pains or friction
4. desired outcomes
5. trust questions or buying resistance
6. native phrases worth keeping
7. generic language to avoid
8. what still feels unknown
9. weak claims to avoid early

Rules:
- do not invent outside facts; use only what is in the briefs
- do not restate marketing language; extract real signal
- keep uncertainty visible where it is real

Source briefs:
[product brief, wedge definition brief, mechanism brief, proof brief, comparison brief — pasted in full]
```
