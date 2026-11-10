+++
title = "Rejstřík technik"
description = "Tabulkový rejstřík kódů EA-X.Y.Z s názvy, krátkým zaměřením a odkazy na články technik ve všech obsazených kapitolách taxonomie EA-1 až EA-9."
weight = 2
sort_by = "weight"

[taxonomies]
tags = ["kompendium", "prilohy", "rejstrik", "ea-taxonomy", "technique"]

[extra]
category = "priloha"
related_terms = ["index-pojmu", "klasifikace", "zkratky", "eticky-kodex", "dual-use"]
kompendium = ["08-prilohy"]
prilohy = ["rejstrik", "master-index", "techniky"]
section_icon = "📋"
toc = true
insert_anchor_links = "right"
parent = "kompendium-08-prilohy"
access_level = "L1-L4"
status = "complete"
date_modified = "2026-11-10"
+++

## Účel a konstrukce rejstříku

Rejstřík technik je navigační příloha, která každé technice taxonomie epistemické anihilace
přiřazuje kód, kanonický název a odkaz na článek v [podknihovně technik](@/kompendium/techniques/_index.md).
Klasifikace přitom není neutrálním zrcadlem skutečnosti: Bowker a Starová ukázali, že každý
klasifikační systém zviditelňuje jedny rozdíly a jiné zakrývá, a že jeho kategorie se zpětně
promítají do toho, jak lidé svět vnímají a jak s ním zacházejí (Bowker a Star, 1999). Rejstřík
proto nemá být čten jako výčet samostatných přírodních jevů, ale jako pracovní nástroj, který
usnadňuje rozpoznání, dorozumění a vyhledání obranných postupů.

Konstrukce kódů napodobuje hierarchické klinické klasifikace, které kombinují číselný kód
s popisem znaků a s pravidly odlišení, jako to činí DSM-5 a Mezinárodní klasifikace nemocí
(American Psychiatric Association, 2013; World Health Organization, 2019). První číslo kódu
označuje kapitolu taxonomie, druhé podkategorii a třetí konkrétní vzorec. Na rozdíl od
klinických klasifikací však kódy EA neoznačují diagnózy osob, nýbrž vzorce jednání a jejich
účinky, a nesmějí být používány k diagnostikování konkrétních lidí.

Kategorie rejstříku mají povahu prototypů, nikoli ostře ohraničených tříd. Rosch ukázala, že
lidské kategorie jsou organizovány kolem typických příkladů a že hranice mezi nimi jsou
neostré (Rosch, 1978); konkrétní případ manipulace proto často odpovídá více kódům současně
a kód popisuje převažující strukturu, nikoli úplný obraz. Kendell a Jablensky upozornili, že
psychiatrické kategorie mohou být užitečné, aniž by byla prokázána jejich validita jako
samostatných entit (Kendell a Jablensky, 2003); totéž rejstřík nárokuje pro kódy EA, jejichž
oprávnění spočívá v užitečnosti pro rozpoznání a obranu.

Taxonomie navazuje na tradici kriteriálních popisů nátlaku a kontroly, od Bidermanovy analýzy
nátlaku na válečné zajatce přes Liftonova kritéria totalistického prostředí po Hassanův model
BITE (Biderman, 1957; Lifton, 1961; Hassan, 1988). Tyto rámce samy mají v rejstříku kódy
v kapitole 8. Každý kód odkazuje na stránku, která vedle struktury vzorce uvádí detekční
znaky, odlišení, obranu a zotavení, v souladu s pravidly popsanými v příloze
[Dvojí užití poznání](@/kompendium/08-prilohy/dual-use.md) (Miller a Selgelid, 2008).

## Notační konvence

Každá technika je identifikována kódem ve formátu `EA-X.Y.Z[-α]`:

| Komponenta | Význam | Příklad |
|------------|--------|---------|
| **EA** | Epistemická anihilace (konstantní prefix) | `EA` |
| **X** | Kapitola / primární kategorie | `1` |
| **Y** | Subkategorie | `1` |
| **Z** | Specifický fenomén | `1` |
| **α** | Volitelná varianta | `a`, `b`, `c` |

Pravidla přiřazování kódů vykládá [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md),
zkratky [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md).

## Kapitola 1 — Akademické techniky

Techniky zneužívající legitimní akademické nástroje, jako je výběr zdrojů, logická forma
a rétorika autority.

### 1.1 Akvizice poznání

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| [`EA-1.1.1`](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) | Selektivní expozice | Strategický výběr informačních pramenů vytvářející iluzi vyváženosti. |
| [`EA-1.1.2`](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) | Informační přetížení | Záměrné zahlcení daty znemožňující kritické vyhodnocení. |
| [`EA-1.1.3`](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) | Terminologická mystifikace | Konstrukce odborně znějících termínů bez denotativního obsahu. |

### 1.2 Logická manipulace

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| [`EA-1.2.1`](@/kompendium/techniques/ea-1-2-1-falesne-dilema.md) | Falešné dilema | Redukce komplexního problému na binární volbu. |
| [`EA-1.2.2`](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md) | Falešná ekvivalence | Postavení nesouměřitelných pozic do zdánlivé symetrie. |
| [`EA-1.2.3`](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) | Iluzorní komplexita | Umělé komplikování jednoduchých témat za účelem neutralizace. |

