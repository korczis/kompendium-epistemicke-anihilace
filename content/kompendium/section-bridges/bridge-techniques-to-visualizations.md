+++
title = "Most: Techniky → Vizualizace"
description = "Jak technika z podrobné stránky vypadá v síti vztahů, fázích cyklu a rozložení taxonomie: které vizualizace k čemu slouží, jak je číst a proč nejsou empirickými daty."
weight = 31

[taxonomies]
tags = ["kompendium", "section-bridge", "navigace", "techniques", "interactive"]
categories = ["academic", "reference"]

[extra]
related_terms = ["bridge-visualizations-to-techniques", "bridge-visualizations-to-clinical", "bridge-techniques-to-quick-reference", "bridge-techniques-to-glossary"]
parent = "kompendium-section-bridges"
toc = false
+++

# Most: Techniky → Vizualizace

> **Z:** [Techniky – podrobné stránky](@/kompendium/techniques/_index.md) → **Do:** [Interaktivní vizualizace](@/kompendium/visualizations/_index.md)
> **Druh mostu:** od jedné techniky k jejímu místu v celku taxonomie.

Stránka techniky je pohled zblízka: jedna technika, její mechanismus, znaky a obrana. Vizualizace jsou pohled z odstupu: rozložení technik napříč kategoriemi, jejich vzájemné vazby, fáze manipulačního cyklu, v nichž se objevují, a cesty rozhodování o zásahu. Přechod od techniky k vizualizaci odpovídá na otázku, kterou stránka sama dobře nezodpoví: *s čím technika souvisí a kde v celku leží?* Tento most popisuje, které vizualizace jsou pro čtenáře stránky techniky užitečné, jak je číst a co z nich vyvozovat nelze.

## Co pokrývají stránky technik

[Stránky technik](@/kompendium/techniques/_index.md) sdílejí šablonu, v níž je pro tento most nejdůležitější část o vztahu k jiným technikám: konjunkce (techniky, které se objevují společně), eskalační řetězce (techniky, které na sebe navazují) a alternativy (techniky se stejným účelem a jiným provedením). Tyto vztahy jsou na stránce popsány slovy a odkazy; vizualizace je ukazují jako strukturu.

## Co pokrývají vizualizace

[Přehled vizualizací](@/kompendium/visualizations/_index.md) obsahuje interaktivní grafy a simulace. Pro práci s technikami jsou nejdůležitější **rozložení technik napříč kategoriemi**, **matice kategorií a závažnosti**, **2D síť technik** se zvýrazněním sousedů, **3D graf vztahů** reprezentativních technik a **simulace informačního přetížení** a **rekurzivní spirály myšlení**, které názorně ukazují dynamiku dvou konkrétních technik. Oddíly mají vlastní vizualizace: [vizualizace oddílu 03](@/kompendium/03-zakladni-kategorie/visualizations.md) rozmísťuje třináct technik EA-1 podle fáze manipulačního cyklu a typické závažnosti, [rozhodovací strom oddílu 04](@/kompendium/04-terminalni-protokoly/visualizations.md) ukazuje cestu od detekce k typu zásahu. Doplňkem je [konceptuální mapa](@/kompendium/konceptualni-mapa/_index.md), která místo technik zobrazuje pojmy.

## Proč přecházet od techniky k vizualizaci

Prvním důvodem je **kontext**. Technika čtená samostatně působí jako uzavřený jev. Vizualizace ukazuje, že je uzlem v síti: má sousedy, s nimiž se objevuje, a následníky, k nimž vede. Síťové myšlení, jak je rozpracovala věda o sítích (Barabási 2016), upozorňuje, že význam uzlu často neurčují jeho vlastnosti, ale jeho vazby – uzel s mnoha vazbami může být důležitější než uzel s výrazným obsahem. Pro posuzovatele to znamená, že technika s mnoha sousedy je dobrým „vstupním bodem“: kde se objeví, stojí za to prověřit i její okolí.

