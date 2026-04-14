# Evaluator Pass — Second Pass

Skeptical second read of the run. Not the same voice as `evaluation.md`; this pass is deliberately adversarial.

## Things the run is quietly claiming that deserve scrutiny

### 1. "First-page decision actually bit"
The run is pleased that it chose a non-homepage first page. But the run's own rigging — adding a mechanism, proof and comparison brief before step 03 — made the nutritional-adequacy framing almost inevitable. If we had run step 03 only with the signal doc and spine (no mechanism, proof, comparison briefs), would it still have rejected the homepage? Probably yes, but less decisively.

**Implication:** the first-page-decision step is working, but part of what made it decisive was source enrichment upstream. The framework should be explicit that first-page decisions get sharper when mechanism / proof / comparison briefs exist, and should name this as a normal part of the chain rather than an optional add-on.

### 2. "Proof was thick enough that claim-check found zero proof-gap flags"
This is partly because the run controls the ground truth. Kind Bowl is fictional and the proof briefs are, by construction, consistent with the product briefs. A real run on a real brand would not have this luxury. The claim-check step would find proof gaps much more often in the wild.

**Implication:** a fully logged run on a real brand — not a training object — is the next real test of the claim-check step. This run cannot prove claim-check works against real-world proof messiness.

### 3. "Nine flags on a draft that felt clean"
Of the nine flags, six could have been caught by a stricter drafting-constraints list in step 06. That means the claim-check step is partly doing work that step 06 should be doing. That is fine — claim check is a safety net — but the argument shape's drafting constraints could absorb some of this work and reduce the claim-check surface area.

**Implication:** the `templates/page-argument-shape-template.md` drafting-constraints section is under-specified. It should include:
- no unsourced quantitative modifiers
- no editorial voice narrating brand restraint
- no external-credential descriptions beyond what source briefs support
- no clinical-adjacent phrasings

### 4. "The page is longer than a homepage but not wider"
The draft is seven sections. That is on the high end for a first page that also tries to front-load scope. The evaluator pass is not convinced the page would keep a skeptical reader to the bottom. The argument shape named this risk but the draft did not meaningfully shorten any section. If the page is honest but not read to the end, the trust moves in the "What we have not done" section do not land.

**Implication:** one of two things should happen — either the argument shape step adds an explicit length / density check, or the draft step adds a "would a skeptical reader reach the bottom" test. Neither exists in the repo today.

### 5. "This is the first non-homepage validation"
True in letter. But the run does not have a second candidate non-homepage object to test that the new architecture is not just right for vegan dog food. One object is a sample size of one. The earlier `high-trust-professional-tool-architecture-test` is synthetic and does not count.

**Implication:** one more real non-homepage run, on a different kind of object, is needed before the architecture fix can be called validated in general. Candidate objects: a developer tool whose first page should be docs, an open-source library whose first page should be install-and-use, a B2B service whose first page should be a case study.

### 6. "Hard severity was right"
The claim-check pass was run at hard severity by design. The evaluator pass notes that some of the flags would not survive a gentler real-world standard — specifically claim 1 ("most") is a line many real pages would keep. The run does not tell us where the right severity dial sits for real pages. It only tells us the step works at hard severity.

**Implication:** a future run should pick severity explicitly and document why. The claim-check framework should add a note on severity calibration.

### 7. "No upstream repair needed"
This is surprising and probably partly incorrect. The draft had editorial voice problems that the argument shape did not prevent, which is an upstream template gap. The evaluator pass considers that upstream.

## Punch list for repo improvement

Applied in a separate commit on this branch after the run is committed.

1. **Claim-check framework and template** — add two flag types: *editorial voice* and *unsourced quantitative modifier*. Update the framework principle to name "narrating restraint" as a distinct anti-pattern.
2. **Claim-check framework** — add a short section on severity calibration (hard / normal / light) with when to pick each.
3. **Page-argument-shape template** — strengthen the drafting-constraints section with the patterns this run surfaced: no unsourced quantitative modifiers, no editorial voice narrating brand restraint, no external-credential descriptions beyond source briefs, no clinical-adjacent phrasings.
4. **Page-argument-shape framework** — add a length / density consideration: if the approved shape produces a page long enough to risk non-completion, that is itself a shape problem, not a drafting problem.
5. **First-page-decision framework** — note explicitly that first-page decisions get sharper when mechanism, proof and comparison briefs exist upstream, and that their absence is often the real cause of a weak first-page decision.
6. **Run-logging framework** — the fully-logged tier should include an evaluator-pass as a required file, not an implied nice-to-have. The first-pass vegan-dog-food run skipped it; that was possible because the framework tolerated it.
7. **Examples / README** — once the run is in the repo, update `examples/README.md` and `README.md` logged-runs section to reflect the new fully-logged second-pass run and the new non-homepage evidence.

## Final evaluator read
The run is real.
It exposes repo gaps that are small, tractable and specifically actionable.
It does not yet prove the architecture generalizes beyond this one object.
A second non-homepage object on a different category is the meaningful next run.
