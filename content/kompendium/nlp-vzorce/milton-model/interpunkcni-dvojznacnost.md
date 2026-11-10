+++
title = "Interpunkční dvojznačnost"
description = "Vzorec Milton-modelu, v němž hranice vět splývají, pauzy padají na nečekaná místa a věty zůstávají nedokončené: jak se pozná, co o něm víme a jak se bránit."
weight = 14
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
parent = "kompendium-nlp-vzorce-milton-model"
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Interpunkční dvojznačnost", "Punctuation ambiguity", "přesahová věta", "nesprávně umístěná pauza", "nedokončená věta", "Milton-model", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-04.14"
nlp_slug = "interpunkcni-dvojznacnost"
nlp_family = "milton-model"
nlp_family_code = "04"
nlp_family_title = "Milton-model"
nlp_family_en = "Milton Model"
nlp_part = "milton-model.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Punctuation ambiguity"
nlp_aliases = ["přesahová věta", "nesprávně umístěná pauza", "nedokončená věta"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "milton-model"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["milton-model"]
nlp_related = ["vlozene-prikazy", "analogove-znaceni", "fonologicka-dvojznacnost", "syntakticka-dvojznacnost", "rozsahova-dvojznacnost", "konfuzni-technika", "preruseni-vzorce"]
nlp_related_declared = ["fonologicka-dvojznacnost", "syntakticka-dvojznacnost", "vlozene-prikazy", "analogove-znaceni", "konfuzni-technika", "preruseni-vzorce"]
nlp_kompendium = ["kompendium/techniques/ea-1-4-1-prosodicka-dominance.md", "kompendium/techniques/ea-1-1-2-informacni-pretizeni.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/milton-model/analogove-znaceni.md", "kompendium/nlp-vzorce/milton-model/fonologicka-dvojznacnost.md", "kompendium/techniques/ea-1-1-2-informacni-pretizeni.md"]
nlp_prev = "rozsahova-dvojznacnost"
nlp_next = "umyslna-vagnost"
nlp_position = 14
nlp_family_size = 30
nlp_sources = ["bandler-grinder-1975b", "erickson-rossi-rossi-1976", "grinder-bandler-1981", "hassan-1988", "kahneman-2011", "kirsch-lynn-1995", "levinson-1983", "mcguire-1964", "petty-cacioppo-1986", "roderique-davies-2009", "sharpley-1987", "tosey-mathison-2009", "witkowski-2010", "van-der-linden-2023"]
nlp_sources_primary = ["bandler-grinder-1975b", "grinder-bandler-1981"]
nlp_sources_roots = ["erickson-rossi-rossi-1976", "levinson-1983"]
nlp_sources_critical = ["hassan-1988", "kahneman-2011", "kirsch-lynn-1995", "mcguire-1964", "petty-cacioppo-1986", "roderique-davies-2009", "sharpley-1987", "tosey-mathison-2009", "witkowski-2010", "van-der-linden-2023"]
nlp_citations = 17
nlp_words = 1226
nlp_reading_minutes = 6
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/milton-model.b.toml"
+++

# Interpunkční dvojznačnost

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.14` |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Punctuation ambiguity |
| **Jiné názvy** | přesahová věta, nesprávně umístěná pauza, nedokončená věta |
| **Obecnější vzorec** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Interpunkční dvojznačnost je v Milton-modelu souhrnné označení pro mluvené výpovědi, v nichž
není zřejmé, kde jedna věta končí a druhá začíná. Bandler a Grinder pod ni zahrnuli několik
podob: přesahovou větu, v níž konec jedné výpovědi tvoří zároveň začátek další, pauzu umístěnou
uprostřed větného celku tak, že rozdělí, co k sobě patří, a větu nedokončenou, která se přeruší
a místo závěru přejde k jinému tématu (Bandler a Grinder 1975b). V psané podobě by takové
hranice vyznačila interpunkce, odtud název; v řeči je vyznačuje jen intonace a pauza, a ty lze
umístit tak, aby si posluchač nebyl jistý, jak výpověď členit. Nevinný příklad přesahu je věta
„Venku je hezky teplo je i v noci“, v níž slovo „teplo“ uzavírá první výpověď a otevírá druhou.
Model tvrdí, že takové členění vyvolá krátké zaváhání, během něhož posluchač pozornost přesune
a snáze přijme úsek, který se tím ocitne mimo běžnou syntaktickou kontrolu. Pro kompendium je
podstatné, že vzorec spojuje jazykovou nejasnost s narušením rytmu rozhovoru a s tlakem na
pozornost.

## Původ a souvislosti

Interpunkční dvojznačnost je v Milton-modelu jedním ze čtyř druhů dvojznačnosti, vedle
[fonologické](@/kompendium/nlp-vzorce/milton-model/fonologicka-dvojznacnost.md), syntaktické a
rozsahové (Bandler a Grinder 1975b). Výcvikové texty NLP ji vykládají jako prostředek, který
krátkodobě zmate a tím otevře cestu sugesci, a spojují ji s tím, co ericksonovská tradice
nazývá konfuzní technikou (Grinder a Bandler 1981). Ericksonovy vlastní popisy hypnotické
práce kladou důraz na oslabení obvyklých myšlenkových rámců klienta, k němuž podle nich
může přispět i překvapení nebo krátké zmatení (Erickson, Rossi a Rossi 1976). V tomto
rámci se interpunkční dvojznačnost chápe jako drobná, lokální podoba zmatení, zabudovaná do
jediné věty.

Z lingvistického hlediska jde o využití prozodie. Mluvená řeč nemá interpunkci; hranice
výpovědí v ní vyznačuje melodie, pauza a tempo, a posluchač je spolu s gramatikou používá k
rozdělení proudu řeči na celky (Levinson 1983). Kdo tyto signály posune, mění členění, aniž
změní slova. Proto se interpunkční dvojznačnost úzce prolíná s
[analogovým značením](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md), tedy s
odlišením určité části výpovědi hlasem, a s vloženými příkazy, které model popisuje jako
úseky věty nesoucí skrytý pokyn.

## Struktura vzorce

Všechny tři podoby mají společnou strukturu: posluchač očekává hranici výpovědi na jednom
místě a mluvčí ji umístí jinam nebo ji vůbec neuzavře. U přesahové věty je klíčovým prvkem
překryvný úsek, slovo nebo spojení, které gramaticky patří k oběma větám. U nesprávně
umístěné pauzy je klíčovým prvkem odtržení části věty od jejího syntaktického kontextu,
takže odtržený úsek zazní jako samostatná výpověď. U nedokončené věty je klíčovým prvkem
otevřené očekávání: posluchač čeká závěr, který nepřijde, a jeho pozornost zůstává částečně
vázána na nedořečenou myšlenku. Ve všech případech výpověď na povrchu působí jako běžná,
trochu neuspořádaná řeč, protože přeřeknutí, přerušené věty a nepravidelné pauzy jsou v
mluveném projevu běžné.

Tvrzený mechanismus má dvě části. První je zatížení pozornosti: posluchač musí dodatečně
rozhodnout, jak výpověď členit, a tím se jeho kapacita k hodnocení obsahu krátce sníží.
Kahneman popisuje, že když je pozorné, úsilné myšlení zaměstnáno, lidé snáze přijímají
výklady, které jim nabídne rychlé a asociativní zpracování (Kahneman 2011). Druhá část je
vyčlenění úseku: překryvný nebo odtržený úsek získá samostatnost a model tvrdí, že na něj
posluchač reaguje, jako by šlo o samostatný pokyn. První část je obecným psychologickým
principem s dobrou oporou; druhá je specifickým tvrzením Milton-modelu bez empirického
ověření. Vzorec tím strukturně souvisí s tím, co kompendium popisuje jako
[informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md): v obou
případech se kritické hodnocení oslabuje zahlcením zpracování, nikoli argumentem.

## Detekční znaky

Pozorovatel by měl rozlišovat mezi běžnou neplynulostí řeči a vzorcem. Běžná neplynulost je
nepravidelná, mluvčí ji často sám opraví a nesouvisí s obsahem rozhovoru. Vzorec se vyznačuje
pravidelností: přesahy, pauzy a přerušení se vracejí na místech, kde se objevuje slovo nebo
spojení související s cílem mluvčího, například se souhlasem, s uvolněním, se setrváním nebo s
důvěrou. Typická je i kombinace s hlasovým odlišením, se ztišením, zpomalením nebo změnou
tónu na vyčleněném úseku. Dalším znakem je nápadně klidný a jistý projev, v němž se
„neuspořádané“ věty objevují, protože u skutečné nervozity bývá neplynulost doprovázena i
jinými známkami nejistoty. Silným znakem je hromadění několika vzorců Milton-modelu v
krátkém úseku řeči; už rozbory Ericksonových přepisů, z nichž Milton-model vzešel, ukazují
jednotlivé vzorce spíše ve shlucích než osamoceně (Bandler a Grinder 1975b).

Na straně posluchače se vzorec projevuje pocitem mírné dezorientace, ztrátou souvislosti
rozhovoru a dojmem, že „neví, kde přesně se to stočilo“. Po rozhovoru si člověk často
pamatuje jednotlivé fráze lépe než celkový argument. Takové stopy jsou užitečné jako
signál, že rozhovor neprobíhal jen na úrovni obsahu.

## Legitimní a manipulativní užití

Přerušené a překrývající se věty patří k přirozené řeči, k poezii a k divadelnímu dialogu, a
ve většině situací nic neznamenají. V klinické hypnóze a v ericksonovské terapii se záměrná
práce s rytmem a pauzou popisuje jako součást navozování transu, tedy v situaci, kterou klient
vyhledal a k níž dal souhlas (Erickson, Rossi a Rossi 1976). Legitimní užití se pozná podle
toho, že klient ví, v jakém rámci se nachází, může se kdykoli zastavit a sugesce, které
dostává, slouží cíli, který si sám stanovil.

Manipulativní užití přenáší stejné prvky do situace, kde posluchač o hypnotickém rámci neví:
do prodejního rozhovoru, do nátlakového jednání, do přednášky v uzavřené skupině nebo do
online obsahu, který se vydává za běžný projev. Rozhodující je kombinace skrytosti, nesouhlasu
a zájmu mluvčího. Tosey a Mathison upozorňují, že jazykové vzorce NLP se ve výcvikové praxi
oddělují od terapeutického kontextu, v němž byly popsány, a nabízejí se jako obecné nástroje
vlivu (Tosey a Mathison 2009). Právě v tomto přenosu ztrácí vzorec ochranné rámce, které mu
terapie dávala.

## Stav důkazů

Pro tvrzení, že interpunkční dvojznačnost funguje jako skrytý pokyn, chybí kontrolované
studie. Přehledy výzkumu NLP nenašly podporu pro jeho hlavní tvrzení a dospěly k závěru, že
obor nemá dostatečný empirický základ (Sharpley 1987; Witkowski 2010). Roderique-Davies
charakterizoval NLP jako psychologii, která přebírá vnější podobu vědy, terminologii a
sebejisté výklady mechanismů, aniž by měla odpovídající doklady (Roderique-Davies 2009).
Výzkum hypnózy navíc ukazuje, že reakce na sugesce lze z velké části vysvětlit očekáváním,
motivací a kontextem, a že není třeba předpokládat zvláštní stav, v němž by jazykové triky
obcházely vědomí (Kirsch a Lynn 1995).

Empiricky lépe podložený je obecný princip, o který se tvrzený mechanismus opírá: zátěž
pozornosti snižuje kritické hodnocení sdělení a zvyšuje vliv okrajových podnětů (Petty a
Cacioppo 1986). Z toho však plyne spíše to, že interpunkční dvojznačnost může přispívat k
celkové zahlcenosti rozhovoru, než to, že by jednotlivé vyčleněné úseky působily jako pokyny.
Čtenář by proto měl vzorec chápat jako jeden z prvků nátlakové komunikace, ne jako samostatně
účinnou techniku.

## Obrana a zotavení

Obranou je obnovení rytmu a struktury rozhovoru. Posluchač má právo zpomalit, požádat o
zopakování, shrnout vlastními slovy, co pochopil, a rozhodnutí odložit. Každý z těchto kroků
ruší zahlcení, na kterém vzorec stojí, a vrací rozhovor k obsahu. Užitečné je také vědomé
pojmenování: věta „nerozumím, kde ta věta končí“ je legitimní reakce, ne nezdvořilost.
Znalost toho, jak takové vzorce vypadají, zvyšuje odolnost podobně jako očkování proti
přesvědčování (McGuire 1964), a novější přístupy k předběžnému vyvracení ukazují, že lidé se
mohou naučit rozpoznávat manipulativní techniky obecně, nejen jednotlivé obsahy (van der
Linden 2023).

Kde se člověk s takovou řečí setkával dlouhodobě, například v uzavřené skupině s pravidelnými
„meditačními“ přednáškami, bývá součástí zotavení i obnova schopnosti soustředit se na obsah
a důvěřovat vlastnímu porozumění. Pomáhá číst přepisy dřívějších projevů, protože psaná podoba
odhaluje, jak málo v nich bylo argumentů. Hassan popisuje, že řízení myšlení ve skupinách
zahrnuje i techniky, které přerušují kritické uvažování, a že návrat k samostatnému myšlení
je postupný (Hassan 1988).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Grinder, J., & Bandler, R. (1981). *Trance-formations: Neuro-Linguistic Programming and the Structure of Hypnosis*. Moab: Real People Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Kirsch, I., & Lynn, S. J. (1995). The altered state of hypnosis: Changes in the theoretical landscape. *American Psychologist*, 50(10), 846–858.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Roderique-Davies, G. (2009). Neuro-linguistic programming: Cargo cult psychology? *Journal of Applied Research in Higher Education*, 1(2), 58–63.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Vložené příkazy](@/kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md) – příbuzný vzorec (Milton-model, Embedded commands)
- [Analogové značení](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md) – příbuzný vzorec (Milton-model, Analogue marking)
- [Fonologická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/fonologicka-dvojznacnost.md) – příbuzný vzorec (Milton-model, Phonological ambiguity)
- [Syntaktická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/syntakticka-dvojznacnost.md) – příbuzný vzorec (Milton-model, Syntactic ambiguity)
- [Rozsahová dvojznačnost](@/kompendium/nlp-vzorce/milton-model/rozsahova-dvojznacnost.md) – příbuzný vzorec (Milton-model, Scope ambiguity)
- [Konfuzní technika](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/konfuzni-technika.md) – příbuzný vzorec (Ericksonovská hypnóza, Confusion technique)
- [Přerušení vzorce](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/preruseni-vzorce.md) – příbuzný vzorec (Ericksonovská hypnóza, Pattern interrupt)

**V kompendiu**

- [EA-1.4.1 Prosodická dominance](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Rozsahová dvojznačnost](@/kompendium/nlp-vzorce/milton-model/rozsahova-dvojznacnost.md) – předchozí vzorec rodiny
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
