+++
title = "Bridge: Platform Decision Engine → Kompendium"
description = "Bridge článek propojující Platform: Decision Engine s Kompendium (terminální protokoly + klinika)."
weight = 38

[taxonomies]
tags = ["kompendium", "section-bridge", "navigace"]
categories = ["academic", "reference"]

[extra]
parent = "kompendium-section-bridges"
toc = false
+++

# Bridge: Platform Decision Engine → Kompendium

> **Z:** Platform: Decision Engine → **Do:** Kompendium (terminální protokoly + klinika)
> **Typ:** Inter-section bridge (sekce-na-sekci)
> **Reciprocita:** Bidirektionální navigace mezi sekcemi.

## 1. Účel bridge

DecisionEngine na platformě je **technický substrát** pro rozhodování; kompendium dodává **doménový obsah** (kategorie, kontraindikace, exit kritéria). Bridge ukazuje, jak DecisionEngine implementuje to, co kompendium normativně předepisuje. Bez kompendia by DecisionEngine byl prázdný framework; bez DecisionEngine by kompendium zůstalo papírovou knihou.

## 2. Klíčová témata propojení

- **Kompendium kontraindikace → DecisionEngine validation rules.**
- **Kompendium exit kritéria → DecisionEngine exit conditions.**
- **Kompendium eskalační matice → DecisionEngine escalation policies.**
- **Kompendium readiness → DecisionEngine pre-conditions.**
- **Kompendium glossary → DecisionEngine ontology.**
- **Kompendium klinický fenotyp → DecisionEngine pattern matchers.**
- **Kompendium audit → DecisionEngine audit log.**

## 3. Doporučená čtenářská trajektorie

Pro vývojáře: nejprve kompendium (sekce 04, 06), pak DecisionEngine implementace. Pro klinika: nejprve klinické chápání (kompendium), pak technická validace (DecisionEngine). Iterace: kompendium → engine → kompendium.

## 4. Společné cross-linky

| Z Platform: Decision Engine | Do Kompendium (terminální protokoly + klinika) |
|---|---|
| Kompendium 04.1 | DecisionEngine validation |
| Kompendium 04.5 | DecisionEngine escalation |
| Kompendium 04.7 | DecisionEngine exit |
| Kompendium 06.5 | DecisionEngine pattern matchers |

## 5. Specifické techniky / koncepty

Klíčové koncepty: **DecisionEngine jako technický substrát**, **kompendium jako doménový content**, **DecisionEnvelope (sealed)**, **CalibrationLoop (zpětná vazba)**, **AuditLog (transparentnost)**.

## 6. Související

- [Platform: Decision Engine](/glossary/)
- [Kompendium 04 — Terminální](/kompendium/04-terminalni-protokoly/)
- [Kompendium 06 — Klinika](/kompendium/06-klinicke-aplikace/)
- [Glossary: DecisionEngine](/kompendium/glossary-bridges/bridge-decision-engine/)
- [Doctrine NMND](/kompendium/glossary-bridges/bridge-nmnd/)
- [Doctrine NCLB](/kompendium/glossary-bridges/bridge-nclb/)
- [Case Studies](/kompendium/case-studies/)
- [Visualizations: Decision flow](/kompendium/visualizations/)

## 7. Meta-poznámka: kompendium jako policy source

DecisionEngine implementuje **rules**; kompendium dodává **policies**. Rozdíl je zásadní: rules jsou syntaktická pravidla, policies jsou normativní obsah. Bridge zdůrazňuje, že **kompendium je policy source pro DecisionEngine**. Když se mění kompendium (nový kontraindikační vzor, nový exit kritérium), musí se **propagovat do DecisionEngine policies**. Tato propagace je explicitně dokumentovaná v audit logu. Bez této vazby by se DecisionEngine a kompendium rozjely — engine by aplikoval zastaralé policies, kompendium by popisoval techniky bez technické reprezentace.

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](/developers/) | [Architecture](/architecture/) | [Glossary](/glossary/) | [Kompendium](/kompendium/)
