+++
title = "Zpětné shrnutí"
description = "Zpětné shrnutí v NLP: opakování klíčových slov druhého k ověření porozumění i k řízení rozhovoru; jak poznat selektivní shrnutí vedoucí k cizímu závěru."
weight = 7
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-raport-a-kalibrace", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Zpětné shrnutí", "Backtracking", "backtrack", "zpětné zrcadlení slov", "Raport a kalibrace", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-18.07"
catalog_slug = "zpetne-shrnuti"
catalog_family = "raport-a-kalibrace"
catalog_family_code = "18"
catalog_family_title = "Raport a kalibrace"
catalog_family_en = "Rapport and calibration"
catalog_part = "raport-a-kalibrace"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Backtracking"
catalog_aliases = ["backtrack", "zpětné zrcadlení slov"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "nizke"
catalog_risk_cs = "nízké"
catalog_broader = "pacing-a-leading"
catalog_narrower = []
catalog_depth = 2
catalog_ancestors = ["pacing-a-leading", "pacing-a-leading-pojem"]
catalog_related = ["hierarchie-otazek-meta-modelu", "ano-sada", "ramec-souhlasu", "ramec-zpetneho-shrnuti", "shoda-predikatu", "pseudoempatie", "nlp-ve-vyslechu"]
catalog_related_declared = ["ramec-zpetneho-shrnuti", "ramec-souhlasu", "ano-sada", "shoda-predikatu", "nlp-ve-vyslechu"]
catalog_kompendium = ["kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md", "kompendium/techniques/ea-6-1-1-screening-strukturalni-rozhovor.md", "kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md", "kompendium/nlp-vzorce/reframing/ramec-zpetneho-shrnuti.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-ve-vyslechu.md", "kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md", "kompendium/techniques/ea-6-1-1-screening-strukturalni-rozhovor.md"]
catalog_prev = "sladeni-hlasu-a-tempa"
catalog_next = "kalibrace-ano-ne"
catalog_position = 7
catalog_family_size = 16
catalog_sources = ["bandler-grinder-1979", "cialdini-2009", "dilts-delozier-2000", "festinger-1957", "herman-1992", "loftus-palmer-1974", "miller-rollnick-2013", "oconnor-seymour-1990", "passmore-rowson-2019", "rogers-1951", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1979", "dilts-delozier-2000", "oconnor-seymour-1990"]
catalog_sources_roots = []
catalog_sources_critical = ["cialdini-2009", "festinger-1957", "herman-1992", "loftus-palmer-1974", "miller-rollnick-2013", "passmore-rowson-2019", "rogers-1951", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/raport-a-kalibrace.toml"
+++

# Zpětné shrnutí

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-18.07` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Backtracking |
| **Jiné názvy** | backtrack, zpětné zrcadlení slov |
| **Obecnější heslo** | [Pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | nízké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Zpětné shrnutí, anglicky backtracking, je vzorec neurolingvistického programování, při
němž mluvčí zopakuje nebo shrne, co druhý řekl, a to pokud možno jeho vlastními slovy,
včetně klíčových výrazů, intonace a smyslových predikátů. NLP vzorec chápe jako verbální
podobu provázení: druhý slyší, že byl vyslechnut, a podle oboru tím vzniká raport, na který
lze navázat (O'Connor a Seymour 1990). Ve slovníku NLP se pojem používá ve dvou rovinách.
Na rovině jednotlivé výpovědi jde o přesné zopakování klíčových slov. Na rovině celého
rozhovoru jde o rámec, v němž se na začátku nebo na konci jednání shrne, na čem se
dosud ustálilo, a z toho se vychází dál; tento rámec katalog popisuje v hesle
[rámec zpětného shrnutí](@/kompendium/nlp-vzorce/reframing/ramec-zpetneho-shrnuti.md)
(Dilts a DeLozier 2000). Pro kompendium je vzorec důležitý tím, že se jeho legitimní
podoba téměř neliší od dobře doloženého aktivního naslouchání, kdežto manipulativní
podoba spočívá v nenápadném výběru a přeskupení slov druhého.

## Původ a souvislosti

Opakování a shrnutí výroků klienta má v psychoterapii dlouhou tradici, starší než NLP.
Rogers popsal reflexi klientových sdělení jako prostředek, kterým terapeut ověřuje, že
porozuměl, a kterým klientovi umožňuje slyšet vlastní prožívání (Rogers 1951). Motivační
rozhovory rozpracovaly reflexe a shrnutí do podrobné dovednosti a zdůraznily, že shrnutí
má sloužit klientovi, aby slyšel vlastní důvody, a že pracovník nesmí vybírat jen to, co
podporuje jeho názor (Miller a Rollnick 2013). Bandler a Grinder si všímali, že terapeuti,
které modelovali, používali slova klienta místo vlastních, a z toho odvodili zásadu, že
překládání klientových výrazů do jazyka terapeuta zbytečně narušuje porozumění (Bandler a Grinder 1979).

V učebnicích NLP pro širší publikum se zpětné shrnutí stalo samostatnou technikou, která se
doporučuje pro porady, vyjednávání a prodej, například k potvrzení dohody nebo k návratu k
tématu po odbočce (O'Connor a Seymour 1990). Tímto přenosem se změnila i funkce shrnutí.
V terapii je shrnutí nabídkou ke kontrole, v prodeji se často stává prostředkem, kterým se
z výroků zákazníka sestaví zdůvodnění rozhodnutí, ke kterému ho prodejce vede.

## Struktura vzorce

Strukturálně má zpětné shrnutí dvě části. První je výběr: z toho, co druhý řekl, se vybere
to, co se zopakuje. Druhá je podání: vybrané prvky se zopakují slovy druhého, často s jeho
intonací a v pořadí, které jim dá nový smysl. V legitimní podobě je výběr reprezentativní a
shrnutí je nabídnuto ke kontrole, s otázkou, zda je přesné. V manipulativní podobě je výběr
selektivní: zopakují se ty výroky, které podporují cíl mluvčího, a ostatní se vynechají.
Výsledné shrnutí zní jako věrné, protože se skládá ze slov druhého, ale jeho celkový smysl
je smyslem mluvčího. Shrnutí pak slouží jako první část vzorce
[pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md): po řadě
přesně zopakovaných přání následuje závěr, který z nich zdánlivě vyplývá.

Psychologické zázemí tohoto mechanismu je dobře doložené. Lidé usilují o soulad mezi tím,
co řekli, a tím, co dělají dál, a když slyší své vlastní výroky shrnuté do zdánlivě logické
řady, cítí tlak se jich držet (Festinger 1957). Formulace otázky nebo popisu navíc mění to,
jak si lidé událost vybavují: experiment s výpovědmi o dopravní nehodě ukázal, že pouhá
volba slovesa v otázce ovlivnila odhady rychlosti i pozdější vzpomínky svědků (Loftus a Palmer 1974).
Selektivní shrnutí může tedy působit nejen na rozhodnutí, ale i na to, co si člověk později
pamatuje, že řekl.

## Detekční znaky

Manipulativní zpětné shrnutí se pozná podle několika znaků. Shrnutí obsahuje vaše slova,
ale chybí v něm výhrady, pochybnosti a podmínky, které jste vyslovili. Pořadí výroků je
změněné tak, aby z nich vyplýval závěr: „Řekl jste, že chcete jistotu, že nechcete riskovat a
že vám jde o rodinu“, a hned poté nabídka. Shrnutí není nabídnuto ke kontrole, nebo je
otázka po souhlasu formulována tak, že se na ni těžko odpovídá záporně. Shrnutí často
přichází na konci dlouhého rozhovoru, kdy je člověk unavený a méně ochotný opravovat. Znakem
je také to, že mluvčí reaguje na opravu shrnutí podrážděně nebo ji přejde. Selektivní
výběr se těžko postřehne právě proto, že se skládá z vlastních slov, a sociální psychologie
vlivu popisuje tlak k souladu s tím, co člověk sám dříve řekl, jako jeden z
nejsilnějších zdrojů ochoty vyhovět (Cialdini 2009).

V institucionálním prostředí, například ve výsleších, pohovorech nebo v sepisování
výpovědí, se selektivní shrnutí může projevit v zápisu, který se skládá ze slov vyslýchaného,
ale vyznívá jinak, než zamýšlel. Kompendium podobný mechanismus popisuje obecně jako
[strategickou reinterpretaci](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md);
katalog pak v hesle [NLP ve výslechu a vyjednávání](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-ve-vyslechu.md)
rozebírá, jak se vzorce provázení uplatňují v těchto kontextech.

## Legitimní a manipulativní užití

Legitimní užití je jedna z nejcennějších komunikačních dovedností v pomáhajících profesích.
Klinik, který na konci prvního rozhovoru shrne, co slyšel, a zeptá se, zda je to přesné,
ověřuje porozumění a dává klientovi právo opravit ho. Strukturované klinické rozhovory, jak
je kompendium popisuje u [screeningového strukturálního rozhovoru](@/kompendium/techniques/ea-6-1-1-screening-strukturalni-rozhovor.md),
obsahují shrnutí jako kontrolní bod. Motivační rozhovory zdůrazňují, že shrnutí má
zahrnovat i ambivalenci klienta, tedy důvody pro i proti změně, a ne jen ty, které si
pracovník přeje slyšet (Miller a Rollnick 2013). Taková shrnutí jsou úplná, nabídnutá ke
kontrole a nevedou k předem danému závěru.

Manipulativní užití je selektivní a vede k závěru, který si druhý sám neodvodil. V prodeji
slouží shrnutí ke „sestavení“ důvodů ke koupi z výroků zákazníka, ve vyjednávání k
zafixování ústupků druhé strany a v kontrolujících vztazích k přepisování toho, co druhý
řekl: „Sám jsi přece řekl, že…“, přičemž se vynechá podmínka nebo kontext. V posledním případě
se zpětné shrnutí stýká s mechanismy, které kompendium popisuje u zpochybňování paměti a
vlastního úsudku.

## Stav důkazů

Pro legitimní podobu vzorce, tedy pro reflexe a shrnutí jako součást empatického
naslouchání, existuje zázemí v psychoterapeutickém výzkumu a praxi, které však pochází z
přístupů zaměřených na člověka a z motivačních rozhovorů, nikoli z NLP (Rogers 1951;
Miller a Rollnick 2013). Pro specifická tvrzení NLP, že přesné zopakování klíčových slov
druhého, včetně jeho predikátů a intonace, vytváří raport výrazně lépe než shrnutí vlastními
slovy, nám nejsou známy kontrolované studie. Obecná hodnocení NLP konstatují, že užitečné
komunikační prvky oboru jsou většinou převzaty odjinud a že jeho specifické modely nejsou
empiricky podložené (Witkowski 2010; Passmore a Rowson 2019). Pro manipulativní podobu je
důležité, že mechanismy, na nichž stojí, tedy tlak ke konzistenci a vliv formulace na
vzpomínky a úsudky, jsou doloženy nezávisle na NLP (Festinger 1957; Loftus a Palmer 1974).
Riziko vzorce proto neleží v NLP samotném, ale v obecných vlastnostech lidského myšlení,
které selektivní shrnutí využívá.

## Obrana a zotavení

Nejjednodušší obranou je shrnutí opravit, a to vlastními slovy. Pokud mluvčí shrne, co
jste řekli, je legitimní a užitečné doplnit, co v shrnutí chybí: „Řekl jsem také, že si to
chci rozmyslet a že mi vadí cena.“ Oprava vrací do shrnutí výhrady a ruší zdánlivou
logiku, která z něj měla vést k závěru. Druhou obranou je oddělit souhlas se shrnutím
přání od souhlasu s návrhem: chtít jistotu neznamená chtít konkrétní produkt. Třetí obranou,
zejména v institucionálním prostředí, je trvat na tom, že zápis výpovědi musí obsahovat i
výhrady a podmínky, a nepodepisovat shrnutí, které neodpovídá tomu, co člověk řekl.

U lidí, kteří prošli dlouhodobým vztahem, v němž se jejich výroky opakovaně selektivně
přeformulovávaly, se objevuje nejistota ohledně toho, co vlastně řekli a mysleli. Pro
zotavení je užitečné vést si vlastní záznamy důležitých rozhovorů a dohod a v terapii
pracovat s obnovou důvěry ve vlastní paměť. Herman popisuje obnovu schopnosti vyprávět
vlastní příběh vlastními slovy jako jádro zotavení (Herman 1992).

## Literatura

- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Dilts, R., & DeLozier, J. (2000). *Encyclopedia of Systemic Neuro-Linguistic Programming and NLP New Coding*. Scotts Valley: NLP University Press.
- Festinger, L. (1957). *A Theory of Cognitive Dissonance*. Stanford: Stanford University Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Rogers, C. R. (1951). *Client-Centered Therapy*. Boston: Houghton Mifflin.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Pacing a leading](@/kompendium/nlp-vzorce/raport-a-kalibrace/pacing-a-leading.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Pořadí otázek meta-modelu](@/kompendium/nlp-vzorce/meta-model/hierarchie-otazek-meta-modelu.md) – příbuzné heslo (Meta-model, Order of Meta Model challenges)
- [Řada souhlasů](@/kompendium/nlp-vzorce/milton-model/ano-sada.md) – příbuzné heslo (Milton-model, Yes set)
- [Rámec souhlasu](@/kompendium/nlp-vzorce/reframing/ramec-souhlasu.md) – příbuzné heslo (Reframing a rámce, Agreement frame)
- [Rámec zpětného shrnutí](@/kompendium/nlp-vzorce/reframing/ramec-zpetneho-shrnuti.md) – příbuzné heslo (Reframing a rámce, Backtrack frame)
- [Shoda predikátů](@/kompendium/nlp-vzorce/raport-a-kalibrace/shoda-predikatu.md) – příbuzné heslo (Raport a kalibrace, Predicate matching)
- [Předstíraná empatie](@/kompendium/nlp-vzorce/raport-a-kalibrace/pseudoempatie.md) – příbuzné heslo (Raport a kalibrace, Simulated empathy)
- [NLP ve výslechu a vyjednávání](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-ve-vyslechu.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in interrogation and negotiation)

**V kompendiu**

- [6.3 Terapeutické přístupy — přehled](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-6.1.1 Screeningový strukturální rozhovor](@/kompendium/techniques/ea-6-1-1-screening-strukturalni-rozhovor.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.3.2 Strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Sladění hlasu a tempa](@/kompendium/nlp-vzorce/raport-a-kalibrace/sladeni-hlasu-a-tempa.md) – předchozí heslo rodiny
- [Kalibrace souhlasu a nesouhlasu](@/kompendium/nlp-vzorce/raport-a-kalibrace/kalibrace-ano-ne.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
