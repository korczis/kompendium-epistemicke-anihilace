+++
title = "Bridge: Shodan"
description = "Most mezi heslem Shodan a knihou: vyhledávač zařízení připojených k internetu, klam bezpečnosti skrze utajení, chytrá zařízení jako nástroj kontroly v domácnosti a etika dvojího užití."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "shodan", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["shodan", "censys", "greynoise", "easm", "coercive-control", "dual-use-poznani"]
parent = "kompendium-glossary-bridges"
glossary_target = "shodan"
toc = false
+++

# Bridge: Shodan

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Shodan](@/glossary/shodan.md) je vyhledávač zařízení připojených k internetu. Průběžně skenuje adresní
prostor a katalogizuje otevřené porty, běžící služby, úvodní odpovědi protokolů, certifikáty a metadata
zařízení. Od běžných vyhledávačů se liší tím, že neindexuje webový obsah, ale infrastrukturní vrstvu
internetu – servery, kamery, síťové prvky, průmyslové řídicí systémy a zařízení internetu věcí, která
odpovídají na síťové dotazy. Vytvořil ho John Matherly v roce 2009. Bezpečnostní komunita ho používá
k mapování vystavených systémů a k odhadu rozsahu zranitelností; tytéž údaje jsou však dostupné i těm,
kdo hledají snadný cíl.

Na platformě, z níž Kompendium vzešlo, slouží Shodan jako jeden ze zdrojů pro
[správu vnější útočné plochy](@/glossary/easm.md), vedle akademicky založeného zdroje
[Censys](@/glossary/censys.md). Heslo patří do kontextu platformy a kybernetické bezpečnosti; kniha ho
zařazuje mezi mosty kvůli třem poučením, která z něj plynou pro epistemickou a osobní obranu.

## Shodan očima knihy

Prvním poučením je konec **bezpečnosti skrze utajení**. Mnoho zařízení bylo připojeno k internetu
s předpokladem, že je nikdo nenajde. Shodan ukázal, že cokoli, co odpovídá na dotaz, je dohledatelné.
Princip, že bezpečnost systému nemá záviset na utajení jeho stavby, formuloval Kerckhoffs (1883) pro
kryptografii a Saltzer a Schroeder (1975) ho zobecnili jako zásadu otevřeného návrhu. Kniha tento
princip přenáší na lidi: obrana, která stojí na tom, že „o tom nikdo neví“, selže ve chvíli, kdy se to
někdo dozví. Spolehlivější je obrana, která obstojí, i když je známá.

Druhým poučením je **domácnost jako útočná plocha**. Chytré kamery, zvonky, lokátory a domácí asistenti
mohou sloužit nejen vnějšímu útočníkovi, ale i blízké osobě, která chce partnera kontrolovat. Freed a
spolupracovníci (2018) v rozhovorech s přeživšími partnerského násilí a s pracovníky pomáhajících
služeb popsali, jak pachatelé zneužívají sdílené účty, lokalizaci a domácí zařízení ke sledování,
obtěžování a zastrašování – často bez technické zručnosti, jen díky tomu, že k účtům měli přístup.
Kniha tento vzorec řadí do rámce [coercive control](@/glossary/coercive-control.md), jak ho popsal
Stark (2007): kontrola, která se neprojevuje jednotlivými incidenty, ale trvalým omezením svobody.

Třetím poučením je **epistemika strachu**. Výsledky vyhledávání v Shodanu se často objevují ve zprávách
typu „tisíce kamer jsou volně dostupné“. Taková čísla mohou být pravdivá a zároveň zavádějící, pokud
neříkají, jak byla získána a co znamenají. Kniha upozorňuje, že dramatický technický údaj bez kontextu
může sloužit k vyvolání úzkosti a k prodeji řešení stejně jako k informování – viz kapitola
[Threat Intel Source Validation](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md).

## Kde se pojem v knize vyskytuje

Jak agent platformy mapuje vystavená aktiva a proč obrana proti sociálnímu inženýrství stojí na lidech,
popisuje stránka [Perimeter a EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md). Ověřování
zpráv o hrozbách a jejich zdrojů rozebírá kapitola
[Threat Intel Source Validation](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md),
riziko přehnaných závěrů z technických indikátorů kapitola
[Attribution – Beyond Technical Indicators](@/kompendium/cross-domain/23-ea-security-attribution-bias.md).

Technologickou stránku kontrolujícího vztahu rozvádějí kapitola [Právo o coercive control](@/kompendium/forensic-legal/12-coercive-control-law.md)
a protokol [EA-6.4.6 Domácí násilí](@/kompendium/techniques/ea-6-4-6-domesticky-abuse-protokol.md);
osobní obranu preventivní kapitola [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md).
Etiku nástrojů s dvojím užitím rozebírá kapitola [Dual Use](@/kompendium/08-prilohy/dual-use.md).

## Od pojmu k praxi

### Rozpoznání

Kniha nepopisuje, jak Shodan používat k vyhledávání zařízení; zajímá ji, jak rozpoznat, že vystavené
nebo zneužité zařízení někomu škodí. U jednotlivce jsou varovnými znaky situace, kdy partner nebo
bývalý partner ví, kde člověk byl, co doma říkal nebo kdy odešel, aniž by mu to kdo sdělil; nová
zařízení v domácnosti, která pořídil a spravuje jen jeden z partnerů; a sdílené účty, k nimž si člověk
nemůže změnit heslo. U organizace je varovným znakem, že nikdo neví, která zařízení jsou z internetu
dostupná.

