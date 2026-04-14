# Grok Prompt Path

## What this guide is
A fully self-contained PageKit guide for running the whole process inside Grok.

Every prompt referenced below lives canonically in `prompts/`. Edit the source prompt, not this file.

## Best use of Grok here
Grok is useful as a fast first-pass surface. It benefits from firmer prompt control than Claude or the OpenAI baseline path — the anti-slop constraints in the prompts are especially important.

## What to gather before you start
- a plain-language product description
- your first audience hypothesis

## Rule
Be more explicit with constraints than you might need elsewhere. For every step, name the artifact, say what not to do, and keep uncertainty visible.

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
Prompt: [`prompts/06-first-page-draft.md`](../prompts/06-first-page-draft.md). Grok benefits from the anti-slop constraints block being emphasized; do not trim them when pasting.

---

## Step 7 — Claim check (optional durability pass)
Prompt: [`prompts/07-claim-check.md`](../prompts/07-claim-check.md).

**Scripted expansion**
`scripts/claim-check.sh <draft> <proof-map> --severity hard`.

---

## If the output drifts
Treat that first as a guardrail problem: tighten the prompt. Then, if needed, strengthen the upstream source materials.

## Core differences vs other tools
- fast and usable
- more likely to drift if the prompt gets loose
- benefits from stronger explicit control than Claude or the baseline OpenAI path
