# Prompt 02 — Reduce to Message Spine

## Objective
Turn the refined TaskPilot signal doc into a homepage-oriented message spine.

## Model
GPT-5.4 via current OpenClaw session.

## Exact prompt

You are reducing a refined signal doc into a homepage-oriented message spine.

Your job is to identify the smallest set of truths strong enough to organize homepage copy for TaskPilot.
Do not write the homepage yet.
Do not pretend certainty where the product is still underdefined.

Using the current TaskPilot signal material, produce a message spine with these sections:
1. core truth
2. target audience
3. sharp pain statement
4. desired shift or outcome
5. strongest language to preserve
6. homepage message implications
7. key trust question to answer
8. weak directions to avoid

Output requirements:
- optimize for homepage clarity
- make the pain sharper than generic task-software language
- preserve uncertainty where needed
- keep it short enough to guide a homepage draft next

## Inputs expected
- refined signal doc
- wedge-definition brief
- prior signal outputs

## Failure modes to watch for
- turning the message spine into headline copy too early
- broadening the audience again
- drifting back into generic productivity framing
- inventing proof we do not have
