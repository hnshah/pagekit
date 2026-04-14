# Raw Output 07 — Claim Check (hard)

## Model
Claude (Claude Code, Opus 4.6)

## Severity
Hard.

## Flagged claims

### Claim 1
**Line:** "AAFCO's profile is the nutrient benchmark that most adult dog foods in the US use when they make a 'complete and balanced' statement."

**Type:** vague / imprecise

**Why it is weak:** "Most" is a confident quantitative claim the sources do not support. The briefs establish that AAFCO profiles are the standard path, but they do not give Kind Bowl a basis to claim market share shape ("most"). At hard severity, any unsourced quantitative modifier is a flag.

**Correction:** "AAFCO's profile is the nutrient benchmark used in the US for 'complete and balanced' statements on adult dog food."

---

### Claim 2
**Line:** "There are two ways a food can show that it meets the profile: by formulation (with laboratory testing) and by a six-month AAFCO feeding trial."

**Type:** outruns proof map (specificity not in the briefs)

**Why it is weak:** The mechanism brief does not specify the six-month duration. AAFCO feeding trial protocols exist, but stating "six-month" without sourcing it introduces a fact the run does not control. At hard severity, cut the unsourced specific.

**Correction:** "A food can show it meets the profile in one of two ways: by formulation (with laboratory testing) or by an AAFCO feeding trial."

---

### Claim 3
**Line:** "We think that distinction matters, so we say it on the first page."

**Type:** editorial voice

**Why it is weak:** The argument shape called for a page whose content carries the weight, not a page that narrates its own ethics. A show-the-work page does not need to announce that it is showing the work. Cut.

**Correction:** Delete the line.

---

### Claim 4
**Line:** "ACVN diplomate status is a specialty certification for veterinarians who have completed a residency in clinical nutrition and passed the ACVN board exam."

**Type:** outruns proof map (specificity not in the briefs)

**Why it is weak:** "Residency in clinical nutrition" is specific enough to be checkable externally, but the proof brief does not include a description of ACVN requirements. At hard severity, descriptions of external credentials should either be minimal or explicitly sourced. Minimal is safer here.

**Correction:** "ACVN diplomate status is a specialty board certification for veterinarians in clinical nutrition."

---

### Claim 5
**Line:** "It is the credential most commonly cited when a brand wants to say their food was formulated by a specialist, rather than by a generalist vet."

**Type:** vague / editorial voice

**Why it is weak:** "Most commonly cited" is another unsupported quantitative claim. "Generalist vet" is a rhetorical contrast that the briefs do not anchor. Cut.

**Correction:** Delete the line.

---

### Claim 6
**Line:** "We will not say 'vet approved.' Vet approval is not a real regulatory status, and the phrase gets used too loosely in this category to mean anything."

**Type:** editorial voice / regulatory drift

**Why it is weak:** Two issues. First, "not a real regulatory status" is a regulatory statement the briefs do not back — AAFCO and state feed-control authorities regulate labeling, and the specifics of what "vet approved" is or is not under those regimes is not in the briefs. Second, the sentence is editorial commentary on the category. The show-the-work page's job is to be specific about Kind Bowl, not to argue about industry language.

**Correction:** Delete both lines.

---

### Claim 7
**Line:** "taurine and L-carnitine, both relevant to heart muscle health in dogs and both commonly supplemented in plant-based formulations"

**Type:** clinical drift

**Why it is weak:** "Heart muscle health" is a clinical-adjacent phrase. The mechanism brief supports taurine and L-carnitine as supplementation; it does not support a claim-style description of what they do in the body. At hard severity, any line that sounds like nutrition advice is a flag.

**Correction:** "taurine and L-carnitine, two nutrients commonly supplemented in plant-based dog food formulations"

---

### Claim 8
**Line:** "vitamin D3 from a vegan-compatible source, because D2 is not well-utilized by dogs"

**Type:** clinical drift / outruns proof map

**Why it is weak:** The mechanism brief notes that Kind Bowl uses a vegan-compatible D3 source, but it does not include a comparative statement that D2 is not well-utilized by dogs. That is a nutritional-science claim outside the run's ground truth.

**Correction:** "vitamin D3 from a vegan-compatible source"

---

### Claim 9
**Line:** "Pricing and subscription details live on their own page. If you are not yet ready for that, you should not have to go there."

**Type:** editorial voice

**Why it is weak:** The second sentence narrates the brand's own restraint. It is the kind of line the argument shape was designed to prevent. Cut.

**Correction:** Delete the second sentence. Keep the first.

---

## Claims checked and held

The following lines were reviewed and kept because they sit inside the proof map:

- "Kind Bowl is a plant-based dry kibble for adult dogs, formulated to meet the AAFCO Dog Food Nutrient Profile for adult maintenance."
- "Kind Bowl's compliance is by formulation and third-party amino acid testing. It is not compliance by feeding trial."
- "The Kind Bowl recipe was formulated in an ongoing consulting relationship with a board-certified veterinary nutritionist — specifically, a diplomate of the American College of Veterinary Nutrition (ACVN)."
- "methionine and lysine, two amino acids that plant proteins are typically low in for dogs" (the mechanism brief supports this)
- "DHA from algae, an omega-3 source that does not require fish"
- the full "What we have not done" list
- the "What we test" section
- the "Where to go next" anchors

## Summary

### Strongest remaining risks after correction
- Claim 1 and Claim 4 are the most likely to recur in future drafts because they are phrasings the model reached for by habit (softening with "most," describing external credentials). A prompt-level guardrail in the claim-check template to flag unsourced quantitative modifiers would help.
- The editorial-voice issues (claims 3, 5, 6, 9) all come from the same impulse: narrating the brand's own restraint instead of showing the work. This is a pattern worth naming in the claim-check framework as a distinct type.

### Where proof is the real gap
- No gap. The corrected draft stays inside the proof map cleanly. The flags in this pass were about precision and voice, not missing proof.

### Upstream artifact that needs repair
- None for this run. The proof map held. The mechanism brief held.
- For the repo: the claim-check framework should explicitly name "editorial voice" and "unsourced quantitative modifier" as flag types. The current framework has "overclaim / vague / unsupported / outrun"; these two patterns fall between those categories and deserve their own labels.

## Judgment
The claim check was worth running and the hard severity was right. Nine flags on a draft that felt "clean" shows the step is doing real work. Three of the nine were editorial voice, three were unsupported quantitative or external-credential specifics, two were clinical drift, one was an unsourced duration. None of the flags required an upstream source fix.
