# Codex Agentic Path

Run PageKit inside OpenAI's Codex CLI. Codex reads `AGENTS.md` at the repo root — that file plus the scripts in `scripts/` are all the agent needs to drive the method end-to-end.

## What you need

- OpenAI Codex CLI installed. See the [Codex docs](https://developers.openai.com/codex/cli).
- The PageKit repo cloned locally.

## First run

1. `cd` into the repo.
2. Start Codex. It reads `AGENTS.md` and (per Codex's walk behavior) any `AGENTS.md` files up and down the tree.
3. Give Codex the job: "Run PageKit on <object>." The agent should:
   - read `pagekit.yaml`
   - run `scripts/new-run.sh <name>`
   - work through the seven canonical prompts in `prompts/`
   - run `scripts/slop-check.sh` and `scripts/claim-check.sh` at the right moments
   - run `scripts/run-check.sh runs/<name>` to validate

## How Codex differs from Claude Code here

| Surface | Claude Code | Codex |
|---|---|---|
| Agent contract | `CLAUDE.md` + `AGENTS.md` | `AGENTS.md` |
| Skill bundle | `.claude/skills/` loaded automatically | Not used by Codex today; use Codex skills instead (see below) |
| Subagents | `.claude/agents/` loaded automatically | `developers.openai.com/codex/subagents` — define separately |
| Session hook | `.claude/settings.json` SessionStart | Not wired here; run `scripts/doctor.sh` manually at session start |

The method is identical across tools. Only the agentic plumbing differs.

## Optional: port the Claude Code skills to Codex skills

Codex supports skills (markdown + metadata, same conceptual shape as Claude Code). To use the PageKit skills inside Codex, copy or symlink the per-step skill bodies from `.claude/skills/pagekit-*/SKILL.md` into the Codex skills location for your installation. The skill names map 1:1 (`/pagekit-signal-doc`, etc.).

The canonical prompt files in `prompts/` are tool-neutral, so whichever skill system you use in Codex should load them by path rather than copy their content.

## Optional: MCP

Codex has first-class MCP support. PageKit does not ship an MCP server today because the scripts in `scripts/` cover everything the method needs. If your team later integrates PageKit with external systems (GitHub issues for runs, Drive for source material, etc.), a small MCP server is a natural next step; see `developers.openai.com/codex/mcp`.

## What Codex should produce

Same outputs as any other agentic path:

- `runs/<name>/` scaffolded at the fully-logged tier
- per-step prompts in `runs/<name>/prompts/`
- raw outputs in `runs/<name>/outputs/`
- distilled artifacts in the run root
- `claim-check.md`, `first-page-draft-corrected.md`
- `evaluation.md` and `evaluator-pass.md`
- `scripts/run-check.sh runs/<name>` exits 0

## Typical failure modes

- **Codex does not consistently re-read `AGENTS.md` across a long session.** If drift shows up, point the agent back at `AGENTS.md` and `pagekit.yaml` explicitly.
- **Agent writes outputs directly to artifact files without saving the raw output.** Remind it: per the fully-logged tier, raw outputs go to `outputs/NN-*-output.md`, distilled artifacts go to the run root. Both are required.
- **Agent skips the slop-check and claim-check.** Require `scripts/run-check.sh runs/<name>` to exit 0 before the run is accepted.
