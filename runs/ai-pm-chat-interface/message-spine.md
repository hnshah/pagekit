# Message Spine — AI-First Project Management Tool (Chat Interface)

## Core truths

**Truth 1: The reason PM tools get abandoned is not that teams stop caring about projects — it is that keeping the tool accurate is a job no one is paid to do.**
Teams do not fail to use Jira or Linear because they are disorganized. They fail because every update to the PM tool requires someone to stop doing work, switch context, open a second tool, and record what just happened in the first tool. That cost is invisible at first and impossible to sustain over time. The board drifts. People stop trusting it. They go back to asking in Slack. The tool becomes decorative.

**Truth 2: Work has always happened in conversation. The PM tool has always been a second system that recorded it after the fact.**
The decision was made in a Slack thread at 2pm. The ticket was created at 5pm from memory. The context stayed in Slack. The structure landed in Jira, stripped of the reasoning that produced it. This is not a workflow problem — it is the structural consequence of having two separate systems for the same work. An AI that reads the conversation and maintains the structure from it does not add a new system; it removes one.

**Truth 3: "AI-powered" in most PM tools means the AI assists a human with the maintenance job. This product means the AI does the maintenance job.**
Summarizing threads, drafting ticket descriptions, suggesting due dates — these are useful reductions to individual effort, but they leave the fundamental model intact: a human still decides what goes into the PM tool, and the PM tool still gets stale when the human is busy. The distinction worth holding is that the AI generates and maintains project structure from conversation continuously, without requiring a human to trigger each update.

## Audience distinctions worth preserving

**Small engineering teams without a dedicated PM** are the clearest first audience. The PM work is undone or distributed badly. The pain of drift is direct and felt by the whole team. The barrier is skepticism about AI accuracy and tool adoption cost — both of which the homepage must address.

**PMs on growing teams** experience the same structural problem from a different angle: they are the person doing the manual update work, and the volume is growing faster than their capacity. For this audience, the AI accuracy question is higher stakes — they are reporting on this data. The homepage can serve both audiences without splitting; the accuracy section earns trust from both.

The audience distinction matters most for proof: a story from an engineering team (AI closed the gap between chat and board) and a story from a PM (AI freed them from update work) together serve both.

## Native language to keep

From signal:
- "the board is always wrong"
- "I just ask in Slack"
- "who's supposed to update this?"
- "the ticket has no context"
- "the context is in the thread"
- "chasing status"
- "standup tax"
- "it went stale"
- "two sources of truth"

Tensions to preserve:
- The tension between wanting project visibility and resisting the overhead of maintaining it — this is the core pain, and it should not be smoothed out
- The tension between AI capability and AI trust — acknowledging it earns more credibility than ignoring it

Language to drop:
- "AI-powered" as a headline claim — category noise at this point
- "streamline your workflow"
- "stay aligned"
- "single source of truth" — every PM tool says this
- "AI that works for you"
- "the future of project management"
- "reimagining how teams work"

## Claims to test later
- That naming the maintenance burden explicitly ("nobody updates the board") converts better than leading with the AI capability
- That the accuracy/correction section increases rather than decreases conversion for engineering teams — the hypothesis is that naming the imperfection earns more trust than hiding it
- That the Slack-like interface is a trust signal (familiar) rather than a concern (why not just use Slack), once the AI distinction is established

## What this should change downstream

**Page choices:** Homepage first. The recognition job — "this understands why our board is always wrong" — has to happen before any other page does useful work.

**Proof choices:** Mechanism over testimonial. Specific AI behaviors (what it extracts, what it creates, what the correction looks like) will do more trust work than generic satisfaction quotes. When real team stories are available, they should show a before-state (board stale, status unknown) and an after-state (board current without manual work), not just positive sentiment.

**Language choices:** Lead with the maintenance burden, not the AI capability. The AI claim is the solution; the maintenance burden is the problem the visitor must recognize first. Use "the board reflects reality" as the organizing outcome — it is concrete, testable, and not in the current category vocabulary.
