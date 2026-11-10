+++
title = "Shoda predikátů"
description = "Shoda predikátů v NLP: přejímání smyslových slov druhého k vytvoření raportu, proč je to nejlépe testovaný a nepotvrzený předpoklad oboru."
weight = 4
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-raport-a-kalibrace", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
parent = "kompendium-nlp-vzorce-raport-a-kalibrace"
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Shoda predikátů", "Predicate matching", "sladění smyslových predikátů", "predicate tracking", "Raport a kalibrace", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-18.04"
nlp_slug = "shoda-predikatu"
nlp_family = "raport-a-kalibrace"
nlp_family_code = "18"
nlp_family_title = "Raport a kalibrace"
nlp_family_en = "Rapport and calibration"
nlp_part = "raport-a-kalibrace"
nlp_type = "pattern"
nlp_type_cs = "vzorec"
nlp_en = "Predicate matching"
nlp_aliases = ["sladění smyslových predikátů", "predicate tracking"]
nlp_use = "dvoji"
nlp_use_cs = "terapeutické i vlivové"
nlp_risk = "nizke"
nlp_risk_cs = "nízké"
nlp_broader = "pacing-a-leading"
nlp_narrower = []
nlp_depth = 2
nlp_ancestors = ["pacing-a-leading", "pacing-a-leading-pojem"]
nlp_related = ["reprezentacni-systemy", "preferovany-reprezentacni-system", "predikaty", "metaprogramy-v-marketingu", "sladeni-hlasu-a-tempa", "zpetne-shrnuti", "vyzkum-preferovaneho-systemu"]
nlp_related_declared = ["predikaty", "preferovany-reprezentacni-system", "reprezentacni-systemy", "vyzkum-preferovaneho-systemu", "metaprogramy-v-marketingu"]
nlp_kompendium = ["kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md", "kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md"]
nlp_links_prose = ["kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md", "kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-preferovaneho-systemu.md", "kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md", "kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md", "kompendium/nlp-vzorce/zakladni-pojmy/predikaty.md", "kompendium/nlp-vzorce/zakladni-pojmy/preferovany-reprezentacni-system.md", "kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md", "kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md"]
nlp_prev = "pacing-a-leading"
nlp_next = "sladeni-dechu"
nlp_position = 4
nlp_family_size = 16
nlp_sources = ["bandler-grinder-1979", "grinder-bandler-1976", "heap-1988", "lakoff-johnson-1980", "miller-rollnick-2013", "oconnor-seymour-1990", "passmore-rowson-2019", "rogers-1951", "sharpley-1984", "sharpley-1987", "tosey-mathison-2009", "witkowski-2010"]
nlp_sources_primary = ["bandler-grinder-1979", "grinder-bandler-1976", "oconnor-seymour-1990"]
nlp_sources_roots = []
nlp_sources_critical = ["heap-1988", "lakoff-johnson-1980", "miller-rollnick-2013", "passmore-rowson-2019", "rogers-1951", "sharpley-1984", "sharpley-1987", "tosey-mathison-2009", "witkowski-2010"]
nlp_citations = 16
nlp_words = 1161
nlp_reading_minutes = 6
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/raport-a-kalibrace.toml"
+++

