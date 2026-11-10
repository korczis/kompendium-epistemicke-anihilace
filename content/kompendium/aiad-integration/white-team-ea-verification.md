+++
title = "White Team a konstruktivní ověřování proti EA"
description = "Jak White Team Prismatic Platform dokládá, že systém skutečně drží – formální důkazy, kontrakty, invarianty a kvalita důkazního záznamu – a proč „nenalezeno“ neznamená „doloženo“."
weight = 13

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "color-teams"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["red-team-ea-detection", "blue-team-ea-defense", "purple-team-ea-synthesis", "trinity-gate-ea-verification", "compliance-ea-regulatory-screening"]
toc = true
+++

# White Team a konstruktivní ověřování proti EA

[White Team](@/glossary/white-team.md) je jedním ze šesti [barevných týmů](@/glossary/color-teams.md) Prismatic Platform, softwarové platformy, z níž kniha vzešla. Jeho disciplínou je **konstruktivní ověřování**: dokazovat, že se systém chová správně, pomocí formálních důkazů, validace kontraktů a analýzy invariantů. Zatímco [Red Team](@/kompendium/aiad-integration/red-team-ea-detection.md) se snaží systém rozbít, White Team se snaží doložit, že drží. Tato stránka popisuje jeho roli ve vztahu k taxonomii epistemických útoků (EA), jeho druhou funkci – kontrolu kvality důkazního záznamu – a rozlišení, které z něj kniha přebírá pro klinickou a forenzní práci.

## Agent v kostce

Podle hesla glosáře tvoří White Team v době zápisu tři agenti na úrovních oprávnění L3–L4. Používá postupnou ověřovací metodiku, formální matematické důkazy, validaci kontraktů a analýzu invariantů. Jeho důkazy vstupují do rozhodování [Purple Teamu](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) o uzavření nálezů: kombinace útočných zjištění, obranného postavení a konstruktivních důkazů určuje, zda byla bezpečnostní vlastnost skutečně obnovena.

Původní verze této stránky zdůrazňuje i druhou funkci White Teamu – nezávislou kontrolu **kvality záznamu** o detekovaných událostech. White Team neposuzuje samotné techniky EA, ale to, zda je záznam o nich úplný a důvěryhodný: zda nechybějí časové značky, zda je úplný řetězec úschovy, zda jsou záznamy chráněny proti dodatečné změně. Výstupem jsou auditní zprávy uložené tak, aby je nebylo možné přepsat.

## Proč se týká technik EA

Mnoho technik popsaných v knize nepůsobí na obsah informací, ale na jejich **záznam a dohledatelnost**. [Tematická diverze](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) odvádí pozornost od důvodů rozhodnutí, [strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) přepisuje význam dřívějších výroků a terminální sekvence často zahrnují přepis biografie. Obranou proti nim je záznam, který nelze dodatečně změnit a který nese původ každé položky. White Team je na straně platformy strážcem právě této vlastnosti.

Druhá souvislost je epistemologická. Heslo glosáře uvádí, že kniha z White Teamu přebírá rozlišení, které je užitečné i v klinice a ve forenzní práci: **doložit, že něco drží** (konstruktivní důkaz), je jiný úkol než **nenajít, co by to rozbilo** (absence vyvrácení). Absence nalezené manipulace ještě není důkazem její nepřítomnosti; souvisí to s axiomem informativní absence v hesle [Axiomy NABLA](@/glossary/nabla-axioms.md).

## Jak pracuje

Konstruktivní ověřování má v informatice dlouhou tradici. Hoare (1969) navrhl axiomatický základ pro dokazování správnosti programů pomocí podmínek, které musí platit před a po provedení každé části. Meyer (1992) tuto myšlenku rozvinul do návrhu podle kontraktu, v němž každá součást výslovně deklaruje, co požaduje a co zaručuje. Analýza invariantů hledá vlastnosti, které musí platit za všech okolností. White Team tyto postupy uplatňuje na epistemické vlastnosti platformy – například že žádné přesvědčení nemůže vzniknout bez dohledatelného původu.

Kontrola kvality záznamu odpovídá zásadám, které kniha popisuje ve forenzní rovině: [řetězec úschovy důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md), [forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md) a [uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md). Pojem řetězce úschovy má v glosáři vlastní heslo ([chain of custody](@/glossary/chain-of-custody.md)).

Konstruktivní ověřování má i svou cenu. Formální důkazy a analýza invariantů jsou pracné a vyžadují přesně formulované specifikace; proto se uplatňují na vlastnosti, na nichž nejvíc záleží, a ne na všechno. Tato volba je sama rozhodnutím o prioritách, které platforma podle glosáře svěřuje strategickým úrovním řízení. Pro knihu je to připomínka, že ani v lidské praxi nelze doložit vše – je třeba vědět, které vlastnosti jsou nosné, a ty ověřovat nejpečlivěji.

## Spolupráce s dalšími agenty

White Team stojí mimo smyčku útoku a obrany, aby mohl být nestranným ověřovatelem. Ověřuje výstupy ostatních týmů, spolupracuje s [Trinity Gate](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) na vícestupňovém ověření, předává podklady [Compliance](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) pro regulatorní hlášení a jeho důkazy jsou podmínkou rozhodnutí [Purple Teamu](@/kompendium/aiad-integration/purple-team-ea-synthesis.md).

## Příklad

