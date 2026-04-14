# Homepage Draft — OpenClaw Web Hosting

*Draft status: first pass. Positioning-first argument order. Product specifics flagged for verification. Proof placeholders marked.*

---

## Section 1 — The gap (hero)

**Headline:**
You've outgrown your platform. You haven't got time to become a cloud engineer.

**Sub-headline:**
OpenClaw is developer hosting with real control — without the DevOps tax.

**CTA:**
Deploy your first app →  ·  Read the docs

---

*Draft note: the headline names a specific transition point, not a general pain. "Outgrown your platform" speaks to the post-Heroku migrant and the developer hitting a PaaS pricing ceiling. "Haven't got time to become a cloud engineer" speaks to the developer who looked at AWS and put it off. Test whether both halves are needed or whether one lands harder alone.*

---

## Section 2 — What OpenClaw is not

**Heading:** Not a PaaS with a different logo. Not a VPS with a tutorial.

**Body:**

OpenClaw is not a platform that makes your first deployment easy and your second year expensive. It is not a platform that stores your configuration in a format only it can read, so that leaving takes longer than arriving. It is not a VPS provider that hands you root access and a blank terminal and calls that developer experience.

It is hosting built for developers who know what they need and want a platform that doesn't work against them when they try to get it.

---

*Draft note: this section names failure modes, not competitor brands. That is intentional. The developer recognizes their own experience in the description — it does not require them to agree that a specific company is bad. Keep it at this level.*

---

## Section 3 — The control claim

**Heading:** Your config. Your runtime. Your deployment.

**Body:**

*[Verification flag: confirm all four points below against actual product capabilities before publishing.]*

Your deployment configuration lives in a file that sits in your repository, versioned alongside your code. You read it, you edit it, you own it.

*[Verification flag: confirm supported runtimes and build options.]*
You choose your runtime and build process. OpenClaw does not impose a default stack or require you to adapt your application to its environment.

When you want to see what you're running — or move it somewhere else — you export your configuration and data in *[standard format — confirm: Docker Compose, plain YAML, other]*. One command. Standard format. No proprietary packaging.

You can reproduce your OpenClaw environment locally, or on any other provider, from the files you already have.

---

*Draft note: the four claims above are the most important things to verify before publication. A developer will test each of them within the first week. If the reality is narrower than the claim — if, say, runtime choice is limited or export is partial — the copy must be rewritten to match what is actually true. Overstating here is the fastest path to negative word of mouth.*

---

## Section 4 — Pricing transparency

**Heading:** What it actually costs.

**Body:**

*[Verification flag: replace the worked example below with real numbers from the actual pricing model before publishing. Do not publish placeholder figures.]*

A typical app on OpenClaw — one web service, one database, 10 GB storage, moderate traffic — costs approximately $[X]/month. Here is what that is made of:

| Component | Cost |
|---|---|
| Web service ([size]) | $[X]/mo |
| Database ([size]) | $[X]/mo |
| Storage (10 GB) | $[X]/mo |
| Bandwidth (up to [X] GB/mo) | included |
| **Total** | **$[X]/mo** |

No egress fees on *[confirm: standard outbound traffic]*. No tier-forcing: you pay for what you use, not for the features you need to unlock.

*[If a cost estimator exists: link to it here. "Build your own estimate →"]*

---

*Draft note: a tier table with "Starter / Pro / Enterprise" is not what this section is. If the real pricing model makes a worked example difficult to construct, that is a signal the pricing model itself needs clarification before the homepage can do this section honestly.*

---

## Section 5 — Portability

**Heading:** If you want to leave, you can.

**Body:**

Your OpenClaw configuration is stored in *[format — confirm]* files in your repository. Your database can be exported as a standard *[Postgres dump / MySQL dump / other — confirm]* at any time. Your environment variables are yours to copy.

*[Verification flag: confirm the export command or mechanism and the realistic migration time estimate below.]*

To move everything off OpenClaw: *[one command / a UI export / describe the actual process]*. For a typical app, the migration is measured in *[hours / a day / confirm]*. Not because we've made leaving easy as a marketing claim — because we've built the product around formats that work everywhere.

We do this because we think you should be able to trust a platform without being trapped by it.

---

*Draft note: "because we think you should be able to trust a platform without being trapped by it" is the most direct sentence in the draft. Test it. Some readers will find it refreshing; some will find it overclaiming given that the brand is unproven. If proof of the portability mechanism is available (a demo, a doc, a real migration case study), this sentence earns itself. Without that, consider cutting it to the mechanical description alone.*

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

**Heading:** Deploy something real.

**Body:**
Start with your next project or bring an existing app over. Your first *[X days / app / confirm free tier terms]* is free.

**CTA:**
Deploy your first app →

*[Secondary link: "Migrate from Heroku →" — high intent, worth surfacing if a migration guide exists.]*

---

## Draft notes

**What this draft does differently:**
- Opens with the PaaS-to-cloud gap rather than a speed or reliability claim
- Names what the product is not before naming what it is — earns the right to make the claim
- Gives pricing transparency its own section as a trust move, not a sales move
- Addresses portability directly with a specific mechanism rather than a general reassurance
- Keeps "focus on your code not your infrastructure" out of the draft entirely

**What this draft needs before publication:**
- Section 3 (control claim): all four product capability claims verified
- Section 4 (pricing): real worked example with actual numbers
- Section 5 (portability): export command/mechanism confirmed, migration time estimate confirmed
- Section 6 (proof): real developer stories inserted
- Free tier terms and trial details confirmed for CTA

**The hardest section to publish honestly:**
Section 5 (portability). It is the most important trust section for the post-Heroku reader and the one most at risk of sounding like a claim that doesn't hold up. If the portability mechanism is partial or in progress, the draft should say exactly that: "Here is what you can export today, and here is what we are building toward." Partial honesty here outperforms a full claim that proves narrower than expected.

**Upstream recommendation:**
Before publishing, conduct 5–10 developer interviews split between post-Heroku migrants and current PaaS users. The signal doc assumptions about what the primary frustration is — the PaaS-to-cloud gap and lock-in anxiety — should be tested against real developers before the copy locks. If interviews surface a different primary framing (cost is the real issue, or support quality, or specific runtime support), the hero section will need revision.
