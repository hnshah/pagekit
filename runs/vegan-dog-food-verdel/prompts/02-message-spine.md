<!--
This file starts as a copy of prompts/02-message-spine.md (the canonical prompt for this step).
When you run the step:
1. Substitute the required inputs into the prompt.
2. Save the version you actually sent to the model here.
3. Save the raw output to outputs/02-message-spine-output.md.
-->

---
step: "02"
name: message-spine
title: Reduce to a Message Spine
inputs:
  - signal-doc.md
outputs:
  - message-spine.md
framework: frameworks/message-spine.md
template: templates/message-spine-template.md
---

# Prompt: 02 — Message Spine

## When to use
After the signal doc exists and is strong enough to support a reduction. Before any first-page decision.

## What good output looks like
- names the two to four truths strong enough to organize pages
- preserves audience distinctions worth keeping
- identifies the key trust question
- does not yet decide which page to build

## Prompt

```text
Using the signal doc below, reduce it into a message spine.

Do not decide which page we are building yet.
Do not write page copy yet.
Do not invent proof.

Give me:
1. core truth
2. target audience
3. sharp pain statement
4. desired shift or outcome
5. strongest language to preserve
6. page-level message implications
7. key trust question to answer
8. weak directions to avoid

Signal doc:
[see prior-step artifacts]
```

## If the output is weak
The signal doc is probably too broad. Go back to step 01, sharpen it, or add a mechanism / proof / comparison brief before retrying.
