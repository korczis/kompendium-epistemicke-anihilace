+++
title = "Bridge: AutoHeal (samooprava)"
description = "Most mezi heslem AutoHeal a knihou: samooprava po stupních, výchozí stav a ověření zásahu, a lidská obdoba – fázová krizová péče i „oprava“, která jen zakryje příznaky."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "autoheal", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["autoheal", "regression-test", "autoevolve", "clean-run", "quality-debt", "iatrogenic-harm"]
glossary_target = "autoheal"
toc = false
+++

# Bridge: AutoHeal (samooprava)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[AutoHeal](@/glossary/autoheal.md) je mechanismus samoopravy platformy, z níž Kompendium vzešlo.
Bez lidského zásahu odhaluje a řeší regrese kvality, rozbité závislosti, posun konfigurace a selhání
kompilace. Pracuje s hierarchií pěti stupňů zásahu: nejprve stanoví výchozí stav, pak volí nejmenší
zásah, který problém vyřeší, a k razantnějším opatřením přistupuje jen tehdy, když mírnější selžou.
Každý zásah se ověřuje a opakované selhání zastaví další pokusy, podobně jako jistič v elektrickém
obvodu.

Mechanismus patří do tradice, kterou Kephart a Chess (2003) nazvali autonomním počítáním
(*autonomic computing*): systémy, které se samy konfigurují, optimalizují, chrání a opravují.
Nygard (2007) popsal v provozní praxi vzor „jistič“ (*circuit breaker*), který brání tomu, aby se
opakované selhání jedné součásti šířilo celým systémem. AutoHeal oba principy spojuje. Heslo patří
do kontextu platformy; kniha ho zařazuje mezi mosty kvůli principu přiměřeného, ověřovaného zásahu,
který má obdobu ve fázové krizové péči.

## Samooprava očima knihy

Princip „nejprve výchozí stav, pak nejmenší účinný zásah, pak ověření“ odpovídá v péči o duševní
zdraví modelu stupňovité péče (*stepped care*). Bower a Gilbody (2005) ho popsali jako postup, v němž
se začíná nejméně náročnou intervencí, která může pomoci, a k intenzivnější se přechází podle
sledovaného výsledku. Kniha stejný princip uplatňuje v protokolech zotavení: nejdřív bezpečí a
stabilizace, teprve potom práce s obsahem zážitku. Herman (1992) popsala tři stadia zotavení z traumatu
– bezpečí, vzpomínání a truchlení, znovunavázání vztahů – a zdůraznila, že předčasný přechod do
druhého stadia člověka destabilizuje.

Analogie má i varovnou stranu, kterou kniha zdůrazňuje. Samooprava, která obnoví ukazatele, ale ne
funkci, problém jen zakryje. Strathern (1997) formulovala známou podobu Goodhartova zákona: jakmile se
měřítko stane cílem, přestává být dobrým měřítkem. V lidských vztazích má tento vzorec znepokojivou
obdobu. Walker (1979) popsala v cyklu domácího násilí fázi usmíření, v níž se vztah navenek „opraví“,
napětí opadne a postižená osoba získá naději – aniž by se cokoli změnilo na příčině. Opakovaná
„samooprava“ bez nápravy příčiny posiluje [traumatické pouto](@/glossary/trauma-bonding.md) a ztěžuje
rozpoznání vzorce.

## Kde se pojem v knize vyskytuje

Jak mechanismus odhaluje a opravuje regrese v detekci technik EA – výchozí stav, přiměřenost zásahu,
jistič a ověření –, popisuje stránka [AutoHeal a EA](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md).
Sledování ukazatelů, na něž samooprava reaguje, a jejich meze rozebírá stránka
[Quality Monitor a EA](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md).

