---
schema: adr/v1
id: adr-0003
kind: adr
title: "Licence: General Honest License (GHL) v1.0"
status: accepted
date: 2026-11-10
tags:
  - licence
supersedes:
  - adr-0001
provenance:
  origin: authored
---

# 3. Licence: General Honest License (GHL) v1.0

## Context

ADR 0001 (2026-11-09) zvolil pro text a grafiku CC BY-NC-SA 4.0 a pro kód MIT. Autor 2026-11-10
rozhodl jinak. Název repozitáře a adresa webu z ADR 0001 platí dál; nahrazuje se jen licence.

## Decision

Pokyn autora (session `30dc7a0e-8a7f-48e6-8922-1b1b2dc08588`, 2026-11-10), doslovně:

> „vse je pod korczis honest licencse,  link znas“

Celý repozitář – text, grafika, archiv i kód – je pod **General Honest License (GHL) v1.0**
autora Tomáše Korčáka. Kanonické znění: <https://github.com/korczis/prismatic/tree/main/docs/ghl>
(veřejné; `docs/ghl/README.md` a šest oddílů 01-foundations až 06-appendices).

## Consequences

- `LICENSE`, `LICENSE-CONTENT.md`, `NOTICE.md`, odznaky v README a patička webu se přepnou na
  GHL a odkážou na kanonické znění; patří vlastníkovi šablon a kořenových dokumentů.
- Patičky stránek v `content/`, které odkazují na „GHL“, už odkazují správně, jakmile
  `LICENSE-CONTENT.md` nese GHL.
- Knihovny třetích stran ve `static/js/vendor/` si ponechávají vlastní licence; `NOTICE.md` je
  dál uvádí.
- ADR 0001 zůstává jako záznam rozhodnutí o názvu; jeho licenční část je nahrazena.