[Purple Team](@/glossary/purple-team.md) se chystá uzavřít nález, podle něhož obrana platformy nezachytila tvrzení bez dohledatelného původu. [Blue Team](@/glossary/blue-team.md) doplnil kontrolu a [Red Team](@/glossary/red-team.md) potvrdil, že původní scénář už neprojde. White Team se ptá jinak: neptá se, zda obranu dokážeme obejít, ale zda dokážeme **doložit**, že žádné přesvědčení bez původu nevznikne. Formuluje invariant („každý uzel přesvědčení má alespoň jednu hranu k důkazu s vyplněnou proveniencí“) a ověřuje jej na celé struktuře, včetně okrajových případů, které simulace nezkoušela. Zároveň zkontroluje auditní záznam opravy: má časové značky, je podepsaný, je uložen tak, aby nešel přepsat. Teprve s oběma doklady může Purple Team nález uzavřít.

V klinice má tento postup obdobu v rozdílu mezi „klient nepopsal nic, co by svědčilo o manipulaci“ a „klient má stabilní vztahy mimo dané prostředí, vlastní záznamy a možnost kdykoli odejít“. První věta je absencí vyvrácení, druhá je konstruktivním dokladem bezpečí.

## Co z toho plyne pro čtenáře knihy

Pro forenzní a klinickou praxi je nejcennější rozlišení mezi dvěma druhy jistoty. Dijkstra (1972) formuloval pro programy zásadu, že testování může ukázat přítomnost chyb, ale nikdy jejich nepřítomnost. Ve forenzním posudku to znamená, že závěr „nebyly zjištěny známky manipulace“ je nutné formulovat opatrně a doplnit popisem toho, co a jak bylo zkoumáno. V klinice to znamená, že konec péče se má opírat o doložené zdroje odolnosti, nikoli jen o to, že obtíže odezněly.

Druhým principem je **nedotknutelnost záznamu**. Lidé, kteří prošli manipulací, často zažili přepisování vlastní minulosti. Kniha jim doporučuje vést [paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md) a klinikům dokumentovat tak, aby záznam obstál i ve [forenzním použití](@/kompendium/forensic-legal/31-clinical-documentation-EA.md). White Team je technickou ilustrací téhož principu: co nelze dodatečně změnit, nelze ani dodatečně reinterpretovat.

## Dvě podoby jistoty v posudku

Rozlišení mezi konstruktivním důkazem a absencí vyvrácení má přímé použití při psaní posudků a zpráv. Formulace „nebyly zjištěny známky manipulace“ zní jako závěr, ale ve skutečnosti popisuje výsledek hledání, jehož rozsah čtenář nezná. Poctivější je uvést, co bylo zkoumáno, jakými postupy, s jakými omezeními a co by muselo být nalezeno, aby se závěr změnil. Takový zápis odpovídá i požadavku falsifikovatelnosti, který kniha uplatňuje na tvrzení obecně (Popper 1959): závěr, který nelze vyvrátit žádným myslitelným nálezem, nemá vypovídací hodnotu.

Opačně platí, že konstruktivní doklad bezpečí lze v klinice i v posudku sestavit z konkrétních prvků: stabilní vztahy mimo dotčené prostředí, přístup k vlastním záznamům a penězům, možnost odejít bez trestu, schopnost nesouhlasit bez obav. Kniha tyto prvky rozvádí v [prevenci izolace](@/kompendium/self-defense-guides/26-isolation-prevention.md) a v [akutním zajištění bezpečí](@/kompendium/recovery-protocols/acute-safety-establishment.md). White Team tak nabízí model, jak přejít od „nic jsme nenašli“ k „tohle prokazatelně drží“.

## Meze a otevřené otázky

White Team je retrospektivní: neodhaluje útoky v reálném čase, ale ověřuje vlastnosti a záznamy. Není odborníkem na techniky EA jako takové, nýbrž na důkazní standardy. Formální důkaz je vždy důkazem vzhledem ke specifikaci; pokud je specifikace neúplná, důkaz chrání jen to, co v ní je – a hledání mezer ve specifikaci je úkolem [Gray Teamu](@/kompendium/aiad-integration/gray-team-ea-edge-cases.md). Údaje o složení týmu se uvádějí jako stav v době zápisu.

## Literatura

- Popper, K. R. (1959). *The Logic of Scientific Discovery*. London: Hutchinson.
- Dijkstra, E. W. (1972). The humble programmer. *Communications of the ACM*, 15(10), 859–866.
- Hoare, C. A. R. (1969). An axiomatic basis for computer programming. *Communications of the ACM*, 12(10), 576–580.
- Meyer, B. (1992). Applying „design by contract“. *Computer*, 25(10), 40–51.

## Související

**Barevné týmy a agenti**

- [Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) – rozhoduje o uzavření na základě důkazů.
- [Trinity Gate a ověřování](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) – vícestupňové ověření přesvědčení.
- [Compliance a regulatorní screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) – přebírá auditní podklady.

**Pojmy**

- [White Team](@/glossary/white-team.md) – heslo glosáře.
- [Chain of custody](@/glossary/chain-of-custody.md) – řetězec úschovy důkazů.
- [Axiomy NABLA](@/glossary/nabla-axioms.md) – informativní absence.

**Kniha**

- [Řetězec úschovy důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) – forenzní obdoba.
- [Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md) – nedotknutelný záznam pro jednotlivce.