### 1.3 Falsifikační obrana

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| [`EA-1.3.1`](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) | Imunizace proti falsifikaci | Konstrukce tvrzení nepřístupných empirickému přezkumu. |
| [`EA-1.3.2`](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) | Strategická reinterpretace | Posun významu pojmů tak, aby falsifikační evidence ztratila platnost. |
| [`EA-1.3.3`](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) | Tematická diverze | Přesměrování diskuse od kritického bodu k bezpečnému tématu. |

### 1.4 Prosodická a paralingvistická vrstva

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| [`EA-1.4.1`](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md) | Prosodická dominance | Použití hlasového rejstříku k vytvoření iluze autority. |
| [`EA-1.4.2`](@/kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md) | Latentní emocionální modulace | Podprahový emoční tón rámující obsah. |

### 1.5 Proxemická a tělesná vrstva

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| [`EA-1.5.1`](@/kompendium/techniques/ea-1-5-1-strategicka-proxemika.md) | Strategická proxemika | Manipulace fyzickou vzdáleností a prostorovým uspořádáním. |
| [`EA-1.5.2`](@/kompendium/techniques/ea-1-5-2-dominantni-telesne-hieroglyfy.md) | Dominantní tělesné hieroglyfy | Posturální dominance jako neverbální argument. |

## Kapitola 2 — Delegitimizační techniky

Techniky, jejichž cílem je zničit epistemickou důvěryhodnost zdroje; rozvádí je
[Sekce 03](@/kompendium/03-zakladni-kategorie/_index.md).

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| `EA-2.1.1` | Ad hominem konstrukce | Útok na osobu místo argumentu, formalizovaný akademickou rétorikou. |
| `EA-2.1.2` | Asociativní diskreditace | Spojení s negativně valencovanou skupinou bez evidence vazby. |
| `EA-2.2.1` | Selektivní zveřejnění minulosti | Vytržené historické fragmenty vytvářející zkreslený narativ. |
| `EA-2.2.2` | Konstruktivní mlčení | Strategické nepřipomínání pozitivních faktů. |
| `EA-2.3.1` | Kvalifikační útok | Zpochybnění formálních předpokladů (titul, instituce, etnicita). |
| `EA-2.3.2` | Procedurální disqualifikace | Použití formálních pravidel k vyloučení nepohodlného hlasu. |

## Kapitola 3 — Edukativní implementace

Techniky, které člověka učí manipulovat sám sebe ve vzdělávacích, terapeutických
a koučovacích kontextech.

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| `EA-3.1.1` | Pseudokritické myšlení | Trénink "kritičnosti" zaměřený výhradně na vnější autority. |
| `EA-3.1.2` | Internalizace metaframu | Adopce výkladového rámce jako vlastního světonázoru. |
| `EA-3.2.1` | Konfesní cyklus | Periodická veřejná sebedeklarace upevňující skupinovou loyalitu. |
| `EA-3.2.2` | Pedagogická triangulace | Učitel hraje roli jak autority, tak rivala, tak průvodce. |
| `EA-3.3.1` | Epistemická úzkost | Indukce stálé pochybnosti o vlastním poznání. |

## Kapitola 4 — Terminální protokoly

Komplexní sekvence kombinující techniky předchozích kapitol; plný popis je v
[Sekci 04](@/kompendium/04-terminalni-protokoly/_index.md).

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| `EA-4.1.1` | Epistemická anihilace plná | Sekvenční aplikace 1.x + 2.x + 3.x do úplného kolapsu epistemické autonomie. |
| `EA-4.2.1` | Skupinová homogenizace | Eliminace vnitroskupinové epistemické diverzity. |
| `EA-4.3.1` | Hierarchická kaskáda | Top-down distribuce manipulačních protokolů přes mocenskou strukturu. |

## Kapitola 5 — Ultramární techniky

