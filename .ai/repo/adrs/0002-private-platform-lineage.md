---
schema: adr/v1
id: adr-0002
kind: adr
title: "Převzetí soukromých souborů z Prismatic Platform do veřejného archivu"
status: accepted
date: 2026-11-10
tags:
  - archive
  - provenance
  - privacy
provenance:
  origin: authored
---

# 2. Převzetí soukromých souborů z Prismatic Platform do veřejného archivu

## Context

Při prohledání všech zdrojů (2026-11-09/10) zůstaly mimo archiv soubory o kompendiu, které
existují jen v soukromém monorepozitáři `gitlab.com/korczis/prismatic-platform`:

- aplikace `apps/prismatic_annihilation` (Elixir; taxonomie, extrakce kompendia z Markdownu,
  obranné a detekční vzorce), 328 souborů, smazaná z `main` 2026-03-28 (`8bcd3a48c8`);
- `.aiad/knowledge/epistemic-annihilation.kb.md` (znalostní báze);
- `.claude/knowledge/10-specialized/personal-lexicon/tactical-methods/epistemicka-anihilace.md`;
- `apps/prismatic_web/priv/content/blog/announcing-kompendium-epistemicke-anihilace.md`
  (článek, kterým platforma knihu 2026-04-25 ohlásila).

Jiná souběžná session (`dev-31`) jejich převzetí zastavila: její klasifikátor oprávnění ho
odmítl jako zveřejnění obsahu soukromého repozitáře. Rozhodnutí proto patří autorovi.

## Decision

Odpověď autora (session `30dc7a0e-8a7f-48e6-8922-1b1b2dc08588`, 2026-11-10T00:36Z), doslovně:

- Q: „Mám to převzít, nebo ne?“ (u výčtu `apps/prismatic_annihilation`, `.aiad` KB, heslo
  z lexikonu, blogový článek s oznámením)
  A: „ano, převezmi i soukromé soubory z prismatic-platform“

Sloučení do veřejného `main` potvrdil autor v session vlastníka nasazení (AskUserQuestion,
session `5d49a595-d035-4bbe-b04a-d12695922860`, 2026-11-10T00:12Z), doslovně:
„Ano, sloučit do veřejného repa“.

Soubory jsou převzaty i s historií jako linie `archive/prismatic-platform/`
(`scripts/import-lineage.sh`, 50 commitů dotýkajících se složky, 2025-09-30 až 2026-06-07);
aplikace v posledním stavu před smazáním, předchozí stavy v historii.

## Consequences

- Před převzetím byla celá historie převzatých cest prohledána (`git log -p`): žádný přístupový
  údaj, klíč ani vnitřní adresa; autorova adresa v obsahu souborů nahrazena odkazem na Issues
  (pravidlo `project.public-copy-scrubbed`). V metadatech commitů zůstává, stejně jako ve všech
  ostatních převzatých liniích.
- Linie leží na vlastní větvi `feature/archive-prismatic-platform`, aby šly vlny obsahu slučovat
  nezávisle na ní; autor sloučení do veřejného `main` potvrdil (viz výše).
- `archive/README.md` uvádí linii v tabulce a v oddílu „Soukromé soubory z Prismatic Platform“.
