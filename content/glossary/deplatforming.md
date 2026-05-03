+++
title = "Deplatforming"
weight = 60

[extra]
category = "security"
description = "Removal of an actor's access to digital infrastructure (social platforms, payment processors, hosting, DNS) as a platform-level epistemic intervention; trade-offs between harm reduction and epistemic-monoculture risk."
related_terms = ["epistemic-security", "info-ops", "firehose-of-falsehood", "delegitimizace", "epistemicka-anihilace", "hyperreality"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 560
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["deplatforming", "content moderation", "platform governance", "epistemic intervention", "no-platform", "infrastructure denial"]
tags = ["glossary", "security", "epistemic", "kompendium"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Deplatforming - glossary"
+++

## Definition

**Deplatforming** is the targeted removal of an actor's access to digital infrastructure — social-media accounts, payment processors, hosting providers, DNS registrars, app-store distribution, advertising networks — typically in response to violations of policy, law, or platform norms. The term entered mainstream usage around 2018 with the coordinated removal of Alex Jones from major platforms, but the practice spans no-platforming of academic speakers (Marcuse-era debates), de-banking of disfavored organizations, and infrastructure-layer denial (Cloudflare's removal of 8chan, AWS removal of Parler).

Deplatforming operates at multiple **stack layers**, each with different reversibility, scale, and bypass dynamics:

- **Application layer** (account suspension): low cost, easily evaded by account creation
- **Aggregation layer** (de-indexing, demonetization): reduces reach, harder to evade
- **Distribution layer** (app-store removal): cuts off install pathways
- **Infrastructure layer** (hosting, DNS, payment): existential, hardest to recover from

Empirically, well-targeted deplatforming reduces audience reach (Chandrasekharan et al. 2017 on Reddit, Jhaver et al. 2021 on Twitter), but the displaced actors typically retain their core followers and migrate to alternative platforms with weaker moderation, where messaging often radicalizes further (selection effect plus reduced norm-friction).

The practice raises **structural epistemic-security questions**: deplatforming reduces specific harms but concentrates editorial authority in private oligopolies whose decisions are not subject to democratic process, judicial review, or transparent criteria. Critics from both ends of the political spectrum identify the **monoculture risk** — that platform-level interventions, however well-intentioned, can degrade the epistemic ecosystem they are meant to protect.

## Context

Within the Prismatic Platform, deplatforming is treated as an **intervention** with measurable epistemic cost-benefit, not a normative absolute:

- The Kompendium discusses deplatforming under [/kompendium/07-teoreticke-reflexe/](@/kompendium/07-teoreticke-reflexe/_index.md) as a **defensive technique against EA actors operating at scale** — particularly EA-1.2 (falsification) and EA-3 (collective cognitive disruption) — while flagging the epistemic-monoculture risk it introduces.
- [Color Teams](@/glossary/color-teams.md) Blue Team protocols evaluate deplatforming proposals against five criteria: (1) harm specificity, (2) intervention reversibility, (3) precedent generality, (4) due-process adequacy, (5) post-intervention monitoring.
- The {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} treats actors recently subject to deplatforming as **provenance-ambiguous**: their post-deplatforming output may be either genuinely problematic or selection-biased by migration to lower-moderation environments.
- [NABLA Infinity](@/glossary/nabla-infinity.md) explicitly avoids deplatformed-source-only diets in its source-diversity checks — a model trained or reasoning over only "approved" sources fails the diversity invariant.
- The [Info-Ops](@/glossary/info-ops.md) and [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) entries describe the threat models against which deplatforming is sometimes justified.

Deplatforming is best understood as a **trade-off** rather than a victory: it is one tool among many in epistemic security, and its costs (centralization, due-process erosion, monoculture) must be weighed against its benefits (harm reduction, norm enforcement) on a case-by-case basis.

## See Also

- [Epistemic Security](@/glossary/epistemic-security.md) — Broader field framing
- [Info-Ops](@/glossary/info-ops.md) — Threat model often justifying deplatforming
- [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) — Adversarial pattern targeted by deplatforming
- [Delegitimizace](@/glossary/delegitimizace.md) — Adjacent concept of source-discrediting
- [Hyperreality](@/glossary/hyperreality.md) — Platform-mediated reality construction
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Central kompendium concept
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