Techniky zasahující samotné podmínky poznávání; jejich rámec vykládá
[Sekce 05](@/kompendium/05-ultramari-techniky/_index.md).

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| [`EA-5.1.1`](@/kompendium/techniques/ea-5-1-1-epistemicka-kanibalizace.md) | Epistemická kanibalizace | Subjekt používá vlastní poznávací nástroje k destrukci téhož. |
| `EA-5.1.2` | Reflexivní inverze | Obrácení reflexe proti reflexi samotné. |
| `EA-5.1.3` | Sebenosný paradox | Vnoření paradoxu do identitárního jádra. |
| [`EA-5.1.4`](@/kompendium/techniques/ea-5-1-4-semanticka-imploze.md) | Sémantická imploze | Kolaps významu pojmů zevnitř, bez vnějšího odporu. |
| `EA-5.1.5` | Lexikální vyprázdnění | Postupné vyprazdňování jádrových termínů zachováním obalu. |
| `EA-5.1.6` | Konceptuální štěpení | Rozdělení jednotného pojmu na neslučitelné fragmenty. |
| [`EA-5.1.7`](@/kompendium/techniques/ea-5-1-7-referencni-rekurze.md) | Referenční rekurze | Nekonečná smyčka odkazů bez dosažení referentu. |
| `EA-5.1.8` | Sebepojmenovávací paradox | Pojem, který nemůže označovat sám sebe ani něco jiného. |
| `EA-5.1.9` | Meta-meta-narativní kolaps | Destrukce na úrovni vyprávění o vyprávění o vyprávění. |
| [`EA-5.1.10`](@/kompendium/techniques/ea-5-1-10-temporalni-dekoherence.md) | Temporální dekoherence | Rozbití koherentního vnímání plynutí času. |
| `EA-5.1.11` | Anachronická záměna | Přiřazení současného významu historickému kontextu jako pravdivý překlad. |
| `EA-5.1.12` | Kauzální inverze | Záměna příčiny a následku v narativní struktuře. |
| [`EA-5.1.13`](@/kompendium/techniques/ea-5-1-13-hyperreflexivita.md) | Hyperreflexivita | Patologická reflexe znemožňující jakoukoliv akci. |
| `EA-5.1.14` | Identitární dezintegrace | Postupný rozpad jádrových identifikátorů self. |
| `EA-5.1.15` | Existenciální derealizace | Ztráta pocitu reality vlastní existence. |
| [`EA-5.1.16`](@/kompendium/techniques/ea-5-1-16-inferencni-paralyza.md) | Inferenční paralýza | Neschopnost vyvodit závěr z jasných premis. |
| `EA-5.1.17` | Modalitní zmatek | Záměna nutnosti, možnosti a aktuálnosti. |
| `EA-5.1.18` | Pravdo-falešová indiference | Vyhasnutí relevance pravdivosti. |
| [`EA-5.1.19`](@/kompendium/techniques/ea-5-1-19-kvazi-mysticka-anihilace.md) | Kvazi-mystická anihilace | Imitace transcendentní zkušenosti za účelem destrukce reflexe. |
| `EA-5.1.20` | Spirituální bypass | Použití spirituální terminologie k vyhnutí se etické konfrontaci. |
| `EA-5.1.21` | Sakralizace destrukce | Přiřazení posvátného statusu rozkládajícímu procesu. |
| [`EA-5.1.22`](@/kompendium/techniques/ea-5-1-22-diferencialni-nihilace.md) | Diferenciální nihilace | Eliminace schopnosti rozlišovat — vše splývá. |
| `EA-5.1.23` | Hodnotová dezorientace | Ztráta hierarchie hodnot, ekvivalence triviality a důležitosti. |
| `EA-5.1.24` | Etická amnézie | Vymazání vzpomínky na vlastní etické intuice. |
| [`EA-5.1.25`](@/kompendium/techniques/ea-5-1-25-singularni-narativni-kolaps.md) | Singulární narativní kolaps | Jediný narativ konzumuje všechny ostatní. |
| `EA-5.1.26` | Polyfonní zámlka | Více protichůdných narativů potlačí všechen smysl. |
| `EA-5.1.27` | Anti-narativní kasace | Aktivní destrukce vyprávění jako takového. |
| [`EA-5.1.28`](@/kompendium/techniques/ea-5-1-28-konvergentni-singularita.md) | Konvergentní singularita | Sjednocení všech rozdílů do jednoho bodu, kde mizí poznání. |
| `EA-5.1.29` | Ireverzibilní transcendence | Bod, za nímž návrat do předchozí epistemické struktury není možný. |
| `EA-5.1.30` | Apoteoza prázdna | Konečná deifikace ztráty jako cíle. |

## Kapitola 6 — Klinické aplikace

Diagnostické a terapeutické rámce pro práci s lidmi po expozici; viz
[Sekce 06](@/kompendium/06-klinicke-aplikace/_index.md) a
[Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md).

| Kód | Název | Jednořádkový popis |
|-----|-------|--------------------|
| `EA-6.1.1` | Diagnostické rozhovorové protokoly | Strukturované rozhovory pro detekci EA expozice. |
| `EA-6.2.1` | Třífázová terapeutická sekvence | Stabilizace → rekonstrukce → reintegrace. |
| `EA-6.3.1` | Preventivní edukace | Trénink epistemické imunity. |

Úplný seznam článků kapitol 1 až 6 uvádí [index technik](@/kompendium/techniques/_index.md).

## Kapitola 7 — Teoretické reflexe

Kódy EA-7 označují teoretické rámce, jimiž kniha manipulaci vykládá. Narativní články k nim
obsahuje [Sekce 07](@/kompendium/07-teoreticke-reflexe/_index.md).

