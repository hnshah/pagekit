# Changelog

All notable changes to PageKit are documented here.

Format loosely follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). SemVer applies loosely — we bump minor when the canonical method changes, patch when only docs/tooling change.

## [Unreleased]

### Added
- `.github/workflows/check.yml` runs `doctor.sh` and `slop-check.sh` on every push and PR.
- `.github/PULL_REQUEST_TEMPLATE.md` + issue templates (`method-feedback`, `bug`, `method-proposal`).
- `CONTRIBUTING.md` — four shapes of contribution, required checks, what bad contribution looks like.
- `CHANGELOG.md` — this file.
- `.pre-commit-config.yaml` — local enforcement of `slop-check.sh`.
- `scripts/new-source-brief.sh` — scaffold an individual source brief (wedge / mechanism / proof / comparison).
- `.claude/agents/pagekit-evaluator-pass.md` — read-only subagent for adversarial evaluator-pass work.
- `.claude/skills/pagekit-evaluator-pass/SKILL.md` — skill wrapper that delegates to the subagent.
- `scripts/run-check.sh` — new tier above FULLY LOGGED: **PUBLISHABLE** (fully logged + claim-check present + slop-check clean).

### Changed
- `README.md` — sharper public-facing hero; points at `runs/vegan-dog-food-verdel/` as the canonical worked example.
- `scripts/doctor.sh` — includes the new subagent and skill in its manifest checks.

## [0.1.0] — 2026-04-14

Baseline public release. The agentic foundation is in place.

### Added
- Canonical method manifest (`pagekit.yaml`) and canonical prompts (`prompts/01-07-*.md`).
- `AGENTS.md` (Codex-first agent contract) + expanded `CLAUDE.md` operational section.
- Anti-slop framework (`frameworks/anti-slop.md`) + regression script (`scripts/slop-check.sh`).
- Claim-check framework + severity calibration (light / normal / hard) + `ai-slop tell` flag type.
- Run-logging framework with fully-logged / summary-logged tiers; `sources/` and `evaluator-pass` required at fully-logged.
- First-page-decision framework with hard "case FOR each candidate" requirement and the first-page-alternatives-vs-later-funnel-pages distinction.
- Page-argument-shape framework with length/density consideration and the anti-slop drafting constraints block.
- 8 templates including `output-judgment-template.md`, `wedge-definition-template.md`, `claim-check-template.md`.
- 7 guided-run READMEs (`guided-runs/01-07`).
- 5 tool guides (ChatGPT, Claude, Perplexity, Grok, OpenAI) and 5 matching quickstarts — all reference canonical prompts by path, not by copy.
- Third tier `agentic/` with paths for Claude Code, Codex, Claude Cowork.
- Claude Code skills bundle: master `pagekit` orchestrator + 7 per-step skills + 3 tooling skills + `pagekit-claim-checker` subagent.
- `.claude/settings.json` SessionStart hook running `scripts/doctor.sh`.
- Scripts: `new-run.sh`, `run-check.sh`, `claim-check.sh`, `slop-check.sh`, `doctor.sh`; `Makefile` with discoverable targets.
- `runs/vegan-dog-food-verdel/` — first fully-logged run on the agentic foundation. Non-homepage first page. First real exercise of the claim-check step.
- `LICENSE` (MIT) and `.gitignore`.

### Notes
- PRs #1–#8 all merged prior to this release. See the GitHub PR history for the run-to-repo-improvement loop that produced the method surface.

[Unreleased]: https://github.com/hnshah/pagekit/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/hnshah/pagekit/releases/tag/v0.1.0
