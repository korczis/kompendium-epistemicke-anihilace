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

## Amendment 2026-11-11 (4): celé stránky o platformě, mosty a kapitola 1.6

Po doplňcích 2 a 3 zbylo v knize asi 29 celých stránek o integraci platformy. Odpovědi vlastníka
k nim padly ve dvou session a ke kapitole 1.6 si odporovaly; vlastník rozpor rozhodl.

Otázka A (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`, 2026-11-11), doslovně:

> „Beyond the sections and glossary entries already being removed under your platform decision
> (ADR 0007), the public book still has about 29 whole pages about integrating your private
> platform: the 26-page section content/kompendium/aiad-integration/ ("AIAD integrace a detekce
> technik EA": NABLA pipeline, QEVE validation, AIAD agents; it includes
> black-team-ea-modeling.md, whose fate you were asked about earlier), the page
> 01-predmluva/vztah-k-platforme.md ("1.6 Vztah ke Prismatic Platformě"), and 2 section bridges
> from the Decision Engine and NABLA to the book. What should happen to them?“

Možnosti: „Remove all, with redirects (Recommended)“, „Keep, rewrite without platform“, „Remove
all except detection“. Odpověď doslovně: **„Remove all, with redirects (Recommended)“**.

Otázky B a C (AskUserQuestion, session `62aaa969-db73-4419-aeb1-23bc36e05c88`, 2026-11-11; znění
a odpovědi předala ta session doslovně):

> B: „Oddíl content/kompendium/aiad-integration/ (26 stránek pojmenovaných po artefaktech
> platformy) má 48 odkazů v textu na hesla, která se podle doplňků 2 a 3 mažou, a 87 souborů
> odkazuje do něj. Bez rozhodnutí o něm nemůže být build zelený. Co s ním?“

Možnosti: „Odstranit celý oddíl (doporučeno)“, „Ponechat, přepsat bez názvů“, „Ponechat i hesla,
která potřebuje“. Odpověď doslovně: **„Odstranit celý oddíl (doporučeno)“**.

> C: „Kapitola 01-predmluva/vztah-k-platforme.md (1.6 Vztah ke Prismatic Platformě) říká, že
> kniha není oddělitelná od kontextu svého vzniku. To je poctivé tvrzení o původu, ale jmenuje
> platformu. Co s ní?“

Možnosti: „Přepsat bez jména platformy (doporučeno)“, „Odstranit kapitolu“, „Ponechat beze
změny“. Odpověď doslovně: **„Přepsat bez jména platformy (doporučeno)“**.

Rozpor A × C ke kapitole 1.6, otázka D (AskUserQuestion, session
`5d49a595-d035-4bbe-b04a-d12695922860`, 2026-11-11), doslovně:

> „Two of your answers today conflict on one page, 01-predmluva/vztah-k-platforme.md ("1.6 Vztah
> ke Prismatic Platformě"; it says the book cannot be separated from the context it came from).
> In my question you chose "Remove all, with redirects" for the platform pages including this
> one; in 2e's question you chose "Přepsat bez jména platformy" for it. Which holds?“

Možnosti: „Rewrite without the name (Recommended)“, „Remove it“. Odpověď doslovně:
**„Rewrite without the name (Recommended)“**.

Platí tedy:

- Oddíl `aiad-integration/` (26 stránek, včetně `black-team-ea-modeling.md`) a dva mosty
  `section-bridges/bridge-platform-decision-engine-to-kompendium.md` a
  `bridge-platform-nabla-to-kompendium.md` se odstraní s přesměrováním na nejbližší kapitolu.
- Kapitola 1.6 zůstane a přepíše se bez jména platformy a jejích součástí; tvrzení o původu
  knihy zůstane.
- Mosty glosáře (`glossary-bridges/`), jejichž jediným předmětem je heslo odstraněné podle
  doplňků 2 a 3 (34 stránek), jdou s hesly; bez hesla nemají co propojit a jejich odkazy by
  rozbily build. Přesměrují na kapitolu, na kterou most ukazoval, jinak na glosář.
- Gate `platform-section` chytí i číslovaný nadpis („# 1.6 Vztah ke Prismatic…“).

## Amendment 2026-11-11 (5): odkazy na veřejný web platformy v patičkách

Otázka vlastníkovi (AskUserQuestion, session `5d49a595-d035-4bbe-b04a-d12695922860`,
2026-11-11), doslovně:

> „About 305 public Kompendium pages have a footer linking your public Prismatic promo site
> (prismatic-reality-com.github.io/prismatic-promo), including a "Developer Portal" item.
> content/about.md documents this as deliberate (pages that don't belong in the book link to the
> original public web), and the references cite that site as the book's earlier public edition.
> These are public links, not internal paths. After the platform removals (ADR 0007), what should
> happen to them?“

Možnosti: „Drop Developer Portal only (Recommended)“, „Drop all promo-site links“, „Keep all“.
Odpověď doslovně: **„Drop Developer Portal only (Recommended)“**.

Odkazy na dřívější veřejné vydání knihy zůstávají jako doložený původ. Položka „Developer
Portal“ zmizí ze všech patiček a `content/about.md` se upraví tak, aby popisoval, co web
skutečně dělá.
