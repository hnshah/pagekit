# Slop Pass — Personal CRM for Startup Founders

## Page
Personal CRM for Startup Founders homepage draft, first pass.

## Severity
Hard.

## Reference
Patterns named below correspond to `frameworks/anti-slop.md`.

## Flagged lines

### Flag 1
**Line (Section 1 hero):** "You know who matters. You've lost track of where you are with them."
**Pattern:** sentence-start anaphora ("You…You…") + parallel two-sentence opener.
**Why weak:** the parallel shape is the tell. The headline is doing cadence work.
**Rewrite:** single headline — "The relationships matter. Keeping track of where you are with each of them is the part that slips." Keeps the recognition framing; drops the two-beat cadence.

---

### Flag 2
**Line (Section 2 body opener):** "Deal stages. Pipeline views. Lead scoring."
**Pattern:** rule-of-three rhythmic clustering.
**Why weak:** three short noun fragments as the section opener. AI cadence.
**Rewrite:** "A sales CRM models a pipeline: leads, stages, and a close at the end." Same content, one sentence.

---

### Flag 3
**Line (Section 2 body):** "your relationship with your lead investor doesn't close. Your relationship with your advisor doesn't have a stage."
**Pattern:** sentence-start anaphora ("Your…Your…") + parallel X-doesn't-Y constructions.
**Why weak:** same rhythm pattern back-to-back.
**Rewrite:** "An investor relationship has no close. An advisor relationship has no stage." Kept the content; varied the subject structure so the two sentences don't mirror each other.

---

### Flag 4
**Line (Section 2 body):** "most of them stop using it within a month"
**Pattern:** unsourced quantitative modifier ("most").
**Why weak:** no source for the quantity.
**Rewrite:** "often stop within the first few weeks." Still a claim, but not a quantitative one the draft can't defend.

---

### Flag 5
**Line (Section 2 body final):** "[Product name] doesn't model your contacts as leads. It tracks where you are with each person, and makes sure that matters before it becomes a problem."
**Pattern:** compound-clause filler + vague adverbial ("makes sure that matters before it becomes a problem").
**Why weak:** the second clause is doing work the first sentence already did.
**Rewrite:** "[Product name] does not treat your contacts as leads. It tracks where you are with each person and surfaces the relationships that are drifting before they go dormant." Replaces vague phrasing with a concrete behavior.

---

### Flag 6
**Line (Section 3 body):** "After a meeting, log what happened in under a minute. Who you spoke with, what was said, what the next step is. You're not filling out a pipeline form. You're making a note you'll actually want later."
**Pattern:** rule-of-three ("who you spoke with, what was said, what the next step is") + "actually" intensifier + sentence-start anaphora ("You're…You're…") + X-not-Y.
**Why weak:** four slop patterns in one paragraph.
**Rewrite:** "Log what happened after a meeting in under a minute: who was there, what was said, and what the next step is. The format is a note, not a pipeline form." Rule-of-three becomes a colon list with an Oxford comma; "actually" cut; "You're...You're..." collapsed.

---

### Flag 7
**Line (Section 3 body):** "Before a call, pull up the history: who made the introduction, what you talked about last time, what you said you'd follow up on. Walk in with context instead of starting from scratch."
**Pattern:** rule-of-three colon list + X-instead-of-Y ender.
**Why weak:** the colon list is rhythmic rather than exhaustive. The "instead of" ender is a rhetorical pivot.
**Rewrite:** "Before a call, pull up the history: who made the introduction, the last conversation, and any follow-up you had promised. You arrive with context instead of reconstructing it from email." Reworded to reduce the three-beat parallelism; the ender is rewritten to be a factual consequence rather than a rhetorical contrast.

---

### Flag 8
**Line (Section 4 body):** "These don't belong in a pipeline. They belong somewhere you can see them, track them, and make sure they don't go quiet when you're heads down building."
**Pattern:** internal rule-of-three ("see them, track them, make sure they don't go quiet").
**Why weak:** three-verb triad used for cadence.
**Rewrite:** "These relationships do not fit in a pipeline. They need a place where current state is visible so they do not go quiet while you are heads-down building." One verb, not three.

