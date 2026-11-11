+++
title = "Bridge: Sanctions screening (sankční prověrka)"
description = "Most mezi heslem sankční prověrka a knihou: porovnávání se sankčními seznamy, chybné shody jmen, autorita seznamu bez dokladů, skrývání za prostředníky a právo na přezkum."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "sanctions-screening", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["sanctions-screening", "entity-resolution", "due-diligence", "compliance-framework", "osint", "risk-score"]
glossary_target = "sanctions-screening"
toc = false
+++

# Bridge: Sanctions screening (sankční prověrka)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Sankční prověrka](@/glossary/sanctions-screening.md) (*sanctions screening*) je regulatorní proces
systematického porovnávání osob, organizací, plavidel, adres a dalších subjektů s oficiálními sankčními
seznamy, které vedou státní a nadnárodní orgány – zejména s konsolidovaným seznamem Evropské unie,
seznamem SDN amerického úřadu OFAC, seznamem britského úřadu OFSI a konsolidovaným seznamem Rady
bezpečnosti OSN. Prověrka odhaluje subjekty, na něž se vztahují restriktivní opatření – zmrazení
majetku, zákaz cestování, obchodní omezení –, a souvisí s identifikací politicky exponovaných osob.
Mezinárodní standardy pro tuto oblast stanoví doporučení Finančního akčního výboru (FATF 2012).

V Evropské unii se omezující opatření přijímají v rámci společné zahraniční a bezpečnostní politiky
(článek 29 Smlouvy o Evropské unii) a provádějí nařízeními podle článku 215 Smlouvy o fungování EU. Na
národní úrovni se v České republice provádění mezinárodních sankcí řídí zákonem č. 69/2006 Sb., o
provádění mezinárodních sankcí, a povinnosti povinných osob souvisejí se zákonem č. 253/2008 Sb.,
o některých opatřeních proti legalizaci výnosů z trestné činnosti a financování terorismu. Heslo patří
do kontextu compliance; kniha ho zařazuje mezi mosty kvůli jeho epistemickým rizikům.

## Sankční prověrka očima knihy

Prvním rizikem je **chybná shoda jmen**. Prověrka porovnává jména, která mohou být přepsána z jiných
písem různými způsoby, mohou být běžná nebo neúplná. Christen (2012) v přehledu metod párování
záznamů ukazuje, že mezi chybnými shodami a přehlédnutými shodami existuje nevyhnutelný kompromis:
přísnější pravidla snižují jedny a zvyšují druhé. V sankční prověrce mají obě chyby vážné následky –
přehlédnutí umožní obejití sankcí, chybná shoda může nevinnému člověku zablokovat účet nebo platbu.
Kniha tento problém rozebírá v kapitole [Sankční seznamy a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md)
a v mostu [Bridge: Entity Resolution](@/kompendium/glossary-bridges/bridge-entity-resolution.md).

Druhým rizikem je **autorita seznamu**. Zápis na sankční seznam je rozhodnutím orgánu, které má právní
účinky, ale jeho podklady bývají veřejnosti nedostupné. Soudní dvůr EU v rozsudku ve věci Kadi (2008)
rozhodl, že ani provedení rezolucí Rady bezpečnosti OSN nevylučuje přezkum unijního aktu z hlediska
základních práv, včetně práva na obhajobu a účinnou soudní ochranu. Pro knihu je to strukturní
připomínka: seznam je tvrzením, které musí být doloženo, ne skutečností, kterou stačí převzít. Fricker
(2007) popsala, jak instituce svou autoritou mohou umlčet výpověď dotčeného; kdo je na seznamu chybně,
musí svou nevinu dokazovat proti autoritě, jejíž podklady nezná.

Třetím rizikem je **opačná manipulace**: sankcionované subjekty se skrývají za prostředníky, řetězci
společností a nominálními vlastníky, aby prověrkou prošly. Kniha tyto vzorce rozebírá v kapitole
[UBO Disinformation Patterns](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md).
Obě strany – chybná shoda i úspěšné skrytí – ukazují, že prověrka není mechanickým porovnáním, ale
úsudkem v podmínkách nejistoty.

## Kde se pojem v knize vyskytuje

Rozpoznávání vzorců za hranicí pravidel v boji proti praní peněz rozvádí kapitola
[AML – Pattern Recognition Beyond Rules](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md)
a ověřování narativu klienta kapitola [KYC – Narrative Validation Layer](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md).

## Od pojmu k praxi

### Rozpoznání

Kniha upozorňuje na vzorce, které ukazují, že prověrka selhává. Prvním je **automatické přijetí shody**
bez ověření dalších identifikátorů – data narození, státní příslušnosti, adresy. Druhým je **plošné
odmítání** celé skupiny klientů z obavy před rizikem, které vede k vyloučení lidí z finančních služeb
podle země původu nebo jména. Třetím je **dezinformace o sankcích**: nepravdivé tvrzení, že určitá
osoba nebo firma je sankcionována, šířené k poškození její pověsti. U všech tří je rozhodující otázka,
zda závěr stojí na ověřeném zápisu a na více shodných identifikátorech.

### Obrana

