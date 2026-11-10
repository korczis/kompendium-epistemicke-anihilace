+++
title = "Quality Monitor a sledování obrany proti EA"
description = "Jak Quality Monitor na Prismatic Platform sleduje ukazatele obranných vrstev a odchylky v čase, proč vidí jen to, co je měřeno, a co z jeho mezí plyne pro hodnocení prevence a zotavení."
weight = 28

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "quality"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["autoheal-ea-regression-repair", "autoevolve-ea-pattern-evolution", "qeve-ea-quality-validation", "tactical-execution-ea-operations", "supreme-commander-ea-strategy"]
toc = true
+++

# Quality Monitor a sledování obrany proti EA

Quality Monitor je podle původní verze této stránky telemetrickým agregátorem Prismatic Platform, softwarové platformy, z níž kniha vzešla. Sleduje v reálném čase ukazatele obranných vrstev – míru správně a falešně zachycených případů, odezvu a pokrytí – a spouští upozornění, když se ukazatele odchýlí od obvyklého stavu. Ve vztahu k taxonomii epistemických útoků (EA) poskytuje obraz o stavu obrany jako celku: které oblasti taxonomie jsou pokryty, jak si obrana v nich vede a kde se zhoršuje. Stránka popisuje jeho roli, jeho hlavní slabinu – vidí jen to, co je měřeno – a poučení, které z ní kniha vyvozuje pro hodnocení prevence a zotavení u lidí.

## Agent v kostce

Quality Monitor sbírá data ze všech detekčních agentů a zobrazuje stav obranného portfolia vůči celé taxonomii. Původní stránka uvádí, že sleduje klouzavé výchozí hodnoty za různá období a rozlišuje sezónní kolísání od strukturní změny. Výstupem jsou upozornění a přehledové panely. Kontext platformy, v němž Quality Monitor působí, popisuje glosář pod hesly [Quality Debt](@/glossary/quality-debt.md) a [QDP](@/glossary/qdp.md): platforma každé odchylce od standardů kvality přiřazuje body dluhu a sleduje je jako jediné kanonické měřítko zdraví kvality. Původní stránka odkazuje i na zásadu platformy, podle níž má být každý krok obranných agentů instrumentován telemetrií.

## Proč se týká technik EA

Obrana proti technikám EA se mění s každou úpravou platformy i s proměnou útoků. Bez průběžného sledování by se zhoršení obrany v některé oblasti taxonomie projevilo až selháním. Quality Monitor zajišťuje, že se zhoršení projeví dřív – jako odchylka ukazatele. Jeho upozornění spouštějí [AutoHeal](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md), jsou podnětem pro [AutoEvolve](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) a při kritických odchylkách vedou k eskalaci na [Tactical Execution](@/kompendium/aiad-integration/tactical-execution-ea-operations.md). Na strategické úrovni z jeho dat vychází [Supreme Commander](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) při stanovení priorit.

## Jak pracuje

Sledování odchylek od výchozího stavu je klasickou metodou statistické kontroly kvality. Shewhart (1931) navrhl regulační diagramy, které rozlišují běžné kolísání procesu od kolísání se zvláštní příčinou, jež vyžaduje zásah. Praxe provozní spolehlivosti softwaru tuto myšlenku rozvinula do sledování cílových úrovní služeb a upozornění při jejich ohrožení (Beyer et al. 2016). Quality Monitor obě tradice spojuje: sleduje ukazatele v čase a upozorňuje tehdy, když odchylka přesáhne to, co lze vysvětlit běžným kolísáním.

Původní stránka uvádí dvě slabiny. První je, že **Quality Monitor vidí jen to, co je instrumentováno**: agent bez měření je pro něj neviditelný. Druhou je **únava z upozornění**: pokud jsou prahy nastaveny špatně, upozornění se množí a lidé je přestanou vnímat. Obě slabiny mají přesnou obdobu v lidských institucích.

## Spolupráce s dalšími agenty

Quality Monitor je hlavním konzumentem dat všech ostatních agentů. Upozornění předává [AutoHeal](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) a [AutoEvolve](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md), s [QEVE](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) sdílí údaje o kvalitě závěrů, při kritických odchylkách eskaluje na [Tactical Execution](@/kompendium/aiad-integration/tactical-execution-ea-operations.md) a pro strategické rozhodování dodává podklady [Supreme Commanderovi](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md). Signály z [NABLA Infinity](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) jsou jedním z jeho vstupů.

## Příklad

Ukazatele ukazují, že míra zachycení tvrzení bez provenience je stabilní, ale v jedné doméně se během několika týdnů pomalu zvyšuje podíl tvrzení, která obrana propustí s hraniční důvěrou. Žádná jednotlivá hodnota nepřekročí práh upozornění. Quality Monitor však porovná delší klouzavý výchozí stav s kratším a zjistí, že nejde o kolísání, ale o pozvolný posun. Upozorní na strukturní změnu, [AutoHeal](@/glossary/autoheal.md) ověří, že nejde o známou regresi, a nález se předá k šetření. Ukáže se, že nový zdroj dat přináší tvrzení s neúplnou proveniencí, které obrana dosud nehodnotila.

## Co z toho plyne pro čtenáře knihy