Druhým důvodem je **fáze**. Vizualizace oddílu 03 ukazuje, ve které fázi manipulačního cyklu se technika typicky vyskytuje – zda spíše na začátku, kdy se vytváří vztah a důvěra, nebo později, kdy se upevňuje kontrola. To je informace, kterou stránka techniky uvádí roztroušeně, a vizualizace ji zpřehledňuje. Larkin a Simon (1987) vysvětlili, proč diagram někdy nahradí dlouhý text: umisťuje související informace vedle sebe, takže je čtenář nemusí hledat a držet v paměti.

Třetím důvodem je **názornost dynamiky**. Některé techniky je obtížné popsat staticky. Simulace informačního přetížení dovoluje čtenáři zažít, jak s rostoucím tempem informací uniká většina obsahu; simulace rekurzivní spirály ukazuje, jak se s hloubkou sebereflexe fragmentují dráhy myšlení. Takový zážitek je užitečný ve výuce, protože z abstraktního popisu dělá srozumitelnou zkušenost – za předpokladu, že je doplněn výkladem a nepůsobí jako „zábava“.

## Konkrétní cesty: technika → vizualizace

| Technika | Vizualizace | Co přechod přidává |
|---|---|---|
| [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) | Simulace narušení pozornosti v [přehledu vizualizací](@/kompendium/visualizations/_index.md) | Zážitek ztráty informací při rostoucím tempu. |
| [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) | [Vizualizace oddílu 03](@/kompendium/03-zakladni-kategorie/visualizations.md) | Fáze cyklu a společný výskyt s dalšími technikami EA-1. |
| [EA-5.1.13 Hyperreflexivita](@/kompendium/techniques/ea-5-1-13-hyperreflexivita.md) | Rekurzivní spirála myšlení | Názorná dynamika smyčky. |
| [EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) | 2D síť technik | Sousedé techniky a eskalační řetězce. |
| Terminální sekvence EA-4 | [Rozhodovací strom oddílu 04](@/kompendium/04-terminalni-protokoly/visualizations.md) | Od detekce k typu zásahu. |
| Pojmy za technikami | [Konceptuální mapa](@/kompendium/konceptualni-mapa/_index.md) | Pojmová síť místo sítě technik. |

## Jak vizualizace číst

Vizualizace v knize mají dvojí povahu a čtenář je musí rozlišovat. **Strukturní vizualizace** – sítě, stromy, rozložení technik podle kategorií – zobrazují stavbu taxonomie: kolik technik je v které kategorii, které jsou spolu propojeny vazbami v textu, jak je uspořádán rozhodovací postup. Jsou tak spolehlivé, jak spolehlivá je taxonomie sama. **Ilustrativní vizualizace** – simulace a grafy s průběhy v čase nebo s mírou závažnosti – ukazují modelové chování, nikoli naměřená data. Matice závažnosti nebo průběhy v čase nejsou výsledkem epidemiologických studií, ale znázorněním toho, jak kniha jevy chápe.

Toto rozlišení je zásadní, protože grafy vyvolávají dojem přesnosti. Tufte (1983) upozornil, že grafické zobrazení může zkreslit vnímání dat, pokud jeho vizuální prvky neodpovídají skutečným veličinám, a Cleveland a McGill (1984) ukázali, že lidé odhadují různé vizuální kódování – délku, plochu, barvu – s velmi rozdílnou přesností. Bublina v matici závažnosti tedy nemá být čtena jako měření. Kdo z vizualizace cituje do posudku nebo článku, musí uvést, že jde o model knihy.

Pro čtenáře stránky techniky z toho plyne jednoduchý postup. Nejprve na stránce zjistí, s jakými technikami je jeho technika podle textu spojena. Potom ve vizualizaci ověří, zda síť tyto vazby ukazuje, a všimne si sousedů, které na stránce nepostřehl. Nakonec se ke každému novému sousedovi vrátí na jeho vlastní stránku a zjistí, jakou povahu vazba má – zda jde o společný výskyt, eskalaci, nebo alternativu. Vizualizace tak slouží jako rejstřík vazeb, jehož každá položka se ověřuje v textu.

## Příklad průchodu mostem

