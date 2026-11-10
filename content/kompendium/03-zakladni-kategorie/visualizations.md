+++
title = "Vizualizace pro sekci 03 – postup technik EA-1 fázemi"
description = "Interaktivní graf sekce 03: třináct technik EA-1 rozmístěných podle fáze manipulačního cyklu a typické závažnosti, s vazbami jejich společného výskytu a body pro zásah."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "chartjs", "ea-1", "akademicka-manipulace"]
categories = ["academic", "tools"]

[extra]
related_terms = ["somaticke-vektory", "tom-exploitation", "scenar-h"]
parent = "kompendium-03-zakladni-kategorie"
section_icon = "📊"
toc = false
+++

# Postup technik EA-1 pěti fázemi

Tato vizualizace patří k [sekci 03](@/kompendium/03-zakladni-kategorie/_index.md) a ukazuje, jak se [třináct technik akademické manipulace EA-1](@/kompendium/03-zakladni-kategorie/kapitola-1.md) typicky řadí v čase. Neslouží k tomu, aby předvedla, jak manipulace „postupuje“, ale k tomu, aby pozorovatel poznal, v jaké fázi se vzorec nachází a kde je zásah nejúčinnější.

<canvas id="section-03-progression" width="800" height="500"></canvas>
<div id="progression-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
{{ <viz_script name="section-03-progression" /> }}

## Co graf zobrazuje

Vodorovná osa představuje pět fází typického cyklu, svislá osa typickou závažnost techniky na stupnici 1–5. Fáze **etablování** odpovídá období, kdy se buduje důvěra a autorita a vytváří se rámec, v němž se další sdělení budou vykládat. Ve fázi **exploitace** se techniky uplatňují přímo na úsudek člověka, ve fázi **konsolidace** se získaný vliv upevňuje tak, aby odolal námitkám, a ve fázi **eskalace** přechází vzorec k závažnějším formám, které už mění samotná kritéria poznání. Pátý sloupec, **intervence**, neobsahuje žádnou techniku: označuje místo, kde má podle modelu detekce a neutralizace nejvyšší účinnost, a připomíná, že zasáhnout lze v kterékoli fázi.

Pětifázové členění je didaktickým zjednodušením. Opírá se o pozorování, že nátlakové prostředí se zpravidla nevytváří jedním krokem, ale postupným skládáním drobných projevů, které teprve v souhrnu tvoří systém (Stark 2007), a o starší popisy myšlenkové reformy, v nichž po fázi navazování vztahu a otřesu dosavadní identity následuje upevnění nového výkladu světa (Lifton 1961). Model z těchto prací nepřebírá konkrétní stadia; přebírá jen myšlenku, že vzorec má časovou strukturu, a proto se dá zachytit dřív, než se uzavře.

## Techniky v grafu

| Kód | Technika | Fáze | Závažnost |
|-----|----------|------|-----------|
| EA-1.1.1 | [Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) | etablování | 2 |
| EA-1.1.2 | [Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) | exploitace | 3 |
| EA-1.1.3 | [Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) | etablování | 2 |
| EA-1.1.4 | Predikační rozpadání (popis v [kapitole 3.1](@/kompendium/03-zakladni-kategorie/kapitola-1.md)) | konsolidace | 3 |
| EA-1.2.1 | [Falešné dilema](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) | exploitace | 3 |
| EA-1.2.2 | [Falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md) | exploitace | 2 |
| EA-1.2.3 | [Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) | konsolidace | 3 |
| EA-1.3.1 | [Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) | konsolidace | 4 |
| EA-1.3.2 | [Strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) | eskalace | 4 |
| EA-1.3.3 | [Tematická diverze](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) | exploitace | 2 |
| EA-1.4.1 | [Prosodická dominance](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md) | etablování | 2 |
| EA-1.4.2 | [Latentní emocionální modulace](@/kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md) | exploitace | 3 |
| EA-1.5.1 | [Strategická proxemika](@/kompendium/techniques/ea-1-5-1-strategicka-proxemika.md) | etablování | 1 |

Rozložení samo o sobě něco vypovídá. Techniky fáze etablování mají nízkou závažnost: jednotlivě vypadají jako běžné rysy komunikace – výběr témat, odborný jazyk, hlas a postoj v místnosti. Právě proto se přehlížejí. Nejvyšší závažnost mají techniky konsolidace a eskalace, které už nepůsobí na jednotlivé úsudky, ale na pravidla, podle nichž se úsudky tvoří: imunizace proti falsifikaci zabezpečí výklad proti námitkám, strategická reinterpretace mění kritéria pravdy. Popperovské rozlišení mezi tvrzením, které lze vyvrátit, a tvrzením, které se vyvrácení vyhýbá (Popper 1959), tu odpovídá přechodu od ovlivňování obsahu k ovlivňování podmínek poznání.

## Jak číst graf

Klepnutím na bod se zobrazí název techniky, její fáze, typická závažnost a seznam technik, s nimiž se podle modelu často vyskytuje společně. Barva kóduje fázi: modrá etablování, fialová exploitaci, oranžová konsolidaci, červená eskalaci a zelená intervenci. Šedé čáry spojují techniky, které se typicky objevují v téže fázi nebo při přechodu mezi sousedními fázemi – například selektivní expozici s terminologickou mystifikací, informační přetížení s falešným dilematem, nebo imunizaci proti falsifikaci se strategickou reinterpretací.

Vazby společného výskytu mají obranný význam. Kdo pozná jednu techniku, má podle grafu vědět, které další hledat. Pozorovatel, který zaznamená zahlcení informacemi, se tak může zeptat, zda se člověku zároveň nenabízejí jen dvě předem zvolené možnosti; kdo pozná imunizaci výkladu proti námitkám, má zpozornět, zda se nemění i kritéria, podle nichž se o pravdě rozhoduje.

