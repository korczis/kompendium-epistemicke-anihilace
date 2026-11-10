+++
title = "Záměna korelace a kauzality"
description = "Klam, který ze souběhu nebo statistické souvislosti dvou jevů vyvozuje, že jeden působí druhý: struktura, detekční znaky, oprávněné užití korelace a obrana."
weight = 2
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-kauzalni", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Záměna korelace a kauzality", "Cum hoc ergo propter hoc", "cum hoc ergo propter hoc", "korelace není kauzalita", "klam souběhu", "Kauzální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-04.02"
catalog_slug = "korelace-a-kauzalita"
catalog_family = "kauzalni"
catalog_family_code = "04"
catalog_family_title = "Kauzální klamy"
catalog_family_en = "Causal fallacies"
catalog_part = "kauzalni"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Cum hoc ergo propter hoc"
catalog_aliases = ["cum hoc ergo propter hoc", "korelace není kauzalita", "klam souběhu"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = ["obracena-kauzalita", "prehlizena-spolecna-pricina"]
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["post-hoc", "obracena-kauzalita", "prehlizena-spolecna-pricina", "zkresleny-vyber", "ekologicky-klam", "simpsonuv-paradox"]
catalog_related_declared = ["post-hoc", "obracena-kauzalita", "prehlizena-spolecna-pricina", "ekologicky-klam", "simpsonuv-paradox", "zkresleny-vyber"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/population-health/_index.md", "kompendium/critical-perspectives/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["glossary/propaganda.md", "kompendium/07-teoreticke-reflexe/politicka-ea.md", "kompendium/argumentacni-fauly/kauzalni/obracena-kauzalita.md", "kompendium/argumentacni-fauly/kauzalni/post-hoc.md", "kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md", "kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "post-hoc"
catalog_next = "jedina-pricina"
catalog_position = 2
catalog_family_size = 9
catalog_sources = ["cook-lewandowsky-ecker-2017", "gigerenzer-2002", "gilovich-1991", "hahn-oaksford-2007", "huff-1954", "kahneman-2011", "mill-1843", "nickerson-1998", "petty-cacioppo-1986", "robinson-1950", "simpson-1951", "tversky-kahneman-1974"]
catalog_sources_primary = []
catalog_sources_roots = ["mill-1843"]
catalog_sources_critical = ["cook-lewandowsky-ecker-2017", "gigerenzer-2002", "gilovich-1991", "hahn-oaksford-2007", "huff-1954", "kahneman-2011", "nickerson-1998", "petty-cacioppo-1986", "robinson-1950", "simpson-1951", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Vztah k technikám kompendia", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/kauzalni.toml"
+++

# Záměna korelace a kauzality

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-04.02` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Cum hoc ergo propter hoc |
| **Jiné názvy** | cum hoc ergo propter hoc, korelace není kauzalita, klam souběhu |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Záměna korelace a kauzality, tradičně označovaná cum hoc ergo propter hoc, je usuzování, které
z toho, že se dva jevy vyskytují spolu nebo se spolu mění, vyvozuje, že jeden z nich působí
druhý. Korelace je statistický vztah: vyšší hodnoty jedné veličiny se systematicky pojí s
vyššími nebo nižšími hodnotami druhé. Kauzalita je vztah působení: zásah do jedné veličiny
změní druhou. Mezi oběma pojmy vede most, ale není to most automatický. Souvislost může vzniknout
proto, že A působí B, ale také proto, že B působí A, že oba jevy vycházejí ze společné příčiny,
že vzorek byl vybrán způsobem, který souvislost vytvořil, nebo že jde o náhodu v malých datech.
Klam spočívá v tom, že se z celého vějíře vysvětlení vybere to jedno, které odpovídá intuici
nebo zájmu mluvčího, a ostatní se mlčky pominou. Na rozdíl od klamu [po tom, tedy kvůli
tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md), kde rozhoduje časová posloupnost,
zde rozhoduje souběh, často zachycený v datech, tabulkách a grafech. Proto se klam vyskytuje
zvlášť často v mediálním zpravodajství o výzkumu a ve veřejné politice (Huff 1954).

## Původ a souvislosti

Rozlišení mezi souvýskytem a příčinností patří k jádru induktivní logiky. Mill mezi svými
metodami uvedl metodu souběžných změn, podle níž lze z toho, že se jeden jev mění spolu s
jiným, usuzovat na příčinné spojení, a zároveň upozornil, že takové spojení může být zprostředkováno
společnou příčinou a že metoda sama o směru vztahu nerozhoduje (Mill 1843). Statistika
přelomu devatenáctého a dvacátého století dala souvislosti kvantitativní podobu v korelačním
koeficientu a s ní přišla i soustavná varování, že vysoký koeficient příčinu neprokazuje.
Dvě klasické práce poloviny dvacátého století ukázaly, jak hluboko může záměna sahat. Robinson
doložil, že korelace mezi souhrnnými údaji za územní celky se může výrazně lišit od korelace
mezi jednotlivci uvnitř těchto celků, takže závěr o lidech vyvozený z dat o regionech může být
zcela mylný (Robinson 1950). Simpson popsal, že souvislost pozorovaná v souhrnné tabulce se
může po rozdělení dat podle třetí proměnné oslabit, zmizet nebo obrátit (Simpson 1951). Huffova
popularizace pak záměnu představila širší veřejnosti jako jeden z nejčastějších způsobů, jak
čísla vypovídají víc, než obsahují (Huff 1954). Dnešní epidemiologie a sociální vědy pracují s
propracovanými nástroji pro rozlišení souvislosti a působení, ale v běžné řeči se záměna drží
stejně pevně jako dříve.

## Struktura argumentu

Kostra argumentu má tři kroky. Pozorování: jevy X a Y se vyskytují spolu. Výklad: X působí Y.
Doporučení: změňme X, abychom změnili Y. Druhý krok je místem klamu, protože pomíjí čtyři
alternativní cesty, kterými souvislost mohla vzniknout. První je [obrácená
kauzalita](@/kompendium/argumentacni-fauly/kauzalni/obracena-kauzalita.md): Y působí X. Druhá je
[přehlížená společná příčina](@/kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md):
Z působí X i Y. Třetí je výběr: souvislost vznikla tím, jak byli do dat zařazeni lidé nebo
případy, například proto, že se do nemocnice dostanou jen ti, u nichž se sešly dva problémy.
Čtvrtá je náhoda, zvlášť pravděpodobná tam, kde se z velkého množství proměnných vybere ta
dvojice, která spolu náhodou souvisí. Třetí krok, doporučení, pak přenáší chybu do jednání. Je-li
souvislost dána společnou příčinou, zásah do X na Y nic nezmění, a pokud je obrácená, může
dokonce uškodit.

V přesvědčovací komunikaci se struktura zkracuje. Mluvčí uvede jen pozorování a doporučení a
výklad ponechá na posluchači, který ho doplní sám. Tento jev souvisí s tím, že lidská mysl
konstruuje příčinné příběhy rychle a s velkou jistotou, i když pracuje jen s tím, co má právě
před sebou (Kahneman 2011).

## Detekční znaky

Prvním znakem je slovník, který posouvá souvislost k působení: „vede k“, „zvyšuje“, „chrání
před“, „je spojeno s“ v nadpisu a „způsobuje“ v závěru. Druhým znakem je chybějící zmínka o
designu výzkumu; observační data se podávají stejně jako výsledky experimentu. Třetím znakem je
absence otázky, kdo do souboru patří a kdo ne. Čtvrtým je doporučení zásahu, které z dat
přímo neplyne, například výzva ke změně jídelníčku na základě průřezové studie. Pátým znakem je
selektivita: ze souboru mnoha sledovaných souvislostí se veřejnosti podá ta, která je
nejpřekvapivější nebo nejlépe zapadá do již existujícího přesvědčení. Výzkum potvrzovacího
zkreslení ukazuje, že lidé hodnotí souvislosti, které odpovídají jejich očekávání, jako silnější,
než jaké skutečně jsou, a vidí je i tam, kde nejsou (Nickerson 1998). Šestým znakem je přechod
mezi úrovněmi: z dat o skupinách, státech nebo regionech se vyvozují závěry o jednotlivcích,
na což upozornil již Robinson (Robinson 1950); tomuto posunu se věnuje heslo [ekologický
klam](@/kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md).

## Odlišení od platné argumentace

Korelace není bezcenná. Je to legitimní důkaz, který zvyšuje pravděpodobnost příčinné hypotézy,
pokud ostatní vysvětlení méně dobře odpovídají datům. Platný argument od korelace k příčině proto
neopouští korelaci, ale doplňuje ji. Ptá se po časovém pořadí, po síle a konzistenci souvislosti
v různých souborech, po vztahu dávky a účinku, po přiměřeném mechanismu, po výsledcích
experimentů a po tom, zda souvislost přetrvá po zohlednění kandidátů na společnou příčinu.
Bayesovská analýza neformálních argumentů vysvětluje, proč tento postup dává smysl: hodnota
důkazu je dána tím, o kolik pravděpodobnější je pod jednou hypotézou než pod druhou, a tato
hodnota roste, když se alternativní hypotézy postupně oslabí (Hahn a Oaksford 2007). Rozumný
mluvčí tedy říká „souvisí“ tam, kde má jen souvislost, a „působí“ až tam, kde má důkazy, které
konkurenční vysvětlení vylučují. Zcela platné je také užití korelace k předpovědi bez nároku na
příčinnost: počet deštníků na ulici dobře předpovídá déšť, i když déšť nezpůsobuje.

## Stav poznání

Psychologický výzkum soustavně doložil, že lidé vnímají souvislosti tam, kde je očekávají, a
přeceňují jejich sílu. Tversky a Kahneman popsali jev iluzorní korelace v rámci heuristiky
dostupnosti: dvojice událostí, které se snadno vybavují spolu, se zdají spojené častěji, než
odpovídá skutečnosti (Tversky a Kahneman 1974). Nickerson shrnul doklady, že lidé při
hodnocení vztahů věnují nepřiměřenou pozornost případům, kde se oba jevy vyskytují spolu, a
přehlížejí případy, kde se vyskytuje jen jeden z nich (Nickerson 1998). Gilovich ukázal, jak
tyto mechanismy vedou k pevným přesvědčením v oblasti zdraví a každodenního života, která data
nepodporují (Gilovich 1991). Statistická literatura zase doložila, že i správně spočítaná
souvislost může mít zavádějící význam, pokud se pomine úroveň analýzy nebo třetí proměnná
(Robinson 1950; Simpson 1951). V oblasti komunikace rizik Gigerenzer upozornil, že laická i
odborná veřejnost má potíže s interpretací statistických údajů a že způsob jejich podání
ovlivňuje, jaký závěr si z nich lidé vyvodí (Gigerenzer 2002). Shoda panuje v tom, že
rozpoznání záměny vyžaduje znalost designu výzkumu, nejen obecné povědomí, že „korelace není
kauzalita“; samotné heslo se dá použít i k neoprávněnému odmítnutí dobře doložené příčinné
souvislosti.

## Vztah k technikám kompendia

Záměna korelace a kauzality se v kontextech, kterými se kompendium zabývá, objevuje především
tam, kde se legitimizuje metoda nebo skupina. Prezentace výcvikových programů a terapeutických
nabídek uvádějí, že jejich absolventi jsou úspěšnější, spokojenější nebo zdravější, a pomíjejí,
že do programu vstupují lidé s vyšší motivací a lepšími zdroji. Politická [propaganda](@/glossary/propaganda.md) zase
spojuje nežádoucí jevy s přítomností určité skupiny a vytváří dojem příčinného vztahu, který
data nenesou; souvislosti s tímto užitím rozebírá stránka [politická a ideologická
EA](@/kompendium/07-teoreticke-reflexe/politicka-ea.md). Petty a Cacioppo ukázali, že lidé, kteří
nemají motivaci nebo možnost argument podrobně zpracovat, se řídí vnějšími znaky přesvědčivosti
a nikoli kvalitou důkazů (Petty a Cacioppo 1986); graf nebo číslo s odkazem na „studii“ takovým
znakem snadno bývá.

## Obrana a odpověď

Odpověď na záměnu nemusí být odmítnutím. Účinnější je položit otázky, které ukáží, co by
argument potřeboval. Jakým způsobem byla data získána, pozorováním, nebo experimentem? Mohl by
vztah vést opačným směrem? Je možné, že obojí vychází z něčeho třetího, například z věku,
příjmu nebo zdravotního stavu? Jak byli lidé do souboru vybráni? Kolik dalších souvislostí se
zkoumalo a proč se zveřejňuje právě tato? Tyto otázky odpovídají struktuře, kterou již Mill
popsal jako nutné podmínky usuzování na příčinu (Mill 1843). Při čtení mediálních zpráv o
výzkumu pomáhá vrátit se k původnímu sdělení a zjistit, zda autoři sami mluví o příčinnosti,
nebo jen o souvislosti (Huff 1954). Proti zneužití opačným směrem je třeba připomenout, že
heslo „korelace není kauzalita“ neruší váhu souvislostí, které byly ověřeny mnoha nezávislými
cestami. Ve sporu, kde jedna strana odmítá každý doklad poukazem na to, že jde „jen o
korelaci“, je legitimní se ptát, jaký typ důkazu by ji přesvědčil, a zda je takový důkaz vůbec
eticky a prakticky dosažitelný. Obecné povědomí o heuristikách, které záměnu živí, podává
stránka [Tversky a Kahneman: heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md),
a výzkum inokulace naznačuje, že předem vysvětlená zavádějící technika ztrácí část své síly
(Cook, Lewandowsky a Ecker 2017).

## Literatura

- Cook, J., Lewandowsky, S., & Ecker, U. K. H. (2017). Neutralizing misinformation through inoculation: Exposing misleading argumentation techniques reduces their influence. *PLoS ONE*, 12(5), e0175799.
- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Robinson, W. S. (1950). Ecological correlations and the behavior of individuals. *American Sociological Review*, 15(3), 351–357.
- Simpson, E. H. (1951). The interpretation of interaction in contingency tables. *Journal of the Royal Statistical Society, Series B*, 13(2), 238–241.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Obrácená kauzalita](@/kompendium/argumentacni-fauly/kauzalni/obracena-kauzalita.md) – zvláštní případ tohoto hesla
- [Přehlížená společná příčina](@/kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md) – zvláštní případ tohoto hesla

**Příbuzná hesla**

- [Po tom, tedy kvůli tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md) – příbuzné heslo (Kauzální klamy, Post hoc ergo propter hoc)
- [Obrácená kauzalita](@/kompendium/argumentacni-fauly/kauzalni/obracena-kauzalita.md) – příbuzné heslo (Kauzální klamy, Reverse causation)
- [Přehlížená společná příčina](@/kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md) – příbuzné heslo (Kauzální klamy, Ignoring a common cause)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [Ekologický klam](@/kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Ecological fallacy)
- [Simpsonův paradox](@/kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Simpson's paradox)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Populační zdraví a prevence](@/kompendium/population-health/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kritické perspektivy – meze rámce epistemické anihilace](@/kompendium/critical-perspectives/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Po tom, tedy kvůli tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md) – předchozí heslo rodiny
- [Jediná příčina](@/kompendium/argumentacni-fauly/kauzalni/jedina-pricina.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
