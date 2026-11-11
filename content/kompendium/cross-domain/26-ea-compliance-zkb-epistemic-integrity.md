+++
title = "Compliance: český zákon o kybernetické bezpečnosti"
description = "Český rámec kybernetické bezpečnosti od zákona č. 181/2014 Sb. po transpozici NIS2: role NÚKIB, bezpečnostní opatření, varování a integrita informací v rozhodování."
weight = 260

[taxonomies]
tags = ["kompendium", "cross-domain", "compliance"]
categories = ["academic"]

[extra]
related_terms = ["25-ea-compliance-nis2-integrity", "21-ea-security-supply-chain-narrative", "22-ea-security-incident-response-narrative", "27-ea-compliance-gdpr-narrative-protection"]
toc = true
+++

Česká republika patřila k zemím, které kybernetickou bezpečnost upravily samostatným
zákonem dřív, než to vyžadovalo unijní právo. Zákon č. 181/2014 Sb., o kybernetické
bezpečnosti, zavedl povinnosti pro provozovatele kritické informační infrastruktury
a významných informačních systémů a vytvořil rámec, na nějž navázala transpozice směrnic
NIS a NIS2. Tato stránka shrnuje český rámec a dívá se na něj z pohledu knihy: jak zákon
a praxe kolem něj pracují s informacemi, z nichž se rozhoduje – a kde vzniká riziko,
že rozhodnutí stojí na zkresleném obrazu.

## Doména a problém

Zákon č. 181/2014 Sb. stanovil okruh povinných osob, povinnost zavést bezpečnostní opatření
a hlásit kybernetické bezpečnostní incidenty a upravil reaktivní opatření, včetně
**varování** před hrozbou. Prováděcí vyhláška č. 82/2018 Sb., o bezpečnostních opatřeních,
kybernetických bezpečnostních incidentech, reaktivních opatřeních, náležitostech podání
v oblasti kybernetické bezpečnosti a likvidaci dat (vyhláška o kybernetické bezpečnosti),
podrobně popsala organizační a technická opatření – od řízení rizik a bezpečnostní politiky
po řízení dodavatelů a záznam událostí. Od srpna 2017 je ústředním správním orgánem
Národní úřad pro kybernetickou a informační bezpečnost (NÚKIB).

Transpozicí směrnice NIS2 byl přijat nový zákon o kybernetické bezpečnosti, který starý
zákon nahradil a výrazně rozšířil okruh povinných subjektů, rozdělil je podle režimů
povinností a posílil odpovědnost vedení (k unijnímu rámci viz [NIS2 a integrita rozhodování](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md)).
Pro organizace, které do režimu vstupují poprvé, to znamená vybudovat procesy, které dříve
neměly – a zároveň riziko, že se budování omezí na dokumentaci.

Zvláštním nástrojem českého rámce je **varování** NÚKIB. Nejznámějším je varování z prosince
2018 před používáním technických a programových prostředků společností Huawei a ZTE
v systémech podléhajících zákonu. Varování ukládá povinným osobám zohlednit hrozbu
v řízení rizik; vyvolalo zároveň rozsáhlou veřejnou debatu, v níž se mísily bezpečnostní,
ekonomické a politické argumenty (viz [dodavatelský řetězec](@/kompendium/cross-domain/21-ea-security-supply-chain-narrative.md)).

## Průnik s epistemickou anihilací

Bezpečnostní opatření podle vyhlášky zahrnují řadu prvků, které chrání **integritu informací,
z nichž organizace rozhoduje**: záznamy o událostech, řízení přístupu, oddělení rolí,
zálohování, dokumentaci. Z pohledu knihy jsou to institucionální obdoby „paměťového archivu“
– vnějších opor, které umožňují ověřit, co se skutečně stalo, i když se o tom vedou spory
nebo když se někdo pokouší realitu přepsat (srov. [Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md)).
Organizace bez spolehlivých záznamů je vůči manipulaci zranitelná stejně jako člověk, který
nemá jak doložit vlastní vzpomínky.

Druhým průnikem jsou **kombinované útoky**, v nichž se technický incident spojí s informační
kampaní – například útok na dodavatele vody nebo energie doprovázený fámami o ohrožení
obyvatel. Český rámec počítá s hlášením kybernetických incidentů, informační rozměr je
ale řešen spíše v rámci krizové komunikace a strategických dokumentů státu. Kniha tento
rozměr popisuje v souvislosti s [obranou proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md).

Třetím průnikem je **autorita varování**. Varování státního orgánu má silný účinek: mění
rozhodování organizací a ovlivňuje pověst dodavatele. Pro organizaci je obtížné posoudit
jeho podklady, které bývají zčásti neveřejné. Kniha na jiných místech varuje před
přenášením úsudku na autoritu bez možnosti přezkumu; v tomto případě je odpovědí soudní
přezkum a povinnost organizace promítnout varování do vlastní, zdůvodněné analýzy rizik –
nikoli ho mechanicky převzít ani ignorovat.

## Rozpoznávací znaky

Na to, že soulad se zákonem je formální, ukazuje **dokumentace bez provozní stopy**
(politiky existují, ale záznamy o jejich uplatňování chybí), **analýza rizik beze změn**
po řadu let, **logy, které nikdo nevyhodnocuje**, **nejasné odpovědnosti** mezi vedením,
manažerem kybernetické bezpečnosti a dodavateli, a **chybějící hlášení** v organizaci,
která má rozsáhlé systémy – absence hlášení může znamenat absenci detekce. U varování
NÚKIB je varovným znakem, když organizace varování **formálně vezme na vědomí**, ale
do řízení rizik ho nepromítne.

