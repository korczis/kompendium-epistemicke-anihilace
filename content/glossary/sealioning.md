+++
title = "Sealioning"
weight = 60

description = "Bad-faith inquiry technique: persistent, ostensibly polite demands for evidence and explanation deployed as harassment. Operationally couples with EA-1.1.2 (information starvation) and EA-1.3.3 (thematic diversion)."

[taxonomies]
tags = ["glossary", "epistemic", "kompendium", "rhetoric"]

[extra]
category = "epistemic"
related_terms = ["epistemicka-anihilace", "kompendium-ea", "taxonomie-ea", "motte-and-bailey", "epistemicka-pokora", "kognitivni-anihilace"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 540
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["sealioning", "bad-faith inquiry", "JAQing off", "harassment", "EA-1.1.2", "EA-1.3.3"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Sealioning - glossary"
+++

## Definition

**Sealioning** is a bad-faith rhetorical-epistemic technique in which the actor adopts the surface posture of polite, reasonable inquiry — repeatedly asking for evidence, definitions, citations, and explanations — while the *function* of the inquiry is harassment, exhaustion, and conversational denial-of-service. The term originates from a 2014 webcomic by David Malki (*Wondermark* #1062, "The Terrible Sea Lion"), in which a sea lion follows a couple home demanding to know why they don't want sea lions in their lives, framing every protest as an unanswered question.

Three structural features distinguish sealioning from legitimate inquiry: (1) **asymmetric cost** — each question is cheap to ask, expensive to answer, and the asker bears no obligation to integrate prior answers; (2) **infinite regress** — every answer is met with a deeper question; bedrock is never reached because the goal is not to reach bedrock; (3) **politeness as armor** — the surface civility is itself part of the technique, since any frustrated response from the target can be cited as evidence of the target's hostility ("I'm just asking questions, why are you so upset?").

Diagnostically, sealioning is identifiable by **process features rather than content features**: the pattern of asks, the asker's relationship to provided evidence, the asymmetry between time-cost on the asker's side and on the target's side. A useful test: does the asker integrate prior answers into subsequent questions, or does each question pretend prior answers were never given? Genuine inquiry exhibits the former; sealioning the latter.

The technique is closely related to *JAQing off* ("Just Asking Questions") — a deliberately-loose form designed to insinuate without committing. The two share the structural exploitation of the social cost of refusing to engage with apparently-reasonable inquiry.

## Context

Within the Prismatic Platform's threat model, sealioning is catalogued as a **delivery mechanism** that operationally couples with two specific [Kompendium](@/kompendium/_index.md) techniques: **EA-1.1.2** (information starvation — sealioning consumes the target's epistemic resources, leaving none for legitimate inquiry) and **EA-1.3.3** (thematic diversion — sealioning shifts attention from substantive claims to defending the meta-question of one's right to refuse to answer). Documentation: [Kompendium → 04-techniky → sealioning](@/kompendium/05-ultramari-techniky/sealioning.md).

The platform's {{ <cross_link path="/hub/dd/decisions/" text="Decision Engine" /> }} detects sealioning patterns via **process metrics** computed over conversational logs: ratio of new questions to integrated answers, consistency of the asker's stated framework over time, and the presence/absence of evidence-acknowledgment across multi-turn engagements. These metrics feed a `BAD_FAITH_INQUIRY` confidence flag that downgrades the weight assigned to the asker's claims in downstream processing.

The technique pairs operationally with [Motte and Bailey](@/glossary/motte-and-bailey.md) (sealioning the motte to exhaust challenges to the bailey) and with weaponized [Epistemická pokora](@/glossary/epistemicka-pokora.md) ("I'm just trying to understand…"). Recovery doctrine documented at [/kompendium/06-zotaveni/sealioning/](@/kompendium/recovery-protocols/sealioning.md) emphasizes the legitimacy of disengagement: a target is not epistemically obligated to entertain bad-faith inquiry indefinitely.

## See Also

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Parent threat framework
- [Kompendium EA](@/glossary/kompendium-ea.md) — Full taxonomic reference
- [Taxonomie EA](@/glossary/taxonomie-ea.md) — `EA-X.Y.Z-α` classification
- [Motte and Bailey](@/glossary/motte-and-bailey.md) — Companion rhetorical technique
- [Epistemická pokora](@/glossary/epistemicka-pokora.md) — Weaponized humility couples with sealioning
- [Kognitivní anihilace](@/glossary/kognitivni-anihilace.md) — Cognitive-process damage from exhaustion
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [Meet the Creator](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
