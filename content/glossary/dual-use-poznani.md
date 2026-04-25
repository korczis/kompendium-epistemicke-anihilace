+++
title = "Dual-use poznání"
weight = 60

[extra]
category = "epistemic"
description = "Etický problém citlivého poznání — totéž porozumění technikám epistemické manipulace umožňuje obranu i útok; rámec rozhodování o publikaci, přístupu a využití kompendia."
related_terms = ["kompendium-ea", "epistemicka-anihilace", "taxonomie-ea", "delegitimizace", "metakognitivni-destrukce", "color-teams"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 660
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["dual-use", "etika", "epistemic security", "kompendium", "kontrola přístupu", "publication ethics"]
tags = ["glossary", "epistemic", "ethics", "policy"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Dual-use poznání - glossary"
+++

## Definition

**Dual-use poznání** (*dual-use knowledge*) is the structural ethical problem that arises whenever the same understanding is required for both **defense** and **offense** in a given domain. The term originates in arms-control and biosecurity literature (chemistry, microbiology, nuclear physics) and has been extended to information security and — through the [Kompendium epistemické a kognitivní anihilace](/kompendium/) — to **epistemic security**.

The dual-use problem is structurally unavoidable, not a defect of presentation: a clinician who can detect [gaslighting](/glossary/gaslighting/) understands gaslighting well enough to perform it; a researcher who can document EA-1.3.1 immunization patterns can deploy them; a Red Team operator who can simulate [delegitimizace](/glossary/delegitimizace/) campaigns at scale knows how to run them. Restricting access does not eliminate the knowledge; it only changes who has it.

The kompendium adopts and extends the **standard dual-use ethical framework** with adaptations specific to epistemic security:

1. **Asymmetry of damage** — defensive use of EA knowledge typically requires shared understanding with the protected subject (clinician + patient, security team + organization). Offensive use is unilateral. The defensive use case structurally favors transparency.
2. **Public-good knowledge floor** — basic recognition of common manipulation patterns is itself a public good. Withholding the recognition vocabulary leaves potential targets without the categories needed to detect what is happening to them. The kompendium argues that *not* publishing recognition-level material has its own ethical cost.
3. **Tiered access for technique-level material** — specific implementation details, novel attack patterns, and untested techniques warrant restricted access (qualified researchers, clinicians, security personnel). Recognition material is open; technique-novelty material is restricted.
4. **Proportionality and accountability** — practitioners with access accept documentation and oversight responsibilities; access is not anonymous.

## Context

Within the Prismatic Platform, dual-use considerations are operationalized through explicit access tiering and audit:

- The [Kompendium](/kompendium/) itself follows the tiered model: high-level taxonomy and recognition material are open at [/kompendium/](/kompendium/) and [/glossary/](/glossary/); per-technique deep-dives at [/kompendium/techniques/](/kompendium/techniques/) include implementation-relevant detail and require authenticated access plus declared professional context.
- The [Color Teams](/glossary/color-teams/) Red Team operations — which by design use EA techniques against platform-internal targets — run under audit and are restricted to vetted operators. Red Team scenario libraries are not openly published.
- The [Decision Engine](/hub/dd/decisions/) records the operational use of any technique-level kompendium reference, providing accountability without restricting legitimate use.
- [NABLA Infinity](/glossary/nabla-infinity/) treats EA-related knowledge as a **provenance-tagged class of evidence**: when EA reasoning informs a decision, the reasoning is recorded explicitly so that later review can distinguish defensive from offensive applications.

The kompendium frames the alternative — secrecy — as **epistemically self-defeating** in this domain. EA techniques propagate through observation and imitation regardless of publication; what publication adds is the **defensive vocabulary** that allows targets and clinicians to recognize and resist what would otherwise propagate undetected. The asymmetry favors graduated openness: recognition-level material as widely available as the platform's general epistemic literacy work; novelty-level material restricted with audit; offensive operational material tightly controlled and accountable.

Czech-language treatment of the publication-ethics framework: [/kompendium/06-etika/dual-use/](/kompendium/06-etika/dual-use/). See [kompendium EA](/glossary/kompendium-ea/) for the broader framing of audience and use.

## See Also

- [Kompendium EA](/glossary/kompendium-ea/) — The kompendium itself, designed under this framework
- [Epistemická anihilace](/glossary/epistemicka-anihilace/) — Threat model whose study raises the dual-use problem
- [Taxonomie EA](/glossary/taxonomie-ea/) — Tiered taxonomy structure
- [Color Teams](/glossary/color-teams/) — Operational dual-use environment
- [Delegitimizace](/glossary/delegitimizace/) — Recognition-level vocabulary
- [Metakognitivní destrukce](/glossary/metakognitivni-destrukce/) — Tightly-controlled technique class
- [Kompendium](/kompendium/) — Full Czech-language reference

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](/developers/) | [Architecture](/architecture/) | [Meet the Creator](/about/author/)