Obranou je dvoustupňový postup: automatické porovnání vytipuje možné shody a člověk je ověří proti
dalším identifikátorům. Rozhodnutí o shodě má být zapsáno i s důvody, aby šlo zpětně přezkoumat. Pro
osobu, která je chybně označena, je obranou žádost o informaci, na základě čeho k označení došlo, a
uplatnění práva na opravu údajů podle nařízení (EU) 2016/679 (GDPR); u skutečného zápisu na seznam
jsou to opravné prostředky, které unijní právo k zápisu poskytuje.

### Náprava

Když chybná shoda poškodí člověka – zablokuje platby, zpozdí výplatu, zmaří obchod –, náprava zahrnuje
rychlé odblokování, opravu záznamu ve všech navazujících systémech a sdělení, co se stalo. Chybná shoda
by se neměla opakovat při každé další prověrce; kniha doporučuje zaznamenat ověřenou neshodu, aby se
z ní stala trvalá výjimka.

### Rámec pro profesionály

Pro pracovníky compliance plyne z knihy zásada, že skóre shody je hypotézou, ne rozhodnutím, a že
chybná shoda je újmou s právními následky. Pro právníky a soudce je podstatné, že výpis z prověrkového
nástroje není důkazem o totožnosti osoby se sankcionovaným subjektem; spolehlivost lze zpochybnit
otázkou po pravidlech shody. Kniha k tomu odkazuje na obecné riziko automatizovaného rozhodování v
technice [EA-9.6.1 Algoritmické zkreslení rozhodování](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md).

## Odlišení od příbuzných pojmů

Sankční prověrku je třeba odlišit od [sjednocování entit](@/glossary/entity-resolution.md), které je
jejím technickým základem, a od [due diligence](@/glossary/due-diligence.md), která je širší a posuzuje
celkové riziko protistrany. Od prověrky politicky exponovaných osob se liší tím, že zápis na sankční
seznam má přímé právní účinky, kdežto status politicky exponované osoby jen zvyšuje požadavky na péči.
Od veřejného obvinění se zápis na seznam liší tím, že je výsledkem formálního rozhodnutí s možností
přezkumu – a právě proto je třeba trvat na tom, aby přezkum byl skutečný.

## Časté omyly

Prvním omylem je přesvědčení, že shoda jména znamená shodu osoby. Druhým omylem je domněnka, že
přísnější prověrka je vždy bezpečnější; vede k více chybným shodám a ke škodám nevinným. Třetím omylem
je považovat seznam za neomylný; seznamy se mění, osoby jsou ze seznamů vyřazovány a zápisy bývají
soudně rušeny.

## Příklad (anonymizovaný kompozit)

Zdravotní sestra s dvojím občanstvím zjistí, že jí banka zadržela převod úspor rodičům. Důvodem je shoda
jejího příjmení a křestního jména s osobou na sankčním seznamu. Banka zprvu odmítá sdělit podrobnosti.
Teprve po písemné žádosti a doložení data narození, které se od sankcionované osoby liší o dvacet let,
pracovník compliance shodu ověří jako chybnou a převod uvolní. Banka zaznamená ověřenou neshodu, aby
se situace při dalších převodech neopakovala.

## Meze a otevřené otázky

Kniha se sankční prověrky dotýká jen v rozsahu jejích epistemických rizik; nenahrazuje odbornou
literaturu ani právní poradenství. Otevřená zůstává otázka, jak vyvážit účinnost sankcí s ochranou
nevinných před chybnými shodami, zvlášť u jmen přepisovaných z jiných písem. Druhou otázkou je, jak
zajistit, aby osoby chybně označené automatizovanými systémy měly reálnou, nikoli jen formální cestu
k nápravě.

## Literatura

- Christen, P. (2012). *Data Matching: Concepts and Techniques for Record Linkage, Entity Resolution, and Duplicate Detection*. Springer.
- FATF (2012). *International Standards on Combating Money Laundering and the Financing of Terrorism & Proliferation: The FATF Recommendations*. Financial Action Task Force.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Rozsudek Soudního dvora ze dne 3. září 2008, Kadi a Al Barakaat International Foundation v. Rada a Komise, spojené věci C-402/05 P a C-415/05 P.
- Zákon č. 69/2006 Sb., o provádění mezinárodních sankcí.
- Zákon č. 253/2008 Sb., o některých opatřeních proti legalizaci výnosů z trestné činnosti a financování terorismu.

## Související

**Glosář**

- [Sanctions screening](@/glossary/sanctions-screening.md) – heslo, které most propojuje.
- [Entity Resolution](@/glossary/entity-resolution.md) – technický základ prověrky.
- [Due Diligence](@/glossary/due-diligence.md) – širší prověrka protistrany.
- [Compliance framework](@/glossary/compliance-framework.md) – regulatorní rámec.

**Kniha**

- [Sankční seznamy a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) – chybné shody a jejich příčiny.
- [UBO Disinformation Patterns](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md) – skrývání za prostředníky.
- [AML – Pattern Recognition Beyond Rules](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md) – vzorce za hranicí pravidel.

**Sesterské mosty**

- [Bridge: Entity Resolution](@/kompendium/glossary-bridges/bridge-entity-resolution.md) – sjednocování záznamů.
- [Bridge: OSINT](@/kompendium/glossary-bridges/bridge-osint.md) – otevřené zdroje v prověrkách.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Sanctions screening (sankční prověrka)](@/glossary/sanctions-screening.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
