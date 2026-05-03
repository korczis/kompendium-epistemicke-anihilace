+++
title = "Replication Crisis"
weight = 60

[extra]
category = "epistemic"
description = "The systemic failure of published research findings to replicate, documented by the Open Science Collaboration (2015) and successors. Direct epistemic implication: published peer-reviewed status is not by itself a sufficient evidence-warrant."
related_terms = ["epistemicka-anihilace", "epistemic-confidence", "epistemicka-pokora", "kompendium-ea", "epistemic-pipeline", "nabla-infinity"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 550
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["replication crisis", "Open Science Collaboration", "p-hacking", "publication bias", "evidence calibration"]
tags = ["glossary", "epistemic", "philosophy", "methodology"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Replication Crisis - glossary"
+++

## Definition

The **replication crisis** is the empirically-documented systemic failure of published research findings — across psychology, biomedicine, economics, and other fields — to replicate when reproduced under the same protocols. The defining empirical milestone was the Open Science Collaboration's 2015 *"Estimating the reproducibility of psychological science"* (Science, 349:6251), which attempted to replicate 100 studies from three top psychology journals and found that only 36–47% reproduced the original effect, with average effect sizes roughly half the originals.

The crisis is not confined to psychology. Subsequent work has documented similar or worse failures in cancer biology (Begley & Ellis 2012: ~11% of landmark preclinical results reproducible at Amgen), economics (Camerer et al. 2016: 60–70% in top journals), and other fields. Meta-research suggests structural drivers including: **publication bias** (positive results published, negative results filed away), **p-hacking** (analytic flexibility exploited until p < 0.05), **HARKing** (hypothesizing after results known), low statistical power, and the absence of pre-registration.

The epistemic implication for cognition outside the academy is decisive but counter-intuitive: **published peer-reviewed status is not by itself a sufficient evidence-warrant** for accepting a claim. This does not entail nihilism — published peer-review remains a *better* warrant than no review. It does entail that calibration must be adjusted: a single positive published study should not produce a confidence update of the magnitude that a naïve reader would infer.

The crisis has produced a methodological reform agenda: pre-registration, registered reports, multi-lab replication consortia, open data, transparent analysis pipelines, and explicit effect-size reporting with confidence intervals rather than dichotomous significance.

## Context

Within the Prismatic Platform, the replication-crisis literature directly informs the {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} calibration model. Confidence updates from published research are scaled by the **replication-class prior** for the source field: a single study from a low-replication field (e.g., social-priming psychology) produces a smaller confidence update than a single study from a high-replication field (e.g., randomized controlled drug trials with multi-center confirmation), even if both are published in equally prestigious venues. This implementation is documented in [Kompendium → 05-detekce → epistemicka-kalibrace](/kompendium/05-detekce/epistemicka-kalibrace/).

For [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) work, the crisis matters because **published research is itself a vector**: low-replication-rate findings can be cited as decisive evidence in EA techniques, exploiting the asymmetry between the social authority of "published peer-reviewed" and the actual evidential reliability. Recovery work in [/kompendium/06-zotaveni/](/kompendium/recovery-protocols/) explicitly addresses subjects whose epistemic damage was mediated through citations of low-replicability research.

The platform's [NABLA Infinity](@/glossary/nabla-infinity.md) pipeline supports source-grade tagging in which "published peer-reviewed" is decomposed into field-specific replication priors, pre-registration status, sample size, and replication-history of the specific result. This produces calibration that is faithful to the actual evidential structure rather than to the social signal.

## See Also

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Threat framework
- [Epistemic Confidence](@/glossary/epistemic-confidence.md) — Calibration framework
- [Epistemická pokora](@/glossary/epistemicka-pokora.md) — Legitimate humility about replication failures
- [Kompendium EA](@/glossary/kompendium-ea.md) — Full taxonomic reference
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) — Platform-level epistemic architecture
- [NABLA Infinity](@/glossary/nabla-infinity.md) — Source-grade calibration engine
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
