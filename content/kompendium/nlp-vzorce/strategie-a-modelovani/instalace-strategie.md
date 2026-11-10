+++
title = "Instalace strategie"
description = "Zavedení nové posloupnosti vnitřních operací tak, aby běžela automaticky: od výuky dovedností po vnucování cizích rozhodovacích pravidel. Znaky, důkazy a obrana."
weight = 16
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-strategie-a-modelovani", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Instalace strategie", "Strategy installation", "installing a strategy", "Strategie a modelování", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-14.16"
catalog_slug = "instalace-strategie"
catalog_family = "strategie-a-modelovani"
catalog_family_code = "14"
catalog_family_title = "Strategie a modelování"
catalog_family_en = "Strategies and modelling"
catalog_part = "strategie-a-modelovani.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Strategy installation"
catalog_aliases = ["installing a strategy"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = "strategie-pojem"
catalog_narrower = []
catalog_depth = 1
catalog_ancestors = ["strategie-pojem"]
catalog_related = ["strategie-pojem", "kotveni", "budouci-prehravani", "elicitace-strategie", "pravopisna-strategie", "strategie-uceni", "utilizace-strategie", "generator-noveho-chovani"]
catalog_related_declared = ["elicitace-strategie", "utilizace-strategie", "kotveni", "budouci-prehravani", "strategie-uceni"]
catalog_kompendium = ["kompendium/techniques/ea-8-2-3-singer-six-conditions.md", "kompendium/techniques/ea-8-1-1-bite-model-detail.md", "kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/kotveni/kotveni.md", "kompendium/nlp-vzorce/kriticke-hodnoceni/databaze-vyzkumu-nlp.md", "kompendium/nlp-vzorce/strategie-a-modelovani/elicitace-strategie.md", "kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md", "kompendium/nlp-vzorce/zakladni-pojmy/vnitrni-dialog.md", "kompendium/techniques/ea-8-2-3-singer-six-conditions.md"]
catalog_prev = "periferni-videni"
catalog_next = "utilizace-strategie"
catalog_position = 16
catalog_family_size = 20
catalog_sources = ["beck-1976", "dilts-1980", "druckman-swets-1988", "festinger-1957", "freedman-fraser-1966", "hassan-1988", "heap-1988", "herman-1992", "mcguire-1964", "miller-galanter-pribram-1960", "sharpley-1987", "singer-lalich-1995", "witkowski-2010", "wolpe-1958"]
catalog_sources_primary = ["dilts-1980"]
catalog_sources_roots = ["miller-galanter-pribram-1960"]
catalog_sources_critical = ["beck-1976", "druckman-swets-1988", "festinger-1957", "freedman-fraser-1966", "hassan-1988", "heap-1988", "herman-1992", "mcguire-1964", "sharpley-1987", "singer-lalich-1995", "witkowski-2010", "wolpe-1958"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/strategie-a-modelovani.b.toml"
+++

# Instalace strategie

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-14.16` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Strategie a modelování](@/kompendium/nlp-vzorce/strategie-a-modelovani/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Strategy installation |
| **Jiné názvy** | installing a strategy |
| **Obecnější heslo** | [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | vysoké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Instalací strategie se v NLP označuje zavedení nové posloupnosti vnitřních a vnějších operací, kterou má člověk napříště používat automaticky, bez vědomého řízení. Strategií se v tomto pojetí rozumí uspořádaný sled kroků zpracování, například vybavení obrazu, vnitřní komentář, pocit a test, který vede k určitému výsledku: rozhodnutí, zapamatování slova, motivaci k činnosti nebo přesvědčení, že něco je pravda. Instalace je jednou z operací, které NLP se strategiemi provádí, vedle jejich zjišťování, takzvané elicitace, a jejich využití v komunikaci (Dilts a kol. 1980). Zatímco elicitace se ptá, jak člověk něco dělá nyní, instalace usiluje o to, aby to dělal jinak. V terapeutickém a vzdělávacím pojetí jde o výuku dovednosti, například nového způsobu, jak si pamatovat pravopis nebo jak se rozhodovat méně impulzivně. Ve vlivovém pojetí jde o zavedení rozhodovacích a hodnoticích pravidel, která slouží někomu jinému. Proto kompendium zařazuje instalaci strategie mezi vzorce s vysokým rizikem zneužití: její struktura je stejná v obou případech a rozdíl spočívá v tom, čí kritéria nová strategie obsahuje a zda o jejím přijetí člověk svobodně rozhodl.

## Původ a souvislosti

Model strategií je jednou z nejsoustavněji vypracovaných částí raného NLP. Jeho východiskem je kybernetický model jednotky chování, kterou Miller, Galanter a Pribram nazvali TOTE: chování je smyčka testu, operace, nového testu a výstupu, v níž organismus porovnává stav s cílem a jedná, dokud rozdíl nezmizí (Miller, Galanter a Pribram 1960). NLP tento model doplnilo o [reprezentační systémy](@/kompendium/nlp-vzorce/zakladni-pojmy/reprezentacni-systemy.md), takže jednotlivé operace a testy se popisují jako vizuální, auditivní nebo kinestetické kroky. Dilts, Grinder, Bandler a DeLozierová v prvním svazku systematického výkladu NLP popsali strategie, jejich zápis a operace s nimi, včetně instalace, a jako prostředky instalace uvádějí především opakovaný nácvik a vazbu jednotlivých částí posloupnosti na podněty, tedy [kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) (Dilts a kol. 1980). Nejčastěji citovaným příkladem je takzvaná pravopisná strategie, při níž se slabým pravopiscům nabízí postup založený na vybavení zrakové podoby slova. Podobné myšlenky má i behaviorální tradice: nové chování se upevňuje opakováním, posilováním a postupným přechodem od vědomého řízení k automatickému provádění (Wolpe 1958). NLP se od ní liší tím, že klade důraz na vnitřní reprezentace, a tím, že svá tvrzení ověřovalo hlavně v seminářích, nikoli v kontrolovaných studiích.

## Struktura vzorce

Strukturálně má instalace strategie tři složky. První je návrh posloupnosti, tedy rozhodnutí, jaké vnitřní operace a v jakém pořadí má člověk provádět; ten může vycházet z [elicitace strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/elicitace-strategie.md) u někoho, kdo danou věc dělá úspěšně. Druhá složka je zavedení: opakování posloupnosti, vazba jejích částí na podněty a zkouška v představě situací, kde se má uplatnit. Třetí složka je automatizace, tedy stav, kdy posloupnost probíhá bez vědomého řízení a člověk ji prožívá jako vlastní přirozený způsob jednání (Dilts a kol. 1980). Pro pozorovatele je klíčová otázka obsahu testů. Každá strategie obsahuje body, v nichž se porovnává, zda je výsledek dostatečný. Kdo navrhuje strategii, rozhoduje o tom, jaká kritéria v těchto testech budou. V pravopisné strategii je kritériem shoda se správně napsaným slovem, které lze ověřit ve slovníku. V rozhodovací strategii zavedené v prodejní skupině může být kritériem to, „co by udělal tým“, nebo vybavení hlasu vedoucího. Tím se cizí autorita stává součástí vnitřního rozhodování a člověk ji přestává vnímat jako vnější vliv. Struktura se tak dotýká jádra autonomie: nemění jedno rozhodnutí, ale způsob, jakým se rozhoduje napříště. Zavádění bývá postupné; malé počáteční souhlasy usnadňují pozdější větší změny, což dobře popisuje výzkum postupného stupňování závazků (Freedman a Fraser 1966).

## Detekční znaky

Instalace strategie se v rozhovoru pozná podle toho, že mluvčí nenabízí jednorázovou radu, ale nový trvalý postup, a že s ním spojuje opakování a nácvik. Varovné znaky souvisejí s obsahem a s okolnostmi. Prvním znakem je cizí kritérium: v nové posloupnosti se objevuje hlas, obraz nebo hodnocení konkrétní autority, které má nahradit vlastní zvažování. Druhým znakem je likvidace pochybnosti: nový postup má odstranit „dumání“, „váhání“ nebo „přemýšlení“, tedy právě ty operace, které umožňují člověku zastavit se a zvážit. Třetím znakem je neprůhlednost cíle: člověk ví, jak má nově jednat, ale neví, komu to slouží, a otázka po účelu se odbude. Čtvrtým znakem je spojení nácviku s odměnou a trestem ve skupině, kdy se nové chování veřejně oceňuje a staré zesměšňuje. Tento znak odpovídá podmínkám myšlenkové reformy, jak je popsaly Singerová a Lalichová, mezi něž patří potlačení starého chování a zavádění nového v uzavřeném systému (Singer a Lalich 1995), a kompendium je rozebírá na stránce o [šesti podmínkách myšlenkové reformy](@/kompendium/techniques/ea-8-2-3-singer-six-conditions.md). Pátým znakem je tvrzení, že nová strategie je „přirozenější“ nebo „autentičtější“ než dosavadní způsob jednání, ačkoli ji navrhl někdo jiný. Hassan popisuje kontrolu myšlení v kultovních skupinách jako soustavné zavádění myšlenkových postupů, které zastavují kritické úvahy, a řadí ji vedle kontroly chování, informací a emocí (Hassan 1988).

## Legitimní a manipulativní užití

Legitimní užití instalace strategie se podobá výuce dovedností, jak ji zná pedagogika a behaviorální terapie. Učitel nabídne žákovi nový postup při psaní slov, terapeut nabídne klientovi způsob, jak zpomalit impulzivní rozhodování, kouč nabídne postup přípravy na jednání. Společné mají tři rysy: člověk ví, co se učí a proč, kritéria postupu jsou jeho vlastní nebo veřejně ověřitelná a postup může kdykoli odmítnout či upravit. Kognitivní terapie podobně učí klienty nové způsoby zpracování myšlenek, ale vždy tak, aby je klient mohl sám ověřovat a aby se zvyšovala jeho samostatnost (Beck 1976). Manipulativní užití zachovává techniku a mění všechny tři rysy. Člověk neví, že se mu mění způsob rozhodování; kritéria patří autoritě, skupině nebo firmě; a odmítnutí je spojeno se ztrátou přijetí. Typickým prostředím jsou prodejní a náborové organizace s pyramidovou strukturou, uzavřené rozvojové skupiny a kontrolující vztahy, kde partner postupně zavádí pravidla typu „než se rozhodneš, zeptej se, co bych tomu řekl já“. Rozdíl mezi oběma užitími se nejlépe pozná podle výsledku: legitimní instalace zvyšuje schopnost člověka jednat samostatně, manipulativní ji snižuje.

## Stav důkazů

Model strategií je srozumitelný a navazuje na zavedené kybernetické a behaviorální myšlenky (Miller, Galanter a Pribram 1960). Specifická tvrzení NLP o instalaci strategií jsou však empiricky slabě podložena. Neexistuje soustavný výzkum, který by ukázal, že instalace podle NLP vede k lepším výsledkům než běžný nácvik, opakování a zpětná vazba. Navíc řada strategií se popisuje pomocí reprezentačních systémů a očních přístupových signálů, a právě tato tvrzení byla v kontrolovaných studiích opakovaně nepotvrzena (Sharpley 1987; Heap 1988). Národní rada pro výzkum USA při hodnocení technik zvyšování výkonu nenašla pro NLP vědeckou oporu (Druckman a Swets 1988) a pozdější přehled [databáze výzkumu NLP](@/kompendium/nlp-vzorce/kriticke-hodnoceni/databaze-vyzkumu-nlp.md) došel k obdobnému závěru (Witkowski 2010). Naopak obecné poznatky o tom, jak se nové chování upevňuje opakováním a jak se postoje přizpůsobují jednání, jsou dobře doložené. Festinger ukázal, že když člověk jedná v rozporu se svými postoji, má sklon postoje upravit tak, aby s jednáním souhlasily (Festinger 1957). Pro vlivové užití to znamená, že zavedení nového způsobu jednání může mít účinek, i když vysvětlení, které mu dává NLP, není potvrzeno.

## Obrana a zotavení

První obranou je ptát se po kritériích. Když někdo nabízí nový způsob, jak se rozhodovat, hodnotit nebo reagovat, je užitečné zjistit, podle čeho nový postup pozná, že je hotovo, a zda jsou tato měřítka vlastní, nebo patří někomu jinému. Postup, jehož součástí je „hlas vedoucího“ nebo „co by řekla skupina“, přenáší autoritu dovnitř úsudku. Druhou obranou je chránit pochybnost. Zvažování a váhání nejsou vady, které je třeba odstranit, ale funkce, které umožňují zastavit se před chybou. Postup, který je slibuje „vypnout“, zasahuje do schopnosti sebeochrany. Třetí obranou je zkouška reverzibility: legitimní dovednost lze kdykoli odložit nebo upravit bez ztráty vztahu či postavení. Kde to nejde, jde o kontrolu. U lidí, kteří odešli z prostředí, kde byly takové postupy zaváděny dlouhodobě, se po odchodu často objevují automatické reakce, například [vnitřní hlas](@/kompendium/nlp-vzorce/zakladni-pojmy/vnitrni-dialog.md) bývalého vedoucího při rozhodování. V péči o ně pomáhá tyto reakce pojmenovat jako naučené, a tedy změnitelné, a postupně obnovovat vlastní měřítka v bezpečném vztahu (Herman 1992). Předem získané povědomí o tom, jak takové zavádění probíhá, usnadňuje jeho rozpoznání v počátcích (McGuire 1964).

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Festinger, L. (1957). *A Theory of Cognitive Dissonance*. Stanford: Stanford University Press.
- Freedman, J. L., & Fraser, S. C. (1966). Compliance without pressure: The foot-in-the-door technique. *Journal of Personality and Social Psychology*, 4(2), 195–202.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Heap, M. (1988). Neurolinguistic programming: An interim verdict. In M. Heap (Ed.), *Hypnosis: Current Clinical, Experimental and Forensic Practices* (pp. 268–280). London: Croom Helm.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- McGuire, W. J. (1964). Inducing resistance to persuasion: Some contemporary approaches. In L. Berkowitz (Ed.), *Advances in Experimental Social Psychology* (Vol. 1, pp. 191–229). New York: Academic Press.
- Miller, G. A., Galanter, E., & Pribram, K. H. (1960). *Plans and the Structure of Behavior*. New York: Holt, Rinehart and Winston.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Singer, M. T., & Lalich, J. (1995). *Cults in Our Midst*. San Francisco: Jossey-Bass.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.
- Wolpe, J. (1958). *Psychotherapy by Reciprocal Inhibition*. Stanford: Stanford University Press.

## Související

**Rodina a hierarchie**

- [Strategie a modelování](@/kompendium/nlp-vzorce/strategie-a-modelovani/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) – příbuzné heslo (Základní pojmy NLP, Strategy (concept))
- [Kotvení](@/kompendium/nlp-vzorce/kotveni/kotveni.md) – příbuzné heslo (Kotvení, Anchoring)
- [Budoucí přehrávání](@/kompendium/nlp-vzorce/casova-osa/budouci-prehravani.md) – příbuzné heslo (Časová osa, Future pacing)
- [Elicitace strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/elicitace-strategie.md) – příbuzné heslo (Strategie a modelování, Strategy elicitation)
- [Pravopisná strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/pravopisna-strategie.md) – příbuzné heslo (Strategie a modelování, Spelling strategy)
- [Strategie učení](@/kompendium/nlp-vzorce/strategie-a-modelovani/strategie-uceni.md) – příbuzné heslo (Strategie a modelování, Learning strategy)
- [Využití strategie druhého](@/kompendium/nlp-vzorce/strategie-a-modelovani/utilizace-strategie.md) – příbuzné heslo (Strategie a modelování, Strategy utilisation)
- [Generátor nového chování](@/kompendium/nlp-vzorce/strategie-a-modelovani/generator-noveho-chovani.md) – příbuzné heslo (Strategie a modelování, New behaviour generator)

**V kompendiu**

- [EA-8.2.3 Šest podmínek myšlenkové reformy (Singerová)](@/kompendium/techniques/ea-8-2-3-singer-six-conditions.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-8.1.1 Model BITE v praxi (Hassan)](@/kompendium/techniques/ea-8-1-1-bite-model-detail.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [6.3 Terapeutické přístupy — přehled](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Periferní vidění](@/kompendium/nlp-vzorce/strategie-a-modelovani/periferni-videni.md) – předchozí heslo rodiny
- [Využití strategie druhého](@/kompendium/nlp-vzorce/strategie-a-modelovani/utilizace-strategie.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