---

### Flag 9
**Line (Section 4 fragments):** "The investor who's been warm for three months but hasn't seen your latest update. The advisor you spoke to in January and meant to reconnect with in March. The customer who told you something important about the product and you want to remember when you're next in front of a design decision. The peer founder you should probably send something to before you need a favor."
**Pattern:** four parallel sentence fragments with "The X who…" anaphora.
**Why weak:** long parallel structure with repeated leading word.
**Decision:** kept. Each fragment names a distinct, concrete scenario the product serves. The parallel structure here carries content: these are the four audience archetypes the product recognizes. The `The X who…` shape is a list, not a cadence move. Shortened the fourth fragment slightly ("The peer founder you owe an intro to.") to reduce the weight.

---

### Flag 10
**Line (Section 5 body opener):** "Every founder has a CRM graveyard. A spreadsheet that was current in January. A Notion database that made sense when they set it up. An app they logged three things into."
**Pattern:** rule-of-four parallel fragments.
**Why weak:** rhythmic triad stretched to four. Each fragment is concrete, but the cadence still reads.
**Rewrite:** "Most founders have a CRM graveyard: a spreadsheet that was current in January, a Notion database that made sense when they set it up, an app they logged three things into." Same content, collapsed into a colon list in one sentence.

---

### Flag 11
**Line (Section 5 body):** "You need to log interactions — it works best when you do that once after a meeting, not once a month when you remember. What it gives you in return: every time you open it, you know exactly where you are with each person. No reconstruction. No scanning through emails trying to remember what you sent last week."
**Pattern:** em-dash stacking + X-not-Y + No-X-No-Y.
**Why weak:** three slop patterns in one paragraph.
**Rewrite:** "It works best when you log interactions right after a meeting rather than once a month when you remember. What you get back: every time you open it, you know where you are with each person without scanning through email to reconstruct it." Em-dash replaced with sentence break; No-X-No-Y collapsed into one prepositional phrase.

---

### Flag 12
**Line (Section 5 body final):** "If you log consistently, you'll stop dropping the ball on relationships that matter. That's the deal."
**Pattern:** "That's the deal." signposting.
**Why weak:** announces the deal instead of letting it stand.
**Rewrite:** "If you log consistently, the ball stops getting dropped on relationships that matter." The signposting line is cut.

---

### Flag 13
**Line (Section 7 heading):** "Stop losing track of the people who matter."
**Pattern:** marketing-punchy section ender, borderline.
**Why weak:** CTA heading uses the imperative "Stop X-ing" which is a common slop shape.
**Rewrite:** "Keep track of the people who matter." Positive framing; same information; fewer AI tells.

---

## Summary

### Strongest remaining risks after rewrite
- Section 4's parallel fragments are the one pattern I kept (Flag 9). If a second pass reads them as still rhythmic, collapse into prose.
- Section 3's "The format is a note, not a pipeline form." still contains a mild X-not-Y. Kept because the contrast is the content, not cadence.

### Recurring slop patterns on this draft
- **Rule-of-three / rule-of-four rhythmic clustering** (flags 2, 6, 7, 8, 10) — 5 times. Most common pattern on this draft.
- **Sentence-start anaphora** (flags 1, 3, 6) — 3 times.
- **X-not-Y / X-instead-of-Y / No-X-No-Y** (flags 6, 7, 11) — 3 times.
- **Em-dash stacking** (flag 11) — 1 time.
- **Signposting** (flag 12) — 1 time.

### Where proof is the real gap
- "most of them stop using it within a month" was the one proof-adjacent issue; softened to a non-quantitative claim.

### Upstream artifact that needs repair
- Page argument shape. The original drafting-constraints list did not forbid rule-of-three clustering. The updated template now does.

### Net
- 12 lines rewritten; 1 kept after review (Flag 9).
- Content preserved. Argument order unchanged. Verification flags preserved.
- Section 4's parallel-fragment move kept because each fragment carries content. All other rhythmic clusters cut or compressed.
