+++
title = "Trinity Gate a ověřování přesvědčení proti EA"
description = "Jak čtyřvrstvá brána Trinity Gate na Prismatic Platform propouští přesvědčení až po strukturní, logické a formální kontrole – a tři otázky, které z ní kniha přebírá pro posuzování lidí."
weight = 25

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "nabla"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["qeve-ea-quality-validation", "decision-engine-ea-calibration", "nabla-infinity-ea-pipeline", "white-team-ea-verification", "epistemic-pipeline-ea-detection"]
parent = "kompendium-aiad-integration"
toc = true
+++

# Trinity Gate a ověřování přesvědčení proti EA

[Trinity Gate](@/glossary/trinity-gate.md) (brána Trinity) je podle hesla glosáře čtyřvrstvým ověřovacím mechanismem Prismatic Platform, softwarové platformy, z níž kniha vzešla. Každé přesvědčení, rozhodnutí a závěr platformy jí musí projít dřív, než se z hypotézy stane přijatým závěrem. Brána se skládá ze tří nezávislých ověření – strukturní konzistence, logické konzistence a formální nutnosti – a z metavrstvy, která ověřuje správnost brány samotné. Ve vztahu k taxonomii epistemických útoků (EA) je Trinity Gate posledním filtrem: i tvrzení, které obstálo v předchozích kontrolách, se nepřijme, pokud je kruhově zdůvodněné, logicky rozporné nebo jen možné, ale ne nutné. Stránka popisuje stavbu brány a tři otázky, které z ní kniha přenáší do klinické a forenzní praxe.

## Agent v kostce

Glosář vysvětluje, proč brána existuje: řeší mezeru mezi tím, „co si model myslí“, a tím, „jak to skutečně je“. Statistická důvěra sama pro rozhodnutí s vysokou sázkou nestačí; systém si může být velmi jistý závěrem, který je strukturně nesoudržný, logicky rozporný nebo formálně nenutný. Trinity Gate proto vyžaduje nezávislé ověření ve třech navzájem kolmých dimenzích. V architektuře platformy stojí na přechodu mezi zkoumáním v [NABLA Infinity](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) a provedením.

Brána 1 – **strukturní konzistence** – ověřuje, že síť přesvědčení tvoří orientovaný acyklický graf: žádné přesvědčení nesmí podpírat samo sebe přes řetěz dalších, každý závěr musí být dohledatelný k důkazům a protichůdné důkazy musí být v grafu výslovně zastoupeny. Brána 2 – **logická konzistence** – vyhodnocuje závěr podle pravidel a hledá rozpory. Brána 3 – **formální nutnost** – ověřuje pomocí modální logiky a formálních důkazů, zda závěr z premis nutně plyne, nebo je jen možný. Metavrstva kontroluje integritu samotného ověřování.

Původní verze této stránky popisovala bránu jinak – jako shodu tří vrstev různé povahy, z nichž každá vydá vlastní verdikt. Tato stránka se řídí podrobnějším popisem v glosáři; zachovává z původní verze poznatek, že brána se v plné hloubce používá pro rozhodnutí s vysokou sázkou a že nejednoznačný výsledek vyžaduje lidské posouzení.

## Proč se týká technik EA

Tři brány odpovídají třem druhům selhání, na nichž stojí řada technik popsaných v knize. Strukturní brána zachytí [cirkulární argumentaci](@/glossary/cirkularni-argumentace.md) – přesvědčení, které je zdůvodněno samo sebou přes řetěz mezikroků, typické pro uzavřené systémy přesvědčení. Logická brána zachytí rozpory, které [strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) skrývá tím, že mění význam dřívějších tvrzení. Formální brána zachytí skok od možného k nutnému – vzorec, v němž se z toho, že něco *mohlo* být, vyvozuje, že to *muselo* být, a na němž stojí mnohá konspirační vysvětlení i [falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md).

## Jak pracuje

Každá brána vychází z jiné disciplíny. Strukturní kontrola z teorie grafů, v níž je acykličnost základní vlastností řetězců závislostí (Cormen et al. 2009; srov. heslo [Graph Theory](@/glossary/graph-theory.md)). Logická kontrola z vyhodnocování pravidel. Formální kontrola z modální logiky, která rozlišuje nutné a možné pravdy (Hughes a Cresswell 1996), a z dokazování vět v systému Lean 4 (de Moura a Ullrich 2021). Nezávislost bran je podstatná: chyba, kterou jedna metoda přehlédne, nemusí uniknout jiné.

Myšlenka vícevrstvého ověřování s nezávislými vrstvami odpovídá i obecným zásadám bezpečnosti složitých systémů. Reason (1990) popsal, že selhání ve složitých systémech obvykle vzniká, když se setkají slabiny ve více ochranných vrstvách současně; čím nezávislejší vrstvy jsou, tím menší je pravděpodobnost, že se jejich slabiny setkají.

Metavrstva připomíná, že i ověřovací mechanismus může selhat. Brána, jejíž správnost nikdo nekontroluje, by se mohla stát místem, kde se chyby nejen nezachytí, ale navíc získají punc ověření. Proto platforma podle glosáře kontroluje i samotné ověřování – princip, který kniha uplatňuje na posuzovatele a supervizory.

