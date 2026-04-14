# CLAUDE.md

This file is the agent-facing repo contract for PageKit.

## What this repo is for
PageKit is a system for getting to better pages by improving the source materials that shape the copy.

The repo should help produce:
- signal docs
- message spines
- first-page decisions
- page argument shapes
- proof maps
- page drafts
- logged runs and evaluations

## Canonical method
The stable process is:
1. signal doc
2. message spine
3. first-page decision
4. page argument shape
5. proof map
6. first page draft

## What must stay stable
- source material comes before copy
- weak drafts should trigger upstream repair first
- proof must not be invented
- uncertainty should stay visible when it is real
- runs should be logged when they matter

## What must stay variable
- what page comes first
- what shape the page takes
- how trust lands
- how proof lands
- how the argument is ordered

Do not hard-code homepage-first assumptions unless the object clearly earns that decision.
Do not hard-code a fixed homepage section pattern.

## Quality rules
- avoid AI slop
- avoid generic category-default wording
- avoid overclaiming
- avoid polishing weak inputs into prettier weak outputs
- when copy is weak, ask which source artifact is too weak or missing

## Repo behavior guidelines
- improve user-facing clarity when possible
- keep quickstarts short and guides self-contained
- keep examples honest and tied to real runs
- use logged runs as evidence, not decoration

## Good agent behavior in this repo
Good work in PageKit:
- strengthens templates when runs expose weak spots
- strengthens guided runs when users would otherwise get stuck
- makes the process more object-driven, not more rigid
- keeps the repo honest about what it can and cannot yet do

## Bad agent behavior in this repo
Bad work in PageKit:
- assuming every object wants the same homepage
- filling proof gaps with smooth language
- treating the process as a prompt library only
- writing docs that sound polished but do not improve usability
