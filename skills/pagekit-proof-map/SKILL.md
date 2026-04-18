---
name: pagekit-proof-map
description: Map proof to the chosen first page section by section. Step 05 of the PageKit method. Use after the page argument shape exists and before drafting.
---

# PageKit step 05 — Proof Map

You are running step 05 of the PageKit method.

## Read first
- `./references/prompt.md`
- `./references/framework.md`
- `./references/template.md`

## Inputs
- `runs/<run-name>/first-page-decision.md`
- `runs/<run-name>/page-argument-shape.md`
- `runs/<run-name>/sources/05-proof-brief.md` (if it exists)

## Procedure
1. Load `./references/prompt.md`.
2. Substitute the artifacts above.
3. Save the substituted prompt to `runs/<run-name>/prompts/05-proof-map.md`.
4. Prompt the model.
5. Save the raw response to `runs/<run-name>/outputs/05-proof-map-output.md`.
6. Distill into `runs/<run-name>/proof-map.md`. The file is a scaffolded placeholder — `Read` it first, then `Edit` the placeholder away. Do not call `Write` on it without a prior `Read`.
7. Update `working-log.md`.

## Quality gate
A strong proof map:
- commits to what the page can honestly claim today
- names what the page cannot yet support
- maps proof to specific argument moves, not to the page in general
- makes the gap between available proof and needed proof visible

If the proof map is "we have testimonials" and not much more, the upstream proof brief is too thin. Add specifics or accept a narrower draft.

## Hard rule
Do not invent proof. If the page wants to say something that the proof map cannot support, the draft step will mark it with `*[verification flag: ...]*`. This map is where those gaps are surfaced first.

## Next
After the proof map is in place, invoke **`pagekit-first-page-draft`** (step 06). Do not stop here.
