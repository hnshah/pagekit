# Slop Pass — Vegan Dog Food Brand (Fresh Run)

## Page
Vegan dog food homepage draft, fresh-run first pass.

## Severity
Hard.

## Reference
Patterns named below correspond to `frameworks/anti-slop.md`.

## Flagged lines

### Flag 1
**Line (Section 1 headline):** "Your dog can thrive on this. Here's the nutrition behind it."
**Pattern:** "Here's the X" signposting + two-sentence cadence.
**Why weak:** "Here's" announces instead of showing. The two-sentence split is rhythmic.
**Rewrite:** "Dogs can thrive on a well-formulated plant-based diet. Here is how this one is formulated." The claim becomes category-level (which the page then earns), and the second sentence orients without using the signposting contraction.

---

### Flag 2
**Line (Section 1 supporting line):** "Made for owners who want their dog healthy and their conscience clear — in that order."
**Pattern:** em-dash + editorial voice ("in that order" announces brand priority).
**Why weak:** the em-dash ending is a rhetorical beat. "In that order" narrates the brand's framing choice.
**Rewrite:** rolled into the sub-headline as "...nutritionally sound and aligned with their values, in that nutrition-first order." The phrase "in that nutrition-first order" reads as page organization rather than brand stance.

---

### Flag 3
**Line (Section 2 body opener):** "Most dog food labels say 'complete and balanced.' The difference is in what's behind the claim."
**Pattern:** quoted antithesis + "The difference is in X" phrase + unsourced quantitative ("most").
**Why weak:** scare-quoted phrase contrasted with an implicit counter; "The difference is in" is stock rhetorical scaffolding.
**Rewrite:** "'Complete and balanced' is a specific claim tied to a nutrient-profile standard. What varies between brands is what sits behind the claim." Keeps the content; drops the quoted-antithesis frame.

---

### Flag 4
**Line (Section 2 body, paragraph 3):** "The formula was developed [with / reviewed by] a board-certified veterinary nutritionist. [If true, name them or their credentials. If not, remove this sentence entirely — do not imply it.]"
**Pattern:** the bracketed note is draft instruction, not copy — not flagged. The sentence itself is fine.
**Decision:** no change to the copy; kept the verification instruction intact.

---

### Flag 5
**Line (Section 2 body, final):** "It meets AAFCO nutritional profiles for [life stage — adult maintenance / all life stages]. That means it has been verified against the same standard as conventional dog food — not held to a lower bar because it's plant-based."
**Pattern:** em-dash ending with an editorial-voice clause ("not held to a lower bar") + X-not-Y framing.
**Why weak:** the "not held to a lower bar" clause announces brand discipline.
**Rewrite:** "That is the same nutrient-profile standard used by conventional adult dog food." Factual equivalence without the em-dash editorializing.

---

### Flag 6
**Line (Section 3 body opener):** "This is the question most brands skip. We don't."
**Pattern:** editorial voice narrating brand virtue + unsourced quantitative ("most brands").
**Why weak:** announces brand restraint.
**Rewrite:** "Palatability is a real failure point for this category and is worth addressing directly." States the fact and the intent without editorializing about what other brands do.

---

### Flag 7
**Line (Section 3 Version B):** "Most dogs transition within [X days] with a gradual mix-in"
**Pattern:** unsourced quantitative modifier ("most dogs") with a bracketed placeholder for a specific number.
**Why weak:** "Most dogs" is a quantitative claim with no source; the placeholder makes it worse.
**Rewrite:** "Start with a sample before committing to a full bag. Transition guidance ships with the first order." Removed the quantified claim entirely; the specific duration was not defensible.

---

### Flag 8
**Line (Section 3 Version C):** "Most dogs adjust within two to four weeks when the change is made gradually."
**Pattern:** unsourced quantitative modifier.
**Why weak:** same as flag 7.
**Rewrite:** "Transitioning dogs from meat-based food takes time, usually several weeks with a gradual mix-in." Softer hedge; no quantitative claim.

