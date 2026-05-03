+++
title = "Falsifikace"
weight = 60

[extra]
category = "epistemic"
description = "Popperovský princip vědecké demarkace — teorie je vědecky smysluplná, jen pokud připouští okolnosti, které by ji vyvrátily; útočná plocha pro EA-1.3.1 imunizaci proti falsifikaci."
related_terms = ["lakatos-vyzkumny-program", "epistemicka-anihilace", "taxonomie-ea", "konfirmacni-bias", "hermeneutika", "fenomenologie"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 660
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["falsifikace", "falsifiability", "Popper", "demarkace", "kompendium", "filosofie vědy"]
tags = ["glossary", "epistemic", "philosophy", "science"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Falsifikace - glossary"
+++

## Definition

**Falsifikace** (*falsifiability*, *falsifikovatelnost*) is the criterion of scientific demarcation introduced by Karl Popper in *Logik der Forschung* (1934) and developed in *The Logic of Scientific Discovery*: a theory is scientifically meaningful only if it specifies, in advance, what observations would refute it. A claim that cannot be wrong about anything is not strongly true — it is **content-empty**. Popper's asymmetry follows from elementary logic: no finite number of confirming observations can deductively establish a universal claim, but a single genuine counter-instance can refute it. Science therefore advances by **conjecture and refutation**, not by accumulation of confirmations.

Within the [Kompendium epistemické a kognitivní anihilace](@/kompendium/_index.md), falsifiability is treated as a **core structural defense** against confirmation-bias-driven manipulation, and its absence as a diagnostic marker. The kompendium technique most directly attacking this defense is **EA-1.3.1 (immunization against falsification)** — documented at [/kompendium/techniques/ea-1-3-1-immunization-against-falsification/](@/kompendium/techniques/ea-1-3-1-immunization-against-falsification.md). EA-1.3.1 installs cognitive moves that make the target's belief system unfalsifiable in practice: counter-evidence is automatically reframed as further confirmation ("they're hiding it because it's true"), absent evidence becomes confirming ("of course you can't find proof, that's how powerful they are"), and any disconfirming source is delegitimized in advance.

The diagnostic principle is **identity-preservation under counter-evidence**: a belief system that returns to identical structure regardless of input is operating non-epistemically. This is independent of whether the underlying claims are true — even true claims, when held in unfalsifiable form, indicate a corrupted epistemic process.

## Context

Within the Prismatic Platform, falsifiability is operationalized as a **mandatory decision-engine input**:

- The {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} requires every high-confidence claim to be paired with an explicit **falsification clause** — the observation or evidence that would lower confidence. A belief without a falsification clause is automatically downgraded in calibration scoring, regardless of how many supporting sources exist.
- [NABLA Infinity](@/glossary/nabla-infinity.md) tracks **prediction registration**: confidence claims must be made before outcomes are observed, not after. Post-hoc rationalization is structurally prevented because the prediction record is immutable.
- The [Color Teams](@/glossary/color-teams.md) Red Team builds scenarios designed specifically to test whether platform reasoning can be **immunized** against counter-evidence — verifying that the falsification-clause requirement is not merely cosmetic.
- The contrast with [Lakatos' research programmes](@/glossary/lakatos-vyzkumny-program.md) is operational: legitimate auxiliary-hypothesis introduction *increases* the empirical content of the program (progressive shift); EA-1.3.1 immunization *decreases* it (degenerative shift). The Decision Engine tracks this distinction by content-delta scoring.

Falsifiability has well-known limits. Quine-Duhem holism shows that no single hypothesis is tested in isolation; what is refuted is always the conjunction of hypothesis plus auxiliary assumptions. The kompendium therefore distinguishes **principled auxiliary refinement** (legitimate, content-increasing) from **ad-hoc rescue** (illegitimate, content-decreasing). Both look like "saving the theory" from the inside; only one is epistemically defensible. See [Lakatosův výzkumný program](@/glossary/lakatos-vyzkumny-program.md) for the full distinction. Czech-language treatment: [/kompendium/04-mechanismy/falsifikovatelnost/](@/kompendium/03-zakladni-kategorie/falsifikovatelnost.md).

## See Also

- [Lakatosův výzkumný program](@/glossary/lakatos-vyzkumny-program.md) — Distinguishes legitimate auxiliary moves from degenerative rescue
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) — Bias that falsifiability counters
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Parent threat model
- [Taxonomie EA](@/glossary/taxonomie-ea.md) — Specifically EA-1.3.1 immunization
- [Hermeneutika](@/glossary/hermeneutika.md) — Legitimate alternative interpretation framework
- [Fenomenologie](@/glossary/fenomenologie.md) — First-person methodological complement
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
