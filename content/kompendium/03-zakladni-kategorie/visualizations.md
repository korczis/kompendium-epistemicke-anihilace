+++
title = "Vizualizace pro sekci 03 – techniky EA-1 podle podrodiny a rizika"
description = "Interaktivní graf sekce 03: stránky technik rodiny EA-1 rozložené podle podrodiny a úrovně rizika z katalogu, spojené vazbami podle odkazů v knize."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "chartjs", "ea-1", "akademicka-manipulace"]
categories = ["academic", "tools"]

[extra]
related_terms = ["somaticke-vektory", "tom-exploitation", "scenar-h"]
section_icon = "📊"
toc = false
+++

# Techniky rodiny EA-1 podle podrodiny a úrovně rizika

Tato vizualizace patří k [sekci 03](@/kompendium/03-zakladni-kategorie/_index.md) a zobrazuje stránky technik rodiny EA-1, tedy [akademických technik](@/kompendium/03-zakladni-kategorie/kapitola-1.md), které kniha popisuje jako narušení běžných procesů poznávání – toho, jak člověk získává informace, jak je hodnotí, jak reviduje vlastní přesvědčení a jak ho ovlivňuje hlas, postoj a prostor. Graf není mapou toho, jak manipulace „postupuje“. Je to přehled vztahů mezi stránkami knihy, který má pozorovateli usnadnit, aby od jedné rozpoznané techniky došel k dalším, o nichž kniha píše v souvislosti s ní, a k jejich obraně. Vše, co graf ukazuje, je odvozeno z odkazů a katalogu knihy.

<canvas id="section-03-progression" width="800" height="500"></canvas>
<div id="progression-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="section-03-progression" /> }}

## Co graf zobrazuje

Každý **bod** je jedna stránka techniky z [katalogu technik](@/kompendium/techniques/_index.md), jejíž kód patří do rodiny EA-1. Rodinu určuje kód uvedený v textu nad grafem; kódy a názvy technik se čtou z cest a nadpisů stránek v grafu odkazů knihy, nikoli z ručně psaného seznamu. Když kniha přidá novou stránku techniky nebo nějakou přejmenuje, graf se při příštím sestavení webu změní sám. Kódová soustava, z níž rodiny a podrodiny vycházejí, je popsána v hesle [Taxonomie EA](@/glossary/taxonomie-ea.md) a v [rejstříku technik](@/kompendium/08-prilohy/rejstrik-technik.md).

**Vodorovná osa** řadí body podle podrodiny, tedy podle druhého čísla kódu (EA-1.1, EA-1.2 …). Název podrodiny, který se zobrazí v legendě a v okně detailu, přebírá graf z katalogu technik: použije ten název, který u stránek dané podrodiny převažuje. **Svislá osa** nese úroveň rizika, kterou stránce přiřazuje katalog technik, v pořadí jeho legendy od nižších úrovní k vyšším; stránka bez uvedené úrovně se zařadí jako „neuvedeno“. Barva bodu kóduje podrodinu a nic jiného. Jacques Bertin ukázal, že poloha v rovině je nejsilnější vizuální proměnnou a barevný tón se hodí pro rozlišení kategorií, nikoli pro vyjádření pořadí (Bertin 1967); graf se tím řídí – pořadí rizika nese poloha, rozdíl mezi podrodinami tón.

**Šedé čáry** spojují dvě techniky, mezi jejichž stránkami vede v knize odkaz, ať jedním, nebo oběma směry. Čára tedy neříká, že se techniky v praxi vyskytují společně, ani že jedna vede k druhé; říká jen, že autor při popisu jedné z nich považoval za potřebné odkázat na druhou. Takový odkaz obvykle znamená pojmovou příbuznost, společný výskyt popsaný v textu nebo podobnou obranu, ale může vyjadřovat i pouhý redakční zvyk. Název grafu vypisuje počet stránek a vazeb tak, jak je spočte skript z aktuálních dat.

## Jak graf číst

Klepnutí na bod zobrazí v okně pod grafem kód a název techniky, její podrodinu, úroveň rizika podle katalogu a seznam technik téže rodiny, na které je napojena; každá položka seznamu vede na svou stránku a poslední odkaz otevře stránku vybrané techniky. Vybraný bod se zvětší, jeho sousedé zůstanou výrazní a ostatní body se zmenší. Tento postup odpovídá Shneidermanově zásadě „nejdřív přehled, potom přiblížení a filtr, podrobnosti na vyžádání“ (Shneiderman 1996): celek je vidět najednou, detail se objeví až tehdy, když o něj čtenář požádá.

