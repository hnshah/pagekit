# Guides

These are fully self-contained prompt-path guides for people who want to run PageKit entirely inside a given **chat tool** (ChatGPT, Claude, Perplexity, Grok, OpenAI).

If the tool you are using is **agentic** (Claude Code, Codex, Claude Cowork) — meaning it has file access and can run scripts on its own — see `../agentic/README.md` instead. The agentic tier is more mechanized and produces a fully-logged run on disk.

## How to use these guides
Use one guide when you want to stay inside a single chat tool for the full artifact chain. Each guide should be usable on its own without bouncing between multiple files.

## Where the prompts come from
The full prompt for every step lives in `../prompts/`. **Each guide references the canonical prompt by path; it does not duplicate the prompt text.** That keeps every tool's path on the same prompt — no drift across guides. If a prompt changes, edit `prompts/NN-*.md` and every guide picks it up automatically.

## Difference from the other tiers

| Tier | Style | Output target |
|---|---|---|
| `quickstart/` | Fastest entry. One step, copy-paste. | A signal doc you save by hand. |
| `guides/` | Full chain inside one chat tool. You paste prompts and keep the thread. | Artifacts you save by hand. |
| `agentic/` | Full chain driven by an agent with file access. | A fully-logged run on disk under `runs/<name>/`. |

## Available guides
- `chatgpt-prompt-path.md`
- `claude-prompt-path.md`
- `perplexity-prompt-path.md`
- `grok-prompt-path.md`
- `openai-prompt-path.md`

## Rule
The tool may differ. The artifact chain does not.

The page shape is determined by the object. These guides should not be read as one fixed homepage template.