### 7.1 Kontinentální filozofie a kritická teorie

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-7.1.1`](@/kompendium/techniques/ea-7-1-1-foucault-power-knowledge.md) | Foucault: Power/Knowledge | Vztah moci a vědění: kdo určuje, co platí za pravdu. |
| [`EA-7.1.2`](@/kompendium/techniques/ea-7-1-2-foucault-discipline.md) | Foucault: Discipline & Punish | Disciplinární moc, dohled a normalizace jednání. |
| [`EA-7.1.3`](@/kompendium/techniques/ea-7-1-3-adorno-instrumental-reason.md) | Adorno: Instrumentální rozum | Redukce rozumu na nástroj kontroly a jeho epistemické důsledky. |
| [`EA-7.1.4`](@/kompendium/techniques/ea-7-1-4-habermas-communicative-action.md) | Habermas: Komunikativní jednání | Podmínky nedeformované komunikace jako měřítko manipulace. |
| [`EA-7.1.5`](@/kompendium/techniques/ea-7-1-5-arendt-banality-evil.md) | Arendtová: Banalita zla | Bezmyšlenkovitost a selhání úsudku v byrokratickém prostředí. |
| [`EA-7.1.6`](@/kompendium/techniques/ea-7-1-6-sloterdijk-spheres.md) | Sloterdijk: Sféry | Sdílené imunitní prostory a jejich rozpad. |
| [`EA-7.1.7`](@/kompendium/techniques/ea-7-1-7-deleuze-rhizome.md) | Deleuze & Guattari: Rhizome | Necentralizované sítě významu a šíření vlivu. |
| [`EA-7.1.8`](@/kompendium/techniques/ea-7-1-8-derrida-deconstruction.md) | Derrida: Dekonstrukce | Nestabilita významu a její zneužití i obranné užití. |
| [`EA-7.1.9`](@/kompendium/techniques/ea-7-1-9-heidegger-dasein.md) | Heidegger: Dasein | Bytí ve světě a neautentické splynutí s „se“. |
| [`EA-7.1.10`](@/kompendium/techniques/ea-7-1-10-merleau-ponty-embodiment.md) | Merleau-Ponty: Embodiment | Tělesný subjekt jako podmínka vnímání a jeho narušení. |

### 7.2 Epistemologie a filozofie vědy

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-7.2.1`](@/kompendium/techniques/ea-7-2-1-fricker-epistemic-injustice.md) | Fricker: Epistemická nespravedlnost | Svědecká a hermeneutická nespravedlnost. |
| [`EA-7.2.2`](@/kompendium/techniques/ea-7-2-2-goldman-veritism.md) | Goldman: Veritismus | Pravdivost jako cíl sociálních epistemických praktik. |
| [`EA-7.2.3`](@/kompendium/techniques/ea-7-2-3-popper-falsification.md) | Popper: Falsifikace | Falzifikovatelnost jako kritérium odolnosti tvrzení. |
| [`EA-7.2.4`](@/kompendium/techniques/ea-7-2-4-lakatos-research-program.md) | Lakatos: Vědecký výzkumný program | Progresivní a degenerující výzkumné programy. |
| [`EA-7.2.5`](@/kompendium/techniques/ea-7-2-5-kuhn-paradigm-shift.md) | Kuhn: Paradigmatický posun | Paradigmata, normální věda a inkomensurabilita. |
| [`EA-7.2.6`](@/kompendium/techniques/ea-7-2-6-feyerabend-anti-method.md) | Feyerabend: Anti-metoda | Metodologický pluralismus a meze pravidel. |
| [`EA-7.2.7`](@/kompendium/techniques/ea-7-2-7-quine-web-belief.md) | Quine: Web of Belief | Holismus přesvědčení a revize jejich sítě. |
| [`EA-7.2.8`](@/kompendium/techniques/ea-7-2-8-davidson-charity.md) | Davidson: Princip vstřícnosti | Princip vstřícného výkladu a jeho zneužití. |
| [`EA-7.2.9`](@/kompendium/techniques/ea-7-2-9-williams-truthfulness.md) | Williams: Truthfulness | Přesnost a upřímnost jako ctnosti pravdivosti. |
| [`EA-7.2.10`](@/kompendium/techniques/ea-7-2-10-nagel-view-from-nowhere.md) | Nagel: Pohled odnikud | Napětí mezi subjektivní perspektivou a objektivitou. |

