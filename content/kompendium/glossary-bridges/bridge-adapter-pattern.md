+++
title = "Bridge: Adapter Pattern (vzor adaptér)"
description = "Most mezi heslem vzor adaptér a knihou: jednotné rozhraní nad různými zdroji, ztráta původu za abstrakcí a lidská obdoba – prostředník, přes nějž jde veškerý výklad světa."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "adapter-pattern", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["adapter-pattern", "3nl", "bounded-context", "hermeneuticky-outsourcing", "milieu-control", "signal-plurality"]
glossary_target = "adapter-pattern"
toc = false
+++

# Bridge: Adapter Pattern (vzor adaptér)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Vzor adaptér](@/glossary/adapter-pattern.md) (*Adapter Pattern*) je strukturální návrhový vzor
softwarového inženýrství: převádí rozhraní jedné součásti na rozhraní, které očekává jiná součást,
takže spolu mohou spolupracovat, aniž by se kterákoli z nich měnila. Klasickou formulaci podali
Gamma, Helm, Johnson a Vlissides (1994) v katalogu návrhových vzorů, kde adaptér stojí vedle
příbuzných vzorů fasáda a most. Myšlenka navazuje na starší princip skrývání informací, jak ho
formuloval Parnas (1972): modul má vystavovat stabilní rozhraní a skrývat rozhodnutí, která se mohou
měnit. Na platformě, z níž Kompendium vzešlo, je adaptér implementací jednotného kontraktu (například
úložiště nebo nástroje OSINT), který zapouzdřuje podrobnosti konkrétní technologie; v architektuře
[3NL](@/glossary/3nl.md) jde o typický vzor nejnižší, prováděcí vrstvy.

Heslo patří do kontextu softwarové platformy, nikoli do klinické taxonomie. Kniha ho přesto zařazuje
mezi mosty, protože vzor dobře ukazuje dvojí povahu každého prostředníka mezi člověkem a světem:
prostředník umožňuje přístup, ale zároveň rozhoduje, co z původního zdroje projde a v jaké podobě.

## Adaptér očima knihy

Evans (2003) popsal v doménově řízeném návrhu „protikorupční vrstvu“ (*anticorruption layer*):
adaptér, který chrání vlastní model domény před pojmy a předpoklady cizího systému. Tato funkce je
pro knihu nejpoučnější. Dobrý adaptér nepropouští cizí logiku do vlastního modelu bez překladu a
kontroly; špatný nebo záměrně zkreslující adaptér naopak cizí logiku přenáší nepozorovaně, protože
konzument vidí jen uniformní rozhraní. Příbuzný pojem [ohraničeného kontextu](@/glossary/bounded-context.md)
připomíná, že každé slovo má význam jen uvnitř určitého modelu a že překlad mezi modely je místem,
kde se význam může tiše posunout.

Kniha z toho vyvozuje epistemickou analogii. Uniformní rozhraní stírá rozdíly v kvalitě zdrojů:
soudní spis, anonymní příspěvek a výstup jazykového modelu mohou přes jedno vyhledávací rozhraní
vypadat stejně. Ztráta původu za abstrakcí je strukturní podmínkou několika technik, které kniha
popisuje, například [obcházení atribuce zdroje u jazykových modelů](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md)
nebo [otrávení kontextu při vyhledávání](@/kompendium/techniques/ea-9-1-4-rag-context-poisoning.md),
kde se do „adaptéru“ mezi dokumenty a modelem dostane podvržený obsah a konzument ho přijme jako
neutrální odpověď.

Lidskou obdobou adaptéru je prostředník, přes kterého jde veškerý výklad světa. Lifton (1961) popsal
v analýze myšlenkové reformy [kontrolu prostředí](@/glossary/milieu-control.md) (*milieu control*) –
stav, kdy skupina řídí, jaké informace se k člověku dostanou a v jakém rámci. Vedoucí, mentor nebo
partner, který „překládá“ realitu do jediného přípustného jazyka, funguje jako adaptér bez alternativy.
Kniha tento stav popisuje pojmem [hermeneutický outsourcing](@/glossary/hermeneuticky-outsourcing.md):
člověk přestane vykládat svět sám a přebírá výklad od jednoho zdroje.

