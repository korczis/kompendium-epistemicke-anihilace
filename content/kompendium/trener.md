+++
title = "Trenér rozpoznávání"
description = "Jeden interaktivní trenér pro všechny katalogy knihy: posuďte výrok, určete heslo a uvidíte detekční znak i obrannou odpověď."
weight = 999
template = "kompendium/katalog-trener.html"

[taxonomies]
tags = ["kompendium", "trener", "nlp", "fauly"]
categories = ["academic"]

[extra]
toc = false
catalogs = ["nlp", "fauly"]
catalog_index = "data/katalogy.json"
+++

# Trenér rozpoznávání

## Jak trenér pracuje

Trenér ukazuje krátké původní výroky a situace, ve kterých zazněly. Bere je ze všech katalogů
knihy, tedy z NLP vzorců i z argumentačních faulů, a nový katalog se v něm objeví sám, jakmile
přibude v deklaraci katalogů. U každého výroku nejdřív posoudíte, zda jde o manipulativní,
nátlakové nebo chybné užití, nebo o neškodný či platný kontrast. Potom určíte heslo katalogu,
které ve výroku poznáváte, buď výběrem ze čtyř možností, nebo napsáním názvu. Trenér k
napsanému názvu jen navrhne shody a hodnotí až vaši volbu. Po odpovědi uvidíte detekční znak,
obrannou odpověď a odkaz na stránku hesla; jak s knihou a jejími nástroji pracovat, popisuje
[jak používat kompendium](@/kompendium/01-predmluva/jak-pouzivat.md).

Výběr můžete zúžit na jeden katalog nebo jednu rodinu. Příklady, které se vám nedaří, se
vracejí častěji; příklad je zvládnutý, když ho třikrát po sobě správně posoudíte i určíte.
Pokrok se ukládá jen ve vašem prohlížeči. Proč trenér pracuje s neškodnými kontrasty a
kde jsou meze takového výcviku, vysvětlují [metodologické poznámky](@/kompendium/02-uvod/metodologicke-poznamky.md).

## K čemu trenér slouží a k čemu ne

Trenér cvičí rozpoznání a obranu, ne použití. Výroky jsou ilustrační, nejsou šité na žádnou
osobu a netvoří posloupnost, kterou by šlo opakovat. Každý manipulativní nebo chybný příklad
má vedle sebe neškodný či platný kontrast, protože stejné jazykové prostředky a podobné
struktury úvahy se objevují i v běžné řeči a v poctivé argumentaci. Rozhoduje kontext,
symetrie a to, komu užití slouží. Výklad každého hesla, stav poznání a obranu najdete na jeho
stránce; obranný rámec celé knihy shrnují
[etické aspekty](@/kompendium/01-predmluva/eticke-aspekty.md).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

- [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) – katalog, z něhož trenér bere hesla i příklady
- [Předpoklady NLP](@/kompendium/nlp-vzorce/predpoklady/_index.md) – rodina katalogu NLP vzorce, 21 hesel
- [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) – rodina katalogu NLP vzorce, 42 hesel
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) – rodina katalogu NLP vzorce, 17 hesel
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina katalogu NLP vzorce, 30 hesel
- [Ericksonovská hypnóza](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/_index.md) – rodina katalogu NLP vzorce, 28 hesel
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina katalogu NLP vzorce, 19 hesel
- [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/_index.md) – rodina katalogu NLP vzorce, 16 hesel
- [Reframing a rámce](@/kompendium/nlp-vzorce/reframing/_index.md) – rodina katalogu NLP vzorce, 17 hesel
- [Kotvení](@/kompendium/nlp-vzorce/kotveni/_index.md) – rodina katalogu NLP vzorce, 19 hesel
- [Submodality](@/kompendium/nlp-vzorce/submodality/_index.md) – rodina katalogu NLP vzorce, 20 hesel
- [Disociace, fobie a trauma](@/kompendium/nlp-vzorce/disociace-a-trauma/_index.md) – rodina katalogu NLP vzorce, 11 hesel
- [Časová osa](@/kompendium/nlp-vzorce/casova-osa/_index.md) – rodina katalogu NLP vzorce, 12 hesel
- [Logické úrovně a percepční pozice](@/kompendium/nlp-vzorce/urovne-a-pozice/_index.md) – rodina katalogu NLP vzorce, 16 hesel
- [Strategie a modelování](@/kompendium/nlp-vzorce/strategie-a-modelovani/_index.md) – rodina katalogu NLP vzorce, 20 hesel
- [Práce s částmi](@/kompendium/nlp-vzorce/integrace-casti/_index.md) – rodina katalogu NLP vzorce, 9 hesel
- [Přesvědčení](@/kompendium/nlp-vzorce/presvedceni/_index.md) – rodina katalogu NLP vzorce, 14 hesel
- [Metaprogramy](@/kompendium/nlp-vzorce/metaprogramy/_index.md) – rodina katalogu NLP vzorce, 23 hesel
- [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) – rodina katalogu NLP vzorce, 16 hesel
- [Cíle a výsledky](@/kompendium/nlp-vzorce/cile-a-vysledky/_index.md) – rodina katalogu NLP vzorce, 10 hesel
- [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) – rodina katalogu NLP vzorce, 20 hesel
- [Vliv a zneužití NLP](@/kompendium/nlp-vzorce/vliv-a-zneuziti/_index.md) – rodina katalogu NLP vzorce, 20 hesel
- [Kritické hodnocení NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/_index.md) – rodina katalogu NLP vzorce, 14 hesel
- [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) – katalog, z něhož trenér bere hesla i příklady
- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina katalogu Argumentační fauly, 14 hesel
- [Klamy relevance](@/kompendium/argumentacni-fauly/relevance/_index.md) – rodina katalogu Argumentační fauly, 28 hesel
- [Klamy předpokladu](@/kompendium/argumentacni-fauly/predpoklady-argumentu/_index.md) – rodina katalogu Argumentační fauly, 20 hesel
- [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) – rodina katalogu Argumentační fauly, 9 hesel
- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina katalogu Argumentační fauly, 16 hesel
- [Klamy jazyka a dvojznačnosti](@/kompendium/argumentacni-fauly/jazykove-klamy/_index.md) – rodina katalogu Argumentační fauly, 13 hesel
- [Rétorické a dialogické taktiky](@/kompendium/argumentacni-fauly/dialekticke-taktiky/_index.md) – rodina katalogu Argumentační fauly, 16 hesel
- [Klamy hodnot, přírody a vědy](@/kompendium/argumentacni-fauly/hodnoty-a-veda/_index.md) – rodina katalogu Argumentační fauly, 9 hesel
- [Principy kritické diskuse a teorie argumentace](@/kompendium/argumentacni-fauly/teorie-argumentace/_index.md) – rodina katalogu Argumentační fauly, 20 hesel

<!-- kompendium:katalog-vazby:end -->
