# Perplexity Prompt Path

## What this guide is
A fully self-contained PageKit guide for running the whole process inside Perplexity.

Every prompt referenced below lives canonically in `prompts/`. Edit the source prompt, not this file.

## Best use of Perplexity here
Perplexity is strongest when outside research can strengthen the source layer early. Use it when category language, trust questions, comparisons or market context matter more than the average.

## What to gather before you start
- a plain-language product description
- your first audience hypothesis
- any known competitors or alternatives

## Rule
Use research to strengthen source material. Do not let the outside voice overpower the product voice. Mark any signal sourced from research as such in the signal doc.

## The artifact chain
1. [Signal doc](../prompts/01-signal-doc.md)
2. [Message spine](../prompts/02-message-spine.md)
3. [First-page decision](../prompts/03-first-page-decision.md)
4. [Page argument shape](../prompts/04-page-argument-shape.md)
5. [Proof map](../prompts/05-proof-map.md)
6. [First page draft](../prompts/06-first-page-draft.md)
7. [Claim check](../prompts/07-claim-check.md) — optional

## Step 1 — Signal doc
Prompt: [`prompts/01-signal-doc.md`](../prompts/01-signal-doc.md). Tell Perplexity to bring in outside category observations, but mark them clearly and keep them separate from assumptions about this product.

**Good output looks like**
- separates outside signal from product signal
- sharpens category language without replacing the product voice

---

## Step 2 — Message spine
Prompt: [`prompts/02-message-spine.md`](../prompts/02-message-spine.md). Keep any outside observations marked.

**Good output looks like**
- grounded in the product, not in category averages
- outside observations influence the spine without dominating it

---

## Step 3 — First-page decision
Prompt: [`prompts/03-first-page-decision.md`](../prompts/03-first-page-decision.md).

**Good output looks like**
- chooses the first page on purpose
- lines up with the trust questions surfaced in research
- lists candidates considered and rejected

---

## Step 4 — Page argument shape
Prompt: [`prompts/04-page-argument-shape.md`](../prompts/04-page-argument-shape.md).

**Good output looks like**
- structure follows the object, not category habit
- makes trust placement explicit

---

## Step 5 — Proof map
Prompt: [`prompts/05-proof-map.md`](../prompts/05-proof-map.md). Separate product proof from external context and category trust signals.

**Good output looks like**
- keeps external context from masquerading as product proof
- surfaces the gap between available and needed proof

---

## Step 6 — First page draft
Prompt: [`prompts/06-first-page-draft.md`](../prompts/06-first-page-draft.md). Keep the product voice primary.

**Good output looks like**
- inherits from the upstream work
- outside research is in service of the product voice, not ahead of it
- reads like a person wrote it (see `frameworks/anti-slop.md`)

---

## Step 7 — Claim check (optional durability pass)
Prompt: [`prompts/07-claim-check.md`](../prompts/07-claim-check.md).

**Scripted expansion**
`scripts/claim-check.sh <draft> <proof-map> --severity hard`.

---

## Core differences vs other tools
- strongest for early source enrichment and category sharpening
- especially useful for trust-heavy or comparison-heavy objects
- easiest tool to overuse if you let research replace actual positioning
