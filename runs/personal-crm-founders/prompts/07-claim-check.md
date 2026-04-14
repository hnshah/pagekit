<!--
This file starts as a copy of prompts/07-claim-check.md (the canonical prompt for this step).
When you run the step:
1. Substitute the required inputs into the prompt.
2. Save the version you actually sent to the model here.
3. Save the raw output to outputs/07-claim-check-output.md.
-->

---
step: "07"
name: claim-check
title: Claim Check (optional durability pass)
required: false
inputs:
  - first-page-draft.md
  - proof-map.md
outputs:
  - claim-check.md
  - first-page-draft-corrected.md
framework: frameworks/claim-checking.md
template: templates/claim-check-template.md
severity_options: [light, normal, hard]
default_severity: normal
notes: |
  Severity is a required argument. Record the choice and why.
  scripts/claim-check.sh expands this prompt with a draft, a proof map
  and a severity setting.
---

# Prompt: 07 — Claim Check

## When to use
After the first page draft exists. Before treating the draft as publishable.

## Severity
Record the severity chosen and why.

- **light** — flag clear overclaims, unsupported claims and the strongest slop tells only.
- **normal** — flag the full list below, tolerate mild editorial voice and mild unsourced modifiers where they sit inside common usage.
- **hard** — flag any unsourced modifier, any editorial voice, any clinical drift, any external-credential description beyond what the briefs support, any slop pattern however small.

## What good output looks like
- names specific lines, not general impressions
- separates claim types by kind (overclaim / vague / unsupported / outrun / editorial voice / unsourced quantitative / clinical drift / ai-slop tell)
- proposes replacements that are sharper and more accurate than the originals
- ends with a list of recurring patterns so upstream constraints can absorb them

## Prompt

```text
Review the draft below as a skeptical claim check at severity: {{SEVERITY}}.

For every claim that sounds stronger than the product or the proof map supports, flag it.
Also flag any line that carries an AI-slop pattern: Not-X-Not-Y stacking, rule-of-three cadence, sentence-start anaphora, editorial voice narrating brand restraint, em-dash stacking, intensifier vocabulary (actually / testament / landscape / showcasing / truly / genuinely), marketing-punchy enders, scare-quoted antithesis, copula-avoidance (serves as / boasts / features / showcases / delivers / empowers), signposting (let's dive in / here's the thing / that's the deal), filler (in order to / due to the fact that), significance inflation (pivotal moment / critical juncture).

For each flagged claim, give:
1. the exact line
2. the type (overclaim / vague / unsupported / outruns proof map / editorial voice / unsourced quantitative modifier / clinical or regulatory drift / ai-slop tell)
3. why it is weak
4. a sharper, more accurate replacement or a recommendation to cut

Do not reward defensiveness.
A corrected claim should be more precise, not louder.

At the end, list any slop pattern that showed up more than once so upstream constraints (frameworks/anti-slop.md or page-argument-shape drafting constraints) can absorb it.

Then produce a corrected draft that resolves every flagged claim.

Draft:
{{DRAFT}}

Proof map:
{{PROOF_MAP}}
```

## Expansion

`scripts/claim-check.sh <draft> <proof-map> [--severity hard|normal|light]` substitutes `{{SEVERITY}}`, `{{DRAFT}}` and `{{PROOF_MAP}}` and writes the expanded prompt to stdout.
