# Claim Checking Framework

Claim checking is the durability layer.
It runs after the first page draft exists.

## What it is for

Finding claims that:
- overclaim what the product actually does
- sound specific but are actually vague
- are not supported by the proof map
- outrun the mechanism the product can honestly explain
- narrate brand restraint instead of showing the work
- carry unsourced quantitative modifiers

## What it is not for

- polishing language
- defending existing claims
- adding new marketing intensity

## Claim types to flag

- **overclaim** — the claim is stronger than the product reality
- **vague claim** — the claim sounds concrete but resists being checked
- **unsupported claim** — the claim is plausible but proof is missing
- **outrun claim** — the claim needs proof the proof map did not commit to
- **editorial voice** — the brand narrates its own restraint, virtue or honesty instead of demonstrating it. A show-the-work page earns trust by showing the work, not by announcing that it is showing the work.
- **unsourced quantitative modifier** — "most," "usually," "typically," "often," "many" without a source to anchor the quantity. At hard severity, any unsourced quantity is a flag.
- **clinical or regulatory drift** — phrasing that reads as clinical, nutritional, legal or regulatory advice when the briefs do not support it. Common on health, finance and compliance-adjacent objects.

## Severity calibration

Pick the severity level deliberately and log the choice.

- **light** — flag only clear overclaims and unsupported claims. Use when copy has already been through several passes and you need a final safety net.
- **normal** — flag the full list above, but tolerate mild editorial voice and "most-scale" modifiers where they sit inside common usage. Use for most real-world drafts.
- **hard** — flag any unsourced modifier, any editorial voice, any clinical drift, any external-credential description beyond what the briefs support. Use for trust-heavy objects (health, regulated products, legal services) and for first real runs of a new method or template.

Record the severity used in the run log. A claim check run at one severity is not comparable to one run at another.

## Principle

A claim should get stronger when it is corrected, not weaker.
Precision usually beats intensity.
If a corrected claim feels smaller, the original was probably doing more work than it earned.

## Relationship to the rest of PageKit

- signal doc names the language worth preserving
- message spine decides which truths carry the page
- proof map commits to what the page can defend
- claim checking is how the draft is held to those commitments

When claim checking surfaces a real gap, the fix usually lives upstream in the proof map or the source briefs, not in the copy.

## Upstream absorption

If a pattern shows up in claim checking on every run (for example, editorial voice on every show-the-work page), the fix belongs in the page-argument-shape drafting constraints, not in the claim-check step. Claim checking is a safety net; it should not be the primary place a category of problems gets caught.
