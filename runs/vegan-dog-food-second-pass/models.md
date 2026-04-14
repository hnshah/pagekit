# Models Used

## Run session
Single-model, single-session run.

## Model
- Claude (Claude Code CLI, Opus 4.6, 1M context)

## Why one model
All seven steps were produced by the same model in the same session so that any weakness in the chain is attributable to the method, not to model-handoff drift.

## Settings
- default settings for the Claude Code session
- no external tools, no web search, no retrieval augmentation
- all context is contained in `sources/`, prior-step artifacts and the prompt

## Date
2026-04-14
