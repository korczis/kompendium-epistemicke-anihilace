+++
title = "Blue Team (modrý tým)"
weight = 20
description = "Obranná strana informační bezpečnosti, která útoky odhaluje, vyhodnocuje a odráží, a proč se signál musí stát doloženým zjištěním dřív, než se podle něj jedná."

[taxonomies]
tags = ["glossary", "security"]

[extra]
category = "security"
related_terms = ["red-team", "purple-team"]
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-14"
keywords = ["blue team", "modrý tým", "obrana", "reakce na incident", "NIST", "detekce", "falešné poplachy", "doložené zjištění"]
+++

## Definice

**Blue team** (modrý tým) je v informační bezpečnosti obranná strana: tým, který chrání systémy a
organizaci, útoky odhaluje, vyhodnocuje a odráží a po incidentu obnovuje provoz. Ve cvičeních stojí proti
[red teamu](@/glossary/red-team.md), který simuluje protivníka, a jejich spolupráci nad týmiž zjištěními
popisuje heslo [purple team](@/glossary/purple-team.md). Rámec kybernetické bezpečnosti NIST rozděluje práci,
kterou obranná strana vykonává, do funkcí řízení, identifikace, ochrany, detekce, reakce a obnovy (NIST,
2024).

Podstatou pojmu je, že obrana není jednorázový zásah, ale trvalá činnost. Příručka NIST pro zvládání
bezpečnostních incidentů popisuje její průběh jako cyklus přípravy, detekce a analýzy, omezení a odstranění
incidentu, obnovy a poučení z incidentu, v němž se zkušenost z každého incidentu vrací do přípravy na další
(Cichonski a kol., 2012).

## Původ a kontext pojmu

Pojem pochází z vojenských cvičení, v nichž „modrá“ strana bránila vlastní síly proti „červené“ straně, která
simulovala nepřítele. V informační bezpečnosti se ustálil jako označení obranného týmu ve cvičeních a obecně
jako označení bezpečnostního provozu, který systémy hlídá a reaguje na incidenty (Cichonski a kol., 2012).

Rámec, podle něhož obranné týmy svou práci organizují, se postupně rozšiřoval. NIST vydal první verzi
rámce kybernetické bezpečnosti v roce 2014 jako dobrovolný soubor postupů pro ochranu kritické
infrastruktury, a verze 2.0 ho rozšířila na všechny organizace a doplnila funkci řízení, která obranu váže na
odpovědnost vedení a na řízení rizik (NIST, 2024). Obrana tím přestává být jen technickou činností
bezpečnostního týmu a stává se součástí toho, jak organizace rozhoduje.

Strom a kolegové (2018) popisují, jak katalog MITRE ATT&CK proměnil práci obranného týmu: místo hledání
jednotlivých známých podpisů škodlivého kódu může obrana budovat detekční analýzy zaměřené na chování
útočníka a hodnotit, které techniky protivníka dokáže zachytit a které ne.

## Jak se projevuje

V praxi se blue team projevuje jako průběžné sledování a vyhodnocování signálů z provozu. Obranný tým třídí
výstrahy, rozhoduje, které z nich vyžadují zásah, a u skutečných incidentů postupuje podle připraveného
postupu pro jejich omezení a odstranění (Cichonski a kol., 2012).

Velkou část této práce tvoří zacházení s falešnými poplachy. Alahmadi, Axon a Martinovic (2022) v rozhovorech s
analytiky bezpečnostních dohledových center ukázali, že velký podíl výstrah se ukáže jako planý a že zahlcení
výstrahami vede k únavě, při níž analytici přehlížejí i ty, které jsou skutečné. Obrana proto stojí nejen na
počtu výstrah, ale na schopnosti je doložit a odlišit.

## Mechanismus

Mechanismus obrany spočívá v tom, že signál se mění v doložené zjištění. Výstraha sama je jen podnětem;
teprve když obranný tým ověří, odkud signál pochází, zda ho potvrzují jiné zdroje a jak spolehlivé jsou,
vzniká zjištění, které lze obhájit a na jehož základě lze jednat (Cichonski a kol., 2012). Strom a kolegové
(2018) tento posun popisují jako přechod od detekce indikátorů k detekci chování.

Detekční pravidlo, na němž obrana stojí, lze chápat jako hypotézu o chování útočníka: tvrdí, že určitá
technika zanechá určitou stopu. Má-li taková hypotéza smysl, musí být možné popsat pozorování, které by ji
vyvrátilo, a tak ji také ověřovat, což je Popperovo (1963) kritérium odlišující vědecké tvrzení od
nevyvratitelného. Strom a kolegové (2018) z téhož důvodu navrhují zapisovat každé obranné opatření jako
tvrzení o tom, kterou techniku protivníka detekuje, aby ho bylo možné jednu po druhé vyzkoušet a obranu
hodnotit podle toho, co skutečně zachytí, nikoli podle toho, co o sobě tvrdí.

