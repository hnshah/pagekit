---
step: "06"
name: first-page-draft
title: Draft the First Page
inputs:
  - signal-doc.md
  - message-spine.md
  - first-page-decision.md
  - page-argument-shape.md
  - proof-map.md
outputs:
  - first-page-draft.md
framework: frameworks/page-argument-shape.md
template: templates/page-argument-shape-template.md
notes: |
  The draft must respect the anti-slop constraints in
  frameworks/anti-slop.md. Unverified product claims get inline
  *[verification flag: ...]* markers.
---

# Prompt: 06 — First Page Draft

## When to use
After steps 01 through 05 are done and the proof map is tight.

## What good output looks like
- inherits structure from the argument shape
- stays inside the proof map
- reads as written by a person with a voice, not by a machine
- uses `*[verification flag: ...]*` for any product-specific claim not verified against briefs or ground truth

## Prompt

```text
Using the signal doc, message spine, first-page decision, page argument shape and proof map below, draft the page.

Do not add sections that were not earned by the argument-shape step.
Let the structure follow the approved page shape.

Proof and scope constraints:
- clarity over hype
- no fake proof
- no inflated mechanism claims
- avoid generic category language

Anti-slop constraints (hard rules — see frameworks/anti-slop.md):
- no "Not X. Not Y." heading or sentence pairs
- no "Not-X-but-Y" or "X-not-Y" rhetorical pivots unless they carry specific content the affirmation cannot
- no three parallel short sentences used for cadence (rule-of-three clustering)
- no sentence-start anaphora across three or more consecutive sentences
- no editorial voice narrating brand restraint, virtue or honesty
- no more than one em-dash per paragraph
- no "actually", "additionally", "testament", "landscape", "showcasing", "genuinely", "truly" as intensifiers
- no marketing-punchy one-liners as section enders
- no scare-quoted antithesis
- no "serves as / boasts / features / showcases / delivers / empowers" copula-avoidance
- no signposting ("let's dive in", "here's the thing", "that's the deal")
- no filler ("in order to", "due to the fact that")
- no significance inflation ("pivotal moment", "critical juncture")

When a product-specific claim has not been verified against the briefs, mark it inline with *[verification flag: ...]*.

Artifacts:
[PASTE HERE]
```

## If the draft is weak
Before heavy line editing, ask what source artifact is still too weak. Common fixes: wedge definition, mechanism brief, proof brief, comparison brief. Line edits rarely rescue a draft whose upstream materials are thin.
