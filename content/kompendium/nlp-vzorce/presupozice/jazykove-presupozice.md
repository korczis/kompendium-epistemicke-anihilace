+++
title = "Jazykové presupozice"
description = "Presupozice jako to, co výpověď mlčky předpokládá: lingvistický základ, jak s nimi pracuje NLP a jak poznat, kdy se jimi sporné tvrzení vydává za hotovou věc."
weight = 1
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Jazykové presupozice", "Linguistic presuppositions", "presupozice", "předpoklady výpovědi", "spouštěče presupozic", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-06.01"
nlp_slug = "jazykove-presupozice"
nlp_family = "presupozice"
nlp_family_code = "06"
nlp_family_title = "Jazykové presupozice"
nlp_family_en = "Linguistic presuppositions"
nlp_part = "presupozice"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Linguistic presuppositions"
nlp_aliases = ["presupozice", "předpoklady výpovědi", "spouštěče presupozic"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "vysoke"
nlp_risk_cs = "vysoké"
nlp_broader = ""
nlp_narrower = ["existencni-presupozice", "presupozice-casovych-vet", "poradove-cislovky", "presupozice-nebo", "predikaty-uvedomeni", "komentarova-adverbia", "slovesa-zmeny-casu", "opakovaci-slova", "kvalifikatory-jen-i", "srovnavaci-presupozice", "otazky-s-presupozici", "vztazne-vety-presupozice", "kontrafaktualni-podminky", "faktivni-slovesa", "implikativni-slovesa", "rozstepene-vety", "presupozice-v-reklame", "presupozice-ve-vyslechu"]
nlp_depth = 0
nlp_ancestors = []
nlp_related = ["presupozice-v-meta-modelu", "milton-model", "presupozice-milton", "otazky-s-presupozici", "faktivni-slovesa", "presupozice-ve-vyslechu", "predramcovani", "predpokladovy-zaver"]
nlp_related_declared = ["presupozice-milton", "presupozice-v-meta-modelu", "otazky-s-presupozici", "presupozice-ve-vyslechu", "faktivni-slovesa"]
nlp_kompendium = ["kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md"]
nlp_links_prose = ["kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/presupozice/existencni-presupozice.md", "kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md", "kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md", "kompendium/nlp-vzorce/presupozice/presupozice-nebo.md", "kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md", "kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md"]
nlp_prev = ""
nlp_next = "existencni-presupozice"
nlp_position = 1
nlp_family_size = 19
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "chomsky-1965", "erickson-rossi-rossi-1976", "grice-1975", "herman-1992", "levinson-1983", "loftus-palmer-1974", "mcguire-1964", "oconnor-seymour-1990", "passmore-rowson-2019", "petty-cacioppo-1986", "sharpley-1987", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b", "oconnor-seymour-1990"]
nlp_sources_roots = ["chomsky-1965", "erickson-rossi-rossi-1976", "grice-1975", "levinson-1983"]
nlp_sources_critical = ["herman-1992", "loftus-palmer-1974", "mcguire-1964", "passmore-rowson-2019", "petty-cacioppo-1986", "sharpley-1987", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/presupozice.toml"
+++

# Jazykové presupozice

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.01` |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Linguistic presuppositions |
| **Jiné názvy** | presupozice, předpoklady výpovědi, spouštěče presupozic |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Presupozice je obsah, který výpověď nepodává jako sdělení, ale jako východisko. Kdo řekne
„Petr přestal kouřit“, tvrdí, že Petr dnes nekouří, a zároveň předpokládá, že dříve kouřil.
Ten druhý obsah se v rozhovoru neprojednává; posluchač ho musí přijmout, aby výpovědi vůbec
rozuměl. Lingvistická pragmatika popisuje presupozice jako informace spojené s určitými
slovy a konstrukcemi, takzvanými spouštěči, a jako obsah, který přetrvává i tehdy, když se
věta zneguje nebo převede na otázku: „Petr nepřestal kouřit“ i „Přestal Petr kouřit?“ stále
předpokládají, že Petr kouřil (Levinson 1983). Neurolingvistické programování převzalo
pojem ze soudobé lingvistiky a použilo ho dvojím způsobem: jako kategorii meta-modelu, která
má pomoci odhalit, co klient o světě nevysloveně předpokládá, a jako prostředek Milton-modelu,
kterým lze sugesci zabalit do předpokladu, a tím ji vyjmout z diskuse (Bandler a Grinder
1975; Bandler a Grinder 1975b). Tato stránka je zastřešujícím heslem rodiny; jednotlivé
spouštěče popisují samostatná hesla.

## Původ a souvislosti

Otázka, co věta předpokládá, je v logice a filozofii jazyka starší než NLP. Levinson ve svém
přehledu sleduje linii od Fregeho úvahy, že vlastní jméno předpokládá existenci svého
nositele, přes Strawsonovu polemiku s Russellem o větách se „současným francouzským králem“
až k lingvistickým pracím šedesátých a sedmdesátých let, které sestavily seznamy spouštěčů
a řešily, proč se presupozice ve složených větách někdy zachovávají a jindy mizí (Levinson
1983). Paralelně vznikla Griceova teorie konverzace. Podle ní mluvčí i posluchač vycházejí
z principu kooperace: posluchač předpokládá, že mluvčí říká tolik, kolik je třeba, pravdivě,
k věci a srozumitelně, a co z doslovného znění chybí, si doplní tak, aby výpověď dávala smysl
(Grice 1975). Právě tato ochota doplňovat je z hlediska kompendia klíčová, protože vysvětluje,
proč posluchač nevyslovený předpoklad obvykle přijme bez námitky.

Bandler a Grinder znali transformační gramatiku a generativní sémantiku své doby a v první
knize o meta-modelu zařadili presupozice mezi jevy, kterými si člověk ochuzuje [model světa](@/kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md);
v příloze uvedli přehled syntaktických prostředí, ve kterých se presupozice v angličtině
objevují (Bandler a Grinder 1975; Chomsky 1965). V knize o hypnotických vzorcích Miltona
Ericksona pak tytéž konstrukce popsali obráceně, jako nástroj, kterým terapeut klientovi
předkládá žádoucí výsledek jako samozřejmost (Bandler a Grinder 1975b). Erickson a jeho
spolupracovníci sami mluvili spíše o implikaci a o nepřímých formách sugesce, které
ponechávají klientovi pocit, že k závěru dospěl sám (Erickson, Rossi a Rossi 1976). Pozdější
učebnice NLP z obou zdrojů převzaly zkrácené seznamy spouštěčů bez lingvistického aparátu,
který je provázel (O'Connor a Seymour 1990).

## Struktura vzorce

Výpověď s presupozicí má dvě vrstvy. První vrstva je tvrzení, o kterém se jedná a ke
kterému se dá přímo říct „ne“. Druhá vrstva je předpoklad, který tvoří pozadí; přímá
odpověď na tvrzení ho nezpochybňuje, ale naopak potvrzuje. Na otázku „Kdy jste začal
podvádět manželku?“ nelze odpovědět časovým údajem, aniž by člověk přiznal podvádění. Pro
pozorovatele je užitečné rozlišit, zda předpoklad patří do společně sdíleného základu
rozhovoru, nebo zda je nový a sporný. V běžné komunikaci presupozice nesou to, co je
oběma stranám známé, a šetří tím slova. Pragmatika popisuje i jev, kdy posluchač mlčky
přijme předpoklad, který dosud sdílený nebyl, aby rozhovor mohl plynule pokračovat; tento
jev se označuje jako akomodace a je v každodenní řeči zcela běžný (Levinson 1983).

Manipulativní užití staví právě na akomodaci. Sporný obsah se umístí do vrstvy
předpokladů, takže pro jeho odmítnutí musí posluchač přerušit tok rozhovoru, vrátit se o
krok zpět a pojmenovat něco, co nikdo výslovně neřekl. To vyžaduje pozornost a sociální
odvahu a v rozhovoru s autoritou nebo pod časovým tlakem se to děje zřídka. Model
pravděpodobnosti elaborace popisuje, že při nízké motivaci nebo kapacitě zpracovávat sdělení
lidé hodnotí obsah podle okrajových vodítek, nikoli podle argumentů (Petty a Cacioppo 1986).
Presupozice argument vůbec nepodává, takže ani při vysoké pozornosti není co hodnotit, dokud
si posluchač předpoklad sám nevyjádří. Jednotlivé spouštěče, které rodina popisuje, se liší
jen tím, jakou gramatickou cestou se předpoklad do věty dostane: přes
[existenci věci](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md), přes
[časovou větu](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md), přes
[sloveso změny stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md), přes
[predikát uvědomění](@/kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md) nebo přes
[spojku „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md).

## Detekční znaky

Prvním znakem je asymetrie mezi tím, co výpověď výslovně tvrdí, a tím, co by bylo třeba
dokázat. Pokud by sporný obsah vyslovený jako samostatná věta vyvolal námitku, ale ve vedlejší
větě, v přivlastnění nebo v otázce prochází bez povšimnutí, je to důvod zpozornět. Druhým
znakem je otázka, na kterou každá přímá odpověď potvrzuje předpoklad tazatele; logika a
rétorika ji znají jako otázku s komplexním předpokladem a pragmatika připomíná, že už
každá otázka s tázacím slovem předpokládá pravdivost své nevyplněné části (Levinson 1983). Třetím znakem je hromadění
spouštěčů v krátkém úseku řeči, kdy výpověď obsahuje několik nevyslovených tvrzení naráz a
posluchač by musel odmítat každé zvlášť. Čtvrtým znakem je reakce mluvčího na zpochybnění
předpokladu: kdo mluví v dobré víře, předpoklad obvykle ochotně vysloví a doloží; kdo
předpokladem nahrazoval argument, často reaguje podrážděním, označí otázku za útok nebo za
„slovíčkaření“. U člověka, na kterého se presupozice dlouhodobě uplatňují, se objevuje pocit,
že s ním „něco není v pořádku“, aniž by uměl říct co, protože tvrzení o něm nikdy nezazněla
výslovně. Takové znaky popisuje kompendium i v
[detekční signatuře gaslightingu](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md),
kde se zpochybňování skutečnosti často opírá právě o věty, které sporný obsah předpokládají,
místo aby ho tvrdily.

## Legitimní a manipulativní užití

Legitimní užití presupozic je všudypřítomné a bez nich by se mluvit nedalo. Každé
odkazování na společně známou osobu, věc nebo událost je presupozice a podle principu
kooperace by bylo spíše porušením konverzačních norem, kdyby je mluvčí pokaždé znovu
dokládal (Grice 1975). V terapii se presupozice používají k vyjádření důvěry ve změnu, jako
když terapeut mluví o tom, co klient udělá „až se mu uleví“; Erickson podobné formulace
popisoval jako nepřímou podporu, která klientovi ponechává volnost (Erickson, Rossi a Rossi
1976). Etická hranice v terapii leží tam, kde klient o užití takového jazyka ví, souhlasil s
cíli práce a předpoklad se týká jeho vlastního, výslovně formulovaného cíle.

Manipulativní užití se pozná podle obsahu předpokladu a podle mocenského uspořádání
rozhovoru. Předpokládá se něco, co je sporné, co by adresát při výslovném vyslovení odmítl a
co slouží zájmu mluvčího: vina, závislost, nevyhnutelnost rozhodnutí, souhlas skupiny. Ve
vyšetřování a v soudní síni může nevhodně formulovaná otázka vnést do výpovědi svědka
informace, které svědek sám neuvedl; experimenty s formulací otázek ukázaly, že i změna
jediného slova ovlivní nejen odhad, ale i pozdější vzpomínání (Loftus a Palmer 1974). Proto
standardy [forenzního rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md)
dávají přednost otevřeným otázkám bez vneseného obsahu. Podrobněji se kontextu výslechu
věnuje heslo [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md).

## Stav důkazů

Je třeba rozlišovat dvě úrovně. Lingvistický popis presupozic je dobře rozpracovaný a
nesporný: spouštěče, test zachování pod záporem i problém projekce ve složených větách patří
do standardního obsahu pragmatiky (Levinson 1983). Rovněž je dobře doloženo, že formulace
otázky může posunout odpovědi a vzpomínky dotazovaného (Loftus a Palmer 1974). Specifická
tvrzení NLP však jdou dál: že presupozice obcházejí vědomou kritiku, prohlubují trans nebo
spolehlivě vedou k přijetí sugesce. Taková tvrzení se v primární literatuře NLP opírají o
příklady z praxe a o rozbor přepisů sezení, ne o kontrolované experimenty (Bandler a Grinder
1975b). Přehledy výzkumu NLP se týkají převážně jiných tvrzení oboru, zejména reprezentačních
systémů, a nenacházejí podporu ani tam, kde testovatelná tvrzení existují (Sharpley 1987;
Witkowski 2010). Kritický přehled pro oblast koučinku konstatuje obecný nedostatek kvalitních
studií technik NLP (Passmore a Rowson 2019). Poctivý závěr tedy zní, že mechanismus, o který
se rodina opírá, je reálný a lingvisticky popsaný, ale že síla a spolehlivost účinku, kterou
mu NLP připisuje, nebyly ověřeny.

## Obrana a zotavení

Základní obranou je předpoklad vyslovit. Kdo převede nevyslovené tvrzení na samostatnou
větu, například „předpokládáte, že jsem to udělal; to ale nebylo zjištěno“, vrací ho do
vrstvy, o které se jedná, a kde ho lze odmítnout nebo ověřit. Druhou obranou je neodpovídat
na otázku, jejíž každá odpověď předpoklad potvrzuje, a místo toho zpochybnit její
východisko. Třetí obranou je zpomalit: presupozice působí nejsilněji v rychlém sledu, kdy
není prostor se vrátit, a prosba o čas nebo o písemnou formu dává příležitost předpoklady
rozpoznat. Přípravu předem podporuje výzkum očkování proti přesvědčování, podle něhož
seznámení s oslabenou formou argumentu a s jeho vyvrácením zvyšuje odolnost vůči pozdějšímu
plnému působení (McGuire 1964). Analogicky platí, že kdo zná nejčastější spouštěče, rozpozná
je rychleji. U lidí, na které byly presupozice uplatňovány dlouhodobě v kontrolujícím vztahu,
je součástí zotavení i zpětná rekonstrukce: vypsat, co o nich bylo v rozhovorech předpokládáno,
a posoudit každé tvrzení samostatně. Tato práce probíhá nejlépe s podporou, ve vztahu, kde má
člověk znovu právo na vlastní popis událostí (Herman 1992).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md) – zvláštní případ tohoto vzorce
- [Presupozice časových vět](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md) – zvláštní případ tohoto vzorce
- [Pořadové číslovky](@/kompendium/nlp-vzorce/presupozice/poradove-cislovky.md) – zvláštní případ tohoto vzorce
- [Presupozice spojky „nebo“](@/kompendium/nlp-vzorce/presupozice/presupozice-nebo.md) – zvláštní případ tohoto vzorce
- [Predikáty uvědomění](@/kompendium/nlp-vzorce/presupozice/predikaty-uvedomeni.md) – zvláštní případ tohoto vzorce
- [Komentářová příslovce a přídavná jména](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md) – zvláštní případ tohoto vzorce
- [Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md) – zvláštní případ tohoto vzorce
- [Opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md) – zvláštní případ tohoto vzorce
- [Částice „jen“, „i“, „dokonce“](@/kompendium/nlp-vzorce/presupozice/kvalifikatory-jen-i.md) – zvláštní případ tohoto vzorce
- [Srovnávací presupozice](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md) – zvláštní případ tohoto vzorce
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – zvláštní případ tohoto vzorce
- [Vztažné věty jako presupozice](@/kompendium/nlp-vzorce/presupozice/vztazne-vety-presupozice.md) – zvláštní případ tohoto vzorce
- [Kontrafaktuální podmínky](@/kompendium/nlp-vzorce/presupozice/kontrafaktualni-podminky.md) – zvláštní případ tohoto vzorce
- [Faktivní slovesa](@/kompendium/nlp-vzorce/presupozice/faktivni-slovesa.md) – zvláštní případ tohoto vzorce
- [Implikativní slovesa](@/kompendium/nlp-vzorce/presupozice/implikativni-slovesa.md) – zvláštní případ tohoto vzorce
- [Vytýkací konstrukce](@/kompendium/nlp-vzorce/presupozice/rozstepene-vety.md) – zvláštní případ tohoto vzorce
- [Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) – zvláštní případ tohoto vzorce
- [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) – zvláštní případ tohoto vzorce

**Příbuzné vzorce**

- [Presupozice v meta-modelu](@/kompendium/nlp-vzorce/meta-model/presupozice-v-meta-modelu.md) – příbuzný vzorec (Meta-model, Presuppositions (Meta Model))
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – příbuzný vzorec (Milton-model, Milton Model)
- [Presupozice v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/presupozice-milton.md) – příbuzný vzorec (Milton-model, Presuppositions (Milton Model))
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzný vzorec (Jazykové presupozice, Loaded questions)
- [Faktivní slovesa](@/kompendium/nlp-vzorce/presupozice/faktivni-slovesa.md) – příbuzný vzorec (Jazykové presupozice, Factive verbs)
- [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) – příbuzný vzorec (Jazykové presupozice, Presuppositions in questioning and testimony)
- [Předrámcování](@/kompendium/nlp-vzorce/reframing/predramcovani.md) – příbuzný vzorec (Reframing a rámce, Pre-framing)
- [Předpokládané uzavření](@/kompendium/nlp-vzorce/vliv-a-zneuziti/predpokladovy-zaver.md) – příbuzný vzorec (Vliv a zneužití NLP, Assumptive close)

**V kompendiu**

- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [Detekční signatura: Gaslighting vzorec](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
