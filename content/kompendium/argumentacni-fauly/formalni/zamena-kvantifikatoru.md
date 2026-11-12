+++
title = "Záměna kvantifikátorů"
description = "Formální klam, který z „každý má nějaké“ dělá „existuje jedno pro všechny“: jak záměna pořadí kvantifikátorů živí výklady o jediném původci a jak ji rozpoznat."
weight = 11
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-formalni", "fauly-formalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Záměna kvantifikátorů", "Quantifier shift", "záměna pořadí kvantifikátorů", "klam posunu kvantifikátoru", "Formální klamy", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-01.11"
catalog_slug = "zamena-kvantifikatoru"
catalog_family = "formalni"
catalog_family_code = "01"
catalog_family_title = "Formální klamy"
catalog_family_en = "Formal fallacies"
catalog_part = "formalni.b"
catalog_type = "formal"
catalog_type_cs = "formální klam"
catalog_en = "Quantifier shift"
catalog_aliases = ["záměna pořadí kvantifikátorů", "klam posunu kvantifikátoru"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "formalni-klam"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["formalni-klam"]
catalog_related = ["existencni-klam", "klam-modalniho-rozsahu", "texasky-strelec", "amfibolie", "klam-skladani", "univerzalni-kvantifikator", "rozsahova-dvojznacnost"]
catalog_related_declared = ["univerzalni-kvantifikator", "rozsahova-dvojznacnost", "klam-skladani", "klam-modalniho-rozsahu", "texasky-strelec"]
catalog_kompendium = ["kompendium/07-teoreticke-reflexe/politicka-ea.md", "kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/07-teoreticke-reflexe/politicka-ea.md", "kompendium/argumentacni-fauly/kauzalni/jedina-pricina.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md", "kompendium/nlp-vzorce/milton-model/rozsahova-dvojznacnost.md"]
catalog_prev = "vylucujici-premisy"
catalog_next = "klam-modalniho-rozsahu"
catalog_position = 11
catalog_family_size = 16
catalog_sources = ["bandler-grinder-1975", "cook-lewandowsky-ecker-2017", "copi-cohen-mcmahon-2014", "gilovich-1991", "kahneman-2011", "popper-1959", "tversky-kahneman-1983", "walton-1995", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004", "van-der-linden-2023"]
catalog_sources_primary = ["bandler-grinder-1975", "copi-cohen-mcmahon-2014", "walton-1995", "eemeren-grootendorst-1992", "eemeren-grootendorst-2004"]
catalog_sources_roots = ["popper-1959"]
catalog_sources_critical = ["cook-lewandowsky-ecker-2017", "gilovich-1991", "kahneman-2011", "tversky-kahneman-1983", "van-der-linden-2023"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Obrana a odpověď"]
catalog_review = "agent"
catalog_data = "data/fauly/formalni.b.toml"
+++

# Záměna kvantifikátorů

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-01.11` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) |
| **Druh** | formální klam |
| **Anglicky** | Quantifier shift |
| **Jiné názvy** | záměna pořadí kvantifikátorů, klam posunu kvantifikátoru |
| **Obecnější heslo** | [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | střední |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Záměna kvantifikátorů je neplatný úsudek, který obrací pořadí obecného a existenčního
kvantifikátoru. Z výroku „pro každé x existuje nějaké y, k němuž má x vztah R“ vyvozuje
výrok „existuje jedno y, k němuž má vztah R každé x“. Příklad z učebnic predikátové logiky
je prostý: z toho, že každý člověk má matku, neplyne, že existuje jedna žena, která je
matkou všech lidí. První výrok připouští, že ke každému x patří jiné y; druhý tvrdí jediné
y společné všem. Opačný směr je platný: pokud existuje jedno y společné všem, pak samozřejmě
každé x nějaké y má. Predikátová logika rozlišuje obě formy právě pořadím kvantifikátorů a
ukazuje, že vícenásobně obecné výroky nelze bez ztráty smyslu číst libovolně (Copi, Cohen a
McMahon 2014).

V běžném jazyce se kvantifikátory nevyjadřují symboly, ale slovy jako „každý“, „někdo“,
„nějaký“, „vždy“ a „jeden“; učebnice logiky proto věnují zvláštní pozornost převodu takových
slov do symbolického zápisu (Copi, Cohen a McMahon 2014). Pořadí, v jakém se mají číst, často neurčuje
slovosled. Proto
je klam snadno přehlédnutelný a proto má v kompendiu místo: z věty, která tvrdí rozptýlenou
rozmanitost příčin, dělá větu o jediné skryté příčině.

## Původ a souvislosti

Sylogistika Aristotelova typu pracovala s jediným kvantifikátorem v každé větě a vícenásobně
obecné výroky neuměla přesně zachytit. Teprve logika, kterou koncem devatenáctého století
založil Gottlob Frege, zavedla kvantifikátory s proměnnými a umožnila zapsat, že „každý
někoho miluje“ a „někdo je milován všemi“ jsou různé výroky (Copi, Cohen a McMahon 2014).
Ve filozofii se výtka záměny kvantifikátorů objevuje u některých verzí kosmologického
argumentu: z toho, že každá událost má nějakou příčinu, nelze bez dalšího vyvodit, že
existuje jedna příčina všech událostí. Tato kritika nevyvrací kosmologický argument jako
celek, ale ukazuje, že jeden z jeho kroků potřebuje samostatné zdůvodnění.

Teorie argumentace řadí záměnu kvantifikátorů mezi formální vady, které se v praxi obvykle
neobjevují v čisté podobě. Walton zdůrazňuje, že posuzování klamu vyžaduje rekonstrukci
argumentu v kontextu dialogu, protože tatáž věta může v jednom rozhovoru znamenat
deduktivní tvrzení a v jiném jen podnět k hledání společné příčiny (Walton 1995). Rozlišení
je zásadní: hypotéza o společném původci je legitimní, jakmile se nabízí k ověření; klamem
se stává tehdy, když se vydává za důsledek toho, že každá událost měla nějakého původce.

## Struktura argumentu

Formálně: ∀x ∃y R(x, y), tedy ∃y ∀x R(x, y). Protipříklad stačí jeden: každé číslo má číslo
větší, ale neexistuje číslo větší než všechna čísla. Premisa je pravdivá, závěr nepravdivý.
Pragma-dialektická rekonstrukce by u takového argumentu hledala nevyslovenou premisu, která
by úsudek učinila platným. Zde by to byla věta „případy, z nichž každý má nějakého původce,
mají jednoho společného původce“. Jakmile se vysloví, lze ji přímo posoudit a obvykle
odmítnout (van Eemeren a Grootendorst 1992). Rekonstrukce tak převádí formální vadu na
obsahovou otázku, o které rozhodují podklady, a ne dojem z formulace.

V přirozeném jazyce má klam několik obvyklých podob. Kauzální: „každá krize měla někoho,
kdo z ní měl prospěch, tedy za všemi krizemi stojí jedna skupina“. Organizační: „každé
selhání mělo nějakou příčinu, tedy existuje jedna kořenová příčina, kterou stačí odstranit“.
Personální: „každý z incidentů zavinil někdo z oddělení, tedy je v oddělení jeden viník“.
Normativní: „pro každý problém existuje řešení, tedy existuje řešení všech problémů“, často
s nabídkou, že ho mluvčí zná. Ve všech případech se z rozptýleného tvrzení „ke každému
nějaké“ stává soustředěné tvrzení „jedno ke všem“. Všechny tyto podoby vycházejí vstříc sklonu
vidět ve shlucích událostí společnou příčinu i tam, kde jde o náhodu (Gilovich 1991).

Jazyková stránka souvisí s tím, co katalog NLP popisuje jako
[rozsahovou dvojznačnost](@/kompendium/nlp-vzorce/milton-model/rozsahova-dvojznacnost.md):
věta připouští dvojí čtení podle toho, jak daleko sahá působnost slova. U záměny
kvantifikátorů je tato dvojznačnost mezi „každý“ a „nějaký“, a posluchač, který si vybere
silnější čtení, má dojem, že slyšel důkaz. S meta-modelem NLP sdílí klam i zájem o
[univerzální kvantifikátory](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md),
tedy o slova typu „všichni“ a „vždy“, jejichž rozsah je v rozhovoru nejasný; [meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) je
uvádí jako zobecnění, které vymazává výjimky z mluvčího modelu světa (Bandler a Grinder 1975).

## Detekční znaky

Hlavním znakem je přechod od množného k jednotnému: série jednotlivých případů, každý se
svým vysvětlením, se v závěru shrne pod jedno jméno, jednu skupinu nebo jednu příčinu. Takové shrnutí působí
přesvědčivě, protože intuitivní myšlení dává přednost soudržnému příběhu a neúplnost podkladů
nevnímá (Kahneman 2011). Druhým
znakem je, že společný prvek v premisách doložen není; doložena je jen existence nějakého
prvku v každém případě zvlášť. Třetím znakem je funkce závěru: jediný původce je často
pojmenován jako nepřítel, [jediná příčina](@/kompendium/argumentacni-fauly/kauzalni/jedina-pricina.md) jako něco, co lze jedním zásahem odstranit, a
jediné řešení jako něco, co nabízí mluvčí. Kniha popisuje, jak se takové výklady stávají
součástí propagandy a politické mobilizace, v kapitole o
[politické a ideologické epistemické anihilaci](@/kompendium/07-teoreticke-reflexe/politicka-ea.md).

Čtvrtým znakem je imunita vůči rozdílům. Pokud se ukáže, že jednotlivé případy měly zjevně
různé původce, mluvčí neopustí závěr, ale rozšíří jediného původce tak, aby zahrnul všechny
(„všichni jsou s nimi propojeni“). Takové rozšiřování činí tvrzení nevyvratitelným, což
Popper považoval za znak teorie, která přestala riskovat (Popper 1959).

## Odlišení od platné argumentace

Úsudek o společném prvku je platný, pokud je společný prvek doložen přímo: všechny vzorky
prošly jednou plnicí linkou, všechny incidenty se staly za směny téhož člověka, všechny
dokumenty podepsal tentýž úředník. Pak tvrzení „existuje jedno y pro všechna x“ není
odvozeno, ale zjištěno, a hledání v tomto místě je rozumné. Rozumná je i hypotéza o společné
příčině, která se předkládá jako hypotéza a je otevřena testování: když se několik incidentů
podobá, je legitimní se ptát, zda nemají společný zdroj, a pak to ověřit. Hypotéza má
empirickou hodnotu právě tím, že ji lze podrobit zkoušce, která ji může vyvrátit (Popper
1959).

Rozdíl je tedy v epistemickém postavení závěru. Klam vydává jedinou příčinu za důsledek
premis; platný postup ji vydává za možnost, kterou je třeba prověřit. Teorie kritické
diskuse tento rozdíl vyjadřuje pravidlem, že argument předložený jako závazný musí být
platný, kdežto argument předložený jako pravděpodobný musí být posouzen podle vhodného
argumentačního schématu (van Eemeren a Grootendorst 2004).

## Stav poznání

Výzkum lidského usuzování podporuje předpoklad, že záměna kvantifikátorů má psychologickou
oporu. Gilovich popsal, že lidé vidí řád a souvislost i v náhodných datech a že náhodné
shluky událostí bývají vykládány jako výsledek společné příčiny (Gilovich 1991). Kahneman
shrnuje, že rychlé intuitivní myšlení samovolně hledá za událostmi příčiny a úmysly a
vytváří z nich soudržný příběh, aniž by se ptalo, zda jsou podklady úplné (Kahneman 2011).
Tversky a Kahneman ukázali, že intuitivní úsudek soustavně porušuje pravidla extenzionální
logiky, je-li příběh reprezentativní (Tversky a Kahneman 1983). Jediný původce všech krizí
je příběh, který tyto sklony uspokojuje lépe než rozptýlená skutečnost mnoha nezávislých
příčin. Kniha přitom nezná výzkum, který by záměnu kvantifikátorů jako logický tvar
samostatně měřil v konspiračním uvažování; souvislost je interpretací obecnějších zjištění.
Výzkum dezinformací naproti tomu dokládá, že předem poznaná struktura zavádějícího argumentu
snižuje jeho vliv (Cook, Lewandowsky a Ecker 2017).

## Obrana a odpověď

Odpovědí je rozepsat argument na jednotlivé případy a u každého se zeptat, kdo nebo co ho
způsobilo podle dostupných podkladů. Pokud vyjdou různé odpovědi, závěr o jediném původci z
premis neplyne a musí se doložit samostatně. Pokud vyjde u všech stejná odpověď, je to
zjištění, ne závěr z kvantifikátorů, a lze s ním dál pracovat. Pomáhá také formální
protipříklad stejné stavby, například „každý člověk má matku“, který ukazuje, že pořadí
„každý – nějaký“ nelze obrátit (Copi, Cohen a McMahon 2014).

V organizacích, které hledají příčiny selhání, je užitečné držet otevřenou možnost více
příčin, dokud ji data nevyloučí; nabídka jediné kořenové příčiny je přitažlivá, protože slibuje
jednoduchý zásah. U člověka, který se ocitá v prostředí, jež mu vykládá svět pomocí jediného
skrytého nepřítele, je obranou vracet se ke konkrétním událostem a k jejich jednotlivým
vysvětlením a vyhledávat zdroje, které na výkladu skupiny nezávisejí. Psychologické očkování
proti dezinformacím stojí právě na tom, že se člověk předem seznámí se strukturou
zavádějícího argumentu a pak ji pozná i v nové podobě (van der Linden 2023).

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Cook, J., Lewandowsky, S., & Ecker, U. K. H. (2017). Neutralizing misinformation through inoculation: Exposing misleading argumentation techniques reduces their influence. *PLoS ONE*, 12(5), e0175799.
- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Popper, K. R. (1959). *The Logic of Scientific Discovery*. London: Hutchinson.
- Tversky, A., & Kahneman, D. (1983). Extensional versus intuitive reasoning: The conjunction fallacy in probability judgment. *Psychological Review*, 90(4), 293–315.
- Walton, D. N. (1995). *A Pragmatic Theory of Fallacy*. Tuscaloosa: University of Alabama Press.
- van Eemeren, F. H., & Grootendorst, R. (1992). *Argumentation, Communication, and Fallacies: A Pragma-Dialectical Perspective*. Hillsdale: Lawrence Erlbaum.
- van Eemeren, F. H., & Grootendorst, R. (2004). *A Systematic Theory of Argumentation: The Pragma-Dialectical Approach*. Cambridge: Cambridge University Press.
- van der Linden, S. (2023). *Foolproof: Why Misinformation Infects Our Minds and How to Build Immunity*. London: 4th Estate.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Formální klamy](@/kompendium/argumentacni-fauly/formalni/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Formální klam](@/kompendium/argumentacni-fauly/formalni/formalni-klam.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Existenční klam](@/kompendium/argumentacni-fauly/formalni/existencni-klam.md) – příbuzné heslo (Formální klamy, Existential fallacy)
- [Klam modálního rozsahu](@/kompendium/argumentacni-fauly/formalni/klam-modalniho-rozsahu.md) – příbuzné heslo (Formální klamy, Modal scope fallacy)
- [Texaský střelec](@/kompendium/argumentacni-fauly/kauzalni/texasky-strelec.md) – příbuzné heslo (Kauzální klamy, Texas sharpshooter)
- [Amfibolie](@/kompendium/argumentacni-fauly/jazykove-klamy/amfibolie.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Amphiboly)
- [Klam skládání](@/kompendium/argumentacni-fauly/jazykove-klamy/klam-skladani.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Fallacy of composition)
- [Univerzální kvantifikátor](@/kompendium/nlp-vzorce/meta-model/univerzalni-kvantifikator.md) – příbuzné heslo (NLP vzorce: Meta-model, Universal quantifier)
- [Rozsahová dvojznačnost](@/kompendium/nlp-vzorce/milton-model/rozsahova-dvojznacnost.md) – příbuzné heslo (NLP vzorce: Milton-model, Scope ambiguity)

**V kompendiu**

- [7.8 Politická a ideologická EA — totalitní systémy, propaganda, populismus](@/kompendium/07-teoreticke-reflexe/politicka-ea.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-5.1.5 Logická diskontinuita](@/kompendium/techniques/ea-5-1-5-logicka-diskontinuita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Vylučující premisy](@/kompendium/argumentacni-fauly/formalni/vylucujici-premisy.md) – předchozí heslo rodiny
- [Klam modálního rozsahu](@/kompendium/argumentacni-fauly/formalni/klam-modalniho-rozsahu.md) – další heslo rodiny

<!-- kompendium:katalog-vazby:end -->
