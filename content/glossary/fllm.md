+++
title = "FLLM"
weight = 100
description = "FLLM (Flowbite LLM): pilíř doktríny Prismatic Platform pro čistotu stylů v uživatelském rozhraní. Co vyžaduje, jak se vynucuje a jak souvisí s Kompendiem."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality"]

[extra]
category = "doctrine"
abbreviation = "FLLM"
related_terms = ["doctrine", "nm-nd", "aiad", "quality-debt", "zero"]
keywords = ["FLLM", "Flowbite LLM", "CSS hygiena", "Tailwind", "doktrína", "Prismatic Platform"]
+++

## Definice

**FLLM** (*Flowbite LLM*) je jeden z pilířů [doktríny](@/glossary/doctrine.md) Prismatic Platform, softwarové platformy, z níž Kompendium vzešlo. Příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) jej řadí do domény **UI design** s poznámkou „CSS hygiena“. Pilíř se týká toho, jak se v kódu platformy píšou styly uživatelského rozhraní: místo ručně psaných stylů má rozhraní stát na sdíleném systému komponent (Flowbite) a utilitních třídách frameworku Tailwind CSS.

Zkratka FLLM tedy **nepatří do terminologie epistemické anihilace**. V knize se objevuje proto, že kniha vznikla jako součást platformy a některé její stránky na platformní pravidla odkazují.

## Původ a kontext pojmu

Pilíř stojí na dvou nástrojích webového vývoje. **Tailwind CSS** je framework, který místo pojmenovaných stylových tříd („tlačítko-hlavní“, „karta-novinky“) nabízí velkou sadu malých utilitních tříd s jedním účelem – okraj, barva, velikost písma, rozestup. Vzhled prvku se skládá přímo v šabloně z těchto tříd a všechny hodnoty pocházejí z jedné sdílené škály. **Flowbite** je knihovna hotových komponent postavená na Tailwindu: navigace, formuláře, tabulky, dialogy, karty.

Název spojuje Flowbite se zkratkou LLM (*large language model*, velký jazykový model). Platforma rozsáhle pracuje s automatizovanými agenty, kteří kód rozhraní generují; provozní dokumentace význam spojení blíže nerozvádí, a heslo ho proto nevykládá dál, než ukazuje sám obsah pilíře – pravidla čistoty stylů, která platí stejně pro člověka i pro agenta.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy pilíř FLLM zakazuje nebo omezuje:

- vložené styly přímo v šablonách (atribut `style="…"`);
- bloky `<style>` uvnitř šablon;
- vlastní definice tříd ve zdrojových souborech CSS.

Preferovány jsou utilitní třídy Tailwindu (případně jejich skládání direktivou `@apply`). Dokumentace výslovně uvádí, že kontrola **neověřuje**, zda je použita konkrétní komponenta Flowbite; hlídá jen čistotu stylů. Vynucení probíhá jako upozornění při commitu a jako blokující kontrola v CI, tedy před sloučením změny.

V praxi to znamená, že změna, která do šablony přidá třeba ručně nastavenou barvu pozadí nebo vlastní blok stylů, při commitu vyvolá varování a v CI neprojde. Autor ji musí přepsat do utilitních tříd, které čerpají z jednotné škály barev a rozestupů.

Obecný příklad: agent dostane za úkol přidat do přehledu upozornění na neověřený zdroj. Nejrychlejší cestou by bylo vložit do šablony vlastní červený rámeček s ručně zvolenou barvou. Kontrola FLLM takovou změnu nepustí dál; agent místo toho použije komponentu upozornění z knihovny Flowbite s barvou ze sdílené škály. Výsledek vypadá stejně jako ostatní upozornění na platformě, správně se zobrazí v tmavém režimu a při pozdější změně barevného schématu se upraví spolu s nimi. Uživatel tak pozná varování podle známého tvaru a barvy, ne podle toho, jak si ho který autor zrovna nakreslil.

## Mechanismus: proč takové pravidlo existuje

Ručně psané styly se v rozsáhlém projektu snadno rozrůstají, navzájem si odporují a vytvářejí skrytý technický dluh (viz [quality debt](@/glossary/quality-debt.md)). Sdílený systém komponent dává rozhraní jednotný vzhled, usnadňuje přístupnost a umožňuje měnit vzhled na jednom místě. FLLM je tedy pravidlem udržitelnosti, nikoli estetiky.

Strukturálně jde o tři efekty:

1. **Jediný zdroj hodnot** – barvy, velikosti a rozestupy pocházejí z jedné škály, takže tmavý režim, kontrast nebo změna písma se upraví jednou a platí všude.
2. **Lokálnost změny** – styl zapsaný třídami v šabloně je vidět tam, kde se používá; nevzniká vzdálený soubor stylů, jehož změna nečekaně rozbije jinou stránku.
3. **Kontrolovatelnost** – zakázané vzory (atribut `style`, blok `<style>`) jsou snadno strojově rozpoznatelné, takže pravidlo lze vynutit automaticky.

## Odlišení

FLLM neříká, jak má rozhraní vypadat, ale jak se má vzhled zapisovat; dvě aplikace s odlišnou vizuální identitou mohou pilíř splňovat obě. Stejně tak je třeba ho odlišit od design systému. Design systém – soubor komponent, typografie a pravidel rozvržení, který Brad Frost popsal jako skládání rozhraní z malých, opakovaně použitelných prvků do větších celků (Frost 2016) – je obsahem; FLLM je kontrola, že se kód od tohoto obsahu neodchyluje ručními výjimkami.

