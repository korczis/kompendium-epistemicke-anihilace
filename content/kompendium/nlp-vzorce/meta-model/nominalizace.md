+++
title = "Nominalizace"
description = "Převedení děje na podstatné jméno, které zakrývá aktéry a průběh: kde jde o běžnou zkratku řeči a kde se z procesu stává neměnná věc, o které nelze jednat."
weight = 2
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-meta-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Nominalizace", "Nominalisation", "nominalizace procesu", "Meta-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-03.02"
catalog_slug = "nominalizace"
catalog_family = "meta-model"
catalog_family_code = "03"
catalog_family_title = "Meta-model"
catalog_family_en = "Meta Model"
catalog_part = "meta-model"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Nominalisation"
catalog_aliases = ["nominalizace procesu"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "meta-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["meta-model"]
catalog_related = ["ctyri-terminy", "reifikace", "eufemismus-a-dysfemismus", "pravidlo-uzivani-jazyka", "zkreslovani", "hluboka-a-povrchova-struktura", "nespecifikovane-sloveso", "presupozice-v-meta-modelu", "poruseni-selekcnich-omezeni-meta", "nominalizace-milton", "existencni-presupozice", "vztazne-vety-presupozice", "som-redefinice", "smyslove-dukazy-cile", "chunking-nahoru", "slovni-baliky"]
catalog_related_declared = ["zkreslovani", "nominalizace-milton", "slovni-baliky", "nespecifikovane-sloveso"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-5-1-4-semanticka-imploze.md", "kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md", "kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md", "kompendium/nlp-vzorce/milton-model/nominalizace-milton.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-5-1-4-semanticka-imploze.md"]
catalog_prev = "meta-model"
catalog_next = "nespecifikovane-sloveso"
catalog_position = 2
catalog_family_size = 17
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "beck-1976", "chomsky-1965", "herman-1992", "lakoff-johnson-1980", "lifton-1961", "loftus-palmer-1974", "oconnor-seymour-1990", "sharpley-1987", "sturt-2012", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b", "oconnor-seymour-1990"]
catalog_sources_roots = ["chomsky-1965"]
catalog_sources_critical = ["beck-1976", "herman-1992", "lakoff-johnson-1980", "lifton-1961", "loftus-palmer-1974", "sharpley-1987", "sturt-2012", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/meta-model.toml"
+++

# Nominalizace

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-03.02` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Nominalisation |
| **Jiné názvy** | nominalizace procesu |
| **Obecnější heslo** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Nominalizace je v meta-modelu kategorie vět, ve kterých je probíhající děj vyjádřen
podstatným jménem. Místo „rozhoduju se“, „bojím se“ nebo „vztahujeme se k sobě“ mluvčí
říká „rozhodnutí“, „strach“ nebo „vztah“. Podle autorů meta-modelu se tím děj, který má
aktéry, průběh a dá se ovlivnit, mění ve věc, která jako by existovala sama a byla hotová
(Bandler a Grinder 1975). Meta-model řadí nominalizaci mezi zkreslení, protože jazyk zde
nepřesně zobrazuje povahu zkušenosti: z činnosti dělá předmět. Gramaticky jde o úplně
běžný jev, bez kterého by se odborná ani každodenní řeč neobešla. Pozornost si zaslouží
teprve tehdy, když podstatné jméno zakrývá, kdo co dělá, a když si mluvčí nebo posluchač
přestane uvědomovat, že „věc“, o které se mluví, je ve skutečnosti něčí probíhající jednání.
Heslo navazuje na obecný popis [meta-modelu](@/kompendium/nlp-vzorce/meta-model/meta-model.md)
a úzce souvisí s [nespecifikovaným slovesem](@/kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md),
protože obě kategorie vypouštějí podrobnosti děje.

## Původ a souvislosti

Bandler a Grinder odvodili kategorii z transformační gramatiky, v níž se nominalizace
popisuje jako transformace, která ze slovesa v hloubkové struktuře vytváří podstatné jméno
v povrchové struktuře (Chomsky 1965; Bandler a Grinder 1975). V terapeutických přepisech,
které rozebírali, si všímali vět typu „mám problém s rozhodováním“ nebo „chybí mi uznání“ a
tvrdili, že klient v nich mluví o svém prožitku jako o předmětu, který vlastní nebo který mu
chybí, a ne jako o něčem, co sám dělá nebo co se děje mezi lidmi. Pozdější učebnice NLP
uvádějí nominalizaci jako jednu z nejdůležitějších kategorií meta-modelu (O'Connor a Seymour
1990). Příbuzné postřehy existují mimo NLP. Lakoff a Johnson popsali ontologické metafory,
kterými řeč zachází s činnostmi, událostmi a stavy jako s entitami a látkami; díky nim se o
nich dá mluvit, počítat je a připisovat jim příčinnou sílu, ale zároveň se tím skrývá jejich
dějová povaha (Lakoff a Johnson 1980). Lifton při studiu myšlenkové reformy popsal „nabité
jazyky“ totalitních prostředí, v nichž se složité lidské situace stlačují do krátkých,
definitivně znějících výrazů, které myšlení ukončují místo toho, aby je otevíraly (Lifton 1961).
Nominalizace je jedním z nejběžnějších gramatických prostředků takového stlačení. Opačným
směrem kategorii využilo NLP v Milton-modelu, kde jsou nominalizace ceněny právě pro svou
neurčitost, protože posluchač si je naplní vlastním obsahem (Bandler a Grinder 1975b).

## Struktura vzorce

Strukturálně má nominalizace tři vlastnosti, které je dobré rozlišovat. Za prvé mizí
aktéři: ve větě „rozhodnutí padlo“ není řečeno, kdo rozhodl, a ve větě „došlo ke ztrátě
důvěry“ není řečeno, kdo komu přestal věřit a proč. Za druhé mizí čas a průběh: děj, který
probíhá a mohl by probíhat jinak, se podává jako uzavřený stav (Bandler a Grinder 1975). Za třetí vzniká zdání
věcnosti a objektivity: podstatné jméno vypadá jako název pozorovatelné skutečnosti, i když
označuje výklad. Tyto tři vlastnosti se mohou spojit s dalšími kategoriemi meta-modelu.
Nominalizace se často pojí se
[ztraceným performativem](@/kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md), kdy
hodnocení jako „neloajálnost“ nemá uvedeného původce, nebo s domnělou příčinností, kdy
abstraktní věc „způsobuje“ pocity, například „tvoje negativita mě vyčerpává“.

Pro rozpoznání je užitečné sledovat, zda podstatné jméno označuje něco, co by šlo v daném
okamžiku pozorovat, nebo shrnutí mnoha dějů a jejich hodnocení. „Stůl“ a „dopis“ jsou věci;
„vztah“, „respekt“, „spolupráce“ nebo „odpor“ jsou zkratky za opakované jednání lidí. Meta-model
na takové zkratky odpovídá otázkou, která vrací děj: kdo koho respektuje nebo nerespektuje,
v čem se to projevuje, co by se muselo dít jinak. Smyslem není zakázat abstraktní slova, ale
umožnit, aby se o nich dalo opět jednat. Děj lze změnit, kdežto hotovou věc jen vlastnit,
ztratit nebo snášet. Autoři meta-modelu z toho vyvozovali, že klient, který o své
situaci mluví v nominalizacích, ji prožívá jako uzavřenou a sobě vzdálenou, a že návrat ke
slovesu je zároveň návratem k možnosti volby (Bandler a Grinder 1975). Tento výklad je
terapeutická hypotéza, ne zjištění; jazyková forma sama o sobě neprokazuje, jak člověk svou
situaci prožívá.

## Detekční znaky

Manipulativní použití nominalizace má několik pozorovatelných znaků. Abstraktní podstatné
jméno se opakuje jako nálepka, která nahrazuje popis jednání: „tvoje nedůvěra“, „tvoje
negativita“, „tvůj odpor“. Nálepka se vztahuje k jedné straně vztahu a podává se jako její
trvalá vlastnost, kdežto jednání druhé strany, které ji mohlo vyvolat, zůstává nepojmenováno.
V organizacích a skupinách se objevují nominalizace jako „loajalita“, „závazek“, „vývoj“
nebo „čistota“, které mají vysokou hodnotu, ale nikdo nedefinuje, jakým jednáním se
naplňují; o jejich naplnění pak rozhoduje autorita (Lifton 1961). Typické je také to, že se
požadavek nebo výčitka nedá splnit, protože se nedá zjistit, co přesně se po člověku chce.
Kompendium tento mechanismus podrobněji rozebírá u
[terminologické mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md)
a u [sémantické imploze](@/kompendium/techniques/ea-5-1-4-semanticka-imploze.md). U člověka,
na kterého je takový jazyk dlouhodobě uplatňován, se objevuje přebírání nálepek do popisu
sebe sama („jsem prostě nedůvěřivá“), ztráta schopnosti pojmenovat konkrétní události, které
k nálepce vedly, a pocit, že problém je v něm jako věc, kterou nelze odstranit.

## Legitimní a manipulativní užití

Nominalizace je pro řeč nepostradatelná. Umožňuje mluvit o opakujících se dějích jako o
celku, srovnávat je a vytvářet pojmy, bez nichž by nebyla možná věda, právo ani terapie.
Legitimní užití je takové, při kterém mluvčí i posluchač vědí, které jednání podstatné jméno
shrnuje, a kdykoli se k němu mohou vrátit. V kognitivní terapii se s podobným posunem
pracuje tak, že se obecné hodnocení vlastní osoby spojuje zpět s konkrétními situacemi a
myšlenkami, které ho živí (Beck 1976). V terapeutické tradici, ze které meta-model vycházel,
se rozpouštění nominalizací vykládalo jako vracení klientovi pocitu, že svou situaci
spoluvytváří, a tedy ji může měnit (Bandler a Grinder 1975). Manipulativní užití je takové, při
kterém nominalizace slouží k zakrytí aktéra nebo k přenesení odpovědnosti. Výrok „došlo k
porušení důvěry“ může zastírat, kdo důvěru porušil; výrok „tvoje žárlivost je náš problém“ může
převést jednání jednoho na vlastnost druhého. Obrácenou, záměrně neurčitou podobu
nominalizace popisuje heslo
[Nominalizace v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nominalizace-milton.md).

## Stav důkazů

Existence nominalizace jako jazykového jevu je nesporná a lingvistika ji popisuje podrobně.
Tvrzení NLP, že rozpouštění nominalizací v rozhovoru má terapeutický účinek, však nebylo
podrobeno kontrolovaným studiím, které by ho izolovaly. Přehledy výzkumu NLP se týkaly hlavně
jiných tvrzení, zejména preferovaného reprezentačního systému, a celkově nenašly oporu pro
hlavní předpoklady oboru (Sharpley 1987; Witkowski 2010). Systematický přehled zdravotních
výsledků NLP konstatoval nedostatek kvalitních důkazů (Sturt a kol. 2012). Spojení mezi
volbou jazykových forem a tím, jak lidé událost vnímají a pamatují si ji, je přitom doloženo
mimo NLP: formulace otázky může měnit odhady svědků i jejich pozdější vzpomínky (Loftus a
Palmer 1974). To podporuje obecnou myšlenku, že jazyková forma není neutrální, ale nepotvrzuje
konkrétní tvrzení NLP o nominalizacích. Pro čtenáře kompendia z toho plyne, že nominalizace je
spolehlivý detekční pojem pro analýzu řeči, ale ne ověřená terapeutická technika.

## Obrana a zotavení

Obrana proti manipulativní nominalizaci začíná tím, že si posluchač podstatné jméno sám pro
sebe přeloží zpět do děje. Místo „tvoje nedůvěra“ se ptá, o jakou konkrétní otázku nebo
pochybnost šlo a co jí předcházelo; místo „nedostatek loajality“ se ptá, jaké jednání se po
něm chtělo a kdo to rozhodl. Takový překlad často ukáže, že nálepka shrnuje jedinou událost nebo
že jednání, které ji vyvolalo, je na druhé straně. Druhou obranou je trvat na popisu jednání
v rozhovoru: „můžeme mluvit o tom, co se stalo v pátek?“ je legitimní odpověď na abstraktní
výčitku. Třetí obranou je všímat si slovníku skupiny. Pokud skupina má mnoho hodnotově nabitých
nominalizací, které se nedají vyložit bez autority, jde o varovný znak, který Lifton
spojoval s totalitním prostředím (Lifton 1961). V zotavení po dlouhodobém působení takového
jazyka pomáhá postupné vracení konkrétních vzpomínek k nálepkám, které člověk převzal, a
oddělení vlastností osoby od událostí, ve kterých jednala. Herman zdůrazňuje, že součástí
zotavení z traumatických vztahů je rekonstrukce prožitého příběhu vlastními slovy (Herman
1992).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Sturt, J., Ali, S., Robertson, W., Metcalfe, D., Grove, A., Bourne, C., & Bridle, C. (2012). Neurolinguistic programming: A systematic review of the effects on health outcomes. *British Journal of General Practice*, 62(604), e757–e764.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Čtyři termíny](@/kompendium/argumentacni-fauly/formalni/ctyri-terminy.md) – příbuzné heslo (Argumentační fauly: Formální klamy, Four terms)
- [Reifikace](@/kompendium/argumentacni-fauly/jazykove-klamy/reifikace.md) – příbuzné heslo (Argumentační fauly: Klamy jazyka a dvojznačnosti, Reification)
- [Eufemismus a dysfemismus](@/kompendium/argumentacni-fauly/jazykove-klamy/eufemismus-a-dysfemismus.md) – příbuzné heslo (Argumentační fauly: Klamy jazyka a dvojznačnosti, Euphemism and dysphemism)
- [Pravidlo užívání jazyka](@/kompendium/argumentacni-fauly/teorie-argumentace/pravidlo-uzivani-jazyka.md) – příbuzné heslo (Argumentační fauly: Principy kritické diskuse a teorie argumentace, Usage rule)
- [Zkreslování](@/kompendium/nlp-vzorce/zakladni-pojmy/zkreslovani.md) – příbuzné heslo (Základní pojmy NLP, Distortion)
- [Hluboká a povrchová struktura](@/kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md) – příbuzné heslo (Základní pojmy NLP, Deep and surface structure)
- [Nespecifikované sloveso](@/kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md) – příbuzné heslo (Meta-model, Unspecified verb)
- [Presupozice v meta-modelu](@/kompendium/nlp-vzorce/meta-model/presupozice-v-meta-modelu.md) – příbuzné heslo (Meta-model, Presuppositions (Meta Model))
- [Porušení selekčních omezení](@/kompendium/nlp-vzorce/meta-model/poruseni-selekcnich-omezeni-meta.md) – příbuzné heslo (Meta-model, Selectional restriction violation (Meta Model))
- [Nominalizace v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nominalizace-milton.md) – příbuzné heslo (Milton-model, Nominalisations (Milton Model))
- [Existenční presupozice](@/kompendium/nlp-vzorce/presupozice/existencni-presupozice.md) – příbuzné heslo (Jazykové presupozice, Existential presupposition)
- [Vztažné věty jako presupozice](@/kompendium/nlp-vzorce/presupozice/vztazne-vety-presupozice.md) – příbuzné heslo (Jazykové presupozice, Relative clauses)
- [Redefinice](@/kompendium/nlp-vzorce/sleight-of-mouth/som-redefinice.md) – příbuzné heslo (Sleight of Mouth, Redefine)
- [Smyslové důkazy dosažení](@/kompendium/nlp-vzorce/cile-a-vysledky/smyslove-dukazy-cile.md) – příbuzné heslo (Cíle a výsledky, Sensory-based evidence)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzné heslo (Jazykové vzorce, Chunking up)
- [Hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) – příbuzné heslo (Jazykové vzorce, Loaded words)

**V kompendiu**

- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.1.4 Sémantická imploze](@/kompendium/techniques/ea-5-1-4-semanticka-imploze.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.4.24 Past epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – předchozí heslo rodiny
- [Nespecifikované sloveso](@/kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
