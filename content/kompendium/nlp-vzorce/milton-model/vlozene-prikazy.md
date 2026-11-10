+++
title = "Vložené příkazy"
description = "Vzorec Milton-modelu, který skrývá pokyn uvnitř delší věty: jak se pozná, co se o jeho účinku ví a jak mu čelit návratem k výslovnému požadavku."
weight = 2
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-vliv"]
categories = ["academic"]

[extra]
parent = "kompendium-nlp-vzorce-milton-model"
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Vložené příkazy", "Embedded commands", "skryté příkazy", "vnořené příkazy", "Milton-model", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-04.02"
nlp_slug = "vlozene-prikazy"
nlp_family = "milton-model"
nlp_family_code = "04"
nlp_family_title = "Milton-model"
nlp_family_en = "Milton Model"
nlp_part = "milton-model"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Embedded commands"
nlp_aliases = ["skryté příkazy", "vnořené příkazy"]
nlp_use = "vliv"
nlp_use_cs = "převážně vlivové"
nlp_risk = "vysoke"
nlp_risk_cs = "vysoké"
nlp_broader = "milton-model"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["milton-model"]
nlp_related = ["komunikace-vedoma-a-nevedoma", "milton-model", "vlozene-otazky", "analogove-znaceni", "citace", "fonologicka-dvojznacnost", "interpunkcni-dvojznacnost", "negativni-prikazy", "vnorene-smycky", "posthypnoticka-sugesce", "muj-pritel-john", "technika-prolozeni", "implikovane-direktivum", "predstavte-si", "konverzacni-hypnoza", "nlp-v-komunite-svadeni", "hypnoticky-jazyk-online", "rozpoznani-nlp-praktiky"]
nlp_related_declared = ["analogove-znaceni", "vlozene-otazky", "negativni-prikazy", "konverzacni-hypnoza", "technika-prolozeni"]
nlp_kompendium = ["kompendium/techniques/ea-1-4-1-prosodicka-dominance.md", "kompendium/techniques/ea-2-2-5-recommendation-coercion.md", "kompendium/03-zakladni-kategorie/biasy/_index.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/milton-model/analogove-znaceni.md", "kompendium/nlp-vzorce/milton-model/vlozene-otazky.md", "kompendium/techniques/ea-1-4-1-prosodicka-dominance.md", "kompendium/techniques/ea-2-2-5-recommendation-coercion.md"]
nlp_prev = "milton-model"
nlp_next = "vlozene-otazky"
nlp_position = 2
nlp_family_size = 30
nlp_sources = ["bandler-grinder-1975b", "druckman-swets-1988", "erickson-rossi-1979", "grice-1975", "grinder-bandler-1981", "grinder-delozier-bandler-1977", "hassan-1988", "kahneman-2011", "langer-1978", "mcguire-1964", "petty-cacioppo-1986", "sharpley-1987", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975b", "grinder-bandler-1981", "grinder-delozier-bandler-1977"]
nlp_sources_roots = ["erickson-rossi-1979", "grice-1975"]
nlp_sources_critical = ["druckman-swets-1988", "hassan-1988", "kahneman-2011", "langer-1978", "mcguire-1964", "petty-cacioppo-1986", "sharpley-1987", "witkowski-2010"]
nlp_citations = 16
nlp_words = 1173
nlp_reading_minutes = 6
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/milton-model.toml"
+++

# Vložené příkazy

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.02` |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Embedded commands |
| **Jiné názvy** | skryté příkazy, vnořené příkazy |
| **Obecnější vzorec** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | převážně vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Vložený příkaz je v Milton-modelu úsek věty, který má gramatickou podobu rozkazu nebo výzvy,
ale je zasazen do širší výpovědi, takže jako rozkaz nezaznívá. Obal tvoří konstatování,
úvaha, příběh, otázka nebo popis toho, co dělají jiní lidé, a pokyn je jen jeho součástí.
Podle autorů NLP posluchač vědomě zpracovává celou větu jako neškodné sdělení, zatímco
vyznačený úsek má působit samostatně jako výzva k jednání nebo prožitku (Bandler a Grinder
1975b). Vzorec úzce souvisí s
[analogovým značením](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md), protože
vložený úsek se v řeči odlišuje hlasem, pauzou nebo gestem, a s
[vloženými otázkami](@/kompendium/nlp-vzorce/milton-model/vlozene-otazky.md), které stejným
způsobem skrývají otázku. Pro kompendium je vložený příkaz typem vlivu, jehož podstatou je
zastírání: mluvčí požaduje, ale nepřiznává, že požaduje, a posluchač nemá příležitost
požadavek odmítnout, protože mu nebyl nikdy otevřeně předložen.

## Původ a souvislosti

Bandler a Grinder vložené příkazy popsali při rozboru Ericksonových sezení jako jednu z forem,
kterými Erickson klientům předával sugesce, aniž by je stavěl do role adresátů pokynu
(Bandler a Grinder 1975b; Grinder, DeLozier a Bandler 1977). Erickson sám popsal příbuzný
postup už v šedesátých letech pod názvem technika proložení: sugesce se rozptýlí do delšího
vyprávění nebo rozhovoru a vynikne jen pro toho, kdo je na ni naladěn. Jeho nepřímé formy
sugesce se spolupracovníky později soustavně rozebral na kazuistikách (Erickson a Rossi
1979). Klinickým zdůvodněním byla snaha obejít odpor klienta, který by přímý pokyn odmítl,
a nechat ho reagovat na sugesci jako na vlastní podnět. V popularizačních textech NLP se
vzorec později stal jedním z nejčastěji vyučovaných „jazykových triků“ a z terapie se rychle
přesunul do kurzů prodeje, vyjednávání a takzvaného svádění (Grinder a Bandler 1981).
Právě tento přesun z prostředí, kde má klient chránit vlastní zájem terapeut, do prostředí,
kde mluvčí sleduje zájem vlastní, dělá z vloženého příkazu jeden z rizikovějších vzorců
celé rodiny.

## Struktura vzorce

Strukturu vloženého příkazu tvoří tři vrstvy. Vnější vrstvou je nosná věta, která sama nic
nepožaduje: vypráví, uvažuje nahlas, popisuje druhé lidi nebo vyjadřuje nejistotu mluvčího.
Prostřední vrstvou je gramatické místo, do kterého lze zasadit sloveso v rozkazovacím nebo
infinitivním tvaru s doplněním, takže vznikne úsek, který by obstál i jako samostatný pokyn.
Vnitřní vrstvou je vyznačení tohoto úseku, nejčastěji změnou hlasu, tempa a pohledu, v psaném
textu typografií. Podle NLP má vyznačení způsobit, že posluchač úsek zpracuje odděleně od
nosné věty (Bandler a Grinder 1975b).

Vzorec se zřídka vyskytuje osamoceně. V řeči se kombinuje s presupozicemi, které posouvají
otázku od toho, zda se něco stane, k tomu, kdy se to stane, se záporem, který má podle NLP
paradoxně přitáhnout pozornost k zakazovanému obsahu, a s citací, ve které pokyn vyslovuje
někdo jiný. Lingvisticky vložený příkaz využívá toho, že posluchač neustále vyvozuje, co
mluvčí „chce říct“, i nad rámec doslovného obsahu, a že pragmatické vyvozování probíhá
převážně automaticky (Grice 1975). Přidaná hodnota vzorce pro mluvčího spočívá v
popiratelnosti: kdyby posluchač pokyn zpochybnil, mluvčí může odkázat na to, že nic
nepožadoval a jen popisoval.

## Detekční znaky

Prvním znakem je opakování. Stejné sloveso s doplněním se vrací v několika větách s
různými obaly, například v úvaze o tom, co dělají jiní lidé, v otázce a v popisu budoucnosti.
Druhým znakem je nesoulad prozodie a obsahu: mluvčí v neutrální větě zpomalí, ztiší nebo
zdůrazní úsek, který podle smyslu věty důraz nepotřebuje, což popisuje i heslo kompendia o
[prozodické dominanci](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md). Třetím
znakem je, že vložený úsek mívá podobu přímého oslovení posluchače uvnitř věty, která se
formálně týká někoho jiného. Čtvrtým znakem je obsah: vložené úseky se v manipulativním
užití shodují s tím, co mluvčí potřebuje, tedy s rozhodnutím, podpisem, důvěrou, uvolněním
nebo setrváním. Pátým znakem je reakce posluchače, který po rozhovoru cítí tah k určitému
rozhodnutí, ale nedokáže říct, kdo mu ho navrhl. Pozorovatel, který si rozhovor přepíše a
vyznačené úseky vypíše pod sebe, často zjistí, že dávají souvislou řadu pokynů.

Od běžné řeči je třeba vzorec odlišovat opatrně. Vnořené rozkazovací tvary vznikají v
češtině přirozeně, když mluvčí reprodukuje cizí radu, vypráví nebo uvažuje nahlas, a
jediný výskyt nic nedokazuje. Rozhodující je souběh několika znaků v jednom rozhovoru:
opakování téhož obsahu, jeho prozodické vyznačení, shoda se zájmem mluvčího a situace, ve
které posluchač stojí před rozhodnutím. Opakování samo přitom působí i bez jakéhokoli
skrytého kanálu, protože známý obsah se zpracovává snadněji a snadnost zpracování se snadno
zaměňuje za pravdivost nebo správnost (Kahneman 2011). Pozorovatel proto nemusí rozhodovat,
zda mluvčí vzorec ovládá vědomě; stačí zjistit, že řeč soustavně vrací posluchače k
jednomu požadavku, který nikdy nezazněl otevřeně. Právě tato kombinace odlišuje vložený
příkaz od náhodné gramatické shody i od otevřeně vyslovené rady, kterou lze přijmout nebo
odmítnout.

## Legitimní a manipulativní užití

V klinickém kontextu se nepřímé sugesce používají v hypnoterapii, ke které klient dal
souhlas a ve které je cílem jeho vlastní úleva, například uvolnění nebo zmírnění bolesti
(Erickson a Rossi 1979). I tam je ovšem otázkou, nakolik je vhodné, aby terapeut klientovi
cokoli předával skrytě; současná klinická praxe klade důraz na transparentnost a sdílené
rozhodování. Mimo terapii je vložený příkaz v zásadě manipulativní, protože jeho funkcí je
obejít rozhodnutí posluchače. V prodeji míří na rychlé rozhodnutí, ve vztazích na
poslušnost nebo důvěru, ve skupinách na setrvání a odevzdání kontroly. Kompendium popisuje
příbuzný mechanismus u
[nátlaku doporučením](@/kompendium/techniques/ea-2-2-5-recommendation-coercion.md), kde se
požadavek také maskuje jako nezávazná rada. Rozhodující není samotná gramatická forma,
protože vnořené rozkazovací tvary se v běžné řeči objevují i bez jakéhokoli záměru, ale
souběh opakování, vyznačení a obsahu, který slouží zájmu mluvčího.

## Stav důkazů

Pro tvrzení, že vložené příkazy působí mimo vědomé zpracování a spolehlivě mění jednání
posluchače, neexistuje kvalitní empirická podpora. Přehledy výzkumu NLP konstatují, že
specifické mechanismy, o které se obor opírá, nebyly v kontrolovaných podmínkách potvrzeny
(Sharpley 1987; Witkowski 2010). Zpráva Národní rady pro výzkum USA, která koncem
osmdesátých let posuzovala techniky zlepšování výkonu včetně NLP, nenašla doklady pro
jeho tvrzení o vlivu (Druckman a Swets 1988). Obecný výzkum přesvědčování přitom ukazuje,
že lidé při nízké pozornosti reagují na povrchové rysy sdělení a že formálně zdůvodněná
žádost zvyšuje vyhovění i tehdy, když je zdůvodnění prázdné (Langer, Blank a Chanowitz
1978; Petty a Cacioppo 1986). Z toho plyne opatrný závěr. Vložený příkaz může přispět k
vlivu tím, že opakuje a zdůrazňuje určitý obsah a zakrývá požadavek, ale nic nenasvědčuje
tomu, že by šlo o zvláštní kanál do nevědomí, jak tvrdí kurzy NLP. Riziko vzorce proto
nespočívá v jeho síle, ale v tom, že ztěžuje posluchači rozpoznat, že je o něco žádán.

## Obrana a zotavení

Účinná obrana spočívá v převedení skrytého požadavku na výslovný. Kdo si všimne, že se
určitá výzva v řeči opakuje a že je zdůrazňována, může ji nahlas pojmenovat jako požadavek a
odpovědět na ni přímo, například tím, že rozhodnutí dnes neudělá. Tím mizí popiratelnost, o
kterou se vzorec opírá. Druhou obranou je časový odstup: rozhodnutí, ke kterému člověk cítí
tah, ale nedokáže říct proč, se odkládá a prověřuje s někým, kdo u rozhovoru nebyl. Třetí
obranou je znalost vzorce. Výzkum očkování proti přesvědčování ukazuje, že předem známá a
pojmenovaná technika ztrácí část účinku (McGuire 1964). U lidí, kteří byli tímto jazykem
ovlivňováni dlouhodobě, například v kultovní skupině, se při zotavení osvědčuje
rekonstrukce toho, co bylo skutečně řečeno, a rozlišení vlastních rozhodnutí od rozhodnutí
převzatých; Hassan zdůrazňuje, že pochopení technik, které skupina používala, pomáhá
bývalým členům přestat se obviňovat (Hassan 1988).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Erickson, M. H., & Rossi, E. L. (1979). *Hypnotherapy: An Exploratory Casebook*. New York: Irvington.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Grinder, J., & Bandler, R. (1981). *Trance-formations: Neuro-Linguistic Programming and the Structure of Hypnosis*. Moab: Real People Press.
- Grinder, J., DeLozier, J., & Bandler, R. (1977). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 2*. Cupertino: Meta Publications.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Langer, E. J., Blank, A., & Chanowitz, B. (1978). The mindlessness of ostensibly thoughtful action: The role of „placebic“ information in interpersonal interaction. *Journal of Personality and Social Psychology*, 36(6), 635–642.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Komunikace probíhá vědomě i nevědomě](@/kompendium/nlp-vzorce/predpoklady/komunikace-vedoma-a-nevedoma.md) – příbuzný vzorec (Předpoklady NLP, Communication is both conscious and unconscious)
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – příbuzný vzorec (Milton-model, Milton Model)
- [Vložené otázky](@/kompendium/nlp-vzorce/milton-model/vlozene-otazky.md) – příbuzný vzorec (Milton-model, Embedded questions)
- [Analogové značení](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md) – příbuzný vzorec (Milton-model, Analogue marking)
- [Citace](@/kompendium/nlp-vzorce/milton-model/citace.md) – příbuzný vzorec (Milton-model, Quotes)
- [Fonologická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/fonologicka-dvojznacnost.md) – příbuzný vzorec (Milton-model, Phonological ambiguity)
- [Interpunkční dvojznačnost](@/kompendium/nlp-vzorce/milton-model/interpunkcni-dvojznacnost.md) – příbuzný vzorec (Milton-model, Punctuation ambiguity)
- [Záporné příkazy](@/kompendium/nlp-vzorce/milton-model/negativni-prikazy.md) – příbuzný vzorec (Milton-model, Negative commands)
- [Vnořené smyčky](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/vnorene-smycky.md) – příbuzný vzorec (Ericksonovská hypnóza, Nested loops)
- [Posthypnotická sugesce](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/posthypnoticka-sugesce.md) – příbuzný vzorec (Ericksonovská hypnóza, Post-hypnotic suggestion)
- [Můj přítel John](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/muj-pritel-john.md) – příbuzný vzorec (Ericksonovská hypnóza, My friend John)
- [Technika proložení](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/technika-prolozeni.md) – příbuzný vzorec (Ericksonovská hypnóza, Interspersal technique)
- [Implikované direktivum](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/implikovane-direktivum.md) – příbuzný vzorec (Ericksonovská hypnóza, Implied directive)
- [Výzva „představte si“](@/kompendium/nlp-vzorce/jazykove-vzorce/predstavte-si.md) – příbuzný vzorec (Jazykové vzorce, Imagine)
- [Konverzační hypnóza](@/kompendium/nlp-vzorce/vliv-a-zneuziti/konverzacni-hypnoza.md) – příbuzný vzorec (Vliv a zneužití NLP, Conversational (covert) hypnosis)
- [NLP v komunitě „umění svádění“](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-komunite-svadeni.md) – příbuzný vzorec (Vliv a zneužití NLP, NLP in the seduction community)
- [Hypnotický jazyk v online obsahu](@/kompendium/nlp-vzorce/vliv-a-zneuziti/hypnoticky-jazyk-online.md) – příbuzný vzorec (Vliv a zneužití NLP, Hypnotic language in online content)
- [Rozpoznání praktiky NLP v rozhovoru](@/kompendium/nlp-vzorce/vliv-a-zneuziti/rozpoznani-nlp-praktiky.md) – příbuzný vzorec (Vliv a zneužití NLP, Recognising NLP practice in conversation)

**V kompendiu**

- [EA-1.4.1 Prosodická dominance](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-2.2.5 Nátlak doporučením](@/kompendium/techniques/ea-2-2-5-recommendation-coercion.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [Kognitivní biasy](@/kompendium/03-zakladni-kategorie/biasy/_index.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – předchozí vzorec rodiny
- [Vložené otázky](@/kompendium/nlp-vzorce/milton-model/vlozene-otazky.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