## Rámec: právo, standardy a odpovědnost

Vedle zákona a prováděcích předpisů jsou pro praxi důležité metodiky a doporučení NÚKIB
a normy řady ISO/IEC 27000. Pro zpracování osobních údajů v bezpečnostních záznamech platí
GDPR a zákon č. 110/2019 Sb., o zpracování osobních údajů. Rozhodnutí NÚKIB, včetně varování,
podléhají soudnímu přezkumu ve správním soudnictví; to je důležitá pojistka, aby nástroj
s velkým dopadem na trh zůstal přezkoumatelný.

## Ochranná opatření

Pro organizace v režimu zákona je klíčové budovat opatření, která skutečně fungují: **logy,
které se vyhodnocují**, **analýzu rizik, která se mění s okolnostmi** (včetně varování),
**pravidelné testování** záloh a postupů, **jasnou odpovědnost** s přímou cestou k vedení
a **cvičení** kombinovaných scénářů, v nichž technický incident doprovází informační kampaň.
Z pohledu integrity informací je důležité **chránit samotné záznamy** – kdo k nim má přístup,
kdo je může měnit a jak se pozná, že byly změněny (srov. [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md)
a [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md)).

## Lidský rozměr a zotavení

Manažeři kybernetické bezpečnosti v menších organizacích bývají v roli osamělých hlídačů:
nesou formální odpovědnost, ale nemají rozpočet ani autoritu. Tento stav vede k vyhoření
a k pokušení „vyplnit papíry“. Organizace, které chtějí skutečnou bezpečnost, jim musí dát
přístup k vedení a podporu. Pro veřejnost, které se kombinované útoky týkají, je důležitá
srozumitelná a pravdivá komunikace, která nevyvolává paniku a nepodceňuje riziko.

## Přesah do dalších oborů

Princip, že spolehlivé záznamy chrání před přepisováním reality, se uplatňuje ve zdravotnictví
(zdravotnická dokumentace jako ochrana pacienta i lékaře), v justici (spis a jeho
neporušenost), ve veřejné správě (archivnictví a spisová služba) i ve vědě (laboratorní
deníky a správa dat). Ve všech případech platí, že záznam, který lze nepozorovaně změnit,
nechrání nikoho. Organizace, které prošly zkušeností s vnitřní manipulací – přepisovanými
zápisy z porad, ztracenými e-maily –, často teprve zpětně zjistí, že spolehlivé záznamy
byly jejich nejcennější obranou (srov. [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)).

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Vodárenská společnost v režimu zákona zaznamená výpadek
řídicího systému. Během hodiny se na sociálních sítích objeví tvrzení, že „hackeři otrávili
vodu“. Společnost má cvičený postup: technický tým izoluje systém a ověřuje, zda byly
ovlivněny procesy úpravy vody; incident je nahlášen; komunikační tým zveřejní, co je známo,
a hygienická služba provede nezávislé rozbory. Záznamy řídicího systému, které jsou chráněny
proti změně, ukážou, že útočník se k řízení dávkování nedostal. Tato informace, doložená
záznamy a rozbory, uklidní situaci rychleji než jakékoli ujišťování.

Při vyhodnocení společnost konstatuje, že bez neměnných záznamů by nemohla doložit, co
se v systému dělo, a veřejnost by musela věřit jen jejímu slovu – v době, kdy kampaň
tvrdila opak.

## Meze a otevřené otázky

Rozšíření okruhu povinných subjektů přináší povinnosti i organizacím s malou kapacitou;
riziko compliance na oko je u nich vysoké. Otevřenou otázkou je, jak stát podpoří menší
subjekty, aby budovaly skutečnou bezpečnost, a jak propojit kybernetickou bezpečnost
s ochranou proti informačním operacím, které technický rámec zákona přímo neřeší.

## Literatura

- Zákon č. 181/2014 Sb., o kybernetické bezpečnosti a o změně souvisejících zákonů (zákon o kybernetické bezpečnosti).
- Vyhláška č. 82/2018 Sb., o kybernetické bezpečnosti.
- NÚKIB (2018). Varování před hrozbou spočívající v užívání technických a programových prostředků společností Huawei a ZTE.
- Směrnice (EU) 2022/2555 (NIS2).

## Související

**Mezioborové mosty**

- [NIS2 a integrita rozhodování](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md) – unijní rámec.
- [Dodavatelský řetězec](@/kompendium/cross-domain/21-ea-security-supply-chain-narrative.md) – varování o dodavatelích.
- [Narativ při reakci na incident](@/kompendium/cross-domain/22-ea-security-incident-response-narrative.md) – komunikace během incidentu.
- [GDPR a ochrana před chybným narativem](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md) – osobní údaje v záznamech.

**Organizace a sebeobrana**

- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md) – spolehlivé záznamy.
- [Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md) – osobní obdoba.

**Mezinárodní rámec**

- [ČR právo – EA rámec](@/kompendium/international/22-czech-law-EA/index.md) – český právní kontext.
- [Česká republika – vzorce EA](@/kompendium/international/1-czech-rep-EA/index.md) – národní kontext.
