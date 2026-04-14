# Claude Cowork Agentic Path

Run PageKit inside Claude Cowork — the Anthropic desktop product (GA early 2026) that brings Claude Code's agentic capabilities to non-coders. Cowork plugins bundle skills, slash commands, connectors (MCP) and subagents.

This repo's `.claude/skills/` directory is the PageKit plugin body. You can install it locally today; publishing it as a packaged plugin to claude.com/plugins is a small follow-up step on top.

## What you need

- Claude Cowork installed (Pro, Max, Team, or Enterprise tier).
- The PageKit repo cloned locally (until the published plugin lands).

## Local install (today)

1. Clone the PageKit repo.
2. Copy the `.claude/skills/pagekit*` folders and the `.claude/agents/pagekit-claim-checker.md` file into the Cowork skills location for your installation:
   - macOS / Windows: typically `~/.claude/skills/` (user-level, available across all projects). Cowork picks them up automatically.
3. Open Cowork. The PageKit skills become invocable: `/pagekit`, `/pagekit-signal-doc`, `/pagekit-claim-check`, etc.

The canonical prompts in `prompts/` are loaded by the skills using paths inside the PageKit repo. Cowork must be allowed to read the repo as a working folder for the skills to function.

## Published-plugin install (follow-up)

The PR that landed this agentic foundation includes the skill bodies but not yet a Cowork plugin manifest. Once a plugin manifest is added (file shape per the [`anthropics/knowledge-work-plugins`](https://github.com/anthropics/knowledge-work-plugins) reference repo), Cowork users will be able to install PageKit from claude.com/plugins without cloning the repo.

That step is intentionally deferred so the skills can be exercised and tightened first. See the open items in the PR description.

## What the plugin gives you in Cowork

- The `/pagekit` orchestrator skill, which drives a full run end-to-end.
- Per-step skills for finer-grained invocation: `/pagekit-signal-doc`, `/pagekit-message-spine`, `/pagekit-first-page-decision`, `/pagekit-page-argument-shape`, `/pagekit-proof-map`, `/pagekit-first-page-draft`, `/pagekit-claim-check`.
- Tooling skills: `/pagekit-new-run <name>`, `/pagekit-run-check <name>`, `/pagekit-slop-check`.
- The `pagekit-claim-checker` subagent for read-only claim-check work.

## How Cowork is different

Compared to Claude Code (CLI):

- Cowork runs in a desktop UI, not a terminal. The agent has access to your local files and folders and can read source material from Drive, GitHub, etc. via connectors.
- Skills work the same way (markdown + frontmatter, auto-invoked by description). Slash commands work the same.
- Cowork's connectors layer (MCP-based) lets the agent pull in source material from external systems. For example: a Drive folder of customer interview notes can become source briefs without manual copying.

## Connectors (optional)

If your team uses connectors:

- **GitHub MCP** — let Cowork read run folders from a tracked GitHub repo, or push completed runs back as PRs.
- **Drive MCP** — pull source material (customer interviews, sales-call transcripts, product briefs) directly into `runs/<name>/sources/`.
- **Slack MCP** — surface run completions or claim-check flags to a team channel.

PageKit itself does not require any connector. They are useful if you want the method to live alongside the rest of your team's tooling.

## Typical use

A Cowork user types: "Run PageKit on Kind Bowl, our plant-based dog food brand. Source material is in this Drive folder."

The plugin:

1. Invokes `/pagekit-new-run kind-bowl` to scaffold the run.
2. Pulls the source material from Drive (via the user's connector) into `runs/kind-bowl/sources/`.
3. Drives the seven-step chain via the per-step skills.
4. Surfaces the first-page decision for user approval.
5. Runs slop-check and claim-check.
6. Hands the user the completed run with an evaluation.

## What this path does not yet prove

The PR that introduced the Cowork agentic path includes the skills bundle. It does not yet include:

- A published Cowork plugin manifest.
- A worked example of a real Cowork run on a real object.

Both are deliberate. The PR proves the skills first; the plugin packaging and the worked example come once the skills are exercised.