### Obrana

Obranou organizace je soupis zařízení, odstranění zbytečně vystavených služeb a jejich pravidelná
kontrola. Obranou jednotlivce v kontrolujícím vztahu je opatrnost: náhlé odpojení zařízení nebo změna
hesel může pachatele upozornit a zvýšit riziko. Freed et al. (2018) proto doporučují, aby technické
kroky byly součástí plánu bezpečí připraveného s odborníky. Kniha k tomu odkazuje na
[Akutní zajištění bezpečnosti](@/kompendium/recovery-protocols/acute-safety-establishment.md).

### Náprava

Když se zjistí, že zařízení bylo zneužito ke sledování, náprava je technická, právní a psychologická.
Technicky jde o zajištění zařízení a účtů, právně o uchování dokladů – viz
[Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) –, psychologicky o
obnovu pocitu, že vlastní domov je bezpečné místo. Zkušenost sledování ve vlastní domácnosti často
vede k trvalé ostražitosti; kniha k jejímu zvládání odkazuje na [Kalibraci důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md).

### Rámec pro profesionály

Pro kliniky a sociální pracovníky je důležité brát vážně tvrzení klientů, že jsou technicky sledováni.
Takové tvrzení může být projevem úzkosti nebo paranoidního prožívání, ale může být i přesným popisem
skutečnosti; rozhodnout to lze jen ověřením, ne odhadem. Kniha k odlišení odkazuje na oddíl
[Diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md).
Pro bezpečnostní výzkumníky platí etické zásady, které formulovala zpráva Menlo (Dittrich a Kenneally
2012): zvážit dopad zjištění na osoby, které do výzkumu nevstoupily.

## Odlišení od příbuzných pojmů

Shodan je třeba odlišit od [Censysu](@/glossary/censys.md), který vychází z akademické metodiky měření,
a od [GreyNoise](@/glossary/greynoise.md), který pasivně sleduje, kdo internet skenuje. Od běžného
vyhledávače se liší předmětem – neindexuje obsah, ale zařízení. Od nástroje útoku se liší tím, že sám
neútočí; zpřístupňuje informace, které zařízení o sobě vysílají. Odpovědnost za jejich použití nese
ten, kdo je použije.

## Časté omyly

Prvním omylem je přesvědčení, že co nikdo nehledá, je v bezpečí. Druhým omylem je domněnka, že
technické sledování v partnerském vztahu vyžaduje technické znalosti; často stačí přístup k účtu.
Třetím omylem je považovat každé tvrzení o sledování za iracionální.

## Příklad (anonymizovaný kompozit)

Žena po rozchodu zjistí, že bývalý partner opakovaně zmiňuje podrobnosti z jejího bytu – kdy přišla
domů, s kým mluvila. Policie zprvu nic nenajde. Poradkyně z poradny pro oběti s ní projde zařízení
v bytě a zjistí, že kamera u dveří a domácí asistent jsou stále přihlášeny k účtu, který založil
partner. Spolu s technikem a s policií připraví postup, jak účty převést, a doklady zajistí pro
řízení. Žena říká, že nejdůležitější bylo, že jí konečně někdo uvěřil.

## Meze a otevřené otázky

Kniha se Shodanu dotýká jen v rozsahu, v němž souvisí s obranou; nenahrazuje bezpečnostní literaturu.
Otevřená zůstává otázka, jak by výrobci zařízení a služeb měli navrhovat sdílené účty, aby nebylo
snadné je zneužít v kontrolujícím vztahu, a jak by pomáhající služby měly zahrnout technologickou
bezpečnost do běžné práce s oběťmi.

## Literatura

- Dittrich, D., & Kenneally, E. (2012). *The Menlo Report: Ethical Principles Guiding Information and Communication Technology Research*. U.S. Department of Homeland Security.
- Freed, D., Palmer, J., Minchala, D., Levy, K., Ristenpart, T., & Dell, N. (2018). „A stalker's paradise“: How intimate partner abusers exploit technology. In *Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems*. ACM.
- Kerckhoffs, A. (1883). La cryptographie militaire. *Journal des sciences militaires*, 9, 5–38.
- Saltzer, J. H., & Schroeder, M. D. (1975). The protection of information in computer systems. *Proceedings of the IEEE*, 63(9), 1278–1308.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford University Press.

## Související

**Glosář**

- [Shodan](@/glossary/shodan.md) – technické heslo, které most propojuje.
- [Censys](@/glossary/censys.md) – nezávislý zdroj podobných dat.
- [Coercive control](@/glossary/coercive-control.md) – rámec, do něhož patří technologické sledování.
- [Dual-use poznání](@/glossary/dual-use-poznani.md) – etika nástrojů s dvojím užitím.

**Kniha**

- [Perimeter a EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) – vystavená aktiva a manipulace.
- [Právo o coercive control](@/kompendium/forensic-legal/12-coercive-control-law.md) – právní rámec kontroly.
- [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md) – osobní obrana.
- [Threat Intel Source Validation](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md) – ověřování zpráv o hrozbách.

**Sesterské mosty**

- [Bridge: Censys](@/kompendium/glossary-bridges/bridge-censys.md) – akademický sken internetu.
- [Bridge: EASM](@/kompendium/glossary-bridges/bridge-easm.md) – správa vnější útočné plochy.
- [Bridge: GreyNoise](@/kompendium/glossary-bridges/bridge-greynoise.md) – šum na pozadí.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Shodan](@/glossary/shodan.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
