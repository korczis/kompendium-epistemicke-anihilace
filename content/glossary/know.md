+++
title = "KNOW"
weight = 100
description = "KNOW (Knowledge Coverage): poradní pilíř doktríny Prismatic Platform, podle něhož má každý nový modul pokrytí v glosáři. Co vyžaduje a jak souvisí s Kompendiem."

[taxonomies]
tags = ["glossary", "prismatic", "doctrine", "quality"]

[extra]
category = "doctrine"
abbreviation = "KNOW"
related_terms = ["doctrine", "nclb", "kompendium-ea", "taxonomie-ea", "loading-the-language"]
keywords = ["KNOW", "Knowledge Coverage", "pokrytí znalostí", "glosář", "doktrína", "Prismatic Platform"]
+++

## Definice

**KNOW** (*Knowledge Coverage*, pokrytí znalostí) je pilíř [doktríny](@/glossary/doctrine.md) Prismatic Platform, který se týká **pokrytí platformy vysvětlujícími texty**. Příloha [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) jej řadí do domény *Glossary*, index pojmů jej popisuje jako „platformovou doktrínu: glossary coverage pro nové moduly“. Myšlenka je jednoduchá: když v systému vznikne nový modul, nový pojem nebo nová schopnost, má pro ně existovat i heslo, které vysvětluje, co znamenají.

Pojem patří do kontextu platformy, ne do taxonomie epistemické anihilace. Pro knihu je ale zvlášť blízký, protože glosář, v němž čtete toto heslo, z tohoto prostředí vzešel.

## Původ a kontext pojmu

Požadavek, aby technický systém měl vlastní slovník, je v softwarovém inženýrství dobře známý. Přístup označovaný jako *domain-driven design* mluví o „všudypřítomném jazyku“ (*ubiquitous language*; Evans 2003): vývojáři a odborníci z oboru mají používat stejná slova se stejným významem a tato slova mají být zapsaná. Platforma tuto myšlenku převedla do pravidla, které se dá kontrolovat: nový modul bez hesla v glosáři je mezera, kterou kontrola ohlásí.

KNOW navazuje na pilíř DOCS (dokumentace) a na zásadu [NCLB](@/glossary/nclb.md), podle níž má každé tvrzení oporu. Zatímco DOCS se ptá, zda je kód popsán, KNOW se ptá, zda jsou **pojmy**, které kód zavádí, srozumitelné i pro toho, kdo kód nečte.

## Jak se projevuje: co pilíř vyžaduje

Podle provozní dokumentace platformy KNOW zahrnuje:

- **pokrytí v glosáři** pro nové moduly;
- doporučení pro výukové materiály (témata „akademie“);
- doporučení pro cvičení („laby“).

Všechny tři požadavky jsou **poradní** (*advisory*): kontrola na nedostatek upozorní, ale commit ani sloučení změny nezablokuje. Tím se KNOW liší od blokujících pilířů, jako jsou [TACH](@/glossary/tach.md), [ZERO](@/glossary/zero.md) nebo [SEAL](@/glossary/seal.md).

V praxi to vypadá tak, že po přidání nového modulu se ve výstupu kontrol objeví upozornění „chybí heslo v glosáři“. Změna projde, ale mezera zůstane viditelná v přehledu pokrytí, dokud ji někdo nevyplní. Pokrytí se tak dá sledovat jako číslo, které má v čase růst.

## Mechanismus: proč takové pravidlo existuje

Ve velkém systému vznikají pojmy rychleji, než je stačí kdokoli vysvětlit. Bez glosáře se z interního slovníku stává žargon, kterému rozumí jen autoři – a s jejich odchodem i on mizí. Pokrytí znalostí je tedy pojistkou proti ztrátě porozumění a proti tomu, aby se terminologie stala bariérou.

Strukturálně působí pilíř třemi způsoby:

