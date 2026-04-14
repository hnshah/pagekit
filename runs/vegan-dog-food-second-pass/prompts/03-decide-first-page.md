# Prompt 03 — First-Page Decision

## Step
03 — First-page decision

## Objective
Decide which page should exist first for Kind Bowl, without assuming homepage by default.

## Model
Claude (Claude Code, Opus 4.6)

## Inputs used
- message-spine.md
- sources/02-product-brief.md
- sources/05-proof-brief.md

## Prompt

```text
Using the message spine below, decide what page should exist first.

Do not assume homepage by default.
Consider at least three candidate first pages and reject the ones that do not earn it.

Define:
1. the best first page candidate
2. why this page first
3. the page's job
4. visitor state on arrival
5. main trust burden
6. main proof burden
7. what this rules out for now
8. candidates considered and rejected, with why

Message spine:
[message spine pasted in full]
```
