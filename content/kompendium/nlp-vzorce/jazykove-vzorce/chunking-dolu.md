+++
title = "Chunking dolů"
description = "Přesun rozhovoru od obecného ke konkrétním případům, částem a podrobnostem: kdy zpřesňuje porozumění a kdy slouží k rozkouskování závazku nebo ke zneplatnění zkušenosti."
weight = 3
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-jazykove-vzorce", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Chunking dolů", "Chunking down", "konkretizace", "přesun ke konkrétnímu", "Jazykové vzorce", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-20.03"
catalog_slug = "chunking-dolu"
catalog_family = "jazykove-vzorce"
catalog_family_code = "20"
catalog_family_title = "Jazykové vzorce"
catalog_family_en = "Language patterns"
catalog_part = "jazykove-vzorce"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Chunking down"
catalog_aliases = ["konkretizace", "přesun ke konkrétnímu"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "hierarchie-idei"
catalog_narrower = []
catalog_depth = 2
catalog_ancestors = ["hierarchie-idei", "chunking"]
catalog_related = ["chunking", "meta-model", "nespecifikovane-sloveso", "hierarchie-otazek-meta-modelu", "meta-model-jako-vyslychaci-nastroj", "som-rozlozeni", "deframing", "obecne-a-specificke", "hierarchie-idei", "chunking-nahoru"]
catalog_related_declared = ["som-rozlozeni", "meta-model", "nespecifikovane-sloveso", "meta-model-jako-vyslychaci-nastroj", "chunking-nahoru"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-2-informacni-pretizeni.md", "kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md"]
catalog_canonical = ""
catalog_links_prose = ["glossary/forensic-interview.md", "kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md", "kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md", "kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md", "kompendium/nlp-vzorce/meta-model/meta-model.md", "kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md", "kompendium/techniques/ea-1-1-2-informacni-pretizeni.md", "kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md"]
catalog_prev = "chunking-nahoru"
catalog_next = "lateralni-chunking"
catalog_position = 3
catalog_family_size = 20
catalog_sources = ["bandler-grinder-1975", "beck-1976", "chomsky-1965", "cialdini-2009", "dilts-1999", "freedman-fraser-1966", "herman-1992", "loftus-palmer-1974", "oconnor-seymour-1990", "sharpley-1987", "stark-2007", "tosey-mathison-2009", "vrij-2008", "witkowski-2010"]
catalog_sources_primary = ["bandler-grinder-1975", "dilts-1999", "oconnor-seymour-1990"]
catalog_sources_roots = ["chomsky-1965"]
catalog_sources_critical = ["beck-1976", "cialdini-2009", "freedman-fraser-1966", "herman-1992", "loftus-palmer-1974", "sharpley-1987", "stark-2007", "tosey-mathison-2009", "vrij-2008", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/jazykove-vzorce.toml"
+++

# Chunking dolů

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-20.03` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Chunking down |
| **Jiné názvy** | konkretizace, přesun ke konkrétnímu |
| **Obecnější heslo** | [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Chunkingem dolů se v neurolingvistickém programování rozumí přesun řeči od obecného ke konkrétnímu: od třídy k jejím jednotlivým případům, od celku k částem, od cíle k jednotlivým krokům a od souhrnného hodnocení k pozorovatelným podrobnostem. Z „mám špatný vztah s matkou“ se stává „v neděli při obědě mi řekla, že jsem zklamání“, z „chci být zdravější“ „chci třikrát týdně chodit pěšky do práce“. Učebnice NLP uvádějí chunking dolů jako protějšek [chunkingu nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) a přisuzují mu schopnost převést neurčité stížnosti a cíle do podoby, se kterou lze pracovat (O'Connor a Seymour 1990). Na rozdíl od pohybu nahoru, který přidává shodu a ubírá ověřitelnost, pohyb dolů přidává ověřitelnost a ubírá shodu: konkrétní výroky jsou zkontrolovatelné, ale také sporné. Kompendium vzorec popisuje proto, že konkretizace je zároveň jedním z nejdůležitějších obranných nástrojů a jednou z nejčastěji zneužívaných forem rozhovoru.

## Původ a souvislosti

Jádrem chunkingu dolů je v NLP [meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md), soubor otázek, které Bandler a Grinder odvodili z pozorování terapeutické práce Virginie Satirové a Fritze Perlse a popsali pojmy transformační gramatiky. Podle nich povrchová věta, kterou klient vysloví, vznikla z úplnější hluboké struktury vypouštěním, zkreslováním a zobecňováním, a otázky po vypuštěných údajích, nespecifikovaných slovesech a neurčitých osobách vracejí do řeči to, co se ztratilo (Bandler a Grinder 1975). Transformační gramatika, ze které tato terminologie pochází, rozlišovala povrchovou a hloubkovou strukturu věty (Chomsky 1965); NLP z ní převzalo spíše obraznost než formální aparát. V Diltsově souboru konverzačních vzorců má rozložení na části samostatné místo: přesvědčení se rozloží na menší složky, a tím se změní jeho celkový význam (Dilts 1999).

Mimo NLP má konkretizace dlouhou tradici v klinické a forenzní praxi. Kognitivní terapie pracuje s převáděním obecných soudů na konkrétní situace, které lze prozkoumat (Beck 1976). Výzkum výpovědí se zabývá tím, jak způsob kladení otázek ovlivňuje to, co si svědek vybaví, a jak obsah a bohatost detailů souvisí s věrohodností výpovědi (Vrij 2008).

## Struktura vzorce

Chunking dolů se ohlašuje otázkami po konkrétním: „co přesně?“, „například?“, „kdo konkrétně?“, „jak přesně?“, „kdy naposledy?“, „podle čeho to poznáte?“ (Bandler a Grinder 1975; O'Connor a Seymour 1990). Stejně jako pohyb nahoru se i pohyb dolů může odehrávat v různých vztazích. Ve vztahu třídy a členu vede k příkladům, ve vztahu celku a části k součástem, ve vztahu účelu a prostředku ke krokům. Strukturně důležité je, že od každé obecné úrovně vede dolů mnoho cest a že výběr příkladu nebo podrobnosti je vždy rozhodnutím. Kdo vybírá, který příklad bude zkoumán, má značný vliv na to, k jakému závěru rozhovor dojde.

Chunking dolů má dvě protichůdné možnosti účinku. Zpřesňuje: obecná stížnost dostane obrysy, cíl se dá měřit, tvrzení se dá ověřit. Rozkládá: celek, který byl smysluplný, se rozpadne na části, z nichž žádná sama o sobě nevypadá podstatně. Rozklad je užitečný, když člověk potřebuje velký úkol zvládnout po částech. Je ale také prostředkem, jak zmenšit vnímanou váhu jednání, které je závažné teprve jako celek, například opakovaného ponižování, z nějž je každá jednotlivá epizoda „jen poznámka“. Tuto vlastnost dobře ilustruje výzkum donucující kontroly v partnerských vztazích. Stark ukázal, že přístup, který posuzuje každý incident zvlášť, přehlíží podstatu jevu, protože kontrola spočívá v soustavném a kumulativním omezování svobody, nikoli v jednotlivé události (Stark 2007). Rozložení celku na izolované epizody tak může být nejen rétorickým tahem jednotlivce, ale i slepou skvrnou institucí, které situaci posuzují.

## Detekční znaky

Manipulativní chunking dolů se projevuje v několika podobách. První je nesplnitelný požadavek na přesnost: zkušenost druhého je odmítnuta, protože nedokáže uvést přesné datum, slovo nebo hodinu. U lidí, kteří prošli traumatem, je takový požadavek obzvlášť škodlivý, protože traumatická paměť bývá fragmentární a neuspořádaná (Herman 1992). Kompendium tento mechanismus popisuje u [gaslightingu](@/kompendium/detection-signatures/12-behavioral-gaslighting-pattern.md). Druhou podobou je rozkouskování závazku: velký požadavek se rozloží na řadu drobných kroků, z nichž každý se zdá nepodstatný. Výzkum ukázal, že souhlas s malým požadavkem zvyšuje ochotu vyhovět později požadavku většímu (Freedman a Fraser 1966). Třetí podobou je zahlcení detaily, kdy se podstatná otázka utopí v podrobnostech, které kompendium popisuje jako [informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) a [iluzorní komplexitu](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md). Čtvrtou podobou jsou podrobné otázky, které už v sobě nesou odpověď. Loftus a Palmer ukázali, že pouhá volba slovesa v otázce na rychlost aut při nehodě změnila odhady svědků i to, co si o nehodě později pamatovali (Loftus a Palmer 1974). Pátou podobou je výběr jediného nereprezentativního detailu, na kterém se pak celek zpochybní.

## Legitimní a manipulativní užití

Legitimní chunking dolů je základem dobré klinické, poradenské i vyšetřovací práce. Lékař, který se ptá, kdy přesně bolest začala a v jakých situacích se zhoršuje, nezpochybňuje, že bolest existuje; potřebuje ji popsat. Kognitivní terapeut pomáhá klientovi převést soud „všechno pokazím“ na řadu konkrétních situací, které lze posoudit jednotlivě (Beck 1976). [Forenzní rozhovor](@/glossary/forensic-interview.md) s dětmi i dospělými pracuje s volnými výzvami k vyprávění a s otevřenými otázkami po podrobnostech, protože [sugestivní otázky](@/kompendium/nlp-vzorce/jazykove-vzorce/otazky-misto-tvrzeni.md) výpověď zkreslují; kompendium se tomu věnuje na stránce o [forenzním rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md). Legitimní konkretizace nechává volbu příkladu tazateli i tázanému, uznává, že paměť má meze, a nepovažuje chybějící detail za důkaz, že se věc nestala.

Manipulativní užití se rozpozná podle toho, k čemu konkretizace slouží. Pokud nikdy nepřestane, protože žádná úroveň podrobnosti nestačí, slouží zneplatnění. Pokud vybírá jen podrobnosti, které podporují předem daný závěr, slouží zkreslení. Pokud rozkládá závazek tak, aby celek nikdy nebyl vidět, slouží vynucení souhlasu (Freedman a Fraser 1966). A pokud otázky po detailech vnášejí do výpovědi obsah, který v ní nebyl, slouží ovlivnění svědectví (Loftus a Palmer 1974); kompendium tuto podobu sleduje u [meta-modelu jako výslechového nástroje](@/kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md).

## Stav důkazů

O meta-modelu jako o souboru otázek existuje jen málo kontrolovaného výzkumu a ten neprokazuje, že by jeho užití mělo zvláštní terapeutický účinek nad rámec obecných dovedností dobrého rozhovoru. Přehledy výzkumu NLP se soustředily hlavně na [reprezentační systémy](@/kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md) a oční signály a tam výsledky tvrzení oboru nepodporují (Sharpley 1987; Witkowski 2010). Tosey a Mathison upozorňují, že lingvistické zázemí, kterým se meta-model zaštiťuje, se v NLP používá volně a s posunutým obsahem (Tosey a Mathison 2009). Naopak dobře doložené jsou mechanismy, které vysvětlují rizika manipulativní konkretizace: vliv formulace otázky na paměť (Loftus a Palmer 1974), účinek postupného závazku (Freedman a Fraser 1966) a omezená diagnostická hodnota bohatosti detailů pro posouzení pravdivosti výpovědi (Vrij 2008). Chunking dolů je tedy rozumné chápat jako pojmenování známé dovednosti, ne jako objev NLP.

## Obrana a zotavení

Proti nesplnitelnému požadavku na přesnost je obranou uvést několik konkrétních příkladů, které si člověk pamatuje, a zároveň odmítnout kritérium, podle něhož by zkušenost bez přesných údajů neplatila. Opakování a vzorec jsou samy o sobě údajem, i když jednotlivé epizody nelze datovat na hodinu. Pomáhá vést si průběžné datované záznamy, protože vzorec se v nich ukáže i tehdy, když jednotlivé epizody v paměti splývají. Proti rozkouskování závazku pomáhá ptát se na celek: kam tyto drobné kroky dohromady vedou a souhlasil bych s tím, kdyby mi byl celek předložen najednou? Cialdini jako obranu proti tlaku na konzistenci s dřívějším závazkem uvádí otázku, zda by se člověk rozhodl stejně, kdyby mohl volit znovu se vším, co ví nyní (Cialdini 2009). Proti zahlcení detaily je obranou vrátit se k původní otázce a požádat o shrnutí odpovědi jednou větou.

V klinické práci s lidmi, kteří byli dlouho vystaveni zpochybňování vlastní paměti, se konkretizace používá opatrně. Nejprve se uznává obecná pravdivost zkušenosti a teprve na tomto základě se postupně skládají konkrétní vzpomínky do souvislé časové osy, bez tlaku na úplnost (Herman 1992). Cílem není, aby člověk dokázal svou zkušenost obhájit před tím, kdo ji zpochybňoval, ale aby si znovu věřil jako svědek vlastního života.

## Literatura

- Bandler, R., & Grinder, J. (1975). *The Structure of Magic I: A Book about Language and Therapy*. Palo Alto: Science and Behavior Books.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Chomsky, N. (1965). *Aspects of the Theory of Syntax*. Cambridge, MA: MIT Press.
- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Dilts, R. (1999). *Sleight of Mouth: The Magic of Conversational Belief Change*. Capitola: Meta Publications.
- Freedman, J. L., & Fraser, S. C. (1966). Compliance without pressure: The foot-in-the-door technique. *Journal of Personality and Social Psychology*, 4(2), 195–202.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Stark, E. (2007). *Coercive Control: How Men Entrap Women in Personal Life*. New York: Oxford University Press.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Vrij, A. (2008). *Detecting Lies and Deceit: Pitfalls and Opportunities* (2. vyd.). Chichester: Wiley.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Jazykové vzorce](@/kompendium/nlp-vzorce/jazykove-vzorce/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Chunking](@/kompendium/nlp-vzorce/zakladni-pojmy/chunking.md) – příbuzné heslo (Základní pojmy NLP, Chunking)
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – příbuzné heslo (Meta-model, Meta Model)
- [Nespecifikované sloveso](@/kompendium/nlp-vzorce/meta-model/nespecifikovane-sloveso.md) – příbuzné heslo (Meta-model, Unspecified verb)
- [Pořadí otázek meta-modelu](@/kompendium/nlp-vzorce/meta-model/hierarchie-otazek-meta-modelu.md) – příbuzné heslo (Meta-model, Order of Meta Model challenges)
- [Meta-model jako výslechový nástroj](@/kompendium/nlp-vzorce/meta-model/meta-model-jako-vyslychaci-nastroj.md) – příbuzné heslo (Meta-model, Meta Model as an interrogation tool)
- [Rozložení na části](@/kompendium/nlp-vzorce/sleight-of-mouth/som-rozlozeni.md) – příbuzné heslo (Sleight of Mouth, Chunk down)
- [Rozrámcování](@/kompendium/nlp-vzorce/reframing/deframing.md) – příbuzné heslo (Reframing a rámce, De-framing)
- [Obecné a specifické](@/kompendium/nlp-vzorce/metaprogramy/obecne-a-specificke.md) – příbuzné heslo (Metaprogramy, General and specific)
- [Hierarchie myšlenek](@/kompendium/nlp-vzorce/jazykove-vzorce/hierarchie-idei.md) – příbuzné heslo (Jazykové vzorce, Hierarchy of ideas)
- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – příbuzné heslo (Jazykové vzorce, Chunking up)

**V kompendiu**

- [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.2.3 Iluzorní komplexita](@/kompendium/techniques/ea-1-2-3-iluzorni-komplexita.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Chunking nahoru](@/kompendium/nlp-vzorce/jazykove-vzorce/chunking-nahoru.md) – předchozí heslo rodiny
- [Laterální chunking](@/kompendium/nlp-vzorce/jazykove-vzorce/lateralni-chunking.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