## Kde se pojem v knize vyskytuje

Technickou stránku vzoru a jeho vztah k obraně proti technikám EA přibližuje oddíl
[AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md), kde agenti platformy pracují
s jednotnými kontrakty nad různorodými zdroji. Vztah knihy k platformě jako celku vysvětluje kapitola
[Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md); čtenář tam najde
i upozornění, které pojmy jsou jen technické a které nesou obsah knihy.

Epistemickou stránku – ztrátu původu a závislost na jediném prostředníkovi – rozvíjejí detekční
signatury [Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) a
[Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md). Obě
popisují, jak několik zdánlivě nezávislých kanálů ve skutečnosti čerpá z jednoho zdroje, takže
uniformní „rozhraní“ dodává iluzi potvrzení. Na straně obrany na ně navazuje návod
[Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) a
[Kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md).

Teoretické zázemí analogie leží v kapitolách [Clark: Rozšířená mysl](@/kompendium/07-teoreticke-reflexe/clark-extended-mind.md)
a [Hutchins: Distribuovaná kognice](@/kompendium/07-teoreticke-reflexe/hutchins-distributed-cognition.md).
Clark a Chalmers (1998) tvrdí, že spolehlivě používané vnější nástroje se stávají součástí kognitivního
procesu; Hutchins (1995) ukázal, že poznávání se v praxi rozkládá mezi lidi a artefakty. Z obou
plyne, že kdo ovládá rozhraní, ovládá část poznávání toho, kdo ho používá.

## Od pojmu k praxi

### Rozpoznání

V softwaru se selhávající adaptér pozná podle toho, že konzument nemá jak zjistit, odkud data
pocházejí a jak byla převedena. V epistemické rovině je obdobným znakem situace, kdy člověk umí
říct, *co* ví, ale ne *odkud*: všechny informace mají stejný tvar, stejný slovník a stejného
„tlumočníka“. Heuer (1999) upozorňoval, že analytici mají sklon přeceňovat konzistentní informace
a podceňovat otázku, zda jsou jejich zdroje nezávislé; konzistence přes jediný kanál je přitom
slabý doklad. Kontrolní otázky jsou proto tři: Mám přístup k původnímu zdroji, nebo jen k jeho
převyprávění? Existuje druhý nezávislý kanál? A kdo rozhoduje o tom, co se do mého obrazu dostane?

### Obrana

Obranou v inženýrství je zachování původu (*provenance*) přes všechny vrstvy a testování kontraktu
každého adaptéru stejnou sadou testů. Lidskou obdobou je [pluralita signálů](@/glossary/signal-plurality.md):
udržovat více nezávislých zdrojů, vracet se k originálům a nepouštět jediný výklad do role jediného
rozhraní ke skutečnosti. Goldman (1999) v sociální epistemologii zdůrazňuje, že spolehlivost poznání
ve společenství závisí na tom, jak jsou uspořádány cesty, po nichž informace putují; obrana proto
není jen individuální ctností, ale i vlastností prostředí.

### Náprava

U člověka, jehož výklad světa po delší dobu procházel jediným prostředníkem, nejde o „vypnutí“
adaptéru, ale o postupné obnovení vlastního přístupu ke zdrojům. Kniha k tomu vede v protokolech
[Akutní informační kurace](@/kompendium/recovery-protocols/acute-information-curation.md) a
[Středně-dobý hermeneutický reset](@/kompendium/recovery-protocols/midterm-hermeneutic-reset.md):
nejprve omezit zahlcení, pak znovu učit číst původní texty a teprve potom porovnávat výklady.

## Odlišení od příbuzných pojmů

Adaptér je třeba odlišit od fasády, která nepřekládá jedno rozhraní na jiné, ale zjednodušuje
přístup k celému subsystému (Gamma et al. 1994). V epistemické analogii odpovídá fasáda shrnutí či
populárnímu výkladu – zjednodušení, které je legitimní, pokud zůstává cesta k plnému zdroji. Od
manipulativního prostředníka se adaptér liší tím, že je transparentní a vyměnitelný; prostředník
v uzavřené skupině je nevyměnitelný a jeho překlad nelze ověřit. Rozhodující tedy není existence
prostředníka – bez něj se poznávání neobejde –, ale to, zda je možné ho obejít a zkontrolovat.

