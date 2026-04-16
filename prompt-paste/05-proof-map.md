---
step: "05"
name: proof-map
title: Map Proof to the Page
inputs:
  - first-page-decision.md
  - page-argument-shape.md
outputs:
  - proof-map.md
framework: frameworks/proof-map.md
template: templates/proof-map-template.md
---

# Prompt: 05 — Proof Map

## When to use
After the argument shape exists. Before the draft.

## What good output looks like
- commits to what the page can honestly claim today
- names what the page cannot yet support
- maps proof to specific argument moves, not to the page in general
- makes the gap between available proof and needed proof visible

## Prompt

```text
Using the current PageKit artifacts, define the proof map for the first page.

Do not write page copy yet.
Map:
1. what the page can honestly claim now
2. what it does not yet have proof for
3. safe credibility moves
4. risky or inflated moves to avoid
5. where proof lands in the approved argument shape (section by section)
6. what each approved section can say safely

Artifacts:
[PASTE HERE]
```

## If proof is thin
Do not invent. Name the gap and let the draft stay honestly narrower. If the gap is large, a proof brief upstream (in `sources/`) is the right fix.
