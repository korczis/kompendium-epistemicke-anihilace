+++
title = "Nedovolený menší termín"
description = "Sylogismus, jehož závěr rozšíří menší termín na celou třídu, o níž premisy mluví jen zčásti: formální kostra stereotypu z vybraného vzorku, znaky, odlišení a obrana."
weight = 6
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Nedovolený menší termín", "Illicit minor", "nedovolené rozšíření menšího termínu", "nedovolená distribuce menšího termínu", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.06"
catalog_slug = "nedovoleny-mensi-termin"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Illicit minor"
catalog_aliases = ["nedovolené rozšíření menšího termínu", "nedovolená distribuce menšího termínu"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["nerozlozeny-stredni-termin", "nedovoleny-vetsi-termin", "existencni-klam", "ukvapene-zobecneni", "prilis-siroke-zobecneni", "univerzalni-kvantifikator"]
catalog_related_declared = ["nedovoleny-vetsi-termin", "nerozlozeny-stredni-termin", "ukvapene-zobecneni", "prilis-siroke-zobecneni", "univerzalni-kvantifikator"]
catalog_kompendium = ["kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/03-zakladni-kategorie/biasy/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/03-zakladni-kategorie/biasy/_index.md", "kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md", "kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md", "kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md", "kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md", "kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md", "kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "nedovoleny-vetsi-termin"
catalog_next = "ctyri-terminy"
catalog_position = 6
catalog_family_size = 14
catalog_sources = ["cook-lewandowsky-ecker-2017", "copi-cohen-mcmahon-2014", "damer-2009", "gilovich-1991", "govier-2010", "johnson-blair-1977", "mill-1843", "stanovich-west-2000", "tversky-kahneman-1971", "tversky-kahneman-1974", "walton-2008", "walton-reed-macagno-2008", "whately-1826", "eemeren-grootendorst-2004"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "damer-2009", "govier-2010", "johnson-blair-1977", "walton-2008", "walton-reed-macagno-2008", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["mill-1843", "whately-1826"]
catalog_sources_critical = ["cook-lewandowsky-ecker-2017", "gilovich-1991", "stanovich-west-2000", "tversky-kahneman-1971", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/formalni.toml"
+++

# Nedovolený menší termín

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.06` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Illicit minor |
| **Jiné názvy** | nedovolené rozšíření menšího termínu, nedovolená distribuce menšího termínu |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Nedovolený menší termín je formální klam kategorického sylogismu, v němž je menší termín v
závěru rozložen, tedy vztažen na všechny prvky své třídy, ačkoli v menší premise rozložen
není. Menší termín je podmětem závěru a vyskytuje se v menší premise. Stejně jako u většího
termínu platí pravidlo, že závěr nesmí mluvit o celé třídě, pokud o ní celé nemluvila
premisa (Copi, Cohen a McMahon 2014). Typická podoba zní: všechna M jsou P, všechna M jsou S,
tedy všechna S jsou P. Druhá premisa říká, že třída M leží uvnitř třídy S, ale nic neříká o
těch S, která nejsou M. Závěr přesto vyslovuje soud o všech S. V běžném uvažování má klam
velmi rozšířenou podobu: o skupině, kterou známe jen z určitého výběru, se vyvozuje závěr o
celé skupině, přičemž výběr tvoří právě ti, kdo mají hledanou vlastnost. Pro kompendium je
klam důležitý jako formální kostra stereotypu a ukvapeného zobecnění: soud o celé kategorii
lidí se opírá o případy, které byly vybrány podle téže vlastnosti, jež se pak kategorii
připisuje.

## Původ a souvislosti

Pravidlo, podle něhož žádný termín nesmí být rozložen v závěru, nebyl-li rozložen v premise,
pochází z tradiční sylogistiky a tradiční výklad ho uváděl jako dvě chyby podle toho, o který
krajní termín jde. Učebnicová logika devatenáctého století tyto chyby vykládala jako
nedovolené rozšíření termínu a řadila je ke klamům, které jsou viditelné na samotné formě
(Whately 1826). Mill se problému dotkl z jiné strany: v jeho pojetí stojí každá obecná
premisa sylogismu na předchozím zobecnění ze zkušenosti, a sylogismus je proto jen tak dobrý,
jak dobré je toto zobecnění (Mill 1843). Nedovolený menší termín je místem, kde se obě roviny
setkávají: formálně jde o porušení pravidla rozložení, obsahově o zobecnění, které překročí
výběr, z něhož vzniklo. Moderní teorie argumentace proto podobné úsudky posuzuje i podle
kritérií dostatečnosti a reprezentativnosti dokladů, nejen podle formy (Johnson a Blair
1977). [Pragma-dialektika](@/kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md) připomíná, že úsudek předložený jako závazný musí být platný; pokud
mluvčí zobecňuje induktivně, má to říct a nést za zobecnění důkazní břemeno (van Eemeren a
Grootendorst 2004).

## Struktura argumentu

Úsudek má tři části. První premisa konstatuje vlastnost u určité skupiny případů: všechny
odhalené podvody, všechny oběti, všichni pacienti, kterým léčba pomohla. Druhá premisa uvádí,
že všechny tyto případy patří do širší kategorie: týkaly se jednoho kraje, šlo o seniory, šlo
o mladé lidi. Závěr tvrdí, že vlastnost má celá širší kategorie. Formálně se rozšiřuje menší
termín: premisa mluví o seniorech, kteří byli oběťmi, závěr o všech seniorech. Obsahově se
ztrácí otázka, jak byl výběr vytvořen. Pokud byly případy vybrány právě podle vlastnosti,
kterou závěr kategorii připisuje, nemůže výběr o kategorii jako celku nic říct. Platný závěr
z týchž premis je slabší: někteří S jsou P, za předpokladu, že nějaká M skutečně existují.
Damer takové úsudky rozebírá i z hlediska dostatečnosti dokladů, protože tatáž chyba se
v neformální podobě projevuje jako zobecnění z nedostatečného nebo nereprezentativního
vzorku (Damer 2009). Formální rozbor má výhodu v tom, že chybu ukáže i bez znalosti čísel:
stačí vidět, že závěr mluví o větší třídě, než o jaké mluvily premisy.

## Detekční znaky

Klam se ohlašuje přechodem od „ti, které jsme viděli“ k „všichni“. Mluvčí popíše skupinu
případů, často s mnoha podrobnostmi, a závěr pak vysloví o kategorii, do níž případy patří.
Typický je obrat „ukazuje se, že…“ nebo „je vidět, že…“ připojený k soudu o celé skupině
lidí. Druhým znakem je chybějící informace o případech, které vlastnost nemají: senioři,
kteří podvodníkům nenaletěli, žadatelé, u nichž kontrola nic nenašla, pacienti, kterým postup
nepomohl. Třetím znakem je, že vzorek byl vytvořen procesem, který vlastnost předem zvýhodnil:
policie kontroluje určité oblasti, média referují o nápadných případech, odborník vidí jen
pacienty, kteří přišli. V jazyce se klam často opírá o slova, která z několika případů dělají
zákon; heslo o [univerzálních kvantifikátorech](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md)
v katalogu NLP vzorců popisuje, jak slova „všichni“ a „vždycky“ mění jednotlivou zkušenost v
pravidlo bez výjimek. Govier doporučuje u každého zobecnění ptát se, na jakém vzorku stojí a
zda vzorek mohl být vybrán tak, že závěr předem zvýhodnil (Govier 2010).

## Odlišení od platné argumentace

Platnou podobou úsudku je závěr omezený na část kategorie: z toho, že všechny odhalené
případy byly podvody a všechny se týkaly jednoho kraje, plyne, že někteří žadatelé z kraje
podváděli. Tento závěr je pravdivý, pokud jsou pravdivé premisy, a nic víc netvrdí. Druhým
odlišením je induktivní zobecnění z reprezentativního vzorku. Pokud byl vzorek vybrán náhodně
z celé kategorie a je dostatečně velký, je závěr o kategorii rozumný, i když jen
pravděpodobný; takový úsudek se však nehodnotí jako sylogismus, ale podle kritérií induktivní
podpory (Walton 2008). Třetím odlišením je úsudek, v němž je menší termín rozložen už v
premise: pokud druhá premisa zní „všechna S jsou M“, tedy že každý člen kategorie patří do
zkoumané skupiny, pak závěr o všech S platně plyne. Rozdíl mezi „všechny oběti byly senioři“ a
„všichni senioři byli oběťmi“ je přesně rozdílem mezi neplatným a platným úsudkem. Teorie
argumentačních schémat k tomu přidává [kritické otázky](@/kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md) po reprezentativnosti, které by měl
každý takový úsudek unést (Walton, Reed a Macagno 2008).

## Stav poznání

Formální chyba má dobře doložený psychologický protějšek. Tversky a Kahneman popsali víru v
[zákon malých čísel](@/kompendium/argumentacni-fauly/statisticke/zakon-malych-cisel.md): lidé očekávají, že i malý vzorek bude věrně odpovídat celé populaci, a
proto z něj vyvozují příliš silné závěry (Tversky a Kahneman 1971). V navazující práci
ukázali, že úsudek podle reprezentativnosti vede k přehlížení velikosti vzorku i základních
četností (Tversky a Kahneman 1974). Gilovich rozebral, jak lidé hodnotí souvislost dvou
vlastností podle případů, kde se obě vyskytují spolu, a přehlížejí případy, kde se vyskytuje
jen jedna nebo žádná (Gilovich 1991). Takový sklon může upevňovat přesvědčení o
souvislostech, které ve skutečném rozložení případů nejsou. Stanovich a West doložili, že náchylnost k chybám v
logických i pravděpodobnostních úlohách souvisí s rozdíly v kognitivních schopnostech a v
myšlenkových dispozicích, takže tutéž chybu nelze odbýt jako vzácné selhání (Stanovich a West
2000). Heslo o [heuristikách úsudku](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) a
kapitola o [kognitivních biasech](@/kompendium/03-zakladni-kategorie/biasy/_index.md) ukazují,
jak se tyto sklony využívají v manipulaci veřejným míněním, kde se z vybraných případů
vytvářejí soudy o celých skupinách lidí.

## Obrana a odpověď

Odpověď začíná otázkou po případech, které do výběru nespadly: kolik členů kategorie mělo
vlastnost, kterou závěr připisuje všem, a kolik ji nemělo? Pokud mluvčí odpoví, že o
ostatních nic neví, je závěr třeba omezit na „někteří“. Druhou odpovědí je otočit premisu a
ukázat rozdíl: tvrdí mluvčí, že všechny oběti byly senioři, nebo že všichni senioři byli
oběťmi? Jen druhé tvrzení by závěr unesl. Třetí odpovědí je ptát se, jak byl výběr vytvořen.
Pokud se případy dostaly do výběru právě kvůli vlastnosti, kterou závěr zobecňuje, nemůže
výběr o kategorii nic říct. Protipříklad stejné formy pomáhá ukázat vadu bez sporu o téma:
všichni nositelé Nobelovy ceny za fyziku jsou vědci, všichni jsou zároveň lidé, tedy všichni
lidé jsou vědci? Absurdní závěr ukáže, že forma nic nezaručuje (Copi, Cohen
a McMahon 2014). U veřejných tvrzení o skupinách lidí je namístě žádat údaje o celé skupině a
způsobu výběru dřív, než se závěr přijme. Výzkum inokulace naznačuje, že lidé, kteří předem
poznali zavádějící techniky argumentace, jsou vůči nim odolnější i u témat, kde mají silné
postoje (Cook, Lewandowsky a Ecker 2017). Příbuznými chybami rodiny jsou
[nedovolený větší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md)
a [nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md).

## Literatura

- Cook, J., Lewandowsky, S., & Ecker, U. K. H. (2017). Neutralizing misinformation through inoculation: Exposing misleading argumentation techniques reduces their influence. *PLoS ONE*, 12(5), e0175799.
- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Govier, T. (2010). *A Practical Study of Argument* (7. vyd.). Belmont: Wadsworth.
- Johnson, R. H., & Blair, J. A. (1977). *Logical Self-Defense*. Toronto: McGraw-Hill Ryerson.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Tversky, A., & Kahneman, D. (1971). Belief in the law of small numbers. *Psychological Bulletin*, 76(2), 105–110.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.
- Walton, D., Reed, C., & Macagno, F. (2008). *Argumentation Schemes*. Cambridge: Cambridge University Press.
- Whately, R. (1826). *Elements of Logic*. London: J. Mawman.
- van Eemeren, F. H., & Grootendorst, R. (2004). *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach*. Cambridge: Cambridge University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md) – příbuzné heslo (Formální klamy, Undistributed middle)
- [Nedovolený větší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md) – příbuzné heslo (Formální klamy, Illicit major)
- [Existenční klam](@/kompendium/argumentacni-fauly/formalni/existencni-klam.md) – příbuzné heslo (Formální klamy, Existential fallacy)
- [Ukvapené zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/ukvapene-zobecneni.md) – příbuzné heslo (Klamy předpokladu, Hasty generalisation)
- [Příliš široké zobecnění](@/kompendium/argumentacni-fauly/predpoklady-argumentu/prilis-siroke-zobecneni.md) – příbuzné heslo (Klamy předpokladu, Sweeping generalisation)
- [Univerzální kvantifikátor](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md) – příbuzné heslo (NLP vzorce: Meta-model, Universal quantifier)

**V kompendiu**

- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Nedovolený větší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md) – předchozí heslo rodiny
- [Čtyři termíny](@/kompendium/argumentacni-fauly/formalni/ctyri-terminy.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
