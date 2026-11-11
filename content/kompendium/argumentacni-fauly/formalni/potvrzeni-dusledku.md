+++
title = "Potvrzení důsledku"
description = "Neplatný úsudek z podmínky a jejího důsledku na předchůdce: proč „sedí to“ nic nedokazuje, jak se chyba projevuje v diagnostice a vyšetřování a jak na ni odpovědět."
weight = 2
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Potvrzení důsledku", "Affirming the consequent", "afirmace konsekventu", "klam důsledku", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.02"
catalog_slug = "potvrzeni-dusledku"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Affirming the consequent"
catalog_aliases = ["afirmace konsekventu", "klam důsledku"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["formalni-klam", "popreni-predchudce", "nerozlozeny-stredni-termin", "post-hoc", "zanedbani-zakladni-miry", "klam-zalobce", "pravidlo-platnosti", "argumentacni-schemata", "pricina-a-nasledek"]
catalog_related_declared = ["popreni-predchudce", "klam-zalobce", "zanedbani-zakladni-miry", "post-hoc", "pricina-a-nasledek", "argumentacni-schemata"]
catalog_kompendium = ["kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/formalni/popreni-predchudce.md", "kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md", "kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md"]
catalog_prev = "formalni-klam"
catalog_next = "popreni-predchudce"
catalog_position = 2
catalog_family_size = 14
catalog_sources = ["copi-cohen-mcmahon-2014", "damer-2009", "gigerenzer-2002", "grice-1975", "hahn-oaksford-2007", "hamblin-1970", "nickerson-1998", "popper-1959", "thompson-schumann-1987", "tversky-kahneman-1974", "vrij-2008", "walton-reed-macagno-2008", "wiseman-2012", "eemeren-grootendorst-2004"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "damer-2009", "hamblin-1970", "walton-reed-macagno-2008", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["grice-1975", "popper-1959"]
catalog_sources_critical = ["gigerenzer-2002", "hahn-oaksford-2007", "nickerson-1998", "thompson-schumann-1987", "tversky-kahneman-1974", "vrij-2008", "wiseman-2012"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Vztah k technikám kompendia", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/formalni.toml"
+++

# Potvrzení důsledku

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.02` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Affirming the consequent |
| **Jiné názvy** | afirmace konsekventu, klam důsledku |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Potvrzení důsledku je neplatný úsudek, který z podmínky „jestliže A, pak B“ a ze zjištění,
že B nastalo, vyvozuje, že nastalo i A. Platná sousední forma, nazývaná modus ponens, postupuje
opačně: z podmínky a ze splnění předchůdce A vyvozuje důsledek B. Potvrzení důsledku vypadá
podobně, ale nic nezaručuje, protože B může nastat i z jiných důvodů než z A. Podmínka totiž
říká jen to, že A k B stačí, nikoli že je k B nutné (Copi, Cohen a McMahon 2014). Úsudek je
proto neplatný bez ohledu na obsah: existuje nekonečně mnoho úsudků téže formy, v nichž jsou
obě premisy pravdivé a závěr nepravdivý. V praxi se klam objevuje v podobě „to přesně
odpovídá“: hypotéza předpovídá určitý znak, znak se našel, a hypotéza se prohlásí za
prokázanou. Pro kompendium je tento klam mimořádně důležitý, protože na něm stojí řada
chybných závěrů v diagnostice, v posuzování svědků i v konspiračním výkladu událostí, kde
každá shoda s předpovědí působí jako důkaz.

## Původ a souvislosti

Chybu znal už Aristotelés, který mezi klamy nezávislé na jazyce zařadil klam z důsledku, tedy
domněnku, že vztah mezi dvěma věcmi platí i obráceně. Hamblin ve svém historickém rozboru
ukazuje, jak se tento klam přenášel z antických a středověkých seznamů do novověkých
učebnic, často s proměnlivým vymezením (Hamblin 1970). V moderní výrokové logice dostal
přesnou podobu jako neplatná forma podmíněného úsudku a stal se standardní součástí výuky
logiky. Druhá linie souvislostí vede do jazykovědy. Grice ukázal, že logické spojky se v
přirozeném jazyce chovají jinak než ve formálním systému a že rozhovor nese i to, co mluvčí
nevyslovil, ale co z jeho slov posluchač rozumně vyvodí (Grice 1975). Věta „když dokončíš
úkol, můžeš jít ven“ se běžně chápe tak, že bez dokončeného úkolu ven nepůjdeš; podmínka se
tu čte jako oboustranná. Tento sklon dává potvrzení důsledku v běžné řeči zdání
samozřejmosti. Třetí linie vede do filozofie vědy. Popper zdůraznil, že pravdivost odvozeného
důsledku pravdivost teorie nezaručuje, kdežto nepravdivost důsledku ji platně vyvrací (Popper
1959). Kdo z potvrzené předpovědi vyvozuje pravdivost teorie, usuzuje právě ve formě
potvrzení důsledku. Teorie
argumentace k tomu přidává schémata úsudku ze znaku a úsudku k nejlepšímu vysvětlení, která
s formou potvrzení důsledku pracují jako s odvoditelnou úvahou, jež platí jen s výhradou
(Walton, Reed a Macagno 2008).

## Struktura argumentu

Kostru klamu tvoří tři kroky. První premisa tvrdí podmínku: pokud platí hypotéza, objeví se
určitý znak. Druhá premisa konstatuje, že se znak objevil. Závěr hypotézu prohlašuje za
prokázanou. Vada je v tom, co úsudek zamlčí: jak často se tentýž znak objevuje, když hypotéza
neplatí. Tato otázka je v diagnostice, ve vyšetřování i ve forenzním posouzení zásadní.
Pokud se určité potíže vyskytují u dětí, které prošly traumatem, a také u mnoha dětí, které
traumatem neprošly, jejich výskyt sám o traumatu nevypovídá. Kapitoly o
[forenzním a právním rozměru](@/kompendium/forensic-legal/_index.md) proto opakovaně
zdůrazňují, že shoda se seznamem znaků není doklad. Pravděpodobnostní obdobou klamu je
záměna dvou podmíněných pravděpodobností: pravděpodobnosti znaku za předpokladu hypotézy a
pravděpodobnosti hypotézy za předpokladu znaku. Thompson a Schumann popsali tuto záměnu u
porotců posuzujících statistické důkazy a pojmenovali ji klamem žalobce (Thompson a Schumann
1987). Tversky a Kahneman ukázali, že lidé soudí pravděpodobnost hypotézy podle toho, jak
dobře jí znak odpovídá, a přehlížejí, jak častá je hypotéza předem (Tversky a Kahneman 1974).
Obě chyby sdílejí stavbu potvrzení důsledku: vztah, který vede od příčiny k projevu, se čte
jako vztah od projevu k příčině.

## Detekční znaky

Klam se v rozhovoru ohlašuje typickými obraty: „to přesně sedí“, „přesně tak by to vypadalo,
kdyby…“, „typický znak“, „učebnicový případ“. Mluvčí uvádí, co by hypotéza předpověděla, a
pak shledá, že se to stalo, aniž by se ptal, co jiného by k témuž výsledku vedlo. Často
chybí srovnání s případy, v nichž hypotéza neplatí: kolik lidí, kteří nic neskrývají, také
uhýbá pohledem, kolik pacientů s obtížemi se zlepší i bez léčby, kolik nevinných má na
oblečení stopy běžné látky. Damer zařazuje potvrzení důsledku mezi vady struktury, které se v
každodenní argumentaci dají snadno přehlédnout, protože úsudek zní přirozeně (Damer 2009).
Dalším znakem je nahromadění shod: když jednotlivé shody nic nedokazují, mluvčí jich uvede
mnoho a jejich počet vydává za sílu důkazu. Shody však sílu získávají jen tehdy, když jsou
pro hypotézu mnohem pravděpodobnější než pro její alternativy. V konspiračním výkladu se
navíc objevuje obrácená asymetrie: každá shoda hypotézu potvrzuje a každý nesoulad se
vysvětlí jako součást zakrývání.

## Odlišení od platné argumentace

Úsudek od důsledku k hypotéze není v empirickém poznání chybou, pokud se nepodává jako
dedukce. Lékař, vyšetřovatel nebo vědec běžně usuzuje od projevů k jejich nejpravděpodobnější
příčině. Taková úvaha je legitimní, když výslovně zvažuje jiné příčiny, když bere v úvahu,
jak časté jsou jednotlivé možnosti předem, a když nechává hypotézu otevřenou dalšímu ověření
(Walton, Reed a Macagno 2008). Pravděpodobnostní pohled vysvětluje, kdy je takový doklad
silný: znak hypotézu podporuje tím víc, čím je pravděpodobnější za předpokladu hypotézy než
za předpokladu jejích alternativ. Hahn a Oaksford na podobném základě ukazují, že úvahy, které
tradiční výklad paušálně odsuzuje, mohou být racionální, pokud jejich síla odpovídá obsahu
(Hahn a Oaksford 2007). Gigerenzer doložil, že posouzení se zpřesní, když se podmíněné
pravděpodobnosti převedou na přirozené četnosti, tedy na počty lidí ve skupinách s znakem a
bez něj (Gigerenzer 2002). Platnou formou je také úsudek v situaci, kde podmínka skutečně
platí oběma směry: pokud B nastává jen a pouze při A, pak z B lze A vyvodit. Rozhodující je,
zda se taková oboustrannost výslovně tvrdí a dá se doložit, nebo se jen mlčky předpokládá.

## Stav poznání

Potvrzení důsledku patří k nejlépe zmapovaným chybám psychologie usuzování. V úlohách s
podmíněnými úsudky ho velká část dospělých přijímá jako platný, zatímco platnou formu modus
tollens naopak často odmítá. V úloze s výběrem karet lidé při ověřování podmínky vyhledávají
případy, kde se objevil důsledek, místo případů, které by podmínku mohly vyvrátit; Nickerson
tento vzorec řadí k projevům sklonu k potvrzování (Nickerson 1998). Pro aplikovanou oblast je
podstatný výzkum úsudků z neverbálních znaků. Vrij v přehledu výzkumu detekce lži ukazuje, že
uhýbání pohledem, které laici i mnozí profesionálové považují za znak lži, s klamáním
spolehlivě nesouvisí (Vrij 2008). Wiseman a kolegové experimentálně ověřili tvrzení NLP, že
lež prozrazuje směr pohybu očí, a podporu pro ně nenašli (Wiseman a kol. 2012). V soudní
oblasti doložili Thompson a Schumann, že záměna podmíněných pravděpodobností ovlivňuje, jak
porotci hodnotí statistické důkazy (Thompson a Schumann 1987). Gigerenzer ukazuje obdobné
chyby u lékařů při výkladu výsledků screeningových testů a zároveň, že je lze zmírnit lepší
prezentací čísel (Gigerenzer 2002). Výzkum tedy nepodporuje představu, že jde o vzácnou chybu
nevzdělaných: jde o soustavný sklon, který odborné prostředí zmírní jen tehdy, když má
vypracované postupy srovnání s alternativami.

## Vztah k technikám kompendia

V technikách manipulace se potvrzení důsledku objevuje tam, kde se člověku vnucuje výklad jeho
vlastních projevů. Kdo „má problém se vztekem“, ten se brání kritice; člověk se brání, a tím
prý problém potvrdil. Taková stavba je zvlášť účinná proto, že každá reakce oběti se stává
dalším potvrzením. Heslo o [heuristikách úsudku](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md)
popisuje, jak prostředí soustavně využívá úsudek podle podobnosti, který Tversky a Kahneman
popsali jako heuristiku reprezentativnosti (Tversky a Kahneman 1974); potvrzení důsledku je jeho
logická kostra. Příbuzným formálním klamem je
[popření předchůdce](@/kompendium/argumentacni-fauly/formalni/popreni-predchudce.md), které
z podmínky usuzuje obráceně na druhé straně.

## Obrana a odpověď

Základní otázka zní: co jiného by vedlo k témuž výsledku a jak často se tento výsledek
objevuje, když hypotéza neplatí? Otázka nevyvrací hypotézu, ale vrací do úvahy alternativy,
které úsudek vynechal. Druhou odpovědí je protipříklad stejné formy, v němž je zjevné, že
shoda s předpovědí nestačí. Třetí odpovědí je převést spor do formy, která platná je: místo
hledání shod hledat důsledek, který by nastal jen tehdy, kdyby hypotéza neplatila, a ověřit,
zda nastal. Popper tuto asymetrii mezi potvrzením a vyvrácením považoval za jádro vědecké
metody (Popper 1959). V odborných posudcích pomáhá výslovně uvést, jak častý je zjištěný znak v
populaci bez posuzovaného stavu, a převést pravděpodobnosti na četnosti, jimž rozumí i laický
čtenář (Gigerenzer 2002). V rozhovoru s člověkem, na nějž je klam namířen, je důležité trvat
na tom, že jeho reakce na obvinění není doklad obvinění. [Pragma-dialektika](@/kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md) takové zviditelnění
skryté oboustranné podmínky chápe jako způsob, jak spor vrátit k pravidlu platnosti a k
věcným důkazům (van Eemeren a Grootendorst 2004).

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Hamblin, C. L. (1970). *Fallacies*. London: Methuen.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. London: Hutchinson.
- Thompson, W. C., & Schumann, E. L. (1987). Interpretation of statistical evidence in criminal trials: The prosecutor's fallacy and the defense attorney's fallacy. *Law and Human Behavior*, 11(3), 167–187.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Vrij, A. (2008). *Detecting Lies and Deceit: Pitfalls and Opportunities* (2. vyd.). Chichester: Wiley.
- Walton, D., Reed, C., & Macagno, F. (2008). *Argumentation Schemes*. Cambridge: Cambridge University Press.
- Wiseman, R., Watt, C., ten Brinke, L., Porter, S., Couper, S.-L., & Rankin, C. (2012). The eyes don't have it: Lie detection and neuro-linguistic programming. *PLoS ONE*, 7(7), e40259.
- van Eemeren, F. H., & Grootendorst, R. (2004). *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach*. Cambridge: Cambridge University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – příbuzné heslo (Formální klamy, Formal fallacy)
- [Popření předchůdce](@/kompendium/argumentacni-fauly/formalni/popreni-predchudce.md) – příbuzné heslo (Formální klamy, Denying the antecedent)
- [Nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md) – příbuzné heslo (Formální klamy, Undistributed middle)
- [Po tom, tedy kvůli tomu](@/kompendium/argumentacni-fauly/kauzalni/post-hoc.md) – příbuzné heslo (Kauzální klamy, Post hoc ergo propter hoc)
- [Zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Base-rate neglect)
- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Prosecutor's fallacy)
- [Pravidlo platnosti](@/kompendium/argumentacni-fauly/teorie-argumentace/pravidlo-platnosti.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Validity rule)
- [Argumentační schémata a kritické otázky](@/kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Argumentation schemes)
- [Příčina a následek](@/kompendium/nlp-vzorce/meta-model/pricina-a-nasledek.md) – příbuzné heslo (NLP vzorce: Meta-model, Cause and effect)

**V kompendiu**

- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – předchozí heslo rodiny
- [Popření předchůdce](@/kompendium/argumentacni-fauly/formalni/popreni-predchudce.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