# Shoda predikátů

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-18.04` |
| **Rodina** | [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Predicate matching |
| **Jiné názvy** | sladění smyslových predikátů, predicate tracking |
| **Obecnější vzorec** | [Pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | nízké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Shoda predikátů je vzorec neurolingvistického programování, při němž mluvčí přizpůsobuje
svou řeč smyslovým slovům, která používá druhý člověk. Predikáty se v NLP rozumějí slovesa,
přídavná jména a příslovce, jež podle oboru prozrazují, který smyslový kanál člověk při
myšlení právě používá: zrakové výrazy jako „vidím“, „jasné“, „z tohoto úhlu“, sluchové jako
„slyším“, „zní to dobře“, „ladí to“, a pocitové jako „cítím“, „uchopit“, „těžké“ (Bandler a Grinder 1979).
Kdo mluví převážně zrakovými výrazy, má podle NLP preferovat vizuální
[reprezentační systém](@/kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md), a
kdo s ním chce navázat raport, má odpovídat také zrakovými výrazy. Vzorec je tak verbální
obdobou [zrcadlení](@/kompendium/nlp-vzorce/raport-a-kalibrace/zrcadleni.md) a součástí
širšího schématu provázení a vedení. Pro kompendium má heslo zvláštní význam: shoda predikátů
je jedním z mála tvrzení NLP, která byla soustavně testována, a výsledky jsou proto dobrým
měřítkem, jak s tvrzeními oboru zacházet.

## Původ a souvislosti

Model reprezentačních systémů představili Grinder a Bandler v druhém dílu své knihy o
struktuře magie, kde tvrdili, že lidé organizují zkušenost ve smyslových kanálech a že
jazyk, kterým o ní mluví, tyto kanály odráží (Grinder a Bandler 1976). V seminářích z konce
sedmdesátých let z toho odvodili praktický závěr, že terapeut, který odpovídá klientovi v
jeho smyslovém systému, dosáhne rychleji porozumění, a naopak nesoulad predikátů vysvětlovali
jako běžnou příčinu nedorozumění mezi partnery, rodiči a dětmi nebo terapeutem a klientem
(Bandler a Grinder 1979). Pojem predikátů a model preferovaného systému popisuje katalog v
heslech [predikáty](@/kompendium/nlp-vzorce/zakladni-pojmy/predikaty.md) a
[preferovaný reprezentační systém](@/kompendium/nlp-vzorce/zakladni-pojmy/preferovany-reprezentacni-system.md).

Myšlenka, že slovník řečníka něco prozrazuje o jeho myšlení, má starší filozofické a
lingvistické souvislosti. Kognitivní lingvistika ukázala, že běžný jazyk je prostoupen
metaforami, které čerpají z tělesné a smyslové zkušenosti, například chápat znamená
„vidět“ a rozumět myšlence znamená ji „uchopit“ (Lakoff a Johnson 1980). Z této perspektivy
smyslová slova v řeči nemusí prozrazovat preferovaný kanál jednotlivce, ale spíše obecné
konvence jazyka, které sdílejí všichni mluvčí. Tento rozdíl je pro hodnocení vzorce
podstatný a v NLP se zpravidla nereflektuje. V učebnicích pro manažery a prodejce se shoda
predikátů stala jednou z nejrozšířenějších „technik“ oboru (O'Connor a Seymour 1990).

## Struktura vzorce

Vzorec má dvě části. První je diagnóza: mluvčí naslouchá smyslovým slovům druhého a z nich
usuzuje, který smyslový kanál druhý preferuje, nebo alespoň právě používá. Druhá je
přizpůsobení: mluvčí volí slova téhož smyslového kanálu, popřípadě přebírá doslova obraty
druhého. Pokročilejší podoba má v pozdějších fázích rozhovoru přejít k „překladu“, kdy
mluvčí převádí sdělení z jednoho smyslového kanálu do jiného, například když prostředníkuje
mezi dvěma lidmi, z nichž jeden prý „vidí“ a druhý „cítí“ (Bandler a Grinder 1979). Celek
je verbální podobou provázení, po němž má následovat vedení, a v tomto smyslu ho katalog
řadí pod obecnější vzorec [pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md).

Pro pozorovatele je užitečné rozlišit dvě věci, které se pod názvem vzorce mísí. Přejímání
slov druhého, aby se ověřilo porozumění, je běžná a dobře doložená součást aktivního
naslouchání; nevyžaduje žádnou teorii smyslových systémů. Typologie lidí podle predikátů je
naproti tomu specifické tvrzení NLP, podle kterého lze z několika slov rozpoznat „vizuální
typ“ nebo „kinestetický typ“ a na tomto základě s člověkem jednat. Právě tato typologie je
nositelem manipulativního rizika. Umožňuje mluvčímu vystupovat jako ten, kdo druhého
prohlédl, a nálepka typu snadno nahradí skutečné naslouchání.

## Detekční znaky

Vzorec se pozná podle toho, že mluvčí neobvykle často opakuje smyslová slova, která předtím
použil druhý, a podle nápadné jednotvárnosti jeho slovníku: všechno se najednou „ukazuje“,
„vidí“ a „rýsuje“, nebo naopak „cítí“, „uchopuje“ a „sedí“. Silnějším znakem je výslovné
zařazení do typu: „Vy jste vizuální typ“, „jste kinestetik, potřebujete si to osahat“. Takový
výrok má podobu diagnózy, ale stojí na několika slovech a na teorii, která nebyla potvrzena.
Ve vlivovém kontextu se k typologii zpravidla připojuje tvrzení, že nabídka je „šitá na míru“
smyslovému typu druhého, což má posílit dojem, že je pro něj vhodná.

Ve firemním prostředí se vzorec objevuje ve školeních prodeje a v hodnocení zaměstnanců,
kde se smyslový typ uvádí jako vlastnost osobnosti. Tam, kde se typologie stává podkladem
pro rozhodování o lidech, například o tom, jak s někým jednat nebo kam ho zařadit, je
důležité připomenout, že výzkum ji nepodpořil (Sharpley 1984). Ve vztazích se vzorec
někdy objevuje v podobě, kdy jeden partner vysvětluje nedorozumění „nekompatibilitou
smyslových systémů“, a tím přesouvá konflikt z obsahu na domnělou vlastnost druhého.

## Legitimní a manipulativní užití

Legitimní užití je přejímání slov druhého s cílem porozumět mu. Když klient řekne, že mu
situace „nesedí“, a terapeut se zeptá, co přesně mu nesedí, používá jeho výraz, aby se
nepřesunul do vlastního rámce. Takové užití odpovídá pojetí empatického naslouchání, v
němž terapeut zrcadlí prožívání klienta jeho vlastními slovy (Rogers 1951), a motivačním
rozhovorům, kde se reflexe klientových výroků považuje za jádro rozhovoru (Miller a Rollnick 2013).
Kompendium tyto přístupy shrnuje v přehledu [terapeutických přístupů](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md).
Legitimní užití nepotřebuje typologii a nezakládá na ní žádné závěry.

Manipulativní užití spojuje přizpůsobení slovníku s typologií a s nabídkou. Mluvčí se
staví do role toho, kdo druhého „čte“, a zároveň podává nabídku jako přizpůsobenou jeho
typu. Riziko vzorce je nízké, pokud jde o samotný jazykový vliv, protože výzkum nenašel,
že by shoda predikátů výrazně zvyšovala důvěru. Vyšší je riziko epistemické: typologie dává
mluvčímu zdánlivou autoritu nad tím, jak druhý myslí, a selhání vzorce lze vždy vysvětlit
tím, že byl typ „špatně určen“. Kompendium tento mechanismus popisuje obecně jako
[imunizaci proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md).

## Stav důkazů

Shoda predikátů patří k nejlépe testovaným předpokladům NLP, a výsledky jsou nepříznivé.
Sharpley shrnul studie, které zkoumaly, zda lze preferovaný smyslový systém
spolehlivě určit, a zda shoda predikátů zlepšuje vnímanou
důvěru a porozumění v poradenském rozhovoru; většina studií předpoklady nepodpořila
(Sharpley 1984). Na námitky zastánců NLP, že výzkum nebyl proveden správně, odpověděl, že
pokud tvrzení oboru nelze testovat žádným dostupným způsobem, stává se problémem jejich
netestovatelnost (Sharpley 1987). Heap ve svém hodnocení dospěl ke stejnému závěru, že pro
model preferovaného systému a z něj odvozenou shodu predikátů chybí empirická podpora
(Heap 1988). Pozdější přehledy výzkumu NLP tento závěr nezměnily (Witkowski 2010; Passmore a Rowson 2019).
Katalog výzkum podrobněji popisuje v hesle [výzkum preferovaného reprezentačního systému](@/kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-preferovaneho-systemu.md).
Platí přitom rozlišení: nepotvrzena je typologie a tvrzený zvláštní účinek shody
predikátů, nikoli obecná užitečnost toho, když člověk naslouchá a ověřuje porozumění slovy
druhého.

## Obrana a zotavení

Obrana proti vzorci je jednoduchá, protože jeho manipulativní část stojí na nedoložené
typologii. Když někdo prohlásí, že je člověk „vizuální typ“, a vyvozuje z toho, jak s ním
jednat nebo co mu vyhovuje, je legitimní se zeptat, z čeho to usuzuje, a připomenout, že
výzkum takovou typologii nepotvrdil (Sharpley 1984). Druhou obranou je posuzovat nabídku
podle obsahu: podmínky, čísla, rizika a alternativy zůstávají stejné bez ohledu na to, zda
jsou podány „v obrazech“ nebo „v pocitech“. Třetí obranou, užitečnou ve vztazích i v
pracovních týmech, je odmítnout vysvětlování konfliktů domnělou smyslovou nekompatibilitou
a vrátit se k tomu, o čem se skutečně nesouhlasí.

Zotavení v pravém smyslu vzorec většinou nevyžaduje, protože jeho přímé účinky jsou malé.
Výjimkou jsou situace, kdy se typologie stala součástí identity člověka, například ve
skupinách, které NLP používají jako životní filozofii, nebo v pracovním prostředí, kde se
podle ní rozhodovalo o lidech. Tam je užitečné vysvětlit, jaký je stav výzkumu, a pomoci
člověku oddělit skutečné rysy vlastního myšlení od nálepky, kterou převzal (Tosey a Mathison 2009).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Grinder, J., & Bandler, R. (1976). *The Structure of Magic II: A Book about Communication and Change*. Palo Alto: Science and Behavior Books.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Lakoff, G., & Johnson, M. (1980). *Metaphors We Live By*. Chicago: University of Chicago Press.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Sharpley, C. F. (1984). Predicate matching in NLP: A review of research on the preferred representational system. *Journal of Counseling Psychology*, 31(2), 238–248.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Reprezentační systémy](@/kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md) – příbuzný vzorec (Základní pojmy NLP, Representational systems)
- [Preferovaný reprezentační systém](@/kompendium/nlp-vzorce/zakladni-pojmy/preferovany-reprezentacni-system.md) – příbuzný vzorec (Základní pojmy NLP, Preferred representational system)
- [Predikáty](@/kompendium/nlp-vzorce/zakladni-pojmy/predikaty.md) – příbuzný vzorec (Základní pojmy NLP, Predicates)
- [Metaprogramy v marketingu](@/kompendium/nlp-vzorce/metaprogramy/metaprogramy-v-marketingu.md) – příbuzný vzorec (Metaprogramy, Meta-programs in marketing)
- [Sladění hlasu a tempa](@/kompendium/nlp-vzorce/raport-a-kalibrace/sladeni-hlasu-a-tempa.md) – příbuzný vzorec (Raport a kalibrace, Voice and tempo matching)
- [Zpětné shrnutí](@/kompendium/nlp-vzorce/raport-a-kalibrace/zpetne-shrnuti.md) – příbuzný vzorec (Raport a kalibrace, Backtracking)
- [Výzkum preferovaného reprezentačního systému](@/kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-preferovaneho-systemu.md) – příbuzný vzorec (Kritické hodnocení NLP, Research on the preferred representational system)

**V kompendiu**

- [EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [6.3 Terapeutické přístupy — přehled](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md) – předchozí vzorec rodiny
- [Sladění dechu](@/kompendium/nlp-vzorce/raport-a-kalibrace/sladeni-dechu.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
