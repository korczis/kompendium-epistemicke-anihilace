+++
title = "Theory of Mind"
weight = 60

description = "The capacity to attribute mental states — beliefs, desires, intentions — to self and others. Indispensable for cooperation; structurally exploitable by manipulators with high-fidelity reverse-mindreading capacity."

[taxonomies]
tags = ["glossary", "epistemic", "kompendium", "cognition"]

[extra]
category = "epistemic"
related_terms = ["epistemicka-anihilace", "kognitivni-anihilace", "metakognice", "intentionalita", "embodied-cognition", "kompendium-ea"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 550
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["theory of mind", "ToM", "mindreading", "Premack Woodruff", "false-belief task", "manipulation"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Theory of Mind - glossary"
+++

## Definition

**Theory of Mind (ToM)** — the term introduced by David Premack and Guy Woodruff in *"Does the chimpanzee have a theory of mind?"* (Behavioral and Brain Sciences, 1978) — is the cognitive capacity to attribute mental states (beliefs, desires, intentions, knowledge, perceptions) to self and to others, and to use those attributions to predict and explain behavior. ToM is the cognitive precondition for almost every form of meaningful social cooperation: teaching, lying, promising, deceiving, sympathizing, negotiating, planning jointly.

Developmental milestones — **the false-belief task** in particular (Wimmer & Perner 1983; Baron-Cohen et al. 1985) — establish that ToM emerges between roughly 3 and 5 years of age in typical development and is the differential signature of certain neurodivergent profiles. The capacity has at least three structural layers: (1) **first-order ToM** — attributing mental states to others; (2) **second-order ToM** — attributing to others their attributions of mental states (X believes that Y wants Z); (3) **higher-order recursive** — used in strategic reasoning, deception, and counter-deception.

ToM is **dual-use** in a way that is constitutive of its function. The same capacity that enables empathy and cooperation enables prediction, manipulation, and deception. Effective manipulators are not deficient in ToM — they typically have *unusually high-fidelity* ToM, with the moral-affective constraints decoupled. This is the structural insight behind contemporary work on dark-triad personality profiles (Paulhus & Williams 2002 and subsequent literature) and on what Robert Hare and others have characterized as the *predatory* use of social cognition.

For epistemic security, the consequence is uncomfortable. The target's ToM — their willingness to extend the principle of charity, to assume their interlocutor is approximately like themselves — is itself the surface that high-ToM manipulators exploit. The defense cannot be "less ToM"; it must be **ToM with explicit base-rate priors** about manipulator distribution.

## Context

Within the Prismatic Platform's threat model, ToM exploitation is not a single EA technique but a **substrate condition** that several EA techniques presuppose. Documentation: [Kompendium → 03-mechanismy → tom-exploitation](@/kompendium/03-zakladni-kategorie/tom-exploitation.md). The pattern is recurrent: technique X relies on the target attributing to the manipulator a particular mental state (sincerity, confusion, vulnerability, expertise) that the manipulator does not in fact occupy.

The platform's {{ <cross_link path="/hub/dd/decisions/" text="Decision Engine" /> }} carries an explicit **base-rate manipulator prior** for high-stakes contexts (M&A due diligence, hiring, intelligence operations). The prior is calibrated against industry-specific manipulation rates and is used to discount default ToM-attributions in those contexts. This is documented in [Kompendium → 05-detekce → tom-kalibrace](@/kompendium/detection-signatures/tom-kalibrace.md) and surfaces operationally in the {{ <cross_link path="/hub/dd/decisions/calibration" text="Calibration LiveView" /> }} as a context-dependent confidence prior.

Recovery work at [/kompendium/06-zotaveni/duvera/](@/kompendium/recovery-protocols/duvera.md) explicitly addresses subjects whose recovery is complicated by the post-manipulation collapse of generalized ToM trust — the temptation to attribute manipulator-like motives to all interlocutors. The doctrine: **restore domain-indexed ToM**, not undifferentiated trust or undifferentiated paranoia.

## See Also

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Parent threat framework
- [Kognitivní anihilace](@/glossary/kognitivni-anihilace.md) — Cognitive-process damage
- [Metakognice](@/glossary/metakognice.md) — Reflective monitoring of own ToM-attributions
- [Intencionalita](@/glossary/intentionalita.md) — Aboutness-structure presupposed by ToM
- [Embodied Cognition](@/glossary/embodied-cognition.md) — Enactivist grounding of ToM
- [Kompendium EA](@/glossary/kompendium-ea.md) — Full taxonomic reference
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architecture](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [Meet the Creator](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