## Spolupráce s dalšími agenty

Trinity Gate volá [Decision Engine](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) pro rozhodnutí s vysokou sázkou; podklady jí dodávají [QEVE](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) a [epistemický proces](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md); s [NABLA Infinity](@/glossary/nabla-infinity.md) sdílí axiomy. Její záznamy ověřuje [White Team](@/kompendium/aiad-integration/white-team-ea-verification.md) a v prověrkách přes ni procházejí výstupy [DD Engine](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md).

## Příklad

V prověrce protistrany vznikne závěr: „Firma A je skrytě ovládána osobou B.“ Strukturní brána sestaví graf: závěr se opírá o tvrzení, že B je skutečným majitelem, a to tvrzení se opírá o článek, který cituje… samotný závěr prověrky z dřívější verze zprávy. Graf obsahuje cyklus a závěr neprojde. Po odstranění cyklu zbudou dva nezávislé signály: společná adresa a shodný člen statutárního orgánu v minulosti. Logická brána rozpor nenajde. Formální brána ukáže, že ze signálů plyne, že ovládání je *možné*, ale ne *nutné*: shodu lze vysvětlit i jinak. Výsledkem je závěr „možná vazba, k ověření v evidenci skutečných majitelů“, nikoli „skryté ovládání“. Postup popisuje i stránka [EA × Due Diligence: dezinformace o skutečném vlastnictví](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md).

## Co z toho plyne pro čtenáře knihy

Heslo glosáře uvádí tři otázky, které kniha z Trinity Gate přebírá a které se hodí i při posuzování lidských přesvědčení v kauzách EA. **Je řetězec důvodů kruhový?** Zdůvodňuje se tvrzení samo sebou, třeba přes autoritu, jejíž autorita je odvozena z téhož tvrzení? **Plyne závěr z premis, nebo je přesahuje?** Neříká závěr víc, než důkazy unesou? **Je závěr nutný, nebo jen možný?** Nezaměňujeme to, co se mohlo stát, za to, co se stalo?

Tyto otázky mají použití na obou stranách. Pomáhají rozpoznat manipulativní systémy přesvědčení, v nichž se kruhové zdůvodnění a skok od možného k nutnému objevují často (srov. [případ konspirační rekrutace](@/kompendium/case-studies/21-konspiracni-rekrutace.md)). A chrání posuzovatele před vlastní chybou: kdo posuzuje podezření na manipulaci, může sám přeskočit od „mohl být zmanipulován“ k „byl zmanipulován“. Kniha na toto riziko upozorňuje v [kritice kruhového uvažování](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md) a v [riziku falešné pozitivity](@/kompendium/critical-perspectives/5-false-positive-risk.md).

Pro forenzní praxi z bran plyne ještě jedno poučení: závěr posudku má být formulován v té modalitě, kterou důkazy unesou – „je slučitelné s“, „svědčí pro“, „prokazuje“ – a posudek má výslovně uvést, které alternativní vysvětlení vyloučil a které ne (srov. [znalec v kontextu EA](@/kompendium/forensic-legal/21-expert-witness-EA.md)).

## Meze a otevřené otázky

Trinity Gate je nákladná a používá se jen pro rozhodnutí s vysokou sázkou. Formální nutnost lze ověřit jen u závěrů, které jsou formálně zapsány; lidská zkušenost se takto zapsat nedá a kniha přebírá z brány otázky, ne nástroj. Glosář uvádí i údaje o počtu entit ověřených branou; odpovídají stavu v době zápisu a zde se nepřebírají. Otevřenou otázkou je, jak zacházet se závěry, které jednou branou neprojdou jen těsně – zda je zamítnout, nebo předat lidskému posouzení; původní stránka doporučovala druhé.

Kniha proto doporučuje používat tři otázky brány jako vodítko pro rozhovor a posudek, nikoli jako mechanický test.

## Literatura

- Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C. (2009). *Introduction to Algorithms* (3rd ed.). Cambridge, MA: MIT Press.
- de Moura, L., & Ullrich, S. (2021). The Lean 4 theorem prover and programming language. In A. Platzer & G. Sutcliffe (Eds.), *Automated Deduction – CADE 28* (pp. 625–635). Cham: Springer.
- Hughes, G. E., & Cresswell, M. J. (1996). *A New Introduction to Modal Logic*. London: Routledge.
- Reason, J. (1990). *Human Error*. Cambridge: Cambridge University Press.

## Související

**Agenti**

- [QEVE a ověřování závěrů](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) – podklady pro bránu.
- [Decision Engine a kalibrace](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) – rozhodnutí s vysokou sázkou.
- [White Team a ověřování](@/kompendium/aiad-integration/white-team-ea-verification.md) – audit záznamů brány.

**Pojmy**

- [Trinity Gate](@/glossary/trinity-gate.md) – heslo glosáře.
- [Cirkulární argumentace](@/glossary/cirkularni-argumentace.md) – co zachytí strukturní brána.
- [Graph Theory](@/glossary/graph-theory.md) – základ strukturní kontroly.

**Kniha**

- [Riziko kruhového uvažování](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md) – tatáž otázka na posuzovatele.
- [Znalec v kontextu EA](@/kompendium/forensic-legal/21-expert-witness-EA.md) – modalita závěrů posudku.