Prvním poučením je **„měří se jen to, co se měří“**. Instituce, která hodnotí prevenci manipulace podle počtu absolvovaných školení nebo počtu podaných stížností, vidí jen tyto ukazatele – a neuvidí strach, který lidem brání stížnost podat. Kniha proto v [obraně organizací](@/kompendium/organizational-defense/_index.md) doporučuje kombinovat ukazatele s kvalitativními zdroji: [anonymní zpětnou vazbou](@/kompendium/organizational-defense/14-anonymous-feedback.md), [průzkumem kultury](@/kompendium/organizational-defense/15-culture-survey-EA.md) a [výstupními rozhovory](@/kompendium/organizational-defense/13-exit-interview-EA.md). Campbell (1979) upozornil, že ukazatel, který se stane cílem rozhodování, podléhá tlakům, které jej zkreslují; kdo hodnotí prevenci jen podle čísel, riskuje, že se lidé naučí čísla vylepšit, a ne situaci.

Druhým poučením je **pomalý posun pod prahem**. Příklad výše ukazuje, že nejnebezpečnější změny nepřekračují práh najednou. U lidí kniha popisuje totéž: manipulace postupuje po malých krocích a člověk ani jeho okolí si změny nevšimnou, dokud nejsou velké. Obranou je porovnávat současný stav s delším obdobím – například pomocí [paměťového archivu](@/kompendium/self-defense-guides/43-memory-archive.md) nebo [auditu vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md).

Třetím poučením je **únava z upozornění**. V klinice i v krizových službách hrozí, že se varovné signály stanou šumem, pokud jich je příliš mnoho nebo jsou nepřesné. Kniha proto klade důraz na kvalitu signálu, nikoli na jeho množství, a doporučuje pravidelně revidovat, které signály skutečně něco znamenají (srov. [rozpoznání varovných signálů](@/kompendium/prevention-resilience/12-warning-sign-recognition.md)).

## Hodnocení zotavení

Stejné zásady platí pro sledování zotavení. Klinik, který sleduje jen jednu škálu, může přehlédnout, že se člověk zlepšuje v jedné oblasti a zhoršuje v jiné. Kniha doporučuje sledovat více oblastí – spánek, vztahy, pracovní fungování, schopnost samostatného úsudku – a porovnávat je s delším obdobím, ne jen s minulým sezením. [Self-report nástroje](@/kompendium/06-klinicke-aplikace/self-report-instrumenty.md) a [dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md) tuto zásadu rozvádějí.

## Kdo hlídá ukazatele

Ukazatele obrany jsou samy cílem možného zkreslení. Kdyby měl některý agent zájem vykazovat lepší výsledky, mohl by být v pokušení ovlivnit, co se měří a jak – stejně jako lidé v institucích, kteří jsou hodnoceni podle čísel. Platforma tomuto riziku čelí tím, že měření provádí samostatný agent, který sám nic neopravuje ani nerozhoduje, a že ukazatele lze zpětně porovnat s nálezy barevných týmů. Kniha z toho vyvozuje zásadu pro organizace: ten, kdo je hodnocen, nemá sám určovat, podle čeho se hodnotí, ani sám sbírat data o svém výkonu. V oblasti prevence manipulace je tato zásada zvlášť důležitá, protože techniky popsané v knize často míří právě na hodnoticí systémy instituce (srov. [přepisování kritérií hodnocení](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md) a [ovládnutí recenzního řízení](@/kompendium/techniques/ea-2-4-6-peer-review-capture.md)). Power (1997) ukázal, že audit, který kontroluje jen to, co mu kontrolovaný předloží, vytváří zdání kontroly bez kontroly.

## Meze a otevřené otázky

Quality Monitor nevidí agenty ani procesy, které nemají měření, a jeho upozornění jsou jen tak dobrá jako zvolené prahy. Konkrétní hodnoty prahů a časů odezvy, které uváděla původní stránka, se s vývojem platformy mění, a proto se zde neuvádějí. Otevřenou otázkou je, jak měřit vlastnosti obrany, které se špatně kvantifikují – například odolnost vůči dosud neznámým vzorcům.

Kniha proto doporučuje vnímat každý ukazatel jako otázku, ne jako odpověď.

## Literatura

- Power, M. (1997). *The Audit Society: Rituals of Verification*. Oxford: Oxford University Press.
- Beyer, B., Jones, C., Petoff, J., & Murphy, N. R. (Eds.) (2016). *Site Reliability Engineering: How Google Runs Production Systems*. Sebastopol, CA: O'Reilly Media.
- Campbell, D. T. (1979). Assessing the impact of planned social change. *Evaluation and Program Planning*, 2(1), 67–90.
- Shewhart, W. A. (1931). *Economic Control of Quality of Manufactured Product*. New York: D. Van Nostrand.

## Související

**Agenti**

- [AutoHeal a oprava regresí](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) – reaguje na upozornění.
- [AutoEvolve a vývoj vzorců](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) – využívá signály stagnace.
- [Supreme Commander a strategie](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md) – rozhoduje podle ukazatelů.

**Pojmy**

- [Quality Debt](@/glossary/quality-debt.md) – měření kvality na platformě.
- [QDP](@/glossary/qdp.md) – body dluhu kvality.

**Kniha**

- [Průzkum kultury](@/kompendium/organizational-defense/15-culture-survey-EA.md) – kvalitativní doplněk ukazatelů.
- [Audit vztahů](@/kompendium/self-defense-guides/22-relationship-audit.md) – sledování posunu u jednotlivce.
