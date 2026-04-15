# Working Log — Me CRM (personal-crm-founders)

Chronological notes. Each entry marks a step transition or a mid-step decision.

## Start
- Run scaffolded from `main` using `scripts/new-run.sh personal-crm-founders`
- Source-brief state: fresh — training fiction run with committed product facts; no prior run to carry from
- Product: Me CRM — personal CRM for startup founders
- Product facts committed up front in `sources/02-product-brief.md`; all social proof absent (pre-launch)

## Step 01 — signal doc
- Extracted failure modes from pattern-level founder knowledge + product brief
- Native phrases preserved: "gone dark," "follow-up debt," "context fade," "where you are with someone," "went cold"
- Generic language flagged for avoidance: "stay connected," "manage your network," "build stronger relationships," "never miss a follow-up again," "relationship intelligence," "the CRM for founders"
- Key unknown: how founders discover the product (acquisition path would change whether the first page does recognition or conversion work)

## Step 02 — message spine
- Core truth: founders lose track of WHERE they are with someone, not who they are — Me CRM holds that state so it doesn't have to live in their head
- Three page jobs in order: name the failure mode, show why current tools miss it, demonstrate Me CRM holds the state without demanding new habits
- Key trust question: "Will I actually use this?" — adoption doubt more important than data privacy or pricing
- Weak directions flagged: feature-first, category-default framing, outcome language unsupported by any usage proof

## Step 03 — first-page decision
- Four candidates evaluated with full FOR-paragraph before any rejection:
  - A: Homepage — defensible but surfaces "CRM" label too early; triggers comparison before recognition
  - B: Problem-first landing page — problem named before product; defers category label until recognition has happened
  - C: Category-explainer page — real argument for founders who have already cycled through Salesforce or Notion; named as a future page for that sub-segment
  - D: Founder story page — real founder-of-founder credential exists, but no social proof yet to anchor it; trust floor is too thin
- Decision: Candidate B (problem-first landing page)
- Confidence basis: hypothesis — structural argument for cold acquisition, no audience data to confirm

## Step 04 — page argument shape
- Six sections: failure mode (hero), why current tools miss it, what Me CRM tracks, maintenance question, trust floor, CTA
- Explicit exclusions: no features grid, no testimonials section, no integrations section, no "for teams" section, no founder story as lead
- Anti-slop constraints applied; scope constraint added: no outcome claims for pre-launch product without usage data

## Step 05 — proof map
- Confirmed claims: product features (relationship state cards, Gmail import, weekly digest at 30-day threshold), pricing tiers, trial terms, data handling, CSV export
- Unconfirmed / verification-flagged: SOC 2 audit status, current waitlist count, 50–100 relationship range as stated design parameter
- Risky moves listed by section; Section 4 (maintenance) explicitly flagged as outcome-adjacent — end on mechanism, not result

## Step 06 — first page draft
- Draft produced; slop-check run immediately
- **Slop-check result: 7 hits**
  - 5 em-dashes in body copy (check_em_dash) — converted to colons, parentheses, or sentence breaks
  - 2 "actually" intensifiers — removed
- Draft clean after fixes

## Step 07 — claim check
- Severity: normal
- Rationale for normal (not hard): draft was already careful; proof map explicit about what is and is not defensible; hard pass would flag borderline modifiers in category-level descriptions that are not product claims
- **7 flags total:**
  - 2 ai-slop tells: X-not-Y heading in Section 3; two-sentence rhetorical punch ender in Section 3 body
  - 2 unsourced quantitative modifiers: "usually" + "three weeks in" in Section 2; "most determine" in Section 3
  - 1 vague claim: "worth more than a detailed log" comparison in Section 3
  - 2 outrun claims: "more likely the record stays current" (Section 4); "the work you do compounds" (Section 4)
- All 7 flags resolved in `first-page-draft-corrected.md`
- **Post-correction issue**: subagent left inline `*[Rewritten: ...]*` annotations in body copy; these were stripped manually; 2 new em-dashes introduced by rewrites (lines 41 and 65) were also fixed
- Slop-check on corrected draft: clean (0 hits)
- **Recurring patterns identified:**
  - Outcome language (flags 5 and 6): Section 4 crossed from mechanism into implied user result twice
  - Negation/contrast as closer (flags 1 and 7): Section 3 used X-not-Y heading and two-sentence rhetorical punch in same section
- Upstream repair recommended in claim-check but not yet applied: proof map note for outcome-adjacent sections; anti-slop entry for negation-as-closer two-sentence variant

## Evaluation
- Run holds; first-page decision is the structural contribution
- Section 4 (maintenance question) is the most differentiated section in the draft
- Section 2 acknowledged as category-default — does structural job but would appear on any founder-CRM page
- Proof gap (no social proof, waitlist number is the only trust signal) is named and treated as a source gap, not a draft problem
- Publication readiness checklist: 6 items (testimonial, SOC 2 status, waitlist count, 50–100 range confirmation, free tier terms, trial terms)

## Evaluator pass
- Adversarial read identified 4 structural issues for repo improvement:
  1. First-page decision template should prompt falsification criteria for hypothesis-confidence decisions
  2. Evaluation template should surface source quality (real vs. training fiction) prominently
  3. Claim-check corrected draft protocol should distinguish "remove (wrong)" from "remove pending verification"
  4. Evaluation template should prompt what source material would fix a named-weak section, not just name the weakness
- Final evaluator read: run is a clean demonstration of the PageKit process applied to training fiction; honest about constraints; suitable as reference example with explicit "training fiction" caveat