### 7.3 Kognitivní vědy a filozofie mysli

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-7.3.1`](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md) | Kahneman: System 1/2 | Rychlé a pomalé myšlení a jejich zranitelnosti. |
| [`EA-7.3.2`](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) | Tversky & Kahneman: Heuristiky | Heuristiky a systematická zkreslení úsudku. |
| [`EA-7.3.3`](@/kompendium/techniques/ea-7-3-3-friston-active-inference.md) | Friston: Active Inference | Prediktivní zpracování a aktivní inference. |
| [`EA-7.3.4`](@/kompendium/techniques/ea-7-3-4-clark-extended-mind.md) | Clark: Rozšířená mysl | Rozšířená mysl a závislost poznání na nástrojích. |
| [`EA-7.3.5`](@/kompendium/techniques/ea-7-3-5-metzinger-ego-tunnel.md) | Metzinger: Ego-tunel | Fenomenální model já a jeho narušitelnost. |
| [`EA-7.3.6`](@/kompendium/techniques/ea-7-3-6-thompson-mind-life.md) | Thompson: Mind in Life | Kontinuita života a mysli v enaktivním pojetí. |
| [`EA-7.3.7`](@/kompendium/techniques/ea-7-3-7-dennett-intentional-stance.md) | Dennett: Intenční postoj | Intencionální postoj a připisování myslí. |
| [`EA-7.3.8`](@/kompendium/techniques/ea-7-3-8-chalmers-hard-problem.md) | Chalmers: Hard problem | Těžký problém vědomí a meze vysvětlení. |
| [`EA-7.3.9`](@/kompendium/techniques/ea-7-3-9-dehaene-consciousness.md) | Dehaene: Globální pracovní prostor | Globální pracovní prostor a přístup k vědomí. |
| [`EA-7.3.10`](@/kompendium/techniques/ea-7-3-10-tononi-iit.md) | Tononi: IIT | Integrovaná informace jako teorie vědomí. |

## Kapitola 8 — Diagnostické nástroje, rámce a literatura

Kódy EA-8 označují referenční zdroje: měřicí nástroje, klinické a teoretické rámce
a tematické soubory literatury.

### 8.1 Diagnostické a měřicí nástroje

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-8.1.1`](@/kompendium/techniques/ea-8-1-1-bite-model-detail.md) | BITE Model Detail (Hassan) | Podrobná operacionalizace modelu BITE. |
| [`EA-8.1.2`](@/kompendium/techniques/ea-8-1-2-cult-leaving-questionnaire.md) | Cult Leaving Questionnaire (Almendros et al.) | Dotazník zkušeností po odchodu ze skupiny. |
| [`EA-8.1.3`](@/kompendium/techniques/ea-8-1-3-stalking-behavior-checklist.md) | Stalking Behavior Checklist (Mullen-Pathé-Purcell) | Kontrolní seznam projevů pronásledování. |
| [`EA-8.1.4`](@/kompendium/techniques/ea-8-1-4-coercive-control-scale.md) | Coercive Control Scale (Stark/Hamberger) | Škála donucující kontroly v párových vztazích. |
| [`EA-8.1.5`](@/kompendium/techniques/ea-8-1-5-epistemic-trust-scale.md) | Epistemic Trust Scale (Fonagy/Allison) | Měření epistemické důvěry. |
| [`EA-8.1.6`](@/kompendium/techniques/ea-8-1-6-betrayal-trauma-inventory.md) | Betrayal Trauma Inventory (Freyd/Goldsmith) | Inventář traumatu ze zrady. |
| [`EA-8.1.7`](@/kompendium/techniques/ea-8-1-7-disociativni-experiences-scale.md) | Dissociative Experiences Scale-II (Carlson/Putnam) | Škála disociativních zkušeností. |
| [`EA-8.1.8`](@/kompendium/techniques/ea-8-1-8-traumatic-stress-screen.md) | Traumatic Stress Screen (PCL-5/IES-R Hybrid) | Screening traumatického stresu. |
| [`EA-8.1.9`](@/kompendium/techniques/ea-8-1-9-metakognitivni-questionnaire.md) | Metacognitions Questionnaire (Wells/Cartwright-Hatton) | Dotazník metakognic. |
| [`EA-8.1.10`](@/kompendium/techniques/ea-8-1-10-decision-making-capacity-scale.md) | Decision-Making Capacity Scale (Appelbaum/Grisso) | Posouzení způsobilosti k rozhodování. |

### 8.2 Klinické a teoretické rámce

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-8.2.1`](@/kompendium/techniques/ea-8-2-1-bite-framework.md) | BITE Framework (Hassan) | Rámec BITE jako model kontroly. |
| [`EA-8.2.2`](@/kompendium/techniques/ea-8-2-2-lifton-thought-reform-criteria.md) | Lifton Thought Reform Criteria | Liftonova kritéria myšlenkové reformy. |
| [`EA-8.2.3`](@/kompendium/techniques/ea-8-2-3-singer-six-conditions.md) | Singer Six Conditions of Mind Control | Singerové podmínky kontroly mysli. |
| [`EA-8.2.4`](@/kompendium/techniques/ea-8-2-4-hassan-cult-criteria.md) | Hassan Cult Criteria (Authoritarian Pyramid) | Hassanova kritéria autoritářské skupiny. |
| [`EA-8.2.5`](@/kompendium/techniques/ea-8-2-5-stark-coercive-control.md) | Stark Coercive Control Framework | Starkův rámec donucující kontroly. |
| [`EA-8.2.6`](@/kompendium/techniques/ea-8-2-6-icd-11-complex-trauma.md) | ICD-11 Complex Trauma (CPTSD) | Komplexní PTSD podle MKN-11. |
| [`EA-8.2.7`](@/kompendium/techniques/ea-8-2-7-dsm-5-tr-trauma.md) | DSM-5-TR Trauma & Stressor-Related Disorders | Poruchy související s traumatem a stresorem podle DSM-5-TR. |
| [`EA-8.2.8`](@/kompendium/techniques/ea-8-2-8-aprw-attachment-trauma.md) | APRW Attachment-Pertinent Relational Wounding (Allen) | Vztahové zranění v kontextu vazby. |
| [`EA-8.2.9`](@/kompendium/techniques/ea-8-2-9-van-der-kolk-trauma.md) | van der Kolk Trauma Framework (The Body Keeps the Score) | Tělesné pojetí traumatu podle van der Kolka. |
| [`EA-8.2.10`](@/kompendium/techniques/ea-8-2-10-herman-recovery-stages.md) | Herman Recovery Stages (Trauma and Recovery) | Fáze zotavení podle Hermanové. |

### 8.3 Tematické soubory literatury

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-8.3.1`](@/kompendium/techniques/ea-8-3-1-foundational-readings.md) | Foundational Readings | Základní literatura oboru. |
| [`EA-8.3.2`](@/kompendium/techniques/ea-8-3-2-clinical-handbook.md) | Clinical Handbook | Klinické příručky. |
| [`EA-8.3.3`](@/kompendium/techniques/ea-8-3-3-philosophical-canon.md) | Philosophical Canon | Filozofický kánon. |
| [`EA-8.3.4`](@/kompendium/techniques/ea-8-3-4-empirical-research-base.md) | Empirical Research Base | Empirická výzkumná základna. |
| [`EA-8.3.5`](@/kompendium/techniques/ea-8-3-5-historical-cases.md) | Historical Cases | Literatura k historickým případům. |
| [`EA-8.3.6`](@/kompendium/techniques/ea-8-3-6-contemporary-cases.md) | Contemporary Cases | Literatura k současným případům. |
| [`EA-8.3.7`](@/kompendium/techniques/ea-8-3-7-interdisciplinary-anthology.md) | Interdisciplinary Anthology | Interdisciplinární antologie. |
| [`EA-8.3.8`](@/kompendium/techniques/ea-8-3-8-trauma-recovery-literature.md) | Trauma Recovery Literature | Literatura o zotavení z traumatu. |
| [`EA-8.3.9`](@/kompendium/techniques/ea-8-3-9-cult-studies-literature.md) | Cult Studies Literature | Literatura studia kultů. |
| [`EA-8.3.10`](@/kompendium/techniques/ea-8-3-10-information-warfare-literature.md) | Information Warfare Literature | Literatura informační války. |

