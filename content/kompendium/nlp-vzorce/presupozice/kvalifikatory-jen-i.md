+++
title = "Částice „jen“, „i“, „dokonce“"
description = "Částice jen, i, také, dokonce a kromě předpokládají další osoby, alternativy nebo míru; jak se jimi naznačuje souhlas skupiny či zlehčuje čin a jak to rozpoznat."
weight = 10
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Částice „jen“, „i“, „dokonce“", "Qualifiers only, even, too", "vytýkací částice", "fokalizátory", "jen, i, dokonce, kromě", "Jazykové presupozice", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-06.10"
nlp_slug = "kvalifikatory-jen-i"
nlp_family = "presupozice"
nlp_family_code = "06"
nlp_family_title = "Jazykové presupozice"
nlp_family_en = "Linguistic presuppositions"
nlp_part = "presupozice"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Qualifiers only, even, too"
nlp_aliases = ["vytýkací částice", "fokalizátory", "jen, i, dokonce, kromě"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "jazykove-presupozice"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["jazykove-presupozice"]
nlp_related = ["srovnavaci-delece", "komentarova-adverbia", "opakovaci-slova", "srovnavaci-presupozice", "rozstepene-vety"]
nlp_related_declared = ["opakovaci-slova", "srovnavaci-presupozice", "srovnavaci-delece", "komentarova-adverbia"]
nlp_kompendium = ["kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md", "kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md", "kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md", "kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md"]
nlp_prev = "opakovaci-slova"
nlp_next = "srovnavaci-presupozice"
nlp_position = 10
nlp_family_size = 19
nlp_sources = ["bandler-grinder-1975", "bandler-grinder-1975b", "cialdini-2009", "druckman-swets-1988", "grice-1975", "levinson-1983", "mcguire-1964", "passmore-rowson-2019", "singer-lalich-1995", "stark-2007"]
nlp_sources_primary = ["bandler-grinder-1975", "bandler-grinder-1975b"]
nlp_sources_roots = ["grice-1975", "levinson-1983"]
nlp_sources_critical = ["cialdini-2009", "druckman-swets-1988", "mcguire-1964", "passmore-rowson-2019", "singer-lalich-1995", "stark-2007"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Varianty", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/presupozice.toml"
+++

# Částice „jen“, „i“, „dokonce“

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.10` |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Qualifiers only, even, too |
| **Jiné názvy** | vytýkací částice, fokalizátory, jen, i, dokonce, kromě |
| **Obecnější vzorec** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Částice „jen“, „jenom“, „pouze“, „i“, „také“, „dokonce“, „ani“ a předložka „kromě“ patří
k výrazům, které vztahují výpověď k dalším možnostem, jež nejsou vysloveny. Věta „Dokonce i
tvoje sestra to vidí“ tvrdí, že sestra něco vidí, a předpokládá, že to vidí i další lidé a
že sestra je mezi nimi ta, od které by se to čekalo nejméně. Věta „Jen se ptám“ předpokládá,
že jde o pouhou otázku, a vylučuje, že by byla čímkoli jiným, například výčitkou nebo
nátlakem. V lingvistice se těmto slovům říká vytýkací nebo fokalizační částice, protože se
vážou k tomu členu věty, který je zdůrazněn; pragmatika je uvádí mezi výrazy, jejichž význam
přesahuje to, co věta tvrdí (Levinson 1983). Seznamy presupozic, které se v NLP předávají,
uvádějí tyto výrazy jako zvláštní skupinu, kterou lze předpoklad o dalších osobách nebo o
míře vložit do věty, aniž by se tvrdil; obecný rámec, ze kterého seznamy vycházejí, položili
Bandler a Grinder v rozborech jazyka terapie a hypnózy (Bandler a Grinder 1975; Bandler a
Grinder 1975b). Pro kompendium je vzorec důležitý tím, že
dokáže naznačit souhlas skupiny, který nikdo nedoložil, nebo předem zlehčit čin, o jehož
povaze by se mělo teprve mluvit.

## Původ a souvislosti

Částice typu „dokonce“ sloužily v pragmatice jako příklad významu, který se nevejde do
pravdivostních podmínek věty. Věty „Petr přišel“ a „Dokonce i Petr přišel“ jsou pravdivé za
stejných okolností, ale druhá navíc sděluje, že přišli i jiní a že Petrův příchod byl nejméně
pravděpodobný. Grice podobné významy, které se vážou k samotnému slovu, ale nepatří k tomu, co
bylo řečeno, označil jako konvenční implikatury (Grice 1975), a Levinson ukazuje, že slova
jako „dokonce“ a „ale“ jsou typickými nositeli takového významu (Levinson 1983). Pro češtinu je
podstatné, že částice se vážou k aktuálnímu členění věty: tatáž částice na jiném místě nebo
s jiným důrazem předpokládá něco jiného. „I ty to musíš vidět“ a „Ty to musíš vidět i“
předpokládají odlišné alternativy, a proto se vzorec v češtině obtížněji popisuje pevným
seznamem slov než v angličtině.

[Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) obecně vychází z toho, že předpoklady obsažené v řeči klienta mohou omezovat
jeho [model světa](@/kompendium/nlp-vzorce/sleight-of-mouth/som-model-sveta.md) (Bandler a Grinder 1975); u částic jde o předpoklady o tom, co je běžné a co
výjimečné, kdo další něco sdílí a které výklady jsou vyloučené. Sociální psychologie popsala princip, který vysvětluje,
proč je naznačený souhlas ostatních tak účinný: lidé v nejistotě odvozují správné jednání z
toho, jak jednají druzí (Cialdini 2009). Částice „i“ a „dokonce i“ tento princip vyvolávají,
aniž by bylo třeba ukázat, kdo z ostatních tak jedná.

## Struktura vzorce

Vzorec má tři podoby, které se liší směrem předpokladu. Aditivní částice („i“, „také“, „ani“)
předpokládají, že tvrzení platí i pro někoho dalšího; vytvářejí tak dojem skupiny, ke které
adresát patří nebo se staví proti ní. Škálová částice „dokonce“ předpokládá navíc pořadí
pravděpodobnosti: adresát je umístěn na okraj, mezi ty, od kterých by se souhlas čekal
nejméně, takže nesouhlas se jeví jako vybočení i z tohoto okraje. Vylučovací částice („jen“,
„pouze“, „kromě“) předpokládají, že ostatní možnosti neplatí; v manipulativním užití slouží
nejčastěji ke zlehčení. „Byl to jen vtip“ předpokládá, že výrok nebyl ničím jiným než vtipem,
a vylučuje výklad, že šlo o ponížení. „Jen chci, abys byla v bezpečí“ předpokládá, že jediným
motivem kontroly je péče. Literatura o donucující kontrole upozorňuje, že
omezování partnera se často předkládá jako projev starosti a ochrany (Stark 2007).

Společným rysem všech tří podob je, že alternativy, ke kterým se částice vztahuje, zůstávají
nevyslovené. Adresát nevidí, s kým je srovnáván ani jaké jiné výklady byly vyloučeny, a
nemůže proto srovnání ani vyloučení zpochybnit. Vzorec je příbuzný
[srovnávací presupozici](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md), která
předpokládá měřítko srovnání, a [srovnávacímu vypuštění](@/kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md),
při kterém se srovnání vysloví bez toho, s čím se srovnává.

## Varianty

V praxi se nejčastěji objevují čtyři podoby. Naznačený konsenzus („i ostatní si všimli“,
„dokonce i tvoji přátelé“) staví adresáta proti skupině, jejíž názor nebyl doložen.
Zlehčení vlastního činu („jen jsem se zeptal“, „byl to jen vtip“, „jen jsem ti chtěl pomoct“)
předem vylučuje výklad, že šlo o něco závažnějšího. Zlehčení zkušenosti adresáta („jsou to
jen nervy“, „je to jen tvůj pocit“) předpokládá, že zkušenost nemá jiný obsah než ten, který
jí mluvčí přiznává. Vyloučení alternativ („kromě nás ti nikdo nepomůže“) předpokládá, že
jiné zdroje pomoci neexistují. Poslední podoba je typická pro uzavřené skupiny a kontrolující
vztahy, ve kterých se izolace oběti podporuje i jazykem, který jiné vztahy předem vylučuje
(Singer a Lalich 1995).

## Detekční znaky

Prvním znakem je částice „i“ nebo „dokonce“ odkazující na skupinu, jejíž členové nejsou
jmenováni a jejichž názor nebyl doložen. Kontrolní postup spočívá v otázce, kdo přesně jsou
ti další a co řekli. Druhým znakem je „jen“ nebo „pouze“ připojené k vlastnímu činu mluvčího,
zejména po tom, co adresát vyjádřil zranění nebo nesouhlas; zlehčení přichází jako odpověď na
námitku a mění ji v přecitlivělost. Třetím znakem je „jen“ u zkušenosti adresáta, které ji
odbývá jako bezvýznamnou. Čtvrtým znakem je „kromě“ ve spojení s výlučností vztahu nebo
skupiny. U adresáta se při dlouhodobém působení objevuje pocit, že je se svým názorem sám,
a sklon pochybovat o vlastní kompetenci; kompendium tento posun rozebírá u
[zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md)
a u [vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md),
kde se dojem většinového názoru vytváří bez jeho doložení (Cialdini 2009).

## Legitimní a manipulativní užití

Legitimní užití je v jazyce všudypřítomné. Pozvánka, která uvádí, že zváni jsou i studenti
prvního ročníku, rozšiřuje okruh pozvaných o skupinu, která je výslovně jmenovaná. Lékař,
který řekne, že jde „jen o drobný zákrok“, předává informaci o rozsahu výkonu, kterou lze
ověřit. V terapii může částice „i“ sloužit k normalizaci zkušenosti, například když terapeut
připomene, že podobné obtíže mají i jiní lidé po podobné události; taková normalizace je
legitimní, pokud odpovídá odborným znalostem a nezlehčuje zkušenost klienta. Princip kooperace
předpokládá, že mluvčí takové částice užívá v dobré víře a že předpokládané alternativy
existují (Grice 1975).

Manipulativní užití staví do předpokladu konsenzus, který neexistuje, nebo vylučuje výklad,
který by mluvčího usvědčoval. Je typické v nátlakových rozhovorech na pracovišti, v
kontrolujících vztazích po zraňujícím výroku a v uzavřených skupinách, které vylučují vnější
zdroje pomoci. Jeho podstatou je, že srovnání nebo vyloučení se neprojednává, protože se
nikdy nevysloví.

## Stav důkazů

Význam fokalizačních částic a jejich nepravdivostní složka jsou v pragmatice podrobně
popsány (Grice 1975; Levinson 1983) a vliv naznačeného chování ostatních na jednání je
doložen výzkumem sociálního vlivu (Cialdini 2009). Tvrzení NLP, že tyto částice v
hypnotickém nebo přesvědčovacím jazyce samy o sobě spolehlivě vedou k přijetí sugesce,
nebyla ověřena kontrolovanými studiemi (Bandler a Grinder 1975b). Hodnocení amerických
národních akademií nenašlo pro tvrzení NLP o ovlivňování lidí dostatečnou empirickou oporu
(Druckman a Swets 1988) a kritický přehled z oblasti koučinku konstatuje přetrvávající
nedostatek kvalitních studií (Passmore a Rowson 2019). Mechanismus je tedy lingvisticky jistý
a psychologicky pravděpodobný, ale jeho samostatný účinek nebyl změřen.

## Obrana a zotavení

Základní obranou je rozložit částici na skryté tvrzení a zeptat se na něj: „Kdo další to
vidí?“ u částice „i“, „Co jiného to podle tebe nebylo?“ u zlehčujícího „jen“. Taková otázka
nevyžaduje konfrontaci, jen vrací alternativy do rozhovoru. Druhou obranou je odmítnout
zlehčení vlastní zkušenosti: to, že mluvčí označí zranění za „jen pocit“, nemění nic na tom,
že zranění bylo skutečné. Třetí obranou je ověřit naznačený konsenzus nezávisle, tedy mluvit
přímo s lidmi, na které se mluvčí odvolával. Očkování proti přesvědčování ukazuje, že předchozí
znalost typické argumentační strategie zvyšuje odolnost vůči jejímu pozdějšímu působení (McGuire
1964). Při zotavení po dlouhodobém působení pomáhá obnovit vztahy, které byly jazykem výlučnosti
předem vyloučeny, a zjistit, co si ti, na které se mluvčí odvolával, ve skutečnosti mysleli.
Literatura o uzavřených skupinách popisuje obnovení vnějších vztahů jako podstatnou součást
návratu k samostatnému úsudku (Singer a Lalich 1995).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Singer, M. T., & Lalich, J. (1995). *Cults in Our Midst*. San Francisco: Jossey-Bass.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Srovnávací vypuštění](@/kompendium/nlp-vzorce/meta-model/srovnavaci-delece.md) – příbuzný vzorec (Meta-model, Comparative deletion)
- [Komentářová příslovce a přídavná jména](@/kompendium/nlp-vzorce/presupozice/komentarova-adverbia.md) – příbuzný vzorec (Jazykové presupozice, Commentary adverbs and adjectives)
- [Opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md) – příbuzný vzorec (Jazykové presupozice, Repetitive cue words)
- [Srovnávací presupozice](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md) – příbuzný vzorec (Jazykové presupozice, Comparatives as presuppositions)
- [Vytýkací konstrukce](@/kompendium/nlp-vzorce/presupozice/rozstepene-vety.md) – příbuzný vzorec (Jazykové presupozice, Cleft sentences)

**V kompendiu**

- [EA-2.5.2 Zesilování syndromu podvodníka](@/kompendium/techniques/ea-2-5-2-imposter-syndrome-amplifikace.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-2.1.9 Vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Opakovací slova](@/kompendium/nlp-vzorce/presupozice/opakovaci-slova.md) – předchozí vzorec rodiny
- [Srovnávací presupozice](@/kompendium/nlp-vzorce/presupozice/srovnavaci-presupozice.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
