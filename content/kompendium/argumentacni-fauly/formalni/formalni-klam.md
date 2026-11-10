+++
title = "Formální klam"
description = "Úsudek, jehož závěr z premis neplyne kvůli stavbě úsudku samé: co je formální klam, jak ho odhalit protipříkladem a proč neplatnost neznamená nepravdivý závěr."
weight = 1
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-pojem-a-princip", "fauly-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Formální klam", "Formal fallacy", "logický klam", "deduktivní klam", "neplatný úsudek", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.01"
catalog_slug = "formalni-klam"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni"
catalog_type = "concept"
catalog_type_cs = "pojem a princip"
catalog_en = "Formal fallacy"
catalog_aliases = ["logický klam", "deduktivní klam", "neplatný úsudek"]
catalog_use = "zadne"
catalog_use_cs = "výkladový pojem"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = ""
catalog_narrower = ["potvrzeni-dusledku", "popreni-predchudce", "nerozlozeny-stredni-termin", "nedovoleny-vetsi-termin", "nedovoleny-mensi-termin", "ctyri-terminy", "existencni-klam", "potvrzeni-disjunktu", "vylucujici-premisy", "zamena-kvantifikatoru", "klam-modalniho-rozsahu", "klam-maskovaneho-muze", "klam-klamu"]
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["potvrzeni-dusledku", "nerozlozeny-stredni-termin", "ctyri-terminy", "klam-klamu", "pravidlo-platnosti", "som-protipriklad"]
catalog_related_declared = ["potvrzeni-dusledku", "nerozlozeny-stredni-termin", "ctyri-terminy", "klam-klamu", "pravidlo-platnosti", "som-protipriklad"]
catalog_kompendium = ["kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/02-uvod/metodologicke-poznamky.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/argumentacni-fauly/formalni/ctyri-terminy.md", "kompendium/argumentacni-fauly/formalni/popreni-predchudce.md", "kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md", "kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-protipriklad.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md"]
catalog_prev = ""
catalog_next = "potvrzeni-dusledku"
catalog_position = 1
catalog_family_size = 14
catalog_sources = ["cook-lewandowsky-ecker-2017", "copi-cohen-mcmahon-2014", "damer-2009", "govier-2010", "hahn-oaksford-2007", "hamblin-1970", "johnson-blair-1977", "kahneman-2011", "mercier-sperber-2011", "mill-1843", "nickerson-1998", "stanovich-west-2000", "tindale-2007", "toulmin-1958", "walton-2008", "walton-reed-macagno-2008", "whately-1826", "woods-walton-1989", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "damer-2009", "govier-2010", "hamblin-1970", "johnson-blair-1977", "tindale-2007", "toulmin-1958", "walton-2008", "walton-reed-macagno-2008", "woods-walton-1989", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["mill-1843", "whately-1826"]
catalog_sources_critical = ["cook-lewandowsky-ecker-2017", "hahn-oaksford-2007", "kahneman-2011", "mercier-sperber-2011", "nickerson-1998", "stanovich-west-2000"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Vztah k technikám kompendia", "Obrana a odpověď"]
catalog_trainer_items = 3
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/formalni.toml"
+++

# Formální klam

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.01` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | pojem a princip |
| **Anglicky** | Formal fallacy |
| **Jiné názvy** | logický klam, deduktivní klam, neplatný úsudek |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | nízké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Formální klam je úsudek, jehož závěr z premis neplyne kvůli tomu, jak je úsudek postaven,
a ne kvůli tomu, o čem se v něm mluví. Deduktivně platný úsudek má takovou formu, že pravdivé
premisy nemohou vést k nepravdivému závěru. Formální klam tuto záruku jen předstírá: jeho
stavba připomíná platnou formu, ale existují úsudky téže formy, v nichž jsou premisy pravdivé
a závěr nepravdivý. Učebnice logiky proto oddělují formální klamy, které lze rozpoznat na
samotném schématu úsudku, od neformálních klamů, u nichž chyba leží v obsahu, v jazyce nebo
v kontextu sporu (Copi, Cohen a McMahon 2014). Tradiční vymezení klamu jako úsudku, který se
jeví platným, ačkoli platný není, pochází z dlouhé logické tradice a jeho meze rozebral
Hamblin v kritice toho, co nazval standardním výkladem klamů (Hamblin 1970). V tomto
katalogu je formální klam zastřešujícím pojmem rodiny: patří sem chybné úsudky s podmínkou,
jako je [potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md)
a [popření předchůdce](@/kompendium/argumentacni-fauly/formalni/popreni-predchudce.md), i
chybné kategorické sylogismy, jejichž střední, větší nebo menší termín je nesprávně rozložen.
Pro čtenáře je podstatné jedno rozlišení: neplatný úsudek nedokazuje, že je závěr nepravdivý.
Dokazuje jen to, že tento úsudek závěr neopodstatňuje.

## Původ a souvislosti

Rozbor platných a neplatných forem úsudku začíná u Aristotela, který v sylogistice popsal
kategorické úsudky se třemi termíny a ve spise o sofistických vyvráceních sestavil první
seznam klamných argumentů. Středověká logika z toho vytvořila soubor pravidel sylogismu a
mnemotechnických jmen platných modů, která se učila po staletí. V novověké učebnicové tradici
se ustálilo dělení klamů na ty, v nichž závěr z premis formálně neplyne, a na ty, v nichž je
chyba v obsahu nebo ve vyjádření; Whately takové rozlišení logických a materiálních klamů
zpracoval ve vlivné učebnici logiky (Whately 1826).
Mill zařadil chybné sylogistické úsudky mezi klamy vyvozování, a postavil je tak vedle
klamů pozorování, zobecňování a záměny pojmů (Mill 1843). Hamblin v polovině dvacátého
století ukázal, že ustálené seznamy klamů jsou nesoudržné, že jejich definice jsou vágní a že
formální logika sama nestačí k posouzení skutečných argumentů v rozhovoru (Hamblin 1970).
Na tuto kritiku navázaly dvě linie. Neformální logika zdůraznila, že běžné argumenty se
hodnotí podle relevance, dostatečnosti a přijatelnosti premis, nikoli jen podle deduktivní
platnosti (Johnson a Blair 1977). Toulmin už dříve namítal, že geometrický model formální
logiky špatně popisuje, jak se argumentuje v právu, medicíně nebo vědě (Toulmin 1958).
Woods a Walton naopak zkoušeli tradiční klamy přesně analyzovat prostředky formálních logik
(Woods a Walton 1989). [Pragma-dialektika](@/kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md) pak formální platnost zařadila jako jedno z pravidel
kritické diskuse: úsudek předložený jako logicky závazný musí být platný, případně platným
po doplnění nevyslovené premisy (van Eemeren a Grootendorst 2004).

## Struktura argumentu

Formální klam se posuzuje na schématu, které vznikne, když se z úsudku odstraní obsah a
ponechají se jen logické spojky, kvantifikátory a místa pro termíny. U výrokových úsudků jde
o spojky „jestliže, pak“, „nebo“ a „ne“: platné jsou například formy, které z podmínky a
splnění jejího předchůdce vyvozují důsledek, nebo z podmínky a popření důsledku vyvozují
popření předchůdce. Neplatné jsou jejich obrácené napodobeniny. U kategorických sylogismů jde
o vztah tří termínů, z nichž střední spojuje obě premisy a v závěru se nevyskytuje. Platnost
tu závisí na rozložení termínů, tedy na tom, zda výrok mluví o všech prvcích třídy, nebo jen
o některých. Klasická pravidla sylogismu vyžadují právě tři termíny užité v témž významu,
rozložení středního termínu aspoň v jedné premise a rozložení každého termínu závěru už v
premisách; jejich porušení dává klamy nerozloženého středního termínu, nedovoleného většího
a menšího termínu a [čtyř termínů](@/kompendium/argumentacni-fauly/formalni/ctyri-terminy.md)
(Copi, Cohen a McMahon 2014). Základním nástrojem důkazu neplatnosti je protipříklad: úsudek
se stejnou formou, jehož premisy jsou zjevně pravdivé a závěr zjevně nepravdivý. Jediný
takový protipříklad stačí, protože platnost je vlastnost formy a forma, která jednou selže,
nic nezaručuje. Z pragmatického hlediska je třeba ještě připomenout, že argumenty v běžné
řeči bývají neúplné. Pragma-dialektická rekonstrukce proto nejdřív hledá nevyslovenou
premisu, která by úsudek učinila platným, a teprve pak se ptá, zda by mluvčí takovou premisu
mohl rozumně hájit (van Eemeren a Grootendorst 1992).

## Detekční znaky

Formální klam se v rozhovoru prozrazuje spíš stavbou věty než obsahem. Prvním znakem je
obrácení podmínky: mluvčí uvede, že z A plyne B, a pak z výskytu B usuzuje na A nebo z
nepřítomnosti A na nepřítomnost B. Druhým znakem je spojení dvou tříd přes společnou
vlastnost: obě skupiny něco sdílejí, a proto se prohlásí za totožné nebo překrývající se.
Třetím znakem je posun rozsahu: premisy mluví o „některých“ nebo o určité podskupině,
závěr o „všech“. Čtvrtým znakem je klíčové slovo, které v každé premise znamená něco jiného,
takže úsudek drží pohromadě jen zvukem. Damer řadí takové vady pod porušení strukturního
kritéria dobrého argumentu, tedy požadavku, aby premisy závěr skutečně podpíraly svou
stavbou (Damer 2009). Govier upozorňuje, že u běžných argumentů je třeba nejdřív rozpoznat,
zda je mluvčí vůbec předkládá jako deduktivní, protože jinak se hodnotí jinými měřítky
(Govier 2010). Varovným signálem je také situace, kdy závěr působí velmi věrohodně nebo
odpovídá tomu, co posluchač už předtím chtěl slyšet. Věrohodnost závěru totiž zakrývá vadu
formy lépe než cokoli jiného, a to je jeden z nejlépe doložených poznatků psychologie
usuzování.

## Odlišení od platné argumentace

Ne každý úsudek, který není deduktivně platný, je klam. Většina rozumných argumentů v
medicíně, vyšetřování, soudnictví i každodenním životě je induktivní, abduktivní nebo
odvoditelná s výhradou: závěr podporují, ale nezaručují ho. Takové argumenty se hodnotí podle
síly opory, podle toho, zda odolají kritickým otázkám příslušného argumentačního schématu, a
podle toho, zda se mluvčí nechá opravit novými doklady (Walton, Reed a Macagno 2008). Klamem
se stávají teprve tehdy, když se podávají jako nevyhnutelné závěry, nebo když se z nich
vyvozuje víc, než unesou (Walton 2008). Druhé odlišení se týká platnosti a pravdivosti.
Platný úsudek může mít nepravdivou premisu a pak je závěr stejně nespolehlivý; neplatný
úsudek může mít pravdivý závěr, který je jen špatně zdůvodněn. Označit argument za formální
klam a z toho vyvodit, že jeho závěr je mylný, je samostatná chyba, kterou katalog vede jako
klam klamu. Třetí odlišení se týká kontextu. Tindale ukazuje, že posouzení argumentu závisí
na tom, komu je určen a co v daném rozhovoru lze považovat za sdílený předpoklad (Tindale
2007). Úsudek, který vypadá jako potvrzení důsledku, může být platný, pokud obě strany vědí,
že podmínka platí oběma směry. Rozhodující tedy není povrchová podoba věty, ale to, co se v
rozhovoru skutečně tvrdí.

## Stav poznání

Výzkum usuzování od šedesátých let opakovaně ukazuje, že lidé formální chyby nedělají
náhodně, ale soustavně. V úloze s výběrem karet, kterou zavedl Peter Wason, většina
účastníků při ověřování podmínky hledá případy, které ji potvrzují, a přehlíží případy, které
by ji mohly vyvrátit. Nickerson tuto úlohu zařazuje do širokého souboru jevů, v nichž se
projevuje sklon k potvrzování (Nickerson 1998). Další soustavně doloženou chybou je zkreslení
vírou: lidé posuzují platnost sylogismu podle věrohodnosti závěru, takže přijímají neplatné
úsudky s věrohodným závěrem a odmítají platné úsudky se závěrem nevěrohodným. Kahneman uvádí
neplatný sylogismus s věrohodným závěrem jako příklad situace, kdy pomalé a kontrolující
myšlení nechá projít intuitivní soud bez prověření (Kahneman 2011). Stanovich a West ukázali,
že normativně správné řešení logických úloh souvisí s rozdíly v kognitivních schopnostech a
myšlenkových dispozicích, a pro dva způsoby zpracování zavedli označení systém 1 a systém 2
(Stanovich a West 2000). Mercier a Sperber nabízejí výklad, podle něhož se usuzování vyvinulo
hlavně pro tvorbu a hodnocení argumentů v rozhovoru; lidé jsou proto přísnější k cizím
argumentům než k vlastním a ve skupinové diskusi logické úlohy řeší lépe než jednotlivě
(Mercier a Sperber 2011). Hahn a Oaksford upozorňují na opačnou stranu problému: mnohé
úvahy, které tradiční seznamy označují za klamy, jsou za určitých podmínek racionální, a
jejich sílu je proto třeba posuzovat pravděpodobnostně podle obsahu, nikoli jen podle formy
(Hahn a Oaksford 2007). Pro katalog z toho plyne dvojí opatrnost: formální chyby jsou častější,
než lidé připouštějí, ale ne každá neplatná forma je v běžné řeči známkou iracionality.

## Vztah k technikám kompendia

V kompendiu se formální klamy objevují hlavně jako stavební kameny delších řetězců. Technika
[logické diskontinuity](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) popisuje
situaci, kdy jednotlivé kroky úvahy působí platně, ale celek nedrží; jedním z mechanismů je
právě vložení neplatného kroku mezi kroky platné. Kapitola o
[kognitivních vědách](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) vysvětluje,
proč únava, spěch a citová zátěž snižují schopnost takový krok zachytit. Formální klam je
proto často chybou posluchače stejně jako mluvčího: mluvčí ho nemusí volit záměrně, stačí, že
ho posluchač pod tlakem nezkontroluje.

## Obrana a odpověď

Nejúčinnější odpovědí na formální klam je protipříklad: úsudek stejné formy s obsahem, u něhož
je na první pohled vidět, že pravdivé premisy vedou k nepravdivému závěru. Protipříklad
nemíří na osobu ani na téma, ale na stavbu úsudku, a proto se dá přijmout bez ztráty tváře;
jeho logiku podrobněji rozebírá heslo o [protipříkladu](@/kompendium/nlp-vzorce/sleight-of-mouth/som-protipriklad.md)
v katalogu NLP vzorců. Druhou odpovědí je vyslovit chybějící premisu. Pokud mluvčí usuzuje z
podmínky obráceně, lze se zeptat, zda tvrdí, že podmínka platí oběma směry; pokud ano, spor
se přesouvá k věcné otázce, kterou lze ověřit, a pokud ne, úsudek padá. Pragma-dialektika
popisuje právě takové zviditelnění nevyslovených premis jako cestu, jak vrátit diskusi k
pravidlu platnosti (van Eemeren a Grootendorst 2004). Třetí odpovědí je oddělit platnost od
pravdivosti: uznat, že závěr může být pravdivý, a žádat pro něj jiný, lepší důvod. Tím se
předejde klamu klamu i zbytečné eskalaci sporu. Výzkum inokulace naznačuje, že předem poznaná
struktura zavádějícího argumentu snižuje jeho účinek, a to i když se později objeví v novém
obsahu (Cook, Lewandowsky a Ecker 2017). U formálních klamů to znamená znát několik
základních neplatných forem tak dobře, aby je posluchač poznal i v rychlém rozhovoru.
Učebnicové metody, jako jsou Vennovy diagramy pro sylogismy nebo pravdivostní tabulky pro
výrokové úsudky, slouží k ověření v klidu, když je na posouzení čas (Copi, Cohen a McMahon
2014).

## Literatura

- Cook, J., Lewandowsky, S., & Ecker, U. K. H. (2017). Neutralizing misinformation through inoculation: Exposing misleading argumentation techniques reduces their influence. *PLoS ONE*, 12(5), e0175799.
- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Govier, T. (2010). *A Practical Study of Argument* (7. vyd.). Belmont: Wadsworth.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Hamblin, C. L. (1970). *Fallacies*. London: Methuen.
- Johnson, R. H., & Blair, J. A. (1977). *Logical Self-Defense*. Toronto: McGraw-Hill Ryerson.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Mercier, H., & Sperber, D. (2011). Why do humans reason? Arguments for an argumentative theory. *Behavioral and Brain Sciences*, 34(2), 57–74.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Tindale, C. W. (2007). *Fallacies and Argument Appraisal*. Cambridge: Cambridge University Press.
- Toulmin, S. E. (1958). *The Uses of Argument*. Cambridge: Cambridge University Press.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.
- Walton, D., Reed, C., & Macagno, F. (2008). *Argumentation Schemes*. Cambridge: Cambridge University Press.
- Whately, R. (1826). *Elements of Logic*. London: J. Mawman.
- Woods, J., & Walton, D. (1989). *Fallacies: Selected Papers 1972–1982*. Dordrecht: Foris.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.
- van Eemeren, F. H., & Grootendorst, R. (2004). *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach*. Cambridge: Cambridge University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) – zvláštní případ tohoto hesla
- [Popření předchůdce](@/kompendium/argumentacni-fauly/formalni/popreni-predchudce.md) – zvláštní případ tohoto hesla
- [Nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md) – zvláštní případ tohoto hesla
- [Nedovolený větší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md) – zvláštní případ tohoto hesla
- [Nedovolený menší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-mensi-termin.md) – zvláštní případ tohoto hesla
- [Čtyři termíny](@/kompendium/argumentacni-fauly/formalni/ctyri-terminy.md) – zvláštní případ tohoto hesla
- [Existenční klam](@/kompendium/argumentacni-fauly/formalni/existencni-klam.md) – zvláštní případ tohoto hesla
- [Potvrzení disjunktu](@/kompendium/argumentacni-fauly/formalni/potvrzeni-disjunktu.md) – zvláštní případ tohoto hesla
- [Vylučující premisy](@/kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md) – zvláštní případ tohoto hesla
- [Záměna kvantifikátorů](@/kompendium/argumentacni-fauly/formalni/zamena-kvantifikatoru.md) – zvláštní případ tohoto hesla
- [Klam modálního rozsahu](@/kompendium/argumentacni-fauly/formalni/klam-modalniho-rozsahu.md) – zvláštní případ tohoto hesla
- [Klam maskovaného muže](@/kompendium/argumentacni-fauly/formalni/klam-maskovaneho-muze.md) – zvláštní případ tohoto hesla
- [Klam klamu](@/kompendium/argumentacni-fauly/formalni/klam-klamu.md) – zvláštní případ tohoto hesla

**Příbuzná hesla**

- [Potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) – příbuzné heslo (Formální klamy, Affirming the consequent)
- [Nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md) – příbuzné heslo (Formální klamy, Undistributed middle)
- [Čtyři termíny](@/kompendium/argumentacni-fauly/formalni/ctyri-terminy.md) – příbuzné heslo (Formální klamy, Four terms)
- [Klam klamu](@/kompendium/argumentacni-fauly/formalni/klam-klamu.md) – příbuzné heslo (Formální klamy, Argument from fallacy)
- [Pravidlo platnosti](@/kompendium/argumentacni-fauly/teorie-argumentace/pravidlo-platnosti.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Validity rule)
- [Protipříklad](@/kompendium/nlp-vzorce/sleight-of-mouth/som-protipriklad.md) – příbuzné heslo (NLP vzorce: Sleight of Mouth, Counter-example)

**V kompendiu**

- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [2.4 Metodologické poznámky k taxonomii](@/kompendium/02-uvod/metodologicke-poznamky.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
