+++
title = "Úmyslná vágnost"
description = "Základní princip Milton-modelu: řeč dost určitá, aby zněla smysluplně, a dost neurčitá, aby si obsah dosadil posluchač. Rozpoznání, důkazy a obrana."
weight = 15
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Úmyslná vágnost", "Artful vagueness", "obratná vágnost", "záměrná nejasnost", "Milton-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-04.15"
catalog_slug = "umyslna-vagnost"
catalog_family = "milton-model"
catalog_family_code = "04"
catalog_family_title = "Milton-model"
catalog_family_en = "Milton Model"
catalog_part = "milton-model.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Artful vagueness"
catalog_aliases = ["obratná vágnost", "záměrná nejasnost"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "milton-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["milton-model"]
catalog_related = ["vyhybava-slova", "chunking", "transderivacni-hledani", "meta-model", "prosta-delece", "milton-model", "truismy", "syntakticka-dvojznacnost", "cteni-myslenek-milton", "nominalizace-milton", "nespecifikovana-slovesa-milton", "nespecifikovany-index-milton", "srovnavaci-delece-milton", "konfuzni-technika", "otevrena-sugesce", "obecne-a-specificke", "chunking-nahoru", "rozptylovac", "slovni-baliky", "nlp-v-politicke-reci", "guru-efekt", "hypnoticky-jazyk-online"]
catalog_related_declared = ["nominalizace-milton", "nespecifikovana-slovesa-milton", "nespecifikovany-index-milton", "meta-model", "slovni-baliky", "otevrena-sugesce"]
catalog_kompendium = ["kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/detection-signatures/1-linguistic-jargon-density.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/detection-signatures/1-linguistic-jargon-density.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md"]
catalog_prev = "interpunkcni-dvojznacnost"
catalog_next = "cteni-myslenek-milton"
catalog_position = 15
catalog_family_size = 30
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "erickson-rossi-rossi-1976", "gilovich-1991", "grice-1975", "grinder-bandler-1981", "hassan-1988", "herman-1992", "lifton-1961", "lilienfeld-2015", "oconnor-seymour-1990", "passmore-rowson-2019", "petty-cacioppo-1986", "rogers-1951", "sharpley-1987", "witkowski-2010", "van-der-linden-2023"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b", "grinder-bandler-1981", "oconnor-seymour-1990"]
catalog_sources_roots = ["erickson-rossi-rossi-1976", "grice-1975"]
catalog_sources_critical = ["gilovich-1991", "hassan-1988", "herman-1992", "lifton-1961", "lilienfeld-2015", "passmore-rowson-2019", "petty-cacioppo-1986", "rogers-1951", "sharpley-1987", "witkowski-2010", "van-der-linden-2023"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/milton-model.b.toml"
+++

# Úmyslná vágnost

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.15` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Artful vagueness |
| **Jiné názvy** | obratná vágnost, záměrná nejasnost |
| **Obecnější heslo** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Úmyslná vágnost, v anglické literatuře NLP „artful vagueness“, je princip, na kterém stojí
celý Milton-model: mluvčí volí výrazy, které znějí smysluplně a osobně, ale neobsahují
ověřitelný obsah, takže si posluchač konkrétní význam dosadí ze své vlastní zkušenosti.
Jazykově se vágnost skládá z dílčích vzorců, které model popisuje samostatně: z nominalizací,
tedy dějů převedených na abstraktní podstatná jména („změna“, „proces“, „poznání“), z
nespecifikovaných sloves („něco se začne dít“), z nespecifikovaných referenčních indexů
(„někteří lidé“, „určité věci“), z vypuštění a ze srovnání bez měřítka (Bandler a Grinder
1975b). Úmyslná vágnost tak není jeden vzorec mezi jinými, ale společný jmenovatel, který
z jednotlivých jazykových prostředků dělá hypnotický jazyk. Pro kompendium patří k nejrizikovějším
prvkům Milton-modelu, protože vytváří u posluchače dojem osobního porozumění a vlastního
vhledu, ačkoli mluvčí neřekl nic, za co by se dal vzít za slovo.

## Původ a souvislosti

Bandler a Grinder popsali Milton-model jako protějšek meta-modelu. Meta-model v jejich
pojetí slouží k tomu, aby terapeut ochuzený a neurčitý jazyk klienta upřesňoval a obnovoval,
co v něm chybí (Bandler a Grinder 1975). Milton-model postupuje opačně: neurčitost vytváří
záměrně, aby posluchač zaplnil mezery sám (Bandler a Grinder 1975b). Učebnice NLP tento vztah
shrnují jako zrcadlení dvou modelů a vágnost v Milton-modelu popisují jako záměrnou
vlastnost jazyka (O'Connor a Seymour 1990). Výcvikové texty pak vágnost vykládají v seminární
podobě jako základ „hypnotického jazyka“ (Grinder a Bandler 1981).

Kořen principu leží v Ericksonově permisivním přístupu. Erickson a Rossi popisovali otevřené
sugesce, které nepředepisují konkrétní reakci a nechávají klienta najít vlastní odpověď, a
spojovali je s respektem k individualitě klienta (Erickson, Rossi a Rossi 1976). NLP k tomu přidalo vlastní vysvětlení: posluchač při
setkání s neurčitou výpovědí hledá ve své zkušenosti, co by mohla znamenat, a tento proces
nazvalo transderivačním hledáním. Jde o pojem NLP, nikoli o zavedený pojem psycholingvistiky.

Z hlediska pragmatiky je úmyslná vágnost porušením zásad, které Grice popsal jako podmínky
spolupráce: sdělovat tolik informací, kolik je třeba, a vyjadřovat se jasně (Grice 1975).
Posluchač, který předpokládá spolupráci, takové porušení nevykládá jako prázdnotu, ale jako
skrytou hloubku, a hledá smysl, který by výpověď mohla mít. Na tom vzorec stojí.

## Struktura vzorce

Strukturálně má úmyslná vágnost čtyři složky. První je forma určitosti: sebejistý tón,
přítomný čas, slova, která evokují konkrétní zkušenost, a oslovení posluchače ve druhé osobě.
Druhou je nepřítomnost ověřitelného obsahu: chybí, kdo, co, kdy, jak a podle čeho se to pozná (Bandler a Grinder 1975b).
Třetí je citové zabarvení, obvykle příslib, naděje nebo naopak náznak ohrožení. Čtvrtou je
kontext, který posluchači dává motiv mezery zaplnit: touha po změně, nejistota, vztah k
autoritě nebo skupině.

Výsledkem je výpověď, kterou každý posluchač slyší „o sobě“. V tom je jádro rizika. Obsah,
který si posluchač dosadil, je jeho vlastní, a proto se hůř odmítá: kdo by zpochybnil vlastní
vhled? Mluvčí přitom zůstává chráněn, protože nic konkrétního neřekl. Psychologie zná
příbuzný jev pod jménem Barnumův efekt: lidé hodnotí obecné, pozitivně laděné popisy osobnosti
jako výstižné právě pro ně. Obecněji platí, že lidé snáze věří tomu, co zapadá do již
hotového příběhu, a přehlížejí, jak málo údajů ho podpírá (Gilovich 1991). Vzorec je strukturně blízký tomu, co kompendium popisuje jako
[past epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md), a
tomu, co popisuje jako
[terminologickou mystifikaci](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md),
kde neprůhledné výrazivo vytváří dojem hloubky.

## Detekční znaky

Nejspolehlivějším detekčním nástrojem jsou otázky, které formuloval sám meta-model: kdo
konkrétně, co konkrétně, jak konkrétně, ve srovnání s čím a podle čeho se to pozná (Bandler a
Grinder 1975). Úmyslně vágní výpověď na ně nedokáže odpovědět jinak než další vágností. Druhým
znakem je test záměny: dala by se táž věta říct komukoli jinému ve stejné situaci, a zněla by
stejně výstižně? Pokud ano, nejde o porozumění, ale o šablonu. Třetím znakem je hustota
abstraktních podstatných jmen a výrazů typu „proces“, „energie“, „posun“, „otevření“, které
kompendium sleduje jako jednu z
[detekčních signatur hustoty žargonu](@/kompendium/detection-signatures/1-linguistic-jargon-density.md).
Čtvrtým znakem jsou sliby změny bez kritérií: výsledek, o němž nelze rozhodnout, zda nastal.

Pátým, sociálním znakem je reakce na žádost o upřesnění. Kde mluvčí otázku „co přesně tím
myslíte?“ vykládá jako uzavřenost, nedostatek důvěry nebo „hlavu, která brání srdci“,
mění vágnost v nástroj kontroly. Lifton popsal v uzavřených skupinách jazyk zúžený na
abstraktní, citově nabité formule, které ukončují úvahu místo toho, aby ji otevíraly (Lifton
1961). Úmyslná vágnost je jedna z cest, jak takový jazyk vzniká: neurčité výrazy se postupně
naplní obsahem, který určuje skupina.

## Legitimní a manipulativní užití

Vágnost má legitimní místo všude, kde je poctivá. Lékař, který před výsledky vyšetření mluví
opatrně, vyjadřuje skutečnou nejistotu. Terapeut, který klientovi nevnucuje vlastní výklad a
nechává ho najít vlastní slova, respektuje jeho zkušenost; přístup zaměřený na klienta zdůrazňoval
právě to, že rozhodující je klientův vlastní rámec, nikoli rámec terapeuta (Rogers 1951). Také
v ericksonovské terapii má otevřenost sugescí sloužit tomu, aby klient sám určil obsah a tempo
změny (Erickson, Rossi a Rossi 1976). Legitimní vágnost je tedy přiznaná nebo ohraničená,
slouží autonomii posluchače a nebrání upřesnění, když o ně požádá.

Manipulativní vágnost slouží mluvčímu. Vytváří dojem, že mluvčí posluchače hluboce chápe,
že nabízí jedinečné poznání, nebo že změna, za kterou se platí, už probíhá. Typická prostředí
jsou drahé rozvojové semináře, skupiny kolem charismatického vůdce, politické projevy, které
mají oslovit protichůdné skupiny současně, a prodej služeb, jejichž výsledek nelze ověřit.
Petty a Cacioppo ukázali, že kde posluchač sdělení nezpracovává pečlivě, rozhodují o jeho
přijetí okrajové podněty, jako je sebejistota a atraktivita mluvčího (Petty a Cacioppo 1986).
Úmyslná vágnost takové zpracování ztěžuje, protože není co pečlivě zpracovat.

## Stav důkazů

Tvrzení, že úmyslná vágnost má specifický hypnotický účinek, se opírá o rozbory přepisů a o
zkušenost výcvikových seminářů, nikoli o kontrolované studie. Přehledy výzkumu NLP nenacházejí
podporu pro jeho klíčová tvrzení a upozorňují, že teorie je formulována tak, že se obtížně
testuje (Sharpley 1987; Witkowski 2010). Kritický přehled pro oblast koučinku konstatuje
nedostatek kvalitních studií (Passmore a Rowson 2019). Pojem transderivačního hledání nebyl
jako psychologický proces nezávisle ověřen. Lilienfeld a spolupracovníci řadí mezi varovné
znaky pseudovědy v klinické psychologii mimo jiné tvrzení, která se nedají vyvrátit, a
spoléhání na svědectví místo kontrolovaných dokladů (Lilienfeld, Lynn a Lohr 2015); úmyslná
vágnost je přesně ten typ jazyka, v němž se nevyvratitelná tvrzení snadno tvoří.

Jako obecný jev je však vliv vágních výpovědí dobře znám. Barnumův efekt, tedy sklon
přijímat obecné popisy osobnosti jako výstižné, je opakovaně doložený jev, a výzkum
přesvědčování vysvětluje, proč se vágní sdělení přijímá bez kontroly obsahu (Petty a Cacioppo
1986). Čtenář by proto měl odlišit dvě věci: vágnost jako zdroj nezaslouženého dojmu porozumění
a autority je jev s dobrou oporou; vágnost jako cesta k hypnotickému ovládnutí posluchače je
tvrzení, které doloženo není.

## Obrana a zotavení

Obranou je upřesňování. Kdo se ptá, co přesně se má změnit, podle čeho se to pozná, kdy a za
jakou cenu, mění vágní výpověď v tvrzení, které lze posoudit, nebo odhalí, že žádné tvrzení
neexistuje. Užitečné je také zapisovat si sliby doslova a po čase je porovnat s tím, co se
skutečně stalo. Vlastní vhledy, které vznikly v reakci na vágní řeč, je dobré považovat za
vlastní hypotézy, ne za potvrzení, že mluvčí „viděl do hloubky“. Výzkum o předběžném vyvracení
ukazuje, že lidé, kteří znají obecné vzorce manipulace, je snáz rozpoznají i v nové podobě
(van der Linden 2023).

U lidí, kteří dlouho žili v prostředí vágního jazyka, bývá obtížné znovu mluvit konkrétně o
vlastní zkušenosti; slovník skupiny se usadil i ve vlastním myšlení. Hassan popisuje zatížený jazyk
skupin jako jeden z nástrojů řízení myšlení a k zotavení po odchodu řadí i porozumění tomu,
jak takový jazyk působil (Hassan 1988). Pomáhá vědomě nahrazovat abstraktní výrazy
popisem konkrétních událostí a pocitů. Herman zdůrazňuje, že obnova vlastního hlasu a
vlastního výkladu zkušenosti je jádrem zotavení z dlouhodobé kontroly (Herman 1992).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Grinder, J., & Bandler, R. (1981). *Trance-formations: Neuro-Linguistic Programming and the Structure of Hypnosis*. Moab: Real People Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Lilienfeld, S. O., Lynn, S. J., & Lohr, J. M. (Eds.) (2015). *Science and Pseudoscience in Clinical Psychology* (2. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Vyhýbavá slova](@/kompendium/argumentacni-fauly/jazykove-klamy/vyhybava-slova.md) – příbuzné heslo (Argumentační fauly: Klamy jazyka a dvojznačnosti, Weasel words)
- [Chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md) – příbuzné heslo (Základní pojmy NLP, Chunking)
- [Transderivační hledání](@/kompendium/nlp-vzorce/zakladni-pojmy/transderivacni-hledani.md) – příbuzné heslo (Základní pojmy NLP, Transderivational search)
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – příbuzné heslo (Meta-model, Meta Model)
- [Prosté vypuštění](@/kompendium/nlp-vzorce/meta-model/prosta-delece.md) – příbuzné heslo (Meta-model, Simple deletion)
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – příbuzné heslo (Milton-model, Milton Model)
- [Truismy](@/kompendium/nlp-vzorce/milton-model/truismy.md) – příbuzné heslo (Milton-model, Truisms)
- [Syntaktická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/syntakticka-dvojznacnost.md) – příbuzné heslo (Milton-model, Syntactic ambiguity)
- [Čtení myšlenek v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/cteni-myslenek-milton.md) – příbuzné heslo (Milton-model, Mind reading (Milton Model))
- [Nominalizace v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nominalizace-milton.md) – příbuzné heslo (Milton-model, Nominalisations (Milton Model))
- [Nespecifikovaná slovesa v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nespecifikovana-slovesa-milton.md) – příbuzné heslo (Milton-model, Unspecified verbs (Milton Model))
- [Nespecifikovaný referenční index v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nespecifikovany-index-milton.md) – příbuzné heslo (Milton-model, Unspecified referential index (Milton Model))
- [Srovnávací vypuštění v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/srovnavaci-delece-milton.md) – příbuzné heslo (Milton-model, Comparative deletion (Milton Model))
- [Konfuzní technika](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/konfuzni-technika.md) – příbuzné heslo (Ericksonovská hypnóza, Confusion technique)
- [Otevřená sugesce](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/otevrena-sugesce.md) – příbuzné heslo (Ericksonovská hypnóza, Open-ended suggestion)
- [Obecné a specifické](@/kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md) – příbuzné heslo (Metaprogramy, General and specific)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzné heslo (Jazykové vzorce, Chunking up)
- [Rozptylovač](@/kompendium/nlp-vzorce/jazykove-vzorce/rozptylovac.md) – příbuzné heslo (Jazykové vzorce, Distracter)
- [Hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) – příbuzné heslo (Jazykové vzorce, Loaded words)
- [NLP v politické řeči](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-politicke-reci.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in political speech)
- [Efekt guru na seminářích](@/kompendium/nlp-vzorce/vliv-a-zneuziti/guru-efekt.md) – příbuzné heslo (Vliv a zneužití NLP, Guru effect in seminars)
- [Hypnotický jazyk v online obsahu](@/kompendium/nlp-vzorce/vliv-a-zneuziti/hypnoticky-jazyk-online.md) – příbuzné heslo (Vliv a zneužití NLP, Hypnotic language in online content)

**V kompendiu**

- [EA-5.4.24 Past epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Detekční signatura: Hustota žargonu](@/kompendium/detection-signatures/1-linguistic-jargon-density.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Interpunkční dvojznačnost](@/kompendium/nlp-vzorce/milton-model/interpunkcni-dvojznacnost.md) – předchozí heslo rodiny
- [Čtení myšlenek v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/cteni-myslenek-milton.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
