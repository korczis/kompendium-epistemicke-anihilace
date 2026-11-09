+++
title = "Info-Ops"
weight = 60

[extra]
category = "security"
description = "Information operations — military and intelligence-grade epistemic attacks integrating cyber, psychological, deception, and electronic warfare to shape perception and decision-making in adversarial environments."
related_terms = ["epistemic-security", "firehose-of-falsehood", "deepfake", "deplatforming", "epistemicka-anihilace", "delegitimizace"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 560
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["information operations", "info-ops", "psyops", "cyber operations", "military doctrine", "hybrid warfare", "PSYOP"]
tags = ["glossary", "security", "epistemic", "kompendium"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Info-Ops - glossary"
+++

## Definition

**Information Operations (Info-Ops, IO)** is a military and intelligence-community doctrinal category encompassing the integrated employment of capabilities to influence, disrupt, corrupt, or usurp adversarial decision-making while protecting one's own. US Joint Publication 3-13 defines five core IO capabilities: **psychological operations (PSYOP/MISO)**, **military deception (MILDEC)**, **operations security (OPSEC)**, **electronic warfare (EW)**, and **computer network operations (CNO/cyber)**. NATO and Russian doctrines define analogous but not identical groupings; Russian *informatsionnaya borba* (information struggle) explicitly integrates kinetic and non-kinetic, peacetime and wartime, military and civilian dimensions in ways US doctrine traditionally did not.

Info-Ops differ from civilian disinformation in three structural respects:

1. **Resource scale** — state-level information operations command intelligence budgets, persistent personnel cadres, and access to classified collection infrastructure that civilian actors lack.
2. **Integration with kinetic action** — IO is rarely standalone; it shapes the information environment to enable, conceal, or amplify physical operations.
3. **Doctrinal continuity** — operations are conducted across years and decades, with continuous learning, infrastructure investment, and persona-development that short-horizon civilian campaigns cannot match.

Contemporary IO has been extensively studied through campaigns including the Russian Internet Research Agency's 2014–2018 operations, the People's Republic of China's "discourse power" doctrine and United Front activity, Iranian influence networks, and various Western counter-IO programs. Empirically, well-resourced IO produces measurable effects on target-population belief, behavior, and trust — though specific causal magnitudes are contested due to attribution and effect-isolation difficulties.

The expansion of IO into **gray-zone** operations (below threshold of armed conflict but above peacetime competition) and **hybrid warfare** doctrines means that IO is no longer confined to declared wartime. The civilian information environment is now persistently contested by state and state-proxy actors, with downstream consequences for journalism, electoral integrity, and public-health communication.

## Context

Within the Prismatic Platform, Info-Ops represents the **adversary capability ceiling** that defensive architectures must be designed against:

- The Kompendium catalogues IO-relevant techniques across multiple chapters but treats Info-Ops itself as a **scenario class** rather than a single technique. State-level adversaries deploy combinations from the EA catalog with resources and persistence that exceed the standard threat model assumed for individual or small-group manipulation.
- The {{ <cross_link path="/hub/dd/decisions/" text="Decision Engine" /> }} implements **adversarial provenance scoring**: in environments with active IO, source diversity is necessary but not sufficient — the diverse sources must also pass cross-correlation checks for coordinated inauthentic behavior signatures.
- [NABLA Infinity](@/glossary/nabla-infinity.md) source-provenance auditing is designed in part to defend against IO operations that exploit credentialed channels (compromised journalists, captured think-tanks, infiltrated NGOs).
- [Color Teams](@/glossary/color-teams.md) Red Team scenarios at the highest tier model state-actor IO campaigns as the ceiling threat — if defenses hold against this, they hold against lesser threats.
- The [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) entry describes one specific IO doctrinal approach.
- [Deepfake](@/glossary/deepfake.md) capabilities are increasingly integrated into IO toolkits.
- [Epistemic Security](@/glossary/epistemic-security.md) provides the field-level frame within which IO is the dominant external threat.
- [Deplatforming](@/glossary/deplatforming.md) is sometimes deployed against detected IO operations but raises due-process concerns when applied by private platforms without judicial oversight.

Info-Ops is the **realistic adversary** against which serious epistemic-security architecture must be designed. Defenses adequate against amateur trolls or commercial influence operations may collapse under state-grade IO pressure.

## See Also

- [Epistemic Security](@/glossary/epistemic-security.md) — Field-level framing
- [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) — Specific IO doctrine
- [Deepfake](@/glossary/deepfake.md) — IO-integrated capability
- [Deplatforming](@/glossary/deplatforming.md) — Counter-IO intervention
- [Delegitimizace](@/glossary/delegitimizace.md) — Common IO target
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Central kompendium concept
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [Meet the Creator](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
