# Anti-Slop Framework

Slop is the collection of sentence-level, paragraph-level and structural patterns that make a page read as "written by AI," regardless of whether the content is accurate.

Slop hurts PageKit specifically: a page whose job is to earn trust loses trust the moment the reader notices the rhythm is artificial, even if the proof is real. This is why slop is treated as a proof issue here, not only a voice issue.

This document is the authoritative list of patterns PageKit treats as slop.
It is referenced by `frameworks/page-argument-shape.md` (drafting constraints), `frameworks/claim-checking.md` (flag type), `templates/page-argument-shape-template.md`, `templates/claim-check-template.md`, the five tool guides, the five quickstarts, `CLAUDE.md` and `scripts/slop-check.sh`.

## What this is not

This is not a style guide for personality.
Voice, cadence, plain specific prose are all welcome.
The patterns listed below are the ones that, on real runs, have read as machine output rather than human thought.

## Patterns

### 1. Negation patterns

Drafts reach for negation when they have not committed to a claim. The rhythm that results is the most recognizable slop tell.

- **Not-X-Not-Y** — consecutive sentences or headings that both begin with "Not":
  > Not a PaaS with a different logo. Not a VPS with a tutorial.
- **Not-X-but-Y** — a rhetorical pivot that replaces a weak claim with a vaguer one:
  > Not a pricing tier. A pricing model.
- **X-not-Y** — binary contrasts that sound sharp but usually hide the real claim:
  > you pay for what you use, not for the features you need to unlock
- **No-X-No-Y** — the enumerated version of Not-X-Not-Y:
  > No egress fees. No tier-forcing. No surprises.

Rule: say what the product *does*. Say what it *is*. Negations are allowed only when they carry specific content the affirmation cannot. Never stack more than one negation-led construction in the same paragraph.

### 2. Rule-of-three rhythmic clustering

Three short parallel sentences used for cadence, not content:
> Your config. Your runtime. Your deployment.
> One command. Standard format. No proprietary packaging.
> You read it, you edit it, you own it.

The read always goes: triadic beat → recognizably AI.

Rule: never end a section on a triad. Never write three parallel fragments in a row. If three items belong together, make them a list, or pick the two that carry the most weight.

### 3. Sentence-start anaphora

Repeating the first word across consecutive sentences:
> Your…Your…Your
> It is not a platform that… It is not a platform that… It is not a VPS provider that…
> Every founder has… Every founder has…

Anaphora is a real rhetorical move when it carries an argument. In slop it carries cadence only.

Rule: vary sentence starts. If the same leading word appears three times in a row in consecutive sentences, rewrite at least two of them.

### 4. Editorial voice narrating brand restraint

The brand narrating its own honesty, virtue or discipline instead of demonstrating it:
> We do this because we think you should be able to trust a platform without being trapped by it.
> That's the deal.
> This is the question most brands skip. We don't.
> We will not say "vet approved."

A page earns trust by showing the work. A page that announces it is showing the work erodes the effect.

Rule: no lines that narrate brand discipline, brand virtue or brand honesty. If a sentence could be removed without losing any concrete information, remove it.

### 5. Em-dash stacking

Em-dashes used as rhetorical beats rather than genuine parentheticals:
> OpenClaw is developer hosting with real control — without the DevOps tax.
> Made for owners who want their dog healthy and their conscience clear — in that order.

Rule: one em-dash per paragraph, maximum. If the sentence needs a genuine aside, a comma or parentheses usually work. Two em-dashes in a paragraph is almost always a cadence tell.

### 6. Intensifier vocabulary

Words that make a sentence feel confident without adding information:

- **actually** — "what it actually costs," "the question developers are actually asking"
- **additionally** — connective scaffold with no load
- **testament** — "a testament to craft"
- **landscape** — "the SaaS landscape"
- **showcasing** — any form of "this page showcases"
- **genuinely** — "genuinely different"
- **truly** — "truly understand"

Rule: cut these words. If cutting the word changes the meaning, you have found the rare case where it belongs. Usually it does not.

### 7. Marketing-punchy section enders

One-line section enders that exist to feel quotable:
> Deploy something real.
> Start with what's right for your dog.
> That's the deal.
> Not the cloud. Not a PaaS. What comes next.

Rule: sections should end on the concrete thing the reader should do or understand. If the ending is a slogan, it is slop. The CTA section is the only place a punchy line is allowed, and even there, specific beats clever.

### 8. Quoted antithesis

Constructing a trade-off by putting two scare-quoted phrases next to each other:
> The gap between "easy but limited" and "powerful but complex"
> Not "vet approved." Actually formulated by a vet.

This pattern signals the writer is arguing with a straw competitor rather than explaining their own product.

Rule: describe what the product does directly. If the comparison matters, name the real alternative and the real difference without scare quotes.

### 9. Copula avoidance

Replacing "is" or "has" with more performative verbs:

- **serves as** — "the platform serves as a foundation"
- **boasts** — "boasts 99.99% uptime"
- **features** — "features a clean interface"
- **showcases** — "showcases the ingredients"
- **delivers** — "delivers performance"
- **empowers** — "empowers developers"

Rule: use "is" or "has." If that feels too flat, the sentence is usually too abstract and needs a concrete fact, not a stronger verb.

### 10. Signposting

Narrating the structure of the page instead of executing it:
> Let's dive in.
> Here's the thing.
> Here's what matters.
> This is important.

Rule: do not announce sections. Write the section.

### 11. Filler

Phrases that add syllables without content:

- "in order to" → "to"
- "due to the fact that" → "because"
- "at this point in time" → "now"
- "it should be noted that" → cut entirely
- "for the purposes of" → "for"

Rule: the shorter version is almost always the better version.

### 12. Significance inflation

Language that makes the product sound historic:
> a pivotal moment
> a critical juncture
> the future of X
> reimagining how Y
> redefining the Z

Rule: the reader decides what is pivotal. The page describes what the product does.

## How this gets enforced

Slop is caught in four places:

1. **Page argument shape — drafting constraints.** The shape step lists the hard no-go patterns before a draft is written. This is upstream prevention.
2. **Claim check — `ai-slop tell` flag type.** Any slop pattern found in a draft is logged as a claim-check flag and rewritten. Recurring patterns are absorbed upstream into the drafting constraints.
3. **Slop-check script (`scripts/slop-check.sh`).** Grep-level regression check for the patterns that can be detected without semantic analysis (Not-headings, em-dash density, intensifier counts, copula-avoidance verbs, signposting, filler). Cheap, fast, catches the obvious cases.
4. **Guides and quickstarts.** The compact anti-slop rule list appears in every drafting prompt so the model does not need to remember it.

## Principle

If a sentence sounds good read aloud but would leave no information behind if you cut it, cut it. That is the test.
