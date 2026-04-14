# Working Log

## Run: openclaw-web-hosting
## Date: 2026-04-14

---

### Step 1 — Signal Doc
**Status:** complete

Signal drawn from developer community discussion: Hacker News hosting threads, Reddit (r/webdev, r/selfhosted, r/devops), Twitter/X developer conversations about Heroku's 2022 free tier shutdown and its aftermath, indie hacker forum discussions, and the visible failure modes in current hosting brand copy.

Key finding: the market has polarized. One end is push-button platforms (easy but expensive at scale, and after Heroku's shutdown, no longer fully trusted). The other end is raw cloud (powerful but requires DevOps time most indie developers and small teams don't have). Developer frustration lives in the gap — products that outgrow shared hosting or PaaS pricing but whose founders don't want to become cloud engineers.

Also found: "reliability" and "speed" are table stakes in this market. Every hosting brand claims both. They do no differentiation work. The wedge has to be somewhere else.

---

### Step 2 — Message Spine
**Status:** complete

Spine settled on three truths:
1. The PaaS-to-cloud jump is a tax most small teams shouldn't have to pay
2. Control and simplicity aren't actually in conflict — they're only made to seem that way by platforms that profit from lock-in
3. The trust question in hosting isn't "will it be fast" — it's "will it still be here, and will I be able to leave if I need to"

Dropped "reliable and fast" from the spine entirely — these are category floor, not differentiation. Dropped "affordable" — pricing is a feature, not a message.

---

### Step 3 — First-Page Decision
**Status:** complete

Decision: homepage.

The recognition job is critical in a saturated category. Developers arriving at OpenClaw have seen dozens of hosting providers. The homepage has to produce a moment of "this understands what I actually need" in the first few seconds — or they'll leave. No other page can do that work first.

Interesting question surfaced: could a "pricing clarity" landing page be the first page, since opacity is a real pain point? Ruled out — pricing clarity is a supporting argument, not an opening premise. The visitor needs to identify with the product before pricing details can matter.

---

### Step 4 — Page Argument Shape
**Status:** complete

Argument order: recognition (the gap) → the distinction (what OpenClaw is not) → the claim (control without complexity) → how it works → trust answer (portability/no lock-in) → proof → CTA.

Unusual move: the "what we are not" section comes before the product claim. In a saturated category, ruling out the wrong mental models early is more valuable than leading with what the product does. Developers who've been burned by platform lock-in need to hear what OpenClaw won't do to them before they'll listen to what it will do for them.

Named five sections as unnecessary: uptime SLA percentage in the hero, speed benchmark comparisons, datacenter location list, tech stack compatibility grid, founder story.

---

### Step 5 — Proof Map
**Status:** complete

Main proof gaps: no uptime data, no benchmark results, no named customer case studies, no portability demonstration available for this first-pass run.

Draft constrained accordingly: performance claims avoided in the hero, uptime asserted at the category standard rather than a proprietary claim, portability described mechanically (what you own, what you can take) rather than by outcome statistics.

---

### Step 6 — Homepage Draft
**Status:** complete

Draft follows the approved argument shape. Opens on the gap (the PaaS-to-cloud tax), rules out the wrong models, makes the control-without-complexity claim, shows the mechanism, addresses portability/trust, and holds proof placeholders explicitly. Three verification flags for product specifics.

---

### Overall judgment
The wedge held through the full process. "Control without complexity" is a real gap in the market and the argument for it is coherent. The biggest risk is that the claim sounds like what every "developer-focused" hosting provider says — the draft combats this by being specific about the failure modes it solves (PaaS pricing cliffs, lock-in, DevOps overhead) rather than asserting a general position.

Biggest remaining gap: proof. No real customer stories, no uptime or performance data, no portability case study. The draft manages this by keeping claims at the mechanism level rather than the outcome level.

Upstream recommendation: before publishing, establish what "control" means specifically in the product — what can a developer configure, own, and export that they can't on Render or Railway? That answer is the most important thing to make concrete before the copy locks.
