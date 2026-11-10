+++
title = "Záměna relativního a absolutního rizika"
description = "Klam, při kterém se změna rizika sdělí jen relativně, bez výchozí četnosti: proč „o polovinu vyšší riziko“ může znamenat zanedbatelný rozdíl a jak se ptát."
weight = 16
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-statisticke", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Záměna relativního a absolutního rizika", "Relative versus absolute risk", "klam relativního rizika", "zamlčený základ procent", "Statistické a pravděpodobnostní klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-05.16"
catalog_slug = "relativni-a-absolutni-riziko"
catalog_family = "statisticke"
catalog_family_code = "05"
catalog_family_title = "Statistické a pravděpodobnostní klamy"
catalog_family_en = "Statistical and probabilistic fallacies"
catalog_part = "statisticke.b"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Relative versus absolute risk"
catalog_aliases = ["klam relativního rizika", "zamlčený základ procent"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["odvolani-na-strach", "zamlceni-dukazu", "zanedbani-zakladni-miry", "klam-zalobce", "klam-obhajce", "zavadejici-graf"]
catalog_related_declared = ["zanedbani-zakladni-miry", "zavadejici-graf", "odvolani-na-strach", "klam-obhajce", "zamlceni-dukazu"]
catalog_kompendium = ["kompendium/population-health/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/06-klinicke-aplikace/preventivni-strategie.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/06-klinicke-aplikace/preventivni-strategie.md", "kompendium/argumentacni-fauly/relevance/odvolani-na-strach.md", "kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md", "kompendium/argumentacni-fauly/statisticke/zavadejici-graf.md", "kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md", "kompendium/population-health/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "zavadejici-graf"
catalog_next = ""
catalog_position = 16
catalog_family_size = 16
catalog_sources = ["gigerenzer-2002", "huff-1954", "kahneman-2011", "tversky-kahneman-1981"]
catalog_sources_primary = []
catalog_sources_roots = []
catalog_sources_critical = ["gigerenzer-2002", "huff-1954", "kahneman-2011", "tversky-kahneman-1981"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/statisticke.b.toml"
+++

# Záměna relativního a absolutního rizika

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-05.16` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Relative versus absolute risk |
| **Jiné názvy** | klam relativního rizika, zamlčený základ procent |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | vysoké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Záměna relativního a absolutního rizika je klam, při kterém se o velikosti rizika nebo přínosu
usuzuje z relativní změny, aniž by byla známa výchozí četnost, k níž se změna vztahuje.
Relativní údaj říká, o kolik procent se riziko změnilo vůči výchozímu stavu. Absolutní údaj
říká, o kolik se změnil podíl lidí, kterých se událost skutečně týká. Pokud je událost vzácná,
může velká relativní změna znamenat nepatrný absolutní rozdíl, a pokud je častá, může malá
relativní změna znamenat rozdíl velký. Sdělení „riziko stoupá o polovinu“ tak samo o sobě
nevypovídá o tom, zda jde o věc, která by měla ovlivnit rozhodování. Gigerenzer ukazuje, že
relativní vyjádření přínosu léčby nebo rizika expozice působí na pacienty, lékaře i novináře
výrazně silněji než absolutní vyjádření týchž dat, a označuje ho za jeden z hlavních zdrojů
nedorozumění při komunikaci rizik (Gigerenzer 2002). Klam je příbuzný se
[zanedbáním základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md),
protože v obou případech se z úvahy vytrácí výchozí četnost jevu.

## Původ a souvislosti

Upozornění, že procento bez uvedení základu může klamat, patří k nejstarším tématům populární
kritiky statistiky. Huff ukazoval, jak se z procent počítaných z různých základů, nebo z
procent bez základu vůbec, dá vytvořit dojem velké změny tam, kde se skutečně změnilo málo
(Huff 1954). Systematicky se problémem zabýval výzkum komunikace rizik v medicíně. Gigerenzer
rozlišuje relativní snížení rizika, absolutní snížení rizika a počet lidí, které je nutno
léčit, aby jeden z nich měl z léčby prospěch, a dokládá, že tytéž výsledky klinických studií
vedou podle formy podání k velmi odlišným úsudkům (Gigerenzer 2002). Psychologický základ
poskytl výzkum rámcování: Tversky a Kahneman ukázali, že logicky rovnocenná vyjádření téže
volby vedou k odlišným preferencím podle toho, jak jsou formulována (Tversky a Kahneman 1981).
Relativní a absolutní riziko jsou dvě takové formulace téhož výsledku a jejich psychologický
účinek se liší. Doporučení pro podávání zpráv o klinických studiích, jako je CONSORT, proto
žádají, aby se u dvouhodnotových výsledků uváděla absolutní i relativní velikost účinku. V
kompendiu se tato problematika dotýká
[populačního zdraví](@/kompendium/population-health/_index.md), kde se o rizicích komunikuje
s celými populacemi a kde zkreslený údaj může vyvolat zbytečný strach nebo falešný pocit
bezpečí.

## Struktura argumentu

Argument má obvykle tuto stavbu: expozice nebo zásah mění riziko o určité procento, a proto je
změna velká a vyžaduje zásadní reakci. Mezi premisou a závěrem chybí údaj, bez kterého nelze
o velikosti změny nic říci, totiž výchozí četnost. Zdvojnásobení rizika, které postihne
jednoho člověka z deseti tisíc, znamená jednoho postiženého navíc na deset tisíc lidí.
Zdvojnásobení rizika, které postihne každého desátého, znamená tisíc postižených navíc na
tentýž počet. Relativní číslo je v obou případech stejné. Klam bývá posílen několika
souvisejícími posuny. Přínos zásahu se uvádí relativně, kdežto jeho nežádoucí účinky absolutně,
takže přínos vypadá velký a riziko malé, nebo naopak. Procentní body se zaměňují s procenty.
Poměr šancí se vykládá jako poměr rizik, ačkoli se u častých jevů mohou podstatně lišit. A
nakonec se riziko vztahuje k neurčené referenční třídě, takže není jasné, o koho a o jaké
časové období jde (Gigerenzer 2002). Kahneman popisuje příbuzný jev zanedbávání jmenovatele,
kdy se pozornost upíná k počtu postižených nebo k síle změny a [velikost celku](@/kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md), k němuž se
vztahují, ustupuje do pozadí (Kahneman 2011).

## Detekční znaky

Prvním a nejspolehlivějším znakem je procento změny bez údaje o tom, z čeho se počítá.
Formulace „o třetinu vyšší“, „dvojnásobné riziko“ nebo „snižuje úmrtnost o čtvrtinu“ bez
výchozí četnosti by měla vždy vyvolat otázku po absolutních číslech. Druhým znakem je
asymetrické vyjádření přínosu a rizika v témž sdělení. Třetím znakem je titulek, který mluví
o dramatickém nárůstu, zatímco text článku, pokud vůbec, uvádí výchozí četnost až v závěru.
Čtvrtým znakem je chybějící časové období a chybějící populace: riziko čeho, u koho a za jak
dlouho. Pátým znakem je spojení relativního údaje se silnou emocí, typicky se strachem z
nemoci nebo z nového jevu, kde se klam setkává s
[odvoláním na strach](@/kompendium/argumentacni-fauly/relevance/odvolani-na-strach.md).
Huff připomínal, že číslo, u něhož chybí nějaký podstatný údaj, je třeba číst s otázkou, co
v něm chybí (Huff 1954). V případě relativního rizika je chybějícím údajem téměř vždy výchozí
četnost. Šestým znakem je graf, který zobrazuje relativní změnu tak, že vzácná událost
vypadá jako běžná, což popisuje heslo o
[zavádějícím grafu](@/kompendium/argumentacni-fauly/statisticke/zavadejici-graf.md).

## Odlišení od platné argumentace

Relativní riziko není samo o sobě zavádějící. Je to užitečná míra pro srovnání účinku napříč
populacemi s různým výchozím rizikem, pro hledání příčin a pro výzkum, kde se zkoumá síla
souvislosti. Epidemiologie s ním pracuje legitimně a vědecký článek, který uvádí relativní
riziko i s intervalem spolehlivosti a s výchozími četnostmi ve skupinách, neklame. Klam vzniká
teprve tehdy, když se relativní údaj použije k rozhodování o jednotlivci nebo k veřejnému
sdělení bez absolutního kontextu. Platná komunikace rizika uvádí obě míry, vztahuje je k
určité populaci a časovému období a ideálně je vyjadřuje v přirozených četnostech, tedy jako
počty lidí z představitelně velké skupiny (Gigerenzer 2002). Platné je také výslovně
vyjádřit, že výchozí riziko se mezi lidmi liší, takže tatáž relativní změna má pro různé lidi
různý význam. Lékař, který pacientovi řekne, o kolik procent lék snižuje riziko a co to
znamená pro lidi s jeho výchozím rizikem, nepoužívá relativní údaj k manipulaci, ale k
informovanému rozhodnutí. Výzkum rámcování dodává, že ani tehdy nelze účinek formy podání zcela
odstranit, a proto je férové nabídnout více rámců současně (Tversky a Kahneman 1981).

## Stav poznání

Že forma podání rizika ovlivňuje úsudek, patří k dobře doloženým poznatkům. Studie, které
Gigerenzer shrnuje, opakovaně ukazují, že lékaři i pacienti hodnotí léčbu příznivěji, je-li
její přínos vyjádřen jako relativní snížení rizika, než když jsou tytéž výsledky podány jako
absolutní snížení nebo jako počet lidí, které je nutno léčit (Gigerenzer 2002). Obecnější
výzkum rámcování dokládá, že rovnocenné formulace vedou k odlišným volbám i v situacích, kde
o nic osobně nejde (Tversky a Kahneman 1981). Kahneman popisuje, že u vzácných událostí lidé
často buď přeceňují jejich pravděpodobnost, nebo je zcela přehlížejí, a že živě podané
sdělení o vzácném riziku tento sklon k přecenění posiluje (Kahneman 2011). Výzkum také
ukazuje, že porozumění se zlepšuje, když se rizika podávají v absolutních číslech a
přirozených četnostech, protože takové vyjádření nevyžaduje přepočet podmíněných
pravděpodobností (Gigerenzer 2002).
Otevřené zůstává, jak dosáhnout toho, aby se doporučení o úplném sdělování rizik uplatňovala
i ve zpravodajství, kde je relativní údaj atraktivnější pro titulek.

## Obrana a odpověď

Základní obranou je položit tři otázky: z kolika na kolik se riziko mění, u jaké skupiny lidí a
za jaké období. Bez odpovědí na ně nelze relativní údaj posoudit (Gigerenzer 2002). Užitečné je
přepočítat sdělení do přirozených četností a představit si skupinu lidí, například tisíc nebo
deset tisíc, a zjistit, kolik z nich je postiženo bez expozice a kolik s ní. Tento přepis
často sám ukáže, zda jde o rozdíl, který by měl měnit rozhodnutí. U léčby je vhodné ptát se po
počtu lidí, které je nutno léčit, aby jeden měl prospěch, a po počtu lidí, u nichž se objeví
nežádoucí účinek, protože teprve tato dvě čísla umožní přínos a riziko porovnat ve stejných
jednotkách. U zpráv v médiích pomáhá dohledat původní studii nebo tiskovou zprávu, kde bývají
absolutní údaje uvedeny (Huff 1954). Pro odborníky, kteří rizika sdělují, plyne z výzkumu
povinnost uvádět obě míry a nepoužívat relativní číslo tam, kde by absolutní číslo vedlo
příjemce k jinému úsudku (Tversky a Kahneman 1981). Rámec preventivních opatření, v němž se o
takových sděleních rozhoduje, popisuje kapitola o
[preventivních strategiích](@/kompendium/06-klinicke-aplikace/preventivni-strategie.md), a
souvislost s heuristikami úsudku rozebírá heslo o
[heuristikách Tverského a Kahnemana](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Tversky, A., & Kahneman, D. (1981). The framing of decisions and the psychology of choice. *Science*, 211(4481), 453–458.

## Související

**Rodina a hierarchie**

- [Statistické a pravděpodobnostní klamy](@/kompendium/argumentacni-fauly/statisticke/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Odvolání na strach](@/kompendium/argumentacni-fauly/relevance/odvolani-na-strach.md) – příbuzné heslo (Klamy relevance, Appeal to fear)
- [Zamlčení důkazů](@/kompendium/argumentacni-fauly/predpoklady-argumentu/zamlceni-dukazu.md) – příbuzné heslo (Klamy předpokladu, Suppressed evidence)
- [Zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Base-rate neglect)
- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Prosecutor's fallacy)
- [Klam obhájce](@/kompendium/argumentacni-fauly/statisticke/klam-obhajce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Defence attorney's fallacy)
- [Zavádějící graf](@/kompendium/argumentacni-fauly/statisticke/zavadejici-graf.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Misleading graph)

**V kompendiu**

- [Populační zdraví a prevence](@/kompendium/population-health/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.9 Preventivní strategie](@/kompendium/06-klinicke-aplikace/preventivni-strategie.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Zavádějící graf](@/kompendium/argumentacni-fauly/statisticke/zavadejici-graf.md) – předchozí heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
