+++
title = "Decision Engine"
weight = 100

[extra]
category = "ai-systems"
description = "Rule-based or machine learning system producing structured decisions from multi-factor inputs."
related_terms = ["rule-engine", "scoring", "confidence-scoring", "trinity-gate", "inference"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-05-03"
tags = ["glossary", "ai-systems"]
quality_score = 35
status = "stub"
+++

## Definition

**Decision engine** is a system component that synthesizes multi-factor inputs (evidence, signals, heuristics) into a structured decision with confidence or priority ranking. Decision engines may be rule-based (deterministic), probabilistic, or neural network-based.

The Prismatic Platform embeds decision engines in the [Trinity Gate](@/glossary/trinity-gate.md) verification pipeline and [confidence scoring](@/glossary/confidence-scoring.md) system. Decision engines balance:
- Signal quality and provenance
- Temporal decay of evidence
- Conflict resolution among contradictory signals
- User-configurable risk thresholds

See [inference](@/glossary/inference.md) for related reasoning concepts.

## See Also

- [Glossary index](@/glossary/_index.md)

---

> **Stub status**: This entry is a structurally complete stub created during
> the 2026-05-03 NLLB content-completion sweep. The definition above is a
> minimum-viable scaffold; full treatment with worked examples, references,
> and cross-domain context is part of the ongoing knowledge-base buildout.
> See `<!-- NLLB:PLANNED_OK -->` doctrine marker.

<!-- NLLB:PLANNED_OK -->
