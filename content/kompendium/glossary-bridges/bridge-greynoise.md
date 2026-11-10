+++
title = "Bridge: GreyNoise (šum na pozadí)"
description = "Most mezi heslem GreyNoise a knihou: odlišení cíleného útoku od oportunistického šumu, chyba základní četnosti, únava z výstrah a lidská obdoba – kdy je tlak cílený a kdy ne."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "greynoise", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["greynoise", "censys", "shodan", "easm", "signal-plurality", "reality-testing"]
glossary_target = "greynoise"
toc = false
+++

# Bridge: GreyNoise (šum na pozadí)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[GreyNoise](@/glossary/greynoise.md) je služba kybernetického zpravodajství, která sbírá a třídí
**internetový šum na pozadí** – neustálé automatizované skenování a zkoušení, které na internetu probíhá
bez ohledu na to, kdo je jeho cílem. Síť pasivních senzorů zaznamenává nevyžádaný provoz a určuje, zda
pochází od neškodných aktérů (výzkumných skenerů, vyhledávačů) nebo od škodlivých (botnetů, červů,
skenerů zranitelností). Analytik tak může odlišit cílený útok proti své organizaci od oportunistického
šumu, který dopadá na každého.

Jev, s nímž služba pracuje, popsal výzkum dávno předtím. Pang, Yegneswaran, Barford, Paxson a Peterson
(2004) charakterizovali „radiaci pozadí internetu“ – provoz, který dorazí na nepoužívané adresy a
nemá legitimní účel. Moore a spolupracovníci (2006) ukázali, jak lze z takového pozorování vyvozovat
o útocích jinde v síti. Heslo patří do kontextu platformy a kybernetické bezpečnosti. Kniha ho zařazuje
mezi mosty kvůli otázce, kterou služba řeší a která má přesnou lidskou obdobu: **týká se to mě, nebo
všech?**

## Šum a signál očima knihy

Teorie detekce signálu, jak ji formulovali Green a Swets (1966), ukazuje, že každé rozhodování
v podmínkách šumu má dvě složky: citlivost (jak dobře se signál odlišuje od šumu) a kritérium (jak
ochotně pozorovatel řekne „signál“). Posunem kritéria lze snížit jeden druh chyby jen za cenu zvýšení
druhého. Axelsson (2000) na tom ukázal, proč je detekce průniků tak obtížná: protože skutečné útoky jsou
vzácné ve srovnání s běžným provozem, i velmi přesný detektor vyprodukuje víc falešných poplachů než
skutečných nálezů. Tento problém základní četnosti je jádrem toho, proč má smysl šum nejprve odfiltrovat.

Kniha tento poznatek přenáší na rozpoznávání manipulace. Lidé žijí v prostředí, kde na ně neustále
působí reklama, politická komunikace, sociální tlak a anonymní nepřátelství na sítích. Většina tohoto
tlaku je „šum na pozadí“, který dopadá na všechny. Cílená manipulace se od něj liší soustředěností,
vytrvalostí a přizpůsobením konkrétní osobě. Rozlišení je důležité oběma směry: kdo cílený tlak
považuje za šum, přehlédne skutečnou hrozbu; kdo šum považuje za cílený tlak, žije v trvalém
ohrožení, které neodpovídá skutečnosti.

## Kde se pojem v knize vyskytuje

Technické použití dat o šumu při mapování vystavených aktiv popisuje stránka
[Perimeter a EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md); ověřování zdrojů
zpravodajství o hrozbách kapitola [Threat Intel Source Validation](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md).
Odlišení koordinované činnosti od spontánní rozvádějí kapitola
[Bot Detection v investigativním workflow](@/kompendium/cross-domain/6-ea-osint-bot-detection.md) a
detekční signatura [Bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md).

Opačné riziko – vidět cílenou manipulaci tam, kde není – rozebírá kritická kapitola
[Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md).
Klinické odlišení přiměřené ostražitosti od paranoidního prožívání je předmětem oddílu
[Diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md).

## Od pojmu k praxi

### Rozpoznání

Cílený tlak se od šumu liší několika rysy, které lze pozorovat i bez technických nástrojů. Je
**přizpůsobený** – obsahuje údaje, které se týkají konkrétní osoby. Je **vytrvalý** – nevyhasne, když
ho člověk ignoruje. Je **koordinovaný** – pochází z více míst, ale nese stejný rámec nebo stejné
formulace. A je **eskalující** – reaguje na obranu změnou taktiky. Šum na pozadí naopak dopadá stejně
na mnoho lidí, je obecný a nereaguje na konkrétní reakci. Wohlstetter (1962) ukázala, že skutečné
varovné signály se v historii často ztratily právě v šumu, který je obklopoval; dovednost rozlišovat
je proto obrannou dovedností.

### Obrana

Obranou je nejprve odfiltrovat šum a teprve potom posuzovat, co zbylo. Pro jednotlivce to znamená
porovnat vlastní zkušenost se zkušeností ostatních: dostávají podobné zprávy i jiní, nebo jen já?
Pomáhá [pluralita signálů](@/glossary/signal-plurality.md) – názor důvěryhodné třetí osoby, která situaci
vidí zvenčí. Pro instituce kniha doporučuje, aby systémy hlášení obtěžování a výhrůžek uměly rozlišit
plošnou vlnu od cílené kampaně, protože každá vyžaduje jinou odpověď.

### Náprava