Lektorka připravuje workshop pro moderátory online komunit o technikách, které se objevují v koordinovaných útocích. Začala stránkou [koordinace mobu](@/kompendium/techniques/ea-2-3-4-mob-coordination.md), ale chce účastníkům ukázat, že útoky nejsou jedna technika, ale balíček.

Otevře 2D síť technik a klikne na uzel koordinace mobu; síť zvýrazní sousedy – [vytržení klipu](@/kompendium/techniques/ea-2-3-1-clip-takeout.md), [kolaps kontextu](@/kompendium/techniques/ea-2-3-2-context-collapse.md), [pseudokontroverzi](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md). Tento obrázek použije jako úvod: moderátoři vidí, že když se objeví jedna z technik, mají hledat i ostatní. Pak se s nimi vrátí ke stránkám jednotlivých technik a k detekčním signaturám [koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md) a [platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md). Výslovně upozorní, že síť ukazuje vazby v textu knihy, ne četnost výskytu v reálných útocích. Workshop zakončí [vzdělávacím scénářem rozpoznání mediálního mobu](@/kompendium/educational-scenarios/14-media-mob-recognition.md).

## Časté omyly

Prvním omylem je **číst ilustrativní vizualizace jako data**. Průběhy, prevalence a matice závažnosti jsou modelové; nejsou výsledkem měření a nemají se jako měření citovat.

Druhým omylem je **odvozovat důležitost techniky z velikosti nebo polohy uzlu**. Rozložení sítě je často dáno algoritmem rozmístění, nikoli významem; důležitost se posuzuje podle obsahu a vazeb, ne podle místa na obrazovce.

Třetím omylem je **zůstat u vizualizace**. Vizualizace je vstupní branou; porozumění technice dává stránka, ne uzel s popiskem.

Čtvrtým omylem je **používat simulace jako zábavu**. Simulace mohou být působivé, ale ve výuce mají sloužit k porozumění; u lidí s vlastní zkušeností mohou vyvolat nepříjemné reakce, a proto se používají s výkladem.

## Meze a otevřené otázky

Vizualizace pokrývají jen část technik – sítě obsahují reprezentativní výběr, ne celou taxonomii. Vazby v sítích jsou odvozeny z textu knihy, a jejich úplnost tedy závisí na tom, jak důsledně jsou vztahy na stránkách technik popsány. Otevřenou otázkou je, zda by ilustrativní vizualizace neměly nést výraznější označení modelové povahy přímo v grafu; kniha to zatím uvádí v textu.

## Literatura

- Barabási, A.-L. (2016). *Network Science*. Cambridge: Cambridge University Press.
- Cleveland, W. S., & McGill, R. (1984). Graphical perception: Theory, experimentation, and application to the development of graphical methods. *Journal of the American Statistical Association*, 79(387), 531–554.
- Larkin, J. H., & Simon, H. A. (1987). Why a diagram is (sometimes) worth ten thousand words. *Cognitive Science*, 11(1), 65–100.
- Tufte, E. R. (1983). *The Visual Display of Quantitative Information*. Cheshire, CT: Graphics Press.

## Související

**Vrstvy**

- [Techniky](@/kompendium/techniques/_index.md) – výchozí vrstva.
- [Interaktivní vizualizace](@/kompendium/visualizations/_index.md) – cílová vrstva.
- [Konceptuální mapa](@/kompendium/konceptualni-mapa/_index.md) – pojmová síť.

**Vizualizace oddílů**

- [Vizualizace oddílu 03](@/kompendium/03-zakladni-kategorie/visualizations.md) – techniky EA-1 podle fáze cyklu.
- [Rozhodovací strom oddílu 04](@/kompendium/04-terminalni-protokoly/visualizations.md) – od detekce k zásahu.

**Sousední mosty**

- [Most: Vizualizace → Techniky](@/kompendium/section-bridges/bridge-visualizations-to-techniques.md) – opačný směr.
- [Most: Vizualizace → Klinika](@/kompendium/section-bridges/bridge-visualizations-to-clinical.md) – vizualizace v klinické práci.
- [Most: Techniky → Rychlé karty](@/kompendium/section-bridges/bridge-techniques-to-quick-reference.md) – zkrácená podoba techniky.
