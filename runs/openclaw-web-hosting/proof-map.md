# Proof Map — OpenClaw Web Hosting Homepage

## Page
- name: Homepage — positioning-first opening
- audience: Indie developers, small startup teams, post-Heroku migrants
- job: Produce recognition of the PaaS-to-cloud gap, establish portability and pricing trust, convert to trial or first deployment

---

## Required proof by argument section

### Section 1 — The gap (hero)
**Proof needed:** None in the traditional sense. This section earns credibility through accuracy of problem description. If the lead line names the frustration precisely — the experience of outgrowing a platform but not wanting to absorb cloud complexity — it is self-evidently true to the right reader.
**Risk:** If the language is too generic ("tired of overpriced hosting?"), it loses the developer who has heard every variation of that line. The proof here is specificity of description, not external validation.
**Current status:** Drafting can proceed. No external proof required.

---

### Section 2 — What OpenClaw is not
**Proof needed:** Again, accuracy rather than external proof. The descriptions of what OpenClaw is not must be specific enough to map to real competitor failure modes — PaaS pricing cliffs, raw VPS complexity, migration lock-in — not vague disavowals.
**Risk:** If "we're not like those other guys" is vague, it reads as marketing defensiveness. If it is specific (naming the failure mode, not the brand), it reads as understanding.
**Current status:** Drafting can proceed with verified product knowledge of what OpenClaw genuinely does differently.

---

### Section 3 — The control claim
**Proof needed:** Product accuracy — the behaviors described must match what the product actually supports.
- Configuration-as-code: is deployment config stored in a versioned file? What format?
- Runtime choice: what runtimes and build processes are genuinely supported?
- Export: what can be exported, in what format, triggered how?
- Local reproducibility: can the environment actually be reproduced locally?

**Current gap:** Product specifics unconfirmed. The draft will describe the control claims at a behavioral level and flag each for product verification.
**Risk:** High. Overstating the control claim is the most damaging failure mode for a developer audience — they will test it on day one and the gap between claim and reality will produce immediate churn and negative word of mouth. This section must be accurate.

---

### Section 4 — Pricing transparency
**Proof needed:** A real worked pricing example — a specific app configuration (web server, database, storage tier, traffic estimate) and its actual monthly cost, with the components shown.
- Best case: a cost estimator tool embedded in or linked from this section
- Second best: a worked example table with a common app profile and its cost breakdown
- Minimum: a pricing page that is genuinely simple and has no hidden egress or tier-forcing fees

**Current gap:** Actual pricing model unconfirmed. The draft will write the section structure and flag for real numbers.
**Risk:** High for a different reason — if the pricing example is invented and the real numbers are different, this section actively damages trust. Do not publish with placeholder numbers.

---

### Section 5 — Portability
**Proof needed:** A specific, mechanical description of what portability means in the product:
- What files/formats does the developer own?
- What is the export mechanism — a command, a UI action, an API call?
- How long does a migration realistically take for a typical app?
- Is there documentation for migrating away from OpenClaw specifically?

**Current gap:** Portability mechanism unconfirmed. The draft will write the section structure with placeholder specifics.
**Risk:** This is the highest-trust section for the post-Heroku audience. A vague portability claim ("your data is yours") is exactly what lock-in platforms said before they changed their policies. The claim must be specific and demonstrable — ideally with a link to the actual export documentation, not a general promise.

---

### Section 6 — Proof (developer stories)
**Proof needed:** Two or three developer cases at scenario level.

**Post-Heroku migration story:**
- What they were running on Heroku (language, rough app size)
- When and why they had to migrate
- What the migration to OpenClaw involved and how long it took
- What changed afterward (cost, control, anything unexpected)
- Real developer name/handle and app description if available

**PaaS ceiling story:**
- Developer on Render or Railway, what hit the ceiling (pricing, capability, config limitation)
- What they needed that OpenClaw provided
- Specific outcome — cost delta, configuration they now have, time saved
- Real developer name/handle if available

**Current gap:** No real developer stories available for this run. Section 6 will be written as placeholder structure. Do not invent names, app descriptions, or cost numbers.
**Risk:** Same as in all runs — if placeholders are polished enough to look like copy, they may ship unfilled. Mark them unambiguously.

---

### Section 7 — CTA
**Proof needed:** None beyond what prior sections have established.
**Risk:** If sections 1–6 haven't built the argument, the CTA is inert.

---

## Weak spots — where the draft could drift into unsupported language

**Weak spot 1: The control claim (Section 3)**
Highest risk. "Full control over your infrastructure" is what every hosting provider says. The section must get specific — configuration file format, export command, runtime selection mechanism — or it becomes indistinguishable from the category noise it is trying to escape. If the product specifics aren't confirmed before publication, this section will fail.

**Weak spot 2: The pricing transparency section (Section 4)**
High risk of showing a clean pricing tier table instead of a real worked example. A tier table with per-month costs and features is what every host shows. The section earns trust only by showing a specific app profile and its real cost. Without that, the section is decorative.

**Weak spot 3: The portability section (Section 5)**
Medium-high risk of drifting into "your data is always yours" language that sounds good and means nothing. The section works only with a specific mechanism. If the mechanism can't be named, cut the section to one sentence of honest scope: "We're working on a full export tool — here's what's available today."

**Weak spot 4: The "what OpenClaw is not" section (Section 2)**
Medium risk of vague disavowal ("we're not like other hosts"). The section must name specific failure modes, not brands. "Not a platform that makes your config unreadable and migration a four-day project" is useful. "Not like the hosting providers you've tried before" is not.

**Weak spot 5: Developer story placeholders (Section 6)**
Same risk as every run. Unambiguous placeholder marking required.
