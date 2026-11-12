+++
title = "Popření předchůdce"
description = "Neplatný úsudek, který z nesplnění postačující podmínky vyvozuje, že nenastal ani její důsledek: záměna postačující a nutné podmínky, znaky, odlišení a obrana."
weight = 3
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-chyba"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Popření předchůdce", "Denying the antecedent", "negace antecedentu", "klam předchůdce", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.03"
catalog_slug = "popreni-predchudce"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Denying the antecedent"
catalog_aliases = ["negace antecedentu", "klam předchůdce"]
catalog_use = "chyba"
catalog_use_cs = "převážně chyba uvažování"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["potvrzeni-dusledku", "nedovoleny-vetsi-termin", "potvrzeni-disjunktu", "odvolani-na-nevedomost", "jedina-pricina", "pravidlo-platnosti", "modalni-operator-nutnosti"]
catalog_related_declared = ["potvrzeni-dusledku", "nedovoleny-vetsi-termin", "odvolani-na-nevedomost", "jedina-pricina", "modalni-operator-nutnosti"]
catalog_kompendium = ["kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md", "kompendium/06-obrana/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/06-obrana/_index.md", "kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md", "kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md", "kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md", "kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md", "kompendium/forensic-legal/_index.md"]
catalog_prev = "potvrzeni-dusledku"
catalog_next = "nerozlozeny-stredni-termin"
catalog_position = 3
catalog_family_size = 16
catalog_sources = ["copi-cohen-mcmahon-2014", "damer-2009", "govier-2010", "grice-1975", "hamblin-1970", "herman-1992", "kahneman-2011", "levinson-1983", "stanovich-west-2000", "stark-2007", "walton-2008", "walton-reed-macagno-2008", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "damer-2009", "govier-2010", "hamblin-1970", "walton-2008", "walton-reed-macagno-2008", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["grice-1975", "levinson-1983"]
catalog_sources_critical = ["herman-1992", "kahneman-2011", "stanovich-west-2000", "stark-2007"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/formalni.toml"
+++

# Popření předchůdce

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.03` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Denying the antecedent |
| **Jiné názvy** | negace antecedentu, klam předchůdce |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | převážně chyba uvažování |
| **Riziko zneužití** | nízké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Popření předchůdce je neplatný úsudek, který z podmínky „jestliže A, pak B“ a ze zjištění,
že A nenastalo, vyvozuje, že nenastalo ani B. Úsudek zaměňuje postačující podmínku za nutnou:
podmínka říká, že A k B stačí, ale neříká, že B bez A nastat nemůže (Copi, Cohen a McMahon
2014). Platnou sousední formou je modus tollens, který z podmínky a z popření důsledku
vyvozuje popření předchůdce. Popření předchůdce tuto formu napodobuje, ale popírá nesprávný
člen podmínky. Proto je neplatné bez ohledu na obsah: vždy lze najít případ, kdy A
nenastalo, a B přesto nastalo z jiného důvodu. V běžné řeči se klam projevuje jako přesvědčení,
že když chybí jeden známý důvod nějakého stavu, chybí i stav sám. Pro kompendium je
podstatný hlavně tam, kde se jedna nápadná podoba jevu vydává za jeho jedinou podobu: kde
chybí modřiny, není prý násilí, kde chybí výslovná výhrůžka, není prý nátlak, a kde chybí
diagnóza, není prý potíž, která by zasloužila ohled.

## Původ a souvislosti

Tradiční logika zařazovala popření předchůdce spolu s potvrzením důsledku mezi chyby
podmíněného sylogismu; obě vycházejí z mylného předpokladu, že vztah podmínky lze obrátit.
Aristotelův klam z důsledku se obvykle vykládá tak, že zahrnoval obě obrácení podmínky;
Hamblinův historický rozbor ukazuje, jak se vymezení jednotlivých klamů od antiky po novověké
učebnice posouvalo a jak pozdě se ustálila dnešní jména (Hamblin 1970). Jazykovou
souvislost vysvětluje pragmatika. Grice rozlišil to, co věta logicky tvrdí, od toho, co
mluvčí v rozhovoru sděluje navíc a co posluchač rozumně vyvodí (Grice 1975). Levinson
zpracoval tuto teorii implikatur do soustavného výkladu pragmatiky (Levinson 1983). Podmínka
v běžném rozhovoru proto často nese sdělení navíc: věta „pokud zaplatíte do pátku, dostanete
slevu“ se rozumí tak, že po pátku sleva nebude, a v tomto kontextu je takové porozumění
správné. Popření předchůdce tak zčásti vzniká přenesením rozumného čtení z rozhovoru do
situací, kde podmínka oboustranná není. Právní argumentace zná příbuzný postup, výklad a
contrario: pokud norma spojuje následek s určitými podmínkami, usuzuje se, že bez nich
následek nenastává. Takový výklad je oprávněný jen tam, kde je výčet podmínek úplný.
[Pragma-dialektika](@/kompendium/argumentacni-fauly/teorie-argumentace/pragma-dialektika.md) obě situace posuzuje podle pravidla platnosti a podle toho, zda lze
nevyslovenou premisu o úplnosti podmínky přičíst mluvčímu (van Eemeren a Grootendorst 1992).

## Struktura argumentu

Kostra klamu má tři kroky. První premisa uvádí podmínku, často pravdivou a nespornou: úder je
násilí, diagnóza zakládá nárok, úřední razítko dokládá pravost. Druhá premisa konstatuje, že
podmínka splněna není. Závěr prohlásí, že tedy chybí i důsledek. Vada je v tom, co úsudek
mlčky předpokládá: že uvedená cesta k důsledku je jediná. Tento skrytý předpoklad bývá
v rozhovoru podán jako samozřejmost, a proto se ho posluchač zřídka zeptá. Formálně jde o
výrokovou obdobu klamu, který kategorická sylogistika nazývá
[nedovoleným větším termínem](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md):
výrok „všichni, kdo mají A, mají B“ neříká nic o tom, zda B mají i ti, kdo A nemají. Zvláštní
pozornost zaslouží situace, kdy se stejný obsah objeví v platné formě s nepravdivou premisou.
Věta „kdyby šlo o násilí, byly by vidět modřiny; modřiny vidět nejsou, takže o násilí nejde“
je formálně platný modus tollens, ale její první premisa je nepravdivá. Obě stavby vedou ke
stejnému závěru a obě se opírají o představu, že násilí má jen jednu podobu; jedna selhává
ve formě, druhá v obsahu (Damer 2009).

## Detekční znaky

Popření předchůdce se v rozhovoru ohlašuje obratem „takže když ne…, tak ani…“, případně
odkazem na jedno kritérium, jehož nesplnění má uzavřít celou otázku. Typickým znakem je
seznam podmínek, který se zachází jako úplný, i když tak v pravidle, zákoně nebo odborném
doporučení formulován není. Dalším znakem je zúžení jevu na jeho nejnápadnější podobu:
násilí na fyzické napadení, šikana na nadávky, podvod na padělaný doklad. Mluvčí pak
ukazuje, že nejnápadnější podoba chybí, a ostatní podoby nechává bez povšimnutí. Govier
upozorňuje, že při hodnocení argumentu je třeba sledovat, zda mluvčí zaměnil podmínku
postačující za nutnou, protože takový posun se v běžné řeči snadno ztratí (Govier 2010).
Klam se často kombinuje s přesunem důkazního břemene: posluchač má prokázat, že chybějící
podmínka není jediná, ačkoli tvrzení o její výlučnosti vyslovil mluvčí.

## Odlišení od platné argumentace

Úsudek z nesplnění podmínky je platný, pokud je podmínka nutná, tedy pokud zní „jen
když“, „pouze pokud“ nebo „bez A nikdy B“. Pravidlo, že do laboratoře smí jen proškolený
pracovník, dovoluje platně vyvodit, že neproškolený pracovník vstoupit nesmí. Platný je
úsudek i tehdy, když je podmínka oboustranná a obě strany rozhovoru to vědí. Za třetí může
jít o rozumný pravděpodobnostní úsudek: pokud je A hlavní nebo téměř jedinou známou cestou k
B, jeho nepřítomnost pravděpodobnost B oprávněně snižuje, i když ji nevylučuje. Takový úsudek
je legitimní, dokud se nepodává jako jistý a dokud mluvčí přijme doklad, že B nastalo jinou
cestou (Walton 2008). Teorie argumentačních schémat popisuje podobné úvahy jako odvoditelné s
výhradou a k nim příslušné [kritické otázky](@/kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md), z nichž jedna vždy zní, zda nejsou známy jiné
okolnosti, které by závěr zvrátily (Walton, Reed a Macagno 2008). Odlišení tedy nestojí na
tom, zda se v úsudku vyskytuje zápor, ale na tom, zda podmínka byla předložena jako nutná a
zda ji tak lze obhájit.

## Stav poznání

Psychologie podmíněného usuzování ukazuje, že popření předchůdce přijímá jako platné značná
část lidí, zvlášť u podmínek, které se v běžné řeči čtou jako oboustranné. Výsledky zároveň
naznačují, že lidé chybu dělají méně, když si sami vybaví jinou možnou příčinu téhož
důsledku; obtíž tedy není jen ve formě, ale v tom, co si posluchač v danou chvíli dokáže
představit. Kahneman tento obecnější rys popisuje jako sklon soudit jen z informací, které
jsou právě po ruce, bez ohledu na to, co v nich chybí (Kahneman 2011). Stanovich a West
doložili, že schopnost odolat takovým chybám v logických úlohách se mezi lidmi liší a souvisí
s kognitivními schopnostmi i se sklonem úvahu aktivně prověřovat (Stanovich a West 2000).
Pro oblast, kterou kompendium sleduje nejvíc, je podstatný výzkum nátlakové kontroly. Stark
ukázal, že pojetí domácího násilí jako řady jednotlivých fyzických incidentů přehlíží
soustavnou kontrolu, izolaci a ponižování, které mohou být pro oběť stejně omezující (Stark
2007). Herman popsala, že dlouhodobé ovládání druhého člověka stojí především na soustavném
psychologickém nátlaku a že fyzické násilí v něm může být řídké (Herman 1992).
Obojí ukazuje, proč je popření předchůdce v praxi nebezpečnější, než napovídá jeho
nenápadná logická podoba.

## Obrana a odpověď

Odpověď začíná otázkou, zda je uvedená podmínka jedinou cestou k důsledku. Pokud mluvčí tvrdí,
že ano, přesouvá se spor k věcnému tvrzení, které lze ověřit v pravidle, zákoně nebo v
odborné literatuře. Pokud ne, úsudek padá a je třeba posoudit jiné cesty. Druhou odpovědí je
uvést jinou postačující podmínku téhož důsledku: násilí lze doložit i záznamy o kontrole
peněz a kontaktů, nárok lze založit i jiným důvodem než diagnózou. Třetí odpovědí je
odlišit, zda je výrok míněn jako jistý, nebo jako pravděpodobnostní odhad; v druhém případě
je namístě žádat, aby mluvčí řekl, s jakými jinými možnostmi počítá. V institucionálním
prostředí pomáhá trvat na znění pravidla, protože postačující a nutná podmínka se v textu
liší jediným slovem, například „jen“ (Copi, Cohen a McMahon 2014). Kapitoly kompendia o
[obraně a kalibraci](@/kompendium/06-obrana/_index.md) a o
[forenzním a právním rozměru](@/kompendium/forensic-legal/_index.md) ukazují, jak dokumentovat
méně nápadné podoby zneužívání, aby jejich doložení nestálo na jediném znaku. Pragma-dialektika
nabízí obecný rámec: kdo tvrdí, že podmínka je nutná, nese za toto tvrzení důkazní břemeno
(van Eemeren a Grootendorst 2004). Související chybou, která z podmínky usuzuje obráceně na
druhé straně, je [potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md).

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Govier, T. (2010). *A Practical Study of Argument* (7. vyd.). Belmont: Wadsworth.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Hamblin, C. L. (1970). *Fallacies*. London: Methuen.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.
- Walton, D., Reed, C., & Macagno, F. (2008). *Argumentation Schemes*. Cambridge: Cambridge University Press.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.
- van Eemeren, F. H., & Grootendorst, R. (2004). *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach*. Cambridge: Cambridge University Press.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) – příbuzné heslo (Formální klamy, Affirming the consequent)
- [Nedovolený větší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md) – příbuzné heslo (Formální klamy, Illicit major)
- [Potvrzení disjunktu](@/kompendium/argumentacni-fauly/formalni/potvrzeni-disjunktu.md) – příbuzné heslo (Formální klamy, Affirming a disjunct)
- [Odvolání na nevědomost](@/kompendium/argumentacni-fauly/relevance/odvolani-na-nevedomost.md) – příbuzné heslo (Klamy relevance, Appeal to ignorance)
- [Jediná příčina](@/kompendium/argumentacni-fauly/kauzalni/jedina-pricina.md) – příbuzné heslo (Kauzální klamy, Fallacy of the single cause)
- [Pravidlo platnosti](@/kompendium/argumentacni-fauly/teorie-argumentace/pravidlo-platnosti.md) – příbuzné heslo (Principy kritické diskuse a teorie argumentace, Validity rule)
- [Modální operátor nutnosti](@/kompendium/nlp-vzorce/meta-model/modalni-operator-nutnosti.md) – příbuzné heslo (NLP vzorce: Meta-model, Modal operator of necessity)

**V kompendiu**

- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Obrana a kalibrace: obrana proti epistemické anihilaci](@/kompendium/06-obrana/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) – předchozí heslo rodiny
- [Nerozložený střední termín](@/kompendium/argumentacni-fauly/formalni/nerozlozeny-stredni-termin.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
