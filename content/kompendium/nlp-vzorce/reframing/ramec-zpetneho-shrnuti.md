+++
title = "Rámec zpětného shrnutí"
description = "Rámec, který rozhovor shrnuje slovy druhé strany a ověřuje porozumění: jak odlišit věrnou rekapitulaci od shrnutí, které výpověď nenápadně přepisuje."
weight = 9
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-reframing", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Rámec zpětného shrnutí", "Backtrack frame", "backtrack", "rámec rekapitulace", "Reframing a rámce", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-08.09"
nlp_slug = "ramec-zpetneho-shrnuti"
nlp_family = "reframing"
nlp_family_code = "08"
nlp_family_title = "Reframing a rámce"
nlp_family_en = "Reframing and frames"
nlp_part = "reframing"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Backtrack frame"
nlp_aliases = ["backtrack", "rámec rekapitulace"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "ramec-pojem"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["ramec-pojem"]
nlp_related = ["kalibrace", "raport", "presupozice-ve-vyslechu", "ramec-souhlasu", "vyzva-k-relevanci", "otevreny-ramec", "dodatecne-ramcovani", "zpetne-shrnuti"]
nlp_related_declared = ["zpetne-shrnuti", "ramec-souhlasu", "kalibrace", "raport", "presupozice-ve-vyslechu"]
nlp_kompendium = ["kompendium/techniques/ea-2-3-3-quote-mining.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md", "kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-preferovaneho-systemu.md", "kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md", "kompendium/nlp-vzorce/raport-a-kalibrace/zpetne-shrnuti.md", "kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md", "kompendium/techniques/ea-2-3-3-quote-mining.md", "kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md"]
nlp_prev = "ramec-ekologie"
nlp_next = "kontrastni-ramec"
nlp_position = 9
nlp_family_size = 17
nlp_sources = ["chartrand-bargh-1999", "grice-1975", "herman-1992", "levinson-1983", "loftus-palmer-1974", "miller-rollnick-2013", "oconnor-seymour-1990", "rogers-1951", "sharpley-1984", "tosey-mathison-2009", "witkowski-2010"]
nlp_sources_primary = ["oconnor-seymour-1990"]
nlp_sources_roots = ["grice-1975", "levinson-1983"]
nlp_sources_critical = ["chartrand-bargh-1999", "herman-1992", "loftus-palmer-1974", "miller-rollnick-2013", "rogers-1951", "sharpley-1984", "tosey-mathison-2009", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Varianty", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/reframing.toml"
+++

# Rámec zpětného shrnutí

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-08.09` |
| **Rodina** | [Reframing a rámce](@/kompendium/nlp-vzorce/reframing/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Backtrack frame |
| **Jiné názvy** | backtrack, rámec rekapitulace |
| **Obecnější vzorec** | [Rámec](@/kompendium/nlp-vzorce/zakladni-pojmy/ramec-pojem.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Rámec zpětného shrnutí je konverzační vzorec, při kterém mluvčí zrekapituluje, co druhá
strana řekla, pokud možno jejími vlastními klíčovými slovy, a teprve potom pokračuje. Používá
se k ověření porozumění, k obnovení rozhovoru po přerušení, k uzavření části jednání nebo k
přechodu k dalšímu tématu. V literatuře NLP patří k základním konverzačním rámcům a
zdůrazňuje se u něj, že má zachovávat slova mluvčího, nikoli je nahrazovat výrazy
shrnujícího, protože každé přeložení do vlastních slov s sebou nese i vlastní výklad
(O'Connor a Seymour 1990). Vzorec úzce souvisí s technikou
[zpětného shrnutí](@/kompendium/nlp-vzorce/raport-a-kalibrace/zpetne-shrnuti.md) při budování
raportu. Pro kompendium je důležitý dvojím způsobem. Věrné shrnutí je jedním z nejlepších
nástrojů proti nedorozumění a proti tomu, aby se výpověď někoho přepsala. Shrnutí, které se
tváří jako věrné, ale vybírá, přeskupuje a přidává, je naopak jedním z nejnenápadnějších
způsobů, jak výpověď přepsat a nechat ji druhou stranou potvrdit.

## Původ a souvislosti

Shrnování a odrážení výpovědi klienta má kořeny v psychoterapii zaměřené na klienta. Rogers
popisoval reflexi, tedy vracení obsahu a citového zabarvení toho, co klient sdělil, jako
způsob, jímž terapeut projevuje porozumění a zároveň klientovi umožňuje slyšet sám sebe
(Rogers 1951). Motivační rozhovory tuto dovednost rozvinuly a rozlišují různé druhy shrnutí,
která sbírají, propojují nebo uzavírají to, co klient řekl; zároveň přiznávají, že výběr
toho, co se do shrnutí dostane, je sám formou vedení rozhovoru (Miller a Rollnick 2013). NLP
převzalo tyto postupy a spojilo je s důrazem na doslovné opakování klíčových slov, které má
podle jeho tvrzení udržovat raport, protože posluchač slyší svůj vlastní jazyk (O'Connor a
Seymour 1990). Výzkum mimiky a nápodoby v sociální interakci ukázal, že nenápadné
napodobování druhého zvyšuje vzájemnou sympatii a plynulost rozhovoru (Chartrand a Bargh
1999); verbální shoda může působit podobně. Teorie konverzace vysvětluje, proč shrnutí
působí tak přesvědčivě: posluchač předpokládá, že partner v rozhovoru spolupracuje a že jeho
rekapitulace je pravdivá a úplná, pokud nic nenaznačuje opak (Grice 1975).

## Struktura vzorce

Struktura rámce má tři prvky. Prvním je výchozí výpověď, delší nebo kratší úsek toho, co
druhá strana řekla. Druhým je rekapitulace, která z výpovědi vybírá body a vrací je, ideálně
s klíčovými slovy mluvčího. Třetím je ověřovací otázka nebo pauza, v níž může mluvčí shrnutí
potvrdit nebo opravit, a navazující krok rozhovoru. Pro analýzu je rozhodující vztah mezi
výpovědí a rekapitulací. Věrné shrnutí zachovává výběr i pořadí důležitých bodů, nepřidává
nic, co nezaznělo, a zve k opravě. Zkreslující shrnutí pracuje třemi operacemi. První je
výběr: některé body se vypustí, jiné zdůrazní. Druhou je náhrada: slovo mluvčího se nahradí
slovem s jiným zabarvením, například „pohádali jsme se“ slovem „vyprovokovala jsem ho“.
Třetí je vložení: do shrnutí se přidá předpoklad nebo detail, který mluvčí neřekl. Výzkum
paměti ukázal, že i drobná změna slova v otázce dokáže změnit, co si člověk o události
později vybaví (Loftus a Palmer 1974), a pragmatika jazyka popisuje, jak předpoklady
vložené do věty přecházejí do společného základu rozhovoru, aniž by byly výslovně tvrzeny
(Levinson 1983). Ověřovací otázka „je to tak?“ pak nezve k opravě, ale k potvrzení.

## Detekční znaky

Zkreslující zpětné shrnutí se pozná porovnáním s výpovědí. Signálem je, když shrnutí obsahuje
slova, která mluvčí nepoužil, zejména slova hodnotící, zmírňující nebo přesouvající
odpovědnost. Dalším znakem je, že se shrnutí opakuje častěji, než by porozumění
vyžadovalo, a pokaždé o něco víc posouvá obraz. Typická je i forma uzavřené otázky na
konci („je to tak?“, „souhlasíte?“), která očekává jen potvrzení, často doprovázená tempem,
jež nenechává čas na rozmyšlenou. V institucionálních situacích se zkreslující shrnutí
objevuje v zápisech z porad, v protokolech o výpovědích nebo v „rekapitulaci dohody“ na konci
jednání, kde se do dohody dostanou body, které nikdo výslovně nepřijal. V kompendiu se
příbuzným jevem zabývá stránka o [těžbě citátů](@/kompendium/techniques/ea-2-3-3-quote-mining.md),
kde se z výroků vybírají části, které změní jejich smysl, a stránka o
[vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md).
Ve vyšetřovacím kontextu se vzorec spojuje s otázkami s presupozicí, které kompendium
popisuje u [presupozic ve výslechu](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md).
U člověka, jehož výpověď byla takto shrnuta, se často objevuje nejasný pocit, že
„to tak úplně neřekl“, který však nedokáže pojmenovat. Tento pocit bývá oslaben tím, že
shrnutí přichází v přívětivém tónu a s opakováním jeho vlastních slov, která mu dávají
zdání věrnosti; nápodoba řeči druhého totiž zvyšuje sympatii a důvěru v rozhovoru
(Chartrand a Bargh 1999). Kdo posuzuje záznam rozhovoru zpětně, má proto porovnávat
shrnutí s doslovným zněním výpovědi, nikoli jen s tím, zda ho mluvčí potvrdil, protože
formulace, kterou člověk slyší, může podle výzkumu paměti ovlivnit i jeho vlastní
pozdější vybavení události (Loftus a Palmer 1974).

## Varianty

Rámec se vyskytuje v několika podobách, které se liší rozsahem a funkcí. Krátké shrnutí
jedné výpovědi slouží ověření porozumění. Průběžné shrnutí v delším jednání sbírá body, na
nichž se strany shodly, a odděluje je od bodů sporných. Závěrečné shrnutí uzavírá jednání a
často se stává podkladem pro zápis nebo dohodu. Riziko zkreslení roste s rozsahem a s
důsledky: v závěrečném shrnutí, které se promítne do písemného záznamu, má každé nahrazené
slovo větší váhu než v krátké ověřovací rekapitulaci (Miller a Rollnick 2013).

## Legitimní a manipulativní užití

Legitimní užití je základní dovedností v mediaci, poradenství, terapii i v profesionálně
vedeném výslechu. Mediátor, který shrne požadavky obou stran jejich slovy a výslovně je
požádá o opravu, snižuje riziko nedorozumění a dává stranám pocit, že byly slyšeny. Terapeut,
který klientovi vrací jeho slova, mu pomáhá slyšet vlastní myšlenky a opravit je (Rogers
1951). Legitimní užití má tyto znaky: zachovává slova a důrazy mluvčího, odlišuje vlastní
výklad od rekapitulace („shrnu, co jsem slyšel, a pak řeknu, co si o tom myslím“), zve k
opravě a opravu přijímá. Manipulativní užití tyto znaky obrací. Výklad se vydává za
rekapitulaci, slova se nahrazují a oprava se odbývá („to je jen formulace“). V obchodním
jednání slouží ke konstrukci souhlasu, ve vztazích k přepisování historie sporu a ve
výslechu k vytvoření protokolu, který lépe odpovídá hypotéze vyšetřovatele než výpovědi.
Hraničním případem je dobře míněné shrnutí, které výpověď nevědomky zjednoduší; i tam je
důležité, aby mluvčí měl prostor ho opravit, protože jeho potvrzení může mít později váhu.

## Stav důkazů

Rámec zpětného shrnutí jako technika NLP nebyl samostatně zkoumán a obecné přehledy výzkumu
NLP pro jeho specifický přínos nenacházejí doklady (Witkowski 2010; Tosey a Mathison 2009).
Tvrzení NLP, že doslovné opakování klíčových slov vytváří raport silněji než shrnutí vlastními
slovy, nebylo kontrolovaně ověřeno; [výzkum shody predikátů](@/kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-preferovaneho-systemu.md), který se blízkou otázkou
zabýval, vyzněl pro NLP převážně negativně (Sharpley 1984). Lépe podložené jsou příbuzné
poznatky mimo NLP: reflexe a shrnování jsou součástí terapeutických přístupů s vlastní
výzkumnou literaturou (Miller a Rollnick 2013), nápodoba zvyšuje sympatii (Chartrand a Bargh
1999) a formulace otázek ovlivňuje paměť (Loftus a Palmer 1974). Z toho vyplývá, že rizika
zkreslujícího shrnutí jsou empiricky lépe doložena než přínosy jeho věrné podoby v podání
NLP.

## Obrana a zotavení

Nejúčinnější obranou je shrnutí porovnat s tím, co člověk skutečně řekl, a opravit každé
nahrazené slovo, i když se oprava zdá malicherná. Potvrzení cizího shrnutí může mít později
váhu vlastní výpovědi. Užitečné je požádat o doslovný záznam, zejména u výpovědí, zápisů a
dohod, a nepodepisovat protokol, který obsahuje formulace, jež člověk nepoužil. U
uzavřených otázek „je to tak?“ je legitimní odpovědět „ne úplně“ a shrnutí vlastními slovy
zopakovat. V organizacích pomáhá zavést pravidlo, že zápis z jednání rozesílá a schvaluje
každý účastník. Ve vztazích, kde se historie sporů opakovaně přepisuje zkreslujícími
rekapitulacemi, pomáhá vést si vlastní záznamy událostí, které nezávisí na tom, jak je
popisuje druhá strana. Herman popisuje, že obnova schopnosti vyprávět vlastní příběh
vlastními slovy je součástí zotavení po zkušenosti, kdy člověku byla jeho zkušenost upírána
(Herman 1992). Kompendium se této práci věnuje u
[narativní rekonstrukce](@/kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md).
Odborník, který zpětné shrnutí používá, může jeho poctivost zajistit tím, že odděluje
rekapitulaci od vlastního výkladu, výslovně zve k opravě a do záznamu zapisuje i to, co
mluvčí opravil.

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Chartrand, T. L., & Bargh, J. A. (1999). The chameleon effect: The perception–behavior link and social interaction. *Journal of Personality and Social Psychology*, 76(6), 893–910.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Sharpley, C. F. (1984). Predicate matching in NLP: A review of research on the preferred representational system. *Journal of Counseling Psychology*, 31(2), 238–248.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Reframing a rámce](@/kompendium/nlp-vzorce/reframing/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Rámec](@/kompendium/nlp-vzorce/zakladni-pojmy/ramec-pojem.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) – příbuzný vzorec (Základní pojmy NLP, Calibration)
- [Raport](@/kompendium/nlp-vzorce/zakladni-pojmy/raport.md) – příbuzný vzorec (Základní pojmy NLP, Rapport)
- [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) – příbuzný vzorec (Jazykové presupozice, Presuppositions in questioning and testimony)
- [Rámec souhlasu](@/kompendium/nlp-vzorce/reframing/ramec-souhlasu.md) – příbuzný vzorec (Reframing a rámce, Agreement frame)
- [Výzva k relevanci](@/kompendium/nlp-vzorce/reframing/vyzva-k-relevanci.md) – příbuzný vzorec (Reframing a rámce, Relevancy challenge)
- [Otevřený rámec](@/kompendium/nlp-vzorce/reframing/otevreny-ramec.md) – příbuzný vzorec (Reframing a rámce, Open frame)
- [Dodatečné rámcování](@/kompendium/nlp-vzorce/reframing/dodatecne-ramcovani.md) – příbuzný vzorec (Reframing a rámce, Post-framing)
- [Zpětné shrnutí](@/kompendium/nlp-vzorce/raport-a-kalibrace/zpetne-shrnuti.md) – příbuzný vzorec (Raport a kalibrace, Backtracking)

**V kompendiu**

- [EA-2.3.3 Těžba citátů (quote mining)](@/kompendium/techniques/ea-2-3-3-quote-mining.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-2.1.9 Vytváření pseudokonsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-6.3.6 Narativní rekonstrukce](@/kompendium/techniques/ea-6-3-6-narrativni-rekonstrukce.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Rámec ekologie](@/kompendium/nlp-vzorce/reframing/ramec-ekologie.md) – předchozí vzorec rodiny
- [Kontrastní rámec](@/kompendium/nlp-vzorce/reframing/kontrastni-ramec.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
