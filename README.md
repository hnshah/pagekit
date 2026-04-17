# PageKit

**Skills for making web pages that are contextually relevant to your audience and what your product does.**

PageKit ships as a Claude Code plugin. One install, fourteen skills (twelve method skills + two subagents), and the full 7-step chain runs end-to-end: signal doc → message spine → first-page decision → page argument shape → proof map → first-page draft → claim check. An anti-slop regression script catches mechanical slop patterns; the claim-check subagent catches the rest.

If you do not use Claude Code, there is a chat-paste path in [`prompt-paste/`](prompt-paste/).

## Install

Inside Claude Code:

```text
/plugin marketplace add hnshah/pagekit
/plugin install pagekit@pagekit
```

That is the whole installation. All fourteen skills register automatically.

## Use it

Ask Claude Code to run PageKit on any object:

```text
Run PageKit on <product or idea>.
```

The orchestrator skill (`pagekit`) walks you through the seven steps, scaffolds a fully-logged `runs/<name>/` folder, and invokes each step skill in turn.

To run one step on its own, invoke the step skill directly:

```text
Use pagekit-signal-doc on <product>.
```

## The skills

| Skill | What it does |
| --- | --- |
| `pagekit` | Orchestrator. Runs all 7 steps end-to-end into a fully-logged run. |
| `pagekit-signal-doc` | Step 01. Turn source briefs into a signal doc. |
| `pagekit-message-spine` | Step 02. Reduce the signal doc to a message spine. |
| `pagekit-first-page-decision` | Step 03. Decide which page comes first — without defaulting to homepage. |
| `pagekit-page-argument-shape` | Step 04. Shape the argument for the chosen page. |
| `pagekit-proof-map` | Step 05. Map proof to sections. Name what cannot be said. |
| `pagekit-first-page-draft` | Step 06. Draft the page inside the argument shape and proof map. |
| `pagekit-claim-check` | Step 07. Adversarial audit at light / normal / hard severity. |
| `pagekit-new-run` | Scaffold a fully-logged run folder. |
| `pagekit-run-check` | Validate a run against the logging tiers. |
| `pagekit-slop-check` | Heuristic anti-slop regression against drafts. |
| `pagekit-evaluator-pass` | Invoke the evaluator-pass subagent on a completed run. |

Two subagents (`pagekit-claim-checker`, `pagekit-evaluator-pass`) do the adversarial reads. The orchestrator dispatches to them automatically.

## A worked example

[`examples/vegan-dog-food-verdel/`](examples/vegan-dog-food-verdel/) is the canonical run. Fully logged, non-homepage first page, claim-checked at `severity: hard`, evaluator pass included. Read `first-page-draft.md` against `proof-map.md` against `claim-check.md` to see how the chain constrains the draft.

[`examples/personal-crm-founders/`](examples/personal-crm-founders/) is a second worked example on a different object shape.

## Without Claude Code

If you use ChatGPT, Perplexity, Grok, Gemini, or another chat window, open [`prompt-paste/`](prompt-paste/) and paste the 7 prompts in order. Your output quality depends on how honest your source briefs are; that constraint does not change.

## What makes this different

- Starts upstream, with signal, not with copy.
- Does not default to homepage. Step 03 forces you to name rejected candidates.
- Maps proof to sections. A section that cannot be proven is flagged or removed.
- Treats AI-slop patterns as hard no-go rules. `pagekit-slop-check` runs the regression; `pagekit-claim-check` catches the rest.
- Logs the whole run. The draft is not the deliverable; the logged run is.

## Repo structure

- `.claude-plugin/`: plugin and marketplace manifests
- `skills/`: 12 SKILL.md files, each with a bundled `references/` folder
- `agents/`: 2 subagents (claim-checker, evaluator-pass)
- `examples/`: worked runs (vegan-dog-food-verdel, personal-crm-founders)
- `prompt-paste/`: chat-app path with 7 prompts ready to paste
- `runs/`: your own runs land here (empty by default)
- `scripts/`: tooling (new-run, run-check, claim-check, slop-check, doctor)

## License

MIT

Built by [`Hiten`](https://x.com/hnshah).
