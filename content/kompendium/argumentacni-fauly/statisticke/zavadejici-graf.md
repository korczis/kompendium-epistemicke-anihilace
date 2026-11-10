+++
title = "Zavádějící graf"
description = "Grafické zobrazení dat, jehož měřítko, výřez nebo forma vyvolá dojem, který čísla nepodporují: useknuté osy, zvětšené obrázky a vybraná období."
weight = 15
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-retoricka-taktika", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Zavádějící graf", "Misleading graph", "zavádějící vizualizace", "useknutá osa", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.15"
catalog_slug = "zavadejici-graf"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke.b"
catalog_type = "tactic"
catalog_type_cs = "rétorická taktika"
catalog_en = "Misleading graph"
catalog_aliases = ["zavádějící vizualizace", "useknutá osa"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["vyber-tresnicek", "zamlceni-dukazu", "mcnamaruv-klam", "relativni-a-absolutni-riziko", "klam-duraznu", "vytrzeni-z-kontextu"]
catalog_related_declared = ["vyber-tresnicek", "relativni-a-absolutni-riziko", "zamlceni-dukazu", "vytrzeni-z-kontextu", "mcnamaruv-klam"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-1-selektivni-expozice.md", "kompendium/07-teoreticke-reflexe/digitalni-vek.md", "kompendium/06-obrana/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/06-obrana/_index.md", "kompendium/07-teoreticke-reflexe/digitalni-vek.md", "kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md", "kompendium/argumentacni-fauly/statisticke/relativni-a-absolutni-riziko.md", "kompendium/techniques/ea-1-1-1-selektivni-expozice.md"]
catalog_prev = "hledani-jinde"
catalog_next = "relativni-a-absolutni-riziko"
catalog_position = 15
catalog_family_size = 16
catalog_sources = ["gigerenzer-2002", "huff-1954", "kahneman-2011", "roozenbeek-2022", "tversky-kahneman-1981"]
catalog_sources_primary = []
catalog_sources_roots = []
catalog_sources_critical = ["gigerenzer-2002", "huff-1954", "kahneman-2011", "roozenbeek-2022", "tversky-kahneman-1981"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Vztah k technikám kompendia", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.b.toml"
+++

# Zavádějící graf

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.15` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | rétorická taktika |
| **Anglicky** | Misleading graph |
| **Jiné názvy** | zavádějící vizualizace, useknutá osa |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Zavádějící graf je zobrazení dat, které svou formou vyvolá dojem, jenž samotná čísla
nepodporují. Údaje v grafu mohou být přesné, a přesto čtenář odejde s chybnou představou o
velikosti rozdílu, směru vývoje nebo síle souvislosti. Zdrojem klamu je nesoulad mezi tím, co
oko z obrázku vyčte okamžitě, totiž výšky, plochy, sklony a barvy, a tím, co by vyplynulo z
pozorného čtení os, měřítek a popisků. Darrell Huff v klasické knize o zneužívání statistik
popsal dva základní typy: graf, jehož osa je useknutá nebo roztažená tak, aby mírný vzestup
vypadal jako prudký, a obrázkový diagram, v němž se symbol zvětší ve dvou nebo třech
rozměrech, takže plocha nebo objem roste mnohem rychleji než zobrazovaná hodnota (Huff 1954).
V katalogu je zavádějící graf veden jako rétorická taktika, protože bývá výsledkem volby toho,
kdo graf připravuje. Stejně často však vzniká z nepozornosti nebo z výchozího nastavení
programu, a proto je jeho užití dvojí.

## Původ a souvislosti

Kritika zavádějících grafů je stará jako masové užívání statistické grafiky v novinách a
reklamě. Huffova kniha z poloviny dvacátého století byla napsána pro širokou veřejnost a
její záměr byl obranný: čtenář měl poznat, jak se čísly klame, aby se tomu mohl bránit (Huff
1954). O několik desetiletí později formuloval statistik a teoretik informačního designu
Edward Tufte měřítko, které nazval faktorem lži: poměr mezi velikostí efektu, jak ho ukazuje
grafika, a velikostí efektu v datech. Grafika, u níž se tento poměr výrazně liší od jedné,
zkresluje bez ohledu na to, zda jsou čísla v ní správně. Psychologie úsudku k tomu přidala
vysvětlení, proč grafy působí tak silně. Rychlé, intuitivní zpracování vytvoří dojem z tvaru
a velikosti dříve, než se zapojí pomalé čtení údajů, a tento první dojem pak slouží jako
východisko dalšího uvažování (Kahneman 2011). Výzkum rámcování ukázal, že logicky
rovnocenná vyjádření téže informace mohou vést k odlišným rozhodnutím (Tversky a Kahneman
1981), a grafické zobrazení je jednou z nejsilnějších forem rámce. V digitálním prostředí,
kde se grafy šíří jako obrázky bez kontextu a bez zdroje, se toto riziko dále zvětšuje, jak
rozebírá kapitola o [digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md).

## Struktura argumentu

Zavádějící graf je argument, jehož premisa je obrazová a závěr zůstává nevyslovený. Čtenář
vidí dva sloupce, z nichž jeden je mnohonásobně vyšší, a sám si vyvodí, že rozdíl je
dramatický. Graf nic takového netvrdí, a proto se jeho autor může v případě kritiky odvolat na
to, že všechna čísla jsou správně. Tato nepřímost je podstatou taktiky. Typické prostředky
lze shrnout do několika skupin. První skupina se týká měřítka: osa nezačíná nulou, ačkoli
zobrazená veličina je poměrová, měřítko se mění uprostřed osy, dvě křivky se srovnávají na
dvou různých osách. Druhá skupina se týká výřezu: zvolí se období nebo podmnožina dat, ve
kterých vývoj vychází požadovaným směrem, což je obrazová podoba
[výběru třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md).
Třetí skupina se týká formy: plošné a prostorové symboly, perspektivní zkreslení, kumulativní
křivky, které rostou vždy, i když přírůstky klesají. Čtvrtá skupina se týká vztahu k
základu: zobrazují se absolutní počty tam, kde by měly být podíly, nebo naopak, takže se
rozdíl ve velikosti populací vydává za rozdíl v míře jevu (Huff 1954). Ve všech případech
vzniká rozpor mezi obrazem a daty, který čtenář bez pozorného čtení nepozná.

## Detekční znaky

Prvním znakem je osa, jejíž počátek nebo rozsah neodpovídá povaze veličiny. U počtů, částek a
podílů, kde má nula věcný význam, by sloupcový graf měl začínat nulou; pokud nezačíná, je třeba
přepočítat skutečný poměr hodnot. Druhým znakem je chybějící nebo nečitelný popis os,
jednotek a zdroje dat. Třetím znakem je výřez, který začíná nebo končí v nápadném bodě, třeba
na vrcholu nebo v minimu, a nevysvětluje, proč bylo zvoleno právě toto období. Čtvrtým znakem
je obrázek nebo trojrozměrné těleso místo prostého sloupce. Pátým znakem jsou dvě svislé osy s
rozdílným měřítkem, které umožňují, aby dvě křivky vypadaly souběžně nebo rozbíhavě podle
toho, jak se měřítka zvolí. Šestým znakem je nesoulad mezi titulkem a daty: nadpis hovoří o
prudkém nárůstu, ale čísla na ose ukazují změnu o několik procent. Gigerenzer zdůrazňuje,
že způsob reprezentace informace o riziku rozhoduje o tom, zda jí čtenář porozumí, a
procenta bez uvedení referenční třídy, tedy bez odpovědi na otázku, z čeho jsou počítána,
patří k častým zdrojům nedorozumění (Gigerenzer 2002). Úzkou souvislost má graf se
[záměnou relativního a absolutního rizika](@/kompendium/argumentacni-fauly/statisticke/relativni-a-absolutni-riziko.md).

## Odlišení od platné argumentace

Ne každý graf, jehož osa nezačíná nulou, je zavádějící. U veličin, u nichž nula nemá věcný
význam, jako je teplota ve stupních Celsia, nadmořská výška hladiny nebo index s libovolně
zvoleným počátkem, je zúžený rozsah osy oprávněný a často nutný, protože jinak by se
podstatné změny nedaly rozeznat. Stejně tak logaritmické měřítko je správnou volbou u jevů,
které rostou exponenciálně, pokud je zřetelně označeno. Rozhodující není samotná volba
měřítka, ale to, zda je zdůvodněná povahou dat, výslovně ohlášená a zda neklame o tom, co
je pro čtenáře podstatné. Platné zobrazení také uvádí zdroj, jednotky, období a případně
nejistotu odhadu a nevybírá výřez podle toho, co má graf ukázat. Tufteho měřítko faktoru lži
poskytuje užitečné kritérium: pokud by grafika ukazovala rozdíl úměrný rozdílu v datech,
nemůže být co do velikosti zavádějící, i když se jinak dá zlepšit. Rozlišení mezi chybou a
taktikou z grafu samotného vyčíst nelze. Proto je věcná kritika grafu oprávněná bez ohledu
na úmysl jeho autora a nevyžaduje, aby se mu úmysl klamat dokazoval (Huff 1954).

## Stav poznání

Typologie zavádějících grafů je dobře zavedená a Huffova kniha zůstává jejím nejznámějším
populárním výkladem (Huff 1954). Experimentální studie z oblasti vizualizace dat opakovaně
ukazují, že useknuté osy, plošné symboly a zkreslené poměry stran ovlivňují, jak velký se
čtenářům rozdíl zdá, a to i u lidí, kteří jsou o možnosti zkreslení předem informováni.
Psychologický základ tvoří poznatek, že první intuitivní dojem vzniká rychle a bez námahy,
kdežto jeho kontrola vyžaduje pozornost, na kterou čtenář při rychlém prohlížení často
nemá kapacitu ani motivaci (Kahneman 2011). Výzkum komunikace rizik ukazuje, že transparentní
formy reprezentace, především přirozené četnosti vyjádřené jako počty lidí v konkrétní
skupině, zlepšují porozumění oproti podmíněným pravděpodobnostem a relativním údajům
(Gigerenzer 2002).
Výzkum rámcování dokládá, že rovnocenná vyjádření nejsou psychologicky rovnocenná (Tversky a
Kahneman 1981). Méně prozkoumané zůstává, jak se zavádějící grafy chovají při šíření na
sociálních sítích, kde se odtrhují od textu, který by je mohl uvést na pravou míru.

## Vztah k technikám kompendia

V kontextu epistemické manipulace má zavádějící graf zvláštní postavení, protože spojuje
autoritu čísel s rychlostí obrazu. Graf působí objektivně, jeho tvorba vyžaduje data, a proto
se mu důvěřuje víc než slovnímu tvrzení se stejným obsahem. Zároveň ho čtenář zpracuje během
okamžiku a dojem, který si z něj odnese, se později obtížně opravuje (Kahneman 2011). V
kampaních, které cíleně posouvají vnímání rizik nebo úspěchů, se proto grafy často šíří bez
zdroje, s oříznutými popisky nebo s titulkem, který říká víc než data. Pro rozpoznání je
podstatné, že zavádějící graf obvykle nestojí sám: bývá součástí širšího výběru informací,
které se čtenáři dostanou do zorného pole, a jeho účinek tak sčítá s dalšími jednostrannými
zprávami. Kritika jednoho grafu je proto užitečná, ale úplnější obranou je ptát se, odkud
graf pochází a jaké jiné zobrazení týchž dat by bylo možné.

## Obrana a odpověď

Obranou je zpomalit čtení a přenést pozornost od tvaru k číslům. Užitečné je nejprve přečíst
popisky os, jednotky, zdroj a období, a teprve potom se dívat na tvar grafu. U sloupců je
dobré přepočítat poměr skutečných hodnot a porovnat ho s poměrem výšek. U vývojových grafů
pomáhá ptát se, jak by vypadal delší časový úsek a proč byl zvolen právě tento. U obrázkových
diagramů je třeba sledovat, zda symbol roste jen v jednom rozměru, nebo v ploše. Huff zakončil
svou knihu otázkami, které má čtenář klást každému statistickému tvrzení: kdo to říká, jak to
ví, co chybí, zda se nezměnil předmět řeči a zda to dává smysl (Huff 1954). Tyto otázky
platí i pro grafy. Výzkum psychologické inokulace naznačuje, že předem vysvětlené
manipulativní postupy lidé poznávají snáz (Roozenbeek a kol. 2022), a proto má smysl učit
rozpoznávání zavádějících grafů jako součást obecné mediální gramotnosti. Pro autory grafů
plyne z téhož opačná povinnost: zobrazit data tak, aby první dojem odpovídal tomu, co data
říkají. Obecnější rámec obrany proti zkreslování informací nabízí rozcestník
[obrany a kalibrace](@/kompendium/06-obrana/_index.md) a heslo o
[selektivní expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Roozenbeek, J., van der Linden, S., Goldberg, B., Rathje, S., & Lewandowsky, S. (2022). Psychological inoculation improves resilience against misinformation on social media. *Science Advances*, 8(34), eabo6254.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Výběr třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md) – příbuzné heslo (Klamy předpokladu, Cherry picking)
- [Zamlčení důkazů](@/kompendium/argumentacni-fauly/predpoklady-argumentu/zamlceni-dukazu.md) – příbuzné heslo (Klamy předpokladu, Suppressed evidence)
- [McNamarův klam](@/kompendium/argumentacni-fauly/statisticke/mcnamaruv-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, McNamara fallacy)
- [Záměna relativního a absolutního rizika](@/kompendium/argumentacni-fauly/statisticke/relativni-a-absolutni-riziko.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Relative versus absolute risk)
- [Klam důrazu](@/kompendium/argumentacni-fauly/jazykove-klamy/klam-duraznu.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Fallacy of accent)
- [Vytržení z kontextu](@/kompendium/argumentacni-fauly/jazykove-klamy/vytrzeni-z-kontextu.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Quoting out of context)

**V kompendiu**

- [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.7 EA v digitálním věku — algoritmy, AI, generativní modely, deepfakes](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Obrana a kalibrace: obrana proti epistemické anihilaci](@/kompendium/06-obrana/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Klam hledání jinde](@/kompendium/argumentacni-fauly/statisticke/hledani-jinde.md) – předchozí heslo rodiny
- [Záměna relativního a absolutního rizika](@/kompendium/argumentacni-fauly/statisticke/relativni-a-absolutni-riziko.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
