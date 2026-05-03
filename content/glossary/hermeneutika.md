+++
title = "Hermeneutika"
weight = 60

[extra]
category = "epistemic"
description = "Filosofická teorie interpretace textů, jednání a historických událostí (Gadamer, Ricoeur); rámec pro odlišení legitimní reinterpretace od EA-1.3.2 strategické reinterpretace."
related_terms = ["fenomenologie", "epistemicka-anihilace", "taxonomie-ea", "gaslighting", "falsifikace", "lakatos-vyzkumny-program"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 660
date_created = "2026-04-25"
date_modified = "2026-04-25"
keywords = ["hermeneutika", "hermeneutics", "Gadamer", "Ricoeur", "interpretace", "kompendium"]
tags = ["glossary", "epistemic", "philosophy", "interpretation"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Hermeneutika - glossary"
+++

## Definition

**Hermeneutika** (*hermeneutics*) is the philosophical theory of interpretation — of texts, actions, historical events, and human meaning more generally. The modern philosophical tradition (Schleiermacher, Dilthey, Heidegger, **Hans-Georg Gadamer**, **Paul Ricoeur**) treats interpretation not as a method applied to objects but as a **structural condition** of human understanding: every act of comprehension occurs from within a horizon of prior assumptions, language, and historical situatedness. There is no view from nowhere.

Two structures from the philosophical tradition matter for the [Kompendium epistemické a kognitivní anihilace](@/kompendium/_index.md):

1. **The hermeneutic circle** (Gadamer) — understanding moves between part and whole: the meaning of a passage depends on the whole text, the meaning of the whole text depends on its passages. Comprehension is iterative refinement, not linear deduction.
2. **The conflict of interpretations** (Ricoeur) — the same text or event admits multiple legitimate readings, each disclosing different aspects. Pluralism of interpretation is not relativism: legitimate interpretations are constrained by **textual evidence**, **internal coherence**, **explanatory yield**, and **fidelity to the matter at hand** (*die Sache selbst*).

The kompendium uses hermeneutics precisely to **distinguish legitimate interpretive revision from EA-1.3.2 strategic reinterpretation** ([gaslighting](@/glossary/gaslighting.md)'s textual-historical face). Both look superficially similar — "what really happened was..." Both involve revising a prior interpretation. The structural difference:

- **Legitimate hermeneutic revision** discloses *more* of the matter — additional evidence, internal coherence, explanatory power; the new reading survives engagement with the original record and the alternatives.
- **EA-1.3.2 strategic reinterpretation** systematically suppresses parts of the record, denies the standing of alternative interpreters, and produces readings that benefit the manipulator regardless of textual fit.

## Context

Within the Prismatic Platform, the hermeneutic framework is operationalized in two layers:

- The {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }} treats interpretation as a **separate epistemic operation** from data ingestion. Multiple interpretations of the same source material are kept available, with provenance and evidential support tracked per interpretation. A reinterpretation is registered with timestamp, author, and the justification offered — not silently overwritten.
- [NABLA Infinity](@/glossary/nabla-infinity.md) maintains an **interpretation history** so that when a current interpretation conflicts with prior ones, the conflict is surfaced rather than suppressed. This is the structural defense against EA-1.3.2: a strategic reinterpretation depends on the prior interpretation being silently erased; immutable interpretation history prevents the erasure.
- The [Color Teams](@/glossary/color-teams.md) Blue Team validates this with adversarial reinterpretation drills — testing that platform records cannot be retroactively rewritten without leaving an audit trail.

Hermeneutics is also the philosophical complement to [fenomenologie](@/glossary/fenomenologie.md): phenomenology asks how experience is structured for the subject; hermeneutics asks how meaning is constituted across subjects, texts, and history. Both first-person methodologies are essential to EA detection because the data — what manipulation feels like, how a reinterpretation lands — is irreducibly first-personal. The platform's design respects this: subject self-reports are not subordinated to third-person measurement, they are tracked as their own evidence stream.

The framework distinguishes hermeneutics from postmodern relativism. Recognizing that interpretation is unavoidable does not mean all interpretations are equal. Czech-language treatment: [/kompendium/04-mechanismy/hermeneutika/](/kompendium/04-mechanismy/hermeneutika/).

## See Also

- [Fenomenologie](@/glossary/fenomenologie.md) — First-person methodological complement
- [Gaslighting](@/glossary/gaslighting.md) — Personal-scale realization of the EA-1.3.2 attack
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) — Parent threat model
- [Taxonomie EA](@/glossary/taxonomie-ea.md) — Specifically EA-1.3.2 strategic reinterpretation
- [Falsifikace](@/glossary/falsifikace.md) — Empirical-science complement
- [Lakatosův výzkumný program](@/glossary/lakatos-vyzkumny-program.md) — Progressive vs. degenerative analog in interpretation
- [Kompendium](@/kompendium/_index.md) — Full Czech-language taxonomy

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Meet the Creator](@/about/author.md)
