+++
title = "Sladění hlasu a tempa"
description = "Sladění hlasu a tempa v NLP: přizpůsobení výšky, hlasitosti a rychlosti řeči druhému, vztah k přirozené akomodaci řeči a znaky vlivového užití."
weight = 6
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-raport-a-kalibrace", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Sladění hlasu a tempa", "Voice and tempo matching", "vokální zrcadlení", "matching hlasu", "Raport a kalibrace", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-18.06"
catalog_slug = "sladeni-hlasu-a-tempa"
catalog_family = "raport-a-kalibrace"
catalog_family_code = "18"
catalog_family_title = "Raport a kalibrace"
catalog_family_en = "Rapport and calibration"
catalog_part = "raport-a-kalibrace"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Voice and tempo matching"
catalog_aliases = ["vokální zrcadlení", "matching hlasu"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "zrcadleni"
catalog_narrower = []
catalog_depth = 3
catalog_ancestors = ["zrcadleni", "pacing-a-leading", "pacing-a-leading-pojem"]
catalog_related = ["auditivni-system", "analogove-znaceni", "auditivni-kotvy", "auditivni-submodality", "shoda-predikatu", "sladeni-dechu", "konverzacni-hypnoza", "nlp-v-prodeji"]
catalog_related_declared = ["shoda-predikatu", "auditivni-kotvy", "konverzacni-hypnoza", "nlp-v-prodeji"]
catalog_kompendium = ["kompendium/techniques/ea-1-4-1-prosodicka-dominance.md", "kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md", "kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md", "kompendium/nlp-vzorce/raport-a-kalibrace/shoda-predikatu.md", "kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/_index.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-prodeji.md", "kompendium/techniques/ea-1-4-1-prosodicka-dominance.md", "kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md"]
catalog_prev = "sladeni-dechu"
catalog_next = "zpetne-shrnuti"
catalog_position = 6
catalog_family_size = 16
catalog_sources = ["bandler-grinder-1975b", "bandler-grinder-1979", "chartrand-bargh-1999", "cialdini-2009", "druckman-swets-1988", "grinder-bandler-1981", "heap-1988", "herman-1992", "oconnor-seymour-1990", "rogers-1951", "satir-1972", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975b", "bandler-grinder-1979", "grinder-bandler-1981", "oconnor-seymour-1990"]
catalog_sources_roots = ["satir-1972"]
catalog_sources_critical = ["chartrand-bargh-1999", "cialdini-2009", "druckman-swets-1988", "heap-1988", "herman-1992", "rogers-1951", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/raport-a-kalibrace.toml"
+++

# Sladění hlasu a tempa

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-18.06` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Voice and tempo matching |
| **Jiné názvy** | vokální zrcadlení, matching hlasu |
| **Obecnější heslo** | [Zrcadlení](@/kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Sladění hlasu a tempa je vzorec neurolingvistického programování, při němž mluvčí
přizpůsobuje vlastní hlasový projev hlasovému projevu druhého člověka: rychlost řeči,
hlasitost, výšku a melodii hlasu, rytmus vět, délku pauz a někdy i charakteristické
zabarvení. NLP ho řadí mezi prostředky [zrcadlení](@/kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md)
a zdůrazňuje, že je zvlášť užitečný tam, kde druhého nevidíme, například v telefonickém
rozhovoru (Bandler a Grinder 1979; O'Connor a Seymour 1990). Vzorec stojí na předpokladu, že
lidé vnímají jako srozumitelnější a sympatičtější ty, kdo mluví podobně jako oni, a že
po vytvoření hlasové shody lze druhého vést, například zpomalením řeči k uklidnění nebo
zrychlením k větší aktivitě. Pro kompendium je vzorec zajímavý tím, že se týká kanálu,
který je ve vlivových kontextech velmi rozšířený, zejména v telefonickém prodeji a
podvodech, a jehož účinky na pocit důvěry jsou sice reálné, ale v NLP přeceňované.

## Původ a souvislosti

Bandler a Grinder si všímali, že terapeuti, které modelovali, přizpůsobovali hlas a tempo
klientům, a že Erickson cíleně měnil tempo, hlasitost a důraz své řeči podle toho, jak
pacient reagoval (Bandler a Grinder 1975b). V knize o hypnóze pro širší publikum popsali
změny tempa a tónu hlasu jako prostředek, kterým se provází zkušenost klienta a kterým se
vede jeho pozornost (Grinder a Bandler 1981). Tradice Satirové, ze které NLP také čerpalo,
kladla důraz na soulad mezi slovy a hlasem a na to, že nesoulad mezi nimi narušuje
komunikaci v rodině (Satir 1972). Z těchto zdrojů vznikl v NLP obecný návod hlasového
ladění, který se rozšířil do školení telefonického prodeje a zákaznické péče.

Jev, na který vzorec navazuje, je dobře známý mimo NLP. Sociolingvistika popisuje, že lidé
v rozhovoru spontánně sbližují svůj řečový styl, včetně tempa a hlasitosti, s partnerem,
pokud o vztah stojí, a vzdalují ho, pokud se chtějí odlišit; tento jev se označuje jako
akomodace řeči. Sociální psychologie ukázala obecnější sklon k bezděčnému napodobování v
rozhovoru a jeho vazbu na sympatie (Chartrand a Bargh 1999). Tyto poznatky ukazují, že
hlasová shoda má v komunikaci skutečnou funkci. Neříkají však nic o tom, zda ji lze vědomě
vyrobit tak, aby přinášela tvrzený vlivový účinek.

## Struktura vzorce

Strukturálně má vzorec tři složky. První je naslouchání prozodii druhého, tedy tomu, jak
mluví, nikoli co říká: zda mluví rychle nebo pomalu, hlasitě nebo tiše, s velkými nebo
malými výkyvy melodie, s dlouhými nebo krátkými pauzami. Druhá je přizpůsobení vlastního
projevu, které má být podle NLP pozvolné a nepřesné, aby nepůsobilo jako napodobování nebo
parodie. Třetí je vedení: mluvčí po čase mění vlastní tempo a hlas a sleduje, zda ho druhý
následuje, a tento přechod NLP považuje za test raportu (Bandler a Grinder 1979). Vzorec je
tedy hlasovou podobou obecného schématu [pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md)
a často se kombinuje s verbální [shodou predikátů](@/kompendium/nlp-vzorce/raport-a-kalibrace/shoda-predikatu.md).

Pozorovatel by měl rozlišit dva směry, kterými se hlas v rozhovoru používá. Hlasová shoda
vytváří dojem podobnosti a rovnosti. Hlasová dominance, kterou kompendium rozebírá u
[prosodické dominance](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md), naopak
vytváří dojem autority a potlačuje [kritické otázky](@/kompendium/argumentacni-fauly/teorie-argumentace/argumentacni-schemata.md). Ve vlivových sekvencích se oba směry
střídají: nejprve shoda, která sníží ostražitost, potom změna tónu, která nastolí vedení. V
hypnotickém kontextu se k tomu přidává zvýraznění některých slov tónem nebo pauzou, jímž se
z věty vyčleňuje skryté sdělení; katalog tyto jazykové prostředky popisuje v rodině
[Vliv a zneužití NLP](@/kompendium/nlp-vzorce/vliv-a-zneuziti/_index.md).

## Detekční znaky

Vzorec se pozná podle toho, že se hlas a tempo mluvčího v průběhu rozhovoru nápadně mění a
že změny sledují váš projev: když zpomalíte, zpomalí i on, když ztišíte hlas, ztiší ho
také. U telefonního prodejce se může stát, že na začátku hovoru mluví rychle a energicky, a
po prvních větách volaného přejde do jeho tempa, například výrazně zpomalí u staršího
člověka. Takové přizpůsobení samo o sobě není podezřelé, protože srozumitelnost je
legitimní cíl. Varovné je jeho spojení s dalšími znaky: mluvčí zdůrazňuje podobnost
(„mluvíme stejně“, „jsme na stejné vlně“), přejímá vaše výrazy a vedení přichází v podobě
změny tónu, po které následuje žádost.

Dalším znakem je zvýrazňování jednotlivých slov, které neodpovídá běžnému důrazu věty, a
pauzy, po nichž následuje sugestivní obrat. Kompendium tento mechanismus spojuje s
[latentní emocionální modulací](@/kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md),
kde se hlasem navozuje emoční stav, který má ovlivnit úsudek. U člověka, vůči němuž byl
vzorec použit, se po hovoru objevuje pocit, že se s volajícím „hned našel“, a zároveň
neschopnost vybavit si, jaké konkrétní informace o nabídce dostal. Tento rozpor mezi silou
dojmu a chudostí obsahu je jedním z nejspolehlivějších vodítek (Cialdini 2009).

## Legitimní a manipulativní užití

Legitimní užití je každodenní součástí dobré komunikace. Lékař, který zpomalí řeč u
pacienta pod vlivem šoku, učitel, který ztiší hlas, aby zklidnil třídu, nebo úřednice, která
mluví pomaleji se starším klientem, přizpůsobují hlas srozumitelnosti a pohodě druhého. Pro
pomáhající profese je přizpůsobení tempa součástí empatického postoje, v němž terapeut
vnímá prožívání klienta a dává mu najevo porozumění (Rogers 1951). Rozhodující je, že
přizpůsobení slouží porozumění a že se o něm dá mluvit: kdo zpomalí a řekne „promiňte,
mluvím asi moc rychle“, nic neskrývá.

Manipulativní užití staví hlasovou shodu na začátek vlivové sekvence. Typickým prostředím
je telefonický prodej a telefonické podvody, kde podvodník přizpůsobí hlas a tempo volanému,
vytvoří dojem známého nebo spřízněného hlasu a teprve potom přejde k nátlaku. Literatura o
vlivu popisuje, že pocit podobnosti a sympatie snižuje ostražitost vůči obsahu žádosti
(Cialdini 2009). Riziko je vyšší u lidí, kteří jsou osamělí nebo kteří mají sníženou
schopnost posoudit obsah nabídky, protože u nich pocit vlídného a podobného hlasu snadno
nahradí ověření. Katalog popisuje tyto podoby i v hesle [NLP v prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-prodeji.md).

## Stav důkazů

Pro obecný jev, že lidé v rozhovoru spontánně sbližují řečový styl a že shoda souvisí s
pocitem plynulé interakce, existují doklady z výzkumu napodobování a koordinace
(Chartrand a Bargh 1999). Pro specifické tvrzení NLP, že záměrné sladění hlasu a tempa
spolehlivě vytváří raport, který lze využít k vedení, chybějí kontrolované studie. Hodnocení
NLP z konce osmdesátých let nenašla doklady pro tvrzenou účinnost technik oboru při
ovlivňování lidí (Druckman a Swets 1988; Heap 1988), a pozdější přehledy upozorňují, že
techniky NLP byly testovány jen výjimečně a s převážně negativními výsledky (Witkowski 2010).
Vztah mezi hlasem a vnímanou důvěryhodností je ve výzkumu řeči a komunikace sledován
samostatně, ale jeho výsledky neověřují model NLP a nelze je za jeho potvrzení vydávat. Čtenář
by tedy měl rozlišit skutečný vliv hlasu na první dojem od tvrzení kurzů, že hlasová shoda
je klíčem k důvěře kohokoli.

## Obrana a zotavení

Obrana stojí na oddělení dojmu z hlasu od obsahu sdělení. Po telefonickém nebo osobním
rozhovoru, ve kterém se objevila nabídka, je užitečné zapsat si, jaké konkrétní informace
zazněly, a posoudit je bez vzpomínky na to, jak příjemně zněly. Pokud si člověk nedokáže
vybavit podstatné údaje, je to signál, že rozhodnutí stálo na dojmu. Druhou obranou je
pravidlo nikdy nerozhodovat v hovoru, který inicioval druhý, a vždy si vyžádat písemné
podklady a čas na rozmyšlenou (Cialdini 2009). Třetí obranou, zejména pro seniory a jejich
rodiny, je domluvit si předem, že o penězích a smlouvách se po telefonu nerozhoduje a že
se každá taková nabídka probere s blízkým člověkem.

Zotavení po podvodu, ve kterém hlasová shoda hrála roli, bývá spojeno s pocitem studu a s
přesvědčením, že „to přece muselo být poznat“. Je užitečné vysvětlit, že reakce na vlídný a
podobný hlas je hluboce lidská a že podvodníci ji vědomě využívají. Odpovědnost nese ten,
kdo podvod spáchal, a ne ten, kdo reagoval na projev, který je v běžném životě znakem
důvěry (Herman 1992).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1975b). *Patterns of the Hypnotic Techniques of Milton H. Erickson, M.D., Volume 1*. Cupertino: Meta Publications.
- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Chartrand, T. L., & Bargh, J. A. (1999). The chameleon effect: The perception–behavior link and social interaction. *Journal of Personality and Social Psychology*, 76(6), 893–910.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Grinder, J., & Bandler, R. (1981). *Trance-formations: Neuro-Linguistic Programming and the Structure of Hypnosis*. Moab: Real People Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Satir, V. (1972). *Peoplemaking*. Palo Alto: Science and Behavior Books.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Zrcadlení](@/kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Auditivní reprezentační systém](@/kompendium/nlp-vzorce/zakladni-pojmy/auditivni-system.md) – příbuzné heslo (Základní pojmy NLP, Auditory representational system)
- [Analogové značení](@/kompendium/nlp-vzorce/milton-model/analogove-znaceni.md) – příbuzné heslo (Milton-model, Analogue marking)
- [Auditivní a tonální kotvy](@/kompendium/nlp-vzorce/kotveni/auditivni-kotvy.md) – příbuzné heslo (Kotvení, Auditory and tonal anchors)
- [Auditivní submodality](@/kompendium/nlp-vzorce/submodality/auditivni-submodality.md) – příbuzné heslo (Submodality, Auditory submodalities)
- [Shoda predikátů](@/kompendium/nlp-vzorce/raport-a-kalibrace/shoda-predikatu.md) – příbuzné heslo (Raport a kalibrace, Predicate matching)
- [Sladění dechu](@/kompendium/nlp-vzorce/raport-a-kalibrace/sladeni-dechu.md) – příbuzné heslo (Raport a kalibrace, Breathing matching)
- [Konverzační hypnóza](@/kompendium/nlp-vzorce/vliv-a-zneuziti/konverzacni-hypnoza.md) – příbuzné heslo (Vliv a zneužití NLP, Conversational (covert) hypnosis)
- [NLP v prodeji](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-v-prodeji.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in sales)

**V kompendiu**

- [EA-1.4.1 Prosodická dominance](@/kompendium/techniques/ea-1-4-1-prosodicka-dominance.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.4.2 Latentní emocionální modulace](@/kompendium/techniques/ea-1-4-2-latentni-emocionalni-modulace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Sladění dechu](@/kompendium/nlp-vzorce/raport-a-kalibrace/sladeni-dechu.md) – předchozí heslo rodiny
- [Zpětné shrnutí](@/kompendium/nlp-vzorce/raport-a-kalibrace/zpetne-shrnuti.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
