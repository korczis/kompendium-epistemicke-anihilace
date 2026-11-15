+++
title = "Inference"
weight = 36
description = "Krok od dokladů k závěru: dedukce, indukce a abdukce, inference k nejlepšímu vysvětlení a proč techniky manipulace útočí právě na tento krok a na to, co platí za doklad."

[taxonomies]
tags = ["glossary", "kompendium", "logic", "epistemology"]

[extra]
category = "logika"
aliases = ["abdukce", "inference k nejlepšímu vysvětlení"]
related_terms = ["toulmin-model", "cirkularni-argumentace", "evidence-based", "modalni-logika", "konfirmacni-bias"]
author = "Tomas Korcak (korczis)"
date_created = "2026-02-23"
date_modified = "2026-11-14"
keywords = ["inference", "usuzování", "dedukce", "indukce", "abdukce", "inference k nejlepšímu vysvětlení", "doklad", "závěr", "argumentační schémata"]
+++

## Definice

**Inference** je krok, jímž člověk od dokladů, předpokladů nebo pozorování dospívá k závěru. Když z toho,
že je chodník mokrý, usoudím, že pršelo, nebo když z obecného pravidla a jednoho případu odvodím, co pro
ten případ platí, provádím inferenci. Toulmin (1958) ukázal, že každý takový krok má strukturu: z údajů se
přechází k tvrzení díky oprávnění, které tento přechod opravňuje, a právě oprávnění bývá v běžné řeči
nevyslovené.

Podstatou pojmu je rozdíl mezi tím, co je dáno, a tím, co se z toho usuzuje. Doklad a závěr nejsou totéž a
mezi nimi stojí úsudek, který může být správný i chybný. Walton (2008) proto zkoumá inferenci jako součást
argumentace: ptá se nejen, zda závěr z předpokladů logicky plyne, ale také, zda je v dané situaci rozumné ho
přijmout.

## Původ a kontext pojmu

Tradiční logika rozlišuje dva základní druhy inference. Dedukce vede od předpokladů k závěru, který z nich
nutně plyne: jsou-li předpoklady pravdivé, nemůže být závěr nepravdivý. Indukce vede od jednotlivých případů
k obecnějšímu závěru, který z nich plyne jen pravděpodobně; Hume (1748) ukázal, že takový závěr nelze
zdůvodnit bez předpokladu, že budoucnost bude podobná minulosti, a tento předpoklad sám indukcí zdůvodnit
nelze.

Třetí druh inference popsal Peirce, který ho nazval abdukcí. Abdukce vychází z překvapivého pozorování a
navrhuje hypotézu, za jejíž pravdivosti by pozorování bylo samozřejmé; podle Peirce (1934) je to jediný druh
usuzování, který přináší novou myšlenku, protože dedukce jen rozvíjí to, co předpoklady obsahují, a indukce
jen ověřuje. Harman (1965) tento typ usuzování nazval inferencí k nejlepšímu vysvětlení a tvrdil, že na něm
stojí i velká část toho, co se běžně považuje za indukci.

Lipton (2004) teorii inference k nejlepšímu vysvětlení rozpracoval a rozlišil mezi vysvětlením
nejpravděpodobnějším a vysvětlením nejlepším, tedy takovým, které by, kdyby bylo pravdivé, nejvíce
objasnilo. Walton, Reed a Macagno (2008) pak popsali argumentační schémata, typické vzorce každodenní
inference, například usuzování z názoru odborníka nebo z příčiny na následek, a ke každému z nich kritické
otázky, jimiž lze jeho oprávněnost prověřit.

## Jak se projevuje

V každodenním životě se inference projevuje jako samozřejmý přechod od toho, co člověk vidí nebo slyší, k
tomu, co si o tom myslí. Toulmin (1958) upozorňuje, že tento přechod se často odehrává bez povšimnutí,
protože oprávnění, na kterém stojí, se pokládá za samozřejmé; teprve když někdo závěr zpochybní, ukáže se,
jaké oprávnění se mlčky použilo.

V odborné práci se inference projevuje jako rozhodování mezi vysvětleními. Lékař, vyšetřovatel nebo
vědec zvažuje, které z možných vysvětlení nejlépe odpovídá dokladům, a Lipton (2004) ukazuje, že tato
úvaha je inferencí k nejlepšímu vysvětlení. Její slabinou je, že dobře působící vysvětlení může být
přijato dřív, než byla zvážena jiná, a pocit, že vysvětlení „sedí“, se snadno zamění za doklad jeho
pravdivosti.

## Mechanismus

Mechanismus inference lze rozložit na tři části: doklady, oprávnění a závěr (Toulmin, 1958). Každá z nich
může selhat zvlášť. Doklady mohou být nepravdivé nebo vybrané, oprávnění může být nepřiměřené, a závěr
může tvrdit víc, než doklady unesou. Walton, Reed a Macagno (2008) proto ke každému argumentačnímu schématu
uvádějí kritické otázky, které míří právě na tato místa, například zda je odborník skutečně odborníkem v
dané věci, nebo zda příčinná souvislost nemá jiné vysvětlení.

*Interpretace knihy*: z této struktury plyne, proč je inference cílem manipulace. Kdo chce změnit závěr,
nemusí lhát o závěru samém; stačí změnit, co platí za doklad, nebo nepozorovaně podsunout oprávnění, a
závěr pak plyne zdánlivě sám. Walton (2008) tento typ chyby popisuje jako argument, který je formálně
platný, ale stojí na premisách, jež by druhá strana při výslovném vyslovení nepřijala.

## Odlišení

