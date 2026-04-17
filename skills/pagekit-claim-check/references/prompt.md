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
framework: ./framework.md
template: ./template.md
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
4. a correction, labeled with one of these dispositions:
   - **rewrite** — a sharper, more accurate replacement that lands inside the proof map and reads cleaner
   - **remove (wrong)** — cut the line; the claim is not supportable at any severity
   - **remove pending verification** — cut the line from the corrected draft AND flag it in the audit as "potentially restorable if <X> is confirmed in the briefs." A dropped claim and a disqualified claim are different things; the audit must preserve the distinction so a reviewer can decide whether to restore on verification.

Do not reward defensiveness.
A corrected claim should be more precise, not louder.

The corrected draft must be clean on its own terms: no inline annotation markers (`*[Rewritten: ...]*`, `*[Was: ...]*`) in body copy, and no new em-dashes introduced by the rewrites. The audit is where rewrite provenance lives; the corrected draft is publish-ready copy.

At the end, list any slop pattern that showed up more than once so upstream constraints (../../pagekit/references/anti-slop.md or page-argument-shape drafting constraints) can absorb it.

Then produce a corrected draft that resolves every flagged claim.

Draft:
{{DRAFT}}

Proof map:
{{PROOF_MAP}}
```

## Expansion

`scripts/claim-check.sh <draft> <proof-map> [--severity hard|normal|light]` substitutes `{{SEVERITY}}`, `{{DRAFT}}` and `{{PROOF_MAP}}` and writes the expanded prompt to stdout.
