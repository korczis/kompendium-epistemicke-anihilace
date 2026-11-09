+++
title = "Paralysis by Analysis"
weight = 5
[extra]
description = "Decision-making pathology in which excessive deliberation, information gathering, or option evaluation prevents the actor from reaching any decision at all — common in high-stakes contexts with poorly bounded option spaces"
category = "decision-theory"
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "5 min"
difficulty = "intermediate"
quality_score = 88
date_created = "2026-05-03"
date_updated = "2026-05-03"
importance = "medium"
related_terms = ["bayesian-reasoning", "uncertainty", "anomaly-detection", "reality-testing"]
keywords = ["paralysis by analysis", "analysis paralysis", "overthinking", "decision fatigue", "satisficing", "Simon", "bounded rationality"]
tags = ["decision-theory", "psychology", "management", "operations"]
key_takeaway = "Paralysis by analysis is the failure mode of optimization seekers in environments where optimization is impossible. The remedy is not better analysis but explicit pre-commitment to *satisficing* heuristics — accepting good-enough rather than chasing best-possible."
see_also = ["bayesian-reasoning", "uncertainty"]
image = "/images/sections/glossary.png"
image_alt = "Paralysis by Analysis - Prismatic Platform"
+++

## Definition

Paralysis by analysis (also *analysis paralysis*) is a decision-making pathology in which the actor invests so much effort in gathering information, evaluating options, modeling consequences, or seeking the *best possible* solution that no decision is ever reached, or it is reached too late to be effective. The pattern is structurally distinct from rational deliberation: rational deliberation terminates when expected marginal value of additional analysis falls below its cost; paralysis by analysis fails to recognize this termination point because the perceived stakes inflate analysis value indefinitely.

## Manažerské shrnutí

V kontextu Prismatic Platform je paralysis by analysis častý anti-vzor především v: (1) **DD case workflow** — analytik nemůže vydat sign-off, dokud neověří *všechny* nálezy, ale objem signálů je nekonečný; (2) **architektonická rozhodnutí** — výběr databázového adapteru se vleče měsíce, zatímco žádná z variant by nezpůsobila katastrofu; (3) **incident response** — operátor v on-call rotaci váhá mezi rollback a forward-fix tak dlouho, že incident eskaluje. Manažersky kritické: explicitní **time-box** pro každou rozhodovací fázi a předem definované *satisficing thresholds* (kdy "dost dobré" stačí). Pilíř M5M (Max 5 Minutes) je institucionalizovaná obrana proti tomuto vzoru — žádné rozhodnutí trvalá více než 5 minut bez explicitní eskalace.

## Operational Context

Herbert Simon (1956, 1957) formalizoval kontrast mezi *maximizing* (hledání optima) a *satisficing* (akceptace prvního řešení nad acceptance threshold) v rámci *bounded rationality*. Empirický výzkum (Iyengar & Lepper 2000, *Choice overload paradigm*) prokázal, že nárůst počtu možností *snižuje* pravděpodobnost rozhodnutí — slavný "jam study" ukázal 10× vyšší konverzi u 6 marmelád oproti 24. Současná behaviorální ekonomie (Schwartz, *The Paradox of Choice*, 2004) rozlišuje *maximizers* (osobnostní typ trpící paralýzou) od *satisficers* (akceptují pragmaticky). Klinicky se chronická paralysis by analysis překrývá s OCPD (obsessive-compulsive personality disorder) a s GAD (generalized anxiety disorder), ale ne každý případ je psychopatologií — často jde o kulturně podporovaný vzor v profesích vyžadujících *due diligence*.

## Practical Application

1. **Time-boxed DD review**: každý DD report má hard deadline pro publikaci first-cut findings (typicky 5 pracovních dní); follow-up upravy probíhají v dalších iteracích, ne formou nekonečného odkládání první verze.
2. **Architecture Decision Records (ADR)**: nový technický návrh má 2-týdenní debate window, po kterém leadership vynucuje rozhodnutí — buď accept, reject, nebo park-with-explicit-deadline.
3. **Incident response runbook**: rozhodovací stromy s předem definovanými branch points eliminují potřebu deliberace v stresu — operátor následuje runbook, ne intuici.
4. **Pre-commitment tactics**: *Ulysses contract* — zavázat se k rozhodnutí dle předem definovaného kritéria (např. "pokud cena > X, nezvažuji"), tím se odstraní možnost donekonečného zvažování.

## Related Concepts

- [Bayesian Reasoning](https://prismatic-reality-com.github.io/prismatic-promo/glossary/bayesian-reasoning/) - Provides termination criterion (when prior is updated enough)
- [Uncertainty](https://prismatic-reality-com.github.io/prismatic-promo/glossary/uncertainty/) - The substrate driving decision pathology
- [Anomaly Detection](https://prismatic-reality-com.github.io/prismatic-promo/glossary/anomaly-detection/) - Operational context where rapid decisions are required
- [Reality Testing](@/glossary/reality-testing.md) - Cognitive function that bounds analysis to relevant signals

## References

- Simon, H. A. *Models of Man: Social and Rational* (Wiley, 1957)
- Iyengar, S. S. & Lepper, M. R. *When Choice is Demotivating* (J. Personality and Social Psychology, 2000)
- Schwartz, B. *The Paradox of Choice: Why More Is Less* (Harper, 2004)
- Kahneman, D. *Thinking, Fast and Slow* (Farrar, Straus and Giroux, 2011)
- Gigerenzer, G. & Selten, R. eds. *Bounded Rationality: The Adaptive Toolbox* (MIT Press, 2001)

---

*Built with precision. Optimized for AI consumption.*
