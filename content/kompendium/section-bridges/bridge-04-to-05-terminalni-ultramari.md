+++
title = "Bridge: Terminální protokoly → Ultramarinní techniky"
description = "Bridge článek propojující 04 — Terminální protokoly s 05 — Ultramarinní techniky."
weight = 19

[taxonomies]
tags = ["kompendium", "section-bridge", "navigace"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-03-to-06-techniky-klinika", "bridge-03-to-07-techniky-teorie", "bridge-04-to-06-terminalni-klinika", "bridge-04-to-07-terminalni-teorie"]
parent = "kompendium-section-bridges"
toc = false
+++

# Bridge: Terminální protokoly → Ultramarinní techniky

> **Z:** 04 — Terminální protokoly → **Do:** 05 — Ultramarinní techniky
> **Typ:** Inter-section bridge (sekce-na-sekci)
> **Reciprocita:** Bidirektionální navigace mezi sekcemi.

## 1. Účel bridge

Terminální protokoly jsou **bezpečnostní síť**, na které ultramari teprve smí pracovat. Bridge dokumentuje povinnou sekvenci: nejprve plně osvojené terminální protokoly, pak teprve ultramari. Bez této sekvence se ultramari mění z transformační praxe v experimentální riziko.

## 2. Klíčová témata propojení

- **Terminální safety net → ultramari pojištění** — bez sítě žádné ultramari.
- **Exit protokol → ultramari exit** — ultramari má vždy předem definovaný exit.
- **Eskalační matice → ultramari eskalace** — když ultramari sklouzne, sítě sekce 04 chytí.
- **Vstupní filtr → ultramari readiness gate** — ultramari má přísnější filtr.
- **Audit log → ultramari logging** — ultramari je dokumentovaná každá fáze.
- **Multi-stage consent → ultramari iterativní consent** — souhlas se obnovuje opakovaně.
- **Companion presence → ultramari povinný doprovod** — bez druhé osoby ultramari NE.

## 3. Doporučená čtenářská trajektorie

Pořadí je striktně: **04 → 05**. Sekci 04 nelze přeskočit. Doporučuji ovládat všechny terminální protokoly na úrovni rutiny, než vstoupíte do sekce 05. Po sekci 05 zpět do 04 — ultramari odhalí, kde jsou terminální protokoly slabé.

## 4. Společné cross-linky

| Z 04 — Terminální protokoly | Do 05 — Ultramarinní techniky |
|---|---|
| 04.1 — Vstupní filtr | 05.1 — Ultramari readiness gate |
| 04.5 — Eskalace | 05.5 — Ultramari eskalace |
| 04.7 — Exit | 05.7 — Ultramari exit |
| 04.8 — Logging | 05.8 — Ultramari logging |

## 5. Specifické techniky / koncepty

Klíčové koncepty: **safety net**, **iterativní consent**, **companion presence**, **ultramari readiness gate**, **ultramari logging**. Mapují se na SafetyGuard, AuditLog, DecisionEnvelope.

## 6. Související

- [04 — Terminální protokoly](@/kompendium/04-terminalni-protokoly/_index.md)
- [05 — Ultramarinní techniky](@/kompendium/05-ultramari-techniky/_index.md)
- [Quick Reference: Safety](@/kompendium/quick-reference/_index.md)
- [Glossary: Ultramari](@/kompendium/glossary-bridges/_index.md)
- [Klinika](@/kompendium/06-klinicke-aplikace/_index.md)
- [Case studies: terminální + ultramari](@/kompendium/case-studies/_index.md)
- [Visualizations: Sequence](@/kompendium/visualizations/_index.md)
- [Techniques](@/kompendium/techniques/_index.md)

## 8. Sekvenční pojistka: nikdy ultramari bez terminálního pohotovostního plánu

Bridge zdůrazňuje **sekvenční pojistku**: před každým ultramari sezením musí být explicitně aktivován terminální pohotovostní plán. Tento plán obsahuje: (1) jasné exit kritérium, (2) eskalační kontakty, (3) post-event debrief slot, (4) audit log připraven. Bez všech čtyř položek ultramari NESMÍ začít. Tato pojistka je vynucována v platform SafetyGuard a auditována AuditLog. Pre-commit hook NCLB detekuje ultramari sezení bez aktivovaného terminálního plánu.

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Developer Portal](@/developers/_index.md) | [Architecture](@/architecture/_index.md) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)
