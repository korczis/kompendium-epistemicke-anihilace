+++
title = "AIAD"
weight = 11
description = "AIAD (AI-Assisted Development): standard deklarativních specifikací agentů umělé inteligence, jejich oprávnění a povinného bloku doktríny NM/ND."

[taxonomies]
tags = ["glossary", "agenti", "umělá-inteligence", "specifikace", "doktrína", "kompendium"]

[extra]
category = "architektura platformy"
abbreviation = "AIAD"
related_terms = ["agent-tier", "agent-registry", "nm-nd", "archer-supreme", "agent", "strategic-command", "supreme-commander", "tactical-execution", "3nl", "no-mercy-no-doubts", "violation-protocol"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-10"
+++

## Vymezení

AIAD (AI-Assisted Development, „vývoj s asistencí umělé inteligence“) je standard, v němž
Prismatic Platform, vývojové prostředí, z něhož kompendium vzešlo, popisovala agenty umělé
inteligence, jejich příkazy, pracovní postupy, adaptéry a politiky. Technická specifikace ho
charakterizuje jako na dodavateli nezávislý standard pro definici chování agentů, příkazů a
postupů napříč asistenty pro psaní kódu (Korčák, 2025b). Starší verze tohoto hesla rozváděla
zkratku jako „AI-Agent Interface Definition“; specifikace i úvodní dokument standardu však
užívají výhradně rozvedení „AI-Assisted Development“, a kniha se proto drží jich.

Pro kompendium není AIAD zajímavý jako softwarový produkt, ale jako pokus odpovědět na
epistemickou otázku, kterou otevírá delegování práce na stroj: jak vědět, co agent smí, co
tvrdí a podle jakých pravidel svá tvrzení vytváří. Filozofie svědectví ukazuje, že velká část
lidského poznání spočívá na důvěře v druhé, jejichž důvody sami nemůžeme přezkoumat (Hardwig,
1985). Agent umělé inteligence je novým typem takového svědka, a standard, který ho popisuje,
je proto zároveň pravidlem, podle něhož se mu smí důvěřovat. Tímto úhlem se heslo liší od
oddílu [AIAD a detekce EA](@/kompendium/aiad-integration/_index.md), který popisuje jednotlivé
agenty platformy ve vztahu k taxonomii knihy.

## Pojmová historie

Standard vznikl v roce 2025 jako reakce na rostoucí počet agentů a příkazů, které se v
platformě používaly souběžně v několika asistentech. Bez jednotného formátu by se jejich
rozsah, oprávnění a vzájemné vazby rozcházely podle toho, kdo je psal (Korčák, 2025b). Každá
součást je v AIAD souborem ve formátu Markdown s hlavičkou YAML; hlavička nese strojově čitelné
údaje (identifikátor, verzi, doménu, úroveň oprávnění, schopnosti, vstupy a výstupy, závislosti),
tělo souboru lidsky čitelný popis. Tento přístup navazuje na myšlenku Davida Parnase, že
modul má být definován rozhraním, které skrývá jeho vnitřek a zveřejňuje jen to, na co se
okolí smí spolehnout (Parnas, 1972).

Druhá verze specifikace přidala do standardu dvě věci. První je povinný blok vynucení, jímž
každá součást deklaruje podřízenost [doktríně NM/ND](@/glossary/nm-nd.md); součást bez něj
nemá být zaregistrována (Korčák, 2025a). Druhou je ambice, kterou specifikace nazývá „živým
standardem“: agenti a příkazy se mají sami vylepšovat podle vzorců z předchozích pracovních
sezení (Korčák, 2025b). Kniha tuto ambici uvádí jako deklarovaný cíl specifikace, nikoli jako
doloženou vlastnost; zda a v jakém rozsahu se naplnila, z dokumentace ověřit nelze.

## Mechanismus a pozorovatelné znaky

Jádrem standardu je smlouva. Bertrand Meyer navrhl chápat každou softwarovou součást jako
stranu smlouvy, která stanoví, co součást od volajícího vyžaduje, co mu zaručuje a co platí po
celou dobu jejího běhu (Meyer, 1992). Specifikace AIAD přenáší tuto myšlenku na agenta:
deklarované vstupy jsou předpoklady, deklarované výstupy záruky a blok doktríny invariant,
který platí pro každou operaci (Korčák, 2025b). Pozorovatelným znakem dobře popsaného agenta
je tedy to, že z jeho specifikace lze předem říct, co od něj čekat, aniž by bylo nutné číst
jeho implementaci.

Standard rozlišuje pět druhů součástí. Agent je samostatně jednající jednotka s vymezenou
doménou, příkaz operace, kterou vyvolává člověk, pracovní postup (pipeline) řetězec kroků,
politika pravidlo, které se uplatňuje napříč součástmi, a adaptér most k vnějšímu nástroji
nebo modelu (Korčák, 2025b). Každá součást nese číslo verze a starší verze hesla doporučovala
řídit se sémantickým verzováním, podle něhož změna, která porušuje dosavadní smlouvu, vyžaduje
zvýšení hlavního čísla verze. Takové rozlišení je praktickou podobou Meyerova požadavku, aby
změna záruk byla viditelná pro každého, kdo se na součást spoléhá (Meyer, 1992). Agenti
platformy byli dále řazeni do domén, jako jsou kvalita, bezpečnost, zpravodajská analýza a
infrastruktura; počty agentů uváděné v různých verzích dokumentace se liší, a kniha je proto
neuvádí.

Druhou složkou je odstupňované oprávnění. Specifikace rozlišuje taktickou, strategickou a
nejvyšší úroveň autority a platformní glosář ji rozepisuje do pěti stupňů
[Agent Tier](@/glossary/agent-tier.md), od agentů, kteří smějí jen číst v jedné doméně, až po
agenty s oprávněním koordinovat a přepisovat ostatní (Korčák, 2025b). Princip odpovídá zásadě
nejmenšího oprávnění, kterou Saltzer a Schroeder formulovali jako jeden ze základů ochrany
informací: každá součást má mít jen ta oprávnění, která ke své práci nezbytně potřebuje
(Saltzer a Schroeder, 1975). Starší verze hesla z toho vyvozovala i praktické pravidlo, že
nový agent má začínat na nejnižší úrovni a být povýšen, teprve když je vyšší oprávnění
prokazatelně potřeba.

Třetí složkou je registr. Nástroj standardu prochází adresář specifikací, ověřuje, zda
hlavičky odpovídají schématu, a sestavuje z nich katalog, podle něhož se agenti za běhu
vyhledávají podle identifikátoru, schopnosti nebo úrovně oprávnění, jak popisuje heslo
[Agent Registry](@/glossary/agent-registry.md) (Korčák, 2025b). Starší verze hesla uváděla
jako typická selhání zvýšení oprávnění nad deklarovanou úroveň, kruhové závislosti mezi agenty,
zastaralý katalog po změně specifikace a překrývající se schopnosti bez určené priority. Všechna
čtyři selhání jsou v teorii víceagentních systémů známými zdroji nepředvídatelného chování,
protože narušují předpoklad, že každý agent má jasně vymezenou roli (Wooldridge, 2009).

Povinný blok doktríny vypadá ve specifikaci takto; ukázka slouží jen k tomu, aby bylo vidět,
že jde o deklaraci, a ne o kód, který by sám něco prováděl (Korčák, 2025a):

```yaml
enforcement:
  doctrine: "no-mercy-no-doubts"
  version: "2.0.0"
  compliance: mandatory
```

## Odlišení od příbuzných jevů

AIAD se liší od popisů rozhraní, jako je OpenAPI pro webové služby, tím, že vedle formátu dat
popisuje i oprávnění a normy, jimž agent podléhá. Neurčuje jen, co si dvě součásti vymění,
ale také, kdo za výsledek odpovídá a podle jakých pravidel se posuzuje (Korčák, 2025b). Blíží
se tak spíše organizačnímu řádu než technickému rozhraní; Parnas upozorňoval, že rozdělení
systému na moduly je vždy zároveň rozdělením práce a odpovědnosti mezi lidi (Parnas, 1972).

Od obecných rámců pro řízení rizik umělé inteligence se AIAD liší úrovní. Rámec amerického
institutu NIST formuluje funkce řízení, mapování, měření a ovládání rizika na úrovni
organizace a výslovně počítá s dokumentací systémů a jasným přiřazením odpovědnosti (National
Institute of Standards and Technology, 2023). AIAD je jednou možnou konkrétní podobou takové
dokumentace na úrovni jednotlivého agenta; za naplnění rámce ho však považovat nelze, protože
neobsahuje například posouzení dopadů na dotčené osoby.

## Organizační rámec a význam pro práci s poznáním

Pro organizaci, která nasazuje agenty umělé inteligence, je hlavní lekcí standardu
požadavek, aby oprávnění a pravidla agenta byla zapsána dříve, než agent začne jednat, a aby
byla čitelná pro člověka. Takový zápis umožňuje dohledat, proč agent něco udělal a kdo mu to
dovolil, což je předpoklad odpovědnosti (National Institute of Standards and Technology, 2023).
Kompendium samo dnes používá obdobnou, na poskytovateli nezávislou vrstvu pravidel v adresáři
`.ai/`, v níž jsou zapsány závazky každého pracovníka, člověka i stroje, který na knize pracuje.

Z hlediska epistemické obrany má AIAD dvojí význam. Za prvé ukazuje, že důvěra ve výstup
stroje má být důvěrou v proceduru, a ne v dojem: agent, jehož pravidla nejsou známa, je svědkem,
jemuž nelze rozumně důvěřovat, i když mluví přesvědčivě (Hardwig, 1985). Za druhé připomíná,
že automatizace sama neodstraňuje sklon přijímat výstup bez kontroly; literatura o
automatizaci popisuje, jak lidé pod tlakem přenechávají úsudek systému, i když ten chybuje
(Parasuraman a Riley, 1997). Kniha z toho vyvozuje zásadu, že každý výstup agenta je
hypotézou, kterou je třeba ověřit, než se z ní stane tvrzení.

## Meze a otevřené otázky

První mezí je rozdíl mezi deklarací a chováním. Specifikace popisuje, co agent smí a co
slibuje, ale u systémů postavených na jazykových modelech nelze ze specifikace vyvodit, že se
agent podle ní skutečně zachová; chování se musí ověřovat zvlášť, testy a sledováním výstupů
(Russell a Norvig, 2021). Deklarace oprávnění je nutnou, nikoli postačující podmínkou
bezpečnosti.

Druhou mezí je ambice samovylepšujících se specifikací. Pokud se pravidla agenta mění na
základě jeho vlastní činnosti, oslabuje se právě ta vlastnost, kvůli níž byl standard
zaveden, totiž předem známá a stabilní smlouva (Meyer, 1992). Otevřenou otázkou proto zůstává,
jak spojit přizpůsobivost agentů s požadavkem, aby každá změna jejich pravidel prošla
lidským přezkumem a zůstala dohledatelná; rámec NIST tento požadavek formuluje jako součást
řízení životního cyklu systému (National Institute of Standards and Technology, 2023).

## Literatura

- Hardwig, J. (1985). Epistemic dependence. *Journal of Philosophy, 82*(7), 335–349.
- Korčák, T. (2025a). *NO MERCY, NO DOUBTS – AIAD execution doctrine* (verze 2.0.0). Prismatic
  Platform, interní dokument `.aiad/doctrine/no-mercy-no-doubts.doctrine.md`.
- Korčák, T. (2025b). *AIAD technical specification* (verze 2.1.0). Prismatic Platform, interní
  dokument `.aiad/SPEC.md`.
- Meyer, B. (1992). Applying „design by contract“. *Computer, 25*(10), 40–51.
- National Institute of Standards and Technology. (2023). *Artificial intelligence risk
  management framework (AI RMF 1.0)* (NIST AI 100-1). U.S. Department of Commerce.
- Parasuraman, R., & Riley, V. (1997). Humans and automation: Use, misuse, disuse, abuse.
  *Human Factors, 39*(2), 230–253.
- Parnas, D. L. (1972). On the criteria to be used in decomposing systems into modules.
  *Communications of the ACM, 15*(12), 1053–1058.
- Russell, S., & Norvig, P. (2021). *Artificial intelligence: A modern approach* (4th ed.).
  Pearson.
- Saltzer, J. H., & Schroeder, M. D. (1975). The protection of information in computer
  systems. *Proceedings of the IEEE, 63*(9), 1278–1308.
- Wooldridge, M. (2009). *An introduction to multiagent systems* (2nd ed.). Wiley.

## Související

**Agenti a jejich řád**

- [Agent](@/glossary/agent.md) – obecný pojem agenta, který standard popisuje.
- [Agent Tier](@/glossary/agent-tier.md) – stupně oprávnění agentů.
- [Agent Registry](@/glossary/agent-registry.md) – katalog sestavený ze specifikací.
- [Archer Supreme](@/glossary/archer-supreme.md) – příklad agenta s nejvyšší úrovní oprávnění.

**Doktrína**

- [Doktrína NM/ND](@/glossary/nm-nd.md) – norma, jíž se každá součást AIAD podřizuje.
- [Protokol porušení](@/glossary/violation-protocol.md) – odpověď na porušení doktríny.

**Kontext knihy**

- [AIAD a detekce EA](@/kompendium/aiad-integration/_index.md) – jednotliví agenti platformy
  ve vztahu k taxonomii kompendia.
- [Bridge: aiad](@/kompendium/glossary-bridges/bridge-aiad.md) – propojení hesla s kapitolami
  knihy.
- [Computational epistemology a NABLA](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md)
  – teoretická reflexe poznání zprostředkovaného strojem.
