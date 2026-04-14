<!--
This file starts as a copy of prompts/01-signal-doc.md (the canonical prompt for this step).
When you run the step:
1. Substitute the required inputs into the prompt.
2. Save the version you actually sent to the model here.
3. Save the raw output to outputs/01-signal-doc-output.md.
-->

---
step: "01"
name: signal-doc
title: Build a Signal Doc
inputs:
  - product-brief (or raw product description)
outputs:
  - signal-doc.md
framework: frameworks/signal-doc.md
template: templates/signal-doc-template.md
---

# Prompt: 01 — Signal Doc

## When to use
At the start of a PageKit run. Before any page decision, before any spine, before any draft.

## What good output looks like
- separates observation from assumption
- gives sharper language than the category default
- exposes what is still unknown
- distinguishes audiences where it matters

## Prompt

```text
I want to build a web page through the PageKit process.

Do not write page copy yet.
Do not assume which page we are building.
Help me build a signal doc first.

Using the product description (and any source briefs) below, produce a signal doc with these sections:
1. what the product appears to be
2. likely target audience(s)
3. recurring pains or friction
4. desired outcomes
5. trust questions or buying resistance
6. native phrases worth keeping
7. generic language to avoid
8. what still feels unknown
9. weak claims to avoid early

Rules:
- do not invent outside facts; use only what is in the briefs
- do not restate marketing language; extract real signal
- keep uncertainty visible where it is real

Source material:

---
[sources/01-source-capture.md]

# Source Capture — Me CRM

## What exists

- Product brief (02-product-brief.md): committed concrete facts for this training fiction run
- Pattern-level knowledge: founder CRM pain is well-documented in startup writing — the "going dark on relationships" failure mode, the inadequacy of sales CRMs for founder relationship management

## What is missing

- No real founder interviews or testimonials (pre-launch product)
- No usage data or engagement metrics
- No competitive comparison data (no specific named-competitor performance claims)
- No investor or advisor endorsements
- SOC 2 Type II not yet completed (in progress)

## Signal quality

Pattern-level only. The product facts are committed and specific (see product brief), but all social proof is absent. The run must stay inside what the product brief supports. Any testimonial or outcome language must be scaffolded as placeholder, not invented.

## Source type

Training fiction with committed product facts. Treat the product brief as ground truth throughout the run.

---
[sources/02-product-brief.md]

# Product Brief — Me CRM

## Product name
Me CRM

## What it is
A personal CRM built for startup founders. Designed for tracking the relational state of the 50–100 relationships that most determine a founder's company trajectory: investors, advisors, early customers, prospective hires, key press contacts.

## Core insight
Founders don't lose track of who someone is. They lose track of WHERE they are with someone — what was last said, what was promised, when they last spoke, what the next step is. That is the specific gap Me CRM is designed to close.

## What it is explicitly not
- Not a sales CRM. No pipeline, no deals, no lead scoring, no sequence automation.
- Not for high-volume outreach. Optimized for relationship depth, not contact volume.
- Not a team sales tool. Team plan is for co-founders sharing relational context, not a sales org.

## Feature set
- Relationship state cards: per-contact view showing last contact date, conversation notes, what you owe them (open follow-ups), and next step
- Gmail import: pulls in contact history from Gmail on setup; no ongoing sync required
- Weekly relationship digest: email sent every Monday showing which relationships have gone quiet (no contact in 30+ days)
- Snooze and reminder: set a "check back in X days" reminder per relationship; surfaces in digest and app
- Relationship tags: investor / advisor / customer / hire / press (single tag per contact)
- Quick note capture: iOS app for capturing a note immediately after a conversation, before context fades
- No pipeline view, no deal stages: intentionally absent

## Pricing
- Free tier: up to 25 relationships, no reminders, no digest
- Solo: $19/month (unlimited relationships, reminders, weekly digest)
- Team: $49/month (up to 5 people, shared relationship context for co-founders)
- 14-day free trial on paid plans, no credit card required to start trial

## Proof assets available
- 200 founders on the waitlist (pre-launch signal, not a usage number)
- Built by a former seed-stage founder who experienced the problem firsthand (founder story available)
- No published testimonials yet

## Trust and data
- Contact data is not sold or shared with third parties
- Data export (CSV) available at any time, from any plan
- SOC 2 Type II audit in progress, not yet certified
- Hosted on AWS; data encrypted at rest and in transit

## Target audience
Early-stage startup founders, primarily seed to Series A. Secondary: solo operators and indie founders who manage a high-stakes network without a team.
```

## If the output is weak
Stop. Before moving to step 02, create a sharper source artifact (wedge definition, mechanism brief, proof brief, comparison brief). See `templates/wedge-definition-template.md`.
