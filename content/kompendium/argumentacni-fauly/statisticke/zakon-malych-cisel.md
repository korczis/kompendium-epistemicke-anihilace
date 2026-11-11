+++
title = "Zákon malých čísel"
description = "Intuice, že i malý vzorek věrně zrcadlí populaci: proč se z několika případů usuzuje příliš mnoho, jak to poznat v datech i v rozhovoru a jak na to odpovědět."
weight = 7
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Zákon malých čísel", "Law of small numbers", "víra v zákon malých čísel", "necitlivost k velikosti vzorku", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.07"
catalog_slug = "zakon-malych-cisel"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Law of small numbers"
catalog_aliases = ["víra v zákon malých čísel", "necitlivost k velikosti vzorku"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = ["hracsky-klam"]
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["ukvapene-zobecneni", "texasky-strelec", "klam-regrese", "klam-konjunkce", "hracsky-klam", "horka-ruka", "zkresleny-vyber", "zavadejici-zivost", "hledani-jinde", "jeden-studie"]
catalog_related_declared = ["ukvapene-zobecneni", "hracsky-klam", "horka-ruka", "jeden-studie", "hledani-jinde", "zkresleny-vyber"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/02-uvod/metodologicke-poznamky.md", "kompendium/techniques/ea-7-3-1-kahneman-system12.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/02-uvod/metodologicke-poznamky.md", "kompendium/argumentacni-fauly/statisticke/horka-ruka.md", "kompendium/argumentacni-fauly/statisticke/hracsky-klam.md"]
catalog_prev = "zkresleny-vyber"
catalog_next = "klam-zalobce"
catalog_position = 7
catalog_family_size = 16
catalog_sources = ["damer-2009", "gilovich-1991", "govier-2010", "kahneman-2011", "tversky-kahneman-1971", "tversky-kahneman-1974"]
catalog_sources_primary = ["damer-2009", "govier-2010"]
catalog_sources_roots = []
catalog_sources_critical = ["gilovich-1991", "kahneman-2011", "tversky-kahneman-1971", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.toml"
+++

# Zákon malých čísel

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.07` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Law of small numbers |
| **Jiné názvy** | víra v zákon malých čísel, necitlivost k velikosti vzorku |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Zákon malých čísel je ironické označení pro intuici, podle níž se zákon velkých čísel
uplatňuje i na malé vzorky. Člověk, který mu podléhá, očekává, že i několik případů bude
věrně zrcadlit populaci, ze které pochází: že malá studie ukáže totéž co velká, že pár
zkušeností vypovídá o celku, že výkyv v malém souboru je signálem, a ne šumem. Tversky a
Kahneman tento jev popsali na odbornících, kteří by ho měli znát nejlépe, na výzkumných
psycholozích, a ukázali, že i oni přeceňují stabilitu výsledků z malých vzorků a
podceňují, jak silně takové výsledky kolísají (Tversky a Kahneman 1971).

Heslo je v katalogu vedeno převážně jako chyba uvažování, protože jeho typickou podobou
není taktika, ale přirozený sklon, kterému podléhají i statisticky vzdělaní výzkumníci
(Tversky a Kahneman 1971). Jeho důsledky však vlivové užití snadno přebírá: kdo
předloží výsledek malého pilotního projektu, jednu úspěšnou obec nebo pár spokojených
klientů jako doklad účinku, staví na tom, že posluchač malým číslům věří víc, než by měl.

## Původ a souvislosti

V původní studii odpovídali účastníci odborných setkání na otázky o plánování výzkumu a
interpretaci výsledků. Odpovědi ukázaly několik soustavných chyb: účastníci očekávali, že se
výsledek z malého vzorku zopakuje s vysokou pravděpodobností i v dalším malém vzorku,
doporučovali příliš malé vzorky pro replikaci a když se výsledek nezopakoval, hledali
zvláštní příčinu místo toho, aby počítali s náhodným kolísáním (Tversky a Kahneman 1971).
Autoři to vysvětlili tím, že lidé považují vzorek za reprezentativní bez ohledu na jeho
velikost. Téhož vysvětlení později použili pro řadu dalších jevů, včetně necitlivosti k
velikosti vzorku: když účastníci odhadovali, ve které ze dvou porodnic, větší, nebo menší,
bude více dní s nápadně vysokým podílem narozených chlapců, většina odpověděla, že v obou
stejně, ačkoli menší porodnice má takových dní nutně víc (Tversky a Kahneman 1974).

Kahneman později ukázal, jak snadno malá čísla vytvářejí příběhy. Pokud se porovnávají
oblasti nebo instituce různé velikosti, objeví se mezi nejlepšími i nejhoršími
nepřiměřeně často ty malé, protože malé soubory víc kolísají. Kdo vidí jen jeden konec
rozdělení, například jen nejlepší malé školy, snadno vymyslí vysvětlení, proč je malá škola
lepší, a přehlédne, že malé školy jsou zastoupeny i mezi nejhoršími (Kahneman 2011). Z
tohoto sklonu vyrůstají i [hráčský klam](@/kompendium/argumentacni-fauly/statisticke/hracsky-klam.md)
a víra v [horkou ruku](@/kompendium/argumentacni-fauly/statisticke/horka-ruka.md): obě
očekávají, že krátký úsek náhodné řady bude mít stejnou podobu jako celý proces.

## Struktura argumentu

Argument má tuto stavbu. První premisa uvádí, že v malém vzorku S byl pozorován výsledek V,
často nápadný: velký účinek, vysoký výskyt, výrazný rozdíl. Závěr tvrdí, že V platí v
populaci, nebo že se V v dalším vzorku zopakuje. Vadný je skrytý předpoklad, že velikost
vzorku pro spolehlivost výsledku nehraje roli. Malý vzorek přitom dává odhad zatížený
velkou nejistotou a extrémní výsledky v něm vznikají často náhodou. Pokud se navíc z
mnoha malých vzorků vybere ten nejnápadnější, je výsledek téměř jistě nadsazený, protože
výběr zachytil i náhodnou odchylku. Učebnice neformální logiky řadí takové úvahy mezi
argumenty z nedostatečného vzorku a zdůrazňují, že síla induktivního závěru závisí na
počtu případů i na tom, zda zastupují populaci (Govier 2010; Damer 2009).

Druhou podobou je obrácený úsudek z nezopakovaného výsledku. Když malá replikace výsledek
nepotvrdí, hledá se zvláštní příčina rozdílu, například jiné prostředí nebo jiný
experimentátor, místo aby se uvážilo, že oba výsledky mohou být jen dvěma náhodnými tahy z
téhož kolísavého procesu (Tversky a Kahneman 1971). Obě podoby mají společné to, že
signál a šum se v nich rozlišují podle nápadnosti, ne podle velikosti vzorku.

## Detekční znaky

Prvním znakem je výrazný výsledek z malého souboru podaný bez údaje o nejistotě: „v
pilotu se to osvědčilo“, „u nás ve vsi je to častější“, „všichni tři, které znám“. Druhým
znakem je mapa, žebříček nebo srovnání jednotek velmi rozdílné velikosti, v nichž se
nejvyšší a nejnižší hodnoty soustředí u nejmenších jednotek. Třetím znakem je očekávání, že
replikace je formalita. Čtvrtým znakem je vysvětlování každého výkyvu příčinou: nová
politika, nový vedoucí, změna počasí, přičemž údaje za delší období nebo za větší celky
se neuvádějí. Pátým znakem je anekdota jako doklad; jednotlivý případ je nejmenším možným
vzorkem a jeho přesvědčivost plyne z názornosti, ne z vypovídací hodnoty. Gilovich
upozorňuje, že lidé vyvozují z málo dat příliš mnoho zejména tehdy, když data potvrzují
to, co už si myslí (Gilovich 1991).

V odborném prostředí se klam projevuje i jako přeceňování jednotlivých studií, protože i odborníci
přeceňují, s jakou pravděpodobností se výsledek malého vzorku zopakuje (Tversky a Kahneman 1971).
Mediální zprávy o „průlomovém“ výsledku malé studie, který se později nepotvrdí, jsou typickým
dokladem; kniha k obecnějším otázkám spolehlivosti poznatků odkazuje v
[metodologických poznámkách k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md).

## Odlišení od platné argumentace

Malý vzorek není bezcenný. Pilotní studie, kazuistika nebo několik pozorování mohou
oprávněně sloužit jako zdroj hypotézy, jako signál, který stojí za ověření, nebo jako
protipříklad, který vyvrací tvrzení „vždy“ či „nikdy“. Jediný dobře doložený případ stačí k
vyvrácení univerzálního tvrzení, protože vyvrácení nepotřebuje statistickou sílu. Platné je
také usuzování z malého vzorku tam, kde je populace velmi homogenní nebo kde je účinek
obrovský ve srovnání s přirozeným kolísáním. Klamem se úvaha stává, když se výsledek malého
vzorku podává jako spolehlivý odhad populace nebo jako jistá předpověď replikace (Tversky a
Kahneman 1971). Rozumný posuzovatel proto rozlišuje mezi tím, co malý vzorek naznačuje, a
tím, co dokazuje.

Existuje i opačná chyba, kterou je dobré odlišit. Kdo odmítá každý výsledek jen proto, že vzorek je
malý, a nepožaduje přitom žádná lepší data, nepoužívá kritiku k ověřování, ale k odmítnutí
nepohodlného zjištění. Gilovich popisuje tuto asymetrii obecně: u vítaného závěru se lidé ptají, zda
mu mohou věřit, u nevítaného, zda mu věřit musí, a přísnější měřítko pak nacházejí právě v metodě
(Gilovich 1991). Námitka velikosti vzorku je oprávněná tehdy, když vede k otázce, jaký vzorek by
stačil a kdo ho může získat; tehdy slouží poznání, ne obraně předem přijatého názoru.

## Stav poznání

Víra v zákon malých čísel patří k základním zjištěním výzkumu heuristik a zkreslení a byla
opakovaně doložena u laiků i odborníků (Tversky a Kahneman 1971; Tversky a Kahneman 1974).
Kahneman ji později uvedl jako příklad toho, že ani statistické vzdělání nechrání před
intuicí, pokud se nestane návykem, a připomněl, že sám ji u sebe v počátcích kariéry
pozoroval při plánování výzkumu (Kahneman 2011). Problém má i institucionální rozměr.
Debata o replikovatelnosti psychologického a biomedicínského výzkumu v posledních letech
ukázala, že mnoho publikovaných výsledků malých studií se ve větších replikacích
nepotvrdilo nebo vyšlo slabších. Tato debata je v podstatě rozsáhlou ilustrací původního
varování: výsledky z malých vzorků kolísají víc, než intuice očekává, a výběr nápadných
výsledků k publikaci jejich nadsázku ještě zesiluje. Gilovich zdůrazňuje, že stejný
mechanismus působí i v každodenním usuzování z osobní zkušenosti (Gilovich 1991).

## Obrana a odpověď

Základní obranou je otázka po velikosti vzorku a po nejistotě: na kolika případech výsledek
stojí a jak by vypadal, kdyby šlo jen o náhodné kolísání? Druhou obranou je hledat druhý
konec rozdělení. Pokud se mezi nejlepšími objevují malé jednotky, je užitečné ověřit, zda
nejsou i mezi nejhoršími; pokud ano, jde pravděpodobně o kolísání, ne o účinek (Kahneman
2011). Třetí obranou je trvat na replikaci: výsledek malé studie je hypotéza, ne závěr, a
jeho potvrzení v nezávislém a větším souboru není formalitou. Čtvrtou obranou je u
osobních zkušeností připomenout, že jednotlivý případ je vzorkem velikosti jedna.

Pro odborníky, kteří výsledky interpretují nebo o nich rozhodují, je užitečné uvádět u
každého výsledku velikost vzorku a interval nejistoty a odolat pokušení vysvětlovat každý
výkyv příčinou. Tversky a Kahneman doporučovali výzkumníkům počítat s velikostí vzorku
výslovně, místo aby se spoléhali na intuici o tom, kolik případů „stačí“ (Tversky a Kahneman
1971). V rozhovoru, kde se malé číslo používá jako argument, pomáhá klidně oddělit
názornost případu od jeho vypovídací hodnoty a navrhnout, jaká data by závěr skutečně
podpořila.

## Literatura

- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Govier, T. (2010). *A Practical Study of Argument* (7. vyd.). Belmont: Wadsworth.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Tversky, A., & Kahneman, D. (1971). Belief in the law of small numbers. *Psychological Bulletin*, 76(2), 105–110.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Hráčský klam](@/kompendium/argumentacni-fauly/statisticke/hracsky-klam.md) – zvláštní případ tohoto hesla

**Příbuzná hesla**

- [Ukvapené zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/ukvapene-zobecneni.md) – příbuzné heslo (Klamy předpokladu, Hasty generalisation)
- [Texaský střelec](@/kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md) – příbuzné heslo (Kauzální klamy, Texas sharpshooter)
- [Klam regrese](@/kompendium/argumentacni-fauly/kauzalni/klam-regrese.md) – příbuzné heslo (Kauzální klamy, Regression fallacy)
- [Klam konjunkce](@/kompendium/argumentacni-fauly/statisticke/klam-konjunkce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Conjunction fallacy)
- [Hráčský klam](@/kompendium/argumentacni-fauly/statisticke/hracsky-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Gambler's fallacy)
- [Horká ruka](@/kompendium/argumentacni-fauly/statisticke/horka-ruka.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Hot-hand fallacy)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [Zavádějící živost](@/kompendium/argumentacni-fauly/statisticke/zavadejici-zivost.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Misleading vividness)
- [Klam hledání jinde](@/kompendium/argumentacni-fauly/statisticke/hledani-jinde.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Look-elsewhere effect)
- [Argument jedinou studií](@/kompendium/argumentacni-fauly/hodnoty-a-veda/jeden-studie.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Single-study fallacy)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.1 Kahneman: Systém 1 a 2](@/kompendium/techniques/ea-7-3-1-kahneman-system12.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – předchozí heslo rodiny
- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