*Interpretace knihy*: z tohoto mechanismu plyne obdoba obrany, kterou kniha doporučuje lidem a kterou v
metodologii výzkumu popsal Denzin (1978) jako triangulaci. Opírat tvrzení o
více nezávislých zdrojů, zachovat rozpory místo jejich uhlazení a sledovat i pozvolné posuny pod prahem
pozornosti jsou zásady, které popisuje [triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)
a [detekční signatury](@/kompendium/detection-signatures/_index.md).

## Odlišení

| Odlišit od | Rozdíl |
| --- | --- |
| [Red team](@/glossary/red-team.md) | útočná strana, která obranu prověřuje simulací protivníka |
| [Purple team](@/glossary/purple-team.md) | spolupráce útočné a obranné strany nad týmiž zjištěními |
| Reakce na incident | jedna z fází práce obranného týmu, nikoli celá jeho činnost |
| Bezpečnostní audit | posuzuje soulad s požadavky v určitém okamžiku; blue team brání průběžně |
| Bezpečnostní dohledové centrum (SOC) | organizační útvar, v němž obranný tým obvykle pracuje a výstrahy třídí; blue team je role ve cvičení i v provozu, nikoli místo |

## Význam pro Kompendium

V Kompendiu je blue team obranným protějškem v trojici, kterou doplňují red team a purple team. *Interpretace
knihy*: kniha z ní přejímá rozlišení mezi výstrahou a doloženým zjištěním, protože totéž rozlišení platí pro
člověka, který čelí manipulaci: dojem, že „něco nesedí“, je výstraha, a teprve jeho ověření s jinými zdroji je
zjištění, na jehož základě lze jednat (Cichonski a kol., 2012).

Druhé užití se týká únavy z poplachů. *Interpretace knihy*: kdo je zahlcen množstvím varovných signálů,
přestane je rozlišovat, a manipulace toho může využít tím, že skutečný signál schová mezi mnoho planých; totéž
pozorování popsali Alahmadi, Axon a Martinovic (2022) u bezpečnostních analytiků.

## Obrana a zotavení

Každý incident je pro obranný tým zdrojem poučení. Příručka NIST řadí na konec cyklu zvládání incidentu
fázi poučení, v níž tým rozebírá, co se stalo, co fungovalo a co ne, a jak upravit přípravu, aby se podobný
incident neopakoval nebo byl odhalen dřív (Cichonski a kol., 2012). Bez této fáze se obrana nezlepšuje, jen
opakuje.

Rámec NIST (2024) staví vedle detekce a reakce samostatnou funkci obnovy, která se týká návratu k
běžnému provozu a obnovy důvěry. *Interpretace knihy*: totéž rozlišení platí pro člověka po manipulaci;
odhalit, že k ní došlo, a ubránit se dalšímu působení je jen část cesty, a obnova vlastního úsudku a vztahů
je samostatný úkol, který kniha popisuje v protokolech zotavení.

## Meze pojmu a kritika

Obrana je vždy připravena hlavně na to, co zná. Strom a kolegové (2018) upozorňují, že katalog chování
protivníka zachycuje chování, které už někdo zaznamenal, a obranný tým, který ho pokryje celý, je připraven na
známé útoky, ne na všechny.

Druhou mezí je, že úspěch obrany se obtížně měří. Incidenty, které obrana zastavila včas, často nikdo
nezaznamená, kdežto ty, které prošly, jsou vidět. *Interpretace knihy*: měření obrany podle počtu uzavřených
výstrah naráží na tutéž past, kterou popisuje heslo [purple team](@/glossary/purple-team.md): když se míra
stane cílem, přestane měřit, což ukázala už Strathernová (1997).

## Literatura

- Alahmadi, B. A., Axon, L., & Martinovic, I. (2022). *99% false positives: A qualitative study of SOC analysts' perspectives on security alarms*. In Proceedings of the 31st USENIX Security Symposium.
- Cichonski, P., Millar, T., Grance, T., & Scarfone, K. (2012). *Computer Security Incident Handling Guide* (NIST SP 800-61 Rev. 2). Gaithersburg: National Institute of Standards and Technology.
- Denzin, N. K. (1978). *The Research Act: A Theoretical Introduction to Sociological Methods* (2nd ed.). New York: McGraw-Hill.
- NIST. (2024). *The NIST Cybersecurity Framework (CSF) 2.0*. Gaithersburg: National Institute of Standards and Technology.
- Popper, K. R. (1963). *Conjectures and Refutations*. London: Routledge.
- Strathern, M. (1997). „Improving ratings“: audit in the British University system. *European Review*.
- Strom, B. E., a kol. (2018). *MITRE ATT&CK: Design and Philosophy*. MITRE.

## Související

- [Red Team](@/glossary/red-team.md) – útočná strana, která obranu prověřuje.
- [Purple Team](@/glossary/purple-team.md) – spolupráce útočné a obranné strany.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: blue-team](@/kompendium/glossary-bridges/bridge-blue-team.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
