---
step: "01"
name: signal-doc
title: Build a Signal Doc
inputs:
  - product-brief (or raw product description)
outputs:
  - signal-doc.md
framework: ./framework.md
template: ./template.md
---

# Prompt: 01 — Signal Doc

## When to use
At the start of a PageKit run. Before any page decision, before any spine, before any draft.

## What good output looks like
- separates observation from assumption
- gives sharper language than the category default
- exposes what is still unknown
- distinguishes audiences where it matters

## Prompt

```text
I want to build a web page through the PageKit process.

Do not write page copy yet.
Do not assume which page we are building.
Help me build a signal doc first.

Using the product description (and any source briefs) below, produce a signal doc with these sections:
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

Source material:
[PASTE HERE]
```

## If the output is weak
Stop. Before moving to step 02, create a sharper source artifact (wedge definition, mechanism brief, proof brief, comparison brief). See `./wedge-definition-template.md`.
