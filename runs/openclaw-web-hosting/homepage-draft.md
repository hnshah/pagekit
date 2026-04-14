# Homepage Draft — OpenClaw Web Hosting

*Draft status: first pass, post slop-pass. Positioning-first argument order. Product specifics flagged for verification. Proof placeholders marked.*

---

## Section 1 — The gap (hero)

**Headline:**
Hosting for developers in the gap between Heroku-style PaaS and raw cloud.

**Sub-headline:**
OpenClaw gives you control over your deploy, your runtime and your exit, without the DevOps work that raw cloud requires.

**CTA:**
Deploy your first app →  ·  Read the docs

---

*Draft note: the headline names a specific market gap rather than a general pain. Test whether naming Heroku by name helps recognition for post-Heroku migrants, or if the generic "Heroku-style PaaS" lands wide enough.*

---

## Section 2 — What OpenClaw is and is not

**Heading:** What OpenClaw is and is not.

**Body:**

OpenClaw is developer hosting with three commitments: configuration you own in your repo, a runtime you choose, and an export path you can use without our help. The rest of this page shows what each of those means in practice.

It is not a PaaS that hides configuration behind a proprietary format, and it is not a VPS that hands you a blank terminal and calls that developer experience. The target audience is developers who know what they need and want a platform that stays out of the way.

---

*Draft note: this section replaces the original "Not a PaaS with a different logo. Not a VPS with a tutorial." slop heading and the triple-anaphora body. It now makes the same distinction without the rhythm tell.*

---

## Section 3 — The control claim

**Heading:** What you control.

**Body:**

*[Verification flag: confirm all four points below against actual product capabilities before publishing.]*

Your deployment configuration lives in a file in your repository, versioned alongside your code.

*[Verification flag: confirm supported runtimes and build options.]*
You choose your runtime and build process. OpenClaw does not impose a default stack or require you to adapt your application to its environment.

To see what you are running, or to move it somewhere else, you export your configuration and data in *[standard format: confirm one of Docker Compose, plain YAML, or other]*. The export is a single command that produces a standard format.

You can reproduce your OpenClaw environment locally, or on any other provider, from the files you already have.

---

*Draft note: the four claims above are the most important things to verify before publication. A developer will test each of them within the first week. If the reality is narrower than the claim, the copy must be rewritten to match what is actually true. Overstating here is the fastest path to negative word of mouth.*

---

## Section 4 — Pricing transparency

**Heading:** What it costs.

**Body:**

*[Verification flag: replace the worked example below with real numbers from the actual pricing model before publishing. Do not publish placeholder figures.]*

A typical app on OpenClaw (one web service, one database, 10 GB storage, moderate traffic) costs approximately $[X]/month. Here is what that is made of:

| Component | Cost |
|---|---|
| Web service ([size]) | $[X]/mo |
| Database ([size]) | $[X]/mo |
| Storage (10 GB) | $[X]/mo |
| Bandwidth (up to [X] GB/mo) | included |
| **Total** | **$[X]/mo** |

Outbound traffic is included up to *[confirm: traffic cap]*. Pricing is usage-based, not tier-based: there is no feature you cannot use at your current spend level.

*[If a cost estimator exists: link to it here. "Build your own estimate →"]*

---

*Draft note: a tier table with "Starter / Pro / Enterprise" is not what this section is. If the real pricing model makes a worked example difficult to construct, that is a signal the pricing model itself needs clarification before the homepage can do this section honestly.*

---

## Section 5 — Portability

**Heading:** If you want to leave, you can.

**Body:**

Your OpenClaw configuration is stored in *[format: confirm]* files in your repository. Your database can be exported as a standard *[Postgres dump / MySQL dump / other: confirm]* at any time. Your environment variables are yours to copy.

*[Verification flag: confirm the export command or mechanism and the realistic migration time estimate below.]*

To move everything off OpenClaw: *[one command / a UI export / describe the actual process]*. For a typical app, the migration takes *[hours / a day / confirm]*. The portability comes from building on formats that work everywhere, so the exit is a property of the product rather than a marketing feature.

---

*Draft note: the old "We do this because we think you should be able to trust a platform without being trapped by it" line was editorial voice narrating brand restraint. Cut. The product either shows portability in the mechanism or it does not; commentary does not help.*

---

## Section 6 — Proof

**Heading:** What developers found when they moved.

*[Placeholder structure — do not publish without real developer stories. Format shows the specificity level required.]*

---

**Story 1 — Post-Heroku migration**

*[Format: Developer name/handle, what they were running on Heroku (language, rough description of the app), when they migrated and why, what the migration to OpenClaw involved (time, difficulty, anything unexpected), what is different now. 3–5 sentences. Include cost delta if available. Real name and verifiable project preferred over anonymous.]*

---

**Story 2 — PaaS ceiling**

*[Format: Developer name/handle, what platform they were on, what they hit (pricing tier, config limitation, capability gap), what specifically OpenClaw gave them that the prior platform didn't, any measurable outcome (cost, deployment time, config they now control). 3–5 sentences. Real name preferred.]*

---

**Story 3 — Optional: long-term use**

*[Format: Developer who has been on OpenClaw for over a year. What they're running, whether they've had to contact support and what that was like, whether anything has changed in their setup, whether they've considered moving and why they haven't. This story addresses the longevity question indirectly. Real name preferred.]*

---

## Section 7 — CTA

**Heading:** Start here.

**Body:**
Start with your next project or bring an existing app over. Your first *[X days / app / confirm free tier terms]* is free.

**CTA:**
Deploy your first app →

*[Secondary link: "Migrate from Heroku →" — high intent, worth surfacing if a migration guide exists.]*

---

## Draft notes

For the slop-pass audit trail (every flagged line and rewrite) see `slop-pass.md`.
For the original pre-de-slop version see `homepage-draft-original.md`.

**What this draft needs before publication:**
- Section 3: all four product capability claims verified.
- Section 4: real worked example with real numbers.
- Section 5: export command and migration-time estimate confirmed.
- Section 6: real developer stories inserted.
- Free tier terms and trial details confirmed for CTA.

**Upstream recommendation:**
Before publishing, conduct 5 to 10 developer interviews split between post-Heroku migrants and current PaaS users. The signal doc assumptions about the PaaS-to-cloud gap and lock-in anxiety should be tested against real developers before the copy locks.