| Odlišit od | Rozdíl |
| --- | --- |
| Implikace | logický vztah mezi výroky (jestliže A, pak B); inference je úkon, jímž se od jednoho k druhému přechází |
| Argument | veřejná podoba úsudku určená druhému; inference je krok úsudku sám, i když ho nikdo nevysloví |
| Inference modelu AI | v informatice spuštění natrénovaného modelu nad novými vstupy; s usuzováním sdílí jen název |
| [Kruhová argumentace](@/glossary/cirkularni-argumentace.md) | chybná inference, v níž závěr je skrytě obsažen v předpokladech |

Rozdíl mezi dedukcí, indukcí a abdukcí je rozdílem v síle, s níž závěr z dokladů plyne. Dedukce zaručuje
pravdivost závěru za pravdivosti předpokladů, indukce a abdukce ji činí jen pravděpodobnou nebo přijatelnou,
a proto u nich záleží na tom, zda byly zváženy jiné možnosti (Lipton, 2004).

## Význam pro Kompendium

V Kompendiu se pojem objevuje u technik, které zasahují samotný krok usuzování. [Inferenční
paralýza](@/kompendium/techniques/ea-5-1-16-inferencni-paralyza.md) podle knihy znemožňuje subjektu
dospět od dokladů k jakémukoli závěru, a [praní halucinací](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md)
popisuje, jak se výstup jazykového modelu bez ověření stane „faktem“, z něhož se dále usuzuje.
*Interpretace knihy*: v obou případech jde o útok na to, co platí za doklad a jaké oprávnění se k němu
připojuje, tedy na části inference, které popsal Toulmin (1958).

Pojem také vysvětluje, proč kniha klade důraz na alternativní vysvětlení. Inference k nejlepšímu vysvětlení
je podle Liptona (2004) spolehlivá jen tehdy, když byla zvážena skutečná škála možností, a manipulace často
spočívá v tom, že se nabídne jediné vysvětlení a ostatní se nepřipustí. *Interpretace knihy*: proto
Kompendium u diagnostických a vyšetřovacích kroků požaduje [diferenciální
diagnózu](@/glossary/diferencialni-diagnoza.md) a [předběžnou pitvu](@/glossary/predbezna-pitva.md).

## Obrana a zotavení

Obrana spočívá v tom, rozložit inferenci na její části a ptát se po každé zvlášť. Kritické otázky, které k
argumentačním schématům uvádějí Walton, Reed a Macagno (2008), slouží právě k tomu: oddělit doklad od závěru
a vyslovit oprávnění, které je spojuje, aby bylo možné ho posoudit.

Druhou obranou je záměrně hledat jiná vysvětlení téhož. Lipton (2004) zdůrazňuje, že nejlepší vysvětlení je
nejlepší jen ve srovnání s ostatními, a kde žádná jiná nebyla zvážena, je výběr prázdný. *Interpretace
knihy*: pro člověka, jehož schopnost usuzovat byla narušena, je užitečné vracet se k jednoduchým, dobře
ověřitelným krokům a ověřovat je s druhými, než znovu přejde ke složitým závěrům.

## Meze pojmu a kritika

Rozdělení na dedukci, indukci a abdukci není jediné možné a jeho hranice jsou sporné. Harman (1965) tvrdil,
že indukce je ve skutečnosti druhem inference k nejlepšímu vysvětlení, a Lipton (2004) uvádí, že kritici
naopak zpochybňují, zda „nejlepší“ vysvětlení vůbec svědčí o pravdivosti, nebo jen o tom, co se nám jako
vysvětlení líbí.

Druhou mezí je problém indukce, který Hume (1748) formuloval a který dosud nemá obecně přijímané řešení.
*Interpretace knihy*: Kompendium z něj nevyvozuje, že by usuzování bylo bezcenné, ale že každý závěr, který
přesahuje doklady, je třeba držet s mírou jistoty, jakou doklady opravňují.

## Literatura

- Harman, G. H. (1965). *The inference to the best explanation*. The Philosophical Review, 74(1).
- Hume, D. (1748). *An Enquiry Concerning Human Understanding*. London: A. Millar.
- Lipton, P. (2004). *Inference to the Best Explanation* (2nd ed.). London: Routledge.
- Peirce, C. S. (1934). *Collected Papers of Charles Sanders Peirce, Vol. 5: Pragmatism and Pragmaticism* (ed. C. Hartshorne & P. Weiss). Cambridge, MA: Harvard University Press.
- Toulmin, S. E. (1958). *The Uses of Argument*. Cambridge University Press.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2nd ed.). Cambridge University Press.
- Walton, D. N., Reed, C., & Macagno, F. (2008). *Argumentation Schemes*. Cambridge University Press.

## Související

**Glosář**

- [Toulminův model](@/glossary/toulmin-model.md) – struktura údajů, oprávnění a tvrzení v každé inferenci.
- [Kruhová argumentace](@/glossary/cirkularni-argumentace.md) – chybná inference, jejíž závěr je skryt v předpokladech.
- [Evidence-based](@/glossary/evidence-based.md) – práce s doklady jako s podkladem závěru.
- [Modální logika](@/glossary/modalni-logika.md) – logika nutnosti a možnosti, v níž se dedukce rozšiřuje.
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – sklon hledat jen doklady pro přijatý závěr.

**Kompendium**

- [EA-5.1.16 Inferenční paralýza](@/kompendium/techniques/ea-5-1-16-inferencni-paralyza.md) – narušení kroku od dokladů k závěru.
- [EA-9.1.1 Praní halucinací](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) – výstup modelu, který se stane „faktem“.
- [Detekce obsahu generovaného AI](@/kompendium/self-defense-guides/40-ai-content-detection.md) – obrana jednotlivce.
