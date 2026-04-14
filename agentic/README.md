# Agentic

Third tier of entry points. Use this when the tool you are using is itself an agent that has file access, shell tools, and the ability to run the method end-to-end without you orchestrating each step.

## How this differs from quickstart and guides

| Tier | What it is | Who it is for |
|---|---|---|
| `quickstart/` | One prompt, one step, copy-paste-ready. Fastest way to get started. | Anyone wanting to try the method by running step 01. |
| `guides/` | The full seven-step chain inside a single chat tool (ChatGPT, Claude, Perplexity, Grok, OpenAI). You paste prompts and keep the thread. | People running the method by hand inside a chat model. |
| `agentic/` | The full chain driven by an agent that has file access, scripts, and tool use. You describe the job; the agent does the steps. | People using Claude Code, Codex, or Claude Cowork to run the method on the repo itself. |

## When to use the agentic tier

- You have a real object and want a fully-logged run created for you on disk.
- You want the agent to call `scripts/new-run.sh`, fill sources, run each step, save prompts and outputs, run the slop-check and claim-check scripts, and hand you a clean `runs/<name>/` at the end.
- You want the method to keep running correctly across future runs without you re-teaching the tool each time.

If you are iterating conversationally inside a chat and do not want the tool touching files, use a `guides/` path instead.

## Paths

- **`claude-code-agentic-path.md`** — Claude Code (the Anthropic CLI). Uses the skills bundle at `.claude/skills/`, the subagent at `.claude/agents/`, and the SessionStart hook at `.claude/settings.json`. Most mechanized path; most recommended if you have Claude Code installed.
- **`codex-agentic-path.md`** — OpenAI Codex (the CLI). Reads `AGENTS.md` at the repo root. Drives the method through the scripts in `scripts/` and the canonical prompts in `prompts/`.
- **`claude-cowork-agentic-path.md`** — Claude Cowork (the Anthropic desktop product, GA early 2026). The skills bundle in `.claude/skills/` is the plugin body. Installable locally today; publishable to claude.com/plugins as a packaged plugin later.

## Shared foundation

All three paths read the same source of truth:
- `pagekit.yaml` — method manifest
- `prompts/` — canonical prompts
- `frameworks/` — durable method docs
- `scripts/` — tooling

So the methodology stays identical across tools. What differs is how the tool drives the chain.

## Hard rules for agentic use

- The agent must produce a fully-logged run per `frameworks/run-logging.md`. Validate with `scripts/run-check.sh runs/<name>` before declaring the run done.
- The agent must respect `frameworks/anti-slop.md`. Validate with `scripts/slop-check.sh` before the claim-check step and again after.
- Unverified product-specific claims must carry `*[verification flag: ...]*` inline.
- The first-page decision must be made on purpose at step 03. Homepage is not a default.

These rules are named in `AGENTS.md` and `CLAUDE.md` so the agent picks them up at session start.
