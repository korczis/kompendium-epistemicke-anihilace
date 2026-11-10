+++
title = "Paralysis by analysis (paralýza analýzou)"
weight = 5
description = "Rozhodovací patologie, kdy nadměrné zvažování, sběr informací nebo hodnocení možností zabrání jakémukoli rozhodnutí; obrana, odlišení a zneužití v manipulaci."

[taxonomies]
tags = ["glossary", "psychology", "cognitive", "due-diligence", "kompendium"]

[extra]
category = "decision-theory"
status = "active"
author = "Tomas Korcak (korczis)"
reading_time = "5 min"
difficulty = "intermediate"
quality_score = 88
date_created = "2026-05-03"
date_updated = "2026-05-03"
importance = "medium"
related_terms = ["bayesian-reasoning", "uncertainty", "anomaly-detection", "reality-testing"]
keywords = ["paralysis by analysis", "analysis paralysis", "overthinking", "decision fatigue", "satisficing", "Simon", "bounded rationality"]
key_takeaway = "Paralysis by analysis is the failure mode of optimization seekers in environments where optimization is impossible. The remedy is not better analysis but explicit pre-commitment to *satisficing* heuristics — accepting good-enough rather than chasing best-possible."
see_also = ["bayesian-reasoning", "uncertainty"]
image = "/images/sections/glossary.png"
image_alt = "Paralysis by analysis (paralýza analýzou) – glosář"
+++

## Definice

**Paralýza analýzou** (*paralysis by analysis*, také *analysis paralysis*) je rozhodovací
patologie, při níž člověk nebo tým vynaloží tolik úsilí na shromažďování informací,
hodnocení možností, modelování důsledků nebo hledání *nejlepšího možného* řešení, že
k rozhodnutí vůbec nedojde, nebo dojde příliš pozdě, než aby bylo účinné.

Vzorec je strukturně odlišný od racionálního zvažování. Racionální zvažování končí, když
očekávaná mezní hodnota další analýzy klesne pod její cenu; paralýza analýzou tento bod
ukončení nerozpozná, protože vnímaná vysoká sázka nafukuje hodnotu další analýzy donekonečna.

## Původ a kontext pojmu

Herbert A. Simon (1956, 1957) formalizoval v rámci *omezené racionality* (*bounded
rationality*) protiklad mezi *maximalizací* (hledání optima) a *satisficingem* (přijetí
prvního řešení, které překročí práh přijatelnosti). Empirický výzkum Sheeny Iyengarové
a Marka Leppera (2000) o *přetížení volbou* (*choice overload*) ukázal, že nárůst počtu
možností může pravděpodobnost rozhodnutí *snížit* – ve známé „studii marmelád“ nakoupil
z nabídky šesti druhů zhruba desetkrát větší podíl zákazníků než z nabídky dvaceti čtyř.
Barry Schwartz (*The Paradox of Choice*, 2004) rozlišuje *maximizery* (osobnostní styl
náchylný k paralýze) a *satisficery* (přijímají pragmaticky). Gerd Gigerenzer a Reinhard
Selten (2001) chápou jednoduché heuristiky jako adaptivní nástroje, ne jako vadu.

Na pozdější replikace efektu přetížení volbou je dobré pamatovat: jeho síla se mezi studiemi
liší a závisí na podmínkách (srov. heslo [Replication Crisis](@/glossary/replication-crisis.md)).

## Jak se projevuje

- opakované „ještě potřebujeme jedno ověření“ bez předem stanoveného kritéria, kdy ověřování
  skončí;
- rozšiřování otázky místo jejího zužování (každá odpověď otevře dvě nové otázky);
- přesouvání termínů a výrazná úleva při každém odkladu;
- rostoucí detailnost podkladů bez změny navrhovaného závěru;
- u jednotlivce úzkost a ruminace před rozhodnutím, únava a vyhýbání se tématu.

V kontextu Prismatic Platform je paralýza analýzou častým antivzorcem zejména:
(1) v **pracovním postupu due diligence** – analytik nemůže vydat schválení, dokud neověří
*všechna* zjištění, ale objem signálů je nekonečný; (2) v **architektonických rozhodnutích** –
výběr databázového adaptéru se vleče měsíce, ačkoli žádná z variant by nezpůsobila katastrofu;
(3) v **reakci na incidenty** – operátor v pohotovosti váhá mezi rollbackem a opravou vpřed
tak dlouho, že incident eskaluje.

## Mechanismus

Paralýza vzniká, když tři věci působí současně: nejasně ohraničený prostor možností,
vnímaná vysoká sázka a chybějící pravidlo ukončení. Každá nová informace pak nezmenšuje
nejistotu, ale zvětšuje prostor, který je třeba prozkoumat. Osobnostně se k tomu přidává
strach z chyby a [perfekcionismus](@/glossary/perfekcionismus.md); organizačně rozptýlená
odpovědnost, v níž se za odklad nikdo nezodpovídá.

Pro Kompendium je důležité, že paralýzu lze **navodit zvenčí**. Zahlcení množstvím tvrzení
([Gish Gallop](@/glossary/gish-gallop.md), [Firehose of
Falsehood](@/glossary/firehose-of-falsehood.md)), uměle zvyšovaná složitost ([EA-1.2.3
Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md)) nebo vytrvalé
požadavky na další a další doklady ([sealioning](@/glossary/sealioning.md)) vytvářejí stav,
v němž oběť nemůže uzavřít úsudek ani jednat. Opačným vzorcem je uměle vyvolaný časový tlak,
který rozhodnutí naopak uspěchá (viz [detekční signaturu Vytváření časového
tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md)).

