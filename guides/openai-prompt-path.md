# OpenAI Prompt Path

## What this guide is
A fully self-contained PageKit guide for running the whole process inside OpenAI model surfaces.

Every prompt referenced below lives canonically in `prompts/`. Edit the source prompt, not this file.

If you are using **OpenAI Codex** (the CLI), skip this guide and see `agentic/codex-agentic-path.md` — `AGENTS.md` + the scripts drive the chain.

## Best use here
Use this as the neutral baseline prompt path. Good for users who want the method without much tool-specific behavior, and for comparable runs across models.

## What to gather before you start
- a plain-language product description
- your first audience hypothesis

## The artifact chain
1. [Signal doc](../prompts/01-signal-doc.md)
2. [Message spine](../prompts/02-message-spine.md)
3. [First-page decision](../prompts/03-first-page-decision.md)
4. [Page argument shape](../prompts/04-page-argument-shape.md)
5. [Proof map](../prompts/05-proof-map.md)
6. [First page draft](../prompts/06-first-page-draft.md)
7. [Claim check](../prompts/07-claim-check.md) — optional

## Step 1 — Signal doc
Prompt: [`prompts/01-signal-doc.md`](../prompts/01-signal-doc.md).

---

## Step 2 — Message spine
Prompt: [`prompts/02-message-spine.md`](../prompts/02-message-spine.md).

---

## Step 3 — First-page decision
Prompt: [`prompts/03-first-page-decision.md`](../prompts/03-first-page-decision.md).

---

## Step 4 — Page argument shape
Prompt: [`prompts/04-page-argument-shape.md`](../prompts/04-page-argument-shape.md).

---

## Step 5 — Proof map
Prompt: [`prompts/05-proof-map.md`](../prompts/05-proof-map.md).

---

## Step 6 — First page draft
Prompt: [`prompts/06-first-page-draft.md`](../prompts/06-first-page-draft.md).

---

## Step 7 — Claim check (optional durability pass)
Prompt: [`prompts/07-claim-check.md`](../prompts/07-claim-check.md).

**Scripted expansion**
`scripts/claim-check.sh <draft> <proof-map> --severity hard`.

---

## If the draft comes back generic
Do not keep hammering the final draft prompt. Go upstream and improve the source materials.

## Core differences vs other tools
- best neutral baseline
- strong for comparable runs
- not as research-native as Perplexity
- not as naturally iterative as Claude
- less mechanized than Codex (where AGENTS.md + scripts can drive the chain)
