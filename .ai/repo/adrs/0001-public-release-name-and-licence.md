---
schema: adr/v1
id: adr-0001
kind: adr
title: "Název veřejného vydání a licence"
status: superseded
date: 2026-11-09
superseded_by: adr-0003
tags:
  - release
  - licence
provenance:
  origin: authored
---

# 1. Název veřejného vydání a licence

## Context

Kompendium nemělo vlastní repozitář. Zdroj ležel uvnitř soukromého monorepozitáře
`gitlab.com/korczis/prismatic-platform` (`apps/prismatic_web/priv/content/kompendium/`, 1587
souborů), vyrenderované stránky v `github.com/prismatic-reality-com/prismatic-promo` a starší
verze v `gitlab.com/korczis/prismatic-legacy`, `gitlab.com/korczis/prismatic` a třech secret
gistech. Autor požádal o obnovu jako veřejného projektu na GitHubu s GitHub Pages, wiki a grafikou.

## Decision

Odpovědi autora (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-09T21:33Z), doslovně:

- Q: "What should the public GitHub repo (and the GitHub Pages URL) be called?"
  A: "korczis/kompendium-epistemicke-anihilace (Recommended)"
- Q: "Licence for the public book (text + graphics)? Your code repos use MIT, but that licence
  is meant for code, not for a book."
  A: "CC BY-NC-SA 4.0 (Recommended)"

Tedy: repozitář `korczis/kompendium-epistemicke-anihilace`, web na
`https://korczis.github.io/kompendium-epistemicke-anihilace/`. Text a grafika jsou pod
CC BY-NC-SA 4.0, kód (šablony, skripty, workflow) pod MIT.

Zamítnuté možnosti: názvy `korczis/kompendium` a `korczis/epistemic-annihilation`; licence
CC BY-SA 4.0, CC BY 4.0 a „všechna práva vyhrazena“.

## Consequences

- V kořeni jsou `LICENSE` (MIT, kód) a `LICENSE-CONTENT.md` (CC BY-NC-SA 4.0, `content/`,
  `archive/`, `static/img/`, `static/js/p5/`); README uvádí, co pod kterou licenci patří.
- Historie knihy i starších linií byla převzata pomocí `git filter-repo`, takže commity před
  tímto rozhodnutím si ponechávají původní autorství a data.