## Jak s vizualizací pracovat

Ve výuce slouží graf jako mapa, na níž si studenti po přečtení [kapitoly 3.1](@/kompendium/03-zakladni-kategorie/kapitola-1.md) ověří, zda chápou vztahy mezi technikami; [kapitola 3.3](@/kompendium/03-zakladni-kategorie/kapitola-3.md) popisuje, jak takovou výuku vést, aby posilovala obranu, a ne zvědavost po technice. V supervizi může pomoci při rozboru případu: kde se vzorec u klienta nacházel, kdy byl poprvé rozpoznatelný a co tehdy chybělo k zásahu. Pro čtenáře, který si všímá podobného vzorce ve vlastním okolí, je graf připomínkou, že časné, nenápadné fáze jsou nejvhodnější chvílí k ověření u někoho zvenčí.

Obecný příklad (kompozit): supervizní skupina rozebírá případ doktorandky, která po dvou letech pod vedením jednoho školitele přestala věřit vlastním výsledkům. Při zpětném čtení záznamů skupina na grafu postupně umístí, co se dělo. V prvních měsících šlo o výběr literatury, kterou smí číst, a o zvláštní, nevysvětlovaný slovník (etablování). Později přišly porady, na nichž dostávala víc podkladů, než stihla zpracovat, a volbu mezi dvěma nepřijatelnými možnostmi (exploitace). Nakonec každá její námitka byla vykládána jako doklad nezralosti (konsolidace) a měřítka kvality se měnila podle toho, co právě odevzdala (eskalace). Skupina dojde k závěru, že první dobře rozpoznatelný okamžik nastal už ve fázi etablování, kdy si doktorandka stěžovala kolegům na nepochopitelný jazyk vedení – a že tehdy chyběl někdo, kdo by její pozorování vzal vážně. Podobné případy z akademického prostředí rozebírají anonymizované studie [6.7](@/kompendium/06-klinicke-aplikace/pripad-akademie.md) a [6.8](@/kompendium/06-klinicke-aplikace/pripad-doktorat.md).

Grafické zpracování se drží zásady, že každý vizuální prvek má nést informaci, ne ozdobu (Tufte 1983). Barvy proto kódují fáze a nic jiného, a velikost bodů je pro všechny techniky stejná, aby nesugerovala rozdíly, které model neobsahuje.

## Status modelu a meze

Umístění technik a vazby mezi nimi jsou **ilustrativním modelem** autora, ne výsledkem empirického měření. Stupnice závažnosti vyjadřuje typický dopad techniky v izolaci; v konkrétním případě může drobná technika působit velmi závažně, pokud zasáhne člověka v krizi nebo v závislém postavení. Alberto Cairo připomíná, že vizualizace má nést i míru nejistoty svých dat, jinak působí přesněji, než je (Cairo 2016); tato stránka to činí slovy, protože graf sám nejistotu nezobrazuje.

Model má i obsahové meze. Neukazuje techniky jiných skupin (EA-2 a dalších), které se s EA-1 v praxi mísí, a neukazuje ochranné faktory, které postup vzorce zpomalují nebo zastavují – vztahy mimo dané prostředí, nezávislé zdroje informací, odbornou pomoc. Zotavení po zásahu popisuje sekce [06. Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md) a její [vizualizace klinické cesty](@/kompendium/06-klinicke-aplikace/visualizations.md); ta navazuje na Hermanové popis zotavení jako postupu od bezpečí přes zpracování ke znovunavázání vztahů (Herman 1992).

Otevřenou otázkou zůstává, zda by šlo model ověřit. Vyžadovalo by to soubor dobře zdokumentovaných, nezávisle posouzených případů, v nichž by se dalo zpětně určit pořadí technik. Dokud takový soubor neexistuje, je graf nástrojem k přemýšlení a k rozhovoru, nikoli diagnostickou pomůckou.

## Literatura

- Cairo, A. (2016). *The Truthful Art: Data, Charts, and Maps for Communication*. New Riders.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Lifton, R. J. (1961). *[Thought Reform](@/glossary/thought-reform.md) and the Psychology of Totalism*. W. W. Norton.
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. Hutchinson.
- Stark, E. (2007). *[Coercive Control](@/glossary/coercive-control.md): How Men Entrap Women in Personal Life*. Oxford University Press.
- Tufte, E. R. (1983). *The Visual Display of Quantitative Information*. Graphics Press.

## Související

**Kapitoly sekce 03**

- [3.1 Akademické techniky (EA-1.1 až EA-1.5)](@/kompendium/03-zakladni-kategorie/kapitola-1.md) – plný popis technik z grafu.
- [3.2 Scénáře epistemické delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md) – techniky v delším časovém průběhu.
- [3.3 Pokročilá edukativní implementace](@/kompendium/03-zakladni-kategorie/kapitola-3.md) – jak s grafem pracovat ve výuce.

**Další vizualizace**

- [Vizualizace sekce 04 – rozhodovací strom](@/kompendium/04-terminalni-protokoly/visualizations.md) – co dělat, když vzorec přejde v terminální protokol.
- [Vizualizace sekce 06 – klinická cesta zotavení](@/kompendium/06-klinicke-aplikace/visualizations.md) – navazující péče.
- [Globální vizualizace EA taxonomie](@/kompendium/visualizations/_index.md) – přehled celé taxonomie.

**Glosář**

- [Taxonomie EA](@/glossary/taxonomie-ea.md) – systém kódů.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – základní pojem knihy.

---

## Kontakt a příspěvky

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glosář](@/glossary/_index.md) | [Filozofie](@/philosophy/_index.md) | [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/)