Po zkušenosti s cílenou manipulací nebo pronásledováním se u mnoha lidí kritérium posune: všechno
začne vypadat jako signál. Taková zvýšená ostražitost je pochopitelnou adaptací, ale dlouhodobě
vyčerpává a izoluje. Zotavení zahrnuje postupnou kalibraci – obnovu schopnosti rozlišit, co se týká
mě, a co je běžný šum. Kniha k tomu vede v návodu
[Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) a v protokolu
[Subakutní detekční trénink](@/kompendium/recovery-protocols/subacute-detection-training.md).

### Rámec pro profesionály

Pro kliniky je rozlišení šumu a signálu diferenciálně diagnostickou otázkou. Freeman a spolupracovníci
(2005) ukázali, že paranoidní myšlenky tvoří v běžné populaci kontinuum a že jejich přítomnost sama
o sobě neznamená psychózu. Zároveň platí, že člověk, který tvrdí, že je cíleně sledován, může mít
pravdu. Kniha proto doporučuje neposuzovat jen obsah obavy, ale ověřovat ji – viz pojem
[testování reality](@/glossary/reality-testing.md) – a zjišťovat vnější doklady dřív, než se obava
označí za symptom.

## Odlišení od příbuzných pojmů

GreyNoise je třeba odlišit od služeb [Censys](@/glossary/censys.md) a [Shodan](@/glossary/shodan.md),
které aktivně skenují internet a ptají se, co je vystaveno; GreyNoise pasivně naslouchá a ptá se, kdo
skenuje. Od běžné detekce průniků se liší tím, že nehledá útoky, ale to, co útokem není, a tím
detekci ulehčuje. V lidské analogii je třeba odlišit kalibrovanou ostražitost od nedůvěry vůči všemu
a od naivity, která nic nepovažuje za cílené.

## Časté omyly

Prvním omylem je domněnka, že šum je neškodný; oportunistické útoky jsou skutečné a mohou uspět.
Odfiltrování šumu znamená jen to, že nevyžaduje zvláštní vysvětlení. Druhým omylem je přesvědčení, že
víc výstrah znamená víc bezpečí; Axelsson (2000) ukazuje, že záplava falešných poplachů vede k jejich
přehlížení. Třetím omylem je považovat každý pocit ohrožení za iracionální.

## Příklad (anonymizovaný kompozit)

Učitelka po veřejném vystoupení k citlivému tématu dostane během týdne desítky nenávistných zpráv.
Cítí se cíleně pronásledována a přestává spát. Kolegyně s ní zprávy projde a rozdělí je: většina jsou
obecné urážky, které stejnou dobou dostávali i další řečníci z téže akce. Tři zprávy však obsahují její
domácí adresu a jména dětí. Ty škola předá policii a učitelka dostane podporu. Rozlišení neubralo
vážnost tomu, co vážné bylo, ale vrátilo jí pocit, že ne každá zpráva znamená stejné nebezpečí.

## Meze a otevřené otázky

Přenos pojmu šumu na pozadí z internetového provozu na lidské prostředí je analogie. Otevřená
zůstává otázka, jak rozlišovat v situaci, kdy se cílená kampaň záměrně maskuje jako spontánní šum –
kniha tento vzorec popisuje u koordinovaného nepravého chování. Druhou otázkou je, jak dlouho po
zkušenosti s cíleným tlakem je zvýšená ostražitost přiměřená a kdy se z ochrany stává zátěž.

## Literatura

- Axelsson, S. (2000). The base-rate fallacy and the difficulty of intrusion detection. *ACM Transactions on Information and System Security*, 3(3), 186–205.
- Freeman, D., Garety, P. A., Bebbington, P. E., et al. (2005). Psychological investigation of the structure of paranoia in a non-clinical population. *British Journal of Psychiatry*, 186(5), 427–435.
- Green, D. M., & Swets, J. A. (1966). *Signal Detection Theory and Psychophysics*. Wiley.
- Moore, D., Shannon, C., Brown, D. J., Voelker, G. M., & Savage, S. (2006). Inferring Internet denial-of-service activity. *ACM Transactions on Computer Systems*, 24(2), 115–139.
- Pang, R., Yegneswaran, V., Barford, P., Paxson, V., & Peterson, L. (2004). Characteristics of Internet background radiation. In *Proceedings of the 4th ACM SIGCOMM Internet Measurement Conference*.
- Wohlstetter, R. (1962). *Pearl Harbor: Warning and Decision*. Stanford University Press.

## Související

**Glosář**

- [GreyNoise](@/glossary/greynoise.md) – technické heslo, které most propojuje.
- [Censys](@/glossary/censys.md) – aktivní skenování jako protějšek pasivního naslouchání.
- [Reality testing](@/glossary/reality-testing.md) – ověřování obavy proti vnějším dokladům.
- [Signal Plurality](@/glossary/signal-plurality.md) – pohled třetí osoby jako filtr.

**Kniha**

- [Bot coordination](@/kompendium/detection-signatures/20-network-bot-coordination.md) – koordinovaný tlak oproti šumu.
- [Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md) – vidět útok, kde není.
- [Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) – obnova rozlišovací schopnosti.
- [Diferenciální diagnostika EA vs. psychóza](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md) – ostražitost a paranoia.

**Sesterské mosty**

- [Bridge: Censys](@/kompendium/glossary-bridges/bridge-censys.md) – akademický sken internetu.
- [Bridge: Shodan](@/kompendium/glossary-bridges/bridge-shodan.md) – vyhledávač zařízení.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [GreyNoise](@/glossary/greynoise.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
