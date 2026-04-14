# Evaluation — Second Pass

## Logging level
Fully logged per `frameworks/run-logging.md`.
Includes goal, working log, models, sources, per-step prompts, per-step raw outputs, final artifacts (signal doc, message spine, first-page decision, page argument shape, proof map, first page draft, corrected draft, claim check), evaluation and evaluator pass.

## What worked
- The first-page-decision step actually bit. The chosen first page is a nutritional-adequacy page, not a homepage. The rejection reasoning for homepage, category-explainer, ingredient-only and founder-story candidates is on paper. This is the first time PageKit's new architecture has produced a non-homepage first page on a real run.
- The additional source briefs (mechanism, proof, comparison) closed the first-pass gap. The evaluator of the first pass said "proof is again the thinnest layer." In this pass, proof was thick enough that the claim check found zero proof-gap flags.
- The page argument shape step produced a visibly non-homepage shape and, importantly, named the sections the page does not need (hero, founder story, testimonials, subscription, pricing). Naming negative sections is what kept the draft from drifting.
- The claim check, run hard, flagged nine lines on a draft that felt clean. That is the clearest signal that the step does real work.

## What felt weak
- The model's reflex to soften with "most" and to describe external credentials in detail needed the claim check to catch. The current claim-check framework has four flag types (overclaim / vague / unsupported / outrun proof map). Two recurring patterns from this run fit between those categories:
  - **editorial voice** — brand narrating its own restraint instead of showing the work
  - **unsourced quantitative modifier** — "most," "usually," "typically" without support
- The argument shape step helped but did not prevent those patterns. The patterns showed up at draft time anyway. That is a real limitation of upstream guardrails.
- The "We think that distinction matters" line made it into the draft because the drafting constraints did not explicitly forbid first-person editorial framing on a show-the-work page. That is a constraint-language gap, not a process-structure gap.

## What stayed thin
- Customer proof remains absent by ground-truth design. The run named this honestly in the "what we have not done" section. It is still worth naming as thin.
- Palatability evidence is absent. The page did not try to claim it, which is correct, but this is a real gap for a page whose buyer wants to know their dog will eat the food.

## Where outputs drifted generic
- Less than in first pass. The main drift was into editorial voice, not category wording.

## Added rigor layer
Evaluator pass included.

## Final run judgment
Successful validation run at the current PageKit stage.
This is the first fully-logged non-homepage run.
It is also the first real test of the claim-check step, and the step earned its keep.
The run exposes small, tractable gaps in the claim-check framework and template. Those are repo-improvement candidates rather than method-correctness failures.
