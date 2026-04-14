# Grok Prompt Path

## What this guide is
A fully self-contained PageKit guide for running the whole process inside Grok.

## Best use of Grok here
Grok is useful as a fast first-pass surface.
It benefits from firmer prompt control than Claude or the OpenAI baseline path.

## What to gather before you start
- a plain-language product description
- your first audience hypothesis

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
Be more explicit with constraints than you might need elsewhere.
For every step, name the artifact, say what not to do, and keep uncertainty visible.

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
- keeps uncertainty visible

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

Artifacts:
[PASTE HERE]
```

---

## Step 6 — First page draft

### Prompt
```text
Using the signal doc, message spine, first-page decision, page argument shape and proof map below, draft the page.

Do not add sections that were not earned by the argument-shape step.

Proof and scope constraints:
- clarity over hype
- no fake proof
- no inflated mechanism claims
- avoid generic category language

Anti-slop constraints (hard rules):
- no "Not X. Not Y." heading or sentence pairs
- no "Not-X-but-Y" or "X-not-Y" rhetorical pivots unless they carry specific content
- no three parallel short sentences used for cadence (rule-of-three clustering)
- no sentence-start anaphora across three or more consecutive sentences
- no editorial voice narrating brand restraint, virtue or honesty
- no more than one em-dash per paragraph
- no "actually", "additionally", "testament", "landscape", "showcasing", "genuinely", "truly" as intensifiers
- no marketing-punchy one-liners as section enders
- no scare-quoted antithesis
- no "serves as / boasts / features / showcases / delivers / empowers" copula-avoidance
- no signposting ("let's dive in", "here's the thing", "that's the deal")
- no filler ("in order to", "due to the fact that")
- no significance inflation ("pivotal moment", "critical juncture")

When a product-specific claim has not been verified against the briefs, mark it inline with *[verification flag: ...]*.

Artifacts:
[PASTE HERE]
```

---

## Step 7 — Claim check (optional durability pass)

### Prompt
```text
Review the draft below as a skeptical claim check at [severity: light / normal / hard].

For every claim that sounds stronger than the product or the proof map supports, flag it.
Also flag any line that carries an AI-slop pattern: Not-X-Not-Y stacking, rule-of-three cadence, sentence-start anaphora, editorial voice narrating brand restraint, em-dash stacking, intensifier vocabulary (actually / testament / landscape / showcasing / truly / genuinely), marketing-punchy enders, scare-quoted antithesis, copula-avoidance (serves as / boasts / features / showcases / delivers / empowers), signposting (let's dive in / here's the thing / that's the deal), filler (in order to / due to the fact that), significance inflation (pivotal moment / critical juncture).

For each flagged claim, give:
1. the exact line
2. the type (overclaim / vague / unsupported / outruns proof map / editorial voice / unsourced quantitative modifier / clinical or regulatory drift / ai-slop tell)
3. why it is weak
4. a sharper, more accurate replacement or a recommendation to cut

At the end, list any slop pattern that showed up more than once so upstream constraints can absorb it.

Draft:
[PASTE HERE]

Proof map:
[PASTE HERE]
```

---

## If the output drifts
Treat that first as a guardrail problem.
Tighten the prompt.
Then, if needed, strengthen the upstream source materials.

## Core differences vs other tools
- fast and usable
- more likely to drift if the prompt gets loose
- benefits from stronger explicit control than Claude or the baseline OpenAI path