## Kapitola 9 — Digitální a algoritmická EA

Kódy EA-9 označují vzorce, v nichž manipulaci zprostředkují nebo zesilují digitální systémy.

### 9.1 Jazykové modely

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-9.1.1`](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) | LLM Hallucination Laundering | Šíření konfabulací jazykového modelu jako faktů. |
| [`EA-9.1.2`](@/kompendium/techniques/ea-9-1-2-prompt-injection-EA.md) | Prompt Injection EA | Vkládání instrukcí do vstupu jazykového modelu. |
| [`EA-9.1.3`](@/kompendium/techniques/ea-9-1-3-jailbreak-cascade.md) | Jailbreak Cascade | Řetězené obcházení bezpečnostních omezení modelu. |
| [`EA-9.1.4`](@/kompendium/techniques/ea-9-1-4-rag-context-poisoning.md) | RAG Context Poisoning | Otrava zdrojů, z nichž model čerpá kontext. |
| [`EA-9.1.5`](@/kompendium/techniques/ea-9-1-5-llm-narrative-injection.md) | LLM Narrative Injection | Vnášení narativu prostřednictvím výstupů modelu. |
| [`EA-9.1.6`](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md) | LLM Source Attribution Bypass | Ztráta vazby výroku modelu na zdroj. |
| [`EA-9.1.7`](@/kompendium/techniques/ea-9-1-7-synthetic-expertise-claim.md) | Synthetic Expertise Claim | Předstíraná odbornost generovaného textu. |
| [`EA-9.1.8`](@/kompendium/techniques/ea-9-1-8-llm-confabulation-amplification.md) | LLM Confabulation Amplification | Zesilování konfabulací opakovaným užitím. |
| [`EA-9.1.9`](@/kompendium/techniques/ea-9-1-9-multi-turn-narrative-shift.md) | Multi-Turn Narrative Shift | Postupný posun výkladu během dlouhého dialogu. |
| [`EA-9.1.10`](@/kompendium/techniques/ea-9-1-10-llm-recursion-loop.md) | LLM Recursion Loop | Rekurzivní smyčky modelů učených na vlastních výstupech. |

### 9.2 Syntetická média

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-9.2.1`](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md) | Deepfake Personality | Syntetická napodobenina osobnosti. |
| [`EA-9.2.2`](@/kompendium/techniques/ea-9-2-2-voice-cloning-EA.md) | Voice Cloning EA | Klonování hlasu. |
| [`EA-9.2.3`](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md) | Synthetic Text Narrative | Syntetický text jako nosič narativu. |
| [`EA-9.2.4`](@/kompendium/techniques/ea-9-2-4-image-manipulation-EA.md) | Image Manipulation EA | Manipulace obrazu. |
| [`EA-9.2.5`](@/kompendium/techniques/ea-9-2-5-video-manipulation-EA.md) | Video Manipulation EA | Manipulace videa. |
| [`EA-9.2.6`](@/kompendium/techniques/ea-9-2-6-AI-news-cascade.md) | AI News Cascade | Kaskáda zpráv generovaných systémy umělé inteligence. |
| [`EA-9.2.7`](@/kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md) | Synthetic Witness Testimony | Syntetické svědectví. |
| [`EA-9.2.8`](@/kompendium/techniques/ea-9-2-8-AI-eyewitness-fabrication.md) | AI Eyewitness Fabrication | Vytvořený očitý svědek. |
| [`EA-9.2.9`](@/kompendium/techniques/ea-9-2-9-AI-document-forgery.md) | AI Document Forgery | Padělání dokumentů pomocí generativních modelů. |
| [`EA-9.2.10`](@/kompendium/techniques/ea-9-2-10-AI-personhood-claim.md) | AI Personhood Claim | Nárok systému na status osoby. |

