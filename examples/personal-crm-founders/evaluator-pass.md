# Evaluator Pass — Me CRM (Problem-First Landing Page)

Skeptical second read of the run. Not the same voice as `evaluation.md`; this pass is deliberately adversarial.

---

## Things the run is quietly claiming that deserve scrutiny

### 1. The first-page decision is validated by the decision-making process, not by evidence

The run chose a problem-first landing page over a homepage. The argument is structurally correct — the product has no social proof, so a homepage that leads with the product name and category label would trigger comparison-shopping before recognition. But the run then treats the structural argument as a validated decision.

It is not. It is a well-reasoned hypothesis applied to an invented product with no audience data. The run does not know whether founders who encounter this product are arriving cold (cold acquisition, no context) or warm (referral, already feeling the problem). The decision is sound as a default for a pre-launch product with no proof assets. It is not evidence that problem-first landing pages outperform homepages for this audience in general.

**Implication:** The first-page decision framework should distinguish between "structural argument" confidence and "empirical evidence" confidence more explicitly. The confidence basis field (added in a prior PR) is the right place for this distinction, but the field alone does not force the distinction. The template should prompt: "Is this a hypothesis, a pattern match, or evidence-backed? If hypothesis, what would falsify it?"

---

### 2. The run cites itself as a validation of the method

The evaluation says "The run holds." The working log records the steps. But this is a training fiction run built on an invented product with no real founder interviews, no real usage data, and no real audience. The run is a demonstration that the PageKit process produces internally consistent output — it is not evidence that the output would work with a real audience.

The distinction matters because the run will sit in the repo alongside `runs/vegan-dog-food-verdel/`, which was built on real source material from a real product. A reader who scans both runs could reasonably infer that both represent the same kind of evidence. They do not.

**Implication:** The `evaluation.md` template should require a "source quality" field that explicitly states whether source material is real (interviews, usage data, existing copy) or training fiction. The `models.md` file is not the right place for this — it is visible at the run level in `sources/01-source-capture.md`, but that file is one level down. Surface it in the evaluation.

---

### 3. Section 2 is acknowledged as category-default and left standing

The evaluation calls out Section 2 ("email threads, spreadsheets, and sales CRMs all fail at the same thing") as the section most likely to appear on any founder-CRM product page. The evaluation names this as a weakness and then moves on.

The run did not attempt to fix it. The evaluation's judgment is that Section 2 "does its structural job" — but "does its structural job" is the minimum bar, not the publishing bar. A section that any competitor could paste onto their product page is a section that does not differentiate. The run let this stand because there was no stronger source material to draw from. That is an honest constraint. But the evaluation treats it as acceptable rather than flagging it as a requirement for upstream repair before this page could publish.

**Implication:** If Section 2 is category-default, the right response is not to note it in the evaluation and move on. It is to document specifically what source material would fix it — a founder interview quote, a specific named pain moment, a product behavior that is not available in any competitor. The evaluation template should prompt: "For each weak section, what source material would fix it?" The publication readiness checklist partially addresses this, but does not connect weak sections to their source gaps.

---

### 4. The 50–100 range was dropped but not replaced

Claim 3 (the "50–100 relationships" range) was corrected by removing the range and replacing it with "a focused set of relationships." The corrected line is more defensible but less specific. The product brief uses the range; the product is apparently designed around it. The correction trades specificity for caution.

This is the right call at claim-check time. But the run then stops. If 50–100 is a real product design parameter, it is a concrete and useful number that could appear with a verification flag. The claim-check pass recommended exactly that ("if 50–100 is an explicit product design parameter stated in the brief, restore the range with a verification flag"). The corrected draft dropped the number silently rather than preserving the intent behind it.

**Implication:** The claim-check format should distinguish between "remove this" and "verify then restore this." The current template's correction field can hold either, but the drafting decision should be explicit. A claim dropped for lack of sourcing and a claim dropped because it is wrong are different things. Only one of them should be potentially restored before publish.

---

## Punch list for repo improvement

1. **First-page decision template**: Add a falsification prompt to the confidence basis field — "If this is a hypothesis, what result would tell you the decision was wrong?"
2. **Evaluation template**: Add a "source quality" field: Real (interviews / usage data / existing copy) or Training fiction (committed product facts, no interviews). Surface this prominently in the evaluation, not just in `sources/01-source-capture.md`.
3. **Evaluation template** / **claim-check corrected draft protocol**: Distinguish "remove (wrong)" from "remove pending verification (potentially restorable)." The claim-check can note this; the corrected draft should mark the line, not silently drop it.
4. **Section weakness follow-through**: When `evaluation.md` names a section as category-default, the template should prompt what source material would fix it — not just that it is weak.

---

## Final evaluator read

This run is a clean demonstration of the PageKit process applied to a training fiction product. The artifacts are internally consistent, the claim-check did real work (seven flags caught, all resolved), and the corrected draft is defensible against the source material. What the run does not prove is that the output is correct — it proves that the output is honest. A problem-first landing page built on no social proof and a single waitlist number is not a high-converting page; it is an honest page. The run names that constraint clearly and does not pretend the draft problem can be solved without the proof gap closing. The evaluator-pass punch list above is structural: the issues it identifies are real but not urgent. The run is suitable as a reference example with the caveat that its source material is training fiction, and any reader drawing process conclusions from it should treat it as a controlled demonstration, not a market test.
