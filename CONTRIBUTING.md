# Contributing to PageKit

Thanks for looking at this. PageKit is a methodology repo plus the scaffolding that lets an agent drive the method end-to-end. Contributions fall into four shapes, each with a slightly different bar.

## The method in one sentence

**Signal doc → message spine → first-page decision → page argument shape → proof map → first page draft → (optional) claim check.**

Canonical source of truth: `pagekit.yaml` and `prompts/`. Edit canonical prompts in one place; guides reference them.

## Four kinds of contribution

### 1. Method change (add/change/retire a step, framework, template, rule)

The bar is high and the shape is prescribed:

1. Open an issue using the `method-proposal` template. Name the run or evaluator-pass that surfaced the gap. Proposals without run evidence land lower.
2. If we agree on the change, the PR should update the canonical surface plus every downstream surface that references it (framework, template, prompt, skill, guided-run, CLAUDE.md, AGENTS.md if relevant). Run `bash scripts/doctor.sh` to verify.
3. When the change is driven by a specific run's evaluator-pass, cite that run in the PR body. The method-change loop is: `run → evaluator-pass → punch list → method change`.

### 2. A logged run

The most useful contribution for strengthening the method is a real run.

- Use `bash scripts/new-run.sh <run-name>` to scaffold.
- Fully-logged tier is the bar for anything you want counted as evidence. Run `bash scripts/run-check.sh runs/<run-name>` to verify.
- Run the slop-check before claim-check and after: `bash scripts/slop-check.sh`.
- Include an `evaluator-pass.md` (adversarial, skeptical). This is the part most easily skipped and the part that most often surfaces the improvements in the next PR.
- If the run exposes a repo gap, file a `method-proposal` issue (or a follow-up PR) so the loop closes.

### 3. Tooling (scripts, CI, hooks, skills, subagents)

- Scripts live in `scripts/`. POSIX-leaning bash, exit 0 on success / non-zero on failure (so they work in hooks and CI).
- Skills live in `.claude/skills/pagekit-*/SKILL.md`. Each has YAML frontmatter (`name`, `description`, optional `tools`). The description is what determines auto-invocation — front-load the trigger phrase.
- Subagents live in `.claude/agents/`. Scope the `tools:` field tightly.
- Always update `scripts/doctor.sh` if you add a file the repo should guarantee exists.

### 4. Docs (README, guides, quickstarts, CLAUDE.md, AGENTS.md)

- Canonical prompts live in `prompts/`. Guides reference them; do not duplicate the prompt text into a guide.
- Anything in `README.md`, `CLAUDE.md`, or `AGENTS.md` that describes the method must agree with `pagekit.yaml` and with `frameworks/`. If you change one, grep for the others.
- Anti-slop rules apply to the docs too. See `frameworks/anti-slop.md`. `scripts/slop-check.sh` catches the mechanical tells.

## Required checks before a PR

```sh
bash scripts/doctor.sh       # PASS
bash scripts/slop-check.sh   # exit 0
# if the PR touches runs/
bash scripts/run-check.sh runs/<name>
```

CI runs `doctor.sh` and `slop-check.sh` on every PR (see `.github/workflows/check.yml`).

If you want local enforcement before commit, `.pre-commit-config.yaml` is set up; install with `pip install pre-commit && pre-commit install`.

## PR shape

Use the PR template. Keep summaries short, verification concrete. Reviews look for:
- does the PR follow the source-of-truth rule (edit canonical, let downstream pick it up)?
- does CI pass?
- if it touches prompts/frameworks/skills, do they still agree with each other?
- if it claims to fix something a run surfaced, is the run named?

## What bad contribution looks like

- A draft rewrite with no slop-check / claim-check audit trail
- A new guide that duplicates a prompt instead of referencing `prompts/`
- A method change without a run behind it
- A run that skips the evaluator pass and calls itself fully-logged
- A PR that adds 35 mentions of the same rule across 5 guides instead of editing one canonical file

## Questions

Open an issue. Use the `method-feedback` template for "I tried to use this and it didn't work," the `bug` template for tooling, the `method-proposal` template for "I want to change the chain."
