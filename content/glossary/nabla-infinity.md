+++
title = "NABLA Infinity (∇∞)"
weight = 31
description = "Epistemický rámec Prismatic Platform se sedmi nepodkročitelnými axiomy pro vznik přesvědčení, ověřování poznatků a zacházení s důkazy."

[taxonomies]
tags = ["glossary", "epistemic", "nabla", "nabla-infinity", "prismatic", "evidence"]

[extra]
category = "epistemic"
abbreviation = "nabla"
related_terms = ["trinity-gate", "signal-plurality", "confidence-threshold", "three-nl", "provenance-mandatory", "blue-team", "consciousness-traits", "entity-resolution", "epistemic-pipeline", "gray-team", "intelligence-fusion", "lean4", "no-doubts", "no-mercy", "nm-nd", "ollama", "qeve", "red-team", "white-team"]
author = "Tomas Korcak (korczis)"
reading_time = "11 min"
word_count = 2258
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["NABLA", "Infinity", "Epistemic", "glossary", "Prismatic Platform", "BLOCK", "Trinity Gate", "NABLA Infinity"]
quality_score = 87
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "NABLA Infinity (∇∞) – glosář"
+++

## Definice

NABLA Infinity (zapisuje se matematickým symbolem operátoru gradientu, který naznačuje
nekonečněrozměrné zkoumání epistemického prostoru, tedy ∇∞) je základní epistemický rámec,
jenž v Prismatic Platform řídí veškerý vznik přesvědčení a ověřování poznatků. Definuje
sedm nepodkročitelných axiomů, které musí splnit každý agent, každá pipeline a každý
rozhodovací proces. Pět axiomů se vynucuje tvrdě (porušení vede k okamžitému zablokování),
dva měkce (porušení vede k varování a šetření). Jednotlivé axiomy podrobně rozebírá heslo
[Axiomy NABLA](@/glossary/nabla-axioms.md).

Rámec působí na úrovni 3 integrace [3NL](@/glossary/3nl.md): není to návrh ani osvědčený
postup, ale strukturní omezení vetkané do běhového prostředí platformy. Agenti nemohou
vytvářet přesvědčení, ověřovat tvrzení ani rozhodovat bez souladu s axiomy NABLA. Axiomy se
vynucují programově v [epistemické pipeline](@/glossary/epistemic-pipeline.md), ověřují se
prostřednictvím [QEVE](@/glossary/qeve.md) a propouštějí se přes [Trinity
Gate](@/glossary/trinity-gate.md).

Filosofické jádro NABLA Infinity je nekompromisní: **Realita není demokracie. Důkazy nejsou
volitelné. Rozpory nejsou ostuda.** Rámec zachází s epistemickou hygienou se stejnou
přísností, jakou typové systémy vnášejí do správnosti softwaru – porušení se zachytí na
úrovni struktury a nenechávají se na lidském úsudku.

Pro Kompendium je NABLA Infinity výchozím bodem: kniha vznikla v kontextu této platformy
a její obranná logika – trvat na více nezávislých zdrojích, zachovat si rozpor, smět říct
„nevím“ – je lidským protějškem těchto axiomů (viz [2.6 Vztah ke Prismatic NABLA
Infinity](@/kompendium/02-uvod/vztah-k-nabla.md)).

## Sedm axiomů

### Axiom 1: Pluralita signálů (tvrdé vynucení)

**Požadavek**: než vznikne jakékoli přesvědčení, jsou potřeba nejméně dva nezávislé signály.

Žádné tvrzení, hypotéza ani závěr nesmí stát na jediném zdroji důkazů, ať se ten zdroj
zdá jakkoli autoritativní. Přesvědčení z jediného zdroje je strukturně křehké – je-li zdroj
chybný, kompromitovaný nebo zastaralý, celé přesvědčení se zhroutí bez jakéhokoli
varovného signálu.

Vynucení plurality signálů ověřuje nezávislost na úrovni zdroje. Dva články téhož
zpravodajského média, které odkazují na tutéž tiskovou zprávu, se počítají jako jeden
signál, ne dva. Dvě nezávislá šetření, která dospějí ke stejnému závěru odlišnými metodami,
se počítají jako dva signály. Pole `independence_group` v datovém modelu důkazů sleduje,
které signály sdílejí společný původ (podrobně [Signal
Plurality](@/glossary/signal-plurality.md)).

