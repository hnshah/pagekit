# Perplexity Prompt Path

## What this guide is
A fully self-contained PageKit guide for running the whole process inside Perplexity.

## Best use of Perplexity here
Perplexity is strongest when outside research can improve the source layer early.
Use it when category language, trust questions, comparisons or market context are especially important.

## What to gather before you start
- a plain-language product description
- your first audience hypothesis
- any known competitors or alternatives

## The artifact chain
Run these in order:
1. signal doc
2. message spine
3. first-page decision
4. page argument shape
5. proof map
6. first page draft
7. claim check (optional durability pass)

Do not skip ahead.
Do not assume which page we are building until step 3.

## Rule
Use research to strengthen the source material.
Do not let the outside voice overpower the product voice.

## Step 1 — Signal doc

### Prompt
```text
I want to build a web page through the PageKit process.

Do not write page copy yet.
Do not assume which page we are building.
Help me build a signal doc first.

Using the product description below, produce a signal doc with these sections:
1. what the product appears to be
2. likely target audience(s)
3. recurring pains or friction
4. desired outcomes
5. trust questions or buying resistance
6. native phrases worth keeping
7. generic language to avoid
8. what still feels unknown
9. weak claims to avoid early

Where useful, bring in outside category observations, but mark them clearly and keep them separate from assumptions about this product.

Product description:
[PASTE HERE]
```

### Good output looks like
- separates outside signal from product signal
- sharpens category language without replacing the product voice
- surfaces trust questions the product will need to answer

---

## Step 2 — Message spine

### Prompt
```text
Using the signal doc below, reduce it into a message spine.

Do not decide which page we are building yet.
Do not write page copy yet.
Do not invent proof.

Give me:
1. core truth
2. target audience
3. sharp pain statement
4. desired shift or outcome
5. strongest language to preserve
6. page-level message implications
7. key trust question to answer
8. weak directions to avoid

Keep any outside observations marked.

Signal doc:
[PASTE HERE]
```

### Good output looks like
- the spine is grounded in the product, not in category averages
- outside observations influence the spine without dominating it

---

## Step 3 — First-page decision

### Prompt
```text
Using the message spine below, decide what page should exist first.

Do not assume homepage by default.

Define:
1. the best first page candidate
2. why this page first
3. the page's job
4. visitor state on arrival
5. main trust burden
6. main proof burden
7. what this rules out for now

Message spine:
[PASTE HERE]
```

### Good output looks like
- chooses the first page on purpose
- explains why this page beats the obvious default
- lines up with the trust questions surfaced in research

---

## Step 4 — Page argument shape

### Prompt
```text
Using the first-page decision below, design the page's argument shape.

Do not draft the page yet.
Do not assume a standard homepage structure.

Define:
1. what the visitor needs to understand first
2. what must be earned next
3. what order the argument should follow
4. what sections actually belong on this page
5. what sections would be unnecessary or harmful
6. where trust should land
7. where proof should land
8. drafting constraints

First-page decision:
[PASTE HERE]
```

### Good output looks like
- structure follows the object, not category habit
- makes trust placement explicit

---

## Step 5 — Proof map

### Prompt
```text
Using the current PageKit artifacts, define the proof map for the first page.

Do not write page copy yet.

Separate:
- product proof that exists today
- external context and category trust signals
- claims the page cannot yet support

Map:
1. what the page can honestly claim now
2. what it does not yet have proof for
3. safe credibility moves
4. risky or inflated moves to avoid
5. where proof lands in the approved argument shape

Artifacts:
[PASTE HERE]
```

### Good output looks like
- keeps external context from masquerading as product proof
- surfaces the gap between available and needed proof

---

## Step 6 — First page draft

### Prompt
```text
Using the signal doc, message spine, first-page decision, page argument shape and proof map below, draft the page.

Do not add sections that were not earned by the argument-shape step.
Keep the product voice primary.

Constraints:
- clarity over hype
- no fake proof
- no inflated mechanism claims
- avoid generic category language
- avoid not-X-but-Y constructions

Artifacts:
[PASTE HERE]
```

### Good output looks like
- draft clearly inherits from the upstream work
- outside research is in service of the product voice, not ahead of it

---

## Step 7 — Claim check (optional durability pass)

### Prompt
```text
Review the draft below as a skeptical claim check.

For every claim that sounds stronger than the product or the proof map supports, flag it.

For each flagged claim, give:
1. the exact line
2. the type (overclaim, vague, unsupported, outruns proof map)
3. why it is weak
4. a sharper, more accurate replacement or a recommendation to cut

Do not reward defensiveness.
A corrected claim should be more precise, not louder.

Draft:
[PASTE HERE]

Proof map:
[PASTE HERE]
```

---

## Core differences vs other tools
- strongest for early source enrichment and category sharpening
- especially useful for trust-heavy or comparison-heavy objects
- easiest tool to overuse if you let research replace actual positioning
