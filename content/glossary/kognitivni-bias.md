+++
title = "Kognitivní bias"
weight = 60

[extra]
category = "epistemic"
description = "Systematické odchylky lidského úsudku od normativní racionality; primární útočná plocha, kterou techniky epistemické anihilace cíleně využívají."
related_terms = ["konfirmacni-bias", "epistemicka-anihilace", "metakognice", "taxonomie-ea", "kognitivni-anihilace", "decision-engine"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 680
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["kognitivní bias", "cognitive bias", "rozhodování", "manipulace", "kompendium", "decision quality"]
tags = ["glossary", "epistemic", "cognitive", "decision"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Kognitivní bias - glossary"
+++

## Definition

**Kognitivní bias** (*cognitive bias*) is a systematic, predictable deviation of human judgment from a normative standard — typically Bayesian probability, formal logic, or expected-utility decision theory. Biases are not random errors: they are reproducible patterns produced by heuristics that perform well under typical evolutionary conditions but degrade under specific structural pressures (uncertainty, time stress, motivated reasoning, adversarial framing).

Cognitive biases are central to the [Kompendium epistemické a kognitivní anihilace](@/kompendium/_index.md) because **biases are the primary attack surface** that EA techniques exploit. EA does not invent new failure modes; it engineers conditions under which existing biases produce maximum, directed damage to the subject's epistemic structure. The taxonomy at [/kompendium/03-taxonomie/](/kompendium/03-zakladni-kategorie/) explicitly maps each technique to the bias-cluster it weaponizes.

Key bias-to-technique mappings used in the kompendium:

- **Confirmation bias** → EA-1.1.1 (selective exposure), EA-1.1.3 (echo chamber engineering). See [konfirmační bias](@/glossary/konfirmacni-bias.md).
- **Authority bias** → EA-2.1.x (source delegitimization vs. designation of replacement authority).
- **Framing effects** → EA-1.3.2 (strategic reinterpretation) and EA-1.4.x (emotional modulation).
- **Anchoring** → EA-1.2.x (manipulation of reference points and priors).
- **Availability heuristic** → EA-1.1.2 (saturation tactics — flooding with vivid exemplars).
- **Sunk cost fallacy** → progression maintenance in advanced stages: subjects continue investing epistemic capital because of prior investment, not present evidence.
- **Belief perseverance** → EA-1.3.1 (immunization against falsification) — once a belief is installed, it persists past disconfirming evidence.

The kompendium's diagnostic principle is that **any single bias is correctable** by trained reflection; what makes EA distinct is the **simultaneous engagement of multiple biases** in mutually reinforcing configuration, plus suppression of [metakognice](@/glossary/metakognice.md) — the corrective layer.

## Context

Within the Prismatic Platform, cognitive bias is operationalized as **decision quality input**, not just a content-level signal:

- The {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} explicitly tracks bias-relevant decision conditions (time pressure, source diversity, prior commitment, emotional load) and incorporates them into calibration. A confidently held belief formed under high-bias conditions is automatically discounted in the confidence pipeline.
- [NABLA Infinity](@/glossary/nabla-infinity.md) maintains **per-source diversity metrics** that detect echo-chamber formation early — before a subject's confirmation bias has converted a narrow input distribution into a stable belief.
- The [Color Teams](@/glossary/color-teams.md) Blue Team simulations include scripted bias-exploitation scenarios drawn from the kompendium taxonomy, validating that platform-level checks (review queues, dissent surfacing, calibration alarms) intercept the patterns.
- The [3NL architecture](@/glossary/3nl.md) (Logic + Neural + Linguistic) is designed precisely so that bias active at one layer (e.g., Linguistic-layer framing) is checked by the others (Logic-layer formal validity, Neural-layer pattern divergence).

Bias is **not pathology**: heuristics are typically efficient and only fail under adversarial conditions or unusual base-rates. The platform standard is therefore **bias-aware decision-making** — recognition rather than elimination — combined with structural defenses (diverse inputs, calibration loops, explicit pre-mortems) that compensate where individual reflection is unreliable. Czech-language treatment of cognitive bias in the EA context is at [/kompendium/04-mechanismy/biasy/](/kompendium/03-zakladni-kategorie/biasy/).

## See Also

- [Konfirmační bias](@/glossary/konfirmacni-bias.md) — Most heavily exploited specific bias
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Threat model that weaponizes biases
- [Metakognice](@/glossary/metakognice.md) — Primary corrective; explicitly targeted by advanced EA
- [Taxonomie EA](@/glossary/taxonomie-ea.md) — Bias-to-technique mapping
- [Kognitivní anihilace](@/glossary/kognitivni-anihilace.md) — Cognitive correlate
- [Kognitivní anti-rekurzivita](@/glossary/kognitivni-anti-rekurzivita.md) — Bias hardening as advanced phenomenon
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