**Reakce na porušení**: E2 BLOCK. Přesvědčení je odmítnuto, dokud se nedodají další
nezávislé signály. Pro tento axiom neexistuje obchvat.

### Axiom 2: Zachování rozporu (tvrdé vynucení)

**Požadavek**: existují-li protichůdné důkazy, musí se výslovně zachovat obě strany. Žádnou
z nich nelze zahodit, snížit jí váhu ani ji „odargumentovat“.

Je to nejméně intuitivní axiom a ten, který konvenční systémy umělé inteligence porušují
nejčastěji. Když signál A říká „riziko je vysoké“ a signál B „riziko je nízké“, přirozeným
impulzem je rozpor vyřešit – vybrat vítěze, spočítat průměr nebo slabší signál odmítnout.
NABLA Infinity zakazuje všechny tyto reakce.

Rozpory se zachovávají, protože nesou informaci. Rozpor mezi dvěma věrohodnými zdroji
znamená, že (a) situace je skutečně nejednoznačná, (b) jeden zdroj má informace, které
druhému chybějí, nebo (c) otázka je chybně položená. Všechny tři možnosti jsou cenné.
Předčasné řešení tuto informaci ničí.

Zachované rozpory se označují závažností (slabý, střední, silný) a šíří se pipeline dál.
Vzorec důvěry v [QEVE](@/glossary/qeve.md) obsahuje index rozporu, který snižuje konečnou
důvěru úměrně nevyřešeným rozporům; rozpory se tak nikdy neignorují, i když se zachovávají.

**Reakce na porušení**: E2 BLOCK. Každá operace, která zahodí protichůdný důkaz, se okamžitě
zastaví.

### Axiom 3: Informativní absence (měkké vynucení)

**Požadavek**: chybějící signály se musí sledovat jako datové body. Absence očekávaného
důkazu je sama důkazem.

Když firma, která by měla mít veřejné finanční výkazy, žádné nemá, je absence informativní.
Když doméně, která by měla mít SSL certifikáty, chybějí, je absence signálem. NABLA Infinity
vyžaduje, aby se očekávané, ale chybějící důkazy zaznamenávaly se stejnou přísností jako
přítomné, sledovaly se v grafu přesvědčení a promítaly se do výpočtů důvěry.

Sledování absence brání častému selhání: závěru, že „žádný důkaz rizika“ znamená „důkaz,
že riziko není“. Jsou to logicky odlišná tvrzení a NABLA Infinity jejich rozlišení vynucuje.

**Reakce na porušení**: E1 WARNING. Spustí se šetření. Selhání ve sledování absence je méně
bezprostředně nebezpečné než aktivní potlačování důkazů, ale může se nahromadit do
významných slepých míst.

### Axiom 4: Časový rozpad (tvrdé vynucení)

**Požadavek**: všechna přesvědčení musí nést povinné časové razítko a váha důkazů musí
s časem klesat podle nastavitelných funkcí rozpadu.

Důkaz shromážděný před šesti měsíci je méně spolehlivý než důkaz shromážděný dnes.
Regulatorní prostředí se mění. Firemní struktury se reorganizují. Prostředí hrozeb se
vyvíjí. NABLA Infinity vyžaduje, aby každý signál nesl časové razítko sběru a aby síla
přesvědčení se stárnutím důkazů automaticky klesala.

Funkce rozpadu se nastavují pro každou oblast. Finanční data mohou zastarávat rychleji než
geologická. Zpravodajství o hrozbách zastarává rychleji než záznamy obchodního rejstříku.
Rychlost rozpadu je parametr specifický pro oblast, požadavek rozpadu je ale univerzální.

Časový rozpad brání konkrétnímu selhání: stavění vysoce sebejistých závěrů na zastaralých
důkazech. Posouzení [due diligence](@/glossary/due-diligence.md), které stojí na 18 měsíců
starých datech, aniž by zohlednilo jejich stáří, pracuje s falešným pocitem přesnosti.

