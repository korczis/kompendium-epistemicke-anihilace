+++
title = "Bridge: AutoEvolve"
description = "Most mezi heslem AutoEvolve a knihou: samozlepšující se systém platformy, lidská obdoba ověřitelného učení z vlastních chyb a past optimalizace podle metriky."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "autoevolve", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["autoevolve", "autoheal", "regression-test", "clean-run", "bridge-metakognice", "bridge-quality-debt"]
glossary_target = "autoevolve"
toc = false
+++

# Bridge: AutoEvolve

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[AutoEvolve](@/glossary/autoevolve.md) je na platformě Prismatic, z níž kniha vzešla, systém
průběžného samozlepšování. Na rozdíl od [AutoHeal](@/glossary/autoheal.md), který opravuje
regrese a vrací systém do známého dobrého stavu, AutoEvolve hledá příležitosti ke zlepšení:
antivzory, místa k refaktoringu, výkonnostní slabiny. Pracuje v cyklu detekce – aplikace –
validace. Každá změna musí projít stejnými branami kvality jako jakákoli jiná – bez varování
kompilátoru, bez porušení statické analýzy a s úspěšnou sadou testů (viz
[Clean Run](@/glossary/clean-run.md)) – a změna, která neprojde, se automaticky vrátí. Heslo
glosáře uvádí počty generací a hodnotu „fitness“ jako údaje platformy v době zápisu; kniha je
nepřebírá a nijak je neověřuje.

Kniha z pojmu přebírá princip, nikoli mechanismus: **zlepšovat se má smysl jen tehdy, je-li
zlepšení ověřitelné a vratné.** Tento princip uplatňuje na lidské učení z vlastních chyb a
zároveň varuje před jeho karikaturou – před neustálým „sebezdokonalováním“, které místo
poznání slouží kontrole.

## Pojem v jeho vlastním oboru

Myšlenka systému, který se zlepšuje opakovaným výběrem úspěšných variant, má kořeny
v evolučních výpočtech; Holland (1975) ukázal, jak lze adaptaci přírodních systémů převést na
algoritmy hledající lepší řešení v prostoru možností. Softwarové inženýrství k tomu přidalo
pojistky proti zhoršení: regresní testy, které zachytí, když změna rozbije dříve fungující
chování (viz [Regression Test](@/glossary/regression-test.md)), a postupy průběžné integrace
a dodávky, v nichž každá změna prochází automatickými kontrolami, než se dostane dál
(Humble a Farley 2010).

AutoEvolve tyto prvky spojuje: hledá změny, ale nedůvěřuje jim, dokud neobstojí v testech.
Stránka [AutoEvolve: evoluce vzorců EA](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md)
popisuje, jak se stejná logika uplatňuje při aktualizaci detekčních vzorců technik, které se
v čase mění.

## Analogie, kterou kniha činí

Lidskou obdobou je **[metakognice](@/glossary/metakognice.md)** – schopnost sledovat vlastní poznávání, všimnout si chyby
a upravit postup (Flavell 1979). Argyris a Schön (1978) ukázali, že organizace se mohou učit
dvojím způsobem: v *jednoduché smyčce* opravují chyby v rámci platných předpokladů, ve
*dvojité smyčce* revidují i předpoklady samé. Kniha považuje obě smyčky za znak zdravého
poznávání a jejich narušení za jeden z cílů manipulace – viz
[Bridge: Metakognice](@/kompendium/glossary-bridges/bridge-metakognice.md).

Analogie má i odvrácenou stranu. Platforma optimalizuje podle číselného skóre, a právě
u lidí a institucí platí známé varování, že jakmile se ukazatel stane cílem, přestává být
dobrým ukazatelem (Strathern 1997, formulace tzv. Goodhartova zákona). Campbell (1979) obdobně
upozornil, že čím víc se kvantitativní ukazatel používá k rozhodování, tím víc podléhá tlaku
na zkreslení. Kniha proto netvrdí, že by se lidé měli „optimalizovat“ jako software; tvrdí jen,
že učení potřebuje zpětnou vazbu, která je skutečná, a možnost vrátit se, když změna nepomohla.

## Kde se pojem v knize vyskytuje

Platformní souvislosti popisují stránky
[AutoEvolve: evoluce vzorců EA](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md)
a [AutoHeal: oprava regresí](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md).
Lidskou stranu ověřitelného učení rozvádějí příručky
[Metakognitivní monitoring](@/kompendium/self-defense-guides/1-metacognitive-monitoring.md) a
[Osobní audit zkreslení](@/kompendium/self-defense-guides/38-bias-audit-personal.md). Pro
výzkumníky je obdobou „brány kvality“ předregistrace a replikace, jak je popisují kapitoly
[Pre-registrace EA výzkumu](@/kompendium/research-methodology/pre-registration-EA-research.md)
a [Replikační výzkum](@/kompendium/research-methodology/replication-EA-research.md).

## Od pojmu k praxi

### Rozpoznání zdravého a deformovaného sebezlepšování

Zdravé sebezlepšování má tři znaky, které odpovídají cyklu AutoEvolve: člověk sám určuje, co
chce zlepšit; výsledek si může ověřit ve vlastní zkušenosti; a změnu může opustit, když se
neosvědčí. Deformované „sebezdokonalování“ v manipulativních prostředích obrací všechny tři
znaky: o tom, co je třeba zlepšit, rozhoduje autorita; výsledek se posuzuje podle jejího
hodnocení; a odchod od programu se vykládá jako selhání. Lifton (1961) popsal v prostředích
myšlenkové reformy „kult zpovědi“, v němž neustálá sebekritika neslouží poznání, ale
zviditelnění a podřízení jedince. Kniha tento vzorec rozebírá u technik
[EA-2.5.1 Internalizace pseudo-pokory](@/kompendium/techniques/ea-2-5-1-pseudo-pokora-internalizace.md)
a [EA-2.5.3 Kultivace sebepochybnosti](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md).

