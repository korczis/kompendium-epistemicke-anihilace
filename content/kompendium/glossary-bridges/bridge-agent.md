+++
title = "Bridge: Agent"
description = "Most mezi heslem agenta a knihou: softwarový agent platformy, smyčka vnímání–rozhodnutí–akce a lidská agentnost, kterou manipulace oslabuje."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "agent", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["agent", "agent-registry", "agent-tier", "aiad", "bridge-agent-registry", "bridge-tactical-execution"]
glossary_target = "agent"
toc = false
+++

# Bridge: Agent

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Agent](@/glossary/agent.md) je na platformě Prismatic, z níž kniha vzešla, autonomní softwarová
entita s formálně popsanými vstupy, výstupy, oprávněními a doménou. Každý agent má úroveň
oprávnění L1 až L5 (viz [Agent Tier](@/glossary/agent-tier.md)), je zapsán v
[registru agentů](@/glossary/agent-registry.md) a běží jako proces pod supervizí. Heslo glosáře
zdůrazňuje rozdíl oproti běžnému významu slova v umělé inteligenci: agentem tu není jazykový
model s přístupem k nástrojům, ale proces s pevně vymezenými hranicemi, jehož výstupy ověřují
další brány.

Glosář popisuje práci agenta jako smyčku **vnímání – rozhodnutí – akce – zpětná vazba**. Kniha
z ní přebírá analogii: stejnou smyčku lze rozpoznat v lidském jednání a manipulace ji může
narušit v kterémkoli článku – zúžením toho, co člověk vnímá, zkreslením kritérií, podle nichž
rozhoduje, nebo zpochybněním toho, co se z výsledků svého jednání dozvídá.

## Pojem v jeho vlastním oboru

V informatice se agentem rozumí systém, který vnímá své prostředí prostřednictvím senzorů a
působí na ně prostřednictvím akčních členů (Russell a Norvig 1995). Wooldridge a Jennings (1995)
doplnili, že o *inteligentním* agentovi má smysl mluvit tehdy, je-li autonomní, reaguje na
změny prostředí, sleduje vlastní cíle a komunikuje s jinými agenty. Model agentů platformy
k tomu přidává tradici modelu aktorů, v němž výpočet probíhá jako výměna zpráv mezi nezávislými
jednotkami (Hewitt, Bishop a Steiger 1973), a principy supervize z prostředí Erlang/OTP, kde
selhání jednoho procesu nemá strhnout celek (Armstrong 2003).

Důležité je, že autonomie agenta platformy je **ohraničená**: rozhoduje sám, ale jen v rozsahu
svého oprávnění, a jeho výstupy procházejí kontrolou. Tato dvojice – vlastní rozhodování a
vnější ověřování – je i jádrem lidské analogie.

## Analogie, kterou kniha činí

Psychologie popisuje lidskou *agentnost* jako schopnost záměrně jednat, předvídat důsledky,
regulovat se a reflektovat vlastní jednání (Bandura 2001). S ní souvisí *pocit agentnosti* –
zkušenost, že jsem to já, kdo jedná a kdo svým jednáním něco mění (Haggard 2017). Obě složky
jsou pro poznání zásadní: kdo nevěří, že jeho úsudek má váhu, přestane ho používat.

Kniha ukazuje, jak manipulace zasahuje jednotlivé články smyčky. Vnímání zužuje
[EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md), která
řídí, k jakým informacím se člověk vůbec dostane. **Rozhodování** zkresluje
[EA-4.3.5 Modifikace evidenčních kritérií](@/kompendium/techniques/ea-4-3-5-evidential-criteria-modification.md),
která mění pravidla, podle nichž se hodnotí důkazy. **Zpětnou vazbu** rozvrací
[EA-2.5.8 Spirála rekurzivní pochybnosti](@/kompendium/techniques/ea-2-5-8-recursive-doubt-spiral.md):
člověk se přestane učit z výsledků, protože každý výsledek je předem zpochybněn. Konečným
stavem bývá to, co Seligman (1975) popsal jako naučenou bezmocnost – přesvědčení, že na vlastním
jednání nezáleží. Kniha mu odpovídá technikou
[EA-2.5.10 Implantace existenciální bezmocnosti](@/kompendium/techniques/ea-2-5-10-existential-helplessness-implantace.md).

