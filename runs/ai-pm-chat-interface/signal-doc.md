# Signal Doc — AI-First Project Management Tool (Chat Interface)

## Product
An AI-first project management tool where all work happens in a Slack-like chat interface. The AI maintains project structure — tasks, status, blockers, ownership — by extracting it from conversation, so the team does not have to update a separate system.

## Source basis
No primary interviews or transcripts. Signal drawn from:
- Hacker News threads on PM tool adoption and abandonment patterns, AI tooling, and async work
- Reddit communities (r/projectmanagement, r/devops, r/startups, r/ExperiencedDevs)
- Twitter/X product and engineering team conversations about Linear, Jira, Asana, Notion, and AI in PM workflows
- Product review threads and community comparisons of current PM tools
- Publicly observable gap between how teams describe their actual daily workflow and what their PM tool reflects

Limitation: pattern-level signal. Claims stay within what is repeatedly observed in public discussion.

---

## Raw signal — repeated patterns

### Pains

**The maintenance gap:**
- PM tools are only as useful as the last time someone updated them — and nobody updates them consistently
- The team keeps working in Slack while the Jira board reflects the state from two sprints ago
- One person (usually the PM, or by default the tech lead) carries the burden of keeping the tool current, which is itself a part-time job
- When that person is absent or the team scales, the board goes stale and people stop trusting it
- "I check the board, it's wrong, I ask in Slack. Why have the board?"

**The context-split problem:**
- Decisions happen in Slack threads; tasks get created in Jira from memory, later, incompletely
- The Slack thread has the context; the Jira ticket has the title and assignee; nobody has both
- Engineers close a ticket and move on; the PM updates it in the board; two people touching the same state
- Standups exist in part because the PM tool cannot be trusted to reflect current reality

**AI bolt-on fatigue:**
- Notion AI, Jira's AI features, ClickUp AI all add a layer on top of an existing structure that the team still has to maintain
- "Write this ticket for me" is useful; "maintain the board while we work" is what teams actually want
- Asking an AI to summarize a thread that should have been a ticket is solving the wrong problem

**Tool-switching overhead:**
- Link from Slack to Linear, switch context, update ticket, switch back — the friction compounds
- On mobile or async, the second-tool step breaks entirely
- New team members are productive in Slack immediately; they need onboarding to use the PM tool

### Desires
- The PM tool reflecting reality without someone having to update it
- Tasks created from conversations as they happen, not reconstructed afterward
- Status visible without asking someone in Slack
- Blockers surfaced before the standup reveals them
- One place where both the context (what was said) and the structure (what needs doing) live together

### Objections
- "AI will miss things or create tasks for things that weren't meant as tasks"
- "We've tried three PM tools in the last year; why is this different?"
- "This is just Slack with AI — why not use Slack and build better habits?"
- "What happens to our existing Jira/Linear data?"
- "Our engineers will resist another new tool"

### Trust barriers
- **AI accuracy:** will the AI create noise by extracting tasks from discussions that were not task-oriented? What is the correction model?
- **Tool fatigue:** teams have tried many PM tools; the new-tool adoption curve is short without a strong forcing function
- **Interface familiarity vs. differentiation:** a Slack-like interface is familiar, but raises "why not just use Slack?" before the AI distinction is established
- **Data portability:** what happens to prior project history if this doesn't work out?
- **Reliability at scale:** does this work the same way for a 5-person team and a 50-person team?

### Buying triggers
- A postmortem that reveals a blocker sat unaddressed for a week because it was in a Slack thread nobody flagged
- A new PM hire who inherits a Jira board nobody has touched in a month
- A failed sprint review where the board did not match what was actually built
- A team that tried Linear or Notion and went back to spreadsheets because the update burden was too high
- A founder who is personally carrying the PM work and needs something that does not require a dedicated person to maintain

---

## Audience distinctions

### Small engineering teams (3–15 engineers), no dedicated PM
- The PM work is distributed across whoever has time; usually no one does it well
- Primary pain: project state is unknown unless someone asks in Slack
- Trust barrier: AI accuracy and tool adoption — they are skeptical and have short tolerance for new tools that create friction
- Proof threshold: show that the AI reduces work rather than adding it; a before/after of what the board looks like without maintenance vs. with AI maintenance

### Product teams with a PM who is drowning in update work
- The PM exists but spends too much time chasing status and updating tickets
- Primary pain: the PM is a bottleneck on information; the tool serves the PM's visibility needs but not the team's workflow
- Trust barrier: whether the AI is accurate enough to trust for stakeholder reporting
- Proof threshold: a case where AI-maintained status was reliable enough for a weekly review without manual cleanup

### Startups scaling from 5 to 25 people
- PM chaos arrives around 8–12 people when one person can no longer hold all the project context
- Primary pain: the moment when informal coordination breaks and nobody has put a real system in place yet
- Trust barrier: whether this is worth adopting before the chaos arrives or only after
- Proof threshold: a team that adopted it before the coordination breakdown and avoided it

---

## Candidate truths

1. **The PM tool maintenance burden is the reason PM tools fail, not the PM tools themselves.** Teams do not abandon Linear or Asana because they are bad tools. They abandon them because keeping them accurate takes time nobody has. Any tool that requires manual maintenance will eventually reflect the past rather than the present.

2. **Work has always happened in conversation. The PM tool has always been a second system that recorded it after the fact.** This is the structural problem. The information is in Slack. Someone extracts it into a ticket. The ticket loses the context. The conversation is the source; the ticket is a degraded copy. An AI that reads the conversation and maintains the structure from it collapses two systems into one.

3. **"AI-powered" in most PM tools means assistance, not ownership.** Writing a ticket, summarizing a thread, suggesting a due date — these reduce individual effort but do not change the fundamental model: a human still decides what goes into the PM tool, and the PM tool still gets stale. The claim worth making is that the AI maintains the structure without requiring a human to decide what to put in it.

4. **The AI accuracy question cannot be ignored.** Every team evaluating this product will ask what happens when the AI gets something wrong. A page that does not answer this question will lose the engineering team that is most likely to adopt early. The answer needs to be a correction model, not a claim of perfection.

---

## Open questions
- What specifically does the AI extract from conversation? Named tasks, owners, due dates, blockers, status changes — or a subset?
- What is the correction model when the AI is wrong? One-click correction, inline editing, a dedicated review flow?
- Does the product integrate with existing Jira/Linear boards, or replace them entirely?
- What is the interface specifically — threaded channels, DMs, project rooms? How close to Slack is the surface?
- What is the onboarding path for a team currently using another PM tool?
- Is there a free tier or trial?
