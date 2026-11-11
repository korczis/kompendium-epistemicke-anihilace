+++
title = "Přehlížená společná příčina"
description = "Klam, který souvislost dvou jevů vykládá jako působení jednoho na druhý, ačkoli oba vycházejí ze třetí okolnosti: struktura, znaky, statistické pozadí a obrana."
weight = 5
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-kauzalni", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Přehlížená společná příčina", "Ignoring a common cause", "skrytá třetí proměnná", "matoucí proměnná", "zavádějící souvislost", "Kauzální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-04.05"
catalog_slug = "prehlizena-spolecna-pricina"
catalog_family = "kauzalni"
catalog_family_code = "04"
catalog_family_title = "Kauzální klamy"
catalog_family_en = "Causal fallacies"
catalog_part = "kauzalni"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Ignoring a common cause"
catalog_aliases = ["skrytá třetí proměnná", "matoucí proměnná", "zavádějící souvislost"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "korelace-a-kauzalita"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["korelace-a-kauzalita"]
catalog_related = ["korelace-a-kauzalita", "obracena-kauzalita", "zjednodusena-kauzalita", "zkresleny-vyber", "ekologicky-klam", "simpsonuv-paradox"]
catalog_related_declared = ["obracena-kauzalita", "simpsonuv-paradox", "ekologicky-klam", "zkresleny-vyber", "zjednodusena-kauzalita"]
catalog_kompendium = ["kompendium/population-health/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/forensic-legal/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md", "kompendium/argumentacni-fauly/kauzalni/obracena-kauzalita.md", "kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md", "kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md", "kompendium/population-health/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "obracena-kauzalita"
catalog_next = "texasky-strelec"
catalog_position = 5
catalog_family_size = 9
catalog_sources = ["gigerenzer-2002", "hahn-oaksford-2007", "huff-1954", "kahneman-2011", "lifton-1961", "mercier-sperber-2011", "mill-1843", "nickerson-1998", "robinson-1950", "simpson-1951", "tversky-kahneman-1974"]
catalog_sources_primary = []
catalog_sources_roots = ["mill-1843"]
catalog_sources_critical = ["gigerenzer-2002", "hahn-oaksford-2007", "huff-1954", "kahneman-2011", "lifton-1961", "mercier-sperber-2011", "nickerson-1998", "robinson-1950", "simpson-1951", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Vztah k technikám kompendia", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/kauzalni.toml"
+++

# Přehlížená společná příčina

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-04.05` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Ignoring a common cause |
| **Jiné názvy** | skrytá třetí proměnná, matoucí proměnná, zavádějící souvislost |
| **Obecnější heslo** | [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Přehlížená společná příčina je usuzování, které ze souvislosti jevů X a Y vyvozuje, že X
působí Y, a pomíjí možnost, že oba jevy jsou následkem třetí okolnosti Z. Ve statistice se
taková okolnost nazývá matoucí proměnná: souvisí s domnělou příčinou i s domnělým následkem a
vytváří mezi nimi souvislost, i když mezi nimi žádné působení není. Klasickým typem jsou dva
jevy, které rostou spolu s ročním obdobím, s věkem, s velikostí sídla nebo s příjmem. Klam je
zvláštním případem [záměny korelace a
kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) a sousedí s
[obrácenou kauzalitou](@/kompendium/argumentacni-fauly/kauzalni/obracena-kauzalita.md): v obou
případech je souvislost skutečná a chybný je jen její výklad. Praktický význam klamu spočívá v
tom, že zásah do domnělé příčiny nemá na domnělý následek žádný vliv, protože skutečná příčina
zůstává nedotčena. Huff patřil k prvním popularizátorům, kteří na tento mechanismus soustavně
upozorňovali v souvislosti s mediálně šířenými čísly (Huff 1954).

## Původ a souvislosti

Myšlenka, že dva jevy mohou souviset prostřednictvím třetího, je obsažena již v Millově
formulaci metody souběžných změn. Mill výslovně uvedl, že jev, který se mění spolu s jiným, je
buď jeho příčinou, nebo následkem, nebo je s ním spojen přes nějakou společnou příčinu (Mill
1843). S rozvojem statistiky se pro tento problém vyvinuly formální nástroje: rozdělení dat
podle třetí proměnné, srovnání uvnitř skupin a později regresní modely, které vliv třetích
proměnných odhadují. Simpson ukázal, že souvislost pozorovaná v souhrnných datech se může po
rozdělení podle třetí proměnné oslabit, zmizet nebo obrátit, a tento jev dnes nese jeho jméno
(Simpson 1951); podrobněji o něm pojednává heslo [Simpsonův
paradox](@/kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md). Robinson ve stejné
době upozornil, že souvislosti v datech za územní celky mohou být dány složením těchto celků,
nikoli vztahem mezi vlastnostmi jednotlivců (Robinson 1950). Experimentální metoda s náhodným
rozdělením účastníků do skupin je dodnes nejsilnějším prostředkem proti matoucím proměnným,
protože náhodné rozdělení vyrovnává mezi skupinami i ty okolnosti, o kterých výzkumník neví.
Tam, kde experiment není možný, zůstává riziko přehlédnuté společné příčiny trvalou výhradou k
observačním studiím.

## Struktura argumentu

Argument má tvar: X a Y se vyskytují spolu; proto X působí Y; proto změna X změní Y. Skutečná
struktura je jiná: Z působí X a Z působí Y. Mezi X a Y tak vzniká souvislost bez přímého
vztahu. Klam je obtížně rozpoznatelný proto, že Z v argumentu vůbec nevystupuje. Mluvčí ho
nemusí skrývat záměrně; často o něm sám neví, nebo ho pokládá za nepodstatné. Typickými
společnými příčinami jsou demografické a sociální charakteristiky, jako je věk, vzdělání,
příjem a zdravotní stav, dále prostředí a čas. Zvláštním případem je výběr, při kterém do
souboru vstupují jen ti, u nichž se sešly určité okolnosti, takže souvislost vzniká samotným
způsobem sběru dat; tomu se věnuje heslo [zkreslený
výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md). Ve vlivové komunikaci
lze přehlíženou společnou příčinu využít k tomu, aby se pozornost odvedla od nepohodlného
faktoru. Pokud například instituce vysvětluje horší výsledky určité skupiny lidí jejich
vlastnostmi, přehlíží tím podmínky, které sama vytváří a které mohou ovlivňovat výsledky i
vlastnosti zároveň. Že takový výklad snadno projde, souvisí s povahou intuitivního úsudku:
příběh s dvěma prvky a jednou šipkou je koherentní a srozumitelný, a koherence se prožívá jako
jistota, zatímco chybějící třetí prvek se v prožitku vůbec neobjeví (Kahneman 2011). Robinsonův
rozbor ukazuje navíc, že stejná souvislost může mít na úrovni skupin jiný význam než na úrovni
jednotlivců, protože skupiny se liší složením, které působí na obě sledované vlastnosti
(Robinson 1950).

## Detekční znaky

Prvním znakem je chybějící zmínka o tom, čím se srovnávané skupiny liší kromě sledované
vlastnosti. Druhým je observační povaha dat, zvlášť pokud se z nich vyvozuje doporučení zásahu.
Třetím je souvislost, která se zdá příliš silná nebo příliš univerzální na to, aby šlo o přímé
působení; když jeden faktor „souvisí“ s velkým množstvím různých výsledků, bývá to známka, že
zastupuje něco obecnějšího, například sociální postavení. Čtvrtým znakem je chybějící kontrolní
skupina vybraná stejným způsobem. Pátým je změna výsledku po rozdělení dat podle věku, pohlaví,
regionu nebo jiné proměnné; pokud autor takové rozdělení neprovedl nebo ho nezmiňuje, je na
místě opatrnost (Simpson 1951). Šestým znakem je výklad, který se nápadně hodí zájmu mluvčího,
protože vynechává faktor, za nějž by mluvčí sám nesl odpovědnost. Výzkum potvrzovacího
zkreslení ukazuje, že lidé posuzují souvislosti podle toho, zda odpovídají jejich očekávání, a
alternativní vysvětlení nehledají, pokud je k tomu nic nenutí (Nickerson 1998).

## Odlišení od platné argumentace

Platný argument z observačních dat nepředstírá, že společné příčiny neexistují, ale pokouší se
je vyloučit nebo zohlednit. Pojmenuje hlavní kandidáty na matoucí proměnné, ukáže, zda
souvislost přetrvá po jejich kontrole, a přizná, že neznámé faktory zohlednit nelze. Silnější
oporou jsou studie s náhodným rozdělením, přirozené experimenty, v nichž o expozici rozhodla
okolnost nesouvisející s výsledkem, a konzistence výsledků v souborech, kde se společné příčiny
liší. Mill tuto logiku formuloval v metodě rozdílu: k závěru o příčině je třeba, aby se
srovnávané případy shodovaly ve všech okolnostech kromě jedné (Mill 1843). Bayesovský pohled
dodává, že váha důkazu roste, když se konkurenční hypotézy postupně stávají méně
pravděpodobnými, a že úsudek o příčině je proto stupňovitý, ne binární (Hahn a Oaksford 2007).
Platné je i opačné užití: upozornění na možnou společnou příčinu je legitimní kritikou, pokud se
opírá o konkrétní kandidáty, a nikoli o obecné tvrzení, že „vždycky může existovat něco
dalšího“.

## Stav poznání

Matoucí proměnné patří k nejlépe popsaným problémům empirického výzkumu a metodologie
epidemiologie, psychologie a ekonomie jim věnuje rozsáhlou pozornost. Simpsonova práce zůstává
základním dokladem, že souvislost v souhrnných datech může mít opačný směr než souvislost uvnitř
skupin (Simpson 1951). Robinson ukázal, jak výrazně se mohou lišit korelace na úrovni celků a
na úrovni jednotlivců, a jeho práce je dodnes citována jako varování před přenášením závěrů
mezi úrovněmi (Robinson 1950). Psychologický výzkum úsudku doplňuje, proč lidé společné příčiny
přehlížejí: intuitivní myšlení pracuje s informacemi, které má před sebou, a nevnímá, co v nich
chybí (Kahneman 2011). Gigerenzer upozornil, že veřejnost i odborníci mají potíže s
interpretací statistických údajů o zdraví a že způsob podání ovlivňuje, jaké závěry se z nich
vyvozují (Gigerenzer 2002). Shoda panuje v tom, že odhalení matoucích proměnných vyžaduje znalost
oboru, nejen statistiky: aby bylo možné společnou příčinu zohlednit, je třeba ji nejprve
napadnout. Proto je diskuse s lidmi z jiných oborů a s kritiky užitečnou ochranou (Mercier a
Sperber 2011).

## Vztah k technikám kompendia

V situacích, kterými se kompendium zabývá, má přehlížená společná příčina zvláštní podobu.
Uzavřená skupina nebo kontrolující partner může tvrdit, že potíže člověka, například úzkost,
nespavost nebo konflikty s rodinou, souvisejí s jeho kontaktem s lidmi mimo skupinu, a z toho
vyvozovat, že kontakt je příčinou potíží. Přehlíženou společnou příčinou bývá v takovém případě
samotný tlak prostředí, který zároveň vyvolává potíže i potřebu hledat oporu venku. Lifton
popsal, jak totalistické prostředí vykládá zkušenost člena tak, aby potvrzovala doktrínu, a
nikoli zpochybňovala podmínky, které skupina vytváří (Lifton 1961). Rozpoznat takovou situaci
pomáhá stejná otázka jako u statistických dat: co dalšího se v životě člověka mění současně a
co by mohlo působit na obojí.

## Obrana a odpověď

Účinnou odpovědí je otázka: čím se ti, kdo mají vlastnost X, liší od ostatních kromě X samého?
Pokud se liší věkem, příjmem, vzděláním nebo zdravím, je třeba zjistit, zda souvislost přetrvá i
po zohlednění těchto rozdílů. Druhou otázkou je, zda existuje studie, ve které o X rozhodla
náhoda. Třetí otázkou je, zda souvislost platí i uvnitř jednotlivých skupin, nebo jen v
souhrnu (Simpson 1951). Při čtení zpráv o výzkumu pomáhá rozlišit, zda autoři sami upozorňují
na omezení observačního designu, a zda jejich závěry nepřekračují to, co data unesou (Huff
1954). V institucionálním prostředí, kde se horší výsledky určité skupiny vysvětlují jejími
vlastnostmi, je legitimní ptát se po podmínkách, které instituce sama vytváří a které mohou
působit na obojí. Proti opačnému zneužití, kdy se každý doklad odmítá poukazem na možné
neznámé faktory, je třeba žádat konkrétní kandidáty na společnou příčinu a posoudit, zda by
mohly souvislost vysvětlit v pozorovaném rozsahu. Zkratky úsudku za nejistoty, které
přehlížení podporují, popsali Tversky a Kahneman jako soustavné a předvídatelné (Tversky a
Kahneman 1974); v knize je shrnuje stránka [Tversky a Kahneman:
heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) a souvislosti s veřejným
zdravím rozebírá stránka [populační zdraví a prevence](@/kompendium/population-health/_index.md).

## Literatura

- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Mercier, H., & Sperber, D. (2011). Why do humans reason? Arguments for an argumentative theory. *Behavioral and Brain Sciences*, 34(2), 57–74.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Robinson, W. S. (1950). Ecological correlations and the behavior of individuals. *American Sociological Review*, 15(3), 351–357.
- Simpson, E. H. (1951). The interpretation of interaction in contingency tables. *Journal of the Royal Statistical Society, Series B*, 13(2), 238–241.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) – příbuzné heslo (Kauzální klamy, Cum hoc ergo propter hoc)
- [Obrácená kauzalita](@/kompendium/argumentacni-fauly/kauzalni/obracena-kauzalita.md) – příbuzné heslo (Kauzální klamy, Reverse causation)
- [Zjednodušená kauzalita](@/kompendium/argumentacni-fauly/kauzalni/zjednodusena-kauzalita.md) – příbuzné heslo (Kauzální klamy, Causal oversimplification)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [Ekologický klam](@/kompendium/argumentacni-fauly/statisticke/ekologicky-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Ecological fallacy)
- [Simpsonův paradox](@/kompendium/argumentacni-fauly/statisticke/simpsonuv-paradox.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Simpson's paradox)

**V kompendiu**

- [Populační zdraví a prevence](@/kompendium/population-health/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Obrácená kauzalita](@/kompendium/argumentacni-fauly/kauzalni/obracena-kauzalita.md) – předchozí heslo rodiny
- [Texaský střelec](@/kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