**Reakce na porušení**: E2 BLOCK. Přesvědčení bez časových razítek se odmítají. Odmítají se
i přesvědčení s razítky, na něž nebyl uplatněn rozpad.

### Axiom 5: Platnost neznáma (tvrdé vynucení)

**Požadavek**: „nevím“ je legitimní epistemický stav. Systém musí umět nejistotu vyjádřit
a šířit dál, místo aby vynucoval rozhodnutí.

Axiom přímo čelí sklonu systémů umělé inteligence vždy nějakou odpověď vyprodukovat. Když
jsou důkazy nedostatečné, protichůdné nebo zastaralé, správnou odpovědí není odhad s nízkou
důvěrou, ale výslovné konstatování nejistoty. NABLA Infinity vyžaduje, aby agenti, pipeline
a výstupy platformy podporovaly stav „neznámé“ se stejnou strukturní přísností jako
„pravda“ a „nepravda“.

Neznámé stavy se šíří grafem přesvědčení. Je-li kritický předpoklad neznámý, závěry, které
na něm závisejí, zdědí neznámý stav, místo aby potichu převzaly předpokládanou hodnotu.
Toto šíření zajišťuje, že nejistota zůstane rozhodujícím osobám viditelná a nezapadne pod
vrstvami inference.

**Reakce na porušení**: E2 BLOCK. Každá operace, která vynucuje rozhodnutí při
nedostatečných důkazech, se zastaví.

### Axiom 6: Nezávislost zdrojů (měkké vynucení)

**Požadavek**: nezávislé zdroje musí mít vyšší váhu než korelované. Korelace zdrojů se musí
sledovat a promítat do výpočtů důvěry.

Deset článků z různých médií, které citují tutéž původní zprávu, představuje jeden zdroj,
ne deset. NABLA Infinity vyžaduje, aby se nezávislost zdrojů výslovně sledovala seskupováním
podle nezávislosti a aby korelované zdroje dostaly ve výpočtech důvěry přiměřenou slevu.

Nezávislost zdrojů je obzvlášť kritická v kontextu [OSINT](@/glossary/osint.md) (zpravodajství
z otevřených zdrojů), kde je zesilování informací běžné. Jediná vládní tisková zpráva může
vyvolat desítky zpravodajských článků, příspěvků na sociálních sítích a analytických zpráv,
které všechny vedou k témuž původnímu zdroji. Bez sledování nezávislosti maskuje iluze
plurality přesvědčení z jediného zdroje.

**Reakce na porušení**: E1 WARNING. Je povinné posouzení zkreslení. Korelace zdrojů, která je
sledovaná, ale neopravená, dostane varování, ne blokaci, protože samotné sledování zajišťuje
průhlednost.

### Axiom 7: Povinná provenience (tvrdé vynucení)

**Požadavek**: všechna přesvědčení musí jít dohledat k jejich původním signálům úplným,
auditovatelným řetězcem úschovy ([chain of custody](@/glossary/chain-of-custody.md)).

Každý závěr v platformě musí odpovědět na otázku „Odkud to pochází?“. Řetězec provenience
spojuje každé přesvědčení s důkazy, které ho podporují, s inferenčními pravidly, jimiž bylo
odvozeno, a se surovými daty, z nichž byly důkazy vytěženy. Provenience umožňuje tři
kritické schopnosti:

1. **Audit**: externí posuzovatelé mohou každý závěr dohledat k jeho zdrojovým datům.
2. **Ladění**: když je závěr chybný, provenience ukáže, který důkaz nebo který krok
   inference selhal.
3. **Odpovědnost**: provenience určuje, kdo (nebo který agent) vytvořil každou složku
   řetězce uvažování.

Provenience se vynucuje na úrovni datového modelu. Každá struktura důkazu obsahuje pole
`provenance` (úplný řetězec úschovy) a `raw_data_hash` (kryptografický otisk původních dat
pro ověření integrity). Důkaz bez provenience se odmítne dřív, než vstoupí do pipeline.

**Reakce na porušení**: E2 BLOCK. Přesvědčení bez dohledatelné provenience se odmítají.
Obchvat neexistuje.

### Přehled axiomů

