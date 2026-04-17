# Changelog

All notable changes to PageKit are documented here.

Format loosely follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). SemVer applies loosely — we bump minor when the canonical method changes, patch when only docs/tooling change.

## [Unreleased]

## [0.3.0] — 2026-04-17

Skills-first restructure. PageKit now ships as a Claude Code plugin: one install, twelve skills, two subagents, a chat-paste path for non-Claude-Code chat windows. Breaking for the repo layout; non-breaking for the method itself.

### Added
- `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` — plugin manifests. Install via `/plugin marketplace add hnshah/pagekit` + `/plugin install pagekit@pagekit`.
- `skills/` top-level directory with 12 skills (orchestrator, 7 method steps, 4 tooling skills). Each skill has its own bundled `references/` folder with framework, template, and prompt.
- `skills/pagekit/references/` owns the shared references (`anti-slop.md`, `run-logging.md`, `method.md`). Sibling skills link by relative path.
- `agents/` — subagents live at repo root instead of under `.claude/agents/`.
- `examples/` — worked runs moved here from `runs/` (both `vegan-dog-food-verdel` and `personal-crm-founders`). `runs/` stays as user scratch.
- `prompt-paste/` — seven prompts stripped of YAML frontmatter for pasting into ChatGPT / Perplexity / Grok / Gemini / other chat windows.

### Changed
- `README.md` rewritten skills-first: install, skills list, worked example. One page, no tree of entry choices.
- `AGENTS.md` and `CLAUDE.md` slimmed to neutral agent contracts (~45 lines each). Point at skills and the plugin install.
- `CONTRIBUTING.md` rewritten against the new layout.
- `scripts/new-run.sh` resolves canonical prompts from `skills/pagekit-<step>/references/prompt.md`.
- `scripts/claim-check.sh` reads from `skills/pagekit-claim-check/references/prompt.md`.
- `scripts/slop-check.sh` scans `runs/` and `examples/` by default.
- `scripts/doctor.sh` validates the plugin layout: plugin manifest, top-level `skills/` and `agents/`, bundled references.
- `scripts/run-check.sh` — fix an unbound-variable warning at PUBLISHABLE tier (cosmetic; tier output was always correct).

### Removed
- `START-HERE.md`, `quickstart/`, `guides/`, `guided-runs/`, `agentic/` — replaced by the rewritten README and the `prompt-paste/` path.
- `frameworks/`, `templates/`, `prompts/` — absorbed into each skill's `references/` folder.
- `pagekit.yaml` — distilled into `skills/pagekit/references/method.md`.
- `.claude/skills/` and `.claude/agents/` — migrated to the top-level `skills/` and `agents/`.
- `templates/output-judgment-template.md` — orphan, not referenced by any step.

### Method integrity
The anti-slop framework, run-logging tiers, claim-check severities, and all seven method steps are unchanged from v0.2. Only the filesystem layout and the install surface changed. `scripts/slop-check.sh` and `scripts/run-check.sh` on both example runs still pass at their prior tiers.

## [0.2.0] — 2026-04-15

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

[Unreleased]: https://github.com/hnshah/pagekit/compare/v0.3.0...HEAD
[0.3.0]: https://github.com/hnshah/pagekit/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/hnshah/pagekit/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/hnshah/pagekit/releases/tag/v0.1.0
