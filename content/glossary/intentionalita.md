+++
title = "Intencionalita"
weight = 60

[extra]
category = "epistemic"
description = "Brentanian/Husserlian intentionality — the directedness of consciousness toward an object. The 'aboutness' that distinguishes mental states from physical states. Core structural feature exploited by EA techniques."
related_terms = ["epistemicka-anihilace", "lebenswelt", "embodied-cognition", "metakognice", "kognitivni-anihilace", "epistemic-pipeline"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 550
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["intentionality", "Brentano", "Husserl", "phenomenology", "aboutness", "noesis", "noema"]
tags = ["glossary", "epistemic", "philosophy", "phenomenology"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Intencionalita - glossary"
+++

## Definition

**Intencionalita** (intentionality) — in the technical phenomenological sense, distinct from "intent" in ordinary English — is the property of mental states to be **directed at** or **about** something. Franz Brentano reintroduced the concept into modern philosophy in *Psychology from an Empirical Standpoint* (1874): every mental act is "intentionally directed" upon an object — we do not simply *believe*, we believe *something*; we do not simply *fear*, we fear *something*. Brentano took this directedness — *intentional inexistence of an object* — to be the **mark of the mental**, distinguishing mental phenomena from physical phenomena.

Edmund Husserl developed the concept into the architectural core of phenomenology. Every conscious act has a structural duality: the *noesis* (the act of consciousness — perceiving, judging, remembering) and the *noema* (the object as intended — the perceived-as-perceived, the judged-as-judged). This is not a representational theory: the *noema* is not a "mental picture" interposed between mind and world; it is the world *as given* to consciousness in this particular act.

Three structural features matter for epistemic-security work: (1) **directedness** — every cognition has a *target*; (2) **mode** — the same target can be intended in different modes (perceived, remembered, imagined, doubted, feared); (3) **horizon** — every intentional act has a structured background of co-given but unthematized possibilities (Husserl's *Horizont*).

Intentional structure is **what makes manipulation possible**. To manipulate cognition is to act on the *target*, the *mode*, or the *horizon* of intentional acts. Most EA techniques can be analyzed as systematic attacks on one of these three.

## Context

Within the Prismatic Platform's threat model, intentional structure provides the **formal vocabulary** for classifying [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) techniques. The [Kompendium taxonomy](@/glossary/taxonomie-ea.md) is structured along intentional axes: EA-1.x targets the *target* (what the subject is thinking *about*); EA-2.x targets the *mode* (whether they're perceiving, remembering, doubting); EA-3.x targets the *horizon* (the unthematized background of taken-for-granted possibilities).

This intentional analysis is documented in [Kompendium → 03-mechanismy → intencionalita](/kompendium/03-mechanismy/intencionalita/), which walks through each major EA family in terms of which intentional component it primarily attacks. The [NABLA Infinity](@/glossary/nabla-infinity.md) pipeline uses this decomposition for defense: signals are tagged with intentional metadata (target / mode / horizon), and structural anomalies — e.g., an unusually large fraction of recent communication targeting the subject's *horizon* (planted assumptions) versus the *target* (ostensive content) — produce confidence penalties on downstream {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} outputs.

The Husserlian concept of **horizon** has particular operational weight: the most subtle EA techniques (EA-3.x family) operate by altering what the subject takes for granted *without ever foregrounding the change*. The platform's audit logs distinguish thematic content from horizon-shifting content explicitly.

## See Also

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Parent threat framework
- [Lebenswelt](@/glossary/lebenswelt.md) — Husserlian horizon as totality
- [Embodied Cognition](@/glossary/embodied-cognition.md) — Enactivist development of intentionality
- [Metakognice](@/glossary/metakognice.md) — Reflective awareness of intentional structure
- [Kognitivní anihilace](@/glossary/kognitivni-anihilace.md) — Cognitive-process damage
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) — Platform-level epistemic architecture
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
