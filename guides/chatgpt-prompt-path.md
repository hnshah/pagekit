# ChatGPT Prompt Path

## What this guide is
A fully self-contained PageKit guide for running the whole process inside ChatGPT.

Every prompt referenced below lives canonically in `prompts/`. **Do not copy the prompt text into this file.** Edit the source prompt and this guide picks up the change automatically.

## Best use of ChatGPT here
ChatGPT is the default baseline path. Clean, simple, comparable across runs. Good for people who want the method without tool-specific tricks.

## What to gather before you start
- a plain-language product description
- your first audience hypothesis
- any customer language you already have
- competitors or alternatives if relevant
- the page you want to create first (optional — step 03 decides)

## The artifact chain
Run these in order. Prompt for each step is linked; paste it into ChatGPT with the required inputs substituted.

1. [Signal doc](../prompts/01-signal-doc.md)
2. [Message spine](../prompts/02-message-spine.md)
3. [First-page decision](../prompts/03-first-page-decision.md)
4. [Page argument shape](../prompts/04-page-argument-shape.md)
5. [Proof map](../prompts/05-proof-map.md)
6. [First page draft](../prompts/06-first-page-draft.md)
7. [Claim check](../prompts/07-claim-check.md) — optional durability pass

**Do not skip ahead.** If an artifact is weak, fix the upstream source before moving on.

## Step 1 — Signal doc

Prompt: [`prompts/01-signal-doc.md`](../prompts/01-signal-doc.md).

**Good output looks like**
- separates observation from assumption
- gives you sharper language than the category default
- exposes what is still unknown

**If the output is weak**
Stop. Create a wedge-definition brief (`templates/wedge-definition-template.md`) before moving on.

---

## Step 2 — Message spine

Prompt: [`prompts/02-message-spine.md`](../prompts/02-message-spine.md).

**Good output looks like**
- names the two to four truths strong enough to organize pages
- sharpens the pain
- does not yet decide which page to build

**If the output is weak**
Add sharper source material first: mechanism brief, proof brief, or comparison brief.

---

## Step 3 — First-page decision

Prompt: [`prompts/03-first-page-decision.md`](../prompts/03-first-page-decision.md).

**Good output looks like**
- chooses the first page on purpose
- explains why this page beats the obvious default
- lists candidates considered and rejected
- makes trust and proof burden explicit

---

## Step 4 — Page argument shape

Prompt: [`prompts/04-page-argument-shape.md`](../prompts/04-page-argument-shape.md).

**Good output looks like**
- structure comes from the object, not category habit
- names sections the page does not need, not only sections it does
- carries the anti-slop drafting constraints forward to step 6

---

## Step 5 — Proof map

Prompt: [`prompts/05-proof-map.md`](../prompts/05-proof-map.md).

**Good output looks like**
- protects against overclaiming
- surfaces the gap between available and needed proof
- maps proof to specific argument moves, not to the page in general

---

## Step 6 — First page draft

Prompt: [`prompts/06-first-page-draft.md`](../prompts/06-first-page-draft.md).

**Good output looks like**
- inherits from the upstream work
- stays honest about proof and mechanism
- reads like a person wrote it, not a machine (see `frameworks/anti-slop.md`)
- uses `*[verification flag: ...]*` for unverified product-specific claims

**If the draft is weak**
Do not jump to line edits. Ask what upstream artifact is still too weak. That is where the real improvement lives.

---

## Step 7 — Claim check (optional durability pass)

Prompt: [`prompts/07-claim-check.md`](../prompts/07-claim-check.md).

**Good output looks like**
- names specific lines, not general impressions
- separates claim types cleanly (overclaim / vague / unsupported / outrun proof map / editorial voice / unsourced quantitative / clinical drift / ai-slop tell)
- proposes replacements that are more precise than the originals
- names recurring patterns so upstream constraints can absorb them

**Scripted expansion**
From the repo: `scripts/claim-check.sh <draft-path> <proof-map-path> --severity hard`. Writes the expanded prompt to stdout for pasting into ChatGPT.

---

## Core differences vs other tools
- best as a clean baseline
- strong for comparable runs across models
- not as research-native as Perplexity
- not as naturally long-context iterative as Claude