### 9.3 Algoritmy platforem

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-9.3.1`](@/kompendium/techniques/ea-9-3-1-algorithmic-amplification.md) | Algoritmická amplifikace | Algoritmické zesílení obsahu. |
| [`EA-9.3.2`](@/kompendium/techniques/ea-9-3-2-engagement-optimization-EA.md) | Engagement Optimization EA | Optimalizace na zapojení uživatele a její epistemické důsledky. |
| [`EA-9.3.3`](@/kompendium/techniques/ea-9-3-3-feed-personalization-bias.md) | Feed Personalization Bias | Zkreslení personalizovaného zpravodajského proudu. |
| [`EA-9.3.4`](@/kompendium/techniques/ea-9-3-4-recommendation-radicalization.md) | Recommendation Radicalization | Radikalizace doporučovacími systémy. |
| [`EA-9.3.5`](@/kompendium/techniques/ea-9-3-5-shadowban-coordination.md) | Shadowban Coordination | Koordinované skryté omezování dosahu. |
| [`EA-9.3.6`](@/kompendium/techniques/ea-9-3-6-content-moderation-bias.md) | Content Moderation Bias | Zkreslení moderace obsahu. |
| [`EA-9.3.7`](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md) | Platform Coordinated Attack | Koordinovaný útok využívající platformu. |
| [`EA-9.3.8`](@/kompendium/techniques/ea-9-3-8-mass-reporting-coordination.md) | Mass Reporting Coordination | Koordinované hromadné nahlašování. |
| [`EA-9.3.9`](@/kompendium/techniques/ea-9-3-9-tag-hijacking-EA.md) | Tag Hijacking EA | Únos štítků a hashtagů. |
| [`EA-9.3.10`](@/kompendium/techniques/ea-9-3-10-trend-manipulation-EA.md) | Trend Manipulation EA | Manipulace trendů. |

### 9.4 Boti a koordinované sítě

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-9.4.1`](@/kompendium/techniques/ea-9-4-1-bot-amplification-coordinated.md) | Bot Amplification Coordinated | Koordinované zesílení prostřednictvím botů. |
| [`EA-9.4.2`](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md) | Coordinated Inauthentic Behavior | Koordinované neautentické chování. |
| [`EA-9.4.3`](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md) | Sock Puppet Network | Síť falešných identit. |
| [`EA-9.4.4`](@/kompendium/techniques/ea-9-4-4-AI-bot-personhood.md) | AI Bot Personhood | Bot vystupující jako osoba. |
| [`EA-9.4.5`](@/kompendium/techniques/ea-9-4-5-troll-farm-EA.md) | Troll Farm EA | Organizované trollí farmy. |
| [`EA-9.4.6`](@/kompendium/techniques/ea-9-4-6-mass-comment-coordination.md) | Mass Comment Coordination | Koordinované hromadné komentování. |
| [`EA-9.4.7`](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md) | Cross-Platform Bot Cascade | Kaskáda botů napříč platformami. |
| [`EA-9.4.8`](@/kompendium/techniques/ea-9-4-8-real-time-bot-response.md) | Real-Time Bot Response | Automatizované reakce v reálném čase. |
| [`EA-9.4.9`](@/kompendium/techniques/ea-9-4-9-bot-narrative-injection.md) | Bot Narrative Injection | Vnášení narativu sítí botů. |
| [`EA-9.4.10`](@/kompendium/techniques/ea-9-4-10-bot-detection-evasion.md) | Bot Detection Evasion | Obcházení detekce botů. |