## Odlišení

- **Od racionální opatrnosti** – opatrnost má pravidlo ukončení a mění se s novými
  informacemi; paralýza pravidlo nemá.
- **Od úzkostných poruch a OCPD** – klinicky se chronická paralýza překrývá s obsedantně
  kompulzivní poruchou osobnosti (srov. [anankastický režim](@/glossary/anankasticky-rezim.md))
  a s generalizovanou úzkostnou poruchou, ale ne každý případ je psychopatologií; často jde
  o kulturně podporovaný vzorec v profesích, které vyžadují [due
  diligence](@/glossary/due-diligence.md).
- **Od [rekurzivní paralýzy](@/glossary/rekurzivni-paralyza.md)** – ta se týká sebereflexe,
  která se zacyklí sama na sobě; paralýza analýzou se týká rozhodování o vnějším problému.
- **Od depresivní abulie** – u deprese chybí energie a motivace, ne rozhodovací kritérium.

## Význam pro Kompendium

Platforma řeší paralýzu dvoufázovým modelem [NABLA Infinity](@/glossary/nabla-infinity.md)
a [doktríny NM/ND](@/glossary/nm-nd.md): fáze zkoumání má výslovný práh, po jehož dosažení
se přechází k exekuci. Pilíř M5M (*Max 5 Minutes*) je institucionalizovanou obranou: žádné
rozhodnutí nemá trvat déle než pět minut bez výslovné eskalace. V knize pojem vysvětluje,
proč oběti dlouhodobé manipulace často „nemohou odejít“, i když vědí, že by měly – nejde
o nedostatek informací, ale o rozložené pravidlo ukončení úsudku.

## Obrana a zotavení

Praktické postupy z původní verze hesla:

1. **Časově ohraničený přezkum DD** – každá zpráva due diligence má pevný termín pro
   zveřejnění prvních zjištění (typicky pět pracovních dní); další úpravy probíhají
   v následných iteracích, ne nekonečným odkládáním první verze.
2. **Záznamy architektonických rozhodnutí** (*Architecture Decision Records*, ADR) – nový
   technický návrh má dvoutýdenní okno na diskusi, po němž vedení vynutí rozhodnutí: přijmout,
   odmítnout, nebo odložit s výslovným termínem.
3. **Runbook pro reakci na incidenty** – rozhodovací stromy s předem stanovenými body větvení
   odstraňují potřebu zvažování ve stresu; operátor postupuje podle runbooku, ne podle intuice.
4. **Předběžný závazek** – *Odysseova smlouva*: zavázat se k rozhodnutí podle předem
   stanoveného kritéria (např. „je-li cena vyšší než X, nezvažuji“), čímž odpadne možnost
   donekonečného zvažování.

Pro jednotlivce: stanovit si předem, co bude „dost dobré“ (*satisficing threshold*), omezit
počet možností, ohraničit čas a rozhodnutí probrat s důvěryhodnou osobou mimo vliv toho, kdo
zahlcení vytváří. Je-li paralýza navozena manipulací, je prvním krokem pojmenovat vzorec
(„požadavky na další důkazy nemají konec“) a přestat hrát podle pravidel, která neumožňují
skončit. Pro terapeuta: odlišit vnější zdroj zahlcení od vnitřní úzkosti a pracovat
s tolerancí nejistoty (srov. [epistemická pokora](@/glossary/epistemicka-pokora.md)).

## Literatura

- Herbert A. Simon: *Models of Man: Social and Rational* (Wiley, 1957).
- Sheena S. Iyengar, Mark R. Lepper: „When Choice is Demotivating“, *Journal of Personality
  and Social Psychology* (2000).
- Barry Schwartz: *The Paradox of Choice: Why More Is Less* (Harper, 2004).
- Daniel Kahneman: *Thinking, Fast and Slow* (Farrar, Straus and Giroux, 2011).
- Gerd Gigerenzer, Reinhard Selten (eds.): *Bounded Rationality: The Adaptive Toolbox* (MIT
  Press, 2001).

## Související

**Pojmy**

- [Reality Testing](@/glossary/reality-testing.md) – funkce, která omezuje analýzu na
  relevantní signály.
- [Perfekcionismus](@/glossary/perfekcionismus.md) – osobnostní zdroj nekonečného zvažování.
- [Rekurzivní paralýza](@/glossary/rekurzivni-paralyza.md) – zacyklená sebereflexe.
- [Gish Gallop](@/glossary/gish-gallop.md) – zahlcení, které paralýzu vyvolává zvenčí.
- [NM/ND](@/glossary/nm-nd.md) – výslovný přechod od zkoumání k exekuci.

**Hesla platformy mimo tuto knihu**

- [Bayesian Reasoning](https://prismatic-reality-com.github.io/prismatic-promo/glossary/bayesian-reasoning/) –
  dává kritérium ukončení (kdy je apriorní odhad dost aktualizovaný).
- [Uncertainty](https://prismatic-reality-com.github.io/prismatic-promo/glossary/uncertainty/) –
  podloží rozhodovací patologie.
- [Anomaly Detection](https://prismatic-reality-com.github.io/prismatic-promo/glossary/anomaly-detection/) –
  provozní kontext, kde jsou nutná rychlá rozhodnutí.

**Kniha**

- [EA-1.2.3 Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) –
  technika, která paralýzu navozuje.
- [Detekční signatura: Vytváření časového tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md) –
  opačný vzorec uspěchaného rozhodnutí.
