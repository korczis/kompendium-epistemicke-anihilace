+++
title = "QEVE a ověřování závěrů o technikách EA"
description = "Jak QEVE na Prismatic Platform spojuje formální dokazování, axiomy NABLA a testy robustnosti k ověření závěrů – a otázka, kterou kniha přebírá: který důkaz nese celý závěr?"
weight = 26

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "quality"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["trinity-gate-ea-verification", "nabla-infinity-ea-pipeline", "epistemic-pipeline-ea-detection", "autoevolve-ea-pattern-evolution", "quality-monitor-ea-tracking"]
parent = "kompendium-aiad-integration"
toc = true
+++

# QEVE a ověřování závěrů o technikách EA

[QEVE](@/glossary/qeve.md) (*Quantified Epistemic Verification Engine*, kvantifikovaný epistemický ověřovací engine) je podle hesla glosáře rámcem formálního ověřování Prismatic Platform, softwarové platformy, z níž kniha vzešla. Spojuje tři doplňující se metody do jednoho ověřovacího procesu: dokazování vět pro matematickou jistotu, vynucení [axiomů NABLA](@/glossary/nabla-axioms.md) pro epistemickou přísnost a simulace Monte Carlo pro testování robustnosti. Ve vztahu k taxonomii epistemických útoků (EA) je QEVE místem, kde se ověřuje, zda závěr – například že určitý soubor tvrzení nese znaky koordinované manipulace – stojí na pevných základech, nebo na jediném křehkém předpokladu. Stránka popisuje stavbu QEVE a otázku, kterou z něj kniha přebírá pro klinickou i forenzní práci.

## Agent v kostce

Glosář popisuje QEVE jako pětifázový proces, v němž každá fáze prohlubuje přísnost předchozí: sestavení grafu přesvědčení podle NABLA, strukturní kontrola (graf musí být acyklický), logická kontrola konzistence pravidel, formální vrstva s dokazováním vět a nakonec testy robustnosti metodou Monte Carlo. Výsledkem není jen skóre, ale závěr, který současně odpovídá na tři otázky: Je logicky nutný? Je epistemicky v pořádku? Je robustní vůči narušení? Glosář zdůrazňuje, že kombinace zajišťuje, aby žádný závěr nestál na křehkých předpokladech, skrytých rozporech nebo neotestovaných hraničních případech.

Původní verze této stránky popisovala QEVE pod jiným rozvedením zkratky jako nástroj hodnocení kvality detekčních pravidel – sledování jejich přesnosti a úplnosti v čase a doporučování, která pravidla zachovat, obnovit nebo vyřadit. Tato stránka se řídí popisem v glosáři; hodnocení výkonnosti pravidel v čase je v kontextu této sekce úkolem, na němž QEVE spolupracuje s [Quality Monitor](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) a [AutoEvolve](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md).

## Proč se týká technik EA

Mnoho technik popsaných v knize nevytváří zjevně nepravdivá tvrzení, ale závěry, které stojí na jediném nosném bodě, na kruhovém zdůvodnění nebo na skrytém rozporu. [Cirkulární argumentace](@/glossary/cirkularni-argumentace.md) se projeví jako cyklus v grafu přesvědčení; [imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) jako závěr, který žádná myslitelná změna vstupů nezmění; [iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) jako závěr, který se při rozložení ukáže závislý na jediném předpokladu. QEVE tyto struktury zachytává, protože kontroluje právě stavbu závěru, nikoli jeho rétorickou přesvědčivost.

## Jak pracuje

Tři metody QEVE pocházejí z odlišných tradic. Strukturní kontrola grafu vychází z [teorie grafů](@/glossary/graph-theory.md): orientovaný acyklický graf je takový, v němž nelze sledovat šipky a vrátit se do výchozího bodu (Cormen et al. 2009); cyklus v grafu přesvědčení znamená, že tvrzení podpírá samo sebe. Formální vrstva využívá dokazování vět v systému Lean 4 (de Moura a Ullrich 2021), který umožňuje strojově ověřit, že závěr plyne z předpokladů. Testy robustnosti metodou Monte Carlo (Metropolis a Ulam 1949) opakovaně náhodně mění vstupy a sledují, zda závěr zůstává stejný; závěr, který se při malé změně jednoho vstupu zhroutí, je křehký.

Spojení těchto metod odpovídá Popperovu požadavku, že silné tvrzení musí být vystaveno pokusům o vyvrácení (Popper 1959). Testy robustnosti jsou v tomto smyslu systematickým hledáním okolností, za nichž by závěr přestal platit.

Pořadí metod není náhodné. Strukturní a logická kontrola jsou levné a odhalí hrubé vady dřív, než se spustí nákladné formální dokazování a simulace. Tím se šetří kapacita na závěry, které už základními kontrolami prošly a u nichž má smysl ověřovat hlouběji.

## Spolupráce s dalšími agenty

QEVE ověřuje přesvědčení, která vznikají v [NABLA Infinity](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) a procházejí [epistemickým procesem](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md); jeho výstup je jedním z podkladů pro [Trinity Gate](@/kompendium/aiad-integration/trinity-gate-ea-verification.md), která rozhoduje o přijetí. S [Quality Monitor](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) sdílí údaje o stavu obrany, s [AutoEvolve](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) spolupracuje při náhradě pravidel, která přestala obstát, a jeho výsledky posuzuje [Purple Team](@/kompendium/aiad-integration/purple-team-ea-synthesis.md).

