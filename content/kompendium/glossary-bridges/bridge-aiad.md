+++
title = "Bridge: AIAD (definice rozhraní agenta)"
description = "Most mezi heslem AIAD a knihou: výslovný kontrakt autonomního agenta, jeho úroveň a meze, a lidská obdoba – pravidla, která jsou známá, stálá a přezkoumatelná."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "aiad", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["aiad", "agent-tier", "agent-registry", "nm-nd", "doctrine", "informed-consent"]
glossary_target = "aiad"
toc = false
+++

# Bridge: AIAD (definice rozhraní agenta)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[AIAD](@/glossary/aiad.md) (*AI-Agent Interface Definition*) je standard platformy, z níž Kompendium
vzešlo, pro strojově čitelnou definici autonomního agenta. Každá definice deklaruje
[úroveň oprávnění](@/glossary/agent-tier.md), schopnosti, kontrakty vstupů a výstupů, provozní omezení
a povinný blok souladu s doktrínou platformy [NM/ND](@/glossary/nm-nd.md). Standard pokrývá nejen
agenty, ale i příkazy, procesy a adaptéry, takže nad všemi autonomními součástmi vzniká jednotná
vrstva správy. Ve svém oboru je AIAD jazykem pro definici rozhraní: jako OpenAPI popisuje kontrakty
webových API, popisuje AIAD behaviorální kontrakty a hranice oprávnění agentů.

Ideové kořeny standardu leží v programování podle kontraktu. Meyer (1992) formuloval *design by
contract*: každá součást výslovně uvádí předpoklady, které musí platit před jejím voláním, závazky,
které splní po něm, a invarianty, které zachovává. AIAD tuto myšlenku přenáší z funkcí a tříd na
autonomní agenty. Heslo patří do kontextu platformy; v knize se s ním čtenář setká především
v oddílu o tom, jak agenti platformy využívají taxonomii EA k obraně.

## Výslovný kontrakt očima knihy

Pro knihu je na AIAD podstatné, že pravidla, jimiž se součást řídí, jsou **známá předem, stálá a
přezkoumatelná**. Každý, kdo s agentem pracuje, může zjistit, co agent smí, co nesmí a komu odpovídá.
Kniha v tom vidí strukturní protiklad k prostředím, která popisuje jako manipulativní. Lifton (1961)
v analýze myšlenkové reformy uvádí mezi znaky totalismu „nadřazenost doktríny nad osobou“ a
„posvátnou vědu“ – pravidla, která nelze zpochybnit a jejichž obsah se zároveň mění podle potřeby
autority. Člověk v takovém prostředí nikdy přesně neví, co se od něj očekává, a proto je trvale
v nejistotě, kterou lze využít.

Analogie má i svou opačnou stranu. Povinný blok „souladu s doktrínou“ je v softwaru technickou
kontrolou: definice, která ho neobsahuje, se nesestaví. V lidské skupině by požadavek bezpodmínečného
souladu s doktrínou, která nepřipouští pochybnost, byl naopak varovným znakem
[prostředí s vysokou mírou kontroly](@/glossary/high-control-group.md). Kniha proto z platformy
přebírá jen technickou disciplínu výslovných kontraktů, nikoli jazyk nulové tolerance vůči lidem;
totéž upozornění obsahuje heslo [doktríny platformy](@/glossary/doctrine.md).

Výslovný kontrakt má lidskou obdobu v institutu [informovaného souhlasu](@/glossary/informed-consent.md).
Beauchamp a Childress (2019) uvádějí jako jeho složky sdělení podstatných informací, porozumění,
dobrovolnost a možnost souhlas odvolat. Stejně jako AIAD předem říká, co agent smí, říká informovaný
souhlas předem, co se s člověkem bude dít – a v obou případech je kontrakt bezcenný, pokud ho druhá
strana může jednostranně a nepozorovaně měnit.

## Kde se pojem v knize vyskytuje

Hlavním místem je oddíl [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md), který
popisuje, jak se agenti definovaní tímto standardem podílejí na obraně proti technikám EA. Konkrétní
příklady přinášejí stránky [Archer Supreme a EA](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md)
o koordinaci při kritických incidentech, [OSINT a EA](@/kompendium/aiad-integration/osint-ea-source-validation.md)
o vážení veřejných zdrojů a [Compliance a EA](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md)
o přiřazování zjištění k regulatorním povinnostem. Kontext platformy jako celku vysvětluje kapitola
[Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md).

Na lidské straně odpovídá požadavku výslovných pravidel kapitola
[Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md) a
[Cykly revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md). Opačný proces –
tiché přepisování pravidel – popisuje technika
[EA-2.4.2 Skryté přepisování politik](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md) a
[EA-2.4.5 Přepis hodnoticích kritérií](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md).

## Od pojmu k praxi

### Rozpoznání

V softwaru se chybějící kontrakt pozná podle toho, že chování součásti lze zjistit jen jejím
spuštěním a pozorováním. V lidském prostředí je obdobou situace, kdy pravidla nejsou nikde zapsána,
mění se zpětně a výklad drží jediná osoba. Hassan (1988) popisuje v modelu BITE kontrolu chování
pomocí rozsáhlých a proměnlivých pravidel a kontrolu informací tím, že jejich význam určuje autorita.
Pozorovatel si klade otázky: Lze zjistit, jaká pravidla platila minulý měsíc? Kdo je smí změnit a
musí to oznámit? A má člověk, na nějž se pravidla vztahují, možnost se k jejich změně vyjádřit?

