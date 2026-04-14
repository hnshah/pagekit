# Homepage Draft — AI-First PM Tool (Chat Interface)

*Draft status: first pass, pre slop-check. Anti-slop rules applied during drafting per `frameworks/anti-slop.md`. Product specifics flagged for verification. Proof placeholders marked.*

---

## Section 1 — The maintenance problem (hero)

**Headline:**
Your project board reflects what your team was doing two weeks ago.

**Sub-headline:**
[Product name] is a project management tool where the AI maintains the board from your team's conversations, so the board reflects what is happening now.

**CTA:**
Start a trial →  ·  See how it works

---

*Draft note: the headline names a specific failure state rather than a pain category. "Two weeks ago" is a concrete detail that produces recognition — most teams with stale boards know exactly how stale it is. Test whether a tighter time reference (last week, last sprint) lands better for a specific audience segment.*

---

## Section 2 — Why AI bolt-ons leave the gap open

**Heading:** Most AI PM tools reduce the update work. They do not remove it.

**Body:**

When AI is added to an existing PM tool, it helps individual team members write better tickets, summarize threads, or find what they are looking for faster. That is useful, but it leaves the underlying model unchanged: a human still decides what enters the PM tool, and the PM tool still gets stale when no one has time to decide.

The gap between where work happens (conversation) and where it is tracked (the board) remains open. Someone still has to cross it.

---

*Draft note: this section describes a structural condition, not a competitor failure. It should feel like an observation the visitor would make themselves, not like a competitive claim. "Someone still has to cross it" is a plain consequence of the two-system model; it earns the next section.*

---

## Section 3 — How the AI maintains project structure

**Heading:** What the AI reads and what it creates.

**Body:**

*[Verification flag: confirm all four behaviors below against actual product capabilities before publishing.]*

When a team member writes that they have finished a task in a thread, the AI marks the corresponding item complete. When someone describes a dependency (for example: "waiting on the API spec before we can start this"), the AI creates the blocker link. When a new commitment is made in conversation, the AI creates the task. When a discussion signals that scope has shifted, the AI flags the change for the team to review rather than updating the board silently.

*[Verification flag: confirm the scope-change flag behavior — specifically whether this is a notification, a review queue item, or another mechanism.]*

The chat interface is where this happens because that is where the information already is. The board stays current because the AI is reading the same conversations the team is having, not waiting to be asked to update something.

---

*Draft note: the four behaviors are written as a single paragraph rather than a bullet list to avoid rule-of-three clustering. If any of the four cannot be confirmed against product capabilities, remove it before publishing — do not soften the claim to keep the count.*

---

## Section 4 — When the AI gets something wrong

**Heading:** What happens when the AI misses something or creates a task it should not have.

**Body:**

*[Verification flag: select and confirm the correction mechanism below before publishing.]*

The AI will sometimes interpret a conversational message as a task when it was not intended as one. When that happens, dismissing the mistaken item takes one click, and it does not affect anything else on the board.

When the AI misses a task that the team intended to track, a team member adds it manually — the same way they would have before, except it is the exception rather than the routine.

*[If the product has a pattern-learning mechanism from corrections: "The AI adjusts based on corrections, so the same type of message is less likely to produce a wrong result again." Confirm whether this is true before including it.]*

The goal is not a board maintained without any human input. The goal is a board where human input is the exception and the AI handling is the rule — which is the reverse of how most PM tools work.

---

*Draft note: the final sentence carries the core distinction. "The reverse of how most PM tools work" is a structural claim, not a competitive one. It earns its place because the prior section has described the AI behavior specifically enough that the reversal is concrete.*

---

## Section 5 — Proof

**Heading:** What teams found when they stopped maintaining the board manually.

*[Placeholder structure — do not publish without real team cases. Format shows the specificity level required.]*

---

**Case 1 — Engineering team without a PM**

*[Format: Team description (size, stage, what they were building), what project tracking looked like before (Slack for everything, board updated by whoever had time, or not at all), what they used [Product name] for and how they started, what the board looks like now, one specific outcome — a blocker caught earlier than it would have been, a standup that revealed less because the board already showed it, a sprint that closed more cleanly. 4–6 sentences. Real team name or description preferred. Do not invent outcomes or timelines.]*

---

**Case 2 — PM on a team growing past informal coordination**

*[Format: PM name and team description, what the manual update work looked like (chasing status, updating tickets after standups, cleaning the board before weekly reviews), what changed after using [Product name], whether the AI-maintained board was reliable enough for stakeholder reporting without a manual cleanup pass. Specific outcome. 4–6 sentences. Real name preferred.]*

---

## Section 6 — CTA

**Heading:** Try it with a real project.

**Body:**
*[Verification flag: confirm trial terms — length, whether a credit card is required, what the free tier includes if one exists.]*
Your first [X days] are free. Bring an active project and a team that is already in Slack. The board will reflect your project by the end of the first day without a setup session.

**CTA:**
Start a trial →

*[Secondary link: "Read the docs →" — for engineers who want to evaluate the technical model before committing.]*

---

## Draft notes

**What this draft does that earlier drafts in this repo did not:**
- Anti-slop rules applied during drafting rather than as a post-pass
- Four AI behaviors written as a single paragraph to avoid rule-of-three clustering
- Accuracy section present and specific rather than implied or omitted
- No editorial voice narrating brand restraint
- Section enders are concrete outcomes, not slogans

**What this draft needs before publication:**
- Section 3: all four AI behavior claims confirmed against the product
- Section 3: scope-change flag mechanism confirmed
- Section 4: correction mechanism confirmed; pattern-learning sentence confirmed or removed
- Section 5: real team cases inserted
- Section 6: trial terms confirmed

**The accuracy section (Section 4) is the most important section to get right before publishing.** A vague answer to the accuracy question will cost the page the engineering audience. A specific, honest answer (including that errors happen and here is how they are corrected) earns more trust than any claim of perfection.
