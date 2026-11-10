+++
title = "Falzifikovatelnost NLP"
description = "Lze tvrzení NLP vyvrátit? Rozbor toho, jak se testovatelné hypotézy oboru mění v nevyvratitelné a podle čeho tuto imunizaci poznat."
weight = 10
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-kriticke-hodnoceni", "nlp-pojem", "nlp-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Falzifikovatelnost NLP", "Falsifiability of NLP", "nevyvratitelnost NLP", "testovatelnost NLP", "Kritické hodnocení NLP", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-22.10"
catalog_slug = "falzifikovatelnost-nlp"
catalog_family = "kriticke-hodnoceni"
catalog_family_code = "22"
catalog_family_title = "Kritické hodnocení NLP"
catalog_family_en = "Critical appraisal of NLP"
catalog_part = "kriticke-hodnoceni.b"
catalog_type = "concept"
catalog_type_cs = "pojem"
catalog_en = "Falsifiability of NLP"
catalog_aliases = ["nevyvratitelnost NLP", "testovatelnost NLP"]
catalog_use = "zadne"
catalog_use_cs = "výkladový pojem"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "nlp-jako-pseudoveda"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["nlp-jako-pseudoveda"]
catalog_related = ["odvolani-na-nevedomost", "nefalzifikovatelnost", "neni-selhani-jen-zpetna-vazba", "kdyz-to-nefunguje-udelej-neco-jineho", "predpoklady-jako-pracovni-hypotezy", "ramec-dukazu", "selhani-jako-zpetna-vazba-vzorec", "testovani-kotvy", "nlp-jako-pseudoveda", "kargokultovni-psychologie", "jak-cist-tvrzeni-nlp"]
catalog_related_declared = ["neni-selhani-jen-zpetna-vazba", "kdyz-to-nefunguje-udelej-neco-jineho", "predpoklady-jako-pracovni-hypotezy", "kargokultovni-psychologie", "jak-cist-tvrzeni-nlp"]
catalog_kompendium = ["kompendium/techniques/ea-7-2-3-popper-falsification.md", "kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md", "kompendium/quick-reference/qr-ea-1-3-1.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/predpoklady/mapa-neni-uzemi.md", "kompendium/nlp-vzorce/predpoklady/neni-selhani-jen-zpetna-vazba.md", "kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md", "kompendium/nlp-vzorce/zakladni-pojmy/preferovany-reprezentacni-system.md", "kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md", "kompendium/techniques/ea-7-2-3-popper-falsification.md"]
catalog_prev = "nlp-v-koucinku-vyzkum"
catalog_next = "historie-nlp"
catalog_position = 10
catalog_family_size = 14
catalog_sources = ["bandler-grinder-1979", "dilts-1980", "festinger-1957", "gilovich-1991", "hassan-1988", "lilienfeld-2015", "oconnor-seymour-1990", "sharpley-1984", "sharpley-1987", "sturt-2012", "wiseman-2012", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1979", "dilts-1980", "oconnor-seymour-1990"]
catalog_sources_roots = []
catalog_sources_critical = ["festinger-1957", "gilovich-1991", "hassan-1988", "lilienfeld-2015", "sharpley-1984", "sharpley-1987", "sturt-2012", "wiseman-2012", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Tři druhy tvrzení", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/kriticke-hodnoceni.b.toml"
+++

# Falzifikovatelnost NLP

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-22.10` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Kritické hodnocení NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/_index.md) |
| **Druh** | pojem |
| **Anglicky** | Falsifiability of NLP |
| **Jiné názvy** | nevyvratitelnost NLP, testovatelnost NLP |
| **Obecnější heslo** | [NLP jako pseudověda](@/kompendium/nlp-vzorce/kriticke-hodnoceni/nlp-jako-pseudoveda.md) |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Falzifikovatelnost NLP je otázka, zda lze tvrzení neurolingvistického programování
formulovat tak, aby je nějaké myslitelné pozorování mohlo vyvrátit, a zda je obor ochoten
takové pozorování přijmout. Pojem vychází z kritéria, které do filozofie vědy uvedl Karl
Popper a které kompendium rozebírá na stránce [Popper:
Falsifikace](@/kompendium/techniques/ea-7-2-3-popper-falsification.md): empirické tvrzení
musí zakazovat některé výsledky, jinak o světě nic neříká. U NLP je otázka naléhavá ze
dvou důvodů. Část jeho tvrzení byla formulována testovatelně a testy nevyšla dobře. Jiná
část, zejména takzvané předpoklady, je formulována tak, že každý neúspěch lze přičíst
něčemu jinému než metodě. Sharpley vtělil dilema už do názvu své práce: jsou výsledky
výzkumu NLP nepříznivé, nebo je teorie netestovatelná (Sharpley 1987)? Pro obor je
nepříznivá kterákoli odpověď, a právě proto se v kritické literatuře k této otázce
opakovaně vrací.

## Původ a souvislosti

Rané texty NLP představovaly obor jako popis pozorovatelných pravidelností: smyslová slova
v řeči mají odrážet převládající reprezentační systém, pohyby očí mají ukazovat, ke
kterému systému člověk právě přistupuje, a přizpůsobení se jazyku druhého má zvyšovat
důvěru (Bandler a Grinder 1979; Dilts a kol. 1980). Taková tvrzení jsou falzifikovatelná a
v sedmdesátých a osmdesátých letech je výzkumníci skutečně testovali. Sharpley ve svém
přehledu nenašel pro tvrzení o preferovaném reprezentačním systému a o shodě predikátů
přesvědčivou podporu (Sharpley 1984). Část zastánců NLP reagovala námitkou, že výzkumníci
nerozuměli metodě nebo ji neprováděli tak, jak ji učí zkušení praktici. Sharpley na to
odpověděl úvahou, která se stala jádrem debaty: pokud lze NLP správně provést jen tak, že
to žádný nezávislý výzkumník nedokáže ověřit, pak se tvrzení vymyká empirickému testu
(Sharpley 1987). Pozdější práce, například test tvrzení, že pohyby očí prozrazují lež,
ukázaly, že kde je hypotéza formulována jasně, dá se otestovat a v daném případě neobstojí
(Wiseman a kol. 2012).

## Struktura vzorce

Strukturálně jde o přechod mezi dvěma druhy tvrzení. Testovatelné tvrzení říká, co se
stane a co se nestane: lidé s údajně vizuální preferencí budou na vizuální predikáty
reagovat lépe než na jiné. Imunizované tvrzení si ponechá stejná slova, ale přidá podmínky,
které nelze nezávisle ověřit: technika funguje, pokud ji praktik provede se správnou
kalibrací, ve správném stavu a v raportu, a pokud klient nemá skrytou část, která se
změně brání. Každý neúspěch pak doloží, že některá podmínka nebyla splněna, a žádný
neúspěch nedoloží, že metoda nefunguje. Kritická literatura popisuje toto užívání
dodatečných vysvětlení jako typický znak pseudovědeckých přístupů (Lilienfeld, Lynn a Lohr
2015). V NLP mají k imunizaci zvláštní nástroj: předpoklady jako [neexistuje selhání, jen
zpětná vazba](@/kompendium/nlp-vzorce/predpoklady/neni-selhani-jen-zpetna-vazba.md) nebo
„když něco nefunguje, udělej něco jiného“ (O'Connor a Seymour 1990). V praxi jednotlivého
rozhovoru mohou být rozumnou pracovní maximou, protože podporují pružnost. Jakmile se však
uplatní na hodnocení metody samé, mění každý negativní výsledek na podnět k dalšímu
zkoušení a znemožňují závěr, že technika neúčinkuje. Lakatos by takový vývoj popsal jako
degenerující výzkumný program, který chrání své jádro přidáváním pomocných hypotéz, aniž by
předpovídal nové jevy.

## Detekční znaky

Imunizaci tvrzení NLP lze rozpoznat v rozhovoru i v textu. Mluvčí na otázku po studiích
odpovídá, že výzkumníci metodu „nepochopili“, a nedodá, jak by ji pochopený výzkum testoval.
Negativní výsledek se připíše nedostatečné kvalifikaci, chybějící kalibraci, odporu klienta
nebo „nevhodnému kontextu“, ale pozitivní výsledek se připíše metodě. Tvrzení se v čase
posouvá: když se ukáže, že pohyby očí nepředpovídají smyslový systém, prohlásí se, že
každý člověk má své vlastní uspořádání, které je třeba kalibrovat individuálně, takže žádné
obecné tvrzení už nezbývá. Předpoklady se vydávají za „užitečné“, nikoli za pravdivé, ale
v reklamě se o nich mluví jako o objevech. Kompendium popisuje stejný mechanismus obecně
jako [imunizaci proti
falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md); u NLP je
zvláštní tím, že nástroje imunizace jsou součástí samotné doktríny. Nepříznivých výsledků se
přitom nashromáždilo dost na to, aby revizi tvrzení vyžadovaly (Witkowski 2010); populární
učebnice a výcviky je však do velké míry nepromítají.

## Tři druhy tvrzení

Pro posouzení falzifikovatelnosti je užitečné tvrzení NLP třídit do tří skupin. První
skupinu tvoří filozofická východiska, například že [mapa není území](@/kompendium/nlp-vzorce/predpoklady/mapa-neni-uzemi.md) nebo že zkušenost má
strukturu. Ta nejsou empirickými hypotézami a falzifikace na ně nedopadá; lze je posuzovat
jen podle vnitřní soudržnosti a podle toho, zda z nich něco plyne. Druhou skupinu tvoří
popisná tvrzení o lidech: že smyslová slova odrážejí převládající systém, že pohyby očí
souvisejí s druhem vybavování nebo že lidé mají stálé metaprogramy. Ta jsou testovatelná a
právě jich se týká většina výzkumu. Třetí skupinu tvoří tvrzení o účinku technik, například
že určitý postup odstraní fobii nebo změní přesvědčení. I ta jsou testovatelná, ale vyžadují
náročnější studie s kontrolní skupinou a sledováním. Imunizace spočívá v tom, že se tvrzení
druhé a třetí skupiny při kritice stáhnou do první skupiny („jde jen o užitečný model“) a v
reklamě se z ní znovu vynoří jako ověřené výsledky. Kdo tento pohyb mezi skupinami sleduje,
pozná imunizaci i bez znalosti jednotlivých studií.

## Legitimní a manipulativní užití

Legitimní užití pojmu je analytické. Výzkumník, klinik nebo učitel kritického myšlení se
ptá, které z tvrzení NLP jsou empirické, jak by je bylo možné testovat a co testy ukázaly.
Takové užití je férové k NLP i k jeho kritikům: uznává, že část tvrzení byla formulována
jasně a dala se proto vyvrátit, a odlišuje je od filozofických východisek, u nichž
falzifikace není na místě. Sama literatura NLP předpoklady často představuje
jako užitečná pracovní přesvědčení, ne jako ověřené pravdy; pak ale nesmějí sloužit jako
doklad účinnosti. Manipulativní užití je obrácené: nevyvratitelnost
se vydává za sílu. Tvrzení, které „nemůže selhat“, působí přesvědčivě, a kdo ho přijme,
ztrácí měřítko, podle kterého by poznal, že mu metoda nepomáhá. Ve vztahu, kde jedna strana
určuje, co se počítá jako úspěch, může nevyvratitelný rámec udržovat člověka v kurzu, terapii
nebo skupině dlouho poté, co by sám usoudil, že nic nepřináší. Festinger ukázal, jak lidé
investovaní do přesvědčení vykládají protichůdné zkušenosti tak, aby přesvědčení
zachovali (Festinger 1957).

## Stav důkazů

Tam, kde se tvrzení NLP podařilo formulovat testovatelně, výzkum je převážně nepodpořil.
To platí pro [preferovaný reprezentační systém](@/kompendium/nlp-vzorce/zakladni-pojmy/preferovany-reprezentacni-system.md) a shodu predikátů (Sharpley 1984; Sharpley
1987), pro [oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md) jako vodítko k odhalení lži (Wiseman a kol. 2012) i pro
širší soubor kontrolovaných studií, které prošel Witkowski (Witkowski 2010). Systematický
přehled účinků na zdraví nenašel dost kvalitních studií, aby bylo možné o účinnosti
rozhodnout (Sturt a kol. 2012). U dalších tvrzení se otázka nedostala tak daleko, protože
nebyla formulována tak, aby se dala testovat. Výsledný obraz je asymetrický: testovatelná
jádra neobstála a zbytek se testu vyhýbá. To samo o sobě nedokazuje, že každá technika
pod značkou NLP je bez účinku; dokazuje to, že obor nedodal tvrzení, která by byla zároveň
testovatelná a podpořená.

## Obrana a zotavení

Nejúčinnější obranou je zeptat se předem, co by se muselo stát, aby mluvčí uznal, že
metoda nefunguje. Pokud odpověď neexistuje, nejde o empirické tvrzení, ale o přesvědčení, a
tak je s ním také dobré zacházet. Druhou obranou je stanovit si vlastní měřítko úspěchu
před začátkem kurzu, terapie nebo koučinku, zapsat si ho a po dohodnuté době ho porovnat se
skutečností, nezávisle na výkladu praktika. Třetí obranou je sledovat asymetrii připisování:
pokud se úspěchy přičítají metodě a neúspěchy vám, je rámec nastaven tak, aby metoda
nemohla prohrát (Gilovich 1991). Lidé, kteří v takovém rámci strávili delší dobu, popisují
pocit, že selhávají opakovaně a vlastní vinou; zotavení proto zahrnuje i zpětné přerámování
těchto zkušeností jako výsledku nevyvratitelné doktríny, ne osobní neschopnosti. Pomáhá
rozhovor s někým mimo prostředí, kde doktrína platí, a postupný návrat k vlastním
kritériím toho, co je zlepšení (Hassan 1988).

## Literatura

- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Festinger, L. (1957). *A Theory of Cognitive Dissonance*. Stanford: Stanford University Press.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Lilienfeld, S. O., Lynn, S. J., & Lohr, J. M. (Eds.) (2015). *Science and Pseudoscience in Clinical Psychology* (2. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Sharpley, C. F. (1984). Predicate matching in NLP: A review of research on the preferred representational system. *Journal of Counseling Psychology*, 31(2), 238–248.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Sturt, J., Ali, S., Robertson, W., Metcalfe, D., Grove, A., Bourne, C., & Bridle, C. (2012). Neurolinguistic programming: A systematic review of the effects on health outcomes. *British Journal of General Practice*, 62(604), e757–e764.
- Wiseman, R., Watt, C., ten Brinke, L., Porter, S., Couper, S.-L., & Rankin, C. (2012). The eyes don't have it: Lie detection and neuro-linguistic programming. *PLoS ONE*, 7(7), e40259.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Kritické hodnocení NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [NLP jako pseudověda](@/kompendium/nlp-vzorce/kriticke-hodnoceni/nlp-jako-pseudoveda.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Odvolání na nevědomost](@/kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md) – příbuzné heslo (Argumentační fauly: Klamy relevance, Appeal to ignorance)
- [Nefalzifikovatelné tvrzení](@/kompendium/argumentacni-fauly/predpoklady-argumentu/nefalzifikovatelnost.md) – příbuzné heslo (Argumentační fauly: Klamy předpokladu, Unfalsifiability)
- [Neexistuje selhání, jen zpětná vazba](@/kompendium/nlp-vzorce/predpoklady/neni-selhani-jen-zpetna-vazba.md) – příbuzné heslo (Předpoklady NLP, There is no failure, only feedback)
- [Když něco nefunguje, udělej něco jiného](@/kompendium/nlp-vzorce/predpoklady/kdyz-to-nefunguje-udelej-neco-jineho.md) – příbuzné heslo (Předpoklady NLP, If it is not working, do something else)
- [Předpoklady jako pracovní hypotézy](@/kompendium/nlp-vzorce/predpoklady/predpoklady-jako-pracovni-hypotezy.md) – příbuzné heslo (Předpoklady NLP, Presuppositions as working assumptions)
- [Rámec důkazu](@/kompendium/nlp-vzorce/reframing/ramec-dukazu.md) – příbuzné heslo (Reframing a rámce, Evidence frame)
- [Přerámování selhání na zpětnou vazbu](@/kompendium/nlp-vzorce/reframing/selhani-jako-zpetna-vazba-vzorec.md) – příbuzné heslo (Reframing a rámce, Failure into feedback)
- [Testování kotvy](@/kompendium/nlp-vzorce/kotveni/testovani-kotvy.md) – příbuzné heslo (Kotvení, Testing an anchor)
- [NLP jako pseudověda](@/kompendium/nlp-vzorce/kriticke-hodnoceni/nlp-jako-pseudoveda.md) – příbuzné heslo (Kritické hodnocení NLP, NLP as pseudoscience)
- [NLP jako kargokultovní psychologie](@/kompendium/nlp-vzorce/kriticke-hodnoceni/kargokultovni-psychologie.md) – příbuzné heslo (Kritické hodnocení NLP, NLP as cargo-cult psychology)
- [Jak číst tvrzení NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/jak-cist-tvrzeni-nlp.md) – příbuzné heslo (Kritické hodnocení NLP, How to read NLP claims)

**V kompendiu**

- [EA-7.2.3 Popper: Falsifikace](@/kompendium/techniques/ea-7-2-3-popper-falsification.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Rychlá karta EA-1.3.1: Imunizace proti falsifikaci](@/kompendium/quick-reference/qr-ea-1-3-1.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Výzkum NLP v koučinku](@/kompendium/nlp-vzorce/kriticke-hodnoceni/nlp-v-koucinku-vyzkum.md) – předchozí heslo rodiny
- [Historie NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/historie-nlp.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
