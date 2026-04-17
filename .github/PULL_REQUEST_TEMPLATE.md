<!--
PageKit PR template. Keep these sections. Short and concrete beats polished.
Delete the comments before submitting.
-->

## Summary

<!-- One paragraph. What changes, why. If this is a run-driven method change, name the run that surfaced it. -->

## What changed

<!-- Bullets. File-level if useful. Keep it tight. -->

## Verification

- [ ] `bash scripts/doctor.sh` → PASS
- [ ] `bash scripts/slop-check.sh` → exit 0 clean
- [ ] (if the PR touches run structure) `bash scripts/run-check.sh runs/<name>` → FULLY LOGGED (or tier you target)
- [ ] (if the PR touches skills or their bundled references) reviewed against `AGENTS.md` and `CLAUDE.md` for consistency

## Notes for the reviewer

<!-- Anything worth calling out: trade-offs, things deferred, open questions. -->