### Odlišení

Od náročného, ale legitimního vzdělávání či výcviku se deformované sebezlepšování liší
symetrií a výstupem. Dobrý učitel se nechá opravit a nabízí cestu ven; kurz má konec a
měřitelný cíl. Manipulativní program nemá konec, kritéria se posouvají („teď už jsi na vyšší
úrovni, proto musíš víc“) a odpovědnost za každé selhání nese vždy účastník.

### Obrana

Obranou je trvat na ověřitelnosti a vratnosti: zapisovat si, co jsem změnil, proč a s jakým
výsledkem; hodnotit výsledek i podle vlastních kritérií, nejen podle cizích; a nechat si
otevřenou cestu zpět. Příručka [Sebesoucit](@/kompendium/self-defense-guides/16-self-compassion.md)
k tomu připomíná, že učení z chyb vyžaduje bezpečí, nikoli trest.

### Zotavení a rámec pro profesionály

Po odchodu z prostředí, které sebekritiku vynucovalo, mívají lidé potíže rozlišit vlastní
přání se zlepšit od naučeného nutkání. Terapeut pomáhá oddělit cíle, které klient formuluje
sám, od cílů převzatých, a obnovuje zkušenost, že chyba je informace, ne důkaz bezcennosti.
Dlouhodobou perspektivu popisuje [Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md).

## Časté omyly

Omylem je číst AutoEvolve jako model lidského vývoje. Platforma optimalizuje kód podle
explicitních kritérií; lidský život nemá jedinou funkci zdatnosti a pokus ji zavést je spíš
znakem kontroly než růstu. Druhým omylem je předpokládat, že automatické zlepšování je vždy
bezpečné, protože prochází testy: testy zachytí jen to, co předvídají, a systém optimalizovaný
podle testů se může naučit je obcházet. Třetím omylem je přenášet do lidských skupin pravidlo,
že „neúspěšná změna se automaticky vrací“ – u lidí návrat k předchozímu stavu bez zpracování
zkušenosti nic neučí.

## Příklad (anonymizovaný kompozit)

Mladý manažer absolvuje firemní program osobního rozvoje, který vede externí kouč. Program
nemá konec, každý týden přidává nové „úrovně“ a selhání se řeší veřejnou sebekritikou na
skupinových setkáních. Kolegyně z personálního oddělení si všimne, že účastníci jsou čím dál
unavenější, ale výkon se nezlepšuje. Firma program přeruší, zadá nezávislé hodnocení a nahradí
ho kurzem s pevně daným rozsahem, předem stanovenými cíli a anonymní zpětnou vazbou. Manažer
později uvádí, že nejvíc pomohlo, když mohl sám říct, co se naučit chce.

## Meze a otevřené otázky

Přenos principu „ověřitelného a vratného zlepšení“ z kódu na lidi je metaforický. Otevřené
zůstává, jak u lidí poznat, že zlepšení je skutečné, a ne jen přizpůsobení se ukazateli;
a jak mají organizace podporovat rozvoj, aniž by vytvářely tlak na neustálou optimalizaci.
Pro samotnou platformu je otevřenou otázkou, nakolik lze automatickou evoluci detekčních
vzorců kontrolovat lidským dohledem, aby se z ní nestal netransparentní systém.

## Literatura

- Argyris, C., & Schön, D. A. (1978). *Organizational Learning: A Theory of Action Perspective*. Addison-Wesley.
- Campbell, D. T. (1979). Assessing the impact of planned social change. *Evaluation and Program Planning*, 2(1), 67–90.
- Flavell, J. H. (1979). Metacognition and cognitive monitoring: A new area of cognitive–developmental inquiry. *American Psychologist*, 34(10), 906–911.
- Holland, J. H. (1975). *Adaptation in Natural and Artificial Systems*. University of Michigan Press.
- Humble, J., & Farley, D. (2010). *Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation*. Addison-Wesley.
- Lifton, R. J. (1961). *[Thought Reform](@/glossary/thought-reform.md) and the Psychology of Totalism*. W. W. Norton.
- Strathern, M. (1997). „Improving ratings“: Audit in the British University system. *European Review*, 5(3), 305–321.

## Související

**Glosář**

- [AutoEvolve](@/glossary/autoevolve.md) – heslo, které tento most propojuje s knihou.
- [AutoHeal](@/glossary/autoheal.md) – sesterský systém obnovy známého dobrého stavu.
- [Regression Test](@/glossary/regression-test.md) – pojistka proti zhoršení.

**Kniha**

- [AutoEvolve: evoluce vzorců EA](@/kompendium/aiad-integration/autoevolve-ea-pattern-evolution.md) – použití v detekci technik.
- [Metakognitivní monitoring](@/kompendium/self-defense-guides/1-metacognitive-monitoring.md) – lidská obdoba ověřitelného učení.
- [EA-2.5.1 Internalizace pseudo-pokory](@/kompendium/techniques/ea-2-5-1-pseudo-pokora-internalizace.md) – deformované sebezdokonalování.
- [Replikační výzkum](@/kompendium/research-methodology/replication-EA-research.md) – brána kvality ve vědě.

**Sesterské mosty**

- [Bridge: Metakognice](@/kompendium/glossary-bridges/bridge-metakognice.md) – sledování vlastního poznávání.
- [Bridge: Quality debt](@/kompendium/glossary-bridges/bridge-quality-debt.md) – co se stane, když se zlepšování odkládá.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [AutoEvolve](@/glossary/autoevolve.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
