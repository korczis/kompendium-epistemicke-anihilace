+++
title = "Protipříklad"
description = "Vzorec Sleight of Mouth, který proti přesvědčení staví výjimku: kdy oslabuje přehnané zobecnění a kdy jediná výjimka popírá opakovanou zkušenost."
weight = 8
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-sleight-of-mouth", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Protipříklad", "Counter-example", "výjimka z pravidla", "Sleight of Mouth", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-07.08"
catalog_slug = "som-protipriklad"
catalog_family = "sleight-of-mouth"
catalog_family_code = "07"
catalog_family_title = "Sleight of Mouth"
catalog_family_en = "Sleight of Mouth"
catalog_part = "sleight-of-mouth"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Counter-example"
catalog_aliases = ["výjimka z pravidla"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "sleight-of-mouth"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["sleight-of-mouth"]
catalog_related = ["formalni-klam", "zadny-pravy-skot", "zobecnovani", "univerzalni-kvantifikator", "som-dusledek", "som-zobecneni", "som-analogie", "som-aplikace-na-sebe", "limitujici-presvedceni"]
catalog_related_declared = ["univerzalni-kvantifikator", "zobecnovani", "som-dusledek", "som-zobecneni", "limitujici-presvedceni"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-1-selektivni-expozice.md", "kompendium/techniques/ea-6-2-1-trauma-focused-cbt-protokol.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-dusledek.md", "kompendium/techniques/ea-1-1-1-selektivni-expozice.md"]
catalog_prev = "som-zobecneni"
catalog_next = "som-analogie"
catalog_position = 8
catalog_family_size = 16
catalog_sources = ["bandler-grinder-1975", "beck-1976", "dilts-1999", "ellis-1962", "gilovich-1991", "herman-1992", "sharpley-1987", "tversky-kahneman-1974", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "dilts-1999"]
catalog_sources_roots = []
catalog_sources_critical = ["beck-1976", "ellis-1962", "gilovich-1991", "herman-1992", "sharpley-1987", "tversky-kahneman-1974", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/sleight-of-mouth.toml"
+++

# Protipříklad

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-07.08` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Counter-example |
| **Jiné názvy** | výjimka z pravidla |
| **Obecnější heslo** | [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/sleight-of-mouth.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Protipříklad je vzorec souboru Sleight of Mouth, při kterém se proti přesvědčení postaví
případ, ve kterém spojení vyjádřené přesvědčením neplatí. Proti přesvědčení „kdo jednou
selže, už to nedokáže“ se postaví člověk, který napoprvé selhal a později uspěl; proti
přesvědčení „nikdy nic nedokončím“ věc, kterou člověk dokončil. Dilts vzorec popisuje jako
hledání výjimky, která zpochybní obecnost pravidla a otevře otázku, za jakých podmínek
přesvědčení platí a za jakých ne (Dilts 1999). Vzorec stojí na logice, podle které
jediný doložený případ vyvrací tvrzení vyslovené jako absolutní, a v této podobě je to
legitimní nástroj kritického myšlení. Pro kompendium je důležitý proto, že se stejně snadno
obrací proti zkušenosti, která pravidlo nemá, ale má podobu opakovaného vzorce: jediná
příjemná výjimka se pak staví proti dlouhé řadě ublížení a má je celé vyvrátit.

## Původ a souvislosti

Hledání výjimky je v NLP součástí meta-modelu. Výroky s univerzálními kvantifikátory,
například „nikdy“, „vždy“ nebo „nikdo“, [meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) zpochybňuje otázkou, zda se opravdu nikdy
nestalo nic jiného, a vede tím mluvčího k tomu, aby si vybavil zkušenosti, které jeho
zobecnění odporují (Bandler a Grinder 1975); katalog tento typ výroků rozebírá na stránce o
[univerzálním kvantifikátoru](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md).
V Sleight of Mouth se hledání výjimky uplatňuje i na přesvědčení, která nemají výslovný
kvantifikátor, ale skrytě tvrdí obecné pravidlo (Dilts 1999). Mimo NLP je hledání výjimek
ústředním postupem kognitivní terapie, ve které terapeut s klientem zkoumá doklady pro
automatickou myšlenku i proti ní a absolutní soudy porovnává s klientovou skutečnou
zkušeností (Beck 1976). Ellis podobně zpochybňoval absolutní požadavky, které lidé kladou
na sebe a na svět, a ukazoval, že jejich přísnost neodpovídá zkušenosti (Ellis 1962).
Protipříklad tedy patří k obecnému repertoáru kritického myšlení a NLP mu dalo jen
konverzační podobu a místo v souboru.

## Struktura vzorce

Vzorec má tři části. První je přesvědčení, které tvrdí obecné spojení, ať výslovně, nebo
skrytě. Druhou je případ, ve kterém je jeden prvek přítomen a druhý chybí, nebo ve kterém
nastal opak. Třetí je otázka nebo tvrzení, které případ staví proti přesvědčení a nechává
na posluchači, aby rozpor vyřešil (Dilts 1999). Z hlediska struktury přesvědčení vzorec
pracuje se spojením mezi prvky: nepopírá ani jeden z nich, ale ukazuje, že spojení není
nutné. Síla vzorce proto závisí na tom, jaké tvrzení přesvědčení skutečně vyslovuje. Proti
tvrzení absolutnímu stačí jediná výjimka. Proti tvrzení o četnosti, o sklonu nebo o
opakování nestačí, protože takové tvrzení výjimky připouští.

Tento rozdíl je pro pozorovatele rozhodující. Výpověď „pořád na mě křičí“ neznamená v
běžné řeči, že křik nikdy nevynechal, ale že se opakuje natolik, že tvoří vzorec.
Protipříklad, který proti ní postaví jeden klidný večer, zachází s výpovědí o četnosti, jako
by šlo o absolutní tvrzení, a výjimkou pak „vyvrací“ něco, co nebylo řečeno. Výzkum úsudku
ukazuje, že snadno vybavitelné příklady ovlivňují odhady četnosti a pravděpodobnosti
(Tversky a Kahneman 1974). Gilovich popsal, jak lidé nadhodnocují doklady, které potvrzují
to, co očekávají nebo si přejí, a jak snadno přehlížejí doklady ostatní (Gilovich 1991). Protipříklad této
vlastnosti úsudku využívá, ať záměrně, nebo ne.

Stejná záměna se objevuje i mimo blízké vztahy, kdykoli se jediný případ staví proti
poznatku o pravděpodobnosti. Věta „můj děda kouřil celý život a dožil se devadesáti“ je
protipříkladem k tvrzení, které nikdo nevyslovil, totiž že kouření zabíjí každého.
Skutečné tvrzení se týká rizika v populaci a jediný případ ho nevyvrací, ale v rozhovoru
působí názorněji než jakákoli statistika: živý a osobně známý případ se vybavuje snáz než
číslo a dostupnost příkladů ovlivňuje odhad pravděpodobnosti (Tversky a Kahneman 1974). V reklamě, v prodeji léčebných metod a v
argumentaci proti odborným doporučením se takové protipříklady používají často, protože
nevyžadují žádnou znalost dat. Pro pozorovatele je proto užitečné u každého protipříkladu
zjistit, zda výchozí tvrzení bylo absolutní, nebo jen pravděpodobnostní, a zda výjimka
pochází z reprezentativního souboru, nebo byla vybrána proto, že se hodí.

## Detekční znaky

Manipulativní protipříklad se pozná podle toho, že výjimka se staví proti opakované
zkušenosti a má ji celou zneplatnit: „a co loni na Vánoce, kdy byl milý?“. Typické je, že
výjimka je jediná, citově výrazná a dávno minulá, kdežto zkušenost, kterou má vyvrátit, je
četná a současná. Dalším znakem je vybírání: z mnoha událostí se připomíná jen ta, která se
hodí, a ostatní se neuvádějí. Kompendium tento výběr popisuje jako
[selektivní expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md). Zvlášť
varovné je, když se jako protipříklad uvádějí projevy laskavosti ze strany toho, kdo
ubližuje. Herman popisuje, že v podmínkách dlouhodobé kontroly patří občasné projevy
shovívavosti a drobné výsady k prostředkům, kterými se oslabuje odpor a prohlubuje
závislost (Herman 1992). Takové výjimky tedy nejsou vyvrácením vzorce, ale jeho součástí.
U člověka, proti jehož výpovědi se protipříklady opakovaně staví, se objevuje nejistota,
zda jeho celkový dojem odpovídá skutečnosti, a sklon sám si připomínat výjimky, aby
ospravedlnil setrvání ve vztahu.

## Legitimní a manipulativní užití

Legitimní užití staví výjimku proti absolutnímu soudu, který škodí tomu, kdo ho drží.
Terapeut, který se klientky s depresivními myšlenkami ptá, zda dokončila kurz, o kterém
mluvila minule, testuje její „nikdy nic nedokončím“ proti její vlastní zkušenosti a
nepopírá, že s dokončováním má potíže. Takové užití odpovídá kognitivní práci s doklady
pro myšlenku a proti ní (Beck 1976) a nechává na klientce, co z výjimky vyvodí. V
legitimním užití výjimka pochází ze zkušenosti toho, o čí přesvědčení jde, a slouží ke
zpřesnění, ne k popření. Manipulativní užití staví výjimku proti výpovědi o opakovaném
ubližování, proti statistickému poznatku nebo proti zkušenosti, která je pro mluvčího
nepohodlná. Rozlišení usnadňují tři otázky. Tvrdí přesvědčení skutečně, že se něco děje
vždy, nebo jen, že se to děje opakovaně? Odkud výjimka pochází a kdo ji vybral? A slouží
výjimka ke zpřesnění zkušenosti, nebo k jejímu zneplatnění? Opačný směr, kdy se
nepohodlnému přesvědčení vytýkají jeho důsledky, rozebírá vzorec
[důsledek](@/kompendium/nlp-vzorce/sleight-of-mouth/som-dusledek.md).

## Stav důkazů

Logika vyvracení absolutních tvrzení jediným případem je základem kritického myšlení a
nepotřebuje empirické ověření. Hledání výjimek a dokladů proti automatickým myšlenkám je
součástí kognitivní terapie (Beck 1976), jejíž účinnost se ovšem posuzuje u celého
přístupu, ne u jednotlivých konverzačních pohybů. Vzorec protipříklad v podobě Sleight of
Mouth nebyl, pokud je kompendiu známo, samostatně testován a literatura souboru ho dokládá
příklady (Dilts 1999). Obecné přehledy výzkumu NLP shledávají, že tvrzení oboru jsou
zřídka formulována tak, aby je bylo možné testovat, a že kontrolované studie je většinou
nepodporují (Sharpley 1987; Witkowski 2010). Pro manipulativní podobu vzorce je nejlépe
doloženo, že snadno vybavitelné případy zkreslují úsudek o četnosti a že lidé dávají
přednost dokladům, které potvrzují to, co si přejí (Tversky a Kahneman 1974; Gilovich 1991). Tyto poznatky vysvětlují,
proč může jediná výjimka v rozhovoru působit přesvědčivě, i když logicky nic nevyvrací.

## Obrana a zotavení

Obranou je rozlišit tvrzení o četnosti od tvrzení absolutního a trvat na tom, co bylo
skutečně řečeno. Lze uznat, že výjimka se stala, a zároveň připomenout, že výpověď se týkala
opakování, ne absolutního pravidla. Užitečné je převést rozhovor k počtům a k časové ose:
kolikrát se něco stalo, jak dlouho to trvá a jak často se objevují výjimky. Záznamy vedené
průběžně jsou proti selektivním protipříkladům silnou oporou, protože ukazují celek, ze
kterého byla výjimka vybrána. Pomáhá také posoudit, zda výjimka nepatří k samotnému
vzorci, například zda laskavost nenásleduje pravidelně po ublížení. U lidí, kteří dlouho
žili ve vztahu, kde se jejich zkušenost vyvracela výjimkami, zotavení zahrnuje obnovu
důvěry v celkový dojem a pochopení, že občasné dobré chvíle nezneplatňují to, co se dělo
jinak (Herman 1992). Terapeut by měl v takové situaci s legitimním protipříkladem zacházet
opatrně, aby klient nezažil hledání výjimek jako další zpochybnění své zkušenosti.
Protipříklad je nejvhodnější tam, kde se obrací proti klientovu vlastnímu přehnanému
soudu o sobě, a nevhodný tam, kde by se obracel proti jeho výpovědi o tom, co mu dělali
druzí.

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Ellis, A. (1962). *Reason and Emotion in Psychotherapy*. New York: Lyle Stuart.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Sleight of Mouth](@/kompendium/nlp-vzorce/sleight-of-mouth/sleight-of-mouth.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – příbuzné heslo (Argumentační fauly: Formální klamy, Formal fallacy)
- [Žádný pravý Skot](@/kompendium/argumentacni-fauly/predpoklady-argumentu/zadny-pravy-skot.md) – příbuzné heslo (Argumentační fauly: Klamy předpokladu, No true Scotsman)
- [Zobecňování](@/kompendium/nlp-vzorce/zakladni-pojmy/zobecnovani.md) – příbuzné heslo (Základní pojmy NLP, Generalisation)
- [Univerzální kvantifikátor](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md) – příbuzné heslo (Meta-model, Universal quantifier)
- [Důsledek](@/kompendium/nlp-vzorce/sleight-of-mouth/som-dusledek.md) – příbuzné heslo (Sleight of Mouth, Consequence)
- [Zobecnění](@/kompendium/nlp-vzorce/sleight-of-mouth/som-zobecneni.md) – příbuzné heslo (Sleight of Mouth, Chunk up)
- [Analogie](@/kompendium/nlp-vzorce/sleight-of-mouth/som-analogie.md) – příbuzné heslo (Sleight of Mouth, Analogy)
- [Aplikace na sebe](@/kompendium/nlp-vzorce/sleight-of-mouth/som-aplikace-na-sebe.md) – příbuzné heslo (Sleight of Mouth, Apply to self)
- [Limitující přesvědčení](@/kompendium/nlp-vzorce/presvedceni/limitujici-presvedceni.md) – příbuzné heslo (Přesvědčení, Limiting beliefs)

**V kompendiu**

- [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-6.2.1 Trauma-focused CBT protokol](@/kompendium/techniques/ea-6-2-1-trauma-focused-cbt-protokol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Zobecnění](@/kompendium/nlp-vzorce/sleight-of-mouth/som-zobecneni.md) – předchozí heslo rodiny
- [Analogie](@/kompendium/nlp-vzorce/sleight-of-mouth/som-analogie.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
