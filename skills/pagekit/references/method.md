# PageKit method

The stable chain that every PageKit run follows. Steps 01-06 are required. Step 07 is an optional durability pass.

```
signal-doc -> message-spine -> first-page-decision -> page-argument-shape -> proof-map -> first-page-draft [ -> claim-check ]
```

## Steps

| # | Name | Skill | Artifact | Inputs |
|---|---|---|---|---|
| 01 | Build a Signal Doc | `pagekit-signal-doc` | `signal-doc.md` | product brief + any source briefs |
| 02 | Reduce to a Message Spine | `pagekit-message-spine` | `message-spine.md` | `signal-doc.md` |
| 03 | Decide the First Page | `pagekit-first-page-decision` | `first-page-decision.md` | `signal-doc.md`, `message-spine.md` |
| 04 | Design the Page Argument Shape | `pagekit-page-argument-shape` | `page-argument-shape.md` | `first-page-decision.md` |
| 05 | Map Proof to the Page | `pagekit-proof-map` | `proof-map.md` | `first-page-decision.md`, `page-argument-shape.md` |
| 06 | Draft the First Page | `pagekit-first-page-draft` | `first-page-draft.md` | all 5 upstream artifacts |
| 07 | Claim Check (optional) | `pagekit-claim-check` | `claim-check.md`, `first-page-draft-corrected.md` | `first-page-draft.md`, `proof-map.md` |

Step 03 does NOT default to homepage. The object decides. The decision must list candidates considered and rejected.

Step 06 must respect the anti-slop rules in `./anti-slop.md`. Unverified product-specific claims get inline `*[verification flag: ...]*` markers.

Step 07 has three severities: light, normal, hard. Default is normal.

## Tooling skills

| Skill | Script | Purpose |
|---|---|---|
| `pagekit-new-run` | `scripts/new-run.sh` | Scaffold a fully-logged run folder |
| `pagekit-run-check` | `scripts/run-check.sh` | Validate a run against the logging tiers |
| `pagekit-slop-check` | `scripts/slop-check.sh` | Heuristic regression check for AI-slop patterns |
| `pagekit-evaluator-pass` | (subagent) | Adversarial second read on a completed run |

## Run logging

See `./run-logging.md` for the full definition of the `fully-logged`, `summary-logged`, and `publishable` tiers.

## Anti-slop

See `./anti-slop.md` for the authoritative list of AI-slop patterns that are treated as hard no-goes at drafting time and at claim-check time.
