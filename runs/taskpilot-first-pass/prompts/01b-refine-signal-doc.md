# Prompt 01b — Refine Signal Doc After Wedge Definition

## Objective
Re-run the TaskPilot signal layer after adding a sharper wedge definition brief.

## Model
GPT-5.4 via current OpenClaw session.

## Exact prompt

You are refining a signal doc for a homepage-oriented PageKit run.

A first pass already exposed that the object was too category-level.
You now have an additional wedge-definition source.

Using the current TaskPilot source set, produce an improved signal doc with these sections:
1. what the product appears to be now
2. clearest first audience
3. sharpest pain framing
4. desired outcomes
5. buying resistance or trust questions
6. native phrases worth keeping
7. generic category language to avoid
8. strongest current homepage implication
9. what is still unknown
10. weak claims to avoid

Output requirements:
- make the pain framing sharper than the first pass
- preserve uncertainty where uncertainty still exists
- optimize for moving into a homepage-ready message spine next
- do not write homepage copy yet

## Inputs expected
- `sources/01-source-capture.md`
- `sources/02-product-brief.md`
- `sources/03-wedge-definition-brief.md`
- prior signal-doc first pass

## Failure modes to watch for
- dressing up category language as insight
- overstating product certainty
- falling into generic task-software framing
