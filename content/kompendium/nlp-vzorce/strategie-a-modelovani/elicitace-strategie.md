+++
title = "Elicitace strategie"
description = "Vzorec NLP, který má odhalit pořadí vnitřních kroků, jimiž člověk dospívá k výsledku: kde slouží sebepoznání a kde mapuje cizí rozhodování pro vliv."
weight = 1
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-strategie-a-modelovani", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Elicitace strategie", "Strategy elicitation", "odhalování strategie", "vyvolání strategie", "Strategie a modelování", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-14.01"
catalog_slug = "elicitace-strategie"
catalog_family = "strategie-a-modelovani"
catalog_family_code = "14"
catalog_family_title = "Strategie a modelování"
catalog_family_en = "Strategies and modelling"
catalog_part = "strategie-a-modelovani"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Strategy elicitation"
catalog_aliases = ["odhalování strategie", "vyvolání strategie"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "strategie-pojem"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["strategie-pojem"]
catalog_related = ["vedouci-system", "predikaty", "ocni-pristupove-signaly", "kalibrace", "strategie-pojem", "tote-model", "elicitace-submodalit", "instalace-strategie", "utilizace-strategie", "smyckove-strategie"]
catalog_related_declared = ["tote-model", "kalibrace", "ocni-pristupove-signaly", "predikaty", "utilizace-strategie", "instalace-strategie"]
catalog_kompendium = ["kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md"]
catalog_canonical = ""
catalog_links_prose = ["glossary/informed-consent.md", "kompendium/forensic-legal/1-forensic-interview-protocol.md", "kompendium/nlp-vzorce/kriticke-hodnoceni/hodnoceni-narodni-rady-pro-vyzkum.md", "kompendium/nlp-vzorce/strategie-a-modelovani/utilizace-strategie.md", "kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md", "kompendium/nlp-vzorce/zakladni-pojmy/predikaty.md", "kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md", "kompendium/nlp-vzorce/zakladni-pojmy/tote-model.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md"]
catalog_prev = ""
catalog_next = "pravopisna-strategie"
catalog_position = 1
catalog_family_size = 20
catalog_sources = ["cialdini-2009", "dilts-delozier-2000", "dilts-1980", "druckman-swets-1988", "kahneman-2011", "loftus-palmer-1974", "miller-galanter-pribram-1960", "oconnor-seymour-1990", "sharpley-1984", "sharpley-1987", "wiseman-2012", "witkowski-2010"]
catalog_sources_primary = ["dilts-delozier-2000", "dilts-1980", "oconnor-seymour-1990"]
catalog_sources_roots = ["miller-galanter-pribram-1960"]
catalog_sources_critical = ["cialdini-2009", "druckman-swets-1988", "kahneman-2011", "loftus-palmer-1974", "sharpley-1984", "sharpley-1987", "wiseman-2012", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/strategie-a-modelovani.toml"
+++

# Elicitace strategie

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-14.01` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Strategie a modelování](@/kompendium/nlp-vzorce/strategie-a-modelovani/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Strategy elicitation |
| **Jiné názvy** | odhalování strategie, vyvolání strategie |
| **Obecnější heslo** | [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Elicitace strategie je v neurolingvistickém programování označení pro postup, kterým praktik zjišťuje, jakým sledem vnitřních kroků druhý člověk dospívá k určitému výsledku, například k rozhodnutí, k pocitu motivace nebo k přesvědčení, že je něco pravda. Výsledkem má být zápis [strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) jako posloupnosti smyslových reprezentací: co člověk venku viděl nebo slyšel, co si vnitřně představil, co si řekl a jaký pocit nakonec rozhodl (Dilts a kol. 1980). Kostrou zápisu je kognitivní [model TOTE](@/kompendium/nlp-vzorce/zakladni-pojmy/tote-model.md), podle něhož cílené jednání probíhá ve smyčkách testu, operace, opakovaného testu a výstupu (Miller, Galanter a Pribram 1960). Elicitace tedy hledá, jaký test člověk provádí, jaké operace mezi testy vykonává a co mu dá signál, že je hotovo. Katalog ji řadí mezi vzorce s dvojím užitím. V terapii, poradenství a vzdělávání může pomoci člověku porozumět vlastnímu postupu. V prodeji, vyjednávání nebo v kontrolujícím vztahu ale slouží ke zmapování cizího rozhodování, aby se podle mapy dalo podat sdělení, které projde bez odporu. Pro kompendium je důležitá právě tato druhá podoba, protože se v rozhovoru tváří jako projev zájmu.

## Původ a souvislosti

Myšlenka, že chování řídí hierarchicky uspořádané plány se zpětnou vazbou, pochází z kognitivní psychologie konce padesátých let, která se tím vymezovala proti výkladu chování jako řetězu podnětů a reakcí (Miller, Galanter a Pribram 1960). Rané NLP tento rámec převzalo a spojilo ho s modelem reprezentačních systémů. V první systematické monografii oboru Dilts, Grinder, Bandler a DeLozierová popsali, jak se strategie zapisuje notací smyslových kanálů a jak ji lze zjistit kombinací otázek, pozorování a navození situace, ve které člověk daný postup znovu prožívá (Dilts a kol. 1980). Za vodítka pozorování považovali zejména slovní [predikáty](@/kompendium/nlp-vzorce/zakladni-pojmy/predikaty.md), tedy smyslově zabarvená slovesa a přídavná jména, a takzvané [oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md), které podle NLP prozrazují, v jakém smyslovém systému člověk právě zpracovává. Pozdější učebnice představily elicitaci jako základní dovednost praktika, bez níž nelze strategii popsat, změnit ani použít (O'Connor a Seymour 1990). Encyklopedie systemického NLP ji uvádí jako samostatné heslo a navazuje na ni postupy, které katalog popisuje odděleně: [využití strategie druhého](@/kompendium/nlp-vzorce/strategie-a-modelovani/utilizace-strategie.md) a instalaci strategie (Dilts a DeLozier 2000). Z hlediska dějin oboru je podstatné, že elicitace stojí na dvou předpokladech, které nebyly nezávisle ověřeny: že vnitřní zpracování má stálé a popsatelné pořadí a že vnější znaky toto pořadí spolehlivě prozrazují.

## Struktura vzorce

Strukturálně se elicitace skládá ze tří prvků. Prvním je vybavení kontextu: rozhovor obrací pozornost člověka k situaci, ve které výsledku dosáhl, například k poslednímu rozhodnutí o koupi nebo k chvíli, kdy si byl něčím jistý. Druhým je sledování sledu: otázky směřují k tomu, co se dělo předtím, co potom a co bylo rozhodující, a odpovědi se třídí podle smyslových kanálů a podle toho, zda šlo o vnější vjem, vybavenou vzpomínku nebo vnitřní konstrukci (Dilts a kol. 1980). Třetím je určení výstupu, tedy kritéria, podle kterého člověk pozná, že je smyčka uzavřena; v jazyce modelu TOTE jde o test, jehož splnění vede k výstupu (Miller, Galanter a Pribram 1960). Výsledná mapa se pak používá k jednomu ze tří cílů: k porozumění, ke změně postupu, nebo k podání sdělení ve stejném pořadí.

Pozorovatel by měl vidět, že sama mapa je konstrukce. Člověk, který odpovídá na otázky po vlastním postupu, nepopisuje přímo vnitřní procesy, ale vytváří jejich věrohodný příběh. Kognitivní psychologie ukazuje, že k procesům, jimiž dospíváme k úsudkům, máme jen omezený introspektivní přístup a že naše zpětná vysvětlení bývají rekonstrukcí ovlivněnou otázkou i očekáváním tazatele (Kahneman 2011). Elicitace tedy nezachycuje strategii, ale spoluvytváří její popis. To je důležité pro obě podoby užití: v poradenství může být takto vzniklý popis užitečnou pracovní hypotézou, ve vlivovém rozhovoru však vytváří iluzi, že tazatel „zná“ mysl druhého.

## Detekční znaky

Elicitace se v běžném rozhovoru pozná podle otázek, které se netýkají obsahu, ale postupu. Mluvčí se ptá, jak člověk poznal, že je něco správné, co se dělo těsně předtím, než se rozhodl, zda věc nejprve viděl, slyšel, nebo cítil, kolikrát ji potřeboval zažít a jaký pocit ho nakonec přesvědčil. Často žádá, aby si člověk danou situaci znovu vybavil „jako by byl zase tam“, a pozorně sleduje jeho pohled, tón a gesta. Takové otázky mohou být neškodné. Varovným znakem je jejich načasování a návaznost: přicházejí těsně před předložením nabídky nebo požadavku a po nich následuje podání, které nápadně kopíruje popsaný sled. Dalším znakem je, že tazatel o zjištěném postupu nemluví s člověkem otevřeně, ale ponechá si ho pro sebe. V kontrolujících vztazích se elicitace může objevit jako opakované vyptávání, co druhého uklidní, co ho přesvědčí a co ho zlomí, s pozdějším využitím odpovědí. Jazyk plný odborných zkratek a schémat přitom může vyvolat dojem přesnosti, který kompendium rozebírá u [terminologické mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md). Sharpley upozornil, že tvrzení NLP bývají formulována tak, že je lze vysvětlit dodatečně bez ohledu na výsledek, a jsou proto obtížně testovatelná (Sharpley 1987).

## Legitimní a manipulativní užití

Legitimní užití je otevřené a slouží cíli, který si zvolil dotazovaný. Studijní poradkyně, která se studenta ptá, jak se mu dříve dařilo učit, a hledá s ním postup pro nový předmět, dělá v podstatě totéž, co běžná pedagogická reflexe. Klinik, který se pacienta ptá, jak se rozhoduje o léčbě, aby mu mohl podat informace ve vhodné formě a dát mu čas, podporuje [informovaný souhlas](@/glossary/informed-consent.md). V obou případech se zjištění sdílí a výsledek zůstává otevřený. Manipulativní užití je skryté a slouží cíli tazatele. V prodejních kurzech, které se na NLP odvolávají, se zjištění nákupního postupu zákazníka představuje jako cesta k tomu, aby nabídka „prošla správnými kroky“; o skutečném rozhodnutí zákazníka se přitom mluví jako o mechanismu, který stačí obsloužit. Ve vyšetřovacím prostředí je podstatné, že dotazování, které vede vypovídajícího k určitému popisu, může jeho výpověď ovlivnit; forenzní praxe proto preferuje otevřené otázky bez sugesce, jak popisuje stránka [forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md). Výzkum paměti ukázal, že i drobná změna formulace otázky mění, co si svědek vybaví (Loftus a Palmer 1974). Rozlišující otázky jsou tři: ví dotazovaný, k čemu odpovědi poslouží; zůstává zjištění jemu k dispozici; a může bez následků odmítnout pokračovat?

## Stav důkazů

Obecná myšlenka, že jednání probíhá ve zpětnovazebních smyčkách, patří do historie kognitivní vědy a v obecné rovině je přijímána (Miller, Galanter a Pribram 1960). Specifická tvrzení, na nichž elicitace v NLP stojí, však empirickou oporu nemají. Výzkum predikátů a preferovaného reprezentačního systému nenašel spolehlivý vztah mezi slovy, která člověk volí, a jeho údajným smyslovým zpracováním (Sharpley 1984). Experimentální ověření tvrzení o pohybech očí nenašlo pro jejich výklad oporu ani v oblasti, kde se jim v populární literatuře připisovalo nejvíce, tedy při odhalování lži (Wiseman a kol. 2012). Souhrnná hodnocení oboru dospěla k závěru, že většina kontrolovaných studií tvrzení NLP nepodporuje (Witkowski 2010), a [hodnocení Národní rady pro výzkum USA](@/kompendium/nlp-vzorce/kriticke-hodnoceni/hodnoceni-narodni-rady-pro-vyzkum.md) nenašlo doklady, že by techniky NLP zvyšovaly výkon (Druckman a Swets 1988). O elicitaci strategie jako takové nebyly v dostupné literatuře nalezeny kontrolované studie spolehlivosti, tedy toho, zda dva nezávislí praktici u téhož člověka zapíší tutéž strategii. Bez takového ověření je zápis strategie hypotézou tazatele, nikoli zjištěním.

## Obrana a zotavení

Základní obranou je rozpoznat, kdy rozhovor přestal být o věci a začal být o vašem postupu. Na otázky, jak se rozhodujete, co vás přesvědčí nebo co se dělo těsně předtím, než jste si byli jistí, nemusíte odpovídat; můžete je vrátit k obsahu a mluvit o tom, co od nabídky potřebujete. Druhou obranou je vědět, že vaše odpovědi jsou rekonstrukce a že nikdo z nich nezískal přístup k vaší mysli (Kahneman 2011). Kdo tvrdí opak, nabízí hypotézu, kterou lze odmítnout. Třetí obranou je zpomalení: pokud po sérii otázek přijde nabídka, která „přesně sedí“, je to důvod odložit rozhodnutí a posoudit ji jinde a s jinými lidmi. Sociální psychologie vlivu ukazuje, že lidé se pod časovým tlakem a v příjemném kontaktu snáze spoléhají na zkratky (Cialdini 2009). Pro odborníky, kteří s elicitací pracují, platí, že zjištění patří klientovi, má se s ním otevřeně sdílet a nemá se použít k cíli, se kterým nesouhlasil. U lidí, jejichž postupy byly dlouhodobě mapovány a využívány v kontrolujícím vztahu, se zotavení zaměřuje na obnovu důvěry ve vlastní úsudek a na zkušenost, že lze o sobě mluvit, aniž by z toho vznikla páka.

## Literatura

- Cialdini, R. B. (2009). *Influence: Science and Practice* (5. vyd.). Boston: Pearson.
- Dilts, R., & DeLozier, J. (2000). *Encyclopedia of Systemic Neuro-Linguistic Programming and NLP New Coding*. Scotts Valley: NLP University Press.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Loftus, E. F., & Palmer, J. C. (1974). Reconstruction of automobile destruction: An example of the interaction between language and memory. *Journal of Verbal Learning and Verbal Behavior*, 13(5), 585–589.
- Miller, G. A., Galanter, E., & Pribram, K. H. (1960). *Plans and the Structure of Behavior*. New York: Holt, Rinehart and Winston.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Sharpley, C. F. (1984). Predicate matching in NLP: A review of research on the preferred representational system. *Journal of Counseling Psychology*, 31(2), 238–248.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Wiseman, R., Watt, C., ten Brinke, L., Porter, S., Couper, S.-L., & Rankin, C. (2012). The eyes don't have it: Lie detection and neuro-linguistic programming. *PLoS ONE*, 7(7), e40259.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Související

**Rodina a hierarchie**

- [Strategie a modelování](@/kompendium/nlp-vzorce/strategie-a-modelovani/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Vedoucí systém](@/kompendium/nlp-vzorce/zakladni-pojmy/vedouci-system.md) – příbuzné heslo (Základní pojmy NLP, Lead system)
- [Predikáty](@/kompendium/nlp-vzorce/zakladni-pojmy/predikaty.md) – příbuzné heslo (Základní pojmy NLP, Predicates)
- [Oční přístupové signály](@/kompendium/nlp-vzorce/zakladni-pojmy/ocni-pristupove-signaly.md) – příbuzné heslo (Základní pojmy NLP, Eye accessing cues)
- [Kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) – příbuzné heslo (Základní pojmy NLP, Calibration)
- [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) – příbuzné heslo (Základní pojmy NLP, Strategy (concept))
- [Model TOTE](@/kompendium/nlp-vzorce/zakladni-pojmy/tote-model.md) – příbuzné heslo (Základní pojmy NLP, TOTE model)
- [Elicitace submodalit](@/kompendium/nlp-vzorce/submodality/elicitace-submodalit.md) – příbuzné heslo (Submodality, Eliciting submodalities)
- [Instalace strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/instalace-strategie.md) – příbuzné heslo (Strategie a modelování, Strategy installation)
- [Využití strategie druhého](@/kompendium/nlp-vzorce/strategie-a-modelovani/utilizace-strategie.md) – příbuzné heslo (Strategie a modelování, Strategy utilisation)
- [Smyčkové strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/smyckove-strategie.md) – příbuzné heslo (Strategie a modelování, Looping strategies)

**V kompendiu**

- [Forenzní rozhovor](@/kompendium/forensic-legal/1-forensic-interview-protocol.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Pravopisná strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/pravopisna-strategie.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
