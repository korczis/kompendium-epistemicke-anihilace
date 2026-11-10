+++
title = "Prolog (logické programování)"
weight = 100
description = "Prolog: jazyk logického programování založený na Hornových klauzulích. Co umí formální logika při rozboru argumentů, předpoklad uzavřeného světa a meze."

[taxonomies]
tags = ["glossary", "kompendium", "ai-systems", "self-reference"]

[extra]
category = "logic"
related_terms = ["inference", "cirkularni-argumentace", "self-reference", "russell-paradox", "modalni-logika", "infinitni-regress"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

## Definice

**Prolog** (z franc. *programmation en logique*) je programovací jazyk **logického
programování**. Program v Prologu není posloupnost příkazů, ale soubor **faktů** („Jan je
rodič Petra“) a **pravidel** („X je prarodič Z, jestliže X je rodič Y a Y je rodič Z“).
Výpočet probíhá tak, že systém odpovídá na dotazy: hledá, zda lze dotaz z faktů a pravidel
odvodit, a pokud ano, za jakých hodnot proměnných.

V Kompendiu se heslo objevuje v souvislosti s formálními logickými moduly platformy, z níž
kniha vzešla. Tato stránka popisuje Prolog a logické programování obecně: co může formalizace
přinést při rozboru argumentačních struktur, které kniha popisuje, a kde jsou její meze.
Implementaci zmíněných modulů nepopisuje.

## Původ a kontext pojmu

Prolog vznikl v roce 1972 v Marseille v týmu Alaina Colmerauera a Philippa Roussela. Teoretický
základ mu dala práce Roberta Kowalského, který ukázal, že logické formule ve tvaru **Hornových
klauzulí** lze číst zároveň deklarativně (co platí) a procedurálně (jak to spočítat); shrnul ji
v knize *Logic for Problem Solving* (1979). Výpočetním mechanismem je **rezoluce**, kterou
pro automatické dokazování formuloval J. A. Robinson (1965), a **unifikace** – hledání
dosazení, při němž se dva výrazy shodují.

Dva pojmy z teorie logického programování mají pro Kompendium zvláštní význam:

- **Negace jako neúspěch** (*negation as failure*, Clark 1978): tvrzení je považováno za
  nepravdivé, pokud se ho nepodaří dokázat.
- **Předpoklad uzavřeného světa** (*closed-world assumption*, Reiter 1978): co není v databázi
  uvedeno nebo z ní odvoditelné, je považováno za nepravdivé.

## Jak se projevuje

V praxi se logické programování používá v expertních systémech, zpracování přirozeného
jazyka, plánování, ověřování konfigurací a v reprezentaci znalostí. Pro rozbor argumentace je
užitečné tím, že nutí **explicitně zapsat** premisy a pravidla. Jakmile je argument zapsán:

- je vidět, které premisy jsou skutečně potřeba a které jsou jen rétorickou výplní;
- **kruhová definice** se projeví jako nekonečná rekurze: dotaz se volá sám na sebe a výpočet
  nikdy neskončí (srov. [cirkulární argumentace](@/glossary/cirkularni-argumentace.md)
  a [infinitní regres](@/glossary/infinitni-regress.md));
- rozpor mezi pravidly se projeví tím, že lze odvodit tvrzení i jeho negaci;
- chybějící předpoklad se projeví tím, že závěr nelze odvodit.

## Mechanismus

Prolog odvozuje závěry **zpětně**: začne u dotazu a hledá pravidla, jejichž závěr se s dotazem
shoduje, a pak se snaží dokázat jejich předpoklady. Pokud cesta selže, vrátí se a zkusí jinou
(*backtracking*). Tento postup je úplný jen za určitých podmínek; v obecném případě může
výpočet uvíznout v nekonečné smyčce, i když řešení existuje.

Pro Kompendium je poučný **předpoklad uzavřeného světa**. V databázi je rozumný: co není
v seznamu letů, to neletí. Přenesen do mezilidského úsudku se však stává známou manipulační
chybou: „nemáš důkaz, tedy se to nestalo“, „nikdo to nepotvrdil, tedy to není pravda“.
Formální logika tu dobře ukazuje, že jde o **volbu předpokladu**, nikoli o logickou nutnost:
ve světě, kde informace chybějí nebo jsou potlačovány, je „nedokázáno“ něco jiného než
„nepravdivé“. Tento posun hraje roli u technik, které pracují s neexistencí důkazů, například
[EA-1.3.2 Strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md).

## Odlišení

- **Prolog vs. logika obecně.** Prolog pracuje s omezeným fragmentem predikátové logiky
  (Hornovy klauzule) a s procedurální strategií; ne každé logické tvrzení lze v něm přímo
  vyjádřit.
- **Prolog vs. typované logiky.** Prolog je v základní podobě netypovaný a sebe-referenčním
  paradoxům sám nebrání. Ochranu přináší typová disciplína ve smyslu Russellovy teorie typů
  nebo typovaných systémů (viz [Russellův paradox](@/glossary/russell-paradox.md)); tvrzení,
  že logické programování „eliminuje“ paradoxy, je proto třeba chápat jako vlastnost konkrétní
  implementace, nikoli Prologu jako takového.
- **Formální platnost vs. pravdivost.** Logika zaručuje, že ze správných premis plynou správné
  závěry; o pravdivosti premis nic neříká. Dokonale platný argument může stát na nepravdivých
  premisách.
- **Vs. [modální logika](@/glossary/modalni-logika.md).** Úsudky o možnosti a nutnosti
  vyžadují jiné formální nástroje.

## Význam pro Kompendium

Logické programování slouží knize jako **analytický nástroj**, ne jako obrana sama o sobě. Umožňuje
zviditelnit strukturu argumentů, které se v manipulaci objevují: kruhy, regresy, skryté
premisy a sebe-referenční konstrukce popisované v technice [EA-5.1.21 Sebe-referenční paradox](@/kompendium/techniques/ea-5-1-21-sebe-referencni-paradox.md)
a v protokolech [paradoxální metaanihilace](@/kompendium/05-ultramari-techniky/kapitola-9.md).
Souvisí také s kapitolou [Computational epistemology a NABLA](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md),
která rozebírá vztah formálních metod a epistemologie.

## Obrana a zotavení

Pro profesionály (analytiky, forenzní znalce, výzkumníky) plynou z logického programování tato
praktická pravidla:

- **Zapsat argument explicitně** – premisy, pravidla a závěr zvlášť. Skrytá premisa je častým
  místem manipulace (srov. [Toulmin model](@/glossary/toulmin-model.md)).
- **Hledat smyčky** – vrací-li se zdůvodnění k sobě, nejde o důkaz.
- **Rozlišovat „nedokázáno“ a „nepravdivé“** – zejména tam, kde jedna strana kontroluje přístup
  k informacím.
- **Nepřeceňovat formalizaci** – formální model je jen tak dobrý jako jeho premisy a nenahrazuje
  odborný úsudek ani výpověď dotčeného člověka.

## Literatura

- Robinson, J. A. (1965). A Machine-Oriented Logic Based on the Resolution Principle. *Journal
  of the ACM*.
- Clark, K. L. (1978). Negation as Failure. In H. Gallaire & J. Minker (Eds.), *Logic and Data
  Bases*.
- Reiter, R. (1978). On Closed World Data Bases. In H. Gallaire & J. Minker (Eds.), *Logic and
  Data Bases*.
- Kowalski, R. (1979). *Logic for Problem Solving*.

## Související

**Pojmy glosáře**

- [Inference](@/glossary/inference.md) – odvozování, které Prolog mechanizuje.
- [Cirkulární argumentace](@/glossary/cirkularni-argumentace.md) – kruh, který se ve formalizaci projeví jako nekonečná rekurze.
- [Russellův paradox](@/glossary/russell-paradox.md) – proč je potřeba typová disciplína.
- [Self-reference](@/glossary/self-reference.md) – struktura, které netypovaný systém nebrání.
- [Toulmin model](@/glossary/toulmin-model.md) – neformální rozbor struktury argumentu.

**Techniky a teorie**

- [EA-5.1.21 Sebe-referenční paradox](@/kompendium/techniques/ea-5-1-21-sebe-referencni-paradox.md) – technika, u které je heslo uvedeno.
- [Computational epistemology a NABLA](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md) – formální metody v epistemologii.
- [Kapitola 9: Paradoxální metaanihilační protokoly](@/kompendium/05-ultramari-techniky/kapitola-9.md) – struktury, které formalizace pomáhá rozebrat.
