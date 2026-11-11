+++
title = "Due diligence: dezinformace o skutečném majiteli"
description = "Jak se zakrývá, kdo firmu skutečně ovládá: řetězce společností, nominální osoby, svěřenské struktury, nepravdivé zápisy v evidenci a postupy jejich odhalení."
weight = 130

[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic"]

[extra]
related_terms = ["2-ea-osint-czech-ares-validation", "28-ea-compliance-aml-pattern-recognition", "29-ea-compliance-kyc-narrative-validation", "12-ea-dd-counterparty-manipulation"]
toc = true
+++

Skutečný majitel je fyzická osoba, která právnickou osobu nakonec vlastní nebo ovládá,
případně má z její činnosti prospěch. Zjistit ho je jádrem prověrky protistrany i povinností
podle předpisů proti praní peněz. Je to zároveň oblast, v níž se nepravda neprosazuje
lží, ale strukturou: řetězcem společností v různých jurisdikcích, nominálními akcionáři
a jednateli, svěřenskými fondy a smlouvami, které nejsou nikde zveřejněny. Výsledný obraz
v rejstřících může být formálně správný a věcně klamný. Tato stránka popisuje, jak
s takovou „strukturální dezinformací“ pracovat.

## Doména a problém

Doporučení FATF 24 a 25 požadují, aby státy zajistily dostupnost přiměřených, přesných
a aktuálních informací o skutečných majitelích právnických osob a právních uspořádání
(FATF 2012, s aktualizacemi). V Evropské unii zavedla registry skutečných majitelů čtvrtá
směrnice proti praní peněz (směrnice (EU) 2015/849) a pátá směrnice (EU) 2018/843 rozšířila
jejich dostupnost. Soudní dvůr EU však v rozsudku ze dne 22. listopadu 2022 ve spojených
věcech C-37/20 a C-601/20 (WM a Sovim) shledal neplatným ustanovení o neomezeném přístupu
veřejnosti k těmto registrům pro rozpor s právem na respektování soukromého života a na
ochranu osobních údajů. V Česku upravuje evidenci zákon č. 37/2021 Sb., o evidenci
skutečných majitelů.

Empirický výzkum ukazuje, jak snadné bylo anonymní firmy zakládat. Sharman (2010) a později
Findley, Nielson a Sharman (2014) v experimentech oslovili tisíce poskytovatelů služeb
zakládání společností s žádostí o anonymní firmu a zjistili, že velká část z nich nepožadovala
řádnou identifikaci – a že poskytovatelé v zemích s pověstí přísné regulace nebyli vždy
přísnější než ti v „daňových rájích“. Úniky dokumentů, jako byly Panama Papers v roce 2016,
ukázaly rozsah využívání offshorových struktur, a zároveň to, že většina takových struktur
byla formálně legální.

Rozhodující obtíž je, že evidence skutečných majitelů stojí převážně na tom, co do ní
zapíše sama firma. Pokud firma uvede nominální osobu, evidence zobrazí nominální osobu.
Ověření tedy nemůže skončit u výpisu.

## Průnik s epistemickou anihilací

Kniha popisuje [iluzorní komplexitu](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md)
jako vytváření složitosti, která odrazuje od dalšího zkoumání, a [terminologickou mystifikaci](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md)
jako použití odborného jazyka k zastření. Obojí je v zakrývání vlastnictví běžné: struktura
s mnoha vrstvami a cizími právními formami působí, že prověřovatel buď rezignuje, nebo
přijme výklad poradce protistrany. Strukturální dezinformace navíc využívá [autoritu
úředního záznamu](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md): „v evidenci
je zapsán“ zní jako fakt, i když jde o prohlášení.

Druhým průnikem je osud nominálních osob. Lidé, kteří figurují jako majitelé nebo jednatelé
za někoho jiného, jsou někdy profesionálové, jindy lidé v tíživé situaci, kteří podepsali
za malou odměnu a nevědí, k čemu jejich jméno slouží. Jejich rozhodnutí bylo formálně
svobodné, ale ne vždy informované – situace blízká tomu, co kniha popisuje jako
[nepřípustný vliv](@/glossary/undue-influence.md).

## Rozpoznávací znaky

Na zakrývání skutečného majitele ukazuje **vlastnický řetězec přes více jurisdikcí** bez
zjevného obchodního důvodu, **nominální osoby** zapsané v mnoha nesouvisejících firmách,
**svěřenské fondy nebo nadace** na vrcholu struktury, **nesoulad mezi zapsaným majitelem
a tím, kdo jedná** (podepisuje, vyjednává, rozhoduje), **časté změny** ve vlastnické
struktuře, zvlášť před transakcí, **odmítání doložit** vlastnickou strukturu s odkazem
na soukromí a **nesoulad** mezi evidencí v různých zemích. Prověřovatel má rozlišovat
legitimní důvody složitých struktur (daňové plánování, ochrana majetku, holdingové
uspořádání) od struktur, jejichž jediným zjevným účelem je zakrytí.

## Rámec: právo, standardy a odpovědnost

Povinné osoby podle zákona č. 253/2008 Sb. musejí při kontrole klienta zjistit jeho
skutečného majitele a přijmout opatření k ověření jeho totožnosti z důvěryhodných zdrojů;
samotný výpis z evidence k tomu podle obecně přijímaného výkladu nestačí. Zákon č. 37/2021 Sb.
stanoví povinnost zapisovat skutečné majitele a sankce za nesplnění, včetně omezení
výkonu některých práv. Pro prověrky mimo regulovaný sektor je rámec méně formální, ale
riziko spolupráce s nepoznaným majitelem (sankce, korupce, střet zájmů) zůstává.

## Ochranná opatření

Prvním opatřením je **rekonstrukce celé struktury** až k fyzickým osobám, s dokumenty
z každé úrovně (výpisy, společenské smlouvy, dokumenty o svěřenských fondech). Druhým je
**srovnání formálního a faktického**: kdo skutečně jedná, kdo podepisuje, kdo přijímá
platby. Třetím je **ověření z nezávislých zdrojů** – zahraniční registry, soudní spisy,
média, úniky dat používané s opatrností. Čtvrtým je **síťová analýza** sdílených osob,
adres a zástupců napříč firmami (viz [síťová analýza](@/kompendium/research-methodology/network-analysis-EA.md)).
Pátým je **eskalace** u struktur, které nelze vysvětlit: rozhodnutí o pokračování patří
na vyšší úroveň s jasným záznamem důvodů.

Klíčové je i to, co prověrka nedělá: nepřenáší podezření z nominální osoby na všechny
její vztahy, nevyvozuje z offshorové struktury sama o sobě nekalý úmysl a neoznačuje
lidi za „bílé koně“ bez doložení.

## Lidský rozměr a zotavení

Nominální osoby, které byly zneužity, se často dozvědí o svém postavení až ve chvíli,
kdy jim přijde výzva k zaplacení dluhů firmy nebo předvolání. Prožívají stud, strach
a nedůvěru vůči institucím, které jim nevěří, že „nevěděli“. Pomáhá jim právní poradenství
a postup, který odlišuje jejich roli od role skutečných strůjců. V širším smyslu kniha
popisuje podobné zkušenosti u obětí finančního zneužívání, například seniorů (viz
[Elder abuse](@/glossary/elder-abuse.md)).

## Přesah do dalších oborů

Zakrývání skutečné kontroly za formální strukturou se objevuje i mimo finance. V médiích
jde o vlastnictví zpravodajských titulů, které ovlivňuje obsah, aniž by to čtenáři věděli;
v neziskovém sektoru o organizace, za nimiž stojí nezveřejnění dárci; ve vědě o výzkumné
instituty financované zájmovými skupinami (viz [Manipulace tabákového průmyslu](@/kompendium/historical-cases/25-tobacco-doubt.md)).
Ve skupinách s vysokou kontrolou je obdobou situace, kdy formální vedení organizace není
tím, kdo skutečně rozhoduje. Ve všech případech platí, že zdroj informace a její obsah nelze
správně posoudit bez znalosti toho, kdo za zdrojem skutečně stojí.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Česká firma, která se uchází o dodávky pro nemocnici,
má v evidenci jako skutečného majitele svého jednatele. Prověrka ukáže, že stoprocentním
společníkem je kyperská společnost, jejímž jediným akcionářem je svěřenský fond v jiné zemi.
Jednatel na dotaz uvede, že je „beneficientem fondu“, ale dokumenty fondu odmítne předložit.
Zadavatel požádá o doložení struktury jako podmínku účasti. Firma nakonec předloží
dokumenty, z nichž vyplývá, že beneficienty jsou jednatel a jeho bývalý obchodní partner,
o němž evidence mlčí. Zápis v evidenci byl tedy neúplný. Zadavatel firmu z řízení nevyloučí
automaticky, ale vyžádá si opravu zápisu a posoudí, zda partner nemá střet zájmů.

## Meze a otevřené otázky

Zpřísnění přístupu k evidencím po rozsudku Soudního dvora z roku 2022 omezilo možnosti
novinářů a občanské společnosti, které byly pro odhalování zakrytých struktur důležité.
Otevřenou otázkou je, jak vyvážit ochranu soukromí s potřebou veřejné kontroly a jak
ověřovat údaje v evidencích, které stojí na prohlášeních samotných firem.

## Literatura

- FATF (2012, s aktualizacemi). *The FATF Recommendations*, doporučení 24 a 25.
- Findley, M. G., Nielson, D. L., Sharman, J. C. (2014). *Global Shell Games: Experiments in Transnational Relations, Crime, and Terrorism.*
- Sharman, J. C. (2010). Shopping for anonymous shell companies: An audit study of anonymity and crime in the international financial system.
- Rozsudek Soudního dvora ze dne 22. 11. 2022, WM a Sovim SA v. Luxembourg Business Registers, C-37/20 a C-601/20.
- Zákon č. 37/2021 Sb., o evidenci skutečných majitelů.

## Související

**Mezioborové mosty**

- [Ověřování v ARES](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md) – český rejstříkový kontext.
- [AML a rozpoznávání vzorců](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md) – povinnosti povinných osob.
- [KYC a ověřování narativu klienta](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md) – identifikace klienta.
- [Manipulace ze strany protistrany](@/kompendium/cross-domain/12-ea-dd-counterparty-manipulation.md) – řízení toho, co prověrka vidí.

**Techniky a pojmy**

- [EA-1.2.3 Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) – složitost jako zástěrka.
- [Due diligence](@/glossary/due-diligence.md) – heslo glosáře.
- [Undue influence](@/glossary/undue-influence.md) – zneužití nominálních osob.

**Právo**

- [Podvod jako element EA](@/kompendium/forensic-legal/17-fraud-EA-element.md) – právní rámec klamání.
