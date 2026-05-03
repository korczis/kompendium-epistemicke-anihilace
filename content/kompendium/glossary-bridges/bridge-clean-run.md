+++
title = "Bridge: clean-run"
description = "Glossary bridge — propojeni kompendia s glossary entry clean-run."
weight = 1
[taxonomies]
tags = ["kompendium", "glossary-bridge", "clean-run", "cross-link"]
categories = ["academic", "reference"]
[extra]
parent = "kompendium-glossary-bridges"
glossary_target = "clean-run"
toc = false
+++

# Bridge — Clean Run

## Glossary entry

[clean-run](@/glossary/clean-run.md) — Clean Run.

Tento bridge clanek navigacne propojuje kompendium s odpovidajicim glossary heslem a poskytuje rozsireny vyklad konceptualniho ukotveni v kompendialnim korpusu.

## Definice z glossary

Clean Run je v Prismatic platformě stav úspěšného provedení testovacího nebo deployment cyklu bez warnings, errors, doctrine violations nebo regresí. Je to operacionalizace doctrinální `mix compile --warnings-as-errors --force` + `just quality` + `mix test` + `just validate-doctrine` pipeline s nulovým výstupem chyb.

Glossary heslo poskytuje jadro vyklad; tento bridge clanek dale rozviji jeho aplikacni rovinu, vztahy a interpretacni implikace v kontextu Prismatic platformy.

## Pozice v kompendiu

Koncept se v kompendiu vyskytuje napric nasledujicimi clanky a sekcemi:

- **Sekce 04 — Quality gates**: clean run jako prerequisitě deploy
- **Sekce 05 — Pre-commit doctrine**: 9 blocking pillars musí pasovat pro clean run
- **Sekce 06 — CI/CD pipeline**: clean run gates v každé fázi
- **Sekce 07 — NMND enforcement**: shortcut/warning = automatic rejection
- **Per-technique články**: diagnostika non-clean run, recovery patterny

Bridge slouzi jako navigacni kotva mezi temito clanky a kanonickou definici v glossary; cross-linking je obousmerny.

## Konceptualni mapa

Vztahy konceptu k souvisejicim entitam v platformovem korpusu:

| Vztah | Cílový koncept | Typ vazby |
|---|---|---|
| předpoklad | Deploy | gating |
| vynucuje | NMND, TACH, ZERO | doctrines |
| kontrastuje | Dirty run (warnings present) | polarita |

Tabulka zachycuje pouze klicove vazby; uplna mapa je dostupna v kompendialnich vizualizacich a graph databazi.

## Klinicke a filosoficke implikace

Clean run materializuje doktrinální maximum perfectionismu: žádné warnings, žádné known issues, žádné technical debt v current commit. Filosoficky reflektuje napětí mezi pragmatismem (ship it) a quality absolutismem. Klinicky vynucuje, aby každý commit reprezentoval auditovatelný stav systému, ne in-progress chaos.

Bridge zde slouzi jako vstupni bod do hlubsi analyzy v sekci kompendialnich teoretickych reflexi a klinickych aplikaci.

## Cross-linky

- **Hub kompendia**: [/kompendium/](@/kompendium/_index.md)
- **Glossary entry**: [/glossary/clean-run/](@/glossary/clean-run.md)
- **Quick reference**: [/kompendium/quick-reference/](@/kompendium/quick-reference/_index.md)
- **Visualizations**: [/kompendium/visualizations/](@/kompendium/visualizations/_index.md)
- **Glossary index**: [/glossary/](@/glossary/_index.md)
- **Bridge hub**: [/kompendium/glossary-bridges/](@/kompendium/glossary-bridges/_index.md)
- **Konceptualni mapa**: [/kompendium/konceptualni-mapa/](/kompendium/konceptualni-mapa/)
- **Per-technique katalog**: [/kompendium/techniques/](@/kompendium/techniques/_index.md)
- **Klinicke aplikace**: [/kompendium/klinicke-aplikace/](/kompendium/06-klinicke-aplikace/)
- **Teoreticke reflexe**: [/kompendium/teoreticke-reflexe/](/kompendium/07-teoreticke-reflexe/)

---

**Created by [Tomas Korcak (korczis)](https://github.com/korczis/prismatic-platform)** | [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)
