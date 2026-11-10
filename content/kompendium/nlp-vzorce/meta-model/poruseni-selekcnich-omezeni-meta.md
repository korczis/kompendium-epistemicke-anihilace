+++
title = "Porušení selekčních omezení"
description = "Výroky, které neživým věcem či abstrakcím připisují vůli a city: jak je meta-model čte jako znak skryté odpovědnosti a kdy jde jen o běžnou metaforu či básnický obraz."
weight = 17
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-meta-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Porušení selekčních omezení", "Selectional restriction violation (Meta Model)", "sémantická anomálie", "připsání jednání neživému", "Meta-model", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-03.17"
nlp_slug = "poruseni-selekcnich-omezeni-meta"
nlp_family = "meta-model"
nlp_family_code = "03"
nlp_family_title = "Meta-model"
nlp_family_en = "Meta Model"
nlp_part = "meta-model.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Selectional restriction violation (Meta Model)"
nlp_aliases = ["sémantická anomálie", "připsání jednání neživému"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "nizke"
nlp_risk_cs = "nízké"
nlp_broader = "meta-model"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["meta-model"]
nlp_related = ["hluboka-a-povrchova-struktura", "nominalizace", "nespecifikovany-referencni-index", "ztraceny-performativ", "poruseni-selekcnich-omezeni"]
nlp_related_declared = ["poruseni-selekcnich-omezeni", "nominalizace", "nespecifikovany-referencni-index", "ztraceny-performativ", "hluboka-a-povrchova-struktura"]
nlp_kompendium = ["kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/meta-model/nespecifikovany-referencni-index.md", "kompendium/nlp-vzorce/meta-model/nominalizace.md", "kompendium/nlp-vzorce/milton-model/poruseni-selekcnich-omezeni.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md", "kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md"]
nlp_prev = "meta-model-jako-vyslychaci-nastroj"
nlp_next = ""
nlp_position = 17
nlp_family_size = 17
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "chomsky-1965", "hassan-1988", "herman-1992", "kirsch-lynn-1995", "lakoff-johnson-1980", "passmore-rowson-2019", "tosey-mathison-2009", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
nlp_sources_roots = ["chomsky-1965"]
nlp_sources_critical = ["hassan-1988", "herman-1992", "kirsch-lynn-1995", "lakoff-johnson-1980", "passmore-rowson-2019", "tosey-mathison-2009", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/meta-model.b.toml"
+++

# Porušení selekčních omezení

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-03.17` |
| **Rodina** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Selectional restriction violation (Meta Model) |
| **Jiné názvy** | sémantická anomálie, připsání jednání neživému |
| **Obecnější vzorec** | [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | nízké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Porušení selekčních omezení je pojem z generativní lingvistiky. Označuje větu, ve které
sloveso nebo přídavné jméno spojuje s podmětem či předmětem, jemuž podle běžných
významových pravidel nepřísluší: neživé věci se připisuje vůle, abstrakci cit, rostlině
úmysl. Věty jako „systém nemá rád výjimky“, „ta firma mě chce zničit“ nebo „pravidla se
na vás zlobí“ jsou gramaticky v pořádku, ale porušují omezení, která sloveso klade na to, kdo
může být jeho činitelem (Chomsky 1965). V NLP se pojem objevuje ve dvou rolích. V
Milton-modelu je doložen jako záměrný prostředek, který posluchače nutí hledat smysl
neobvyklé věty a tím ho vtahuje do vlastního výkladu (Bandler a Grinder 1975b). Z hlediska
meta-modelu, kterému se věnuje tato stránka, jde o znak v řeči: věta, v níž jedná neživá
věc, často vypouští skutečného činitele, a otázka po tom, kdo vlastně jedná, ho může
vrátit. Zařazení kategorie do meta-modelu se mezi autory NLP liší; některé výklady ji
vedou samostatně, jiné ji zahrnují pod širší skupinu sémantických nesprávností.

## Původ a souvislosti

Chomsky v teorii syntaxe rozlišil mezi pravidly, která určují gramatickou stavbu věty, a
selekčními pravidly, která určují, jaká slova se mohou spojovat podle svých významových
rysů, například podle životnosti nebo konkrétnosti. Věta, která tato pravidla porušuje,
není gramaticky nesprávná, ale je významově odchylná (Chomsky 1965). Bandler a Grinder
převzali z transformační gramatiky rámec hloubkové a povrchové struktury a
předpoklad, že rozdíl mezi nimi lze jazykově zachytit (Bandler a Grinder 1975). V
popisu hypnotického jazyka Miltona Ericksona pak uvedli porušení selekčních omezení jako
jeden ze vzorců, jimiž hypnotizér vytváří větu, která nemá přímý smysl a vyžaduje
vnitřní dotvoření posluchačem (Bandler a Grinder 1975b). Tomuto užití se věnuje stránka o
[porušení selekčních omezení v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/poruseni-selekcnich-omezeni.md).

Kognitivní lingvistika přinesla k jevu důležitý doplněk. Lakoff a Johnson ukázali, že
personifikace, tedy chápání neživých jevů v lidských pojmech, není okrajová ozdoba řeči,
ale běžný způsob, jakým lidé rozumějí abstraktním a složitým jevům, a že každá taková
personifikace zvýrazňuje určitou stránku jevu a jinou zakrývá (Lakoff a Johnson 1980).
Totéž platí o institucích: věta „trh rozhodl“ nebo „úřad si přeje“ dává abstrakci vůli a
zároveň určuje, jak o ní lze mluvit a s kým lze vést spor. Blízký vztah má kategorie k
[nominalizaci](@/kompendium/nlp-vzorce/meta-model/nominalizace.md), která z děje dělá věc:
nominalizovaný děj („rozhodnutí“, „vztah“, „komunikace“) se v dalších větách snadno stává
činitelem, který „chce“, „vyžaduje“ nebo „trestá“.

## Struktura vzorce

Strukturálně má výrok tři části: činitele, který podle běžných pravidel nemůže jednat nebo
cítit, sloveso jednání či prožitku a vypuštěný skutečný činitel, tedy člověk nebo skupina
lidí, kteří jednají za neživou entitou. Meta-model sleduje právě tento třetí, chybějící
prvek, protože jeho vypuštění mění rozložení odpovědnosti (Bandler a Grinder 1975).
Pozorovatel by měl rozlišovat tři podoby. První je ustálená metafora, jejíž obraznost
si nikdo neuvědomuje („čas utíká“); ta obvykle nic nezakrývá. Druhá je básnický nebo
terapeutický obraz, jehož obraznost je zřejmá a který slouží výrazu nebo porozumění. Třetí
je institucionální nebo vztahová personifikace, která připisuje rozhodnutí entitě, jež
nemůže být oslovena ani pohnána k odpovědnosti, a tím chrání toho, kdo skutečně rozhodl.

Pro defenzivní analýzu je podstatná třetí podoba. Strukturně se v ní spojují dvě
kategorie meta-modelu: porušení selekčních omezení a [nespecifikovaný referenční
index](@/kompendium/nlp-vzorce/meta-model/nespecifikovany-referencni-index.md). Výrok
„systém vám to nepovolí“ zároveň dává systému vůli a zakrývá, kdo pravidlo stanovil, kdo
ho vykládá a kdo by mohl udělit výjimku. Kompendium popisuje příbuzný mechanismus u
[kategorické transgrese](@/kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md), kde se
záměna kategorií používá k narušení schopnosti člověka posoudit, s čím vlastně mluví.

## Detekční znaky

Jazykovým znakem je sloveso vůle, emoce nebo úsudku („chce“, „nemá rád“, „zlobí se“,
„rozhodl“, „trestá“) spojené s neživým nebo abstraktním podmětem: systémem, pravidly,
procesem, vesmírem, energií, skupinou jako celkem. Znakem v interakci je to, že na otázku
„kdo přesně o tom rozhodl?“ následuje opakování personifikace („tak to systém prostě
má“) nebo odkaz na jinou neosobní instanci. V uzavřených skupinách a spirituálních
prostředích se objevuje personifikace kosmických sil, které „posílají zkoušky“ nebo
„trestají pochybnost“; pokyny vedoucího se tak prezentují jako vůle něčeho, s čím nelze
polemizovat. Hassan popisuje, že manipulativní skupiny odvozují autoritu vedení od
nadosobních zdrojů a že tím činí kritiku vedení kritikou samotné pravdy (Hassan 1988).

U člověka, který je takovému jazyku dlouhodobě vystaven, se může objevit pocit, že
rozhodnutí o jeho životě dělají neosobní síly, se kterými nelze vyjednávat. V
institucionálním kontextu se pak projevuje rezignace na stížnost a odvolání, protože
není jasné, komu by měly být adresovány. Tento efekt souvisí s mechanismem, který
kompendium popisuje u [terminologické mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md):
jazyk, který se tváří jako popis, ve skutečnosti uzavírá prostor pro otázky.

## Legitimní a manipulativní užití

Legitimní užití je široké. Personifikace patří k přirozeným prostředkům jazyka, literatury
i běžné řeči a bez ní by se o mnoha abstraktních jevech mluvilo jen těžko (Lakoff a
Johnson 1980). V terapii může klient popisovat svůj stav obrazně („úzkost mě drží pod
krkem“), a terapeut takový obraz často nerozbíjí, ale používá ho k porozumění; některé
směry pracují s externalizací problému jako s legitimním způsobem, jak oddělit člověka od
jeho obtíží. Ani v meta-modelu nejde o to, každou metaforu zpochybňovat. Smysl kategorie je
v rozpoznání situací, kdy obraz zakrývá činitele, na kterém záleží.

Manipulativní užití staví neživou entitu mezi toho, kdo rozhoduje, a toho, koho se
rozhodnutí týká. V organizacích slouží k odvrácení námitek („to nejsem já, to chce
vedení“, „proces to vyžaduje“), v blízkých vztazích k odosobnění kontroly („náš vztah
potřebuje, abys…“), v uzavřených skupinách k připsání pokynů nadosobní autoritě. V
Milton-modelu se navíc používá záměrně k vytvoření významové nejasnosti, kterou si
posluchač vyplní sám, a tím k oslabení kritického posouzení sdělení (Bandler a Grinder
1975b). Tosey a Mathison upozorňují, že tentýž jazykový prostředek může sloužit
vyjasnění i zamlžení a že hodnocení závisí na účelu a kontextu (Tosey a Mathison 2009).

## Stav důkazů

Lingvistický pojem selekčních omezení je dobře zakotven v teorii syntaxe a sémantiky
(Chomsky 1965) a význam personifikace pro lidské myšlení je podrobně popsán v kognitivní
lingvistice (Lakoff a Johnson 1980). Empiricky neověřena však zůstávají tvrzení NLP, že
porušení selekčních omezení má specifický hypnotický nebo terapeutický účinek, nebo že
otázky meta-modelu na tuto kategorii mají vlastní terapeutický přínos. Kritické přehledy
výzkumu NLP konstatují, že ověřitelná tvrzení oboru většinou podporu nenašla a že kvalitních
studií je málo (Witkowski 2010; Passmore a Rowson 2019). Výzkum hypnózy navíc zdůrazňuje
roli očekávání, postojů a motivace účastníka v reakci na sugesci (Kirsch a Lynn 1995), což
oslabuje představu, že by rozhodující byla určitá jazyková formule. Pro čtenáře plyne rozlišení: rozpoznat
personifikaci, která zakrývá odpovědnost, je užitečná analytická dovednost; tvrzení o
zvláštní síle takových vět nemá empirickou oporu.

## Obrana a zotavení

Základní obranou je vrátit do věty činitele. Na výrok „systém to nepovolí“ lze odpovědět
otázkou, kdo konkrétně o věci rozhodl, podle jakého pravidla a na koho se lze obrátit s
odvoláním. V institucionálním prostředí pomáhá žádat písemné odůvodnění s uvedením
odpovědné osoby. Druhou obranou je rozlišovat obraz a tvrzení: metafora, která pomáhá
popsat prožitek, nepotřebuje zpochybnění, kdežto personifikace, která brání v kladení
otázek, ano. Třetí obranou je pozornost k nadosobním autoritám v uzavřených skupinách:
pokud se pokyny konkrétního člověka prezentují jako vůle vesmíru, energie nebo osudu, je
legitimní ptát se, kdo tento výklad podává a z čeho vychází (Hassan 1988). Při zotavení po
odchodu z prostředí, ve kterém byla rozhodnutí připisována neosobním silám, pomáhá
postupná obnova vědomí, že za každým rozhodnutím stál člověk, s nímž bylo možné, alespoň
v principu, nesouhlasit. To otevírá cestu ke zpracování vztahu k těm, kdo skutečně
rozhodovali, místo k abstrakcím, se kterými se vyrovnat nelze (Herman 1992).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kirsch, I., & Lynn, S. J. (1995). The altered state of hypnosis: Changes in the theoretical landscape. *American Psychologist*, 50(10), 846–858.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Meta-model](@/kompendium/nlp-vzorce/meta-model/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Hluboká a povrchová struktura](@/kompendium/nlp-vzorce/zakladni-pojmy/hluboka-a-povrchova-struktura.md) – příbuzný vzorec (Základní pojmy NLP, Deep and surface structure)
- [Nominalizace](@/kompendium/nlp-vzorce/meta-model/nominalizace.md) – příbuzný vzorec (Meta-model, Nominalisation)
- [Nespecifikovaný referenční index](@/kompendium/nlp-vzorce/meta-model/nespecifikovany-referencni-index.md) – příbuzný vzorec (Meta-model, Unspecified referential index)
- [Ztracený performativ](@/kompendium/nlp-vzorce/meta-model/ztraceny-performativ.md) – příbuzný vzorec (Meta-model, Lost performative)
- [Porušení selekčních omezení v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/poruseni-selekcnich-omezeni.md) – příbuzný vzorec (Milton-model, Selectional restriction violation (Milton Model))

**V kompendiu**

- [EA-5.1.6 Kategorická transgrese](@/kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Meta-model jako výslechový nástroj](@/kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md) – předchozí vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