## Kde se pojem v knize vyskytuje

Platformní stranu pojmu popisuje oddíl [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md):
agenti barevných týmů, strategičtí a doménoví agenti tam uplatňují taxonomii knihy v obranných
úlohách, například [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md)
nebo [Blue Team a obrana proti EA](@/kompendium/aiad-integration/blue-team-ea-defense.md).
Úvahy o umělých agentech jako aktérech, kteří mohou poznávání lidí podporovat i ohrožovat,
rozvádí kapitola [7.7 EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md).

Lidskou agentnost kniha rozebírá v kapitolách o
[metakognitivní rehabilitaci](@/kompendium/recovery-protocols/midterm-metacognitive-rehab.md) a
o [obnově kompetencí](@/kompendium/recovery-protocols/midterm-skill-rebuilding.md), kde je obnova
zkušenosti „moje rozhodnutí něco mění“ samostatným terapeutickým cílem.

## Od pojmu k praxi

### Rozpoznání

Oslabená agentnost se projevuje tím, že člověk přestává rozhodovat i v drobnostech, odkládá
volby na druhého a o vlastních úsudcích mluví jako o „pravděpodobně špatných“. Typický je
náhlý nárůst sebepochybnosti po rozhovorech s určitou osobou, který kniha popisuje v detekční
signatuře [Skok sebepochybnosti](@/kompendium/detection-signatures/26-phenomenological-self-doubt-spike.md).
Pozorovatel si může položit otázku, který článek smyčky je narušen: dostává člověk informace,
smí podle nich rozhodovat a vidí, co jeho rozhodnutí způsobilo?

### Odlišení

Pokles agentnosti není totéž co deprese, i když se s ní často pojí; deprese zasahuje motivaci
a náladu napříč oblastmi života, kdežto manipulací navozená bezmocnost bývá vázaná na konkrétní
vztah nebo prostředí a mimo ně může slábnout. Stejně tak dobrovolné svěření rozhodnutí
odborníkovi není ztrátou agentnosti, pokud člověk ví, proč to dělá, a může volbu kdykoli vzít
zpět. Diferenciální rozvahu nabízí kapitola
[6.2 Diferenciální diagnostika](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md).

### Obrana

Obrana obnovuje jednotlivé články smyčky. Vnímání chrání rozmanitost zdrojů
([Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)), rozhodování
výslovná vlastní kritéria ([Vyjasnění hodnot](@/kompendium/self-defense-guides/44-axiology-clarification.md))
a zpětnou vazbu záznam rozhodnutí a jejich výsledků, který se dá číst s odstupem
([Metakognitivní monitoring](@/kompendium/self-defense-guides/1-metacognitive-monitoring.md)).
Podstatné je malé měřítko: agentnost se obnovuje opakovanou zkušeností, že drobné rozhodnutí
mělo předvídatelný důsledek.

### Zotavení a rámec pro profesionály

Terapeut, který chce agentnost obnovit, by ji neměl nahrazovat vlastním rozhodováním. Kniha
upozorňuje, že i dobře míněné direktivní vedení může u člověka po manipulaci zopakovat původní
vzorec. Proto doporučuje nabízet volby, výslovně vracet rozhodnutí klientovi a pracovat
s postupným rozšiřováním okruhu, v němž klient rozhoduje sám – viz
[Subakutní rekonstrukce důvěry](@/kompendium/recovery-protocols/subacute-trust-rebuilding.md).

## Časté omyly

Prvním omylem je ztotožnit softwarového agenta s lidskou osobou. Analogie popisuje strukturu
smyčky, nikoli vědomí, odpovědnost či morální status. Druhým omylem je převzít z platformy
představu, že dobrý agent je ten, kdo poslušně plní příkazy vyšší úrovně; u lidí je naopak
schopnost odmítnout příkaz, který odporuje vlastnímu úsudku, znakem zdravé agentnosti. Třetím
omylem je číst ztrátu agentnosti jako slabost charakteru: kniha ji popisuje jako předvídatelný
výsledek prostředí, které soustavně trestá samostatné rozhodování.

