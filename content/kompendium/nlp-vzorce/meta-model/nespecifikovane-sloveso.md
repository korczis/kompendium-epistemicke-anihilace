+++
title = "Nespecifikované sloveso"
description = "Sloveso, které neříká, co se konkrétně stalo: kde je běžnou zkratkou a kde zastírá jednání, podsouvá výklad události a mění svědectví."
weight = 3
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-meta-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Nespecifikované sloveso", "Unspecified verb", "nespecifikovaný děj", "Meta-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-03.03"
catalog_slug = "nespecifikovane-sloveso"
catalog_family = "meta-model"
catalog_family_code = "03"
catalog_family_title = "Meta-model"
catalog_family_en = "Meta Model"
catalog_part = "meta-model"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Unspecified verb"
catalog_aliases = ["nespecifikovaný děj"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "meta-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["meta-model"]
catalog_related = ["vypousteni", "nominalizace", "nespecifikovana-slovesa-milton", "presupozice-ve-vyslechu", "som-rozlozeni", "chunking-dolu"]
catalog_related_declared = ["vypousteni", "nespecifikovana-slovesa-milton", "nominalizace", "presupozice-ve-vyslechu"]
catalog_kompendium = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md", "kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/nespecifikovany-referencni-index.md", "kompendium/nlp-vzorce/meta-model/nominalizace.md", "kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md", "kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md", "kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md"]
catalog_prev = "nominalizace"
catalog_next = "nespecifikovany-referencni-index"
catalog_position = 3
catalog_family_size = 17
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "beck-1976", "chomsky-1965", "grice-1975", "heap-1988", "herman-1992", "loftus-palmer-1974", "miller-rollnick-2013", "passmore-rowson-2019", "sharpley-1987", "stark-2007", "sturt-2012", "vrij-2008", "watzlawick-1967", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
catalog_sources_roots = ["chomsky-1965", "grice-1975", "watzlawick-1967"]
catalog_sources_critical = ["beck-1976", "heap-1988", "herman-1992", "loftus-palmer-1974", "miller-rollnick-2013", "passmore-rowson-2019", "sharpley-1987", "stark-2007", "sturt-2012", "vrij-2008", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/meta-model.toml"
+++

# Nespecifikované sloveso

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-03.03` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Unspecified verb |
| **Jiné názvy** | nespecifikovaný děj |
| **Obecnější heslo** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Nespecifikované sloveso je v meta-modelu kategorie vět, ve kterých sloveso pojmenovává děj
tak obecně, že z něj nelze poznat, co se skutečně stalo. Věty „ublížil mi“, „pomohla mi“,
„vyřešil jsem to“ nebo „ona mě vyprovokovala“ mají gramaticky úplný tvar, ale nesdělují
způsob, prostředky ani pořadí jednání. Autoři meta-modelu upozorňovali, že žádné sloveso není
zcela specifické a že rozdíl je jen v míře; kategorie se proto uplatní tam, kde vágnost
slovesa brání porozumění nebo kde zakrývá podstatnou část zkušenosti (Bandler a Grinder
1975). Meta-model řadí nespecifikované sloveso mezi vypouštění: z popisu zmizel samotný
děj, zůstalo jen jeho hodnocení nebo výsledek. Heslo je součástí rodiny
[Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) a souvisí s
[nominalizací](@/kompendium/nlp-vzorce/meta-model/nominalizace.md), která děj nejen
zobecňuje, ale přímo mění ve věc. Pro kompendium je kategorie důležitá hlavně ve
vyšetřovacím a klinickém kontextu, kde se z obecného slovesa snadno stává nevyslovený výklad
události.

## Původ a souvislosti

Kategorie pochází ze stejného zdroje jako celý meta-model: z transformační gramatiky, podle
níž [hloubková struktura](@/kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md) věty obsahuje úplnou reprezentaci děje včetně jeho účastníků a
okolností, kdežto povrchová věta je zkrácená (Chomsky 1965; Bandler a Grinder 1975). Bandler a
Grinder v terapeutických rozhovorech, které rozebírali, sledovali, jak terapeuti reagují na
obecná slovesa otázkou po konkrétním průběhu. Klient, který řekne „rodiče mě odmítli“, může
podle nich mít v hlavě jedinou vzpomínku, opakovaný vzorec chování nebo jen obavu; obecné
sloveso všechny tři možnosti zakrývá (Bandler a Grinder 1975). V obrácené podobě, jako
záměrně neurčitý jazyk, se nespecifikovaná slovesa objevují v Milton-modelu, odvozeném
z řeči Miltona Ericksona, kde obecné sloveso nechává posluchači volnost, co si pod ním
představí (Bandler a Grinder 1975b). Mimo NLP je téma dobře známé z výzkumu svědecké
výpovědi. Loftus a Palmer ukázali, že volba slovesa v otázce na dopravní nehodu ovlivnila
odhady rychlosti i to, zda svědci později „viděli“ rozbité sklo, které ve skutečnosti na
záznamu nebylo (Loftus a Palmer 1974). Sloveso tedy nepopisuje událost neutrálně; nese
výklad, který se může stát součástí paměti.

## Struktura vzorce

Strukturálně je nespecifikované sloveso místem, kde se v popisu spojuje pozorování a výklad.
Sloveso „udeřil“ popisuje pozorovatelný děj; sloveso „ublížil“ popisuje výsledek a hodnocení;
sloveso „vyřešil“ popisuje jen to, že mluvčí situaci považuje za uzavřenou. Čím obecnější
sloveso je, tím více výkladu nese a tím méně pozorování. Druhým strukturálním rysem je
interpunkce sledu událostí. Věta „vyprovokovala mě“ vybírá z řetězce jednání jeden bod a
prohlašuje ho za začátek, takže následující jednání mluvčího se jeví jako reakce.
Watzlawick a spolupracovníci popsali takové „interpunkce“ jako běžný zdroj neřešitelných
sporů, v nichž každá strana chápe své jednání jako odpověď na jednání druhé (Watzlawick,
Beavin a Jackson 1967). Třetím rysem je, že nespecifikované sloveso se často pojí s
[nespecifikovaným referenčním indexem](@/kompendium/nlp-vzorce/meta-model/nespecifikovany-referencni-index.md):
„řešilo se to“ neříká ani co, ani kdo. Meta-model na tyto tvary odpovídá otázkou po průběhu:
jak konkrétně, čím, v jakém pořadí. Taková otázka nevnucuje odpověď, ale ukazuje, že popis
děje chybí. Rozdíl mezi obecným a konkrétním slovesem má i pragmatickou stránku. Podle
Griceova principu spolupráce posluchač předpokládá, že mluvčí řekl tolik, kolik bylo třeba;
kdo zvolí obecné sloveso tam, kde by přesné bylo na místě, vyvolává u posluchače dovození,
že víc k věci není (Grice 1975). Právě tato nevyslovená implikace dává vágnímu slovesu
sílu: posluchač nedostane nepravdivou informaci, ale doplní si mírnější obraz sám.

## Detekční znaky

Vágní slovesa jsou v řeči všudypřítomná, a sama nejsou znakem manipulace ani klamu. Pozornost
si zaslouží v několika konstelacích. První je popis vlastního jednání, které by bylo
problematické, kdyby se pojmenovalo přesně: „trochu jsem ho usměrnil“, „jen jsem jí to
vysvětlil“, „vyřešil jsem to po svém“. Druhá je popis jednání druhého slovesem, které už v
sobě nese vinu: „vyprovokovala“, „donutil mě“, „vytočila mě“. Třetí je situace, kdy vágní
sloveso zavádí do rozhovoru tazatel, například vyšetřovatel, terapeut nebo novinář, a
dotazovaný ho přebírá do svého popisu. Stark ve své analýze donucující kontroly upozorňuje, že
popisy jednotlivých incidentů často zakrývají soustavný vzorec ovládání, který se v nich
neprojeví (Stark 2007); obecná slovesa jsou jedním z jazykových prostředků, kterými se
konkrétní jednání v takových popisech ztrácí. Kompendium podobné znaky popisuje u
[vzorce gaslightingu](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md),
kde se mění pojmenování toho, co se stalo, a tím i vzpomínka oběti. U člověka, jehož popis
událostí je soustavně přepisován obecnými slovesy druhé strany, se objevuje nejistota,
zda se „opravdu něco stalo“, a sklon přebírat mírnější slovník.

## Legitimní a manipulativní užití

Legitimní užití upřesňování slovesa je v klinické a forenzní praxi běžné a dobře
odůvodněné. Kvalitní [forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md)
dává přednost volnému vyprávění a otevřeným výzvám k popisu a chrání se před tím, aby tazatel
vkládal do otázek vlastní slovesa, protože ta mohou výpověď měnit (Loftus a Palmer 1974). V
kognitivní terapii se obecné popisy typu „všechno jsem pokazil“ vracejí ke konkrétním
situacím a dějům, ve kterých lze rozlišit, co se stalo a jak to člověk vyložil (Beck 1976).
Manipulativní užití má dvě podoby. Mluvčí může používat obecná slovesa, aby zmírnil nebo
zastřel vlastní jednání a zároveň popsal jednání druhého slovesem, které ho obviňuje. Tazatel
může naopak do otázky vložit sloveso, které odpověď předjímá, a pak ji vydávat za svědectví.
Tím se nespecifikované sloveso dotýká jazykových presupozic, které rozebírá heslo
[Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md).

Hranice mezi legitimním a manipulativním upřesňováním vede i uvnitř pomáhajících profesí.
Terapeut nebo vyšetřovatel, který trvá na přesném popisu děje dřív, než je člověk připraven,
může upřesňování proměnit v tlak, který výpověď spíše uzavře nebo zkreslí. Pro motivační
rozhovory se proto doporučuje přednost otevřených otázek a reflexí před sledem uzavřených
dotazů (Miller a Rollnick 2013). Legitimní upřesnění slovesa tedy poznáme podle toho, že ho
mluvčí může odmítnout nebo odložit, aniž by jeho výpověď ztratila váhu.

## Stav důkazů

O tom, že volba slovesa ovlivňuje vnímání a paměť události, existuje solidní experimentální
literatura mimo NLP, jejímž klasickým příkladem je studie Loftusové a Palmera (Loftus a
Palmer 1974). Tato literatura však nedokládá terapeutická tvrzení meta-modelu, tedy že
upřesnění slovesa samo vede ke změně klientova prožívání. Kontrolované studie, které by takový
účinek izolovaly, v přehledech výzkumu NLP chybějí; přehledy se soustředily hlavně na
[reprezentační systémy](@/kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md) a predikáty a celkově nenašly oporu pro hlavní tvrzení oboru (Sharpley
1987; Heap 1988; Witkowski 2010). Ve vyšetřovacím kontextu je navíc nutná opatrnost při
vyvozování závěrů z jazyka. Vrij ve svém přehledu výzkumu odhalování klamu zdůrazňuje, že
žádný jednotlivý verbální ani neverbální znak není spolehlivým ukazatelem lži (Vrij 2008).
Vágní sloveso proto může být důvodem k otevřené otázce, nikdy ne důkazem, že mluvčí něco
zatajuje. Obecná slovesa používají i lidé, kteří o traumatické události mluví poprvé, protože
přesné pojmenování je pro ně bolestné; zdrženlivost v popisu může být známkou zátěže, ne
vyhýbání se pravdě (Herman 1992). Systematický přehled účinků NLP na zdravotní výsledky ani
kritický přehled pro oblast koučinku nenabízejí důkazy, které by tento obraz měnily (Sturt a
kol. 2012; Passmore a Rowson 2019).

## Obrana a zotavení

Obranou proti nespecifikovanému slovesu použitému k zastření jednání je oddělit pozorovatelný
děj od jeho hodnocení. Kdo si zapisuje, co kdo udělal, čím a v jakém pořadí, a odděleně od
toho, jak to sám nebo druhý nazval, má oporu, kterou pozdější přepisování obtížně rozloží.
Totéž platí pro posluchače: když někdo popisuje vlastní jednání slovesem „vyřešil“ nebo
„usměrnil“, je legitimní se ptát, co přesně se stalo, a nepřebírat sloveso jako popis.
Proti tazateli, který do otázky vkládá vlastní slovesa, je obranou odpovídat vlastními
slovy a nepotvrzovat formulaci, se kterou člověk nesouhlasí; odborník by měl naopak
formulovat otázky co nejotevřeněji. V zotavení po vztazích, ve kterých druhá strana soustavně
přejmenovávala, co se stalo, pomáhá obnova vlastního slovníku pro prožité události. Herman
popisuje rekonstrukci příběhu traumatu jako součást zotavení, která probíhá v bezpečném
vztahu a vlastním tempem (Herman 1992). Přesné sloveso tu není cílem výslechu, ale
prostředkem, kterým si člověk vrací právo pojmenovat svou zkušenost.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.
- Sturt, J., Ali, S., Robertson, W., Metcalfe, D., Grove, A., Bourne, C., & Bridle, C. (2012). Neurolinguistic programming: A systematic review of the effects on health outcomes. *British Journal of General Practice*, 62(604), e757–e764.
- Vrij, A. (2008). *Detecting Lies and Deceit: Pitfalls and Opportunities* (2. vyd.). Chichester: Wiley.
- Watzlawick, P., Beavin, J. H., & Jackson, D. D. (1967). *Pragmatics of Human Communication*. New York: W. W. Norton.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Vypouštění](@/kompendium/nlp-vzorce/zakladni-pojmy/vypousteni.md) – příbuzné heslo (Základní pojmy NLP, Deletion)
- [Nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md) – příbuzné heslo (Meta-model, Nominalisation)
- [Nespecifikovaná slovesa v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nespecifikovana-slovesa-milton.md) – příbuzné heslo (Milton-model, Unspecified verbs (Milton Model))
- [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) – příbuzné heslo (Jazykové presupozice, Presuppositions in questioning and testimony)
- [Rozložení na části](@/kompendium/nlp-vzorce/sleight-of-mouth/som-rozlozeni.md) – příbuzné heslo (Sleight of Mouth, Chunk down)
- [Chunking dolů](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-dolu.md) – příbuzné heslo (Jazykové vzorce, Chunking down)

**V kompendiu**

- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Detekční signatura: Gaslighting vzorec](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.4.24 Past epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md) – předchozí heslo rodiny
- [Nespecifikovaný referenční index](@/kompendium/nlp-vzorce/meta-model/nespecifikovany-referencni-index.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
