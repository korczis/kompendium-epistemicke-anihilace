+++
title = "OSINT: detekce botů a automatizovaných účtů"
description = "Co detekce botů umí a neumí: příznaky automatizace, kyborgové účty, falešně pozitivní nálezy a proč skóre „bot“ nikdy není důkazem o člověku."
weight = 60

[taxonomies]
tags = ["kompendium", "cross-domain", "osint"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["5-ea-osint-social-media-manipulation", "7-ea-osint-narrative-injection", "11-ea-dd-decision-engine-calibration", "19-ea-security-disinformation-defense"]
parent = "kompendium-cross-domain"
toc = true
+++

Automatizované účty na sociálních sítích – boti – mohou zesilovat obsah, vytvářet dojem
širokého souhlasu, zahlcovat diskusi nebo obtěžovat konkrétní lidi. Jejich detekce je proto
důležitou součástí analýzy manipulace v online prostředí. Zároveň je to oblast, v níž se
snadno zaměňuje pravděpodobnostní odhad za verdikt: označit člověka za „bota“ znamená
popřít, že jeho hlas je skutečný. V knize, která se zabývá tím, jak se lidem upírá oprávnění
být slyšen, je to riziko, které nelze přehlížet.

## Doména a problém

Ferrara a kolegové (2016) popsali vzestup sociálních botů jako automatizovaných účtů, které
napodobují lidské chování a interagují s lidmi. Typy sahají od zjevných automatů (účty
sdílející stále stejný obsah) přes „kyborgy“ (účty řízené člověkem s pomocí automatizace)
po účty s ukradenou nebo vygenerovanou identitou. Varol a kolegové (2017) vyvinuli a popsali
nástroj strojového učení, který na základě stovek znaků účtu – aktivity, sítě, obsahu, času –
odhaduje pravděpodobnost automatizace; nástroj Botometer z Indiana University se stal ve
výzkumu široce používaným.

Cresci (2020) v přehledu deseti let výzkumu detekce botů ukazuje, že detekce a vývoj botů
jsou v neustálém závodě: jakmile se znak automatizace stane známým, provozovatelé ho upraví.
Rauchfleisch a Kaiser (2020) systematicky doložili, že nástroje pro detekci botů mají
vysokou míru falešně pozitivních i falešně negativních nálezů, výsledky se mění v čase
a závisejí na jazyce účtu. Proto nelze skóre z detekčního nástroje použít jako spolehlivé
označení jednotlivého účtu, a výzkum, který stojí jen na takovém skóre, může dospět
k nesprávným závěrům o rozsahu automatizace.

## Průnik s epistemickou anihilací

Boti jsou technickým nástrojem pro to, co kniha popisuje jako [pseudo-konsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md)
a [pseudo-peer mob](@/kompendium/techniques/ea-2-1-2-pseudo-peer-mob.md): vytvářejí dojem,
že „mnoho lidí“ sdílí určitý názor nebo útočí na určitou osobu. Na straně cíle tento dojem
působí silně – sociální důkaz patří k nejsilnějším mechanismům vlivu (Cialdini 1984) –
a může vést k pochybnostem o vlastním úsudku nebo ke stažení z veřejného prostoru.

Na straně analytika a veřejné debaty vzniká opačné riziko. Nálepka „bot“ se stala
rétorickým nástrojem: nepohodlné názory se odbývají tím, že je „píšou boti“, a skuteční
lidé, kteří nesouhlasí, jsou tak vyřazeni z rozhovoru. To je forma [delegitimizace](@/glossary/delegitimizace.md),
kterou kniha popisuje u jednotlivců, přenesená na celé skupiny hlasů.

Třetím průnikem je vliv na samotného analytika. Kdo dlouho sleduje automatizované kampaně,
začne je vidět všude; každá vlna podobných příspěvků vypadá jako koordinace. Tato
hypervigilance je pochopitelná, ale zkresluje obraz stejně jako naivita – a v knize ji
lze přirovnat k přehnané podezíravosti, která po zkušenosti s manipulací nahrazuje
schopnost rozlišovat.

## Rozpoznávací znaky

Mezi znaky, které zvyšují pravděpodobnost automatizace, patří **nepřirozená pravidelnost
aktivity** (stejné intervaly, aktivita bez denního rytmu), **vysoký objem** sdílení bez
vlastního obsahu, **profil bez osobní historie** (generický obrázek, jméno s číslicemi,
nedávné založení), **sdílení napříč nesouvisejícími tématy** podle aktuální kampaně
a **koordinace se skupinou podobných účtů** (viz [Bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md)).
Každý z těchto znaků má nevinné vysvětlení: noční pracovníci jsou aktivní v nepravidelné
době, mnoho lidí si nechce dávat fotografii, aktivisté sdílejí velké množství obsahu
a nováčci mají krátkou historii. Proto se znaky posuzují na úrovni **sítě a vzorce**,
ne na úrovni jednoho účtu.

## Rámec: právo, standardy a odpovědnost

Nařízení (EU) 2022/2065 (DSA) ukládá velmi velkým online platformám posuzovat systémová
rizika včetně manipulace služby prostřednictvím neautentického používání nebo automatizovaného
zneužívání a přijímat opatření k jejich zmírnění. Nařízení (EU) 2024/1689 o umělé inteligenci
stanoví povinnosti transparentnosti pro systémy, které s lidmi interagují nebo generují
obsah. Při analýze účtů platí GDPR – za každým účtem, který není botem, je člověk, a
i u podezřelých účtů je třeba pracovat s daty přiměřeně.

## Ochranná opatření

Pro analytika z výše uvedeného plynou čtyři pravidla. Detekční skóre je **hypotéza, ne
nález**: uvádí se s mírou nejistoty a s popisem nástroje a jeho verze. Závěr o automatizaci
se opírá o **více nezávislých znaků** a ideálně o ruční posouzení vzorku. Analýza popisuje
**vzorec a jeho rozsah**, nikoli seznam „botů“ s konkrétními účty, pokud k tomu není silný
důvod a pečlivé ověření. A konečně, analytik **nepoužívá nálepku jako argument** – otázka,
zda je názor pravdivý, je nezávislá na tom, kdo ho šíří. Navazující postupy shrnuje
[kalibrace rozhodovacího systému](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md).

## Lidský rozměr a zotavení

Lidé, kteří se stali cílem útoku automatizovaných nebo koordinovaných účtů, často popisují,
že objem útoku je přesvědčil, že jsou v neprávu, nebo že je „všichni nenávidí“. Pomáhá jim
pochopení, že objem nevypovídá o počtu skutečných lidí ani o oprávněnosti kritiky, a praktická
opatření: omezení oznámení, delegování správy účtu, dokumentace pro platformu. Naopak lidé,
kteří byli chybně označeni za boty, popisují ponížení a vyloučení z debaty; pro ně je
důležitá možnost odvolání u platformy a veřejná oprava. Obecné postupy popisuje
[Mobilizace podpory](@/kompendium/self-defense-guides/30-support-mobilization.md).

## Přesah do dalších oborů

Problém „automatizovaného hlasu“ přesahuje sociální sítě. V regulatorních konzultacích se
objevují tisíce identických připomínek, u nichž je třeba rozlišit organizovanou kampaň
skutečných lidí od automatizovaného podávání. Ve vzdělávání učitelé řeší, zda text napsal
student, nebo jazykový model – a nástroje pro detekci generovaného textu mají stejné slabiny
jako detekce botů: falešně pozitivní nálezy zasahují nepřiměřeně lidi, kteří píší jinak
než většina, například nerodilé mluvčí. V zákaznických a recenzních systémech se stejné
otázky týkají falešných recenzí. Všude platí poučení z výzkumu detekce botů (Rauchfleisch
a Kaiser 2020): pravděpodobnostní nástroj nemá rozhodovat o jednotlivém člověku bez
lidského posouzení a možnosti obrany. Kniha k tomu nabízí praktický návod
[Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md).

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Výzkumný tým analyzuje diskusi o regionálním projektu
a detekční nástroj označí třetinu účtů za pravděpodobně automatizované. Ruční kontrola
vzorku ukáže, že většina označených účtů patří starším lidem s minimální aktivitou, kteří
se zapojili poprvé, a malá skupina skutečně automatizovaných účtů sdílí obsah jedné stránky.
Zpráva proto uvádí, že automatizace se podílela na šíření obsahu jedné stránky, ale
diskusi jako celek vedli převážně skuteční lidé. Původní číslo „třetina botů“ by v médiích
vyznělo jako důkaz, že odpor proti projektu je umělý – a zbavilo by místní obyvatele hlasu.

## Meze a otevřené otázky

S generativními modely se rozdíl mezi lidským a automatizovaným obsahem dále stírá
a znaky, na nichž stála detekce, ztrácejí platnost. Otevřenou otázkou je, zda detekce
jednotlivých účtů vůbec zůstane užitečná, nebo zda se analýza musí přesunout k ověřování
původu obsahu a ke sledování koordinačních vzorců.

## Literatura

- Cialdini, R. B. (1984). *Influence: The Psychology of Persuasion.*
- Cresci, S. (2020). A decade of social bot detection.
- Ferrara, E., Varol, O., Davis, C., Menczer, F., Flammini, A. (2016). The rise of social bots.
- Rauchfleisch, A., Kaiser, J. (2020). The false positive problem of automatic bot detection in social science research.
- Varol, O., Ferrara, E., Davis, C. A., Menczer, F., Flammini, A. (2017). Online human-bot interactions: Detection, estimation, and characterization.

## Související

**Mezioborové mosty**

- [Manipulace na sociálních sítích](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md) – širší kontext.
- [Injekce narativu](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) – co boti šíří.
- [Kalibrace rozhodovacího systému](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md) – skóre a jeho výklad.

**Signatury, techniky a scénáře**

- [Bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md) – detekční signatura.
- [EA-2.1.2 Pseudo-peer mob](@/kompendium/techniques/ea-2-1-2-pseudo-peer-mob.md) – zdánlivý dav kolegů.
- [Vzdělávací scénář: koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md) – nácvik rozpoznání.

**Pojmy a kritika**

- [Delegitimizace](@/glossary/delegitimizace.md) – nálepka jako vyřazení z debaty.
- [Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md) – obecná námitka.
