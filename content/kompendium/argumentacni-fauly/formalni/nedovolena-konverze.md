+++
title = "Nedovolená konverze"
description = "Formální klam, který z „všechna A jsou B“ vyvozuje „všechna B jsou A“: které soudy lze obrátit, jak se chyba přenáší na podmínky a pravděpodobnosti a jak ji poznat."
weight = 16
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Nedovolená konverze", "Illicit conversion", "chybná konverze", "neplatné obrácení soudu", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.16"
catalog_slug = "nedovolena-konverze"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni.pokryti"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Illicit conversion"
catalog_aliases = ["chybná konverze", "neplatné obrácení soudu"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["potvrzeni-dusledku", "nedovoleny-vetsi-termin", "existencni-klam", "zanedbani-zakladni-miry", "klam-zalobce"]
catalog_related_declared = ["potvrzeni-dusledku", "existencni-klam", "nedovoleny-vetsi-termin", "klam-zalobce", "zanedbani-zakladni-miry"]
catalog_kompendium = ["kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-7-3-2-tversky-heuristics.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md", "kompendium/07-teoreticke-reflexe/politicka-ea.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/07-teoreticke-reflexe/politicka-ea.md", "kompendium/argumentacni-fauly/formalni/existencni-klam.md", "kompendium/argumentacni-fauly/formalni/nedovoleny-mensi-termin.md", "kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md", "kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md", "kompendium/argumentacni-fauly/statisticke/klam-zalobce.md", "kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md"]
catalog_prev = "kladny-zaver-ze-zaporne-premisy"
catalog_next = ""
catalog_position = 16
catalog_family_size = 16
catalog_sources = ["cook-lewandowsky-ecker-2017", "copi-cohen-mcmahon-2014", "gigerenzer-2002", "hahn-oaksford-2007", "hamblin-1970", "kahneman-2011", "mill-1843", "stanovich-west-2000", "thompson-schumann-1987", "tversky-kahneman-1974", "whately-1826", "eemeren-grootendorst-1992"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "hamblin-1970", "eemeren-grootendorst-1992"]
catalog_sources_roots = ["mill-1843", "whately-1826"]
catalog_sources_critical = ["cook-lewandowsky-ecker-2017", "gigerenzer-2002", "hahn-oaksford-2007", "kahneman-2011", "stanovich-west-2000", "thompson-schumann-1987", "tversky-kahneman-1974"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/formalni.pokryti.toml"
+++

# Nedovolená konverze

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.16` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Illicit conversion |
| **Jiné názvy** | chybná konverze, neplatné obrácení soudu |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Nedovolená konverze je neplatný úsudek, který v kategorickém soudu prohodí podmět a přísudek
tam, kde to logika nepřipouští. Nejznámější podoba vyvozuje z obecně kladného soudu „všechna A
jsou B“ obecně kladný soud „všechna B jsou A“. Z toho, že všichni chirurgové jsou lékaři,
by tak plynulo, že všichni lékaři jsou chirurgové. Tradiční logika přesně vymezuje, které
soudy obrátit lze: obecně záporný soud („žádné A není B“) a částečně kladný soud („některá A
jsou B“) se obracejí platně, protože vztah mezi oběma třídami je v nich souměrný; obecně kladný
soud lze obrátit nanejvýš omezeně na „některá B jsou A“ a částečně záporný soud nelze obrátit
vůbec (Copi, Cohen a McMahon 2014).

Klam má tedy několik podob, které spojuje jedna domněnka: že vztah zahrnutí platí oběma
směry. Vedle obrácení obecně kladného soudu je to obrácení částečně záporného soudu („některé
ryby nejsou žraloci, tedy někteří žraloci nejsou ryby“), obrácení podmínky („když p, pak q“
čtené jako „když q, pak p“) a v jazyce čísel záměna pravděpodobnosti B za podmínky A s
pravděpodobností A za podmínky B. Mill řadil chyby v obracení soudů mezi klamy úsudku, tedy
mezi vady, které vznikají až při vyvozování, a ne při pozorování nebo zobecňování (Mill 1843).

## Původ a souvislosti

Pravidla obracení soudů jsou součástí aristotelské sylogistiky od jejího počátku a v
logických učebnicích se z ní dědí jako samostatná kapitola o bezprostředních úsudcích.
Whately je v devatenáctém století vykládal jako součást základů logiky, na nichž teprve stojí
nauka o sylogismu a o klamech (Whately 1826). Aristotelés v O sofistických důkazech vysvětloval
klam důsledku tím, že lidé pokládají vztah následku za obratitelný: když je med žlutý, zdá se
jim, že žluté je medem. Hamblin tento klam probírá v rozboru Aristotelova výčtu jako jeden z
klamů, které nezávisejí na jazyce (Hamblin 1970). Nedovolená konverze a
[potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) jsou
tak historicky dvě tváře téhož omylu.

Mill nevykládal chybné obracení soudů jako pouhé školní cvičení. Zařadil ho do soustavné
klasifikace klamů, která měla postihnout zdroje chybných závěrů v uvažování vůbec, od
pozorování přes zobecňování až po samotné vyvozování (Mill 1843). Moderní logika přidala další rozlišení. Podle booleovského výkladu
obecné soudy netvrdí existenci prvků své třídy, a omezené obrácení obecně kladného soudu na
„některá B jsou A“ proto platí jen za předpokladu, že třída A není prázdná (Copi, Cohen a
McMahon 2014). Zde se klam stýká s [existenčním klamem](@/kompendium/argumentacni-fauly/formalni/existencni-klam.md).

## Struktura argumentu

Základní podoba: Všechna A jsou B. Tedy všechna B jsou A. Protipříklad stejné stavby stačí
jediný: všichni psi jsou savci, ale ne všichni savci jsou psi. Nauka o rozložení termínů
vysvětluje, proč obrácení selhává. V obecně kladném soudu je přísudek nerozložený, výrok o
něm nic neříká o celé třídě B. Po obrácení se B stává podmětem obecného soudu a je rozložený,
takže závěr tvrdí o celé třídě víc, než premisa obsahovala (Copi, Cohen a McMahon 2014). Jde o
tutéž vadu, kterou v sylogismu popisují
[nedovolený větší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md)
a [nedovolený menší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-mensi-termin.md).

Ve větách s podmínkou má klam podobu obrácení implikace: z pravidla „kdo má horečku, je
nemocný“ se usuzuje „kdo je nemocný, má horečku“. Ve větách o pravděpodobnosti se zaměňuje
podíl nemocných mezi lidmi s pozitivním testem s podílem pozitivních testů mezi nemocnými.
Gigerenzer ukazuje, že tato záměna je při čtení výsledků lékařských testů obvyklá a že ji
zmenšuje převedení pravděpodobností na přirozené četnosti, tedy počty lidí z konkrétního
souboru (Gigerenzer 2002). V soudní síni má podobu
[klamu žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md): pravděpodobnost
shody stop u nevinného člověka se vydává za pravděpodobnost, že obžalovaný je nevinen
(Thompson a Schumann 1987).

Platné bezprostřední úsudky, s nimiž se klam snadno plete, jsou tři. Obrácení obecně
záporného a částečně kladného soudu, převrácení kvality (obverze), které z „všechna A jsou B“
dělá „žádné A není ne-B“, a obměna (kontrapozice), podle níž z „všechna A jsou B“ plyne „všechna
ne-B jsou ne-A“. Obměna je u obecně kladného soudu platná, obrácení nikoli (Copi, Cohen a
McMahon 2014). Kdo chce zachovat směr usuzování od B zpět k A, má tedy platnou cestu jen přes
negaci: co není B, není ani A.

## Detekční znaky

Prvním znakem je, že závěr obsahuje tytéž dva pojmy jako premisa, jen v obráceném pořadí, a
mezi nimi chybí jakýkoli doklad pro druhý směr. Druhým znakem je přechod od popisu skupiny k
jejímu rozpoznávacímu znaku: z „všichni pachatelé měli rys X“ se stává „rys X prozrazuje
pachatele“. Takový posun vychází vstříc úsudku podle reprezentativnosti, při němž se
pravděpodobnost odhaduje podle podobnosti s typickým případem a zanedbává se, jak častý je
daný rys v celé populaci (Tversky a Kahneman 1974). Na stejném místě se klam potkává se
[zanedbáním základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md).

Třetím znakem je funkce obrácené věty. Pokud z ní vyplývá podezření vůči celé skupině lidí,
kteří s pachateli sdílejí neškodný rys, slouží obrácení k nálepkování. Kniha popisuje, jak se
takové zobecnění o skupinách stává součástí propagandy, v kapitole o
[politické a ideologické epistemické anihilaci](@/kompendium/07-teoreticke-reflexe/politicka-ea.md);
logická stránka je přitom prostá: z toho, že všichni A mají rys B, nelze nic říci o tom, kolik
nositelů rysu B patří k A (Copi, Cohen a McMahon 2014). Čtvrtým znakem jsou čísla bez
jmenovatele. Věta „devět z deseti zadržených mělo u sebe hotovost“ se v dalším kroku čte jako
„kdo má u sebe hotovost, je z devadesáti procent pachatel“, ačkoli k tomu by bylo třeba znát,
kolik lidí s hotovostí zadrženo nebylo (Gigerenzer 2002).

Pátým znakem je jazyková dvojznačnost spony „je“. Věta „velryby jsou savci“ vyjadřuje zahrnutí
jedné třídy do druhé, kdežto věta „čtverec je pravoúhelník se stejně dlouhými stranami“ vyjadřuje
definici, tedy totožnost obou tříd. Definice se obrátit dá, zahrnutí ne, a kdo obě věty čte
stejně, obrací i to, co obrátit nelze (Copi, Cohen a McMahon 2014).

## Odlišení od platné argumentace

Obrácení je platné u obecně záporných a částečně kladných soudů, u definic a u výroků, které
jsou výslovně oboustranné („právě tehdy, když“). Platný je také úsudek, který obrácenou větu
nevyvozuje, ale samostatně dokládá: pokud se zjistí, že všichni nositelé rysu B skutečně
patří do třídy A, je to nové zjištění, ne důsledek premisy. Pragma-dialektická rekonstrukce
pomáhá tyto případy oddělit tím, že hledá nevyslovenou premisu, která by úsudek učinila
platným. Zde by to byla věta „rys B mají jen A“ a ta se dá přímo posoudit (van Eemeren a
Grootendorst 1992).

Ani diagnostické usuzování od rysu k příčině není samo o sobě klamem. Lékař, který z příznaku
usuzuje na nemoc, postupuje oprávněně, pokud zná, jak často se příznak vyskytuje u nemocných i
u zdravých, a závěr podává jako pravděpodobný. Bayesovský přístup k neformálním argumentům
ukazuje, že síla takového úsudku závisí na výchozí pravděpodobnosti a na tom, jak dobře doklad
rozlišuje mezi hypotézami, a ne na samotné formě věty (Hahn a Oaksford 2007). Klamem se úsudek
stává tehdy, když se tvrdí jako jistý a když se o četnosti rysu mimo třídu A nic neví.

## Stav poznání

Nejlépe je doložena pravděpodobnostní podoba klamu. Gigerenzer shrnuje výzkum, v němž lékaři
i laici při čtení výsledků testů zaměňovali podmíněné pravděpodobnosti, a ukazuje, že podání
v přirozených četnostech podíl správných odpovědí výrazně zvyšuje (Gigerenzer 2002). Thompson a
Schumann popsali, jak se při výkladu statistických důkazů v trestním řízení objevuje záměna
pravděpodobnosti shody s pravděpodobností viny i chyba opačného směru, a zkoumali, jak takové
argumenty hodnotí laičtí posuzovatelé (Thompson a Schumann 1987). Tversky a Kahneman doložili,
že úsudek podle reprezentativnosti soustavně zanedbává výchozí četnosti (Tversky a Kahneman
1974).

U sylogistické podoby je doklad nepřímý. Kahneman popisuje, že velká část studentů přijímá
neplatný sylogismus, má-li věrohodný závěr, protože intuitivní myšlení hodnotí spíš
přijatelnost závěru než stavbu úsudku (Kahneman 2011). Stanovich a West ukázali, že se lidé
v úlohách na logické a pravděpodobnostní uvažování soustavně liší a že tyto rozdíly souvisejí
s kognitivními schopnostmi i se sklonem myšlení (Stanovich a West 2000). Výzkum, který by
četnost samotné nedovolené konverze v běžné řeči měřil, kniha ve své bibliografii nemá;
přesné míry výskytu proto neuvádí.

## Obrana a odpověď

Nejjednodušší odpovědí je obrácenou větu vyslovit a zkusit ji na protipříkladu stejné stavby:
„všichni psi jsou savci“ ukazuje, že z obecně kladného soudu nelze obrátit pořadí pojmů.
Druhou odpovědí je otázka po druhém směru: kolik nositelů rysu B do třídy A nepatří? Teprve
odpověď na ni říká, zda rys může sloužit jako znak (Copi, Cohen a McMahon 2014). Kde jde o
čísla, pomáhá přepsat procenta do počtů lidí z jednoho souboru, protože v přirozených
četnostech je rozdíl mezi oběma směry vidět na první pohled (Gigerenzer 2002).

V institucích, které z profilu pachatelů odvozují pravidla pro všechny, je obranou trvat na
údaji o falešně pozitivních případech: kolik lidí by nové pravidlo postihlo neprávem. U
člověka, kterému okolí vykládá, že jeho neškodný rys z něj dělá podezřelého, je obranou
pojmenovat obrácení a vrátit spor k tomu, co bylo skutečně zjištěno. Výzkum dezinformací
dokládá, že předem poznaná struktura zavádějícího argumentu snižuje jeho vliv i v nové podobě
(Cook, Lewandowsky a Ecker 2017).

## Literatura

- Cook, J., Lewandowsky, S., & Ecker, U. K. H. (2017). Neutralizing misinformation through inoculation: Exposing misleading argumentation techniques reduces their influence. *PLoS ONE*, 12(5), e0175799.
- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. New York: Simon & Schuster.
- Hahn, U., & Oaksford, M. (2007). The rationality of informal argumentation: A Bayesian approach to reasoning fallacies. *Psychological Review*, 114(3), 704–732.
- Hamblin, C. L. (1970). *Fallacies*. London: Methuen.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Stanovich, K. E., & West, R. F. (2000). Individual differences in reasoning: Implications for the rationality debate? *Behavioral and Brain Sciences*, 23(5), 645–665.
- Thompson, W. C., & Schumann, E. L. (1987). Interpretation of statistical evidence in criminal trials: The prosecutor's fallacy and the defense attorney's fallacy. *Law and Human Behavior*, 11(3), 167–187.
- Tversky, A., & Kahneman, D. (1974). Judgment under uncertainty: Heuristics and biases. *Science*, 185(4157), 1124–1131.
- Whately, R. (1826). *Elements of Logic*. London: J. Mawman.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Potvrzení důsledku](@/kompendium/argumentacni-fauly/formalni/potvrzeni-dusledku.md) – příbuzné heslo (Formální klamy, Affirming the consequent)
- [Nedovolený větší termín](@/kompendium/argumentacni-fauly/formalni/nedovoleny-vetsi-termin.md) – příbuzné heslo (Formální klamy, Illicit major)
- [Existenční klam](@/kompendium/argumentacni-fauly/formalni/existencni-klam.md) – příbuzné heslo (Formální klamy, Existential fallacy)
- [Zanedbání základní míry](@/kompendium/argumentacni-fauly/statisticke/zanedbani-zakladni-miry.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Base-rate neglect)
- [Klam žalobce](@/kompendium/argumentacni-fauly/statisticke/klam-zalobce.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Prosecutor's fallacy)

**V kompendiu**

- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-7.3.2 Tversky a Kahneman: Heuristiky](@/kompendium/techniques/ea-7-3-2-tversky-heuristics.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.8 Politická a ideologická EA — totalitní systémy, propaganda, populismus](@/kompendium/07-teoreticke-reflexe/politicka-ea.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Kladný závěr ze záporné premisy](@/kompendium/argumentacni-fauly/formalni/kladny-zaver-ze-zaporne-premisy.md) – předchozí heslo rodiny

<!-- kompendium:katalog-vazby:end -->
