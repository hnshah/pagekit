# Working Log

## Run: ai-pm-chat-interface
## Date: 2026-04-14

---

### Step 1 — Signal Doc
**Status:** complete

Signal drawn from developer and product team community discussion: Hacker News threads on PM tool fatigue and AI tooling, Twitter/X debates on whether AI changes project management, Reddit (r/projectmanagement, r/devops, r/startups), product review threads comparing Linear/Jira/Asana/Notion, and the observable gap in how teams describe their actual workflows versus what their PM tool reflects.

Key finding: the dominant pain is not that PM tools are hard to use — it is that keeping them accurate is a separate job from doing the work. The PM tool is always one step behind the conversation where decisions were actually made. Teams do not fail to use PM tools because they are lazy; they fail because the update cost compounds daily and eventually nobody can justify it.

Secondary finding: "AI-powered PM" is a phrase teams have learned to discount. Most AI PM features are search, summarization, or chatbot assistance layered on an existing structure. The claim that is not yet common: the AI maintains the structure so the team does not have to.

---

### Step 2 — Message Spine
**Status:** complete

Three truths settled after reduction:
1. The reason PM tools get abandoned is not that teams stop caring about projects — it is that keeping the tool accurate is itself a job no one is paid to do
2. Work has always happened in chat; the PM tool has always been a second place where someone recorded what happened in chat after the fact; AI can collapse that into one
3. "AI-powered project management" in most products means a layer on top of an existing structure; this product is different because the AI generates and maintains the structure

Dropped "AI-first" as a positioning phrase — it is now category noise. Kept the conversation-as-primary-surface framing as the organizing distinction.

---

### Step 3 — First-Page Decision
**Status:** complete

Decision: homepage.

The recognition job — "this understands why we stopped updating our PM tool" — has to land before the product can be evaluated. A features page or an integrations page would reach visitors who are already sold on the concept; the homepage has to earn that.

One alternative considered: a dedicated "why chat-first" page for teams actively evaluating chat-based PM. Ruled out — too narrow for a first page. The homepage can make that argument once without routing to a separate page.

---

### Step 4 — Page Argument Shape
**Status:** complete

Argument order: the split-context problem → why AI bolt-ons do not close it → what this product is → how the AI works → what happens when AI gets something wrong → proof → CTA.

The "what happens when AI gets something wrong" section is unusual but necessary. AI accuracy is the gatekeeping trust question for this category and cannot be buried. Any page that does not address it will lose the skeptical engineering team.

Named five sections as unnecessary: feature comparison matrix, integration list in the hero, pricing in the first pass, a "for enterprise" section, uptime/security credentials in the homepage body.

Anti-slop constraints baked in at this step per updated framework.

---

### Step 5 — Proof Map
**Status:** complete

Main proof gaps: no named team testimonials, no AI accuracy data, no task-capture rate or status-sync statistics available for this run. Draft constrained accordingly — mechanism described behaviorally, AI accuracy handled via correction-model description rather than a statistic.

---

### Step 6 — Homepage Draft
**Status:** complete

Draft follows the approved argument shape. Anti-slop rules applied during drafting. Slop-check run before commit; hits addressed.

---

### Overall judgment
The wedge held. The AI-maintains-the-structure claim is the right distinction in this market and the argument for it is coherent when the split-context problem is named first. The hardest section is the AI accuracy trust question — handled honestly as a correction model rather than a perfection claim.

Biggest remaining gap: proof. No real team case studies. The draft holds the placeholder structure clearly.

Upstream recommendation: before publishing, establish what "the AI does the PM work" means in precise product terms — specifically, what it extracts from conversation, what it creates (tasks, status changes, blockers), what the error rate is, and how corrections work. That specificity is what turns the mechanism section from a claim into evidence.