Od sousedních pilířů [ZERO](@/glossary/zero.md) a [SEAL](@/glossary/seal.md) se FLLM liší předmětem i silou vynucení: ZERO a SEAL chrání běh a bezpečnost systému a blokují už commit, FLLM chrání udržitelnost rozhraní a blokuje až sloučení změny. A konečně se pilíř netýká množství grafiky. Přebujelost diagramů a efektů, kterou kniha nazývá „estetickou inflací“, řeší jiné úvahy, o nichž pojednává následující oddíl.

## Význam pro Kompendium

Kniha FLLM přímo nevyužívá jako pojem, ale jeho logika se v ní objevuje dvakrát:

1. **Web knihy** je postaven na stejném přístupu – na Tailwindu a komponentách Flowbite – a pravidla repozitáře knihy vyžadují, aby uživatelské rozhraní z tohoto systému vycházelo.
2. **Metodicky**: [stránka o propojení technik s vizualizacemi](@/kompendium/section-bridges/bridge-techniques-to-visualizations.md) varuje před „estetickou inflací“ – přidáváním diagramů jen proto, že vypadají dobře – a odvolává se přitom na FLLM. Vizualizace v knize má mít funkci (orientace, opora poznávání, klinická referenční karta), jinak patří do příloh.

Tato druhá paralela je interpretační: FLLM sám o vizualizacích v knize nerozhoduje.

Repozitář knihy přitom nepřebírá kontrolu FLLM doslova. Má vlastní pravidlo, podle něhož šablony webu vycházejí z hotových rozvržení a bloků Flowbite, a vlastní ověření, které změnu šablony porovná s tímto základem. Smysl je stejný jako na platformě: vzhled se nemá rozpadat na stovky drobných výjimek, které by čtenáře nutily na každé stránce znovu hledat, kde je navigace, kde obsah a kde varování.

Jednotné a klidné rozhraní má u knihy tohoto druhu i věcný důvod. Čtenáři jsou často lidé, kteří o manipulaci čtou kvůli vlastní zkušenosti nebo kvůli klientovi v krizi; rozhraní, které nepřekvapuje, nekřičí barvami a dobře se čte v tmavém i světlém režimu, snižuje zátěž, s níž čtenář k textu přichází; zásady přístupnosti webového obsahu na tuto potřebu pamatují požadavky na kontrast, čitelnost a předvídatelné ovládání (W3C 2018). Interaktivní vizualizace knihy (např. [mapa postupu technik EA-1](@/kompendium/03-zakladni-kategorie/visualizations.md) nebo [klinická cesta zotavení](@/kompendium/06-klinicke-aplikace/visualizations.md)) proto používají stejné barevné a typografické škály jako zbytek webu a jejich barvy nesou význam (fáze, úroveň rizika), ne ozdobu.

Interpretačně lze v tématu knihy najít i hlubší ozvěnu: jednotný, předvídatelný rámec, v němž se jednotlivé prvky nemohou samy „přebarvit“, je opakem prostředí, kde se pravidla nepozorovaně mění podle toho, kdo zrovna mluví – jevu, který kniha popisuje u [strategické reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md).

## Meze přenosu

Stejně jako u ostatních pilířů doktríny je třeba rozlišovat mezi pravidly pro software a pravidly pro práci s lidmi. Požadavek „žádné vlastní styly“ dává smysl v kódu, ale nemá obdobu v klinické nebo terapeutické praxi a Kompendium ho tak nepoužívá. Jednotnost je v rozhraní hodnotou; u lidí je hodnotou naopak rozmanitost způsobů, jak vyjádřit vlastní zkušenost.

Otevřená zůstává i technická otázka: pilíř hlídá čistotu zápisu, ale nezaručuje přístupnost. Rozhraní může být zapsané čistě a přesto špatně čitelné – kontrast, velikost písma a ovladatelnost klávesnicí se musí ověřovat zvlášť. Stejně tak pilíř nezabrání tomu, aby se jednotným, uhlazeným vzhledem prezentoval obsah, který je sám zavádějící: profesionální podoba stránky není důkazem její důvěryhodnosti. Tuto past – důvěru odvozenou z formy místo z obsahu – kniha popisuje u technik, které budí dojem odbornosti, například u [iluzorní komplexity](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md).

## Literatura

- Frost, B. (2016). *Atomic Design*. Brad Frost.
- W3C (2018). *Web Content Accessibility Guidelines (WCAG) 2.1*. World Wide Web Consortium – obecný rámec přístupnosti, který čistota stylů usnadňuje, ale nenahrazuje.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů, k nimž FLLM patří.
- [Doktrína NM/ND](@/glossary/nm-nd.md) – zastřešující zásada nulové tolerance.
- [AIAD](@/glossary/aiad.md) – standard definic agentů s povinným blokem vynucení doktríny.
- [Quality Debt](@/glossary/quality-debt.md) – dluh, kterému pilíř předchází.
- [ZERO](@/glossary/zero.md) – sousední pilíř pro běhovou bezpečnost.

**Kniha**

- [Most mezi technikami a vizualizacemi](@/kompendium/section-bridges/bridge-techniques-to-visualizations.md) – varování před estetickou inflací.
- [Vizualizace pro sekci 06](@/kompendium/06-klinicke-aplikace/visualizations.md) – příklad vizualizace s funkční barvou.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
- [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – jak kniha s platformou souvisí.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – terminologický rejstřík.
