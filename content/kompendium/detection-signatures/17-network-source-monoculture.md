+++
title = "Detekční signatura: Monokultura zdrojů"
description = "Síťová signatura: člověk nebo komunita čerpá informace z jediného zdroje či úzce propojeného shluku zdrojů, takže chybí nezávislé srovnání a oprava."
weight = 17

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["15-behavioral-asymmetric-disclosure", "16-behavioral-emotional-modulation", "18-network-citation-circularity", "19-network-amplification-asymmetry"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Monokultura zdrojů je stav, kdy jednotlivec nebo komunita získává informace o důležitých tématech převážně z jednoho zdroje nebo z malé skupiny zdrojů, které jsou navzájem propojené (vlastnicky, personálně, ideově nebo citačně) a nejsou na sobě nezávislé. Navenek se může jevit jako pestrá – mnoho kanálů, webů, autorů – ale všechny přenášejí tentýž signál.

Signatura odpovídá glosářovému pojmu [epistemická monokultura](@/glossary/epistemicka-monokultura.md) a na úrovni manipulace technice [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md). Užitečné je rozlišení C. Thi Nguyena (2020) mezi **epistemickou bublinou**, kde ostatní hlasy chybějí, protože se k nim člověk nedostane, a **ozvěnovou komorou**, kde ostatní hlasy jsou aktivně zdiskreditovány (viz [epistemic bubble](@/glossary/epistemic-bubble.md)).

## Co signatura indikuje

Spolehlivost poznání stojí na [pluralitě signálů](@/glossary/signal-plurality.md): chyba jednoho zdroje je opravena jiným, nezávislým zdrojem. Monokultura tuto opravu odstraňuje. Pokud jediný zdroj chybuje nebo záměrně klame, chyba se nikde nezachytí. Navíc se monokultura sama posiluje: kdo dostává jen jeden výklad, považuje ho za samozřejmý, a odlišné zdroje mu připadají podezřelé.

Pro manipulaci je monokultura **infrastrukturou**: umožňuje [injekci narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md), protože není nikdo, kdo by ji zachytil, a činí [cirkularitu citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) neviditelnou.

## Pozorovatelné markery

### Obsahové a lingvistické

- Stejné formulace, metafory a příklady se objevují ve všech zdrojích, které člověk sleduje.
- Odlišné zdroje jsou zmiňovány jen v hodnotících nálepkách („mainstream“, „[propaganda](@/glossary/propaganda.md)“, „lživá média“), nikoli obsahově.
- Člověk umí argumenty druhé strany reprodukovat jen ve zkreslené podobě.

### Síťové a časové

- Většina sledovaného obsahu pochází od několika málo uzlů; ostatní zdroje je přeposílají.
- Zdroje se navzájem citují a odkazují, ale vazby ven z jejich shluku jsou řídké.
- Zprávy se v celém shluku objevují téměř současně, což ukazuje na společný původ.

### Aktérské a institucionální

- Zdroje sdílejí vlastníka, financování nebo personální obsazení.
- Ve skupině je sledování „cizích“ zdrojů nežádoucí nebo trestané.
- U organizace se rozhodnutí opírají o jediný typ dat nebo jediného poradce, bez nezávislého ověření.

## Detekční kritéria

1. Pro klíčová témata lze identifikovat dominantní zdroj nebo shluk zdrojů, který tvoří většinu konzumace.
2. Zdroje ve shluku nejsou nezávislé – sdílejí původ, vlastnictví nebo se převážně citují navzájem.
3. Kontakt s nezávislými zdroji je řídký, zprostředkovaný (jen přes výklad shluku) nebo odrazovaný.

Míru koncentrace lze kvantifikovat (např. podílem hlavních zdrojů nebo entropií rozložení zdrojů), ale bez pevné hranice: výsledek se srovnává s výchozím stavem dané osoby nebo s podobnými uživateli. Pozitivní je signatura při splnění všech tří kritérií.

## Odlišení od benigních podob

- **Specializace**: odborník v úzkém oboru čte nemnoho specializovaných zdrojů; ty však bývají vzájemně kritické a otevřené vnějšímu přezkumu.
- **Omezené možnosti**: lidé v odlehlých oblastech, s jazykovou bariérou nebo bez přístupu k internetu mají méně zdrojů ne vlastní volbou ani manipulací.
- **Přirozená preference**: každý má oblíbené zdroje; monokultura nastává, až když zdroje nejsou nezávislé a jiné jsou vytlačeny.
- **Důvěra v instituci**: spoléhání na jediný oficiální zdroj (např. zdravotní autoritu) v krizi může být racionální, pokud je tento zdroj otevřený přezkumu a opravám.

## Dopad na jednotlivce a klinický rozměr

Monokultura sama není klinickým stavem. U jednotlivce se projevuje zúžením myšlení na jeden výkladový rámec, obtíží porozumět lidem mimo shluk a rostoucím odcizením od blízkých, kteří zdroje nesdílejí. Pokud k tomu přistoupí strach, podezíravost a přesvědčení o pronásledování, je třeba odlišit:

- **sdílené skupinové přesvědčení**, které je doložitelné v materiálech zdroje a které osoba sdílí s ostatními členy komunity;
- **paranoidní nebo bludné myšlení**, které je idiosynkratické a obvykle zasahuje i mimo témata zdroje (srov. [diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md)).

Obě možnosti se mohou překrývat: zranitelný člověk se může do monokultury dostat snáze a monokultura může existující potíže zhoršit.

## Riziko falešné pozitivity

- Hodnotitel sám žije v nějaké informační bublině a za monokulturu může označit jen zdroje, s nimiž nesouhlasí.
- Data o konzumaci bývají neúplná (offline zdroje, osobní rozhovory).
- Koncentrace na několik zdrojů je u většiny lidí běžná; signatura vyžaduje navíc nezávislost a vytlačení alternativ.

## Validační test

**Mapa zdrojů.** S osobou nebo z dostupných dat se sestaví seznam zdrojů, z nichž čerpá k danému tématu, a ke každému se doplní: kdo ho vlastní nebo financuje, odkud čerpá on sám a koho cituje. Vznikne graf (srov. [graph theory](@/glossary/graph-theory.md)), na němž je vidět, zda zdroje tvoří uzavřený shluk bez přemostění. Doplňkovou otázkou je, zda osoba dokáže jmenovat zdroj s jiným názorem, který považuje za poctivý.

## Dokumentace v praxi

Pro výzkumné a OSINT účely zaznamenat seznam zdrojů s datem, vazby mezi nimi a metodu, jakou byly zjištěny (viz [OSINT](@/glossary/osint.md) a [síťová analýza](@/kompendium/research-methodology/network-analysis-EA.md)). V klinickém kontextu stačí popis informačního prostředí klienta a jeho změny v čase, bez hodnocení obsahu zdrojů.

## Doporučený postup

**Pro zasaženou osobu:** k důležitým tématům přidat aspoň dva zdroje, které jsou nezávislé na stávajících a na sobě navzájem; číst je v plném znění, ne přes výklad „svých“ zdrojů. Viz [triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md), [kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md) a [rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md).

**Pro profesionála:** nekritizovat zdroje klienta přímo – v ozvěnové komoře to bývá vykládáno jako potvrzení. Ptát se, jak klient ověřuje informace, a společně hledat zdroje, které by sám uznal za poctivé.

**Pro organizaci:** u rozhodnutí s vysokou vahou vyžadovat aspoň dva nezávislé zdroje dat a kontrolu, zda jsou skutečně nezávislé (srov. [EA × Due Diligence: Source Weighting](@/kompendium/cross-domain/10-ea-dd-source-weighting.md)).

## Ilustrativní příklad

*Anonymizovaný kompozit.* Rodina si všimne, že otec mluví o zdravotních tématech jen výrazy z několika internetových kanálů. Při bližším pohledu se ukáže, že kanály, které považuje za „různé názory“, sdílejí tytéž hosty, odkazují na tentýž web a navzájem se citují. Syn s otcem nevede spor o obsah, ale společně se podívají, odkud kanály čerpají. Otec sám navrhne přidat zprávy své praktické lékařky, které důvěřuje. Postupně se jeho zdroje rozšíří, i když názory se mění pomalu.

## Limity a otevřené otázky

- Nezávislost zdrojů je obtížné ověřit; vazby bývají skryté.
- Algoritmicky řízené prostředí vytváří monokulturu i bez úmyslu konkrétního aktéra (viz [EA-9.3.3 Feed Personalization Bias](@/kompendium/techniques/ea-9-3-3-feed-personalization-bias.md)).
- Rozšíření zdrojů nemusí vést ke změně názoru; cílem je obnovit schopnost srovnání, ne vnutit závěr.

## Související

**Sourozenecké signatury**

- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – zdánlivá pestrost zdrojů, které se citují navzájem.
- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – co monokultura umožňuje.
- [Akcelerace izolace](@/kompendium/detection-signatures/13-behavioral-isolation-acceleration.md) – sociální podoba téhož zúžení.

**Techniky a pojmy**

- [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) – řízení toho, co se člověk dozví.
- [Epistemic Bubble](@/glossary/epistemic-bubble.md) – bublina a ozvěnová komora.
- [Signal Plurality](@/glossary/signal-plurality.md) – princip nezávislých signálů.

**Obrana a metodika**

- [Sebe-obrana: Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – ověřování z nezávislých zdrojů.
- [EA × OSINT: Cross-Source Triangulation](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – metodika pro vyšetřovatele.

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
