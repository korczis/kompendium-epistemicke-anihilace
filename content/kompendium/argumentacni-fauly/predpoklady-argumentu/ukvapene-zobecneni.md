+++
title = "Ukvapené zobecnění"
description = "Obecný závěr o skupině vyvozený z příliš malého nebo nereprezentativního vzorku případů: jak ukvapené zobecnění poznat, čím se liší od platné indukce a jak na něj odpovědět."
weight = 7
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-predpoklady-argumentu", "fauly-neformalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Ukvapené zobecnění", "Hasty generalisation", "unáhlené zobecnění", "nedostatečný vzorek", "secundum quid", "Klamy předpokladu", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-03.07"
catalog_slug = "ukvapene-zobecneni"
catalog_family = "predpoklady-argumentu"
catalog_family_code = "03"
catalog_family_title = "Klamy předpokladu"
catalog_family_en = "Fallacies of presumption"
catalog_part = "predpoklady-argumentu"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Hasty generalisation"
catalog_aliases = ["unáhlené zobecnění", "nedostatečný vzorek", "secundum quid"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = ""
catalog_narrower = ["zavadejici-zivost"]
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["nedovoleny-mensi-termin", "vina-asociaci", "prilis-siroke-zobecneni", "vyber-tresnicek", "zkresleni-preziti", "zkresleny-vyber", "zakon-malych-cisel", "klam-skladani", "vybirani-podivinu", "jeden-studie", "odvolani-na-anekdotu", "pravidlo-argumentacniho-schematu", "toulminuv-model", "univerzalni-kvantifikator"]
catalog_related_declared = ["prilis-siroke-zobecneni", "zakon-malych-cisel", "zkresleny-vyber", "odvolani-na-anekdotu", "univerzalni-kvantifikator", "vyber-tresnicek"]
catalog_kompendium = ["kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/predpoklady-argumentu/prilis-siroke-zobecneni.md", "kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md", "kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md", "kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md", "kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md", "kompendium/techniques/ea-1-1-1-selektivni-expozice.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "zvlastni-vyjimka"
catalog_next = "prilis-siroke-zobecneni"
catalog_position = 7
catalog_family_size = 20
catalog_sources = ["damer-2009", "gilovich-1991", "hahn-oaksford-2007", "johnson-blair-1977", "kahneman-2011", "lifton-1961", "mill-1843", "popper-1959", "toulmin-1958", "tversky-kahneman-1971", "tversky-kahneman-1974", "walton-reed-macagno-2008", "eemeren-grootendorst-1992"]
catalog_sources_primary = ["damer-2009", "johnson-blair-1977", "toulmin-1958", "walton-reed-macagno-2008", "eemeren-grootendorst-1992"]
catalog_sources_roots = ["mill-1843", "popper-1959"]
catalog_sources_critical = ["gilovich-1991", "hahn-oaksford-2007", "kahneman-2011", "lifton-1961", "tversky-kahneman-1971", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Vztah k technikám kompendia", "Stav poznání", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/predpoklady-argumentu.toml"
+++

# Ukvapené zobecnění

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-03.07` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Klamy předpokladu](@/kompendium/argumentacni-fauly/predpoklady-argumentu/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Hasty generalisation |
| **Jiné názvy** | unáhlené zobecnění, nedostatečný vzorek, secundum quid |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Ukvapené zobecnění je induktivní úsudek, který z malého počtu případů nebo z případů vybraných
nereprezentativně vyvozuje závěr o celé skupině. Kdo potkal dva nepoctivé prodejce z jednoho
města a usoudí, že prodejci z toho města jsou nepoctiví, nedopustil se chyby ve formě úsudku,
ale v tom, že jeho premisy závěr nedostatečně podporují. Klam tedy nespočívá v zobecňování
samém, bez něhož by žádné poznání nebylo možné, ale v nepoměru mezi silou závěru a šíří
dokladů. Argumentační literatura ho popisuje jako porušení požadavku dostatečnosti: premisy
mohou být pravdivé a relevantní, a přesto nestačí k tomu, co se z nich vyvozuje (Johnson a
Blair 1977). Damer řadí do téže skupiny chyb nedostatečný vzorek a nereprezentativní data,
tedy dvě odlišné příčiny téhož výsledku: vzorek je buď příliš malý, nebo vybraný tak, že
neodpovídá skupině, o níž se mluví (Damer 2009). V kompendiu je heslo důležité proto, že
ukvapené zobecnění je obvyklou cestou, kterou se z jednotlivých zkušeností stávají
stereotypy, a stereotypy pak vstupují do úsudků o konkrétních lidech.

## Původ a souvislosti

Problém zobecnění z jednotlivých případů provází logiku od jejích počátků. Aristotelés
rozlišoval úsudky, které platí bezvýhradně, od úsudků, které platí jen v určitém ohledu, a
latinská tradice z toho vytvořila dvojici klamů, jejichž názvy se v učebnicích dodnes
zaměňují: přechod od toho, co platí v určitém ohledu, k tomu, co platí obecně, se nazývá
secundum quid a odpovídá ukvapenému zobecnění, kdežto opačný přechod od obecného pravidla k
případu, na který se nevztahuje, odpovídá
[příliš širokému zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/prilis-siroke-zobecneni.md).
John Stuart Mill v systematickém výkladu indukce věnoval samostatnou část chybám zobecnění a
zdůrazňoval, že síla induktivního závěru závisí na tom, zda případy byly zkoumány tak, aby
vylučovaly jiná vysvětlení (Mill 1843). Popper z druhé strany připomněl, že žádný počet
potvrzujících případů obecné tvrzení nedokazuje, kdežto jediný řádně doložený protipříklad ho
vyvrací (Popper 1959). [Pragma-dialektika](@/kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md) zařazuje ukvapené zobecnění mezi chybné užití
argumentačního schématu: úsudek ze znaků nebo příkladů je přípustný, ale jen tehdy, když
počet a povaha příkladů odpovídají závěru (van Eemeren a Grootendorst 1992).

## Struktura argumentu

Úsudek má podobu „Případy a1, a2 … an ze skupiny S mají vlastnost V, tedy členové S mají V“,
často s nevysloveným kvantifikátorem „všichni“ nebo „typicky“. Vadný může být ve třech
ohledech. Prvním je velikost vzorku: několik případů nedovoluje rozlišit skutečnou
pravidelnost od náhody. Druhým je výběr: případy se dostaly do pozornosti mluvčího způsobem,
který souvisí se zkoumanou vlastností, například proto, že nápadné nebo negativní případy si
lidé pamatují lépe. Třetím je síla závěru: i dobře podložené zobecnění o většině se mění v
klam, pokud se z něj stane tvrzení o všech. Teorie argumentačních schémat k úsudku z příkladu
připojuje [kritické otázky](@/kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md), které tyto tři ohledy zachycují: zda jsou příklady pravdivé, zda
podporují obecné tvrzení, zda jsou typické a zda nejsou známy protipříklady (Walton, Reed a
Macagno 2008). V běžné řeči se úsudek často zkracuje na jedinou zkušenost s obecným
komentářem („to jsou celí oni“), takže vzorek o jednom případu vůbec nezazní jako vzorek.
Kompendium jazykovou podobu zobecnění rozebírá v hesle
[Univerzální kvantifikátor](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md).

## Detekční znaky

Prvním znakem je kvantifikátor, který neodpovídá dokladům: „všichni“, „vždycky“, „nikdo“,
„typicky“ opřené o několik osobních zážitků nebo o jeden případ z médií. Druhým znakem je
živá a emočně silná anekdota, která zastupuje celé téma; čím je případ nápadnější, tím snáze
se z něj zobecňuje, protože se vybavuje rychleji (Tversky a Kahneman 1974). Třetím znakem je
chybějící srovnání: mluvčí uvádí, kolik případů vlastnost mělo, ale ne, kolik jich ji nemělo
a z jak velkého celku byly vybrány. Čtvrtým znakem je nepřiměřená jistota u malého vzorku,
například když se z úvodních výsledků nové léčby nebo z prvních týdnů nového opatření vyvozuje
trvalý účinek. Pátým znakem je zobecnění, které se týká skupiny lidí a které mluvčí uplatňuje
na konkrétní osobu přítomnou v rozhovoru. V institucionálním prostředí, například v sociální
práci, v posudkové činnosti nebo ve vyšetřování, se ukvapené zobecnění projevuje jako
„zkušenost“, která se nikdy nepodrobila kontrole a je předávána jako samozřejmost (Kahneman
2011).

## Odlišení od platné argumentace

Platné induktivní zobecnění se od ukvapeného liší třemi rysy. Opírá se o vzorek, jehož
velikost odpovídá síle závěru a míře variability ve skupině; o vzorek vybraný způsobem, který
nesouvisí se zkoumanou vlastností; a o závěr, který nese přiměřený kvalifikátor a přiznává
nejistotu. Toulminův model tento požadavek vyjadřuje kvalifikátorem a podmínkami vyvrácení,
které ukazují, za jakých okolností závěr neplatí (Toulmin 1958). Výběr náhodného vzorku dvou
tisíc domácností opravňuje k odhadu podílu v kraji, kdežto rozhovor s dvaceti sousedy
nikoli, i když je počet případů nenulový. Je také třeba odlišit ukvapené zobecnění od
legitimní pracovní hypotézy: lékař, který po několika podobných případech pojme podezření na
souvislost, nezobecňuje ukvapeně, pokud podezření považuje za hypotézu ke zkoumání, a ne za
závěr. Platným krokem je i úsudek z jediného případu tam, kde jde o vyvrácení obecného
tvrzení, protože k vyvrácení tvrzení o všech stačí jediný řádně doložený protipříklad (Popper
1959). Rozdíl tedy neleží v počtu případů jako takovém, ale v tom, co se z nich vyvozuje.

## Vztah k technikám kompendia

Ukvapené zobecnění je v běžné řeči většinou neúmyslnou chybou, ale v manipulativní
komunikaci se dá využít záměrně. Mluvčí, který chce u posluchače vyvolat obecný postoj ke
skupině, nemusí nic tvrdit o všech jejích členech; stačí, když opakovaně předvádí jednotlivé
nápadné případy a ponechá zobecnění na posluchači. Zobecnění pak posluchač prožívá jako vlastní
závěr, a proto je vůči němu méně kritický. Tento postup se překrývá s
[výběrem třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md),
protože o tom, které případy se ukazují, rozhoduje mluvčí, a s mechanismy
[selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md), které omezují,
s jakými případy se posluchač vůbec setká. V uzavřených skupinách se tak vytvářejí obecné
obrazy vnějšího světa („lidé venku jsou nepřátelští“) z několika vyprávěných příběhů, které
nelze ověřit a k nimž chybí srovnání. Rozpoznání této souvislosti je užitečné zejména při práci
s lidmi, kteří z takového prostředí odcházejí a jejichž obraz světa se opírá o případy, které
jim byly vybrány (Lifton 1961).

## Stav poznání

Ukvapené zobecnění patří k nejlépe doloženým chybám lidského usuzování. Tversky a Kahneman
ukázali, že i vědecky vzdělaní lidé očekávají, že malé vzorky budou věrně odrážet populaci, a
proto jim přisuzují příliš velkou průkaznost; jev nazvali vírou v zákon malých čísel (Tversky a
Kahneman 1971). Navazující práce o heuristikách popsaly, jak úsudek o četnosti ovlivňuje
snadnost, s níž se případy vybavují, a jak úsudek o příslušnosti ke skupině ovlivňuje
podobnost s představou typického člena, aniž by se brala v úvahu velikost vzorku nebo základní
četnost (Tversky a Kahneman 1974). Kahneman později shrnul, že intuitivní myšlení buduje
souvislý příběh z informací, které má k dispozici, a nevěnuje pozornost tomu, co chybí, což
zvyšuje sebedůvěru v závěry z nedostatečných dokladů (Kahneman 2011). Gilovich doložil, jak se
ze sporadických zážitků a z informací z druhé ruky stávají pevná přesvědčení, která se
dalšími zkušenostmi spíše potvrzují než opravují (Gilovich 1991). Bayesovský přístup k
neformálním klamům upozorňuje, že síla úsudku z malého vzorku není vždy nulová a závisí na
předchozích znalostech; jde o otázku míry, nikoli o kategorickou chybu (Hahn a Oaksford 2007).

## Obrana a odpověď

Odpověď na ukvapené zobecnění se opírá o otázky po vzorku. Kolik případů mluvčí zná, z jak
velkého celku a jak se k nim dostal? Kolik případů vlastnost nemělo, a byly by si jich vůbec
všiml? Jsou známy protipříklady, a jak se s nimi zachází? Tyto otázky nevyvracejí zkušenost
mluvčího, ale ukazují, k čemu ji lze použít: k hypotéze ano, k obecnému závěru ne (Walton, Reed
a Macagno 2008). Pro profesní praxi, kde se z jednotlivých případů snadno stává „zkušenost
oboru“, je obranou systematické zaznamenávání všech případů, a nejen těch nápadných, a
srovnávání s dostupnými údaji o základní četnosti. Pro posuzování konkrétní osoby platí, že
ani dobře doložené zobecnění o skupině nerozhoduje o jednotlivci; tento krok je samostatnou
chybou, kterou popisuje heslo
[Příliš široké zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/prilis-siroke-zobecneni.md).
Kompendium mechanismy, které ukvapené zobecnění živí, souhrnně popisuje v přehledu
[Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md).
Znalost heuristik sama o sobě chybám nezabrání, ale usnadňuje jejich rozpoznání, a to
snáze v úsudcích druhých než ve vlastních (Kahneman 2011).

## Literatura

- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Johnson, R. H., & Blair, J. A. (1977). *Logical Self-Defense*. Toronto: McGraw-Hill Ryerson.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. London: Hutchinson.
- Toulmin, S. E. (1958). *The Uses of Argument*. Cambridge: Cambridge University Press.
- Tversky, A., & Kahneman, D. (1971). Belief in the law of small numbers. *Psychological Bulletin*, 76(2), 105–110.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Walton, D., Reed, C., & Macagno, F. (2008). *Argumentation Schemes*. Cambridge: Cambridge University Press.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Klamy předpokladu](@/kompendium/argumentacni-fauly/predpoklady-argumentu/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Zavádějící živost](@/kompendium/argumentacni-fauly/statisticke/zavadejici-zivost.md) – zvláštní případ tohoto hesla

**Příbuzná hesla**

- [Nedovolený menší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-mensi-termin.md) – příbuzné heslo (Formální klamy, Illicit minor)
- [Vina asociací](@/kompendium/argumentacni-fauly/relevance/vina-asociaci.md) – příbuzné heslo (Klamy relevance, Guilt by association)
- [Příliš široké zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/prilis-siroke-zobecneni.md) – příbuzné heslo (Klamy předpokladu, Sweeping generalisation)
- [Výběr třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md) – příbuzné heslo (Klamy předpokladu, Cherry picking)
- [Zkreslení přežitím](@/kompendium/argumentacni-fauly/statisticke/zkresleni-preziti.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Survivorship bias)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [Zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Law of small numbers)
- [Klam skládání](@/kompendium/argumentacni-fauly/jazykove-klamy/klam-skladani.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Fallacy of composition)
- [Vybírání podivínů](@/kompendium/argumentacni-fauly/dialekticke-taktiky/vybirani-podivinu.md) – příbuzné heslo (Rétorické a dialogické taktiky, Nutpicking)
- [Argument jedinou studií](@/kompendium/argumentacni-fauly/hodnoty-a-veda/jeden-studie.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Single-study fallacy)
- [Odvolání na anekdotu](@/kompendium/argumentacni-fauly/hodnoty-a-veda/odvolani-na-anekdotu.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Anecdotal fallacy)
- [Pravidlo argumentačního schématu](@/kompendium/argumentacni-fauly/teorie-argumentace/pravidlo-argumentacniho-schematu.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Argument-scheme rule)
- [Toulminův model argumentu](@/kompendium/argumentacni-fauly/teorie-argumentace/toulminuv-model.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Toulmin model)
- [Univerzální kvantifikátor](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md) – příbuzné heslo (NLP vzorce: Meta-model, Universal quantifier)

**V kompendiu**

- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Zvláštní výjimka](@/kompendium/argumentacni-fauly/predpoklady-argumentu/zvlastni-vyjimka.md) – předchozí heslo rodiny
- [Příliš široké zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/prilis-siroke-zobecneni.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
