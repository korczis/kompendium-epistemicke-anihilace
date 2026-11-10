+++
title = "Časové posuny v jazyce"
description = "Posuny slovesného času a časových výrazů, jimiž se problém odsouvá do minulosti a cíl předjímá jako hotový: tvrzení NLP, klinický rozměr, zneužití v kontrolujících vztazích."
weight = 20
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-jazykove-vzorce", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Časové posuny v jazyce", "Verb tense shifts", "posuny slovesného času", "přesun do minulého času", "Jazykové vzorce", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-20.20"
nlp_slug = "casove-presuny-v-jazyce"
nlp_family = "jazykove-vzorce"
nlp_family_code = "20"
nlp_family_title = "Jazykové vzorce"
nlp_family_en = "Language patterns"
nlp_part = "jazykove-vzorce.b"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Verb tense shifts"
nlp_aliases = ["posuny slovesného času", "přesun do minulého času"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = ""
nlp_narrower = []
nlp_depth = 0
nlp_ancestors = []
nlp_related = ["pseudoorientace-v-case", "presupozice-casovych-vet", "slovesa-zmeny-casu", "kontrafaktualni-podminky", "zmena-osobni-historie", "casove-kodovani", "zatim"]
nlp_related_declared = ["pseudoorientace-v-case", "zatim", "presupozice-casovych-vet", "casove-kodovani", "slovesa-zmeny-casu", "zmena-osobni-historie"]
nlp_kompendium = ["kompendium/techniques/ea-5-1-10-temporalni-dekoherence.md", "kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/ericksonovska-hypnoza/pseudoorientace-v-case.md", "kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md", "kompendium/techniques/ea-5-1-10-temporalni-dekoherence.md", "kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md"]
nlp_prev = "slovni-baliky"
nlp_next = ""
nlp_position = 20
nlp_family_size = 20
nlp_sources = ["bandler-grinder-1975b", "herman-1992", "james-woodsmall-1988", "lakoff-johnson-1980", "levinson-1983", "stark-2007", "sturt-2012", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1975b", "james-woodsmall-1988"]
nlp_sources_roots = ["levinson-1983"]
nlp_sources_critical = ["herman-1992", "lakoff-johnson-1980", "stark-2007", "sturt-2012", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/jazykove-vzorce.b.toml"
+++

# Časové posuny v jazyce

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-20.20` |
| **Rodina** | [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Verb tense shifts |
| **Jiné názvy** | posuny slovesného času, přesun do minulého času |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Časové posuny v jazyce označují v NLP záměrnou změnu slovesného času nebo časových výrazů ve
chvíli, kdy se mluví o problému, o cíli nebo o změně. O potíži, kterou člověk popisuje v
přítomném čase („mám strach z výšek“), se odpovídá v čase minulém („ten strach, který jste
měl“); o žádoucím stavu se mluví, jako by už nastal („až se ohlédnete za tím, jak jste to
zvládl“). Podle tréninkové literatury tím mluvčí nabízí posluchači jiné umístění zkušenosti
v čase: problém se ocitá za ním, řešení před ním nebo dokonce už za ním. Jazykově jde o
presupozice spojené s časem, které výrok předpokládá, aniž by je tvrdil (Bandler a Grinder
1975b). Kompendium vzorec popisuje proto, že časové umístění události není jen otázkou
gramatiky. Rozhoduje o tom, zda je něco uzavřené, nebo trvá, zda se za to nese
odpovědnost, nebo už „je to minulost“, a tedy i o tom, zda člověk může žádat nápravu.

## Původ a souvislosti

Vzorec spojuje tři zdroje. Prvním je lingvistika presupozice, která popisuje, jak časové
vedlejší věty, slovesa změny stavu a časová příslovce nesou předpoklady o tom, co se stalo
před událostí a co po ní (Levinson 1983). Bandler a Grinder tyto prostředky zahrnuli do
výčtu presupozic, s nimiž pracují Ericksonovy jazykové vzorce (Bandler a Grinder 1975b);
podrobněji je rozebírá stránka o
[presupozicích časových vět](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md).
Druhým zdrojem je ericksonovská práce s časem, především postup, v němž se pacient v představě
přenese do budoucnosti a odtud se „ohlíží“ na vyřešený problém; kompendium ho popisuje u
[pseudoorientace v čase](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/pseudoorientace-v-case.md).
Třetím zdrojem je pozdější vývoj NLP, který pojal subjektivní čas jako prostorovou
reprezentaci, takzvanou časovou osu, a z ní odvodil vlastní terapeutické postupy (James a
Woodsmall 1988). Mimo NLP popisuje kognitivní lingvistika, jak lidé o čase mluví
prostřednictvím prostorových metafor: budoucnost je „před námi“, minulost „za námi“ a čas
„plyne“ kolem nás (Lakoff a Johnson 1980). Tyto metafory vysvětlují, proč jazykové posunutí
události do minulosti může vyvolat pocit odstupu.

## Struktura vzorce

Vzorec lze rozložit na tři pohyby. První je odsunutí do minulosti: přítomný problém se
pojmenuje minulým časem nebo se k němu připojí výraz „tehdy“, „dřív“, „to bylo“. Druhý je
předjímání budoucnosti: žádoucí stav se popíše budoucím časem jako jistý („až to budete
umět“) nebo minulým časem z pohledu budoucnosti („až budete vyprávět, jak jste to
překonal“). Třetí je přerámování trvání: opakující se jev se popíše jako jednotlivá
událost („ten jeden incident“), nebo naopak jednotlivá událost jako trvalý rys („ty pořád“).
Ve všech třech pohybech mluvčí určuje, kde na časové ose zkušenost leží, a posluchač, který
odpovídá na obsah věty, toto umístění zpravidla přijímá bez povšimnutí.

V terapeutickém rámci se časový posun nabízí jako jiný pohled, který klient může přijmout nebo
odmítnout. Mechanismus, který NLP tvrdí, je přímý: posun času má změnit to, jak člověk
problém reprezentuje, a tím i to, jak ho prožívá. Méně zatížený výklad je pragmatický:
posluchač slyší, že druhý počítá se změnou, a to může posílit jeho naději. Ve vztazích s
nerovnou mocí má však posun jinou funkci. Odsunutí nedávné nebo trvající události do minulosti
mění otázku „co se děje“ na otázku „proč to pořád připomínáš“. Stark ukázal, že nátlaková
kontrola má povahu trvajícího vzorce, nikoli řady izolovaných incidentů, a že právě
rozdrobení na jednotlivé, „uzavřené“ události brání tomu, aby byl vzorec rozpoznán (Stark
2007). Jazykový posun do minulosti je jedním z prostředků takového rozdrobení.

## Detekční znaky

Prvním detekčním znakem je nesoulad mezi časem věty a časem události: o něčem, co se stalo
minulý týden nebo co trvá, se mluví jako o dávné minulosti. Druhým znakem je spojení
časového posunu s výčitkou: „to bylo tehdy, proč v tom pořád žiješ?“ přesouvá pozornost z
události na posluchače, který ji připomíná. Třetím znakem je opakující se slib budoucnosti,
který se nenaplňuje: „bude to jiné“, „od zítřka“, „až se to uklidní“. Budoucí čas tu slouží k
tomu, aby se přítomnost nemusela měnit. V kontrolujících vztazích se střídání
odsouvání minulosti a slibů budoucnosti opakuje jako cyklus a právě opakování je znakem,
který jednotlivé věty nezachytí; posuzovat je třeba vzorec v čase, ne izolovaný výrok
(Stark 2007). Čtvrtým znakem je perfektivní presupozice o
posluchači: „už jsi mi to přece odpustila“, „to už máme za sebou“, kde se posluchači připíše
dokončený vnitřní proces, který sám nepotvrdil. Pátým znakem je přepis vlastní historie
mluvčího: mluvčí vypráví o svém dřívějším chování jako o něčem, co „byl jiný člověk“, a
odmítá tím za něj odpovědnost. Kompendium narušení časové souvislosti zkušenosti popisuje u
[temporální dekoherence](@/kompendium/techniques/ea-5-1-10-temporalni-dekoherence.md). U
člověka, na kterého jsou tyto posuny uplatňovány dlouhodobě, se objevuje nejistota v tom,
kdy se co stalo a jak často, a pocit, že nemá právo mluvit o věcech, které „už jsou pryč“.

## Legitimní a manipulativní užití

Přesné užití času je pro klinickou práci podstatné. Herman popisuje, že traumatická
vzpomínka se často nevybavuje jako příběh o minulosti, ale jako fragmentovaný prožitek, který
vtrhává do přítomnosti, a že jedním z cílů zotavení je převést ji v souvislé vyprávění, které
má své místo v minulosti (Herman 1992). Klinička, která pacientce řekne „říkáte, že jste
dřív mívala záchvaty skoro denně; jak je to teď?“, používá minulý čas proto, že ho použila
pacientka, a otevřenou otázkou ověřuje, zda potíže trvají. Legitimní užití tedy sleduje
skutečnost a nechává posluchači poslední slovo o tom, co je za ním. Terapeut, který nabízí
pohled „ten strach jste měl“, jedná legitimně, pokud je to nabídka, kterou klient může
odmítnout, a pokud se tím nezastírá, že potíže pokračují. Manipulativní užití posouvá čas v
zájmu mluvčího: uzavírá události, za které by měl nést odpovědnost, předjímá souhlas nebo
odpuštění, které nezaznělo, a nahrazuje změnu v přítomnosti sliby do budoucna. Kompendium
souvislé vyprávění vlastní zkušenosti jako cíl zotavení rozebírá u
[narativní rekonstrukce](@/kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md).

## Stav důkazů

Tvrzení NLP, že pouhý posun slovesného času mění reprezentaci problému a tím i jeho prožívání,
nebylo podle dostupných přehledů ověřeno kontrolovanými studiemi. Přehledy výzkumu NLP
konstatují, že jazykové a terapeutické techniky oboru postrádají kvalitní empirickou oporu
(Witkowski 2010) a systematický přehled účinků NLP na zdravotní výsledky nenašel dost studií,
které by doporučení technik NLP opravňovaly (Sturt a kol. 2012). Totéž platí pro terapii
časové osy, z níž část těchto postupů vychází; její literatura je převážně praktická a opírá
se o klinické zkušenosti autorů (James a Woodsmall 1988). Dobře doložené jsou naproti tomu
jazykovědné a kognitivní základy vzorce: presupozice časových výrazů (Levinson 1983) a
metaforické strukturování času (Lakoff a Johnson 1980). Klinicky významné je také pozorování,
že integrace traumatické vzpomínky do souvislého příběhu o minulosti patří k cílům zotavení
(Herman 1992); to však neznamená, že k tomu stačí jazyková volba, a zkratky v této oblasti
mohou škodit, protože popírají, že potíže trvají.

## Obrana a zotavení

Obranou proti manipulativnímu posunu je vrátit se k datům. Kdy se to stalo? Stalo se to
jednou, nebo se to opakuje? Kdy naposledy? Odpovědi na tyto otázky umístí událost na časovou
osu podle skutečnosti, ne podle toho, jak o ní mluví druhá strana. Druhou obranou je
zapisovat si události s datem. Kdo má záznam, nemusí se přít o to, zda něco bylo „dávno“, a
snáz rozpozná vzorec, který se v rozdrobené podobě ztrácí; tento přístup odpovídá tomu, jak
literatura o nátlakové kontrole doporučuje posuzovat vztah jako celek (Stark 2007). Třetí
obranou je odmítnout perfektivní presupozici: „Neřekla jsem, že jsem ti odpustila. Mluvíme o
tom teď.“ Čtvrtou obranou proti opakovaným slibům budoucnosti je hodnotit přítomnost: co se
změnilo dnes, ne co se změní zítra. Při zotavení je cílem dosáhnout toho, aby minulost byla
minulostí, protože je skutečně uzavřená, ne proto, že ji tak někdo nazval. Herman zdůrazňuje,
že zpracování traumatické vzpomínky předpokládá nejprve obnovu bezpečí v přítomnosti; dokud
ohrožení trvá, nelze ho vyprávět jako minulost (Herman 1992). Kliničtí pracovníci by proto měli
časové posuny používat jen tam, kde odpovídají skutečnému průběhu, a vždy ověřovat, zda to,
co se popisuje jako minulé, opravdu skončilo.

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- James, T., & Woodsmall, W. (1988). *Time Line Therapy and the Basis of Personality*. Cupertino: Meta Publications.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.
- Sturt, J., Ali, S., Robertson, W., Metcalfe, D., Grove, A., Bourne, C., & Bridle, C. (2012). Neurolinguistic programming: A systematic review of the effects on health outcomes. *British Journal of General Practice*, 62(604), e757–e764.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců

**Příbuzné vzorce**

- [Pseudoorientace v čase](@/kompendium/nlp-vzorce/ericksonovska-hypnoza/pseudoorientace-v-case.md) – příbuzný vzorec (Ericksonovská hypnóza, Pseudo-orientation in time)
- [Presupozice časových vět](@/kompendium/nlp-vzorce/presupozice/presupozice-casovych-vet.md) – příbuzný vzorec (Jazykové presupozice, Subordinate clauses of time)
- [Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md) – příbuzný vzorec (Jazykové presupozice, Change-of-time verbs and adverbs)
- [Kontrafaktuální podmínky](@/kompendium/nlp-vzorce/presupozice/kontrafaktualni-podminky.md) – příbuzný vzorec (Jazykové presupozice, Counterfactual conditionals)
- [Změna osobní historie](@/kompendium/nlp-vzorce/disociace-a-trauma/zmena-osobni-historie.md) – příbuzný vzorec (Disociace, fobie a trauma, Change personal history)
- [Časové kódování zkušenosti](@/kompendium/nlp-vzorce/casova-osa/casove-kodovani.md) – příbuzný vzorec (Časová osa, Temporal coding of experience)
- [Slovo „zatím“](@/kompendium/nlp-vzorce/jazykove-vzorce/zatim.md) – příbuzný vzorec (Jazykové vzorce, Yet)

**V kompendiu**

- [EA-5.1.10 Temporální dekoherence](@/kompendium/techniques/ea-5-1-10-temporalni-dekoherence.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-6.3.6 Narativní rekonstrukce](@/kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Hodnotově nabitá slova](@/kompendium/nlp-vzorce/jazykove-vzorce/slovni-baliky.md) – předchozí vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