## Časté omyly

Prvním omylem je přesvědčení, že jednotné rozhraní znamená jednotnou kvalitu. Rozhraní sjednocuje
tvar, ne spolehlivost. Druhým omylem je přenášet softwarový pojem na lidi doslova: člověk není
adaptér a vztah k důvěryhodnému učiteli nebo terapeutovi je normální součástí učení. Analogie slouží
k tomu, aby bylo vidět strukturní riziko jediného kanálu, nikoli k podezírání každého prostředníka.
Třetím omylem je domněnka, že technická abstrakce je epistemicky neutrální; Parnas (1972) ji
zavedl kvůli udržitelnosti kódu, a právě proto skrývá i to, co by konzument někdy vědět měl.

## Příklad (anonymizovaný kompozit)

Analytička malé firmy připravuje přehled o obchodním partnerovi a používá nástroj, který jedním
rozhraním spojuje veřejné rejstříky, zpravodajské servery a souhrny generované modelem. Ve výstupu
najde tvrzení o soudním sporu partnera, které působí stejně věrohodně jako rejstříkové údaje. Protože
zná riziko ztráty původu, dohledá zdroj: tvrzení pochází z jediného blogu, který převzaly dva další
weby a nakonec i automatický souhrn. Do zprávy ho uvede jako neověřené a doplní poznámku o původu.
Kdyby rozhraní zachovávalo původ u každé položky, stačila by k tomu jedna kontrola místo hodiny
pátrání.

## Meze a otevřené otázky

Analogie mezi softwarovým vzorem a lidským poznáváním je heuristická; nejde o empirický model.
Otevřená zůstává otázka, jak navrhovat informační nástroje tak, aby zachovávaly původ, aniž by
uživatele zahltily metadaty, a jak měřit, kdy se prostředník z pomocníka mění v jediný kanál.
Kniha tyto otázky rozvádí v kapitole [EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md).

## Literatura

- Clark, A., & Chalmers, D. (1998). The extended mind. *Analysis*, 58(1), 7–19.
- Evans, E. (2003). *Domain-Driven Design: Tackling Complexity in the Heart of Software*. Addison-Wesley.
- Gamma, E., Helm, R., Johnson, R., & Vlissides, J. (1994). *Design Patterns: Elements of Reusable Object-Oriented Software*. Addison-Wesley.
- Goldman, A. I. (1999). *Knowledge in a Social World*. Oxford University Press.
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis*. Center for the Study of Intelligence, CIA.
- Hutchins, E. (1995). *Cognition in the Wild*. MIT Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. W. W. Norton.
- Parnas, D. L. (1972). On the criteria to be used in decomposing systems into modules. *Communications of the ACM*, 15(12), 1053–1058.

## Související

**Glosář**

- [Adapter Pattern (vzor adaptér)](@/glossary/adapter-pattern.md) – technické heslo, které most propojuje.
- [Bounded Context](@/glossary/bounded-context.md) – proč se význam posouvá při překladu mezi modely.
- [Hermeneutický outsourcing](@/glossary/hermeneuticky-outsourcing.md) – lidská obdoba jediného adaptéru.
- [Milieu control](@/glossary/milieu-control.md) – řízení informačního prostředí ve skupině.

**Kniha**

- [Monokultura zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md) – iluze nezávislých kanálů.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – obrana pluralitou zdrojů.
- [EA-9.1.6 Obcházení atribuce zdroje](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md) – ztráta původu v praxi.
- [Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – odkud technický pojem pochází.

**Sesterské mosty**

- [Bridge: 3NL](@/kompendium/glossary-bridges/bridge-3nl.md) – architektura, v níž adaptér tvoří prováděcí vrstvu.
- [Bridge: Bounded Context](@/kompendium/glossary-bridges/bridge-bounded-context.md) – hranice významu mezi modely.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Adapter Pattern (vzor adaptér)](@/glossary/adapter-pattern.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