## Příklad

Platforma dospěje k závěru, že série příspěvků o veřejné instituci je koordinovanou kampaní. QEVE závěr ověřuje. Strukturní kontrola sestaví graf: závěr se opírá o tři signály – společný původ textu, synchronizované zveřejnění a opakované formulace. Žádný cyklus se neobjeví. Logická kontrola nenajde rozpor. Testy robustnosti pak ukážou, že závěr se zhroutí, jakmile se odebere signál synchronizovaného zveřejnění: zbylé dva signály samy nestačí. QEVE proto závěr nezamítne, ale označí jej jako křehký s jedním nosným bodem a doporučí ověřit právě tento signál – například zda synchronizace nevznikla tím, že všichni reagovali na stejnou zpravodajskou událost.

## Co z toho plyne pro čtenáře knihy

Heslo glosáře shrnuje otázku, kterou z QEVE kniha přebírá pro klinickou i forenzní práci: *který důkaz nese celý závěr a co by se stalo, kdyby padl?* Ve forenzním posudku je to otázka po nosném bodu: pokud závěr o manipulaci stojí na jediné výpovědi nebo na jediném dokumentu, musí posudek tento bod výslovně pojmenovat a ověřit (srov. [potvrzení třetí stranou](@/kompendium/forensic-legal/37-third-party-corroboration.md)). V klinice je to otázka po alternativních vysvětleních: pokud obraz klienta vysvětlujeme manipulací, co by se změnilo, kdyby jeden z klíčových údajů byl jinak?

Druhým poučením je **hledání kruhů**. Lidé vystavení manipulaci často žijí v systémech přesvědčení, které se samy podpírají: skupina má pravdu, protože to říká vůdce, a vůdce má pravdu, protože je vůdcem skupiny. Kniha k rozpoznání takových struktur nabízí signaturu [cirkulárních definic](@/kompendium/detection-signatures/2-linguistic-circular-definitions.md) a [falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md).

Třetím poučením je **robustnost**. Závěr, který obstojí jen za ideálních podmínek, není spolehlivý. Kdo posuzuje důležité přesvědčení, má si položit otázku, zda by obstálo, kdyby se jeden z jeho předpokladů ukázal jako mylný – postup, který kniha rozvádí v [revizi přesvědčení](@/kompendium/self-defense-guides/7-belief-revision.md).

## Formální ověření a lidský svět

Formální metody mají v QEVE jasné místo: dokazují, že závěr plyne z předpokladů, pokud jsou předpoklady formálně zapsány. Lidská zkušenost se však takto zapsat nedá a kniha by se dopustila chyby, kdyby formální jistotu přenášela na posuzování lidí. Pro knihu je cenná struktura otázek, nikoli nástroj sám. Toulmin (1958) ukázal, že každodenní argumentace má vlastní stavbu – tvrzení, údaje, oprávnění a výhrady – a že její kvalitu nelze posuzovat jen měřítky formální logiky. Kniha proto z QEVE přebírá to, co se dá přenést do běžné argumentace: hledat nosné body, kruhy a výhrady, za nichž závěr přestává platit.

## Meze a otevřené otázky

Formální důkaz je důkazem vzhledem k zapsaným předpokladům; nechrání před chybou v jejich zápisu. Testy robustnosti mění vstupy v rozsahu, který stanoví autor testu, a nemusí zachytit změny, s nimiž nepočítal. Rozpor mezi popisem QEVE na původní verzi této stránky a v glosáři ukazuje i to, že platformové pojmy se vyvíjejí; tato stránka se řídí glosářem.

I nejpřísnější ověření tedy zůstává ověřením vzhledem k tomu, co do něj lidé vložili.

## Literatura

- Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C. (2009). *Introduction to Algorithms* (3rd ed.). Cambridge, MA: MIT Press.
- de Moura, L., & Ullrich, S. (2021). The Lean 4 theorem prover and programming language. In A. Platzer & G. Sutcliffe (Eds.), *Automated Deduction – CADE 28* (pp. 625–635). Cham: Springer.
- Metropolis, N., & Ulam, S. (1949). The Monte Carlo method. *Journal of the American Statistical Association*, 44(247), 335–341.
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. London: Hutchinson.
- Toulmin, S. E. (1958). *The Uses of Argument*. Cambridge: Cambridge University Press.

## Související

**Agenti**

- [Trinity Gate a ověřování](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) – brána přijetí přesvědčení.
- [NABLA Infinity a detekce EA](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) – axiomy, které QEVE vynucuje.
- [Quality Monitor a sledování](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) – výkonnost obrany v čase.

**Pojmy**

- [QEVE](@/glossary/qeve.md) – heslo glosáře.
- [Cirkulární argumentace](@/glossary/cirkularni-argumentace.md) – kruh v grafu přesvědčení.

**Kniha**

- [Potvrzení třetí stranou](@/kompendium/forensic-legal/37-third-party-corroboration.md) – ověření nosného bodu.
- [Falsifikační myšlení](@/kompendium/self-defense-guides/5-falsification-thinking.md) – hledání okolností vyvrácení.
