# Signal Doc — OpenClaw Web Hosting (Fresh Run)

## Product
OpenClaw is a web hosting service. The working hypothesis is that it targets developers and small teams who have outgrown shared hosting or PaaS platforms but don't want to absorb the DevOps overhead of raw cloud infrastructure.

## Source basis
No primary interviews or transcripts. Signal drawn from:
- Hacker News threads on hosting decisions, PaaS frustrations, and post-Heroku migration
- Reddit communities (r/webdev, r/selfhosted, r/devops, r/rails, r/node)
- Twitter/X developer conversations following Heroku's 2022 free tier removal
- Indie hacker and small founder community discussions about infrastructure choices
- Visible gaps and failure modes in current hosting brand copy (Render, Railway, Fly.io, DigitalOcean, Vercel, Netlify, AWS)

Limitation: pattern-level signal, not verified from direct developer interviews. Claims stay within what is repeatedly observed in public discussion.

---

## Raw signal sources — repeated patterns

### Pains

**Outgrowing platforms:**
- Heroku pricing cliff: developers who started free and hit costs of $50–$300+/month as they scaled without a corresponding product revenue increase
- Render and Railway feel like upgraded Heroku — easy to start, but pricing opacity returns at moderate scale
- Shared hosting (Bluehost, GoDaddy, SiteGround) is too slow, too limited, and too unreliable for anything beyond basic WordPress sites
- Vercel and Netlify are excellent for static/edge but wrong for persistent servers, long-running processes, or databases

**DevOps overhead:**
- Moving to AWS, GCP, or bare DigitalOcean droplets gives full control but requires understanding VPCs, security groups, load balancers, SSL config, deployment pipelines — most solo developers and small teams don't have the time
- "I spent the whole weekend on infrastructure and didn't write any product code"
- Kubernetes is overkill for most workloads but gets reached for by engineers who don't know what the simpler option is

**Lock-in anxiety:**
- Post-Heroku, developers are more aware that platforms can change pricing, shut down tiers, or disappear
- Proprietary build processes, deployment configs, and routing rules mean migration is painful
- "If I want to leave, how long will it take to move everything?"

**Pricing opacity:**
- Cloud provider bills are hard to predict — egress fees, compute costs, storage costs combine in ways that produce surprise invoices
- PaaS platforms show per-service pricing that compounds in non-obvious ways
- "I just want to know what I'm paying before I commit"

### Desires
- Deploy a new app in minutes without reading a tutorial
- Know exactly what things cost before the bill arrives
- Own the configuration — be able to read it, version it, and take it somewhere else
- Not have to think about infrastructure during a product sprint
- A support experience that reaches a real engineer when something breaks

### Objections
- "I've tried three of these and they all feel the same"
- "What happens when I need something it doesn't support?"
- "How do I know you won't do what Heroku did?"
- "I can get a VPS for $6/month — why would I pay more?"

### Trust blockers
- **Longevity:** will this service still exist in two years? Will pricing change abruptly?
- **Portability:** if I want to leave, how hard is it? Are my configs and data locked in?
- **Support quality:** when something breaks at 2am, is there a real answer available?
- **Reliability:** will this stay up? How does it handle traffic spikes?
- **Transparency:** is pricing actually predictable, or will there be surprises?

### Buying triggers
- Heroku migration: developers who were forced off Heroku free tier and are evaluating alternatives
- PaaS pricing shock: first month above expected cost on Render/Railway
- Outgrowing shared hosting: site getting real traffic and speed becoming a user experience problem
- New project greenfield: developer starting something new and choosing infrastructure deliberately for the first time
- Team scaling: solo developer brings on a co-founder or first hire and needs infrastructure that others can understand and operate

---

## Audience distinctions

### Solo indie developers / side project builders
- Primary relationship to hosting: personal, cost-sensitive, highly DIY
- Main pain: price cliffs and time spent on infrastructure instead of product
- Trust barrier: "will you still be here and will this still be affordable when my project grows?"
- Proof threshold: low for cost, higher for reliability — they can absorb some downtime but not unpredictable billing

### Small startup teams (2–10 people)
- Primary relationship to hosting: shared responsibility, may not have a dedicated DevOps person
- Main pain: infrastructure complexity creates bottlenecks; one person becomes the "person who knows the servers"
- Trust barrier: portability and support quality — they can't afford a migration project during a growth sprint
- Proof threshold: higher — they need to see that others in similar situations have used this successfully

### Freelancers hosting client sites
- Primary relationship to hosting: practical, reliability-focused, reputation-sensitive
- Main pain: client sites need to stay up; managing multiple hosting relationships is overhead
- Trust barrier: support SLA — if a client's site goes down, they need a fast resolution path
- Proof threshold: uptime track record and support responsiveness

### The distinction that matters most for copy
Solo developers and small teams share the core pain (control vs. complexity tradeoff) and can be addressed together on the homepage. Freelancers are a secondary audience whose primary concern (reliability + support) is served by the trust section but shouldn't drive the opening argument.

---

## Candidate truths

1. **"Reliability" and "speed" are table stakes — they are not a position.** Every hosting brand claims both. A homepage that leads with uptime percentages and speed benchmarks is indistinguishable from its competitors before the second paragraph. The differentiation is elsewhere.

2. **The PaaS-to-cloud jump is a real tax most small teams shouldn't have to pay.** There is a genuine gap between "easy but expensive and opaque" platforms and "powerful but complex" raw cloud. That gap is not being served well. Developers who live in it are frustrated and actively looking for a better option.

3. **Lock-in anxiety is real and post-Heroku it has intensified.** The trust question that matters most in this category right now is not "will it be fast" — it's "will it still be here, and can I leave if I need to?" A brand that answers this question directly and specifically earns trust that speed claims cannot.

4. **Predictable pricing is a form of respect.** Developers who have received a $400 cloud bill for a project they thought was costing $40 do not forget it. A brand that makes pricing legible — not just cheap, but understandable — earns loyalty that discount pricing cannot.

---

## Open questions
- What specifically does "control" mean in OpenClaw's product? What can a developer configure, version, and own that they can't on Render or Railway?
- What is the deployment model — git push, Docker, something else?
- Is there a portability guarantee, or is this a claim that needs to be backed by product specifics?
- What is the pricing model — flat, usage-based, tiered?
- Is there a free tier or trial? What does the onramp look like?
- What is the support model — ticket, chat, community?
- What runtime environments are supported?
- What is the datacenter footprint — relevant to latency promises but should not lead the homepage