---

### Flag 9
**Line (Section 4 body):** "Rendered byproducts. Unnamed meat meals. Ingredients that most owners, if they read the label carefully, would prefer their dog wasn't eating."
**Pattern:** rule-of-three parallel fragments + unsourced quantitative ("most owners").
**Why weak:** three parallel noun-fragments for cadence, plus "most owners" as unsourced.
**Rewrite:** "Conventional dog food is often made from rendered byproducts and unnamed meat meals — the parts of factory-farmed animals that are not sold elsewhere. Many owners, if they read the label carefully, would prefer their dog was not eating that." Rule-of-three collapsed into prose. "most" softened to "many" (still a quantitative hedge but a normal one, not a confident claim); retained the clause structure because the content is specific.

---

### Flag 10
**Line (Section 4 body final):** "[Product name] contains no animal-derived ingredients. Your dog eats well. Nothing suffers for it."
**Pattern:** rule-of-three + marketing-punchy ender ("Nothing suffers for it.").
**Why weak:** three parallel short sentences; the last one is a slogan.
**Rewrite:** "[Product name] contains no animal-derived ingredients. For values-led owners, the switch removes the dissonance of feeding their dog factory-farmed meat while holding values that oppose it." Rule-of-three collapsed; marketing-punchy ender cut and replaced with a sentence that describes what the switch does for the buyer.

---

### Flag 11
**Line (Section 4 body final two sentences):** "That's not a marketing position. It's just what the food is made of."
**Pattern:** editorial voice narrating brand honesty + X-not-Y pivot.
**Why weak:** the sentence exists to announce the brand's non-marketing-ness.
**Rewrite:** cut entirely.

---

### Flag 12
**Line (Section 6 / CTA heading):** "Start with what's right for your dog."
**Pattern:** marketing-punchy section heading.
**Why weak:** sounds written for a billboard rather than a functional CTA.
**Rewrite:** "Try it for your dog."

---

## Summary

### Strongest remaining risks after rewrite
- Section 4 still uses "Many owners, if they read the label carefully, would prefer their dog was not eating that." This is a hedged quantitative claim. Kept because "many" is the honest description and because dropping it would weaken the section's factual basis.
- Section 2's "What complete and balanced means here." heading borrows a slop-adjacent shape ("what X means here"). Acceptable as a plain explanatory heading; would escalate to flag if it recurred in multiple sections.

### Recurring slop patterns on this draft
- **Unsourced quantitative modifiers** (flags 3, 7, 8, 9) — 4 times. Dominant pattern on this draft, more so than on OpenClaw or CRM. The draft reaches for "most" as a softener.
- **Editorial voice narrating brand restraint/virtue** (flags 2, 5, 6, 11) — 4 times.
- **Rule-of-three rhythmic clustering** (flags 9, 10) — 2 times.
- **Marketing-punchy enders / headings** (flags 10, 12) — 2 times.
- **Em-dash as rhetorical beat** (flags 2, 5) — 2 times.
- **Quoted antithesis** (flag 3) — 1 time.

### Where proof is the real gap
- "Most dogs transition within X days" / "Most dogs adjust within 2-4 weeks" — these were quantitative claims the draft could not source. Rewrote to remove the quantity.

### Upstream artifact that needs repair
- Page argument shape — drafting constraints did not forbid "most / usually / typically" as unsourced modifiers. Updated template does.
- Also: the original argument shape treated palatability as a section where the brand should "address it directly." The section then narrated the brand doing so ("most brands skip this, we don't"). A future argument-shape drafting constraint could be: no section that announces how the brand is handling a concern; the section should handle it.

### Net
- 11 lines rewritten or cut; 1 marker kept as-is after review.
- Argument order preserved (nutrition → mechanism → palatability → values → proof → CTA).
- Verification flags preserved throughout.
- Draft is shorter by roughly 15% and makes fewer soft quantitative claims.