| # | Axiom | Vynucení | Porušení | Základní princip |
|---|-------|-------------|-----------|----------------|
| 1 | Pluralita signálů | TVRDÉ | E2 BLOCK | žádná přesvědčení z jediného zdroje |
| 2 | Zachování rozporu | TVRDÉ | E2 BLOCK | nikdy nezahazovat nepohodlné důkazy |
| 3 | Informativní absence | MĚKKÉ | E1 WARNING | chybějící důkaz je důkaz |
| 4 | Časový rozpad | TVRDÉ | E2 BLOCK | přesvědčení s časem slábnou |
| 5 | Platnost neznáma | TVRDÉ | E2 BLOCK | „nevím“ je přijatelné |
| 6 | Nezávislost zdrojů | MĚKKÉ | E1 WARNING | korelované zdroje nejsou nezávislé |
| 7 | Povinná provenience | TVRDÉ | E2 BLOCK | každé přesvědčení musí jít dohledat |

## Addiction Preservation

*Addiction Preservation* je závazek platformy zachovávat protichůdné signály, udržovat
pluralitu důkazů a odmítat „uhlazování“ nepohodlných pravd. Název je zvolen záměrně:
podobně jako zotavení ze závislosti vyžaduje epistemická hygiena trvalou bdělost vůči
lidskému sklonu důkazy racionalizovat, odmítat nebo vybírat jen ty vhodné (viz
[Addiction Recovery](@/glossary/addiction-recovery.md)).

Analogie je přesná. Člověk zotavující se ze závislosti musí zůstat bdělý vůči spouštěčům,
které vypadají neškodně, ale vedou k relapsu. Stejně tak musí epistemický systém zůstat
bdělý vůči zdánlivě rozumným zkratkám, které nahlodávají přísnost:

- „Ten rozpor je nejspíš jen šum – odstraňme ho.“ (pohřbívání rozporu)
- „Potřebujeme už jen jeden zdroj, který to potvrdí.“ ([konfirmační
  bias](@/glossary/konfirmacni-bias.md))
- „Razítko je dost blízko – rozpad není potřeba.“ (obcházení časového rozpadu)
- „Všichni přece vědí, že je to pravda.“ (jediný zdroj vydávaný za obecně známou věc)

Addiction Preservation ukládá, aby platforma každý z těchto impulzů chápala jako hrozbu
epistemické integritě, ne jako rozumnou optimalizaci. Cena zachování falešného rozporu je
nízká (jeden uzel navíc v grafu přesvědčení). Cena zahození skutečného rozporu může být
katastrofální (nepravdivý závěr považovaný za ověřenou pravdu).

## Antivzorce

NABLA Infinity definuje pět zakázaných antivzorců. Nejsou to doporučení, ale pravidla
tvrdého vynucení, která při zjištění spustí blokaci nebo zastavení:

| Antivzorec | Popis | Porušené axiomy | Vynucení |
|--------------|-------------|-----------------|-------------|
| **Cherry picking** (vybírání hrozinek) | výběr jen těch důkazů, které podporují předem daný závěr, a ignorování nebo oslabování protichůdných | pluralita signálů, zachování rozporu | E2 BLOCK |
| **Falešná jistota** | prezentace závěru s vyšší důvěrou, než důkazy podporují, obvykle přehlížením nejistoty nebo signálů absence | platnost neznáma, časový rozpad | E2 BLOCK |
| **Pohřbívání rozporu** | rozpor je přiznán, ale strukturně skryt, takže ho navazující spotřebitelé nikdy neuvidí | zachování rozporu | E3 HALT |
| **Pravda jediného zdroje** | přesvědčení postavené na jednom zdroji (nebo na více korelovaných zdrojích vydávaných za nezávislé) | pluralita signálů, nezávislost zdrojů | E2 BLOCK |
| **Neprůhlednost uvažování** | závěry bez dohledatelného řetězce uvažování, takže audit je nemožný | povinná provenience | E2 BLOCK |

Pohřbívání rozporu má nejpřísnější vynucení (E3 HALT místo E2 BLOCK), protože je to
nejnebezpečnější antivzorec. Na rozdíl od cherry pickingu, který lze odhalit analýzou
signálů, pohřbívání rozporu aktivně skrývá důkazy uvnitř vlastních datových struktur
systému. E3 HALT vyžaduje povinný přezkum na úrovni nejvyšší autority, než může provoz
pokračovat.