1. **Zápis definice** – pojem, který je zapsaný, lze citovat, opravit a zpochybnit; pojem, který žije jen v hlavách, se mění nepozorovaně.
2. **Sdílení moci nad významem** – kdo smí určovat, co slovo znamená, má moc nad tím, jak se o věci přemýšlí. Veřejné heslo tuto moc rozkládá mezi všechny, kdo ho čtou.
3. **Viditelnost mezer** – přehled pokrytí ukazuje, kde porozumění chybí, místo aby předstíral, že je úplné.

Poradní povaha pilíře je záměrná: psaní dobrého hesla vyžaduje úsudek a čas a vynucení by vedlo k formálním, prázdným heslům. Proti tomu platforma staví viditelnost – mezery se nepřehlížejí, ale ani se nezaplňují nasilu.

## Odlišení

KNOW se liší od pilíře DOCS tím, že DOCS požaduje dokumentaci kódu – co dělá funkce a jak se volá –, kdežto KNOW vysvětlení pojmů, které modul zavádí. Od [NCLB](@/glossary/nclb.md) se liší předmětem kontroly: NCLB ověřuje, zda jsou tvrzení doložena, KNOW, zda jsou pojmy vysvětleny. Heslo může být úplné a přesto obsahovat nedoložené tvrzení, a proto se oba pilíře doplňují.

Podstatné je i rozlišení mezi pokrytím a porozuměním. Kontrola pozná, zda heslo existuje, ale ne, zda je srozumitelné; Evans proto zdůrazňuje, že sdílený slovník systému vzniká a zpřesňuje se v rozhovoru lidí, kteří ho používají, ne jen zápisem (Evans 2003). A konečně je třeba odlišit glosář od rejstříku: rejstřík (např. [index pojmů](@/kompendium/08-prilohy/index-pojmu.md)) říká, kde se pojem vyskytuje, glosář říká, co znamená a jak se liší od příbuzných pojmů.

## Význam pro Kompendium

Glosář Kompendia je přímým dědicem platformního glosáře: zahrnuje jak hesla o jevech epistemické anihilace, tak hesla o pojmech platformy (např. [NABLA Infinity](@/glossary/nabla-infinity.md), [AIAD](@/glossary/aiad.md), [Doktrína NM/ND](@/glossary/nm-nd.md)). Kniha přebírá logiku KNOW ve vlastních pravidlech: každý pojem z [indexu pojmů](@/kompendium/08-prilohy/index-pojmu.md) má mít vlastní stránku, a tato vazba se v repozitáři knihy kontroluje automaticky jako součást informační architektury.

Kniha jde přitom dál než platformní pilíř. Kontroluje nejen to, zda heslo existuje, ale i to, zda má definici na začátku, odpovídající rozsah, oddíl souvisejících odkazů a zda na ně odkazuje alespoň jedna jiná stránka. Heslo, na které nic nevede, je pro čtenáře stejně neviditelné jako heslo, které neexistuje.

Je tu i hlubší, interpretační souvislost s tématem knihy. Kompendium popisuje, jak se manipulace opírá o pojmy, které nikdo nevysvětlí – o [terminologickou mystifikaci](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) a o slovník, kterému rozumí jen zasvěcení ([loading the language](@/glossary/loading-the-language.md); Lifton 1961). Skupiny s vysokou mírou kontroly si vytvářejí vlastní jazyk, jehož slova mají jiný význam než v běžné řeči a jejichž definice se mohou měnit podle potřeby vedení; člen, který slovo použije „špatně“, je opraven, a tím se učí, že význam neurčuje on. Totalitní jazyk popsaný v Orwellově [newspeaku](@/glossary/newspeak.md) (Orwell 1949) a v Klempererově [LTI](@/glossary/lti-lingua-tertii-imperii.md) (Klemperer 1947) ukazuje tentýž mechanismus v měřítku celé společnosti.

