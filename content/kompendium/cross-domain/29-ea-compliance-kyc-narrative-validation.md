+++
title = "Compliance: KYC a ověřování příběhu klienta"
description = "Poznání klienta mezi dokladem a příběhem: syntetické identity, deepfake při ověřování, zdroj prostředků, klienti pod vlivem třetí osoby a ochrana zranitelných klientů."
weight = 290

[taxonomies]
tags = ["kompendium", "cross-domain", "compliance"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["28-ea-compliance-aml-pattern-recognition", "13-ea-dd-beneficial-ownership-disinformation", "2-ea-osint-czech-ares-validation", "27-ea-compliance-gdpr-narrative-protection"]
toc = true
+++

„Poznej svého klienta“ (*know your customer*, KYC) je soubor postupů, jimiž finanční
instituce a další povinné osoby ověřují, kdo je jejich klient, jaký je účel vztahu
a odkud pocházejí jeho prostředky. Formálně jde o kontrolu dokladů; ve skutečnosti
instituce posuzuje **příběh** – kdo klient je, čím se živí, proč chce tuto službu. Příběh
může být vymyšlený, upravený nebo vnucený někým jiným. Kniha se zabývá tím, jak se příběh
o člověku a jeho vlastní příběh mohou rozejít; v KYC je tento rozchod předmětem každodenní
práce.

## Doména a problém

Doporučení FATF 10 stanoví povinnost **kontroly klienta** (*customer [due diligence](@/glossary/due-diligence.md)*):
identifikovat klienta a ověřit jeho totožnost ze spolehlivých nezávislých zdrojů,
identifikovat skutečného majitele, porozumět účelu a povaze obchodního vztahu a průběžně
vztah sledovat. Zákon č. 253/2008 Sb. tyto povinnosti zavádí v českém právu, včetně
zjišťování původu prostředků u rizikových klientů a politicky exponovaných osob.

Digitalizace přesunula ověřování na dálku: klient pořídí fotografii dokladu a video
nebo snímek obličeje a systém ověří shodu a „živost“. Tento proces je terčem útoků
s pomocí **syntetických identit** (kombinace skutečných a vymyšlených údajů) a technologií
**deepfake**, které umožňují vytvořit věrohodný obličej nebo video (viz [Deepfake](@/glossary/deepfake.md)).
Unijní rámec digitální identity, posílený nařízením (EU) 2024/1183 (eIDAS 2) a zaváděním
evropské peněženky digitální identity, má ověřování zpevnit spolehlivou elektronickou
identifikací.

Druhou stranou KYC je **zdroj prostředků a účel vztahu**. Zde nestačí doklad totožnosti;
instituce posuzuje, zda příběh klienta dává smysl – zda odpovídá jeho povolání, věku, historii
a chování. Tento úsudek je zranitelný vůči oběma druhům chyb: přijetí dobře připraveného
falešného příběhu a odmítnutí neobvyklého, ale pravdivého.

## Průnik s epistemickou anihilací

Kniha popisuje, jak manipulace vytváří u člověka falešný obraz reality; v KYC je terčem
falešného obrazu instituce. Dobře připravený příběh – konzistentní doklady, věrohodná
profesní historie, odkazy na existující firmy – využívá toho, že instituce ověřuje
**konzistenci**, nikoli **pravdivost**. Konzistentní příběh není nutně pravdivý; Schum
(1994) zdůrazňuje, že více shodných důkazů z téhož zdroje nezvyšuje věrohodnost tolik
jako důkazy z nezávislých zdrojů.

Zvláštním případem jsou **klienti, kteří jednají pod vlivem třetí osoby**: senioři,
které někdo z rodiny nebo „nový přítel“ vede k otevření účtu, převodům nebo úvěrům; oběti
romantických podvodů; lidé v kontrolujících vztazích, jejichž partner kontroluje jejich
finance (finanční kontrola je běžnou součástí [coercive control](@/glossary/coercive-control.md);
Stark 2007). Klient sám předkládá pravdivé doklady, ale příběh o účelu není jeho. Pro
instituci je to situace, kde KYC může člověka chránit – pokud ji rozpozná.

## Rozpoznávací znaky

U ověření totožnosti jsou varovnými znaky **nesoulad mezi údaji** z různých zdrojů,
**nová identita bez stopy** (žádná historie v registrech, nová e-mailová adresa a telefon),
**opakované pokusy** s drobně odlišnými údaji, **technické anomálie** při videoověření
a **neochota k alternativnímu ověření**. U klientů pod vlivem jsou varovnými znaky
**přítomnost třetí osoby**, která za klienta mluví nebo ho navádí, **náhlá změna chování**
dlouholetého klienta, **účel převodů, který klient nedokáže vysvětlit vlastními slovy**,
**naléhavost a utajování** a **známky strachu nebo zmatení**. Kniha tyto vzorce popisuje
u [nepřípustného vlivu](@/glossary/undue-influence.md) a ve forenzní podobě v [doktríně
nepřípustného vlivu](@/kompendium/forensic-legal/11-undue-influence-doctrine.md).

## Rámec: právo, standardy a odpovědnost

Povinnosti kontroly klienta stanoví zákon č. 253/2008 Sb. a navazující předpisy; dohled
vykonává Česká národní banka a Finanční analytický úřad. Pro elektronickou identifikaci
platí nařízení eIDAS v aktuálním znění. Při zpracování biometrických údajů pro ověření
totožnosti jde o zvláštní kategorii osobních údajů podle čl. 9 GDPR. Pro ochranu
zranitelných klientů nemá KYC samostatný právní rámec, ale instituce mají obecné povinnosti
odborné péče a jednání v nejlepším zájmu klienta v řadě finančních regulací.

## Ochranná opatření

U ověření totožnosti pomáhá **vícezdrojové ověření** (nejen doklad a obličej, ale i nezávislý
registr nebo spolehlivá elektronická identita), **detekce anomálií** při videoověření,
**lidské posouzení** u sporných případů a **sdílení informací** o zjištěných podvodných
identitách v rámci zákonných mezí. U příběhu klienta pomáhá **porozumění místo kontrolního
seznamu**: ptát se otevřeně a nechat klienta vysvětlit vlastními slovy. U klientů pod
vlivem pomáhá **rozhovor bez přítomnosti třetí osoby**, **nabídka odkladu**, **možnost
kontaktovat důvěryhodnou osobu** určenou klientem a **vyškolený personál**, který vzorce
nepřípustného vlivu zná. Organizačně se tato opatření opírají o postupy popsané v
[Prověřování kontraktorů](@/kompendium/organizational-defense/26-contractor-vetting.md)
a [Klasifikaci informací](@/kompendium/organizational-defense/27-information-classification.md).

## Lidský rozměr a zotavení

Klienti, kteří byli neprávem odmítnuti kvůli neobvyklému příběhu (migranti, lidé s
přerušovanou profesní historií, lidé po odchodu z uzavřených komunit bez dokladů o
předchozím životě), prožívají vyloučení a ponížení. Lidé, kteří odcházejí z vysoce
kontrolujících skupin, často nemají vlastní doklady, účet ani úvěrovou historii, protože
vše spravovala skupina; jejich návrat do běžného finančního života je součástí zotavení
(viz [Středně-dobá vokační integrace](@/kompendium/recovery-protocols/midterm-vocational-integration.md)).
Instituce, která jim vyjde vstříc s pochopením a alternativními doklady, podporuje
jejich samostatnost.

## Přesah do dalších oborů

Ověřování příběhu člověka je jádrem mnoha oborů: azylového řízení, kde se posuzuje
věrohodnost výpovědi o pronásledování (viz [Azyl a EA](@/kompendium/forensic-legal/43-asylum-EA.md)),
přijímacích řízení, kde se ověřují životopisy, zdravotnictví, kde lékař posuzuje anamnézu,
a sociální práce. Ve všech případech platí, že konzistence není totéž co pravdivost, a že
neobvyklý příběh není totéž co nepravdivý. Fricker (2007) upozorňuje, že posluchači
přisuzují menší věrohodnost lidem, jejichž příběhy neodpovídají očekávanému vzoru –
což v KYC zasahuje zejména lidi s neobvyklými životními drahami.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Muž kolem osmdesáti let přijde do pobočky s mladší
ženou, kterou představí jako „přítelkyni“, a chce si vzít úvěr a převést úspory na nový
společný účet. Žena odpovídá na otázky za něj. Pracovnice pobočky požádá o krátký rozhovor
s klientem o samotě s odkazem na standardní postup. Klient je nejistý, neví, k čemu přesně
peníze slouží, a zmíní, že „ona říká, že děti mu nechtějí pomoct“. Pracovnice mu nabídne
odklad a možnost přizvat někoho, komu důvěřuje. Klient po týdnu přijde se synem; ukáže se,
že žena ho kontaktovala přes inzerát a postupně ho odstřihla od rodiny. Banka transakci
neprovede, poskytne klientovi kontakty na poradnu a podle svých povinností posoudí,
zda podat oznámení. Klient se zpočátku zlobí, že mu banka „nevěří“; později řekne, že
právě odklad mu dal čas si věc promyslet mimo dosah ženy, která na něj tlačila. Pracovnice
pobočky zaznamená průběh tak, aby ho bylo možné doložit, pokud by věc došla k soudu.

## Meze a otevřené otázky

Ochrana zranitelných klientů naráží na jejich autonomii: dospělý člověk má právo nakládat
se svými penězi i nerozumně. Otevřenou otázkou je, kde je hranice mezi ochranou a
paternalismem, a jak udržet spolehlivost ověřování totožnosti v době, kdy lze obličej,
hlas i doklady věrohodně padělat.

## Literatura

- FATF (2012, s aktualizacemi). *The FATF Recommendations*, doporučení 10.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing.*
- Schum, D. A. (1994). *The Evidential Foundations of Probabilistic Reasoning.*
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life.*
- Nařízení (EU) 2024/1183, kterým se mění nařízení (EU) č. 910/2014 (eIDAS).

## Související

**Mezioborové mosty**

- [AML a rozpoznávání vzorců](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md) – monitorování transakcí.
- [Dezinformace o skutečném majiteli](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md) – kontrola struktury.
- [Ověřování v ARES](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md) – rejstříková data.
- [GDPR a ochrana před chybným narativem](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md) – práva klienta.

**Právo**

- [Doktrína nepřípustného vlivu](@/kompendium/forensic-legal/11-undue-influence-doctrine.md) – rozhodnutí pod vlivem.
- [Právo o zneužívání seniorů](@/kompendium/forensic-legal/46-elder-abuse-law.md) – ochrana seniorů.

**Pojmy**

- [Undue influence](@/glossary/undue-influence.md) – nepřípustný vliv.
- [Coercive control](@/glossary/coercive-control.md) – finanční kontrola ve vztahu.
