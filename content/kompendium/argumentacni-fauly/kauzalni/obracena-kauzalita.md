+++
title = "Obrácená kauzalita"
description = "Klam, který převrací směr příčinného vztahu a vydává následek za příčinu: od statistických souvislostí po přesun viny ve vztazích, se znaky a obrannými otázkami."
weight = 4
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-kauzalni", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Obrácená kauzalita", "Reverse causation", "záměna příčiny a následku", "obrácený směr příčinnosti", "Kauzální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-04.04"
catalog_slug = "obracena-kauzalita"
catalog_family = "kauzalni"
catalog_family_code = "04"
catalog_family_title = "Kauzální klamy"
catalog_family_en = "Causal fallacies"
catalog_part = "kauzalni"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Reverse causation"
catalog_aliases = ["záměna příčiny a následku", "obrácený směr příčinnosti"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "korelace-a-kauzalita"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["korelace-a-kauzalita"]
catalog_related = ["post-hoc", "korelace-a-kauzalita", "jedina-pricina", "prehlizena-spolecna-pricina", "pricina-a-nasledek"]
catalog_related_declared = ["prehlizena-spolecna-pricina", "post-hoc", "pricina-a-nasledek", "jedina-pricina"]
catalog_kompendium = ["kompendium/techniques/ea-5-1-12-kauzalni-inverze.md", "kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md", "kompendium/population-health/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md", "kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/pricina-a-nasledek.md", "kompendium/nlp-vzorce/zakladni-pojmy/casova-osa-pojem.md", "kompendium/techniques/ea-5-1-12-kauzalni-inverze.md"]
catalog_prev = "jedina-pricina"
catalog_next = "prehlizena-spolecna-pricina"
catalog_position = 4
catalog_family_size = 9
catalog_sources = ["bandler-grinder-1975", "bateson-1972", "beck-1976", "herman-1992", "huff-1954", "kahneman-2011", "kunda-1990", "mill-1843", "stark-2007", "watzlawick-1967"]
catalog_sources_primary = ["bandler-grinder-1975"]
catalog_sources_roots = ["bateson-1972", "mill-1843", "watzlawick-1967"]
catalog_sources_critical = ["beck-1976", "herman-1992", "huff-1954", "kahneman-2011", "kunda-1990", "stark-2007"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Varianty", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/kauzalni.toml"
+++

# Obrácená kauzalita

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-04.04` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Reverse causation |
| **Jiné názvy** | záměna příčiny a následku, obrácený směr příčinnosti |
| **Obecnější heslo** | [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | vysoké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Obrácená kauzalita je usuzování, které správně zachytí, že dva jevy spolu souvisejí, ale chybně
určí směr jejich vztahu: za příčinu označí to, co je ve skutečnosti následkem, a za následek
to, co je příčinou. Klam je zvláštním případem [záměny korelace a
kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md), protože vychází ze
souvislosti a pomíjí jednu z jejích alternativních interpretací. Vyskytuje se ve dvou podobách,
které je užitečné rozlišovat. V první, převážně kognitivní, jde o chybný výklad dat, například
když se z toho, že nemocní lidé méně pracují, usoudí, že nečinnost způsobuje nemoc, aniž by
se zvážilo, že nemoc vede k nečinnosti. Ve druhé, převážně vlivové, jde o převrácení
odpovědnosti v mezilidském vztahu: reakce člověka na škodlivé jednání se vydává za příčinu
tohoto jednání. Kompendium tuto druhou podobu v rozvinuté a soustavné formě popisuje jako
techniku [kauzální inverze](@/kompendium/techniques/ea-5-1-12-kauzalni-inverze.md). Společné
oběma podobám je to, že souvislost sama je skutečná, a proto výklad působí věrohodně (Huff
1954).

## Původ a souvislosti

Již Mill upozorňoval, že pozorovaná souběžná změna dvou jevů sama neurčuje, který z nich je
příčinou a který následkem, a že k rozhodnutí je třeba jiných metod, zejména zásahu, při němž
se jeden jev mění záměrně a sleduje se druhý (Mill 1843). Huff ve své popularizaci statistiky
ukazoval, že u řady mediálně šířených souvislostí může vztah vést oběma směry a že volba
směru bývá dána spíš očekáváním autora než daty (Huff 1954). V epidemiologii se problém
objevuje jako obava, že nemoc v raném stadiu mění chování lidí, takže chování, které se v datech
pojí s nemocí, je ve skutečnosti jejím časným projevem. V teorii komunikace popsali Watzlawick,
Beavin a Jackson jev interpunkce sledu událostí: účastníci dlouhodobé interakce rozdělují
souvislý tok jednání do úseků tak, že vlastní chování vidí jako reakci na chování druhého, a
každý z nich proto pokládá druhého za příčinu (Watzlawick, Beavin a Jackson 1967). Jejich
příklad partnerů, z nichž jeden se stahuje, protože druhý naléhá, a druhý naléhá, protože se
první stahuje, se stal klasickým popisem toho, jak se o směru kauzality vede spor, který
nelze rozhodnout uvnitř dvojice.

## Struktura argumentu

Argument vychází z pozorování, že jevy X a Y jdou spolu, a vyvozuje, že X působí Y. Skutečný
vztah je však opačný: Y působí X. Klam se tedy neprojevuje chybou v pozorování, ale chybějící
úvahou o směru. V datové podobě je typické, že se pomíjí [časová osa](@/kompendium/nlp-vzorce/zakladni-pojmy/casova-osa-pojem.md): neví se, nebo se neříká,
co bylo dřív. V mezilidské podobě je struktura složitější. Mluvčí nejprve zúží časový rámec
tak, aby začínal reakcí druhého, a teprve potom popíše vlastní jednání jako odpověď na ni.
Výrok „kdybys nebyla tak podezíravá, nemusel bych nic tajit“ obsahuje přesně tuto operaci:
podezíravost, která byla následkem odhaleného tajení, se umístí na začátek řetězu. [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md)
NLP tento typ výroku zachycuje jako kategorii [příčina a
následek](@/kompendium/nlp-vzorce/meta-model/pricina-a-nasledek.md), ve které se vlastní stav
nebo jednání mluvčího vydává za nutný důsledek chování druhého (Bandler a Grinder 1975). Zvláštní
podobou je vzájemná smyčka, v níž oba jevy na sebe působí. Pak je chybou nikoli volba jednoho
směru, ale popření druhého; spor o to, „kdo začal“, je v takové smyčce často neplodný, jak
ukazuje analýza interpunkce (Watzlawick, Beavin a Jackson 1967).

## Detekční znaky

V datech lze klam rozpoznat podle toho, že chybí informace o časovém pořadí, že se pracuje s
průřezovými údaji a že doporučení vychází z předpokladu jednoho směru bez zdůvodnění. Typickým
rysem je také přehlížení toho, že stav, o kterém se mluví, mohl změnit chování, které ho údajně
způsobuje. V mezilidské komunikaci jsou znaky výraznější. Mluvčí soustavně začíná vyprávění
událostí reakcí druhého a vlastní předchozí jednání vynechává. Vlastní emoce a rozhodnutí
popisuje jako vynucené: „donutil jsi mě“, „nemám jinou možnost, když ty“. Reakce druhého na
škodu, například úzkost, hněv, kontrola nebo stažení, se označuje za důvod škody. Čím déle
vztah trvá, tím častěji se objevuje, že druhá strana výklad přijímá a začíná sama zkoumat,
čím jednání mluvčího „vyvolala“. Herman popsala, jak se lidé vystavení dlouhodobému násilí
učí hledat příčinu ve vlastním chování a jak sebeobviňující výklad slouží k udržení iluze
kontroly v situaci, která se kontrolovat nedá (Herman 1992). Klinicky významným znakem je proto
nejistota v časovém pořadí vlastních vzpomínek a ochota převzít odpovědnost za stavy
druhého; souvislosti s diagnostikou popisuje stránka [diagnostických
indikátorů](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md).

## Odlišení od platné argumentace

Platná argumentace o směru kauzality se opírá o časové pořadí, o zásah a o mechanismus. Kdo
tvrdí, že X působí Y, by měl ukázat, že X předchází Y, že záměrná změna X mění Y a že existuje
přiměřený mechanismus, kterým se to děje. Kde je to možné, rozhoduje experiment; kde ne,
pomáhají dlouhodobá sledování, která zachycují pořadí změn (Mill 1843). Legitimní je také
přiznat vzájemné působení: chronická bolest snižuje pohyb a nedostatek pohybu může bolest
zhoršovat. Takový výklad není obrácenou kauzalitou, protože oba směry výslovně připouští. V
mezilidských vztazích je legitimní mluvit o vzájemném ovlivňování, pokud se tím nezakrývá
nepoměr moci a odpovědnosti. Systemické myšlení učí, že v interakci působí každý na každého
(Bateson 1972), ale to neznamená, že škodlivé jednání jedné strany je stejnou měrou dílem druhé.
Rozhodující otázkou je, zda výklad vzájemnosti slouží k porozumění, nebo k převedení viny.

## Stav poznání

Obrácená kauzalita patří k standardním hrozbám platnosti v observačním výzkumu a metodologická
literatura ji uvádí spolu s matoucími proměnnými a výběrovým zkreslením mezi hlavními důvody,
proč souvislost nelze bez dalšího vykládat jako působení. Huff ji populárně popsal jako jednu ze
základních cest, kterými se souvislost v datech mění v nepodložené tvrzení (Huff 1954). V
klinickém a forenzním kontextu je doloženo, že kontrolující jednání ve vztazích se často
zdůvodňuje chováním oběti a že tento výklad přebírá i okolí, například příbuzní nebo
instituce. Stark ukázal, že pohled zaměřený na jednotlivé incidenty a jejich bezprostřední
„spouštěče“ usnadňuje přesun odpovědnosti na toho, kdo kontrolu snáší (Stark 2007). Herman
doložila, že sebeobviňování je u lidí po dlouhodobém traumatu častým a obtížně odstranitelným
rysem a že jeho překonání je součástí zotavení (Herman 1992). Výzkum motivovaného uvažování
vysvětluje, proč je pro mluvčího obrácený výklad přitažlivý: lidé přijímají vysvětlení, která
chrání jejich sebeobraz, pokud je mohou před sebou obhájit (Kunda 1990). O rozsahu, v jakém
obrácená kauzalita zkresluje konkrétní oblasti výzkumu, se vedou odborné spory, které nelze
rozhodnout obecně, ale jen pro jednotlivé souvislosti.

## Varianty

V epidemiologii je známým příkladem situace, kdy lidé přestanou s určitým chováním, například s
pitím alkoholu nebo s namáhavou prací, protože onemocněli. Skupina „abstinentů“ nebo „neaktivních“
pak v datech vypadá nemocnější, a pokud se pořadí změn nesleduje, svádí to k závěru, že
abstinence nebo nečinnost škodí. V organizacích se objevuje obdobný vzorec: vedení zavede
přísnější kontrolu, protože zaměstnancům nedůvěřuje, a jejich následné stažení a nižší ochota
k iniciativě pak vykládá jako potvrzení, že kontrola byla nutná. V politické komunikaci se
obrácená kauzalita užívá k přesunu odpovědnosti na kritiky: protest se označí za příčinu
represe, ačkoli na ni reagoval. Ve všech případech se výklad drží, protože souvislost je
skutečná a pozorovatelná a otázka po pořadí se nepoloží (Huff 1954). Kahneman připomíná, že
intuitivní úsudek přijme koherentní příběh dřív, než se zeptá, zda by data odpovídala i příběhu
opačnému (Kahneman 2011).

## Obrana a odpověď

Proti kognitivní podobě klamu pomáhá otázka po časovém pořadí a po zásahu: víme, co bylo
dřív, a co se stane, když jeden jev záměrně změníme? Druhou otázkou je, zda stav, o kterém je
řeč, nemohl změnit chování, které ho údajně působí. Proti vlivové podobě je základní obranou
návrat k úplné časové ose. Kdo zaznamená události v pořadí, v jakém proběhly, a odděleně od
jejich výkladu, má oporu proti postupnému přepisování sledu (Beck 1976). Druhou obranou je
rozlišit reakci od příčiny: úzkost, nedůvěra nebo hněv po zjištění škody jsou pochopitelné
odpovědi, ne její důvod. Třetí obranou je zapojení vnějšího pozorovatele, který není součástí
vztahu a může posoudit pořadí událostí bez zájmu na výsledku. Herman zdůrazňuje, že obnova
schopnosti správně přisoudit odpovědnost probíhá v bezpečném vztahu, v němž člověk může
vyprávět vlastní příběh bez okamžitého zpochybnění (Herman 1992). Pro odborníky, kteří s
dvojicemi pracují, platí, že systemický výklad vzájemného působení je třeba doplnit pozorností
k nerovnosti moci, jinak může terapie nechtěně potvrdit převrácený výklad. Stark v tomto smyslu
připomíná, že kontrolující jednání ve vztahu je vzorcem nadvlády, nikoli symetrickým sporem
dvou rovnocenných stran (Stark 2007).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Kunda, Z. (1990). The case for motivated reasoning. *Psychological Bulletin*, 108(3), 480–498.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.
- Watzlawick, P., Beavin, J. H., & Jackson, D. D. (1967). *Pragmatics of Human Communication*. New York: W. W. Norton.

## Související

**Rodina a hierarchie**

- [Kauzální klamy](@/kompendium/argumentacni-fauly/kauzalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Po tom, tedy kvůli tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md) – příbuzné heslo (Kauzální klamy, Post hoc ergo propter hoc)
- [Záměna korelace a kauzality](@/kompendium/argumentacni-fauly/kauzalni/korelace-a-kauzalita.md) – příbuzné heslo (Kauzální klamy, Cum hoc ergo propter hoc)
- [Jediná příčina](@/kompendium/argumentacni-fauly/kauzalni/jedina-pricina.md) – příbuzné heslo (Kauzální klamy, Fallacy of the single cause)
- [Přehlížená společná příčina](@/kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md) – příbuzné heslo (Kauzální klamy, Ignoring a common cause)
- [Příčina a následek](@/kompendium/nlp-vzorce/meta-model/pricina-a-nasledek.md) – příbuzné heslo (NLP vzorce: Meta-model, Cause and effect)

**V kompendiu**

- [EA-5.1.12 Kauzální inverze](@/kompendium/techniques/ea-5-1-12-kauzalni-inverze.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.1 Diagnostické indikátory a markery EA](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Populační zdraví a prevence](@/kompendium/population-health/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Jediná příčina](@/kompendium/argumentacni-fauly/kauzalni/jedina-pricina.md) – předchozí heslo rodiny
- [Přehlížená společná příčina](@/kompendium/argumentacni-fauly/kauzalni/prehlizena-spolecna-pricina.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
