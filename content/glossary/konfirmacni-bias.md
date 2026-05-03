+++
title = "Konfirmační bias"
weight = 60

[extra]
category = "epistemic"
description = "Systematická tendence vyhledávat, interpretovat a pamatovat si informace způsobem, který potvrzuje již existující přesvědčení; nejintenzivněji zneužívaná zranitelnost ze všech kognitivních zkreslení."
related_terms = ["kognitivni-bias", "epistemicka-anihilace", "taxonomie-ea", "metakognice", "falsifikace", "kognitivni-anti-rekurzivita"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 640
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["konfirmační bias", "confirmation bias", "selektivní expozice", "echo chamber", "kompendium", "epistemic security"]
tags = ["glossary", "epistemic", "cognitive", "kompendium"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Konfirmační bias - glossary"
+++

## Definition

**Konfirmační bias** (*confirmation bias*) is the systematic human tendency to seek, interpret, weight, and remember information in ways that confirm already-held beliefs, and to symmetrically discount, ignore, or misremember information that disconfirms them. The bias operates across all three stages of belief processing — **acquisition** (which sources are consulted), **interpretation** (how ambiguous evidence is read), and **retention** (which findings are remembered). All three stages reinforce each other: yesterday's biased acquisition becomes today's biased prior.

Within the [Kompendium epistemické a kognitivní anihilace](@/kompendium/_index.md), confirmation bias is the **most heavily exploited single vulnerability** in the entire taxonomy. It is the structural prerequisite for the EA-1.1 family (information-environment manipulation):

- **EA-1.1.1 (Selective exposure)** — directly exploits acquisition-stage confirmation bias: the target self-administers a curated information diet because disconfirming sources feel cognitively aversive.
- **EA-1.1.2 (Saturation tactics)** — exploits availability + confirmation: vivid confirming exemplars are easily retrieved, disconfirming statistics are not.
- **EA-1.1.3 (Echo chamber engineering)** — engineers the social environment so that even casual cross-checking returns confirming results, removing the natural correction that diverse social networks normally provide.
- **EA-1.3.1 (Immunization against falsification)** — installs cognitive moves ("they would say that, wouldn't they") that route disconfirming evidence as further confirmation.

The kompendium's diagnostic principle: confirmation bias is **universal** and **incurable at the individual level**. Defense requires structural rather than psychological measures — pre-committed exposure to disconfirmation, calibration scoring, and external review.

## Context

Within the Prismatic Platform, confirmation bias is treated as a **first-class structural problem**, not a personal weakness:

- The {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} explicitly tracks **source diversity** in its information graph: a decision based on a low-diversity source set receives a confidence penalty regardless of internal coherence. High coherence + low diversity is a confirmation-bias signature, not a strength.
- The platform's {{ cross_link(path="/hub/dd/decisions/calibration", text="calibration loop") }} compares predicted vs. realized outcomes specifically to detect the systematic over-confidence that confirmation bias produces. A subject whose confirming predictions outperform their disconfirming predictions is showing signature bias even without content-level analysis.
- [NABLA Infinity](@/glossary/nabla-infinity.md) implements **mandatory disconfirmation queries**: any high-confidence belief must be paired with an explicit list of sources that would disconfirm it; absence of such sources is itself an alarm.
- The [Color Teams](@/glossary/color-teams.md) Red Team builds adversarial information environments to validate that platform-level diversity checks survive deliberate gaming. Czech-language treatment of confirmation bias in EA context: [/kompendium/04-mechanismy/biasy/konfirmacni/](/kompendium/03-zakladni-kategorie/biasy/konfirmacni/).

The principled defense, drawn from [falsifikace](@/glossary/falsifikace.md) (Popper) and [Lakatosian research programmes](@/glossary/lakatos-vyzkumny-program.md), is to **prefer falsification attempts over confirmation searches**. A finding that a belief survives a serious attempt to refute it is epistemically heavier than ten confirming examples. The platform UX exposes this asymmetry: disconfirmation entries weigh more in the Decision Engine's scoring than confirmation entries of equal source quality, mirroring the underlying probability theory (P(E|H) is weak; P(¬E|¬H) is strong when E was a genuine prediction).

## See Also

- [Kognitivní bias](@/glossary/kognitivni-bias.md) — Parent concept
- [Falsifikace](@/glossary/falsifikace.md) — Principled corrective from Popper
- [Lakatosův výzkumný program](@/glossary/lakatos-vyzkumny-program.md) — Distinguishes legitimate vs. degenerative protection of beliefs
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Threat model exploiting this bias
- [Taxonomie EA](@/glossary/taxonomie-ea.md) — Specifically the EA-1.1.x family
- [Metakognice](@/glossary/metakognice.md) — Reflective layer that catches active bias
- [Kognitivní anti-rekurzivita](@/glossary/kognitivni-anti-rekurzivita.md) — Hardened endpoint
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