Body ve stejné buňce – tedy techniky téže podrodiny se stejnou úrovní rizika – jsou mírně rozestoupeny, aby se nepřekrývaly. Na přesné poloze uvnitř buňky nezáleží; informaci nese jen to, ve které buňce bod leží. Pokud v knize existuje k jednomu kódu víc stránek (například plná stránka a starší krátký záznam), objeví se jako samostatné body se stejným kódem. Kdo chce vědět, která je hlavní, rozhodne podle názvu a obsahu stránky, ne podle grafu.

Rozložení bodů lze opatrně číst i obsahově. Stránky, které katalog řadí k vyšším úrovním rizika, se v rodině EA-1 typicky týkají technik, jež už nepůsobí na jednotlivý úsudek, ale na pravidla, podle nichž se úsudky tvoří: [imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) zabezpečuje výklad proti námitkám a [strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) mění kritéria, podle nichž se o pravdě rozhoduje. Popperovské rozlišení mezi tvrzením, které se dá vyvrátit, a tvrzením, které se vyvrácení soustavně vyhýbá (Popper 1959), tu odpovídá přechodu od ovlivňování obsahu k ovlivňování podmínek poznání. Naopak techniky jako [selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) nebo [prosodická dominance](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md) vypadají jednotlivě jako běžné rysy komunikace – výběr témat, hlas, postoj v místnosti – a právě proto se přehlížejí. Úroveň rizika je však vlastností katalogového záznamu, ne naměřenou závažností.

## Odkud graf bere data

Graf nemá vlastní data. Při sestavení webu vzniká graf odkazů knihy (`static/data/graph.json`), v němž je každá stránka uzlem a každý odkaz mezi stránkami hranou; skript z něj vybere stránky technik rodiny EA-1 a hrany mezi nimi. Podrodiny a úrovně rizika čte z katalogu technik, který šablona vkládá do stránky katalogu ze záhlaví jednotlivých stránek technik. Nic z toho, co graf zobrazí, se nepíše na tuto stránku ručně, a proto zde nejsou uvedeny ani počty technik, ani jejich seznam: ty by zastaraly s první úpravou katalogu. Tamara Munznerová doporučuje u každé vizualizace oddělit otázku, jaká data zobrazuje, od otázky, jak je kóduje (Munzner 2014); tento oddíl odpovídá na první otázku, předchozí oddíly na druhou.

Z toho plyne i důležité omezení: graf je jen tak úplný, jak úplné jsou odkazy v knize. Technika, na kterou zatím žádná jiná stránka rodiny neodkazuje, se v grafu objeví bez čar, i když s ostatními věcně souvisí. Chybějící čára proto neznamená nesouvislost; znamená jen, že ji text zatím nevyslovil.

## Jak s grafem pracovat

Ve výuce slouží graf jako mapa, na níž si studenti po přečtení [kapitoly 3.1](@/kompendium/03-zakladni-kategorie/kapitola-1.md) ověří, zda chápou, jak se jednotlivé techniky k sobě vztahují a proč je katalog řadí k různým úrovním rizika; [kapitola 3.3](@/kompendium/03-zakladni-kategorie/kapitola-3.md) popisuje, jak takovou výuku vést, aby posilovala rozpoznání a obranu, a ne zvědavost po technice. V supervizi může graf pomoci tím, že od techniky, kterou klinik u klienta rozpoznal, vede k technikám, o nichž kniha v téže souvislosti píše: na jejich stránkách najde detekční znaky, podle nichž se může ptát dál.

Obecný příklad (kompozit): supervizní skupina rozebírá případ doktorandky, která po letech pod vedením jednoho školitele přestala věřit vlastním výsledkům. Skupina nejprve rozpozná [informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) – porady, na nichž dostávala víc podkladů, než mohla zpracovat. V grafu klepne na příslušný bod a projde techniky, na něž stránka odkazuje; u každé si přečte detekční znaky a zjišťuje, zda je v záznamech případu najde. Tak dojde k [falešnému dilematu](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) – nabídce dvou předem zvolených a stejně nepřijatelných možností – a ke vzorci, v němž byla každá námitka vykládána jako doklad nezralosti. Graf skupině nic nedokazuje; pomáhá jí jen klást otázky, které by jinak nepoložila. Podobné případy z akademického prostředí rozebírají anonymizované studie [6.7](@/kompendium/06-klinicke-aplikace/pripad-akademie.md) a [6.8](@/kompendium/06-klinicke-aplikace/pripad-doktorat.md).