Lidskou obdobu přiměřeného zásahu najde čtenář v [Akutním stabilizačním protokolu](@/kompendium/recovery-protocols/acute-stabilization-protocol.md)
a v technice [EA-6.3.1 Stabilizační fáze](@/kompendium/techniques/ea-6-3-1-stabilizacni-faze-protokol.md).
Riziko zásahu, který je silnější, než situace vyžaduje, rozebírá kritická kapitola
[Iatrogenní účinky EA intervencí](@/kompendium/critical-perspectives/11-iatrogenic-overreach.md).
Návrat problému po zdánlivé opravě, tedy lidskou obdobu regrese, popisují
[Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md) a
[Rozpoznání relapsu](@/kompendium/emergency-protocols/33-relapse-recognition.md).

## Od pojmu k praxi

### Rozpoznání

V technickém systému se nezdravá samooprava pozná podle toho, že tytéž zásahy se opakují a
příčina zůstává. Regrese, která se vrací po každé „opravě“, je údajem o neřešeném problému, ne
o úspěchu mechanismu; proto se na platformě spojuje s [regresními testy](@/glossary/regression-test.md).
V lidském vztahu je obdobou cyklus, v němž se po každém incidentu obnoví klid, ale incidenty se vracejí
v podobné nebo horší podobě. Pozorovatel – klinik, sociální pracovník, blízký člověk – si všímá, zda se
po „usmíření“ změnilo něco v chování, nebo jen v náladě.

### Obrana

Obranou v softwaru je ověřit opravu proti výchozímu stavu a zastavit automatické pokusy, když se
selhání opakuje, aby rozhodl člověk. Obdobou v klinické praxi je průběžné sledování výsledku a jasné
kritérium, kdy přejít na intenzivnější péči nebo péči jiného druhu – viz
[Bridge: Kontraindikace](@/kompendium/glossary-bridges/bridge-kontraindikace.md). Pro postiženou osobu
je obranou záznam událostí v čase, který ukáže opakování i tam, kde paměť pod vlivem fáze usmíření
vzorec rozmazává; kniha k tomu vede v návodu [Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md).

### Náprava

Skutečná náprava míří na příčinu, ne na příznak. Na platformě to znamená, že opakující se regrese
vede k analýze kořenové příčiny, nikoli k dalšímu automatickému zásahu. V lidském kontextu odpovídá
nápravě práce s celým vzorcem, nikoli jen s posledním incidentem. Reason (1997) v teorii
organizačních nehod ukázal, že opakované selhání má obvykle latentní podmínky v systému; jejich
odstranění je pomalejší než oprava příznaku, ale jen ono brání návratu.

### Rámec pro profesionály

Pro kliniky a pracovníky podpůrných služeb plyne z analogie praktické pravidlo dokumentace: zapisovat
nejen poslední incident, ale i průběh mezi incidenty, protože právě fáze klidu nese informaci o
vzorci. Stark (2007) v koncepci [coercive control](@/glossary/coercive-control.md) ukázal, že hodnocení
jednotlivých incidentů izolovaně přehlíží kontrolu, která se odehrává v čase a v běžném životě; stejně
tak hodnocení podle stavu „po opravě“ přehlíží opakování. Kapitola
[Klinická dokumentace](@/kompendium/forensic-legal/31-clinical-documentation-EA.md) popisuje, jak takový
záznam vést, aby obstál i v právním řízení.

## Odlišení od příbuzných pojmů

AutoHeal je třeba odlišit od mechanismu [AutoEvolve](@/glossary/autoevolve.md): samooprava vrací systém
do známého dobrého stavu, kdežto AutoEvolve hledá stav lepší než dosavadní. Od běžného restartu se
samooprava liší tím, že stanoví výchozí stav a zásah ověřuje. V lidské analogii je třeba odlišit
přirozenou odolnost – schopnost vrátit se po zátěži k fungování – od „oprav“, které vnucuje
manipulující strana, aby se vztah vrátil do stavu, který jí vyhovuje.

## Časté omyly

