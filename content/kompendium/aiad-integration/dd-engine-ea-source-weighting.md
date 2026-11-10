+++
title = "DD Engine & EA detection"
description = "Integrace agenta DD Engine s kompendium EA taxonomií — role, detekční mechanismy, operační protokoly."
weight = 31

[taxonomies]
tags = ["kompendium", "aiad-integration", "dd-engine-ea-source-weighting"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["compliance-ea-regulatory-screening", "czech-ares-ea-screening", "decision-engine-ea-calibration", "epistemic-pipeline-ea-detection"]
parent = "kompendium-aiad-integration"
toc = true
+++

# DD Engine & EA detection

## Agent overview

DD Engine je due-diligence orchestrátor — koordinuje multi-doménové investigation, weighted scoring zdrojů a generuje audit-ready reporty s contradiction matrix. V architektuře platformy zaujímá pozici v rámci **Domain Agents** (domain) a jeho odpovědnost je striktně vymezená — žádný jiný agent neduplikuje jeho roli.

## EA relevance

DD Engine je **konzument celé EA infrastruktury** — pro každou DD investigation aplikuje relevant subset detekčních vrstev. Konzumuje **glossary-bridges/** pro konzistentní terminologii v reportech.

## Detection mechanisms

Detekce: **contradiction matrix** — každý zdroj × každý claim, hledá **logické rozpory** (Casper deklaruje 800M, ale rejstřík ukazuje 229M). Contradictions = high-priority red flags.

## Operational protocols

Provoz: per-deal investigation, days-to-weeks horizon. Výstup: **NBS report** (No Bullshit) s contradiction matrix, source weighting, evidence chain. Každý protokolový krok je instrumentován **OTEL telemetrií** (per [DOCS+OTEL doctrine](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md)) a každé rozhodnutí je auditovatelné přes **NCLB evidence chain**.

## Limitations

DD Engine je **report-grade**, ne **real-time** — výstup vyžaduje hodiny analýzy. Také závislý na kvalitě upstream OSINT a ARES dat.

## Coordination

Volá **OSINT Agent**, **Czech ARES**, **Compliance**; výstupy validuje **[Trinity Gate](@/glossary/trinity-gate.md)**; reporty auditovány **[White Team](@/glossary/white-team.md)**.

## Cross-linky

- [Czech Ares Ea Screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) — peer v rámci Domain Agents
- [Osint Ea Source Validation](@/kompendium/aiad-integration/osint-ea-source-validation.md) — peer v rámci Domain Agents
- [Hawkeye Ea Visitor Intelligence](@/kompendium/aiad-integration/hawkeye-ea-visitor-intelligence.md) — peer v rámci Domain Agents
- [Perimeter Ea Attack Surface](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) — peer v rámci Domain Agents
- [Compliance Ea Regulatory Screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) — peer v rámci Domain Agents
- [Red Team Ea Detection](@/kompendium/aiad-integration/red-team-ea-detection.md) — cross-group koordinace
- [Archer Supreme Ea Orchestration](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) — cross-group koordinace
- [Autoevolve Ea Pattern Evolution](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) — cross-group koordinace
- [základní kategorie EA](@/kompendium/03-zakladni-kategorie/_index.md) — EA taxonomie
- [terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md) — EA taxonomie
- [ultramari techniky](@/kompendium/05-ultramari-techniky/_index.md) — EA taxonomie
- [agent-tier](@/glossary/agent-tier.md) — platform glossary
- [color-teams](@/glossary/color-teams.md) — platform glossary
- [archer-supreme glossary](@/glossary/archer-supreme.md) — platform glossary

## Connect & Contribute

Created by [Tomáš Korcak (korczis)](https://github.com/korczis) | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