Tytéž antivzorce popisuje Kompendium u lidí: výběrové připomínání událostí, vnucená jistota
a skrývání nepohodlné vzpomínky jsou jádrem [gaslightingu](@/glossary/gaslighting.md)
a [epistemické anihilace](@/glossary/epistemicka-anihilace.md). Rozdíl je v tom, že u člověka
je nikdo automaticky „neblokuje“ – obranou je obnovit přístup k nezávislým svědkům
a záznamům.

## Protokol vynucení

Vynucování NABLA Infinity probíhá na čtyřech stupňovaných úrovních:

| Úroveň | Spouštěč | Reakce | Potřebná autorita |
|-------|---------|----------|--------------------|
| **E1** | jediné porušení měkkého axiomu (informativní absence nebo nezávislost zdrojů) | varování, žádost o opravu; operace pokračuje se zaznamenanou odchylkou | úroveň agenta |
| **E2** | jediné porušení tvrdého axiomu nebo zjištění antivzorce | BLOCK; operace zastavena, vydáno odmítnutí; před pokračováním je nutná oprava | úroveň systému |
| **E3** | selhání [Trinity Gate](@/glossary/trinity-gate.md) nebo zjištění pohřbívání rozporu | HALT; povinný přezkum, žádný obchvat, zaznamená se úplná diagnostika | nejvyšší autorita |
| **E4** | více současných porušení axiomů nebo systematický vzorec porušování | úplné šetření, audit všech nedávných hodnocení, povinná analýza kořenových příčin | cosmic clearance |

Vynucení nelze obejít. Neexistuje přepínač, konfigurační volba ani úroveň oprávnění, která
by vynucování axiomů vypnula. Axiomy jsou strukturní omezení, ne preference politiky. Jejich
vypnutí by se rovnalo vypnutí typové kontroly v kompilovaném jazyce – technicky možné, ale
architektonicky destruktivní.

## Napojení na Trinity Gate

NABLA Infinity a [Trinity Gate](@/glossary/trinity-gate.md) mají v epistemické pipeline
doplňující se, ale odlišné role:

- **NABLA Infinity řídí vznik přesvědčení**: jak se důkazy shromažďují, strukturují, váží
  a propojují do grafu přesvědčení.
- **Trinity Gate řídí přijetí přesvědčení**: zda vzniklé přesvědčení splňuje strukturní,
  logické a formální standardy nutné pro přijetí.

Vztah je sekvenční. Axiomy NABLA omezují vstup do Trinity Gate. Graf přesvědčení, který
porušuje pluralitu signálů, neprojde kontrolou logické konzistence Trinity Gate. Graf, který
pohřbívá rozpory, neprojde kontrolou strukturní konzistence. Soulad s NABLA je nutnou (ale
ne postačující) podmínkou průchodu Trinity Gate.

[QEVE](@/glossary/qeve.md) stojí mezi nimi a dodává ověřovací aparát, který převádí grafy
přesvědčení v souladu s NABLA na hodnocení Trinity Gate. První fáze pipeline QEVE
(sestavení grafu) přímo vynucuje axiomy NABLA, pozdější fáze vstupují do tří kontrol
Trinity Gate.

## Přechod k exekuci

Přechod od zkoumání řízeného NABLA k exekuci řízené doktrínou [NM/ND](@/glossary/nm-nd.md) se
řídí přísným protokolem:

```
EXPLORATION PHASE (NABLA Infinity active)
  - Maps uncertainty across the evidence space
  - Preserves all contradictions without resolution
  - Maintains parallel hypotheses simultaneously
  - Computes confidence scores with full uncertainty quantification
  - Tracks time decay and provenance for all signals
        |
        v
TRANSITION CONDITIONS (ALL must be satisfied)
  - confidence >= 0.95 (for critical decisions)
  - trinity_gate.passed (all 3 layers + meta-integrity)
  - axioms_compliant (all 7 NABLA axioms satisfied)
        |
        v
EXECUTION PHASE (NM/ND Doctrine active)
  - [No Mercy](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/): Complete execution, zero tolerance for incomplete delivery
  - [No Doubts](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-doubts/): Full commitment to the verified conclusion
  - Decisive action based on formally verified, robustness-tested beliefs
```

