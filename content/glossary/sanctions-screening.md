+++
title = "Sanctions screening (sankční prověrka)"
weight = 29
description = "Prověřování osob a subjektů proti sankčním seznamům EU, OSN, USA a Spojeného království, a proč je shoda jména na seznamu hypotéza, nikoli zjištění."

[taxonomies]
tags = ["glossary", "compliance", "osint", "due-diligence"]

[extra]
category = "osint"
aliases = ["sankční prověrka", "sankční prověrky", "sankčních prověrek"]
related_terms = ["osint", "intelligence-fusion", "entity-resolution", "compliance-framework", "due-diligence", "risk-score"]
keywords = ["sankční prověrka", "sanctions screening", "sankční seznamy", "restriktivní opatření", "OFAC", "FATF", "porovnávání jmen", "falešně pozitivní shoda"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-22"
date_modified = "2026-11-14"
+++

## Definice

**Sankční prověrka** (*sanctions screening*) je proces, v němž se fyzické osoby, organizace, plavidla a
další subjekty porovnávají s oficiálními sankčními seznamy, které vedou státní a nadnárodní orgány. Mezi
hlavní seznamy patří konsolidovaný seznam osob a subjektů podléhajících restriktivním opatřením Evropské
unie, konsolidovaný seznam Rady bezpečnosti OSN, seznam SDN amerického úřadu OFAC a seznam britského úřadu
OFSI. Mezinárodní standard pro tuto povinnost stanovují doporučení Finančního akčního výboru, která po
státech požadují, aby uplatňovaly cílené finanční sankce bez prodlení (FATF, 2012).

Sankční prověrka je povinností těch, na něž se sankční předpisy vztahují, zejména finančních institucí a
dalších povinných osob, které musí před navázáním obchodního vztahu nebo provedením platby prověřit
protistrany, zákazníky a jejich skutečné majitele. V České republice provádění mezinárodních sankcí
upravuje zákon č. 69/2006 Sb., o provádění mezinárodních sankcí, a sankce Evropské unie se uplatňují
přímo použitelnými nařízeními Rady, jako je nařízení Rady (EU) č. 269/2014 o omezujících opatřeních.

## Původ a kontext pojmu

Ekonomické sankce mají dlouhé dějiny. Hufbauer a kolegové (2007) je sledují od sankcí Společnosti národů
proti Itálii v roce 1935 přes rozsáhlá obchodní embarga studené války a ukazují, že plošné sankce proti celým
státům často dopadaly na obyvatelstvo, aniž by změnily jednání vlád. Z této zkušenosti vznikl posun k cíleným
sankcím, které míří na konkrétní osoby a subjekty, a s ním i potřeba tyto osoby spolehlivě poznat.

Drezner (2011) popisuje, že cílené, takzvaně „chytré“ sankce se staly převažujícím nástrojem po roce 2000,
zejména v boji proti financování terorismu, a že jejich účinnost závisí na tom, zda je lze přesně uplatnit
na označené osoby. Doporučení FATF (2012) tento posun promítla do povinností pro finanční systém: povinné
osoby musí zmrazit majetek označených osob a zajistit, že jim nebudou zpřístupněny žádné prostředky.

## Jak se projevuje

V praxi se sankční prověrka projevuje jako kontrola při vstupu do vztahu a při každé transakci. Povinná
osoba porovná údaje o zákazníkovi a o protistraně se seznamy, a pokud se objeví možná shoda, předá ji k
přezkumu, který rozhodne, zda jde o tutéž osobu (FATF, 2012). Výsledkem je buď uvolnění, nebo zmrazení a
oznámení příslušnému orgánu podle zákona č. 69/2006 Sb., o provádění mezinárodních sankcí.

Prověrka se opakuje i v průběhu vztahu, protože seznamy se mění: přibývají nová označení a některá jsou
zrušena. Hufbauer a kolegové (2007) upozorňují, že sankční režimy se v čase rozšiřují a proměňují podle
politické situace, a prověrka, která byla správná při vstupu, proto nemusí platit později.

## Mechanismus

Jádrem prověrky je porovnávání jmen a dalších identifikátorů, které je obtížnější, než se zdá. Christen
(2012) ukazuje, že jména se v různých zdrojích zapisují různě: liší se přepis z jiného písma, pořadí jmen,
zkratky, překlepy i úplnost údajů, a přesná shoda proto mnoho skutečných shod přehlédne. Systémy proto
používají neostré porovnávání, které počítá s podobností zápisu.

Neostré porovnávání však vede k nevyhnutelné volbě mezi dvěma druhy chyb. Čím volněji se shoda posuzuje,
tím méně skutečných shod unikne, ale tím více nevinných osob s podobným jménem se označí jako možná shoda,
a naopak (Christen, 2012). *Interpretace knihy*: tato volba není technickou podrobností, ale rozhodnutím o
tom, kolik nevinných lidí ponese důsledky podezření, a nemá se činit bez lidského přezkumu.

## Odlišení

| Odlišit od | Rozdíl |
| --- | --- |
| Prověrka politicky exponovaných osob | zjišťuje zvýšené riziko korupce u osob ve veřejných funkcích; neznamená, že by osoba byla sankcionována |
| Prověrka negativních zpráv | hledá v médiích informace o možném nekalém jednání; nejde o úřední seznam |
| [Entity resolution](@/glossary/entity-resolution.md) | obecná technika rozhodování, zda dva záznamy popisují tutéž entitu, na níž sankční prověrka stojí |
| [Due diligence](@/glossary/due-diligence.md) | širší prověrka protistrany, jejíž je sankční prověrka jednou částí |

## Význam pro Kompendium

V Kompendiu se sankční prověrka objevuje tam, kde rozhoduje o lidech. Stránka [sankční seznamy a atribuční
bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) ukazuje, že shoda jména na seznamu je
hypotéza, nikoli zjištění, a že neopatrné závěry mohou poškodit osoby se stejným nebo podobným jménem.
*Interpretace knihy*: tento závěr vyplývá přímo z povahy neostrého porovnávání, které podle Christena
(2012) vždy vyvažuje přehlédnuté shody proti chybně označeným osobám.

Druhé užití se týká prověřování spolupracovníků a dodavatelů. Stránka o [prověrce
dodavatelů](@/kompendium/organizational-defense/26-contractor-vetting.md) zařazuje sankční prověrku mezi
kroky prověrky protistrany. *Interpretace knihy*: kniha ji uvádí jako ochranu instituce, která však musí
respektovat práva prověřovaných osob, jak je popisuje následující oddíl.

## Obrana a zotavení

Pro osobu, která byla chybně označena jako možná shoda, je podstatné vědět, že rozhodnutí o ní nemá stát
jen na automatickém porovnání. Obecné nařízení o ochraně osobních údajů, nařízení (EU) 2016/679, dává
subjektu údajů právo na přístup k údajům, které o něm správce zpracovává (čl. 15), a právo nebýt předmětem
rozhodnutí založeného výhradně na automatizovaném zpracování, které má pro něj právní účinky (čl. 22).

Osoba, která je na sankčním seznamu sama uvedena, má právo zápis napadnout. Soudní dvůr Evropské unie ve
věci *Kadi* rozhodl, že i opatření přijatá k provedení rezolucí Rady bezpečnosti OSN podléhají soudnímu
přezkumu z hlediska základních práv, včetně práva na obhajobu a na účinnou soudní ochranu (Soudní dvůr EU,
2008). *Interpretace knihy*: konkrétní postup v takové věci náleží advokátovi a příslušným orgánům.

## Meze pojmu a kritika

Cílené sankce jsou kritizovány za to, že zapisují osoby na seznamy v řízení, které jim neumožňuje se
bránit. Drezner (2011) upozorňuje, že přechod od plošných k cíleným sankcím přenesl tíhu z celých populací
na jednotlivce, ale zároveň zvýšil význam správnosti každého označení, a rozsudek ve věci *Kadi* ukázal, že
tato správnost musí být soudně přezkoumatelná (Soudní dvůr EU, 2008).

Druhou mezí je samotné porovnávání. Žádné nastavení neostrého porovnávání neodstraní obě chyby zároveň, a
výsledek prověrky je proto vždy podkladem k lidskému posouzení, nikoli rozhodnutím (Christen, 2012).

## Literatura

- Christen, P. (2012). *Data Matching: Concepts and Techniques for Record Linkage, Entity Resolution, and Duplicate Detection*. Berlin: Springer.
- Drezner, D. W. (2011). *Sanctions sometimes smart: Targeted sanctions in theory and practice*. International Studies Review, 13(1).
- FATF. (2012). *International Standards on Combating Money Laundering and the Financing of Terrorism & Proliferation: The FATF Recommendations*. Paris: FATF.
- Hufbauer, G. C., Schott, J. J., Elliott, K. A., & Oegg, B. (2007). *Economic Sanctions Reconsidered* (3rd ed.). Washington, DC: Peterson Institute for International Economics.
- Nařízení Rady (EU) č. 269/2014 o omezujících opatřeních vzhledem k činnostem narušujícím nebo ohrožujícím územní celistvost, svrchovanost a nezávislost Ukrajiny.
- Nařízení Evropského parlamentu a Rady (EU) 2016/679 (obecné nařízení o ochraně osobních údajů).
- Soudní dvůr EU. (2008). *Kadi a Al Barakaat International Foundation v. Rada a Komise*, spojené věci C-402/05 P a C-415/05 P.
- Zákon č. 69/2006 Sb., o provádění mezinárodních sankcí.

## Související

**Glosář**

- [OSINT](@/glossary/osint.md) – metodika přístupu k veřejným sankčním datům.
- [Intelligence Fusion](@/glossary/intelligence-fusion.md) – korelace výsledků prověrek z více zdrojů.
- [Entity Resolution](@/glossary/entity-resolution.md) – technika, na níž stojí přesnost prověrky.
- [Compliance Framework](@/glossary/compliance-framework.md) – regulatorní požadavky, z nichž povinnost prověrky plyne.
- [Due Diligence](@/glossary/due-diligence.md) – hlavní kontext užití.
- [Risk Score](@/glossary/risk-score.md) – skórování rizik, do něhož výsledky vstupují.

**Kompendium**

- [Sankční seznamy a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) – shoda jména jako hypotéza.
- [Prověrka dodavatelů](@/kompendium/organizational-defense/26-contractor-vetting.md) – sankční prověrka v prověrce protistrany.

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: sanctions-screening](@/kompendium/glossary-bridges/bridge-sanctions-screening.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