Graf nemá sloužit ke „skórování“ člověka ani prostředí. To, že u někoho rozpoznáme několik technik z vyšších pater osy rizika, ještě neznamená, že prožívá závažnější újmu než člověk, u něhož vidíme jedinou techniku nízké úrovně: drobná technika může působit velmi silně na člověka v krizi nebo v závislém postavení. Posouzení dopadu patří do klinického rozhovoru, který popisuje sekce [06. Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md).

## Co graf ukázat nemůže

Starší verze této stránky slibovala pět fází manipulačního cyklu a číselnou závažnost každé techniky. Kniha žádná taková data neobsahuje, a proto je graf neukazuje. Časovou strukturu nátlakového prostředí – to, že se zpravidla nevytváří jedním krokem, ale skládáním drobných projevů, které teprve v souhrnu tvoří systém (Stark 2007), a že popisy myšlenkové reformy rozlišují postupné kroky od navázání vztahu po upevnění nového výkladu světa (Lifton 1961) – rozebírá [kapitola 3.2](@/kompendium/03-zakladni-kategorie/kapitola-2.md) o scénářích [delegitimizace](@/glossary/delegitimizace.md). Graf ji nezobrazuje, protože pořadí technik v čase z odkazů knihy odvodit nelze.

Edward Tufte požaduje, aby každý vizuální prvek nesl informaci, ne ozdobu, a aby grafické zpracování nevyvolávalo dojem přesnosti, kterou data nemají (Tufte 1983). Alberto Cairo k tomu dodává, že poctivá vizualizace má sdělit i míru nejistoty svých dat (Cairo 2016). Tato stránka to činí slovy: graf je ilustrativní orientační pomůcka nad strukturou knihy, nikoli klinická data, empirické měření ani diagnostický nástroj. Neukazuje techniky jiných rodin, které se s EA-1 v praxi mísí (jejich přehled podávají [globální vizualizace](@/kompendium/visualizations/_index.md)), a neukazuje ochranné faktory – vztahy mimo dané prostředí, nezávislé zdroje informací, odbornou pomoc –, které vzorec zpomalují nebo zastavují.

Otevřenou otázkou zůstává, zda by šlo vazby mezi technikami ověřit nezávisle na textu knihy, například na souboru dobře zdokumentovaných a nezávisle posouzených případů. Dokud takový soubor neexistuje, je graf nástrojem k přemýšlení a k rozhovoru.

## Literatura

- Bertin, J. (1967). *Sémiologie graphique: Les diagrammes, les réseaux, les cartes*. Paris: Gauthier-Villars.
- Cairo, A. (2016). *The Truthful Art: Data, Charts, and Maps for Communication*. New Riders.
- Lifton, R. J. (1961). *[Thought Reform](@/glossary/thought-reform.md) and the Psychology of Totalism*. W. W. Norton.
- Munzner, T. (2014). *Visualization Analysis and Design*. CRC Press.
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. Hutchinson.
- Shneiderman, B. (1996). The eyes have it: A task by data type taxonomy for information visualizations. In *Proceedings of the IEEE Symposium on Visual Languages*, 336–343.
- Stark, E. (2007). *[Coercive Control](@/glossary/coercive-control.md): How Men Entrap Women in Personal Life*. Oxford University Press.
- Tufte, E. R. (1983). *The Visual Display of Quantitative Information*. Graphics Press.

## Související

**Kapitoly sekce 03**

- [3.1 Akademické techniky](@/kompendium/03-zakladni-kategorie/kapitola-1.md) – plný popis technik, jejichž stránky graf zobrazuje.
- [3.2 Scénáře epistemické delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md) – časový průběh, který graf neukazuje.
- [3.3 Pokročilá edukativní implementace](@/kompendium/03-zakladni-kategorie/kapitola-3.md) – jak s grafem pracovat ve výuce.

**Techniky a katalog**

- [Katalog technik](@/kompendium/techniques/_index.md) – zdroj podrodin a úrovní rizika.
- [Kompletní rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) – všechny kódy na jednom místě.

**Další vizualizace**

- [Vizualizace sekce 04](@/kompendium/04-terminalni-protokoly/visualizations.md) – strom odkazů terminálních protokolů.
- [Vizualizace sekce 06](@/kompendium/06-klinicke-aplikace/visualizations.md) – klinická cesta zotavení.
- [Globální vizualizace](@/kompendium/visualizations/_index.md) – přehled celé taxonomie.

**Glosář**

- [Taxonomie EA](@/glossary/taxonomie-ea.md) – systém kódů, z něhož graf čte rodiny a podrodiny.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – základní pojem knihy.