Přechod je kritickým okamžikem procesu uvažování platformy. Před přechodem není pochybnost
jen přípustná, ale povinná – NABLA vyžaduje zachovat nejistotu, udržovat rozpory a přiznávat
neznámé. Po přechodu nahrazuje pochybnost závazek – doktrína [NM/ND](@/glossary/nm-nd.md)
vyžaduje úplnou exekuci bez kliček.

Tento dvoufázový přístup brání oběma selháním: jednat příliš brzy na základě neověřených
přesvědčení (předčasná exekuce) i nikdy nejednat, protože vždy existují další důkazy ke
shromáždění ([paralýza analýzou](@/glossary/paralysis-by-analysis.md)). Axiomy NABLA
definují, co znamená „dostatečné ověření“. Trinity Gate potvrzuje, že ověření je úplné.
NM/ND řídí, co následuje.

Kompendium tuto dvoufázovost čte i jako varování: v manipulativních prostředích se
„přechod k exekuci“ často vynucuje předčasně, uměle vyvolaným časovým tlakem (viz
[detekční signaturu Vytváření časového
tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md)).

## Související

**Pojmy platformy v tomto glosáři**

- [Axiomy NABLA](@/glossary/nabla-axioms.md) – podrobný rozbor všech sedmi axiomů
  s implementací.
- [Trinity Gate](@/glossary/trinity-gate.md) – čtyřvrstvá ověřovací brána pro přesvědčení
  řízená NABLA.
- [QEVE](@/glossary/qeve.md) – ověřovací engine, který axiomy NABLA uplatňuje ve své pipeline.
- [Signal Plurality](@/glossary/signal-plurality.md) – základní axiom vyžadující nejméně dva
  nezávislé signály.
- [NM/ND](@/glossary/nm-nd.md) – exekuční doktrína aktivovaná, když je důvěra NABLA
  dostatečná.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – šestnáctiúrovňová pipeline, v níž
  NABLA působí.
- [White Team](@/glossary/white-team.md), [Red Team](@/glossary/red-team.md), [Blue
  Team](@/glossary/blue-team.md), [Gray Team](@/glossary/gray-team.md) – týmy, které
  vytvářejí formální důkazy, testují odolnost vůči epistemickým útokům, udržují soulad
  a hledají hraniční případy.

**Hesla a zdrojové moduly platformy mimo tuto knihu**

- [Confidence Threshold](https://prismatic-reality-com.github.io/prismatic-promo/glossary/confidence-threshold/),
  [Provenance Mandatory](https://prismatic-reality-com.github.io/prismatic-promo/glossary/provenance-mandatory/),
  [No Mercy](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-mercy/),
  [No Doubts](https://prismatic-reality-com.github.io/prismatic-promo/glossary/no-doubts/),
  [3NL Framework](https://prismatic-reality-com.github.io/prismatic-promo/glossary/three-nl/),
  [Lean4](https://prismatic-reality-com.github.io/prismatic-promo/glossary/lean4/) –
  rozhodovací prahy, sledovatelnost, exekuční vynucení, integrační rámec a dokazovač vět.
- Moduly [prismatic_nabla](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_nabla/README.md),
  [prismatic_deduction](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_deduction/README.md),
  [prismatic_lean4](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_lean4/README.md),
  [prismatic_monte_carlo](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_monte_carlo/README.md),
  [prismatic_3nl](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_3nl/README.md),
  [prismatic_trinity_nexus](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_trinity_nexus/README.md),
  [prismatic_agents](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/apps/prismatic_agents/README.md) –
  běhová implementace rámce, deduktivní engine, formální ověření, Monte Carlo pro QEVE, 3NL,
  Trinity Gate a běhové prostředí agentů; [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/)
  platformy.

**Kniha**

- [2.6 Vztah ke Prismatic NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) – jak rámec
  vstupuje do [taxonomie EA](@/glossary/taxonomie-ea.md).
- [NABLA Infinity a detekce EA](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) –
  pipeline aplikovaná na signály epistemického útoku.
- [7.6 Computational epistemology a NABLA](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md) –
  teoretické zázemí.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