Prvním omylem je přesvědčení, že čím silnější zásah, tím spolehlivější výsledek. Neúměrný zásah
přináší vlastní škody; v klinice se jim říká [iatrogenní](@/glossary/iatrogenic-harm.md). Druhým omylem je
považovat obnovené ukazatele za důkaz zdraví; ukazatel je jen zástupce funkce. Třetím omylem je
přenášet představu automatické samoopravy na lidi tak, že by se zotavení mělo dít „samo“ a bez pomoci;
kniha naopak zdůrazňuje, že zotavení z dlouhodobé manipulace obvykle potřebuje oporu a čas.

## Příklad (anonymizovaný kompozit)

Žena středního věku přichází do poradny kvůli úzkosti. Popisuje partnerský vztah jako „v zásadě
dobrý“: po hádkách, při nichž partner ničí její věci, vždy následuje omluva, dárky a týdny klidu.
Poradkyně ji požádá, aby si dva měsíce zapisovala data incidentů a období klidu. Záznam ukáže, že
období klidu se zkracují a incidenty jsou častější. Klientka poprvé vidí vzorec, který paměť pod
dojmem každého usmíření zakrývala. Další postup se neřídí rychlostí, ale bezpečím: poradkyně s ní
nejprve připraví plán bezpečí a teprve potom otevírá otázku, co dál.

## Meze a otevřené otázky

Analogie mezi softwarovou samoopravou a lidskými cykly je heuristická a nenahrazuje klinické
posouzení. Otevřená zůstává otázka, kdy má automatický mechanismus předat rozhodnutí člověku – příliš
brzy znamená zahlcení obsluhy, příliš pozdě znamená, že systém opakovaně maskuje vážnou vadu. Obdobná
otázka platí pro stupňovitou péči: Bower a Gilbody (2005) upozorňují, že model předpokládá spolehlivé
sledování výsledku, které v praxi často chybí.

## Literatura

- Bower, P., & Gilbody, S. (2005). Stepped care in psychological therapies: Access, effectiveness and efficiency. *British Journal of Psychiatry*, 186(1), 11–17.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Kephart, J. O., & Chess, D. M. (2003). The vision of autonomic computing. *IEEE Computer*, 36(1), 41–50.
- Nygard, M. T. (2007). *Release It! Design and Deploy Production-Ready Software*. Pragmatic Bookshelf.
- Reason, J. (1997). *Managing the Risks of Organizational Accidents*. Ashgate.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. Oxford University Press.
- Strathern, M. (1997). „Improving ratings“: Audit in the British university system. *European Review*, 5(3), 305–321.
- Walker, L. E. (1979). *The Battered Woman*. Harper & Row.

## Související

**Glosář**

- [AutoHeal](@/glossary/autoheal.md) – technické heslo, které most propojuje.
- [Regression test](@/glossary/regression-test.md) – hlídka proti návratu opravené vady.
- [AutoEvolve](@/glossary/autoevolve.md) – hledání lepšího stavu místo návratu do známého.
- [Trauma bonding](@/glossary/trauma-bonding.md) – pouto posilované cyklem incidentu a usmíření.

**Kniha**

- [AutoHeal a EA](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) – oprava regresí obrany.
- [Akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md) – přiměřený první zásah u lidí.
- [Iatrogenní účinky EA intervencí](@/kompendium/critical-perspectives/11-iatrogenic-overreach.md) – riziko neúměrného zásahu.
- [Dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md) – návrat problému po zdánlivé opravě.

**Sesterské mosty**

- [Bridge: Regression test](@/kompendium/glossary-bridges/bridge-regression-test.md) – ověření, že se vada nevrátí.
- [Bridge: AutoEvolve](@/kompendium/glossary-bridges/bridge-autoevolve.md) – vývoj místo opravy.
- [Bridge: Kontraindikace](@/kompendium/glossary-bridges/bridge-kontraindikace.md) – kdy zásah nepoužít.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [AutoHeal](@/glossary/autoheal.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
