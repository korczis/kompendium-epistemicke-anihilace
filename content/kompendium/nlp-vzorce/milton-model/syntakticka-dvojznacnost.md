+++
title = "Syntaktická dvojznačnost"
description = "Vzorec Milton-modelu, v němž stavba věty připouští dvojí rozbor: jak skrývá hrozby a sliby, jak se pozná a co o jeho účinku víme."
weight = 12
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Syntaktická dvojznačnost", "Syntactic ambiguity", "skladební dvojznačnost", "strukturní dvojznačnost", "Milton-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-04.12"
catalog_slug = "syntakticka-dvojznacnost"
catalog_family = "milton-model"
catalog_family_code = "04"
catalog_family_title = "Milton-model"
catalog_family_en = "Milton Model"
catalog_part = "milton-model.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Syntactic ambiguity"
catalog_aliases = ["skladební dvojznačnost", "strukturní dvojznačnost"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "milton-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["milton-model"]
catalog_related = ["amfibolie", "fonologicka-dvojznacnost", "rozsahova-dvojznacnost", "interpunkcni-dvojznacnost", "umyslna-vagnost", "konfuzni-technika"]
catalog_related_declared = ["fonologicka-dvojznacnost", "rozsahova-dvojznacnost", "interpunkcni-dvojznacnost", "umyslna-vagnost", "konfuzni-technika"]
catalog_kompendium = ["kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md", "kompendium/techniques/ea-5-1-4-semanticka-imploze.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/ericksonovska-hypnoza/konfuzni-technika.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md"]
catalog_prev = "fonologicka-dvojznacnost"
catalog_next = "rozsahova-dvojznacnost"
catalog_position = 12
catalog_family_size = 30
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "chomsky-1965", "druckman-swets-1988", "erickson-rossi-rossi-1976", "grice-1975", "grinder-bandler-1981", "herman-1992", "kahneman-2011", "levinson-1983", "mcguire-1964", "oconnor-seymour-1990", "passmore-rowson-2019", "sharpley-1987", "stark-2007"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b", "grinder-bandler-1981", "oconnor-seymour-1990"]
catalog_sources_roots = ["chomsky-1965", "erickson-rossi-rossi-1976", "grice-1975", "levinson-1983"]
catalog_sources_critical = ["druckman-swets-1988", "herman-1992", "kahneman-2011", "mcguire-1964", "passmore-rowson-2019", "sharpley-1987", "stark-2007"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/milton-model.b.toml"
+++

# Syntaktická dvojznačnost

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.12` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Syntactic ambiguity |
| **Jiné názvy** | skladební dvojznačnost, strukturní dvojznačnost |
| **Obecnější heslo** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Syntaktická dvojznačnost je výpověď, jejíž skladební stavbu lze rozebrat dvěma způsoby, takže
táž posloupnost slov nese dva různé významy. Nejde o dvojznačnost jednoho slova, ale o
nejasnost vztahů mezi slovy: není zřejmé, co je podmětem a co předmětem, ke kterému členu se
váže přívlastek nebo předložková vazba, nebo zda určité slovo funguje jako přídavné jméno, či
jako část slovesného tvaru. Bandler a Grinder zařadili syntaktickou dvojznačnost mezi jazykové
vzorce, které podle nich Erickson v hypnotické řeči používal, a popsali ji jako jeden ze
způsobů, jak posluchače přimět, aby si význam věty dotvořil sám (Bandler a Grinder 1975b).
Čeština k takové dvojznačnosti nabízí vlastní zdroje: volný slovosled, shodu tvarů prvního a
čtvrtého pádu u mnoha podstatných jmen a předložkové vazby, které lze přiřadit k různým členům
věty. Věta „Dítě vidí kotě“ tak může znamenat, že dítě vidí kotě, i že kotě vidí dítě. Pro
kompendium je syntaktická dvojznačnost důležitá jako nástroj, jak vyslovit hrozbu, slib nebo
obvinění tak, aby se dalo popřít.

## Původ a souvislosti

Rozbor syntaktické dvojznačnosti patří ke klasickým tématům transformační gramatiky. Chomsky
užíval dvojznačné věty jako doklad, že povrchová podoba věty nestačí k určení jejího významu a
že je třeba předpokládat hloubkovou strukturu, z níž se povrchová podoba odvozuje; dvojznačná
věta je ta, jejíž povrchové podobě odpovídají dvě hloubkové struktury (Chomsky 1965). Bandler a
Grinder tento rámec přenesli do psychoterapie nejprve v meta-modelu, kde sloužil k rekonstrukci
toho, co klient ve svém vyjádření vypustil nebo zkreslil (Bandler a Grinder 1975). V
Milton-modelu ho obrátili: místo upřesňování popsali způsoby, jak hloubkovou strukturu
ponechat nerozhodnutou (Bandler a Grinder 1975b). V učebnicích NLP se Milton-model proto
běžně vykládá jako zrcadlový protějšek
[meta-modelu](@/kompendium/nlp-vzorce/meta-model/meta-model.md) (O'Connor a Seymour 1990).

Pragmatika vysvětluje, proč běžný posluchač dvojznačnost většinou ani nezaznamená. Kontext,
předchozí rozhovor a představa o záměru mluvčího vyberou jedno čtení dřív, než si posluchač
všimne, že existuje i druhé (Levinson 1983). Grice navíc ukázal, že konverzace stojí na
předpokladu spolupráce, k němuž patří i snaha vyjadřovat se jasně a bez dvojznačností (Grice
1975). Úmyslná syntaktická dvojznačnost tento předpoklad využívá: posluchač zvolí čtení, které
mu nabízí kontext, a mluvčí si ponechá druhé jako zadní vrátka.

## Struktura vzorce

Vzorec má čtyři strukturní prvky. Prvním je věta, která je gramaticky správná při obou
rozborech, takže nezní chybně. Druhým je zjevné čtení, které podporuje kontext a které je
neškodné nebo neutrální. Třetím je druhé čtení, které nese skutečné sdělení: hrozbu, slib,
pokyn nebo obvinění. Čtvrtým je popiratelnost, tedy možnost, že se mluvčí při dotazu přihlásí
jen k prvnímu čtení. Typická místa, kde dvojznačnost v češtině vzniká, jsou zájmena a
příslovečná určení, která lze přiřadit ke dvěma slovesům, předložkové vazby připojitelné ke
jménu i ke slovesu, a podstatná jména se shodným tvarem podmětu a předmětu ve větě s volným
slovosledem.

Milton-model tvrdí, že dvojznačná stavba v hypnotickém kontextu krátce zbrzdí vědomé
zpracování, vyvolá mírný zmatek a zvýší vnímavost k sugesci, a v tomto smyslu ji spojuje s
[konfuzní technikou](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/konfuzni-technika.md)
(Grinder a Bandler 1981). V běžném vlivovém užití mimo hypnózu je však podstatnější jiný
mechanismus: dvojznačnost přenáší břemeno výkladu na posluchače. Kdo si všimne hrozby, je
nucen ji vyslovit sám, a vystavuje se tak výčitce, že si ji „vymyslel“. Strukturně tak
syntaktická dvojznačnost souvisí s tím, co kompendium popisuje jako
[iluzorní komplexitu](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md): složitost
formy, která slouží zakrytí obsahu.

## Detekční znaky

Prvním znakem je věta, která se dá pochopit dvěma způsoby, přičemž méně zjevné čtení dává v
dané situaci překvapivě dobrý smysl, například jako varování nebo nabídka. Druhým znakem je
nejasnost aktérů: z věty nelze s jistotou poznat, kdo komu co udělá, kdo o čem rozhoduje nebo
kdo nese následky. Třetím znakem je umístění: dvojznačné věty se objevují právě v klíčových
okamžicích rozhovoru, při jednání o podmínkách, při odmítnutí, při rozchodu nebo při
vyjednávání o odchodu ze skupiny. Čtvrtým znakem je reakce na žádost o přeformulování.
Mluvčí, který dvojznačnost nepoužil úmyslně, větu bez potíží zopakuje jednoznačně. Mluvčí,
který s ní pracuje záměrně, se vyhýbá, mluví o přecitlivělosti posluchače nebo věnuje
pozornost jinému tématu.

U posluchače se vzorec projevuje typickou zpětnou nejistotou: člověk odchází z rozhovoru s
pocitem, že mu bylo něco naznačeno, ale nedokáže to doslovně citovat. Ve vztazích nerovné
moci takové nevyslovené hrozby patří k zastrašování, které Stark popisuje jako jednu ze
složek donucující kontroly (Stark 2007). Jejich síla spočívá právě v tom, že se nedají
předložit jako doklad.

## Legitimní a manipulativní užití

Syntaktická dvojznačnost má legitimní místo v literatuře, kde rozšiřuje významové pole textu,
ve výuce jazyka a logiky, kde slouží k nácviku přesného vyjadřování, a v humoru. V
diplomacii se někdy mluví o konstruktivní dvojznačnosti, kdy obě strany přijmou formulaci,
kterou si každá vykládá po svém, aby se jednání mohlo posunout; zde je dvojznačnost
oboustranně vědomá. Ericksonovská terapie popisuje nepřímé a otevřené formy sugesce, které
klientovi ponechávají volbu, jak na ně odpoví, a nevnucují mu jediný výsledek (Erickson, Rossi
a Rossi 1976); mnohoznačná řeč je v tomto rámci chápána jako jedna z jejich podob.
Legitimní užití spojuje vědomost obou stran a absence škody: nikdo není veden k rozhodnutí,
které by při jasné formulaci odmítl.

Manipulativní užití je jednostranné. Mluvčí ví o obou čteních, posluchač o druhém neví nebo
ho nemůže doložit. Typicky jde o skryté hrozby na pracovišti, o sliby v prodeji, které se
při reklamaci ukážou jako „nikdy nevyslovené“, o formulace v pravidlech skupiny, které lze
vyložit přísněji, když se to vedení hodí, nebo o výroky partnera, které posluchače zastraší,
ale nedají se citovat. Rozlišovacím kritériem je tedy nejen přítomnost dvojznačnosti, ale i
asymetrie vědomí a to, komu nejasnost slouží.

## Stav důkazů

Syntaktická dvojznačnost je v lingvistice dobře popsaný a nesporný jev (Chomsky 1965).
Sporné je až tvrzení Milton-modelu, že úmyslně dvojznačné věty mají zvláštní sugestivní
účinek. Pro toto tvrzení chybí kontrolované studie. Výbor americké Národní rady pro výzkum,
který hodnotil techniky ke zlepšení lidského výkonu, nenašel pro NLP jako metodu ovlivňování
přesvědčivé empirické doklady (Druckman a Swets 1988). Kritický přehled výzkumu NLP v oblasti
koučinku konstatuje nedostatek kvalitních studií a doporučuje opatrnost při používání technik
NLP v praxi (Passmore a Rowson 2019). Sharpley navíc upozornil, že část tvrzení NLP je
formulována tak, že se obtížně vyvrací, protože každý neúspěch lze přičíst nedokonalému
provedení (Sharpley 1987).

Dobře doložený je naopak obecnější jev, na který se úmyslná dvojznačnost spoléhá: lidé
rozhodují rychle a podle kontextu a druhé možné čtení výpovědi často vůbec nezaznamenají.
Kahneman popisuje rychlé, asociativní myšlení, které vytváří jediný soudržný výklad situace a
nevybízí k hledání alternativ (Kahneman 2011). Účinek syntaktické dvojznačnosti tedy není
třeba vysvětlovat hypnózou. Stačí běžné vlastnosti porozumění řeči a sociální tlak, který
brání posluchači zeptat se.

## Obrana a zotavení

Základní obranou je žádost o jednoznačnost. Formulace typu „myslíte tím, že…, nebo že…?“
vynese obě čtení na povrch a přiměje mluvčího se přihlásit k jednomu z nich. Užitečné je i
písemné shrnutí: e-mail, který po rozhovoru zopakuje, jak posluchač výpověď pochopil, dává
mluvčímu příležitost opravit výklad a zároveň vytváří záznam. Na pracovišti a v právních nebo
smluvních situacích je vhodné trvat na písemných podmínkách a nejasné formulace nechat
posoudit třetí osobou. Výzkum odolnosti vůči přesvědčování ukazuje, že znalost technik a
předchozí vystavení jejich oslabené podobě zvyšuje schopnost se jim bránit (McGuire 1964).

Kde dvojznačné hrozby tvořily součást dlouhodobého vztahu, jde i o zotavení. Lidé po takové
zkušenosti často popisují hypervigilanci vůči řeči druhých, potřebu každé větě hledat druhé
dno a nejistotu, zda si hrozbu „jen nevymysleli“. Pomáhá vést si záznamy výroků v přesném
znění, protože odděluje to, co bylo řečeno, od toho, co bylo pochopeno, a obnovuje důvěru ve
vlastní vnímání. Herman zdůrazňuje, že zotavení z dlouhodobého zastrašování vyžaduje nejprve
bezpečí a teprve potom práci s tím, co se stalo (Herman 1992). Pro odborníka z toho plyne, že
v kontaktu s takovým klientem má mluvit jednoznačně a ověřovat, jak byl pochopen.

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Erickson, M. H., Rossi, E. L., & Rossi, S. I. (1976). *Hypnotic Realities: The Induction of Clinical Hypnosis and Forms of Indirect Suggestion*. New York: Irvington.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Grinder, J., & Bandler, R. (1981). *Trance-formations: Neuro-Linguistic Programming and the Structure of Hypnosis*. Moab: Real People Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Amfibolie](@/kompendium/argumentacni-fauly/jazykove-klamy/amfibolie.md) – příbuzné heslo (Argumentační fauly: Klamy jazyka a dvojznačnosti, Amphiboly)
- [Fonologická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/fonologicka-dvojznacnost.md) – příbuzné heslo (Milton-model, Phonological ambiguity)
- [Rozsahová dvojznačnost](@/kompendium/nlp-vzorce/milton-model/rozsahova-dvojznacnost.md) – příbuzné heslo (Milton-model, Scope ambiguity)
- [Interpunkční dvojznačnost](@/kompendium/nlp-vzorce/milton-model/interpunkcni-dvojznacnost.md) – příbuzné heslo (Milton-model, Punctuation ambiguity)
- [Úmyslná vágnost](@/kompendium/nlp-vzorce/milton-model/umyslna-vagnost.md) – příbuzné heslo (Milton-model, Artful vagueness)
- [Konfuzní technika](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/konfuzni-technika.md) – příbuzné heslo (Ericksonovská hypnóza, Confusion technique)

**V kompendiu**

- [EA-1.2.3 Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.1.4 Sémantická imploze](@/kompendium/techniques/ea-5-1-4-semanticka-imploze.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Fonologická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/fonologicka-dvojznacnost.md) – předchozí heslo rodiny
- [Rozsahová dvojznačnost](@/kompendium/nlp-vzorce/milton-model/rozsahova-dvojznacnost.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