### 9.5 Memy a rámce

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-9.5.1`](@/kompendium/techniques/ea-9-5-1-meme-cascade-injection.md) | Meme Cascade Injection | Kaskádové šíření memů. |
| [`EA-9.5.2`](@/kompendium/techniques/ea-9-5-2-symbolic-hijacking.md) | Symbolic Hijacking | Únos symbolů. |
| [`EA-9.5.3`](@/kompendium/techniques/ea-9-5-3-emotional-meme-engineering.md) | Emotional Meme Engineering | Emočně cílené memy. |
| [`EA-9.5.4`](@/kompendium/techniques/ea-9-5-4-meme-network-amplification.md) | Meme Network Amplification | Síťové zesílení memů. |
| [`EA-9.5.5`](@/kompendium/techniques/ea-9-5-5-counter-meme-suppression.md) | Counter-Meme Suppression | Potlačování protimemů. |
| [`EA-9.5.6`](@/kompendium/techniques/ea-9-5-6-frame-war-coordination.md) | Frame War Coordination | Koordinovaná válka rámců. |
| [`EA-9.5.7`](@/kompendium/techniques/ea-9-5-7-narrative-meme-fusion.md) | Narrative Meme Fusion | Splynutí narativu a memu. |
| [`EA-9.5.8`](@/kompendium/techniques/ea-9-5-8-meme-context-collapse.md) | Meme Context Collapse | Ztráta kontextu při šíření memu. |
| [`EA-9.5.9`](@/kompendium/techniques/ea-9-5-9-meme-radicalization-pipeline.md) | Meme Radicalization Pipeline | Radikalizační řetězec memů. |
| [`EA-9.5.10`](@/kompendium/techniques/ea-9-5-10-meme-attribution-laundering.md) | Meme Attribution Laundering | Praní původu memu. |

### 9.6 Algoritmické rozhodování

| Kód | Název | Zaměření |
|-----|-------|----------|
| [`EA-9.6.1`](@/kompendium/techniques/ea-9-6-1-algorithmic-decision-bias.md) | Algorithmic Decision Bias | Zkreslení algoritmického rozhodování. |
| [`EA-9.6.2`](@/kompendium/techniques/ea-9-6-2-AI-judgment-laundering.md) | AI Judgment Laundering | Legitimizace úsudku odkazem na systém umělé inteligence. |
| [`EA-9.6.3`](@/kompendium/techniques/ea-9-6-3-automated-content-takedown.md) | Automated Content Takedown | Automatizované odstraňování obsahu. |
| [`EA-9.6.4`](@/kompendium/techniques/ea-9-6-4-AI-deplatforming-cascade.md) | AI Deplatforming Cascade | Kaskáda vyloučení z platforem. |
| [`EA-9.6.5`](@/kompendium/techniques/ea-9-6-5-AI-credit-scoring-bias.md) | AI Credit Scoring Bias | Zkreslení algoritmického úvěrového hodnocení. |
| [`EA-9.6.6`](@/kompendium/techniques/ea-9-6-6-AI-hiring-narrative.md) | AI Hiring Narrative | Narativ algoritmického náboru. |
| [`EA-9.6.7`](@/kompendium/techniques/ea-9-6-7-AI-medical-decision-EA.md) | AI Medical Decision EA | Algoritmické rozhodování ve zdravotnictví. |
| [`EA-9.6.8`](@/kompendium/techniques/ea-9-6-8-AI-legal-decision-EA.md) | AI Legal Decision EA | Algoritmické rozhodování v právu. |
| [`EA-9.6.9`](@/kompendium/techniques/ea-9-6-9-AI-immigration-decision.md) | AI Immigration Decision | Algoritmické rozhodování v migraci. |
| [`EA-9.6.10`](@/kompendium/techniques/ea-9-6-10-AI-welfare-decision-EA.md) | AI Welfare Decision EA | Algoritmické rozhodování v sociálních službách. |

Kód EA-10 není obsazen žádnou technikou; metaúrovni taxonomie se věnuje
[Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md).

## Rozsah podknihovny technik

| Kapitola | Počet článků |
|----------|--------------|
| EA-1 | 32 |
| EA-2 | 51 |
| EA-3 | 30 |
| EA-4 | 41 |
| EA-5 | 188 |
| EA-6 | 51 |
| EA-7 | 30 |
| EA-8 | 30 |
| EA-9 | 60 |
| **Celkem** | **513** |

Počty odpovídají stavu podknihovny k 10. listopadu 2026; závazný je
[index technik](@/kompendium/techniques/_index.md).

## Literatura

- American Psychiatric Association. (2013). *Diagnostic and statistical manual of mental
  disorders* (5th ed.). American Psychiatric Publishing.
- Biderman, A. D. (1957). Communist attempts to elicit false confessions from Air Force
  prisoners of war. *Bulletin of the New York Academy of Medicine, 33*(9), 616–625.
- Bowker, G. C., & Star, S. L. (1999). *Sorting things out: Classification and its
  consequences*. MIT Press.
- Hassan, S. (1988). *Combatting cult mind control*. Park Street Press.
- Kendell, R., & Jablensky, A. (2003). Distinguishing between the validity and utility of
  psychiatric diagnoses. *American Journal of Psychiatry, 160*(1), 4–12.
- Lifton, R. J. (1961). *Thought reform and the psychology of totalism: A study of
  „brainwashing“ in China*. W. W. Norton.
- Miller, S., & Selgelid, M. J. (2008). *Ethical and philosophical consideration of the
  dual-use dilemma in the biological sciences*. Springer.
- Rosch, E. (1978). Principles of categorization. In E. Rosch & B. B. Lloyd (Eds.),
  *Cognition and categorization* (pp. 27–48). Lawrence Erlbaum.
- World Health Organization. (2019). *International classification of diseases for mortality
  and morbidity statistics* (11th rev.). World Health Organization.

## Související

**Přílohy**

- [Klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) – metodologie přiřazování
  kódů EA.
- [Index pojmů](@/kompendium/08-prilohy/index-pojmu.md) – české a anglické ekvivalenty
  kanonických termínů.
- [Zkratky a notace](@/kompendium/08-prilohy/zkratky.md) – formální notační konvence.
- [Bibliografie](@/kompendium/08-prilohy/bibliografie.md) – primární literatura ke
  kategoriím technik.
- [Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) – instrumenty pro
  rozpoznání jednotlivých technik.
- [Etický kodex výzkumníka EA](@/kompendium/08-prilohy/eticky-kodex.md) – hranice studia
  a užití taxonomie.
- [Dvojí užití poznání](@/kompendium/08-prilohy/dual-use.md) – pravidla, jimiž kniha omezuje
  riziko zneužití popisů.

**Taxonomie a kapitoly**

- [Index technik](@/kompendium/techniques/_index.md) – úplná podknihovna článků technik.
- [Taxonomie EA](@/glossary/taxonomie-ea.md) – heslo glosáře o stavbě taxonomie.
- [Teoretické reflexe](@/kompendium/07-teoreticke-reflexe/_index.md) – narativní články ke
  kódům EA-7.
