+++
title = "Presupozice ve výslechu a svědectví"
description = "Jak předpoklady vložené do otázek ovlivňují výpověď svědka i vyslýchaného, proč je forenzní praxe omezuje a jak lze vnesený obsah v záznamu výslechu rozpoznat."
weight = 19
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-presupozice", "nlp-vzorec", "nlp-uziti-vliv"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Presupozice ve výslechu a svědectví", "Presuppositions in questioning and testimony", "sugestivní otázky", "návodné otázky", "kapciózní otázky ve výslechu", "Jazykové presupozice", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-06.19"
catalog_slug = "presupozice-ve-vyslechu"
catalog_family = "presupozice"
catalog_family_code = "06"
catalog_family_title = "Jazykové presupozice"
catalog_family_en = "Linguistic presuppositions"
catalog_part = "presupozice.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Presuppositions in questioning and testimony"
catalog_aliases = ["sugestivní otázky", "návodné otázky", "kapciózní otázky ve výslechu"]
catalog_use = "vliv"
catalog_use_cs = "převážně vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "jazykove-presupozice"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["jazykove-presupozice"]
catalog_related = ["sugestivni-otazka", "slozena-otazka", "nespecifikovane-sloveso", "presupozice-v-meta-modelu", "meta-model-jako-vyslychaci-nastroj", "pripojene-otazky", "jazykove-presupozice", "slovesa-zmeny-casu", "otazky-s-presupozici", "ramec-zpetneho-shrnuti", "trauma-a-falesne-vzpominky", "korenova-pricina", "detekce-lzi-v-nlp", "otazky-misto-tvrzeni", "nlp-ve-vyslechu"]
catalog_related_declared = ["otazky-s-presupozici", "meta-model-jako-vyslychaci-nastroj", "nlp-ve-vyslechu", "trauma-a-falesne-vzpominky", "detekce-lzi-v-nlp"]
catalog_kompendium = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md", "kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-6-1-3-collateral-interview.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/forensic-legal/_index.md", "kompendium/nlp-vzorce/disociace-a-trauma/trauma-a-falesne-vzpominky.md", "kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md", "kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md", "kompendium/nlp-vzorce/raport-a-kalibrace/detekce-lzi-v-nlp.md", "kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-ve-vyslechu.md", "kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md", "kompendium/techniques/ea-6-1-3-collateral-interview.md", "kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md"]
catalog_prev = "presupozice-v-reklame"
catalog_next = ""
catalog_position = 19
catalog_family_size = 19
catalog_sources = ["grice-1975", "herman-1992", "levinson-1983", "lilienfeld-2015", "loftus-palmer-1974", "vrij-2008", "wiseman-2012", "witkowski-2010"]
catalog_sources_primary = []
catalog_sources_roots = ["grice-1975", "levinson-1983"]
catalog_sources_critical = ["herman-1992", "lilienfeld-2015", "loftus-palmer-1974", "vrij-2008", "wiseman-2012", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/presupozice.b.toml"
+++

# Presupozice ve výslechu a svědectví

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-06.19` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Presuppositions in questioning and testimony |
| **Jiné názvy** | sugestivní otázky, návodné otázky, kapciózní otázky ve výslechu |
| **Obecnější heslo** | [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) |
| **Užití** | převážně vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Presupozice ve výslechu a svědectví označují předpoklady, které tazatel vnáší do výpovědi
vyslýchaného formou svých otázek: údaje o osobách, předmětech, dějích nebo motivech, které
vyslýchaný sám neuvedl. Otázka „jakou barvu měla bunda toho muže, který utíkal?“ předpokládá,
že nějaký muž utíkal a měl bundu. Pokud svědek odpoví barvou, stává se předpoklad součástí
jeho výpovědi, i když ho nikdy výslovně nepotvrdil. Lingvistická pragmatika popisuje, že
otázky s tázacím slovem předpokládají pravdivost své nevyplněné části a že tento předpoklad
přetrvává i v záporné nebo podmínkové formě (Levinson 1983). Ve výslechu má tento obecný
jazykový jev zvláštní váhu, protože výpověď je důkazem a předpoklad tazatele se v ní může
proměnit v údajný poznatek svědka. Heslo navazuje na obecný popis
[otázek s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) a
zaměřuje se na kontext policejního, soudního a forenzního dotazování.

## Původ a souvislosti

Experimentální psychologie paměti ukázala v sedmdesátých letech, že formulace otázky
ovlivňuje nejen odpověď, ale i to, co si dotazovaný později vybaví. Účastníci, kteří viděli
film s dopravní nehodou a byli dotázáni na rychlost aut slovesem, které popisovalo prudký
střet, odhadovali vyšší rychlost než ti, kterým bylo položeno neutrálnější sloveso. Po týdnu
častěji uváděli, že na místě viděli rozbité sklo, které ve filmu nebylo (Loftus a Palmer
1974). Navazující výzkum dezinformačního efektu rozšířil toto zjištění na situace, kdy otázka
předpokládá existenci předmětu, který ve scéně vůbec nebyl, a stal se základem moderní
forenzní psychologie výpovědi.

Teorie konverzace vysvětluje, proč svědci na takové otázky odpovídají. Vyslýchaný chápe
výslech jako kooperativní činnost, předpokládá, že otázky jsou relevantní a že tazatel ví,
na co se ptá, a snaží se poskytnout informaci, kterou otázka žádá (Grice 1975). Pokud tazatel
otázkou dává najevo, že muž utíkal, svědek může usoudit, že to vyšetřování ví, a přizpůsobit
tomu svou vzpomínku. Právní řády na tento jev reagují. Český trestní řád zakazuje klást
vyslýchaným otázky, v nichž by byly obsaženy okolnosti, které je třeba teprve z jejich
výpovědi zjistit, a otázky klamavé; standardy
[forenzního rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md)
dávají přednost volnému vyprávění a otevřeným otázkám. Neurolingvistické programování se do
vyšetřovací praxe dostalo spíše prostřednictvím kurzů, které slibovaly rozpoznání lži a
vedení rozhovoru; tomu se věnují hesla [NLP ve výslechu a vyjednávání](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-ve-vyslechu.md)
a [Meta-model jako výslechový nástroj](@/kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md).

## Struktura vzorce

Vnesení předpokladu do výpovědi probíhá ve třech fázích, které lze rozpoznat v záznamu. V
první fázi tazatel položí otázku, jejíž uzavřená část obsahuje údaj, který vyslýchaný
dosud neuvedl. Ve druhé fázi vyslýchaný odpoví na otevřenou část otázky a uzavřenou část
mlčky přijme. Ve třetí fázi se údaj objeví v dalších odpovědích nebo v souhrnu výpovědi
jako něco, co svědek „uvedl“. Kdo čte jen souhrn, nemá možnost poznat, odkud údaj pochází.
Psychologie paměti k tomu dodává, že vnesená informace se může stát součástí vzpomínky
samotné, takže svědek ji později reprodukuje v dobré víře (Loftus a Palmer 1974).

Ve výslechu podezřelého má vnesený předpoklad ještě jinou podobu. Obviňující otázky typu
„proč jste to udělal?“ nebo „kdy jste se rozhodl?“ předpokládají vinu a posouvají rozhovor k
motivu nebo okolnostem. Vrij ve svém přehledu výzkumu rozlišuje obviňující styl výslechu,
který vychází z předpokladu viny, od stylu zaměřeného na získávání informací, a upozorňuje,
že obviňující přístup zvyšuje riziko nespolehlivých výpovědí, aniž by zlepšoval rozpoznání
lži (Vrij 2008). Přehled pseudovědeckých postupů v klinické psychologii zase popisuje rizika
sugestivního dotazování při vybavování vzpomínek, zvláště u lidí, kteří tazateli důvěřují
nebo jsou na něm závislí (Lilienfeld, Lynn a Lohr 2015).

Zvláštním místem, kde se předpoklady mohou do výpovědi dostat, je samotný zápis. Pokud
protokol nevzniká doslovným přepisem, ale shrnutím, které formuluje tazatel, rozhoduje o
volbě sloves, přívlastků a pořadí údajů on. Věta protokolu „svědek uvedl, že pachatel utekl
směrem k nádraží“ může shrnovat odpověď „někdo tam běžel, myslím, že tím směrem“, a rozdíl
mezi nejistým pozorováním a hotovým tvrzením se tak ztratí. Z hlediska pragmatiky jde o
tentýž přesun obsahu do pozadí, jaký popisuje teorie presupozic (Levinson 1983); proto je
pro posouzení výpovědi rozhodující přístup k doslovnému záznamu.

## Detekční znaky

V záznamu výslechu je prvním znakem údaj, který se poprvé objeví v otázce, ne v odpovědi.
Druhým znakem je otázka s tázacím slovem, jejíž předpoklad obsahuje sporný děj, osobu nebo
vlastnost, například „jak rychle jel, když projížděl na červenou?“, ačkoli svědek o
semaforu nemluvil. Třetím znakem je záporná otázka s očekávanou odpovědí („neviděl jste
tam náhodou…?“) a otázka s nabídnutými alternativami, z nichž žádná neodpovídá tomu, že
svědek nic neviděl. Čtvrtým znakem je opakování téže otázky po odpovědi „nevím“, které
svědkovi naznačuje, že odpověď byla nesprávná. Pátým znakem je sloveso nebo přívlastek, který
hodnotí událost, jako „srazil“, „napadl“ nebo „utíkal“, místo neutrálního popisu; experiment
s nehodou ukazuje, že i volba jediného slovesa může posunout odhad i vzpomínku (Loftus a
Palmer 1974). U dětí, lidí s mentálním postižením, lidí ve stresu a lidí závislých na
tazateli je citlivost na tyto vlivy obecně vyšší, a proto je u nich třeba záznam číst se
zvláštní pozorností. Podrobněji o rizicích vytvořené výpovědi pojednává technika
[Synthetic Witness Testimony](@/kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md)
a heslo [Práce s traumatem a riziko nepravých vzpomínek](@/kompendium/nlp-vzorce/disociace-a-trauma/trauma-a-falesne-vzpominky.md).

## Legitimní a manipulativní užití

Ne každá otázka s předpokladem je ve výslechu nepřípustná. Pokud svědek sám uvedl, že
viděl muže v bundě, je otázka na barvu bundy legitimním upřesněním, protože předpoklad
pochází od něj. Forenzní standardy proto zpravidla doporučují postup od volného vyprávění
k otevřeným otázkám, které navazují na to, co vyslýchaný sám řekl, a k uzavřeným otázkám
přecházejí až tehdy, když jsou nutné, a s vědomím jejich rizika. Teorie konverzace tento
postup podporuje: otázka, jejíž předpoklad pochází z předchozí odpovědi, je kooperativní a
neklame (Grice 1975).

Manipulativní užití vnáší do výpovědi obsah, který slouží hypotéze tazatele. Může jít o
úmyslné vedení svědka, ale častěji o nevědomé potvrzování vlastní představy o případu,
kdy tazatel klade otázky, jež jeho hypotézu předpokládají, a odpovědi, které ji potvrzují,
považuje za nezávislé. Některé kurzy NLP spojují jazykové vzorce s údajným
rozpoznáváním lži podle očních pohybů; experimentální ověření však tuto metodu nepodpořilo
(Wiseman a kol. 2012), což je rozebráno v hesle [Detekce lži v NLP](@/kompendium/nlp-vzorce/raport-a-kalibrace/detekce-lzi-v-nlp.md).
Kombinace sugestivních otázek s přesvědčením tazatele, že lež pozná, je zvlášť riskantní,
protože tazatel pak interpretuje nejistotu svědka jako znak lži a tlačí na „správnou“ odpověď.

## Stav důkazů

Vliv formulace otázky na výpověď a paměť patří k nejlépe doloženým poznatkům psychologie
výpovědi (Loftus a Palmer 1974). Na něm stojí doporučení forenzní praxe preferovat otevřené
otázky a nahrávat výslechy, i když se jednotlivé protokoly liší v podrobnostech. Výzkum
detekce lži ukazuje, že lidé včetně profesionálů rozpoznávají lež hůře, než si myslí, a že
obviňující styl výslechu nepřináší spolehlivější výsledky (Vrij 2008). Tvrzení NLP, že
jeho jazykové vzorce a údajné [oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md) umožňují vyšetřovateli rozpoznat lež
nebo vést vyslýchaného k pravdivé výpovědi, kontrolovaný výzkum nepotvrdil (Wiseman a kol.
2012; Witkowski 2010). Lingvistický popis presupozic, o který se tento poznatek opírá, je
dobře zavedený (Levinson 1983). Poctivý závěr je, že riziko vneseného obsahu ve výslechu je
reálné a doložené, a že NLP v této oblasti nepřináší ověřený nástroj, ale spíše riziko
přeceňování vlastních schopností tazatele.

## Obrana a zotavení

Pro vyslýchaného je základní obranou vědomí, že má právo odmítnout předpoklad otázky:
odpovědět, že nějaký údaj neviděl, že si ho nepamatuje nebo že ho neuvedl, a trvat na tom,
aby to bylo zaznamenáno. Odpověď „nevím“ je platná a nemá být vnímána jako selhání. Pro
obhajobu, soud a recenzenty výslechů je obranou analýza záznamu: u každého podstatného
údaje dohledat, zda se poprvé objevil v odpovědi, nebo v otázce, a údaje, které pocházejí z
otázek, posuzovat odděleně. Pro instituce je obranou nahrávání celého výslechu, vzdělávání
tazatelů v rozpoznávání vlastních předpokladů a přechod od obviňujícího stylu ke stylu
zaměřenému na získávání informací (Vrij 2008). Postupy, které tento přístup popisují,
shrnuje i kapitola [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) a
stránka o [rozhovoru s blízkými](@/kompendium/techniques/ea-6-1-3-collateral-interview.md).
Lidé, jejichž výpověď byla zkreslena vneseným obsahem, často prožívají nejistotu ve vlastní
paměti a pocit viny za to, co „řekli“. Součástí zotavení je pochopení, že zkreslení vzniklo
strukturou dotazování, ne jejich nepoctivostí, a obnova důvěry ve vlastní vzpomínky v
bezpečném vztahu (Herman 1992).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Lilienfeld, S. O., Lynn, S. J., & Lohr, J. M. (Eds.) (2015). *Science and Pseudoscience in Clinical Psychology* (2. vyd.). New York: Guilford Press.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Vrij, A. (2008). *Detecting Lies and Deceit: Pitfalls and Opportunities* (2. vyd.). Chichester: Wiley.
- Wiseman, R., Watt, C., ten Brinke, L., Porter, S., Couper, S.-L., & Rankin, C. (2012). The eyes don't have it: Lie detection and neuro-linguistic programming. *PLoS ONE*, 7(7), e40259.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Sugestivní otázka](@/kompendium/argumentacni-fauly/predpoklady-argumentu/sugestivni-otazka.md) – příbuzné heslo (Argumentační fauly: Klamy předpokladu, Loaded question)
- [Složená otázka](@/kompendium/argumentacni-fauly/predpoklady-argumentu/slozena-otazka.md) – příbuzné heslo (Argumentační fauly: Klamy předpokladu, Complex question)
- [Nespecifikované sloveso](@/kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md) – příbuzné heslo (Meta-model, Unspecified verb)
- [Presupozice v meta-modelu](@/kompendium/nlp-vzorce/meta-model/presupozice-v-meta-modelu.md) – příbuzné heslo (Meta-model, Presuppositions (Meta Model))
- [Meta-model jako výslechový nástroj](@/kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md) – příbuzné heslo (Meta-model, Meta Model as an interrogation tool)
- [Připojené otázky](@/kompendium/nlp-vzorce/milton-model/pripojene-otazky.md) – příbuzné heslo (Milton-model, Tag questions)
- [Jazykové presupozice](@/kompendium/nlp-vzorce/presupozice/jazykove-presupozice.md) – příbuzné heslo (Jazykové presupozice, Linguistic presuppositions)
- [Slovesa změny času a stavu](@/kompendium/nlp-vzorce/presupozice/slovesa-zmeny-casu.md) – příbuzné heslo (Jazykové presupozice, Change-of-time verbs and adverbs)
- [Otázky s presupozicí](@/kompendium/nlp-vzorce/presupozice/otazky-s-presupozici.md) – příbuzné heslo (Jazykové presupozice, Loaded questions)
- [Rámec zpětného shrnutí](@/kompendium/nlp-vzorce/reframing/ramec-zpetneho-shrnuti.md) – příbuzné heslo (Reframing a rámce, Backtrack frame)
- [Práce s traumatem a riziko nepravých vzpomínek](@/kompendium/nlp-vzorce/disociace-a-trauma/trauma-a-falesne-vzpominky.md) – příbuzné heslo (Disociace, fobie a trauma, Trauma work and the risk of false memories)
- [Hledání kořenové příčiny](@/kompendium/nlp-vzorce/casova-osa/korenova-pricina.md) – příbuzné heslo (Časová osa, Root cause)
- [Detekce lži v NLP](@/kompendium/nlp-vzorce/raport-a-kalibrace/detekce-lzi-v-nlp.md) – příbuzné heslo (Raport a kalibrace, Lie detection claims in NLP)
- [Otázky místo tvrzení](@/kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md) – příbuzné heslo (Jazykové vzorce, Questions instead of statements)
- [NLP ve výslechu a vyjednávání](@/kompendium/nlp-vzorce/vliv-a-zneuziti/nlp-ve-vyslechu.md) – příbuzné heslo (Vliv a zneužití NLP, NLP in interrogation and negotiation)

**V kompendiu**

- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-9.2.7 Synthetic Witness Testimony](@/kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-6.1.3 Collateral interview (rozhovor s blízkými)](@/kompendium/techniques/ea-6-1-3-collateral-interview.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Presupozice v reklamě](@/kompendium/nlp-vzorce/presupozice/presupozice-v-reklame.md) – předchozí heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
