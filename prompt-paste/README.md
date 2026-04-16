# PageKit prompts for chat apps

If you use ChatGPT, Perplexity, Grok, Gemini, or another chat interface that does not run the Claude Code plugin, this folder is for you.

Each file here is the same canonical prompt that the PageKit skills use, stripped of YAML frontmatter so you can paste it straight into any chat window.

## The 7 prompts

1. [01-signal-doc.md](01-signal-doc.md) — produce the signal doc from your source briefs
2. [02-message-spine.md](02-message-spine.md) — reduce the signal doc to a message spine
3. [03-first-page-decision.md](03-first-page-decision.md) — decide which page to build first
4. [04-page-argument-shape.md](04-page-argument-shape.md) — design the page argument shape
5. [05-proof-map.md](05-proof-map.md) — build the proof map
6. [06-first-page-draft.md](06-first-page-draft.md) — draft the first page
7. [07-claim-check.md](07-claim-check.md) — adversarial claim-check pass

## How to run the chain manually

1. Write a short source brief about your product. Include what it does, who it is for, and the mechanism that makes it work.
2. Open step 01. Paste the prompt into the chat window, paste your source brief below the prompt, send.
3. Save the model's output. That is your signal doc.
4. Open step 02. Paste the prompt. Paste the signal doc where the prompt asks for it. Send.
5. Save the message spine. Continue the chain: each step takes the previous step's output as input.
6. At step 06 you have a first-page draft. At step 07 you have an adversarial audit of that draft.

## Why the plugin is better

The Claude Code plugin runs the whole chain with one command, enforces the anti-slop rules on the draft mechanically, and produces a fully-logged run folder you can verify later. See the repo [README](../README.md) for the one-line install.

This chat-paste path exists so the method is still usable without installing anything. The output quality depends on how honest your source briefs are; the same constraint applies to the plugin path.
