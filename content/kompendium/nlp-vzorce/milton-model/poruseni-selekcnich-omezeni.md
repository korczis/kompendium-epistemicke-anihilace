+++
title = "Porušení selekčních omezení v Milton-modelu"
description = "Věta, která věcem, zvířatům nebo abstrakcím připisuje lidské vlastnosti: jak Milton-model využívá sémantickou anomálii a kdy jde o metaforu a kdy o vliv."
weight = 10
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-milton-model", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Porušení selekčních omezení v Milton-modelu", "Selectional restriction violation (Milton Model)", "sémantická anomálie", "Milton-model", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-04.10"
catalog_slug = "poruseni-selekcnich-omezeni"
catalog_family = "milton-model"
catalog_family_code = "04"
catalog_family_title = "Milton-model"
catalog_family_en = "Milton Model"
catalog_part = "milton-model"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Selectional restriction violation (Milton Model)"
catalog_aliases = ["sémantická anomálie"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = "milton-model"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["milton-model"]
catalog_related = ["poruseni-selekcnich-omezeni-meta", "citace", "konfuzni-technika", "terapeuticka-metafora"]
catalog_related_declared = ["poruseni-selekcnich-omezeni-meta", "citace", "konfuzni-technika", "terapeuticka-metafora"]
catalog_kompendium = ["kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md", "kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/meta-model/poruseni-selekcnich-omezeni-meta.md", "kompendium/nlp-vzorce/zakladni-pojmy/stav.md", "kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md", "kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md"]
catalog_prev = "citace"
catalog_next = "fonologicka-dvojznacnost"
catalog_position = 10
catalog_family_size = 30
catalog_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "bandler-grinder-1982", "beck-1976", "chomsky-1965", "hassan-1988", "herman-1992", "lakoff-johnson-1980", "lifton-1961", "norcross-2006", "roderique-davies-2009", "rosen-1982", "sharpley-1987", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b", "bandler-grinder-1982"]
catalog_sources_roots = ["chomsky-1965", "rosen-1982"]
catalog_sources_critical = ["beck-1976", "hassan-1988", "herman-1992", "lakoff-johnson-1980", "lifton-1961", "norcross-2006", "roderique-davies-2009", "sharpley-1987", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/milton-model.toml"
+++

# Porušení selekčních omezení v Milton-modelu

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-04.10` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Selectional restriction violation (Milton Model) |
| **Jiné názvy** | sémantická anomálie |
| **Obecnější heslo** | [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | nízké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Porušení selekčních omezení je v Milton-modelu věta, ve které je slovesu nebo přídavnému
jménu přiřazen podmět či předmět, se kterým se v běžném jazyce nespojuje, protože ho
významově „nevybírá“. Typicky jde o připisování vnímání, citu, záměru nebo řeči neživým
předmětům, rostlinám, zvířatům, částem těla nebo abstrakcím. Posluchač podle autorů NLP
takovou větu nemůže přijmout doslovně, a proto ji musí nějak smysluplně vyložit; nejsnáze tak,
že ji vztáhne na sebe a na vlastní prožitek (Bandler a Grinder 1975b). Výsledkem je sdělení,
které mluvčí nikdy nevyslovil přímo, ale které posluchač sám vyvodí. V meta-modelu se tentýž
jev chápe opačně, jako místo, kde se řeč vzdálila zkušenosti a je třeba se doptat, co
konkrétně znamená; tuto stránku popisuje heslo
[porušení selekčních omezení v meta-modelu](@/kompendium/nlp-vzorce/meta-model/poruseni-selekcnich-omezeni-meta.md).
Pro kompendium je vzorec převážně málo rizikový, protože se blíží běžné metafoře. Riziko
vzniká tam, kde se jím abstraktní vnitřní stavy, například pochybnosti nebo kritické
myšlení, proměňují v cizí bytosti, se kterými lze zacházet jako s vetřelci.

## Původ a souvislosti

Pojem selekčních omezení pochází z generativní lingvistiky. Chomsky v polovině šedesátých let
popsal, že slovesa a další predikáty kladou na svá doplnění významové podmínky, například že
sloveso vnímání vyžaduje podmět schopný vnímat, a že věty, které tyto podmínky porušují, jsou
gramaticky správné, ale významově anomální (Chomsky 1965). Bandler a Grinder z tohoto
lingvistického rámce vycházeli už v popisu meta-modelu (Bandler a Grinder 1975) a při rozboru
Ericksonova jazyka zjistili, že Erickson podobné anomálie užíval záměrně, například ve
vyprávění o rostlinách nebo zvířatech, kterým se připisoval cit nebo vědění (Bandler a
Grinder 1975b).
Ericksonova práce s příběhy a metaforami je dokumentována i v nezávislých sbírkách jeho
vyprávění, kde se přírodní a předmětné obrazy objevují jako nosiče nového pohledu na
klientovu situaci (Rosen 1982). Kognitivní lingvistika pozdější doby ukázala, že
připisování lidských vlastností neživému, tedy personifikace, je jedním ze základních
způsobů, kterými lidé abstraktní zkušenost pojmově uchopují (Lakoff a Johnson 1980). Vzorec
tedy stojí na obecné vlastnosti lidského myšlení, ne na zvláštní hypnotické technice.

## Struktura vzorce

Strukturu vzorce tvoří tři prvky. Prvním je predikát, který vyžaduje určitou kategorii
podmětu, například vnímající, cítící nebo jednající bytost. Druhým je podmět, který do této
kategorie nepatří: předmět, abstrakce, část těla, příznak nebo [vnitřní stav](@/kompendium/nlp-vzorce/zakladni-pojmy/stav.md). Třetím je
výkladová práce posluchače, který anomálii vyřeší tím, že jí přiřadí smysl, nejčastěji
metaforický nebo osobní. Z hlediska vlivu je podstatné, že smysl si posluchač vytváří sám, a
proto ho prožívá jako vlastní myšlenku. Mluvčí tak může zprostředkovat sdělení o
posluchačově citu nebo záměru, aniž by ho vyslovil.

Zvláštní význam má varianta, ve které se lidské vlastnosti připisují posluchačovým
vlastním vnitřním stavům: příznak „chce“ něco sdělit, část osobnosti „ví“, co je správné,
pochybnost „se snaží chránit“. Tato varianta je blízká práci s částmi, kterou NLP rozvinulo v
reframingu (Bandler a Grinder 1982), a v terapeutickém rámci může klientovi pomoci k odstupu
od obtížného stavu. Zároveň však mění vztah člověka k vlastní mysli: z myšlenky, kterou má a
za kterou odpovídá, se stává bytost, která v něm jedná. Kdo tuto bytost pojmenuje a vyloží
její „záměr“, získává moc nad tím, jak člověk svůj vnitřní stav chápe. Tato moc je v
terapii vyvážena souhlasem a cílem klienta; mimo terapii nic takového ji nevyvažuje.

## Detekční znaky

Porušení selekčních omezení se pozná podle vět, ve kterých věci, abstrakce nebo vnitřní
stavy vnímají, cítí, chtějí, vědí nebo mluví. Samo o sobě to nic neznamená, protože běžná řeč
je takových metafor plná. Varovným znakem je teprve užití v situaci vlivu a obsah, který
anomálie nese. Pozorovatel by si měl všímat zejména toho, kdy se lidské vlastnosti
připisují posluchačovým pochybnostem, námitkám, strachu nebo kritickému myšlení, a kdy
mluvčí tyto „bytosti“ hodnotí, propouští, uklidňuje nebo umlčuje. Kompendium popisuje
příbuzné narušení pojmových hranic u
[kategorické transgrese](@/kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md), kde se
smazávají rozdíly mezi kategoriemi, aby se oslabila schopnost usuzovat. Dalším znakem je
hromadění anomálií spolu s dalšími vzorci neurčitosti, takže posluchač ztrácí jistotu, co
bylo řečeno doslovně a co obrazně; tento souběh se blíží
[pasti epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md).
Ve skupinách s uzavřeným jazykem bývá znakem i ustálená mluva o vnitřních stavech jako o
cizích silách, kterou Lifton popsal jako součást ovládání jazyka (Lifton 1961).

## Legitimní a manipulativní užití

Metafora a personifikace jsou legitimní a hodnotné prostředky řeči. Průvodce, který o
starém domě řekne, že vypráví příběh vesnice, básník, dětský příběh nebo terapeut, který
klientovi nabídne obraz, jímž může svou zkušenost uchopit, užívají sémantickou anomálii
otevřeně a posluchač ji chápe jako obraz. V terapii mohou personifikace pomoci k odstupu od
příznaku a k jeho prozkoumání; i kognitivní terapie pracuje s tím, že klient se učí na své
automatické myšlenky dívat jako na události mysli, ne jako na fakta (Beck 1976). Rozdíl je v
tom, kdo vykládá a k čemu.

Manipulativní užití využívá anomálii k tomu, aby mluvčí vyložil vnitřní stav posluchače za
něj a ve svém zájmu. Pochybnosti, které „tě jen chtějí chránit, ale už mohou odejít“, se tak
ze signálu, který si zaslouží pozornost, mění v překážku, kterou je třeba propustit. Hassan
popisuje, že destruktivní skupiny učí členy vnímat pochybnosti jako vnější vlivy nebo
projevy slabosti a potlačovat je, a označuje to za jeden z mechanismů kontroly myšlení
(Hassan 1988). Porušení selekčních omezení je jazykovým prostředkem, kterým se taková
proměna dá provést nenápadně, ve vlídném a obrazném tónu.

## Stav důkazů

Lingvistická existence selekčních omezení a pojmová povaha metafory jsou dobře doloženy
(Chomsky 1965; Lakoff a Johnson 1980). Specifické tvrzení NLP, že anomální věta posluchače
nutí vztáhnout sdělení na sebe a obchází vědomé zpracování, však empiricky ověřeno nebylo.
Přehledy výzkumu NLP konstatují obecný nedostatek dokladů pro jeho specifická tvrzení a
upozorňují, že řada z nich je formulována tak, že je obtížné je testovat (Sharpley 1987;
Witkowski 2010). Pro čtenáře z toho plyne, že je třeba oddělovat popis jazykového jevu,
který je správný, od tvrzení o jeho účinku, které doložené není. Hodnocení oboru jako celku vyznívá kriticky i v novějších přehledech, které
ho řadí k pseudovědeckým nebo neprokázaným přístupům (Roderique-Davies 2009; Norcross,
Koocher a Garofalo 2006). Rozumný závěr tedy zní, že porušení selekčních omezení působí tak,
jak působí každá metafora: zaměřuje pozornost, nabízí výklad a vyvolává emoční odezvu.
Zvláštní hypnotická účinnost, kterou mu připisují kurzy NLP, doložena není.

## Obrana a zotavení

Obranou je vrátit anomální větě doslovný smysl a zeptat se, co znamená. Pokud mluvčí
mluví o pochybnostech jako o bytosti, je legitimní pojmenovat, o čem konkrétně
pochybujete, a trvat na věcné odpovědi na obsah pochybnosti. Tím se z obrazu, se kterým
může mluvčí zacházet podle své vůle, stává tvrzení, které je třeba posoudit. Druhou obranou
je ponechat si výklad vlastních vnitřních stavů: co strach, námitka nebo nejistota znamená,
může posoudit člověk, který je prožívá, případně s pomocí odborníka, kterému důvěřuje, ne
mluvčí, který na výkladu něco získává. Pro lidi, kteří prošli prostředím, kde se jejich
pochybnosti soustavně personifikovaly a „propouštěly“, je součástí zotavení obnova důvěry v
pochybnost jako v legitimní nástroj poznání. Herman popisuje, že zotavení po traumatu
ovládání zahrnuje znovunabytí kontroly nad vlastním myšlením a prožíváním v bezpečném
vztahu (Herman 1992). Klinik by měl s takovým klientem pracovat tak, aby výklad jeho
vnitřních stavů zůstával jeho vlastní, a vyhnout se tomu, aby jeden autoritativní výklad
nahradil jiným.

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Bandler, R., & Grinder, J. (1982). *Reframing: Neuro-Linguistic Programming and the Transformation of Meaning*. Moab: Real People Press.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Norcross, J. C., Koocher, G. P., & Garofalo, A. (2006). Discredited psychological treatments and tests: A Delphi poll. *Professional Psychology: Research and Practice*, 37(5), 515–522.
- Roderique-Davies, G. (2009). Neuro-linguistic programming: Cargo cult psychology? *Journal of Applied Research in Higher Education*, 1(2), 58–63.
- Rosen, S. (Ed.) (1982). *My Voice Will Go with You: The Teaching Tales of Milton H. Erickson*. New York: W. W. Norton.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Milton-model](@/kompendium/nlp-vzorce/milton-model/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Milton-model](@/kompendium/nlp-vzorce/milton-model/milton-model.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Porušení selekčních omezení](@/kompendium/nlp-vzorce/meta-model/poruseni-selekcnich-omezeni-meta.md) – příbuzné heslo (Meta-model, Selectional restriction violation (Meta Model))
- [Citace](@/kompendium/nlp-vzorce/milton-model/citace.md) – příbuzné heslo (Milton-model, Quotes)
- [Konfuzní technika](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/konfuzni-technika.md) – příbuzné heslo (Ericksonovská hypnóza, Confusion technique)
- [Terapeutická metafora](@/kompendium/nlp-vzorce/jazykove-vzorce/terapeuticka-metafora.md) – příbuzné heslo (Jazykové vzorce, Therapeutic metaphor)

**V kompendiu**

- [EA-5.1.6 Kategorická transgrese](@/kompendium/techniques/ea-5-1-6-kategoricka-transgrese.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.4.24 Past epistemické vágnosti](@/kompendium/techniques/ea-5-4-24-epistemic-vagueness-trap.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Citace](@/kompendium/nlp-vzorce/milton-model/citace.md) – předchozí heslo rodiny
- [Fonologická dvojznačnost](@/kompendium/nlp-vzorce/milton-model/fonologicka-dvojznacnost.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