## Příklad (anonymizovaný kompozit)

Muž ve středních letech po letech v kontrolujícím vztahu nedokáže v obchodě vybrat ani druh
pečiva bez telefonátu partnerce. Po odchodu ze vztahu s ním terapeutka nepracuje nejprve
s velkými rozhodnutími, ale s denním záznamem drobných voleb a jejich výsledků. Po několika
týdnech muž sám formuluje, že „to, co si vyberu, většinou dopadne normálně“. Teprve na tomto
základě se lze vracet k větším rozhodnutím o bydlení a práci. Případ ilustruje, že obnova
smyčky začíná u zpětné vazby, ne u vůle.

## Meze a otevřené otázky

Analogie mezi softwarovým agentem a člověkem je užitečná jako nástroj výkladu, ale má meze:
lidské jednání je vtělené, emočně zabarvené a vztahové, jak připomíná
[Bridge: Embodied cognition](@/kompendium/glossary-bridges/bridge-embodied-cognition.md).
Otevřenou otázkou zůstává, jak měřit pocit agentnosti u lidí po manipulaci spolehlivěji než
sebeposuzovacími dotazníky, a jak se do lidské agentnosti promítne každodenní spolupráce
s umělými agenty, kteří za člověka stále častěji vybírají a doporučují.

## Literatura

- Armstrong, J. (2003). *Making Reliable Distributed Systems in the Presence of Software Errors* (disertační práce). Royal Institute of Technology (KTH), Stockholm.
- Bandura, A. (2001). Social cognitive theory: An agentic perspective. *Annual Review of Psychology*, 52, 1–26.
- Haggard, P. (2017). Sense of agency in the human brain. *Nature Reviews Neuroscience*, 18(4), 196–207.
- Hewitt, C., Bishop, P., & Steiger, R. (1973). A universal modular ACTOR formalism for artificial intelligence. In *Proceedings of the 3rd International Joint Conference on Artificial Intelligence* (pp. 235–245).
- Russell, S., & Norvig, P. (1995). *Artificial Intelligence: A Modern Approach*. Prentice Hall.
- Seligman, M. E. P. (1975). *Helplessness: On Depression, Development, and Death*. W. H. Freeman.
- Wooldridge, M., & Jennings, N. R. (1995). Intelligent agents: Theory and practice. *The Knowledge Engineering Review*, 10(2), 115–152.

## Související

**Glosář**

- [Agent](@/glossary/agent.md) – heslo, které tento most propojuje s knihou.
- [Agent Tier](@/glossary/agent-tier.md) – úrovně oprávnění agentů.
- [Agent Registry](@/glossary/agent-registry.md) – evidence agentů a jejich identity.

**Kniha**

- [EA-2.5.10 Implantace existenciální bezmocnosti](@/kompendium/techniques/ea-2-5-10-existential-helplessness-implantace.md) – konečný stav rozvrácené agentnosti.
- [EA-2.5.8 Spirála rekurzivní pochybnosti](@/kompendium/techniques/ea-2-5-8-recursive-doubt-spiral.md) – útok na zpětnou vazbu.
- [Metakognitivní monitoring](@/kompendium/self-defense-guides/1-metacognitive-monitoring.md) – sledování vlastního rozhodování.
- [Středně-dobá metakognitivní rehabilitace](@/kompendium/recovery-protocols/midterm-metacognitive-rehab.md) – obnova schopnosti úsudku.

**Sesterské mosty**

- [Bridge: Agent Registry](@/kompendium/glossary-bridges/bridge-agent-registry.md) – kdo mluví a s jakým oprávněním.
- [Bridge: Tactical Execution](@/kompendium/glossary-bridges/bridge-tactical-execution.md) – specialista v mezích své domény.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Agent](@/glossary/agent.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
