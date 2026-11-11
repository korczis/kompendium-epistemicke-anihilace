---
schema: adr/v1
id: adr-0007
kind: adr
title: "Žádný import artefaktů prismatic-platform do veřejné knihy; oddíly „Vztah k Prismatic platformě“ pryč"
status: accepted
date: 2026-11-11
tags:
  - licence
  - content
provenance:
  origin: authored
---

# 7. Žádný import artefaktů prismatic-platform do veřejné knihy

## Context

Zhruba 271 veřejných stránek nese oddíl „Vztah k Prismatic platformě“, který do knihy pod
GHL v1.0 vnáší materiál ze soukromé platformy (GHL v2.0 / proprietární). ADR 0002 uvedl
historii platformy jako linii archivu; o licenci jejích artefaktů v textu knihy nerozhodl.
Session obsahu otázku zapsala do svých otevřených otázek a dál ji neřešila.

## Decision

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-11), doslovně:

> „About 271 public Kompendium pages carry a "Vztah k Prismatic platformě" section that brings
> in material from your private prismatic-platform (GHL v2.0 / proprietary) into the public
> book (GHL v1.0). Under which licence may platform artefacts enter the public book?“

Nabídnuté možnosti: „Do not import; strip (Recommended)“, „Relicense selected artefacts“,
„Private edition only“. Odpověď vlastníka doslovně: **„Do not import; strip (Recommended)“**.

Artefakty platformy do veřejné knihy nevstupují. Oddíly „Vztah k Prismatic platformě“ se
z veřejných stránek odstraní; linie v `archive/` (ADR 0002) zůstává, jak je.

## Consequences

- Odstranění dělá vlastník `content/` deterministicky (celý oddíl od nadpisu po další nadpis),
  jako jeden řez; integrační lane ho nasadí samostatně a ověří prohledáním produkce.
- Gate obsahu odmítne nadpis „Vztah k Prismatic platformě“ v `content/`, bez baseline.
- Stránka, která odstraněním klesne pod hranici rozsahu, jde do dluhu „detail“ s důvodem, ne
  zpět s platformním textem.

## Amendment 2026-11-11: Decision Engine a Nabla

Navazující otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-11), doslovně:

> „Following your "Do not import; strip" decision for the 271 "Vztah k Prismatic platformě"
> sections: the public book also has 5 sections titled "Vztah k Prismatic Decision Engine"
> (e.g. in 02-uvod/teoreticke-zaklady.md, substantive theory with glossary links) and two whole
> pages, 02-uvod/vztah-k-decision-engine.md and 02-uvod/vztah-k-nabla.md, describing the book's
> relation to Decision Engine and Nabla (components of your private platform). Should these go
> too?“

Nabídnuté možnosti: „Strip them too (Recommended)“, „Keep them“, „Reword, keep the theory“.
Odpověď vlastníka doslovně: **„Strip them too (Recommended)“**.

Decision Engine a Nabla jsou artefakty platformy podle tohoto ADR: odstraní se 5 oddílů
„Vztah k Prismatic Decision Engine“ a obě stránky; jejich adresy přesměrují (Zola `aliases`)
na kapitolu, do které patří. Gate odmítne i tyto nadpisy.

## Amendment 2026-11-11 (2): hesla glosáře, která jsou pojmy platformy

Po odstranění 286 oddílů zbyly v knize celá hesla glosáře, která jsou sama pojmy platformy, a
zmínky v textu. Otázka vlastníkovi (AskUserQuestion, session
`5d49a595-d035-4bbe-b04a-d12695922860`, 2026-11-11), doslovně:

> „After removing the 286 "Vztah k Prismatic…" sections (ADR 0007), the public book still has
> whole glossary entries that are themselves concepts of your private platform, e.g.
> glossary/nabla-infinity, nabla-axioms, decision-core, supreme-commander, no-mercy-no-doubts,
> signal-plurality, hawkeye, risk-score, adapter-pattern, bounded-context. In prose overall:
> "Prismatic" 932 mentions in 182 files, "Decision Engine" 476 in 339, "NABLA" 799 in 365.
> Should the public book carry these platform-concept glossary entries and mentions?“

Nabídnuté možnosti: „Remove platform-only entries (Recommended)“ (hesla, která existují jen
jako pojmy platformy, pryč s přesměrováním; jména platformy v textu nahradit neutrálním
zněním; obecné pojmy, které platforma také používá — OSINT, red team, risk score, bounded
context — zůstanou bez odkazů na platformu), „Remove all mentions too“, „Keep them“.
Odpověď vlastníka doslovně: **„Remove platform-only entries (Recommended)“**.

Hesla, která existují jen jako pojmy platformy (např. Nabla Infinity, axiomy Nabla, Decision
Core, Supreme Commander, No Mercy No Doubts), se odstraní a jejich adresy přesměrují na
nejbližší obecné heslo nebo na glosář. Obecná hesla zůstanou a přepíšou se bez odkazů na
platformu. Jména Prismatic, Decision Engine a Nabla v textu nahradí neutrální znění. Seznam
hesel „jen platforma“ versus „obecný pojem“ sestaví vlastník obsahu a předá ho k revizi před
odstraněním.

## Amendment 2026-11-11 (3): obecná hesla z importu platformy — jen ta, která kniha potřebuje

Revize seznamu (session glosáře, 42 hesel pryč, 85 zůstává) otevřela otázku relevance, ne
původu. Rozhodnutí revizora: heslo `decision-engine` jde pryč jako artefakt platformy podle
doplňku 1 (přesměrování na /glossary/). Otázka vlastníkovi (AskUserQuestion, session
`5d49a595-d035-4bbe-b04a-d12695922860`, 2026-11-11), doslovně:

> „18 general entries came into the Kompendium glossary with the platform import and stay under
> your platform rule, because their subject is general: Shodan, Censys, GreyNoise, EASM, OSINT,
> sanctions screening, due diligence, entity resolution, intelligence fusion, graph theory, risk
> score, inference, regression test, adapter pattern, bounded context, compliance framework,
> pattern evidence (decision engine goes as a platform artefact). Separately from provenance:
> should a compendium of epistemic and cognitive annihilation carry entries like Shodan or the
> Adapter Pattern at all?“

Nabídnuté možnosti: „Keep only book-relevant ones (Recommended)“ (ponechat hesla, která text
knihy potřebuje, např. OSINT, intelligence fusion, due diligence, risk score, inference, přepsaná
pro předmět knihy; čistě nástrojová a inženýrská hesla — Shodan, Censys, GreyNoise, EASM, adapter
pattern, bounded context, regression test — odstranit s přesměrováním), „Keep all 18“, „Remove
all 18“. Odpověď vlastníka doslovně: **„Keep only book-relevant ones (Recommended)“**.

Měřítko je, zda heslo potřebuje text knihy (odkazy na heslo z obsahu a jeho role v obranném
rámci), ne zda je pojem obecný. Seznam „ponechat / odstranit“ pro těchto 17 hesel sestaví
vlastník glosáře podle počtu a povahy odkazů z obsahu a předá k revizi spolu s ostatními.
