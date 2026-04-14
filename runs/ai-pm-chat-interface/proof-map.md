# Proof Map — AI-First PM Tool Homepage

## Page
- name: Homepage — maintenance-burden-first opening
- audience: Small engineering teams without a dedicated PM; PMs on growing teams; founders pre-coordination-breakdown
- job: Produce recognition of the maintenance burden, establish that the AI owns the maintenance work, address the accuracy trust question, convert to trial

---

## Required proof by argument section

### Section 1 — The maintenance problem (hero)
**Proof needed:** Accuracy of problem description. The lead line earns credibility by being specific enough that the right reader recognizes it immediately. No external proof required at this stage.
**Risk:** If the description is generic ("teams struggle to keep PM tools updated"), it will not produce recognition. The specificity of the framing — the board reflects the state from two weeks ago; the real information is in Slack — is what does the work.
**Current status:** Drafting can proceed.

---

### Section 2 — Why AI bolt-ons leave the gap open
**Proof needed:** Structural accuracy. The argument that bolting AI onto an existing PM tool does not remove the maintenance burden depends on describing the current model accurately: a human still initiates each update, and the tool still drifts when they are busy.
**Risk:** Medium. If the argument is too vague ("other AI tools are not good enough"), it reads as competitive dismissal. If it is specific ("AI that summarizes a thread still requires someone to decide whether the summary becomes a ticket"), it reads as an accurate structural critique.
**Current status:** Drafting can proceed. No external proof required, but the argument must be accurate to the actual mechanics of competing tools.

---

### Section 3 — How the AI maintains project structure
**Proof needed:** Product accuracy — all four behaviors described must match what the product actually does.

Specific claims requiring verification:
- Task creation from conversational language: what triggers a task? What language patterns does the AI recognize?
- Status updates from completion signals: what does the AI interpret as a task completion?
- Blocker creation from dependency language: what dependency patterns does the AI detect?
- Scope change flagging: how does this work? What triggers a flag vs. a silent update?

**Current gap:** All four behaviors are unverified in this run. The draft will describe them as specific behaviors and flag each for product confirmation.
**Risk:** High — this is the section that converts skeptical engineers. Overclaiming here will produce immediate churn when the product does not behave as described. Underclaiming will lose readers who need to see specificity to believe the capability is real. The draft must stay at the level of what can be confirmed.

---

### Section 4 — The correction model
**Proof needed:** An accurate description of what happens when the AI creates a wrong task or misses one.

Specific claims requiring verification:
- The correction mechanism: one-click dismissal? Inline edit? Review queue? Which of these exists?
- Whether errors compound: does a wrongly created task affect downstream structure, or is it isolated?
- The frequency question: the page should not claim a specific accuracy rate without data, but should address whether errors are common or occasional

**Current gap:** Correction model unconfirmed. Draft will write a placeholder structure for each correction mechanism option and flag for product confirmation.
**Risk:** High for trust. This section must describe a real mechanism. "Our AI is very accurate" is not an answer to the accuracy question; a real correction flow is. Without a real mechanism to describe, this section should be cut to a single honest sentence rather than a vague reassurance.

---

### Section 5 — Proof (team cases)
**Proof needed:** Two scenario-level team cases.

**Engineering team story:**
- Before state: how project tracking worked before (Slack + stale board, or no board), what the pain looked like in practice
- After state: what the board looks like now, what changed about how the team works
- Specific outcome: a standup that revealed less than it used to, a blocker surfaced before a missed deadline, a PM hire deferred
- Real team name or description if available

**PM story:**
- Before state: volume and type of manual update work the PM was doing
- After state: what that work looks like now, whether the AI-maintained board was reliable enough for stakeholder reporting
- Specific outcome: time recovered, a report delivered without a manual cleanup pass
- Real name if available

**Current gap:** No real team stories for this run. Section will be written as placeholder structure with format specified. Do not invent team names, company names, or outcome numbers.
**Risk:** Same as every run — unambiguous placeholder marking required.

---

### Section 6 — CTA
**Proof needed:** None beyond what prior sections have established.
**Risk:** If sections 1–5 have not built the argument, the CTA is inert.

---

## Weak spots

**Weak spot 1: Section 3 mechanism description**
Highest risk on this page. "The AI reads your conversations and maintains your board" is the vague version that every AI PM tool could claim. The section works only with enough specificity that a skeptical engineer can evaluate whether the behavior is real. Four specific behaviors with enough detail to be testable is the target. If product specifics are not available before publication, cut two of the four to the two most certain and hold the others for a v2.

**Weak spot 2: Section 4 correction model**
If the correction mechanism is not confirmed, the risk is a section that sounds reassuring but does not actually answer the accuracy question. "The AI learns from corrections" is the vague version. "When the AI creates a task you did not intend, you dismiss it in one click and the AI adjusts its understanding of your team's patterns" is specific. The draft should aim for the specific version and flag clearly where confirmation is needed.

**Weak spot 3: Section 2 bolt-on distinction**
Medium risk of reading as competitor criticism rather than structural analysis. The section works if it describes how existing AI PM tools are structured (human initiates each update → tool still drifts) rather than naming brands and saying they are insufficient. Structural critique produces recognition; brand criticism produces defensiveness.

**Weak spot 4: Proof placeholders**
Unambiguous marking required throughout Section 5.