Veřejně dostupný a srozumitelný glosář je opakem: dává čtenáři možnost každý pojem ověřit, porovnat s jinými zdroji a nesouhlasit. Pro člověka, který ze skupiny odešel, bývá „překlad“ skupinového slovníku zpět do běžného jazyka jedním z prvních kroků zotavení – a dobře napsané heslo k tomu může posloužit.

Obecný příklad (kompozit): klientka po odchodu ze skupiny používá slovo „pochybnost“ výhradně ve významu „selhání víry“. Terapeutka s ní projde heslo [epistemické pokory](@/glossary/epistemicka-pokora.md) a ukáže, že v běžném i vědeckém jazyce je pochybnost nástrojem poznání. Nejde o přesvědčování, ale o zpřístupnění druhého významu, mezi nimiž si klientka může sama vybrat.

## Obrana a zotavení

Z logiky KNOW lze odvodit několik jednoduchých obranných kroků, které nepotřebují žádnou platformu:

- **Ptát se na definici.** Když skupina, instituce nebo jednotlivec používá slovo, které nelze vysvětlit jinak než dalšími slovy téhož slovníku, je to znak uzavřeného jazyka, ne hloubky.
- **Hledat definici mimo zdroj.** Význam pojmu ověřit ve slovníku, v odborné literatuře nebo u člověka mimo skupinu; srovnání ukáže, zda se význam posunul.
- **Zapsat si vlastní význam.** Napsat, co slovo znamená pro mě, a vracet se k zápisu – podobně jako to doporučuje [úvodní sekce knihy](@/kompendium/02-uvod/_index.md) u pracovní definice epistemické anihilace.
- **Pro profesionály:** při práci s klientem po odchodu ze skupiny mapovat jeho slovník, nechat ho vysvětlit, co slova znamenala ve skupině, a společně hledat běžné ekvivalenty, aniž by terapeut sám vnucoval nový „správný“ slovník.

## Meze přenosu

Pokrytí pojmů heslem není totéž co porozumění. Glosář může být úplný a přesto nesrozumitelný, a heslo samo nezaručuje, že pojem je dobře utvořený. Kniha proto vedle úplnosti klade důraz na kvalitu hesel: definici, odlišení od příbuzných pojmů a odkazy na ověřitelné zdroje.

I glosář může sloužit kontrole: autorita, která definuje všechna slova, může čtenáři vnutit jediný výklad. Kniha se proti tomu jistí tím, že u sporných pojmů uvádí více tradic a výslovně označuje interpretaci jako interpretaci.

## Literatura

- Evans, E. (2003). *Domain-Driven Design: Tackling Complexity in the Heart of Software*. Addison-Wesley – k pojmu sdíleného, zapsaného slovníku systému.
- Lifton, R. J. (1961). *[Thought Reform](@/glossary/thought-reform.md) and the Psychology of Totalism*. W. W. Norton – kritérium *loading the language*.
- Klemperer, V. (1947). *LTI – Notizbuch eines Philologen*. Aufbau.
- Orwell, G. (1949). *Nineteen Eighty-Four*. Secker & Warburg.

## Související

**Platforma**

- [Doctrine](@/glossary/doctrine.md) – soustava pilířů.
- [NCLB](@/glossary/nclb.md) – doložitelnost tvrzení.
- [AIAD](@/glossary/aiad.md) – standard definic agentů s povinným blokem vynucení doktríny.

**Kniha**

- [Kompendium EA](@/glossary/kompendium-ea.md) – heslo o knize samotné.
- [Taxonomie EA](@/glossary/taxonomie-ea.md) – systém pojmů, který glosář pokrývá.
- [Loading the language](@/glossary/loading-the-language.md) – uzavřený slovník jako nástroj kontroly.
- [Terminologická mystifikace (EA-1.1.3)](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – nevysvětlené pojmy jako technika.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – rejstřík, jehož každý pojem má vlastní stránku.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – tabulka platformních zkratek.