### Obrana

Obranou v technickém systému je verzovaná specifikace, automatická kontrola souladu a záznam každé
změny. Obdobou v instituci jsou zveřejněná pravidla, jejich verzování, povinnost oznámit změnu a
nezávislý přezkum. Fuller (1964) v právní teorii uvedl mezi podmínkami vnitřní morálky práva
veřejnost pravidel, jejich srozumitelnost, stálost v čase a zákaz zpětné účinnosti; jde o přesnou
lidskou obdobu toho, co AIAD vyžaduje od agentů. Obrana jednotlivce stojí na tom, že si vede vlastní
záznam pravidel a jejich změn – viz [Paměťový archiv](@/kompendium/self-defense-guides/43-memory-archive.md).

### Náprava

Kde se ukáže, že pravidla byla měněna bez oznámení, začíná náprava rekonstrukcí: co platilo, kdy a kdo
změnu provedl. Kapitoly [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
a [Interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md) popisují, jak
takový záznam obnovit. U lidí, kteří v prostředí proměnlivých pravidel dlouho žili, je součástí zotavení
obnova schopnosti spolehnout se na dohodu – viz [Subakutní rekonstrukce důvěry](@/kompendium/recovery-protocols/subacute-trust-rebuilding.md).

## Odlišení od příbuzných pojmů

AIAD je třeba odlišit od [registru agentů](@/glossary/agent-registry.md): standard určuje, jak má
definice vypadat, registr vynucuje, aby se agent za běhu choval v jejích mezích. Od doktríny se AIAD
liší tím, že doktrína stanoví hodnoty a cíle, kdežto AIAD je jen formát, který jejich dodržení činí
ověřitelným. Od smlouvy mezi lidmi se liší tím, že agent nemá vůli a jeho „souhlas“ je metafora; proto
kniha analogii vztahuje na strukturu pravidel, ne na vztah mezi rovnými stranami.

## Časté omyly

Prvním omylem je představa, že výslovný kontrakt sám zaručuje dobré chování. Kontrakt jen zviditelňuje,
co se slíbilo; pokud jsou slíbené cíle škodlivé, výslovnost škodu nezmírní. Druhým omylem je přenášet
na lidi požadavek bezvýjimečného souladu: co je v kódu žádoucí přísnost, je v mezilidském vztahu znak
kontroly. Třetím omylem je považovat formální soulad za soulad skutečný – organizace může mít dokonalé
předpisy a jednat jinak; kniha tento rozpor rozebírá u souladu „jen na papíře“.

## Příklad (anonymizovaný kompozit)

Dobrovolnický spolek má stanovy, ale skutečná pravidla určuje zakladatel ústně a mění je podle situace:
jednou je účast na víkendových akcích dobrovolná, podruhé je neúčast „projevem neloajality“. Nový člen
si začne zapisovat, co bylo kdy řečeno, a po půl roce předloží výboru přehled rozporů. Výbor rozhodne,
že platí jen pravidla schválená a zveřejněná na nástěnce spolku, s datem účinnosti. Napětí ve spolku
neskončí hned, ale lidé poprvé vědí, čeho se drží.

## Meze a otevřené otázky

Přenos softwarového pojmu na lidské instituce je analogie, nikoli teorie organizací. Otevřená zůstává
otázka, jak specifikovat chování agentů, jejichž výstupy nejsou deterministické, například agentů
postavených na jazykových modelech: kontrakt lze popsat, ale jeho dodržení lze ověřit jen
pravděpodobnostně. Amodei a spolupracovníci (2016) tuto třídu problémů popsali jako konkrétní otázky
bezpečnosti AI – mimo jiné nežádoucí vedlejší účinky a obcházení zadaného cíle.

## Literatura

- Amodei, D., Olah, C., Steinhardt, J., Christiano, P., Schulman, J., & Mané, D. (2016). Concrete problems in AI safety. *arXiv:1606.06565*.
- Beauchamp, T. L., & Childress, J. F. (2019). *Principles of Biomedical Ethics* (8. vyd.). Oxford University Press.
- Fuller, L. L. (1964). *The Morality of Law*. Yale University Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Park Street Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism*. W. W. Norton.
- Meyer, B. (1992). Applying „design by contract“. *IEEE Computer*, 25(10), 40–51.

## Související

**Glosář**

- [AIAD](@/glossary/aiad.md) – technické heslo, které most propojuje.
- [Agent Tier](@/glossary/agent-tier.md) – úroveň oprávnění deklarovaná v definici.
- [NM/ND](@/glossary/nm-nd.md) – doktrína, s níž musí být definice v souladu.
- [Informed consent](@/glossary/informed-consent.md) – lidská obdoba výslovného kontraktu.

**Kniha**

- [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md) – jak agenti pracují s taxonomií.
- [EA-2.4.2 Skryté přepisování politik](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md) – opak výslovných pravidel.
- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md) – zapsaná pravidla v instituci.
- [Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md) – co kniha z platformy přebírá.

**Sesterské mosty**

- [Bridge: Agent Tier](@/kompendium/glossary-bridges/bridge-agent-tier.md) – úrovně oprávnění.
- [Bridge: Agent Registry](@/kompendium/glossary-bridges/bridge-agent-registry.md) – vynucení za běhu.
- [Bridge: NM/ND](@/kompendium/glossary-bridges/bridge-nm-nd.md) – doktrína a její meze u lidí.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [AIAD](@/glossary/aiad.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
