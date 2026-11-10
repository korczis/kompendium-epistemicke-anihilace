+++
title = "Citace"
description = "Sdělení vložené do úst někoho jiného: jak vzorec citace v Milton-modelu přesouvá odpovědnost za požadavek a jak rozpoznat, komu citát ve skutečnosti míří."
weight = 9
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
parent = "kompendium-nlp-vzorce-milton-model"
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Citace", "Quotes", "vzorec citace", "vložená citace", "Milton-model", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-04.09"
nlp_slug = "citace"
nlp_family = "milton-model"
nlp_family_code = "04"
nlp_family_title = "Milton-model"
nlp_family_en = "Milton Model"
nlp_part = "milton-model"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Quotes"
nlp_aliases = ["vzorec citace", "vložená citace"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "milton-model"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["milton-model"]
nlp_related = ["vlozene-prikazy", "analogove-znaceni", "poruseni-selekcnich-omezeni", "ztraceny-performativ-milton", "nespecifikovany-index-milton", "muj-pritel-john", "vrstveni-realit", "terapeuticka-metafora"]
nlp_related_declared = ["muj-pritel-john", "vlozene-prikazy", "analogove-znaceni", "ztraceny-performativ-milton", "terapeuticka-metafora"]
nlp_kompendium = ["kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/milton-model/analogove-znaceni.md", "kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md", "kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md", "kompendium/techniques/ea-6-4-2-post-cult-protokol.md"]
nlp_prev = "ano-sada"
nlp_next = "poruseni-selekcnich-omezeni"
nlp_position = 9
nlp_family_size = 30
nlp_sources = ["bandler-grinder-1975b", "cialdini-2009", "grinder-delozier-bandler-1977", "haley-1973", "hassan-1988", "heap-1988", "herman-1992", "lakoff-johnson-1980", "levinson-1983", "lifton-1961", "passmore-rowson-2019", "petty-cacioppo-1986", "rosen-1982", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975b", "grinder-delozier-bandler-1977"]
nlp_sources_roots = ["haley-1973", "levinson-1983", "rosen-1982"]
nlp_sources_critical = ["cialdini-2009", "hassan-1988", "heap-1988", "herman-1992", "lakoff-johnson-1980", "lifton-1961", "passmore-rowson-2019", "petty-cacioppo-1986", "witkowski-2010"]
nlp_citations = 16
nlp_words = 1193
nlp_reading_minutes = 6
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/milton-model.toml"
+++

# Citace

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.09` |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Quotes |
| **Jiné názvy** | vzorec citace, vložená citace |
| **Obecnější vzorec** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Vzorec citace je v Milton-modelu způsob, jak předat sdělení posluchači tak, že ho mluvčí
vloží do přímé nebo nepřímé řeči jiné osoby. Mluvčí vypráví, co komu kdo řekl, a uvnitř
citované řeči zazní výzva, hodnocení nebo otázka, která ve skutečnosti míří na posluchače.
Podle autorů NLP posluchač zpracovává citát jako součást vyprávění, a proto ho nevnímá jako
požadavek, který by mohl odmítnout, a mluvčí za obsah formálně neodpovídá, protože jen
reprodukuje cizí slova (Bandler a Grinder 1975b). Vzorec úzce souvisí s
[vloženými příkazy](@/kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md), protože citát
je jedním z nejčastějších obalů skrytého pokynu, a s
[analogovým značením](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md), které může
vyznačit, že citovaná slova patří posluchači. V ericksonovské tradici se s ním pojí i
vyprávění o anonymních postavách, které nese sugesce v podobě příběhu. Pro kompendium je
podstatné, že citace rozpojuje autora sdělení a jeho mluvčího, a tím rozostřuje odpovědnost
za to, co bylo řečeno.

## Původ a souvislosti

Erickson byl znám tím, že klientům vyprávěl příběhy ze svého života a z praxe, často s
postavami, které klientovi v něčem připomínaly jeho situaci. Sbírka takových příběhů, kterou
uspořádal Sidney Rosen, ukazuje, jak Erickson užíval vyprávění k tomu, aby klientovi nabídl
nový pohled, aniž by mu ho vnucoval (Rosen 1982). Haley ve svém popisu Ericksonovy práce
zdůrazňuje, že nepřímé sdělení přes příběh nebo cizí postavu umožňovalo klientovi přijmout
změnu bez pocitu, že podléhá terapeutovi (Haley 1973). Bandler a Grinder z této praxe
vyabstrahovali jazykovou formu: citát, ve kterém sdělení pronáší někdo jiný, a zařadili ji
do Milton-modelu (Bandler a Grinder 1975b; Grinder, DeLozier a Bandler 1977). Vzorec má
oporu v obecných vlastnostech jazyka. Přímá řeč je v každém vyprávění běžná a posluchač
při ní automaticky přepíná mezi hlasem vypravěče a hlasem postavy; tento přechod však není
vždy jednoznačný, a právě na této nejednoznačnosti vzorec staví.

## Struktura vzorce

Struktura citace má tři vrstvy. První je rámec vyprávění: mluvčí uvádí, že něco slyšel, že
mu kdosi řekl, nebo že nějaká postava něco pronesla. Druhá je citovaný obsah, který má
gramatickou podobu oslovení, výzvy nebo hodnocení. Třetí je adresát: v doslovném smyslu
patří citát postavě z vyprávění, ale ve skutečnosti míří na toho, kdo poslouchá. Z hlediska
pragmatiky jde o záměrné využití víceznačnosti deiktických prostředků, tedy slov jako „ty“,
„teď“ a „tady“, jejichž odkaz se určuje podle toho, kdo mluví a ke komu (Levinson 1983). Kdo
uprostřed vyprávění zaslechne citát s oslovením „ty“, může ho vztáhnout na sebe, zvlášť když
mluvčí v tu chvíli změní hlas nebo se na něj podívá.

Citace navíc přesouvá autoritu. Citát může pocházet od učitele, mistra, uznávaného
odborníka, zesnulého předka nebo neurčité postavy, jejíž autoritu posluchač nemůže ověřit.
Mluvčí si autoritu citované osoby vypůjčuje, a přitom nemusí ručit za to, zda dotyčná osoba
citovaný výrok skutečně pronesla. Tím se vzorec blíží jevu, který NLP v meta-modelu nazývá
ztraceným performativem, tedy hodnocení bez uvedeného původce, a který Milton-model naopak
využívá. Vzniká sdělení, za které nikdo neodpovídá: mluvčí jen cituje, citovaná osoba
nemluví k posluchači a posluchač má sdělení přijmout jako obecnou moudrost.

## Detekční znaky

Citaci poznáme podle uvozovacích obratů a přímé řeči uprostřed rozhovoru, který se
vyprávěním nezabývá. Varovným znakem je, když citovaná řeč obsahuje výzvu nebo hodnocení,
které se nápadně hodí na posluchače a jeho situaci, a když mluvčí citát pronáší jiným hlasem,
s pohledem upřeným na posluchače nebo s pauzou. Dalším znakem je neověřitelnost: citované
osoby jsou anonymní, vzdálené nebo nedostupné, a citát nelze dohledat. Třetím znakem je, že
mluvčí po citátu nepřevezme odpovědnost za jeho obsah, a když se ho posluchač zeptá, zda
totéž požaduje on, ustoupí do role pouhého vypravěče. Ve skupinách s autoritativním
vedením se citáty zakladatele nebo „mistra“ užívají jako nezpochybnitelné argumenty,
kterými se ukončuje diskuse; kompendium tuto dynamiku popisuje u
[vzorce guru a adepta](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md). V širším
veřejném prostoru se citace anonymních „odborníků“ nebo „lidí, kteří to zažili“ užívají k
vytváření dojmu shody, který neodpovídá skutečnosti, což kompendium sleduje u
[vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md).
Lifton upozornil, že uzavřené systémy přisuzují výrokům vůdce posvátnou platnost, která je
staví mimo kritiku (Lifton 1961).

## Legitimní a manipulativní užití

Citace a vyprávění patří k nejstarším nástrojům výuky a péče. Učitel, který uvede výrok
uznávaného autora, nebo poradkyně, která připomene přísloví a hned dodá, co z něj podle ní
plyne, užívají citát otevřeně: je zřejmé, kdo radí, a rada se dá přijmout i odmítnout.
Terapeutické příběhy mohou klientovi pomoci podívat se na vlastní situaci z odstupu a
kognitivní lingvistika ukazuje, že příběhy a metafory strukturují porozumění tím, že
zvýrazňují některé stránky zkušenosti (Lakoff a Johnson 1980). Legitimní užití se pozná podle
toho, že mluvčí za sdělení ručí, že citát je přiznanou ilustrací a že posluchač ví, že
poslouchá příběh, a může si z něj vzít, co sám chce.

Manipulativní užití využívá citát k tomu, aby posluchači předalo požadavek, který by v
přímé podobě odmítl. Typickými obsahy jsou výzvy k důvěře, k odložení pochybností, k
odevzdání rozhodnutí nebo k přijetí oběti, které ve vlastních ústech mluvčího zní jako
nárok, kdežto v ústech moudrého učitele z vyprávění znějí jako rada. Hassan popisuje, že v
destruktivních skupinách se jazyk vedení přebírá a opakuje tak, že členové postupně myslí
jeho výrazy a přestávají rozlišovat, co je jejich vlastní úsudek (Hassan 1988). Citát je v
takovém prostředí nástrojem, který doktrínu převádí do osobní roviny, aniž by ji kdo
výslovně vyslovil jako požadavek.

## Stav důkazů

Pro specifické tvrzení NLP, že citované sdělení obchází vědomé zpracování a působí jako
přímý pokyn, neexistují kontrolované doklady a přehledy výzkumu NLP jeho jazykové vzorce
obecně nepotvrzují (Heap 1988; Witkowski 2010; Passmore a Rowson 2019). Ericksonova práce s
příběhy je doložena kazuistikami, ne srovnávacím výzkumem, a o jejím účinku proto nelze říct
víc, než že klinici ji popisují jako užitečnou (Rosen 1982). Obecný výzkum vlivu přitom
dokládá, že autorita zdroje zvyšuje přesvědčivost sdělení a že lidé při nízké pozornosti
posuzují sdělení spíše podle zdroje než podle obsahu (Petty a Cacioppo 1986; Cialdini 2009).
Citace tak může působit tím, že si vypůjčuje autoritu, a tím, že rozostřuje odpovědnost
mluvčího. To jsou mechanismy dobře známé sociální psychologii; jejich hypnotická
nadstavba, se kterou NLP pracuje, doložena není.

## Obrana a zotavení

Účinná obrana stojí na otázce, komu citát míří a kdo za něj ručí. Kdo si všimne, že
citovaná výzva se hodí na něj, může se zeptat mluvčího, zda totéž požaduje on sám, a
posoudit ji jako jeho požadavek. Tím se rozpojená odpovědnost vrací tomu, kdo mluví. Druhou
obranou je ověřování: citát anonymní nebo nedosažitelné autority nemá vyšší váhu než
tvrzení mluvčího, a citát skutečné autority se dá dohledat v kontextu, ve kterém zazněl.
Třetí obranou je rozlišovat příběh a požadavek, tedy brát vyprávění jako nabídku pohledu,
ze které si posluchač vezme jen to, co sám uzná za správné. Pro lidi, kteří odešli ze
skupiny, kde citáty vedení sloužily jako nezpochybnitelné pravdy, je součástí zotavení
oddělit vlastní hlas od převzatých výroků, což kompendium popisuje v rámci
[post-cult protokolu](@/kompendium/techniques/ea-6-4-2-post-cult-protokol.md). Herman
zdůrazňuje, že obnova vlastního úsudku a vlastního vyprávění o prožitém je jádrem zotavení
po zkušenosti ovládání (Herman 1992). Klinik v takové práci nepotřebuje citáty vyvracet
jeden po druhém. Užitečnější je pomoci klientovi všimnout si, kdy v jeho myšlení mluví cizí
hlas, odkud pochází a co po něm požaduje, a znovu se ptát, co si o téže věci myslí on sám.
Teprve s tímto rozlišením se převzaté výroky mění z vnitřních příkazů na názory jiných lidí,
se kterými lze souhlasit nebo nesouhlasit.

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Grinder, J., DeLozier, J., & Bandler, R. (1977). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 2*. Cupertino: Meta Publications.
- Haley, J. (1973). *Uncommon Therapy: The Psychiatric Techniques of Milton H. Erickson, M.D.* New York: W. W. Norton.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Petty, R. E., & Cacioppo, J. T. (1986). *Communication and Persuasion: Central and Peripheral Routes to Attitude Change*. New York: Springer.
- Rosen, S. (Ed.) (1982). *My Voice Will Go with You: The Teaching Tales of Milton H. Erickson*. New York: W. W. Norton.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Vložené příkazy](@/kompendium/nlp-vzorce/milton-model/vlozene-prikazy.md) – příbuzný vzorec (Milton-model, Embedded commands)
- [Analogové značení](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md) – příbuzný vzorec (Milton-model, Analogue marking)
- [Porušení selekčních omezení v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/poruseni-selekcnich-omezeni.md) – příbuzný vzorec (Milton-model, Selectional restriction violation (Milton Model))
- [Ztracený performativ v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/ztraceny-performativ-milton.md) – příbuzný vzorec (Milton-model, Lost performative (Milton Model))
- [Nespecifikovaný referenční index v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/nespecifikovany-index-milton.md) – příbuzný vzorec (Milton-model, Unspecified referential index (Milton Model))
- [Můj přítel John](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/muj-pritel-john.md) – příbuzný vzorec (Ericksonovská hypnóza, My friend John)
- [Vrstvení realit](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/vrstveni-realit.md) – příbuzný vzorec (Ericksonovská hypnóza, Stacking realities)
- [Terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) – příbuzný vzorec (Jazykové vzorce, Therapeutic metaphor)

**V kompendiu**

- [EA-1.6.1 Vzorec guru a adept](@/kompendium/techniques/ea-1-6-1-vzorec-guru-a-adept.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-2.1.9 Vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Řada souhlasů](@/kompendium/nlp-vzorce/milton-model/ano-sada.md) – předchozí vzorec rodiny
- [Porušení selekčních omezení v Milton-modelu](@/kompendium/nlp-vzorce/milton-model/poruseni-selekcnich-omezeni.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
