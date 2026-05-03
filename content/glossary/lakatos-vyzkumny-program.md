+++
title = "Lakatosův výzkumný program"
weight = 60

[extra]
category = "epistemic"
description = "Lakatosova metodologie vědeckých výzkumných programů — rozlišení mezi progresivními a degenerativními posuny pomocné hypotézy; přesný nástroj k odlišení legitimní revize teorie od EA-1.3.1 imunizace."
related_terms = ["falsifikace", "epistemicka-anihilace", "taxonomie-ea", "konfirmacni-bias", "hermeneutika", "kompendium-ea"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 680
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["Lakatos", "výzkumný program", "research programme", "progresivní posun", "degenerativní posun", "kompendium"]
tags = ["glossary", "epistemic", "philosophy", "science"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Lakatosův výzkumný program - glossary"
+++

## Definition

**Lakatosův výzkumný program** (*Lakatosian research programme*, MSRP) is the methodology of science developed by Imre Lakatos in *The Methodology of Scientific Research Programmes* (1978) as a refinement of [Popperian falsifikace](@/glossary/falsifikace.md). Lakatos accepted the Quine-Duhem point that single hypotheses are not tested in isolation, but rejected the relativist conclusion. Instead he reconstructed scientific practice as the development of **research programmes** with three structural elements:

1. **Hard core** — a small set of fundamental claims treated as not directly subject to refutation; the identity of the programme.
2. **Protective belt** — auxiliary hypotheses that absorb empirical conflict and can be revised without abandoning the programme.
3. **Heuristic** — positive (paths of theory development) and negative (which moves are forbidden) rules that constrain belt revision.

The decisive innovation is the **progressive vs. degenerative distinction**:

- A **progressive problem-shift** introduces auxiliary hypotheses that *predict novel facts* not previously known — empirical content *increases* with the rescue.
- A **degenerative problem-shift** introduces auxiliary hypotheses solely to neutralize counter-evidence, with no novel predictions — empirical content *decreases* (or stays constant) with the rescue.

The same protective move ("we add the assumption that X") can be either, depending on whether it is content-increasing or content-decreasing. Lakatos's criterion is therefore **diachronic** (judged over time, by track record) rather than synchronic (judged at the moment).

Within the [Kompendium epistemické a kognitivní anihilace](@/kompendium/_index.md), MSRP is the **canonical tool for distinguishing legitimate epistemic conservation from EA-1.3.1 immunization**. EA-1.3.1 patterns are exactly degenerative shifts: every counter-evidence triggers a content-empty belt-revision that preserves the hard core but generates no new predictions. Legitimate science also revises auxiliaries — but the revisions are progressive: they specify *new* observable consequences that were not implied before.

## Context

Within the Prismatic Platform, Lakatos's distinction is operationalized as a **content-delta metric** on belief revisions:

- The {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} tracks every revision to a belief's auxiliary structure and computes the **content delta** — does the revision generate new testable predictions, or only neutralize the prior counter-evidence? Revisions with negative or zero content-delta are flagged as candidate degenerative shifts and weight the belief's calibration score downward.
- [NABLA Infinity](@/glossary/nabla-infinity.md) maintains **per-belief auxiliary-hypothesis ledgers** with timestamps and prediction registrations, so the progressive/degenerative judgment can be made post-hoc against the actual record rather than against narrative reconstruction.
- The [Color Teams](@/glossary/color-teams.md) Red Team explicitly seeds platform reasoning with degenerative-shift patterns to verify that the content-delta gating intercepts them before they harden into [kognitivní anti-rekurzivita](@/glossary/kognitivni-anti-rekurzivita.md).
- The complement is the **honest hard-core declaration**: the platform requires explicit identification of which beliefs are core (not subject to single-evidence revision) versus belt (revisable). Concealed hard cores — beliefs that *behave* as hard core while being *presented* as evidence-driven — are a documented EA pattern.

The MSRP framework also clarifies why naïve falsificationism fails as a defense: any practitioner can rescue a theory by belt-revision, and the question is not *whether* a rescue is permitted but *what kind* of rescue. The Decision Engine therefore does not flag rescue per se — it flags rescues whose track record is degenerative. Czech-language treatment: [/kompendium/04-mechanismy/lakatos/](/kompendium/03-zakladni-kategorie/lakatos/).

## See Also

- [Falsifikace](@/glossary/falsifikace.md) — Predecessor framework refined by Lakatos
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Threat model whose EA-1.3.1 is precisely degenerative shift
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) — Underlying vulnerability
- [Taxonomie EA](@/glossary/taxonomie-ea.md) — Maps degenerative patterns to specific codes
- [Hermeneutika](@/glossary/hermeneutika.md) — Distinct legitimate framework for non-empirical revision
- [Kognitivní anti-rekurzivita](@/glossary/kognitivni-anti-rekurzivita.md) — Hardened endpoint of degenerative pattern
- [Kompendium EA](@/glossary/kompendium-ea.md) — Full taxonomy
- [Kompendium](@/kompendium/_index.md) — Czech-language reference

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
