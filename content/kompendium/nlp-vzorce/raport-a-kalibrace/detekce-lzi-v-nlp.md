+++
title = "Detekce lži v NLP"
description = "Rozšířené tvrzení, že směr pohledu a jiné tělesné signály podle NLP prozrazují lež: odkud pochází, co o něm říká výzkum a proč je nebezpečné."
weight = 14
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-raport-a-kalibrace", "nlp-pojem", "nlp-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Detekce lži v NLP", "Lie detection claims in NLP", "oční pohyby a lež", "čtení lži z očí", "Raport a kalibrace", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-18.14"
catalog_slug = "detekce-lzi-v-nlp"
catalog_family = "raport-a-kalibrace"
catalog_family_code = "18"
catalog_family_title = "Raport a kalibrace"
catalog_family_en = "Rapport and calibration"
catalog_part = "raport-a-kalibrace.b"
catalog_type = "concept"
catalog_type_cs = "pojem"
catalog_en = "Lie detection claims in NLP"
catalog_aliases = ["oční pohyby a lež", "čtení lži z očí"]
catalog_use = "zadne"
catalog_use_cs = "výkladový pojem"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "ocni-pristupove-signaly"
catalog_narrower = []
catalog_depth = 2
catalog_ancestors = ["ocni-pristupove-signaly", "reprezentacni-systemy"]
catalog_related = ["ocni-pristupove-signaly", "kalibrace", "smyslova-ostrost", "inkongruence", "meta-model-jako-vyslychaci-nastroj", "presupozice-ve-vyslechu", "simultanni-inkongruence", "kalibrace-ano-ne", "cteni-reci-tela", "nlp-ve-vyslechu", "vyzkum-ocnich-signalu"]
catalog_related_declared = ["ocni-pristupove-signaly", "vyzkum-ocnich-signalu", "cteni-reci-tela", "kalibrace", "nlp-ve-vyslechu", "meta-model-jako-vyslychaci-nastroj"]
catalog_kompendium = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-6-1-4-observational-assessment.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md", "kompendium/nlp-vzorce/raport-a-kalibrace/cteni-reci-tela.md", "kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md"]
catalog_prev = "raport-jako-nastroj-vlivu"
catalog_next = "cteni-reci-tela"
catalog_position = 14
catalog_family_size = 16
catalog_sources = ["bandler-grinder-1979", "dilts-1980", "ekman-2003", "heap-1988", "sharpley-1987", "vrij-2008", "wiseman-2012", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1979", "dilts-1980"]
catalog_sources_roots = []
catalog_sources_critical = ["ekman-2003", "heap-1988", "sharpley-1987", "vrij-2008", "wiseman-2012", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/raport-a-kalibrace.b.toml"
+++

# Detekce lži v NLP

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-18.14` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) |
| **Druh** | pojem |
| **Anglicky** | Lie detection claims in NLP |
| **Jiné názvy** | oční pohyby a lež, čtení lži z očí |
| **Obecnější heslo** | [Oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md) |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Detekce lži v NLP označuje soubor tvrzení, podle kterých lze z pohybů očí, mikropohybů a
jiných tělesných signálů spolehlivě poznat, že člověk lže. Nejrozšířenější podoba tvrzení
vychází z
[očních přístupových signálů](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md):
pokud se člověk při odpovědi podívá směrem, který NLP spojuje s vytvářením nových
představ, má si odpověď vymýšlet, kdežto pohled do strany spojené se vzpomínáním má značit
pravdu. Toto tvrzení se objevuje v kurzech komunikace, v prodejních a vyjednávacích
příručkách, v médiích i v populárních textech o „čtení lidí“ a výzkumníci, kteří ho
testovali, uvádějí, že je mezi veřejností i praktiky NLP rozšířené (Wiseman a kol. 2012).
Kompendium ho zařazuje jako pojem, nikoli jako vzorec, protože nejde o techniku vlivu, ale o
víru v diagnostickou schopnost. Ta je nebezpečná dvojím způsobem: dává falešnou jistotu
tomu, kdo „lež vidí“, a odebírá hlas tomu, komu se nevěří kvůli směru pohledu.

## Původ a souvislosti

V textech zakladatelů NLP se pohyby očí spojují s tím, jakým smyslovým kanálem člověk právě
zpracovává informaci, a rozlišuje se mezi vybavováním zapamatovaných a vytvářením nových
obrazů a zvuků (Bandler a Grinder 1979; Dilts a kol. 1980). Původním účelem tohoto modelu
bylo zjistit, jak druhý přemýšlí, a přizpůsobit mu komunikaci, ne posuzovat pravdivost jeho
slov. Spojení se lží je pozdější odvození: z rozlišení vzpomínky a konstrukce se usuzovalo,
že kdo „konstruuje“, ten si vymýšlí. Toto odvození se šířilo hlavně tréninky a popularizační
literaturou a právě v této podobě ho testovala studie, která se mu věnovala soustavně
(Wiseman a kol. 2012). Výzkum samotného modelu očních přístupových signálů přitom už v
osmdesátých letech nenašel oporu ani pro jeho původní, skromnější verzi, tedy pro vztah
mezi směrem pohledu a smyslovým kanálem (Heap 1988; Sharpley 1987). Mimo NLP má víra v
tělesné znaky lži dlouhou historii a psychologie klamání se jí zabývá jako jedním z
nejrozšířenějších omylů o lhaní: lidé v různých kulturách věří, že lhář uhýbá pohledem, ačkoli
výzkum takový vztah nepotvrzuje (Vrij 2008).

## Struktura vzorce

Tvrzení má logickou stavbu, kterou je užitečné rozložit, protože právě její části vysvětlují,
proč působí přesvědčivě. Prvním krokem úvahy je předpoklad, že vybavování a vymýšlení jsou
odlišné mentální procesy. To je rozumné a psychologie klamání s tím pracuje. Druhým
předpokladem je, že tyto procesy mají stálý a viditelný tělesný projev, konkrétně směr
pohledu. Tento předpoklad už empirickou oporu nemá (Wiseman a kol. 2012). Třetím
předpokladem je, že vymýšlení se rovná lži. I ten je chybný, protože člověk při pravdivé
odpovědi často rekonstruuje, odhaduje nebo si představuje, a naopak lhář může odříkávat
předem připravenou verzi, kterou si „pamatuje“. Čtvrtým předpokladem je, že znak platí pro
každého stejně, případně po krátké kalibraci. Celá stavba tedy spojuje jeden rozumný
předpoklad se třemi neověřenými a výsledkem je jistota, kterou nic nepodpírá.

Psychologie emocí dodává další omezení. Ekman upozorňuje, že výrazy tváře nesou informaci o
prožívané emoci, ale ne o její příčině (Ekman 2003). Strach, který se objeví na tváři
vyslýchaného, může být strachem z odhalení lži stejně jako strachem, že mu nikdo neuvěří.
Vrij tuto záměnu popisuje jako chybu, při níž pozorovatel vyloží emoční projev pravdivého
člověka jako znak klamání (Vrij 2008). Tvrzení NLP o detekci lži tak nejen neplatí, ale vede
právě k té chybě, před kterou výzkum klamání varuje nejvíc.

## Detekční znaky

Užití tvrzení se pozná podle několika znaků. Mluvčí s jistotou vykládá jednotlivý pohled,
gesto nebo dotek obličeje jako důkaz lži a odmítá další vysvětlení. Odkazuje na „vědu“,
„neurologii“ nebo „to, co se učí vyšetřovatelé“, ale nedokáže uvést výzkum. Tělesný znak
staví nad obsah výpovědi a nad ověřitelné okolnosti: „můžeš říkat, co chceš, ale oči tě
prozradily“. V osobních vztazích se tvrzení objevuje jako součást kontroly a výslechů, kdy
partner nebo rodič „čte“ druhého a jeho výklad nelze vyvrátit, protože se netýká slov, ale
těla. V pracovním prostředí se objevuje v náboru a při vyšetřování interních incidentů, kde
může vést k nespravedlivému podezření. U člověka, na kterého je tvrzení uplatňováno, se
objevuje nejistota ve vlastním těle, snaha kontrolovat pohled a výraz a paradoxně i větší
nervozita, kterou pozorovatel vyloží jako další důkaz. Kompendium tuto smyčku sleduje i u
[forenzního rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md), kde
platí, že tělesná úzkost vyslýchaného není znakem viny (Vrij 2008).

## Legitimní a manipulativní užití

Legitimní užití tvrzení o detekci lži z očních pohybů neexistuje, protože tvrzení neplatí.
Legitimní je pouze jeho výklad jako příkladu nepodloženého přesvědčení, například ve výuce
kritického myšlení nebo při školení vyšetřovatelů, kde slouží jako ukázka toho, čemu se
vyhnout. Pozorování tělesných projevů v rozhovoru má své oprávněné místo, ale jako podnět k
další otázce, ne jako závěr. Výzkum klamání doporučuje opírat se o obsah výpovědi, o její
ověřitelné detaily a o srovnání s nezávislými zdroji (Vrij 2008).

Manipulativní užití má dvě podoby. První je mocenská: tvrzení slouží jako nevyvratitelný
argument v hádce, výslechu nebo kontrole, protože znak je vždy k dispozici a jeho výklad
patří pozorovateli. Druhá je obchodní: kurzy a knihy slibují schopnost „poznat lháře“ a
prodávají pocit převahy nad ostatními. V obou případech platí, že tvrzení přesouvá autoritu
od ověřitelných faktů k výkladu toho, kdo „čte“. V kontextu vyšetřování má tento přesun zvláštní váhu. Vyšetřovatel, který věří, že lež
vidí, má sklon klást [sugestivní otázky](@/kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md), tlačit na přiznání a přehlížet údaje, které jeho
dojmu odporují. Výzkum klamání proto varuje, že přehnaná důvěra v neverbální znaky zvyšuje
riziko, že bude za lháře označen pravdivý a vystrašený člověk (Vrij 2008).

## Stav důkazů

Stav důkazů je v tomto případě neobvykle jasný. Wiseman a spolupracovníci tvrzení otestovali
ve třech studiích. V první porovnávali pohyby očí lidí, kteří lhali, a lidí, kteří mluvili
pravdu, a rozdíl ve směru pohledu nenašli. Ve druhé zjišťovali, zda lidé, kteří se s
hypotézou NLP seznámili, poznají lež lépe než lidé bez tohoto poučení, a nepoznali. Ve třetí
analyzovali záznamy veřejných výzev, u jejichž části se později prokázalo, že mluvčí lhali,
a ani tam se vztah mezi směrem pohledu a lží neprokázal (Wiseman a kol. 2012). Výsledek odpovídá
širšímu poznání psychologie klamání. Neverbální projevy jsou s lhaním spojeny jen slabě a
nekonzistentně, neexistuje jediný znak, který by lež spolehlivě ukazoval, a úspěšnost lidí
při rozpoznávání lži je v průměru jen o málo vyšší než náhoda, přičemž profesionálové
nejsou o mnoho lepší (Vrij 2008). Už starší přehledy nenašly oporu pro samotný model očních
přístupových signálů (Heap 1988), a obecná hodnocení NLP řadí tvrzení oboru mezi
nepodložená (Witkowski 2010). Tvrzení o detekci lži z očí je proto třeba považovat za
vyvrácené, ne za nedostatečně prozkoumané.

## Obrana a zotavení

Obrana proti tvrzení je především informační. Kdo je obviněn ze lži na základě pohledu,
gesta nebo výrazu, může klidně odpovědět, že kontrolovaný výzkum takový vztah nenašel, a
požádat, aby se o pravdivosti rozhodovalo podle ověřitelných okolností (Wiseman a kol.
2012). V institucionálním prostředí, například při personálním nebo interním šetření, je
vhodné trvat na tom, aby závěry stály na dokumentech, svědectvích a časové ose, nikoli na
dojmu z chování. Vyšetřovatelé a personalisté by měli vědět, že sebedůvěra v rozpoznávání lži
nesouvisí s jeho přesností a že nervozita je běžnou reakcí pravdivých lidí na podezření
(Vrij 2008). Pro lidi, kteří byli v osobním vztahu dlouhodobě „čteni“, je zotavení spojeno s
návratem důvěry ve vlastní tělo a vlastní výpověď. Kontrola pohledu a výrazu, kterou si v
takovém vztahu vytvořili, často přetrvává i po jeho skončení a projevuje se napětím v
rozhovorech s autoritami. Klinická práce zde může využít informaci o výzkumu jako součást
validace: nešlo o to, že by jejich tělo „prozrazovalo“, ale o to, že někdo jiný si přivlastnil
výklad jejich těla. Kompendium tuto souvislost s epistemickou kontrolou rozvádí na stránce o
[čtení řeči těla v NLP](@/kompendium/nlp-vzorce/raport-a-kalibrace/cteni-reci-tela.md).

## Literatura

- Bandler, R., & Grinder, J. (1979). *Frogs into Princes: Neuro Linguistic Programming*. Moab: Real People Press.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Ekman, P. (2003). *Emotions Revealed: Recognizing Faces and Feelings to Improve Communication and Emotional Life*. New York: Times Books.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Vrij, A. (2008). *Detecting Lies and Deceit: Pitfalls and Opportunities* (2. vyd.). Chichester: Wiley.
- Wiseman, R., Watt, C., ten Brinke, L., Porter, S., Couper, S.-L., & Rankin, C. (2012). The eyes don't have it: Lie detection and neuro-linguistic programming. *PLoS ONE*, 7(7), e40259.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Raport a kalibrace](@/kompendium/nlp-vzorce/raport-a-kalibrace/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md) – příbuzné heslo (Základní pojmy NLP, Eye accessing cues)
- [Kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) – příbuzné heslo (Základní pojmy NLP, Calibration)
- [Smyslová ostrost](@/kompendium/nlp-vzorce/zakladni-pojmy/smyslova-ostrost.md) – příbuzné heslo (Základní pojmy NLP, Sensory acuity)
- [Inkongruence](@/kompendium/nlp-vzorce/zakladni-pojmy/inkongruence.md) – příbuzné heslo (Základní pojmy NLP, Incongruence)
- [Meta-model jako výslechový nástroj](@/kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md) – příbuzné heslo (Meta-model, Meta Model as an interrogation tool)
- [Presupozice ve výslechu a svědectví](@/kompendium/nlp-vzorce/presupozice/presupozice-ve-vyslechu.md) – příbuzné heslo (Jazykové presupozice, Presuppositions in questioning and testimony)
- [Simultánní inkongruence](@/kompendium/nlp-vzorce/integrace-casti/simultanni-inkongruence.md) – příbuzné heslo (Práce s částmi, Simultaneous incongruence)
- [Kalibrace souhlasu a nesouhlasu](@/kompendium/nlp-vzorce/raport-a-kalibrace/kalibrace-ano-ne.md) – příbuzné heslo (Raport a kalibrace, Yes/no calibration)
- [Čtení řeči těla v NLP](@/kompendium/nlp-vzorce/raport-a-kalibrace/cteni-reci-tela.md) – příbuzné heslo (Raport a kalibrace, Body-language reading in NLP)
- [NLP ve výslechu a vyjednávání](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-ve-vyslechu.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in interrogation and negotiation)
- [Výzkum očních přístupových signálů](@/kompendium/nlp-vzorce/kriticke-hodnoceni/vyzkum-ocnich-signalu.md) – příbuzné heslo (Kritické hodnocení NLP, Research on eye accessing cues)

**V kompendiu**

- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-6.1.4 Observational assessment](@/kompendium/techniques/ea-6-1-4-observational-assessment.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Raport jako nástroj vlivu](@/kompendium/nlp-vzorce/raport-a-kalibrace/raport-jako-nastroj-vlivu.md) – předchozí heslo rodiny
- [Čtení řeči těla v NLP](@/kompendium/nlp-vzorce/raport-a-kalibrace/cteni-reci-tela.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
