# Claude Prompt Path

## What this guide is
A fully self-contained PageKit guide for running the whole process inside Claude.

Every prompt referenced below lives canonically in `prompts/`. Edit the source prompt, not this file.

If you are using **Claude Code** (the CLI), skip this guide and see `agentic/claude-code-agentic-path.md` — the `.claude/skills/pagekit/` skill drives the chain end-to-end.

## Best use of Claude here
Claude is strongest when you want to keep the full artifact chain visible in one conversation and iterate carefully from it. Long-context continuity is the reason to pick this path over others.

## What to gather before you start
- a plain-language product description
- your first audience hypothesis
- any customer language you already have
- competitors or alternatives if relevant

## The artifact chain
Run these in order. Keep every artifact in the thread and ask Claude to work from the full chain at every step.

1. [Signal doc](../prompts/01-signal-doc.md)
2. [Message spine](../prompts/02-message-spine.md)
3. [First-page decision](../prompts/03-first-page-decision.md)
4. [Page argument shape](../prompts/04-page-argument-shape.md)
5. [Proof map](../prompts/05-proof-map.md)
6. [First page draft](../prompts/06-first-page-draft.md)
7. [Claim check](../prompts/07-claim-check.md) — optional

## Step 1 — Signal doc
Prompt: [`prompts/01-signal-doc.md`](../prompts/01-signal-doc.md).

**Good output looks like**
- separates observation from assumption
- gives sharper language than the category default
- exposes what is still unknown

**If weak**
Create a wedge-definition brief (`templates/wedge-definition-template.md`) before moving on.

---

## Step 2 — Message spine
Prompt: [`prompts/02-message-spine.md`](../prompts/02-message-spine.md).

**Good output looks like**
- clear center of gravity
- sharpens the pain
- avoids generic category language

**If weak**
Add sharper source material: mechanism brief, proof brief, comparison brief.

---

## Step 3 — First-page decision
Prompt: [`prompts/03-first-page-decision.md`](../prompts/03-first-page-decision.md).

**Good output looks like**
- chooses the first page on purpose
- explains why this page beats the obvious default
- lists candidates considered and rejected

---

## Step 4 — Page argument shape
Prompt: [`prompts/04-page-argument-shape.md`](../prompts/04-page-argument-shape.md).

**Good output looks like**
- derives structure from the object
- avoids default section habits
- names sections the page does not need

---

## Step 5 — Proof map
Prompt: [`prompts/05-proof-map.md`](../prompts/05-proof-map.md).

**Good output looks like**
- protects against overclaiming
- surfaces the gap between available and needed proof

---

## Step 6 — First page draft
Prompt: [`prompts/06-first-page-draft.md`](../prompts/06-first-page-draft.md).

**Good output looks like**
- inherits from the upstream work
- stays honest about proof and mechanism
- reads like a person wrote it, not a machine (see `frameworks/anti-slop.md`)

**If weak**
Ask what upstream source artifact is still missing or too weak. Common fixes: wedge definition, mechanism brief, proof brief, comparison brief.

---

## Step 7 — Claim check (optional durability pass)
Prompt: [`prompts/07-claim-check.md`](../prompts/07-claim-check.md).

**Good output looks like**
- names specific lines, not general impressions
- separates claim types cleanly
- proposes replacements that are more precise than the originals

**Scripted expansion**
`scripts/claim-check.sh <draft> <proof-map> --severity hard`.

---

## Core differences vs other tools
- best for iterative refinement with the full chain visible
- strongest long-context continuity across steps
- less research-native than Perplexity
- less mechanized than Claude Code (where skills drive the chain)
