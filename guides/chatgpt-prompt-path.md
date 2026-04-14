# ChatGPT Prompt Path

## What this guide is
A fully self-contained PageKit guide for running the whole process inside ChatGPT.

## Best use of ChatGPT here
ChatGPT is a strong default path when you want a clean, simple and comparable prompt workflow.
Use it as the baseline path.

## What to gather before you start
- a plain-language product description
- your first audience hypothesis
- any customer language you already have
- competitors or alternatives if relevant
- the page you want to create first

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
If an artifact is weak, fix it before moving on.

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

Product description:
[PASTE HERE]
```

### Good output looks like
- separates observation from assumption
- gives you sharper language than the category default
- exposes what is still unknown

### If the output is weak
If it feels generic or category-level, stop.
Create a wedge-definition brief before moving on.

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

Signal doc:
[PASTE HERE]
```

### Good output looks like
- gives the page a clear center of gravity
- sharpens the pain
- avoids generic category language

### If the output is weak
If it still feels too abstract, add stronger source material first:
- mechanism brief
- proof brief
- comparison brief

---

## Step 3 — First page decision

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
- explains why this page is stronger than the obvious default
- makes trust and proof burden explicit

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
- determines the page shape from the object
- avoids default section habits
- gives the draft step a clearer and more honest structure

---

## Step 5 — Proof map

### Prompt
```text
Using the current PageKit artifacts, define the proof map for the first page.

Do not write page copy yet.
Map:
1. what the page can honestly claim now
2. what it does not yet have proof for
3. safe credibility moves
4. risky or inflated moves to avoid
5. where proof lands in the approved argument shape
6. what each approved section can say safely

Artifacts:
[PASTE HERE]
```

### Good output looks like
- protects against overclaiming
- makes the draft safer and more honest

---

## Step 6 — First page draft

### Prompt
```text
Using the signal doc, message spine, first-page decision, page argument shape and proof map below, draft the page.

Do not add sections that were not earned by the argument-shape step.
Let the structure follow the approved page shape.

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
- clearly inherits from the upstream work
- feels sharper than category-default copy
- stays honest about proof and mechanism

### If the draft is weak
Do not jump straight to line edits.
Ask what source artifact is still too weak.
That is usually where the real improvement lives.

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

### Good output looks like
- names specific lines, not general impressions
- separates overclaim, vague, unsupported and proof-map-outrun
- proposes replacements that are more precise than the originals

---

## Core differences vs other tools
- better as a clean baseline than as a research-heavy tool
- good for comparable runs
- less specialized than Perplexity on source enrichment
- less naturally long-context iterative than Claude
