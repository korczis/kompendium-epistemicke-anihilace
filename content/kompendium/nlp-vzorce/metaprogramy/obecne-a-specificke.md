+++
title = "Obecné a specifické"
description = "Metaprogram rozsahu: zda člověk potřebuje celek, nebo podrobnosti, a jak se vágní vize nebo záplava detailů používají k zakrytí toho, co by se dalo ověřit."
weight = 4
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-metaprogramy", "nlp-pojem", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Obecné a specifické", "General and specific", "rozsah", "velikost celku", "Metaprogramy", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-17.04"
catalog_slug = "obecne-a-specificke"
catalog_family = "metaprogramy"
catalog_family_code = "17"
catalog_family_title = "Metaprogramy"
catalog_family_en = "Meta-programs"
catalog_part = "metaprogramy"
catalog_type = "concept"
catalog_type_cs = "pojem"
catalog_en = "General and specific"
catalog_aliases = ["rozsah", "velikost celku"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "metaprogramy-pojem"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["metaprogramy-pojem"]
catalog_related = ["chunking", "umyslna-vagnost", "shoda-a-rozdil", "filozoficky-smer", "hierarchie-idei", "chunking-nahoru", "chunking-dolu"]
catalog_related_declared = ["chunking", "chunking-nahoru", "chunking-dolu", "umyslna-vagnost", "hierarchie-idei"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-2-informacni-pretizeni.md", "kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md", "kompendium/detection-signatures/1-linguistic-jargon-density.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/detection-signatures/1-linguistic-jargon-density.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/milton-model/milton-model.md", "kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md", "kompendium/nlp-vzorce/zakladni-pojmy/chunking.md", "kompendium/techniques/ea-1-1-2-informacni-pretizeni.md", "kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md"]
catalog_prev = "moznosti-a-postupy"
catalog_next = "shoda-a-rozdil"
catalog_position = 4
catalog_family_size = 24
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "beck-1976", "charvet-1997", "heap-1988", "kahneman-2011", "oconnor-seymour-1990", "petty-cacioppo-1986", "tosey-mathison-2009", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b", "charvet-1997", "oconnor-seymour-1990"]
catalog_sources_roots = []
catalog_sources_critical = ["beck-1976", "heap-1988", "kahneman-2011", "petty-cacioppo-1986", "tosey-mathison-2009", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/metaprogramy.toml"
+++

# Obecné a specifické

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-17.04` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Metaprogramy](@/kompendium/nlp-vzorce/metaprogramy/_index.md) |
| **Druh** | pojem |
| **Anglicky** | General and specific |
| **Jiné názvy** | rozsah, velikost celku |
| **Obecnější heslo** | [Metaprogramy](@/kompendium/nlp-vzorce/zakladni-pojmy/metaprogramy-pojem.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Metaprogram „obecné a specifické“ popisuje v NLP velikost celků, se kterými člověk v daném
kontextu nejraději pracuje. Na obecném pólu stojí zájem o přehled, souvislosti a hlavní
myšlenku; podrobnosti jsou únavné, pokud nejsou zasazeny do celku. Na specifickém pólu stojí
zájem o konkrétní údaje, pořadí a přesnost; obecné shrnutí bez detailů působí prázdně nebo
nedůvěryhodně (Charvet 1997). V profilu LAB se kategorie nazývá „rozsah“ a řadí se mezi
vzorce, které mají popisovat, jak člověk pracuje s informacemi. V obecnější rovině navazuje
na pojem chunkingu, tedy pohybu mezi úrovněmi abstrakce, se kterým NLP pracuje od počátku
(O'Connor a Seymour 1990). Pro kompendium je kategorie podstatná proto, že úroveň obecnosti
rozhoduje o tom, co lze ověřit. Tvrzení na úrovni vize, poslání nebo „velkého obrazu“ se
téměř nedá vyvrátit; tvrzení na úrovni čísel, termínů a odpovědností ano. Kdo ovládá úroveň
obecnosti rozhovoru, ovládá i to, co se v něm dá zkontrolovat.

## Původ a souvislosti

Rozlišení obecného a specifického prochází celou historií NLP. [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md), první jazykový
model oboru, je v podstatě soubor otázek, které vracejí obecné a neúplné formulace ke
konkrétní zkušenosti: kdo přesně, co přesně, jak přesně (Bandler a Grinder 1975). [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md)
naopak popisuje, jak Milton Erickson v hypnóze záměrně používal obecné a vágní formulace,
aby si posluchač doplnil obsah sám (Bandler a Grinder 1975b). Oba modely tedy pracují s
toutéž osou, jen opačným směrem. Stránky o [chunkingu](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md)
a o [úmyslné vágnosti](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) tuto osu
rozvádějí. Metaprogram z ní dělá vlastnost člověka: tvrdí, že lidé mají preferovanou úroveň a
že sdělení na „správné“ úrovni je pro ně srozumitelnější a přesvědčivější. Mimo NLP se
podobnou otázkou zabývá kognitivní a sociální psychologie, například výzkum toho, jak
psychická vzdálenost ovlivňuje, zda lidé věci chápou abstraktně, nebo konkrétně. Tento
výzkum však popisuje stav vyvolaný situací, ne stálou preferenci, a s metaprogramem je
příbuzný jen myšlenkou, nikoli metodou.

## Struktura vzorce

Praktická literatura tvrdí, že se kategorie rozpozná z formy řeči. Člověk se specifickou
preferencí prý mluví v posloupnostech, uvádí jména, čísla a přesná určení a vrací se na
začátek, pokud je přerušen. Člověk s obecnou preferencí prý mluví ve shrnutích, přeskakuje
mezi tématy a podrobnosti vynechává (Charvet 1997). Z toho se odvozuje ladění sdělení:
obecnému posluchači se předkládá celek a smysl, specifickému podrobný rozpis. Z hlediska
analýzy je podstatné, že úroveň obecnosti není jen otázkou stylu, ale i otázkou toho, co se
v rozhovoru stane neviditelným. Na obecné úrovni mizí údaje, které by mohly nabídku
zpochybnit. Na příliš specifické úrovni mizí celek: posluchač se ztratí v podrobnostech a
nepostřehne, že klíčový údaj chybí nebo je zasunut mezi nepodstatné. Výzkum přesvědčování
ukazuje, že pokud posluchač nemá kapacitu nebo motivaci sdělení zpracovat, řídí se spíš
vnějšími znaky, jako je množství argumentů nebo dojem odbornosti, než jejich kvalitou
(Petty a Cacioppo 1986). Záplava podrobností tak může působit jako doklad důkladnosti,
přestože nic nedokládá.

Strukturu je užitečné číst i z pohledu toho, kdo v rozhovoru určuje úroveň. V rovném
rozhovoru se úroveň obecnosti mění podle potřeby obou stran: kdo nerozumí, zeptá se na
příklad, kdo se ztrácí v detailech, požádá o shrnutí. V asymetrickém rozhovoru úroveň
určuje jedna strana a druhá ji nemůže změnit, aniž by byla zahanbena nebo odbyta. Právě tato
nerovnost, a ne samotná obecnost nebo podrobnost, je znakem, který odlišuje stylovou
preferenci od nástroje kontroly. Meta-model v tomto smyslu popisuje upřesňující otázky jako
legitimní reakci posluchače na neúplné sdělení (Bandler a Grinder 1975); prostředí, ve kterém
takové otázky nejsou dovoleny, posluchači tuto možnost bere.

## Detekční znaky

Zneužití obecné úrovně se pozná podle toho, že otázky po konkrétních údajích se odmítají jako
malichernost, „zdržování“ nebo nepochopení vize. Mluvčí se po každém pokusu o upřesnění vrací
k hodnotám a velkým slovům, která nelze ověřit. Často se přidává sociální tlak: kdo se ptá na
čísla, ten „nevidí velký obraz“ nebo „nemá odvahu“. Zneužití specifické úrovně se pozná
podle opačného příznaku. Posluchač dostane velké množství technických podrobností, tabulek
nebo žargonu, ale klíčová otázka, například kdo nese riziko nebo jaký je skutečný náklad,
zůstane nezodpovězena. Kompendium tento vzorec popisuje jako [informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)
a jako [iluzorní komplexitu](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md).
Nápadné je i střídání úrovní podle toho, co se hodí: na otázku po riziku přijde obecná
odpověď, na otázku po smyslu záplava detailů. U ovlivňovaného člověka se objevuje pocit, že
věci rozumí, ale nedokáže ji nikomu vysvětlit vlastními slovy, a únava, která vede k tomu, že
podepíše, „aby to už skončilo“. Kahneman popisuje, jak vyčerpání a zahlcení posouvá úsudek k
rychlým a méně kontrolovaným odpovědím (Kahneman 2011).

## Legitimní a manipulativní užití

Legitimní užití spočívá v tom, že se obě úrovně dávají k dispozici a propojují. Dobrá
přednáška nebo dobré lékařské vysvětlení začíná celkem, aby posluchač věděl, kam detaily
patří, a pak nabídne podrobnosti, které lze ověřit. V terapii pomáhá upřesňování obecných
formulací, například „vždycky“ nebo „všichni“, klientovi rozlišit, co se skutečně stalo, od
toho, jak to prožívá; kognitivní terapie s takovými zobecněními systematicky pracuje (Beck
1976). Pohyb mezi úrovněmi je tu nástrojem porozumění. Manipulativní užití spočívá v tom, že
se úroveň obecnosti volí podle toho, co má zůstat skryto. Vize bez čísel zakrývá, že čísla
nevycházejí. Detaily bez celku zakrývají, že klíčový údaj chybí. Ladění úrovně podle
domnělého metaprogramu posluchače k tomu přidává alibi: mluvčí se může hájit, že jen „mluví
jazykem posluchače“. Rozhodující otázky zní: Jsou ověřitelné údaje dostupné, i když o ně
posluchač výslovně nepožádá? Odpovídá mluvčí na otázku na té úrovni, na které byla položena?
A dokáže posluchač po rozhovoru shrnout podstatu i hlavní čísla?

## Stav důkazů

Pro metaprogram obecné a specifické preference nejsou v literatuře, o kterou se kompendium
opírá, doloženy studie, které by prokázaly, že se dá spolehlivě rozpoznat z řeči a že ladění
sdělení podle něj zvyšuje porozumění nebo přesvědčivost. Kritické přehledy výzkumu NLP
konstatují, že kontrolované studie tvrzení oboru většinou nepodporují (Witkowski 2010;
Heap 1988). Tosey a Mathison připomínají, že modely NLP vznikly modelováním jednotlivých
praktiků a jejich zobecnění na populaci nebylo empiricky ověřeno (Tosey a Mathison 2009).
Doložené jsou naopak dílčí mechanismy, o které se zneužití opírá: posluchači s nízkou
kapacitou ke zpracování se řídí periferními znaky (Petty a Cacioppo 1986) a zahlcení
informacemi snižuje kvalitu úsudku (Kahneman 2011). Tyto poznatky platí obecně a nevyžadují
předpoklad stálé preference. Srovnání s validovaným výzkumem osobnosti je možné jen volně:
ten se zabývá například tím, jak rádi lidé přemýšlejí do hloubky, a měří to ověřenými
dotazníky, kdežto metaprogram se určuje dojmem praktika.

## Obrana a zotavení

Základní obranou je trvat na tom, aby každé tvrzení, na němž závisí rozhodnutí, bylo
dostupné na ověřitelné úrovni. U obecné nabídky to znamená ptát se na čísla, termíny,
odpovědné osoby a na to, co se stane, když se plán nepovede. Meta-model nabízí pro tento
účel otázky, které vracejí obecné výroky ke konkrétní zkušenosti, a v obranném použití
slouží právě k upřesnění toho, co mluvčí nechal nevyslovené (Bandler a Grinder 1975). U
přetížené nabídky je obranou opačný pohyb: požádat o shrnutí podstaty na jednu stránku a o
odpověď na dvě nebo tři rozhodující otázky. Kdo nedokáže nabídku shrnout, ten jí buď sám
nerozumí, nebo nechce, aby jí rozuměl posluchač. Druhou obranou je vlastní shrnutí: pokud po
rozhovoru nedokážete vlastními slovy říct, co se nabízí a za jakou cenu, není rozhodnutí
zralé. Třetí obranou je čas a písemná podoba, protože obě úrovně se v textu snáze propojí
než v ústním tlaku. Kompendium s podobnými signály pracuje i na stránce o [hustotě
žargonu](@/kompendium/detection-signatures/1-linguistic-jargon-density.md). Lidé, kteří se v
takovém prostředí cítili opakovaně „hloupí“, protože nerozuměli, potřebují v zotavení
především slyšet, že nesrozumitelnost byla vlastností sdělení, ne jejich nedostatkem.

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Charvet, S. R. (1997). *Words That Change Minds: Mastering the Language of Influence* (2. vyd.). Dubuque: Kendall/Hunt.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Metaprogramy](@/kompendium/nlp-vzorce/metaprogramy/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Metaprogramy](@/kompendium/nlp-vzorce/zakladni-pojmy/metaprogramy-pojem.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md) – příbuzné heslo (Základní pojmy NLP, Chunking)
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – příbuzné heslo (Milton-model, Artful vagueness)
- [Shoda a rozdíl](@/kompendium/nlp-vzorce/metaprogramy/shoda-a-rozdil.md) – příbuzné heslo (Metaprogramy, Sameness and difference)
- [Proč a jak](@/kompendium/nlp-vzorce/metaprogramy/filozoficky-smer.md) – příbuzné heslo (Metaprogramy, Philosophical direction)
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – příbuzné heslo (Jazykové vzorce, Hierarchy of ideas)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzné heslo (Jazykové vzorce, Chunking up)
- [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) – příbuzné heslo (Jazykové vzorce, Chunking down)

**V kompendiu**

- [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.2.3 Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Detekční signatura: Hustota žargonu](@/kompendium/detection-signatures/1-linguistic-jargon-density.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Možnosti a postupy](@/kompendium/nlp-vzorce/metaprogramy/moznosti-a-postupy.md) – předchozí heslo rodiny
- [Shoda a rozdíl](@/kompendium/nlp-vzorce/metaprogramy/shoda-a-rozdil.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
