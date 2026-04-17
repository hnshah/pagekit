# PageKit examples

Worked runs that show what the full 7-step chain looks like end-to-end.
These are frozen snapshots. Use them as reference material, not as live runs.

## What lives here

- [`vegan-dog-food-verdel/`](vegan-dog-food-verdel/) — the canonical example. A fictional vegan dog-food product (Verdel) taken through all 7 steps including claim-check at `severity: hard`.
- [`personal-crm-founders/`](personal-crm-founders/) — a second worked example on a fictional founder-focused personal CRM.

## How to use them

- Open any step folder and read the artifact (`signal-doc.md`, `message-spine.md`, etc.) alongside the prompt that produced it in `prompts/` and the raw model output in `outputs/`.
- Read `evaluation.md` and `evaluator-pass.md` together. The evaluator pass is deliberately adversarial against what the evaluation quietly claims.
- Treat the per-step prompts under each example's `prompts/` folder as frozen snapshots of how the run actually executed at the time. Some YAML frontmatter in those files references the pre-restructure path layout (`framework: frameworks/X.md`). The canonical prompts now live under `skills/pagekit-<step>/references/prompt.md`. Your own runs produced via `pagekit-new-run` will resolve to the new paths automatically.

## Why both examples

One example is an existence proof. Two examples start to show the pattern. The point of keeping both is that PageKit works on different objects, and the shapes of the argument differ between them. Compare `first-page-decision.md` across the two to see how the "what page comes first" decision is not a formula.

## Running your own

```bash
bash scripts/new-run.sh my-first-run
# fill in runs/my-first-run/goal.md and sources/, then work through prompts 01-07.
```

Validate with `bash scripts/run-check.sh runs/my-first-run`.
