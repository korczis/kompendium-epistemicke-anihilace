+++
title = "Model TOTE"
description = "Kognitivní model smyčky test, operace, test a výstup, který NLP převzalo jako kostru strategií: co skutečně říká, kde končí jeho opora a jak se zneužívá jako žargon."
weight = 19
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-zakladni-pojmy", "nlp-pojem", "nlp-uziti-zadne"]
categories = ["academic"]

[extra]
toc = true
risk_level = "low"
lang = "cs"
keywords = ["Model TOTE", "TOTE model", "Test-Operate-Test-Exit", "smyčka test–operace–test–výstup", "Základní pojmy NLP", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-02.19"
nlp_slug = "tote-model"
nlp_family = "zakladni-pojmy"
nlp_family_code = "02"
nlp_family_title = "Základní pojmy NLP"
nlp_family_en = "Core NLP concepts"
nlp_part = "zakladni-pojmy.b"
nlp_type = "concept"
nlp_type_cs = "pojem"
nlp_en = "TOTE model"
nlp_aliases = ["Test-Operate-Test-Exit", "smyčka test–operace–test–výstup"]
nlp_use = "zadne"
nlp_use_cs = "výkladový pojem"
nlp_risk = "nizke"
nlp_risk_cs = "nízké"
nlp_broader = ""
nlp_narrower = []
nlp_depth = 0
nlp_ancestors = []
nlp_related = ["neni-selhani-jen-zpetna-vazba", "zakon-pozadovane-variety", "kdyz-to-nefunguje-udelej-neco-jineho", "zkusenost-ma-strukturu", "kalibrace", "strategie-pojem", "selhani-jako-zpetna-vazba-vzorec", "uroven-schopnosti", "model-score", "elicitace-strategie", "rozhodovaci-strategie", "strategie-geniality", "generator-noveho-chovani", "smyckove-strategie", "dobre-formulovany-vysledek", "dukazni-procedura"]
nlp_related_declared = ["strategie-pojem", "smyckove-strategie", "elicitace-strategie", "kalibrace", "dobre-formulovany-vysledek"]
nlp_kompendium = ["kompendium/07-teoreticke-reflexe/kognitivni-vedy.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md"]
nlp_links_prose = ["kompendium/nlp-vzorce/cile-a-vysledky/dobre-formulovany-vysledek.md", "kompendium/nlp-vzorce/kriticke-hodnoceni/hodnoceni-narodni-rady-pro-vyzkum.md", "kompendium/nlp-vzorce/strategie-a-modelovani/smyckove-strategie.md", "kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md", "kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md"]
nlp_prev = "strategie-pojem"
nlp_next = "logicke-urovne-pojem"
nlp_position = 19
nlp_family_size = 42
nlp_sources = ["bateson-1972", "beck-1976", "dilts-delozier-2000", "dilts-1980", "druckman-swets-1988", "hassan-1988", "lifton-1961", "miller-galanter-pribram-1960", "roderique-davies-2009", "witkowski-2010"]
nlp_sources_primary = ["dilts-delozier-2000", "dilts-1980"]
nlp_sources_roots = ["bateson-1972", "miller-galanter-pribram-1960"]
nlp_sources_critical = ["beck-1976", "druckman-swets-1988", "hassan-1988", "lifton-1961", "roderique-davies-2009", "witkowski-2010"]
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/zakladni-pojmy.b.toml"
+++

# Model TOTE

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-02.19` |
| **Rodina** | [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) |
| **Druh** | pojem |
| **Anglicky** | TOTE model |
| **Jiné názvy** | Test-Operate-Test-Exit, smyčka test–operace–test–výstup |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | nízké |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Model TOTE, zkratka anglických slov test, operate, test, exit, popisuje cílené chování jako zpětnovazební smyčku. Organismus nejprve porovná současný stav s určitým kritériem (test). Pokud stav kritériu neodpovídá, provede operaci, která má rozdíl zmenšit (operate). Poté znovu porovná (test) a pokračuje, dokud rozdíl nezmizí; teprve pak smyčka končí (exit). Autoři modelu jej navrhli jako náhradu za představu reflexního oblouku, podle které chování tvoří jednoduché řetězy podnětů a reakcí, a zdůraznili, že smyčky lze vnořovat: operace jedné smyčky může sama obsahovat další smyčky, takže vzniká hierarchie plánů (Miller, Galanter a Pribram 1960). Neurolingvistické programování model převzalo jako kostru pojmu [strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md): jednotlivé testy a operace v něm zaplnilo smyslovými reprezentacemi (Dilts a kol. 1980). V tomto katalogu je model zařazen jako výkladový pojem, protože sám o sobě není vlivovým vzorcem. Pro kompendium je důležitý ze dvou důvodů. Pomáhá rozumět tomu, proč může být člověk uvězněn v nekonečném úsilí, když kritérium úspěchu stanoví někdo jiný, a zároveň je příkladem pojmu, jehož vědecký původ se v NLP využívá k propůjčení autority tvrzením, která už vědecky podložena nejsou.

## Původ a souvislosti

Model vznikl na přelomu padesátých a šedesátých let v prostředí, kde se psychologie odvracela od přísného behaviorismu a inspirovala se kybernetikou a informatikou. Miller, Galanter a Pribram v knize o plánech a struktuře chování tvrdili, že pro porozumění cílenému jednání je třeba počítat s vnitřní reprezentací cíle a se zpětnou vazbou, a jako ilustraci použili tak všední činnost, jako je zatloukání hřebíku: úder se opakuje, dokud hřebík není zatlučen (Miller, Galanter a Pribram 1960). Model se stal jedním z milníků takzvané kognitivní revoluce a byl později rozvinut i kritizován v rámci kognitivní vědy. Gregory Bateson pracoval s příbuznými kybernetickými myšlenkami zpětné vazby a samoregulace v teorii komunikace a učení (Bateson 1972). NLP model převzalo v rané systematizaci oboru a spojilo ho s notací reprezentačních systémů, takže každá strategie měla podobu sledu testů a operací v jednotlivých smyslech (Dilts a kol. 1980). Encyklopedie systemického NLP pak řadí TOTE mezi základní pojmy oboru (Dilts a DeLozier 2000).

## Struktura vzorce

Strukturálně má model čtyři prvky a dvě vztahové vlastnosti. Prvky jsou kritérium, se kterým se porovnává, test, operace a výstup. Vlastnostmi jsou zpětná vazba, tedy to, že výsledek operace se vrací do testu, a hierarchie, tedy to, že smyčky se mohou vnořovat do sebe. NLP k tomu přidává tvrzení, že každý test a každá operace probíhají v určitém smyslovém systému, a že problémy vznikají, když kritérium chybí, je nedosažitelné nebo je test založen na nevhodné reprezentaci. Takové poruchy se v katalogu popisují v hesle [smyčkové strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/smyckove-strategie.md). S modelem souvisí i [dobře formulovaný výsledek](@/kompendium/nlp-vzorce/cile-a-vysledky/dobre-formulovany-vysledek.md), protože NLP požaduje, aby cíl měl smyslový důkaz dosažení, tedy test, podle kterého člověk pozná, že může skončit (Dilts a kol. 1980).

Z obranného hlediska je nejzajímavější otázka, kdo stanoví kritérium testu. Pokud ho stanoví člověk sám a je dosažitelné, smyčka po čase skončí a člověk může přejít k dalšímu cíli. Pokud ho stanoví někdo jiný a je mlhavé nebo nedosažitelné, smyčka nikdy nedojde k výstupu: člověk se snaží, porovnává, selhává a znovu se snaží. Tato struktura je dobře vidět v prostředích s vysokou mírou kontroly. Lifton popsal požadavek čistoty jako jeden z rysů totalitního myšlení: ideál je stanoven tak, že ho nikdo nemůže dosáhnout, a z trvalého selhávání plyne vina a závislost na autoritě, která určuje, co je čisté (Lifton 1961). V jazyce modelu jde o test, jehož kritérium drží v rukou někdo jiný a nikdy ho neuzná za splněné.

## Detekční znaky

Model se v rozhovoru objevuje ve dvou podobách. První je odborná: mluvčí vysvětluje, že chování je řízeno zpětnou vazbou, a popisuje smyčku testu a operace. To je výklad, ne vliv. Druhá podoba je žargonová a pozná se podle toho, že se zkratka TOTE a s ní spojená slova, jako je smyčka, výstup nebo program, používají jako nálepky pro lidské obtíže a pochybnosti. Pochybnost se tak označí za „smyčku bez výstupu“, nesouhlas za „chybný test“ a odmítnutí za „program, který je třeba přepsat“. Varovné je, když nálepka nahrazuje projednání obsahu: místo aby se mluvilo o tom, proč člověk pochybuje, se mluví o tom, jak jeho pochybnost odstranit. Druhým znakem je kontrola kritéria. Ve skupině nebo ve vztahu se neustále posouvá, co je dost dobré, a člověk se o tom dozvídá jen od autority. Třetím znakem je vědecký lesk: odkaz na kognitivní psychologii a kybernetiku se používá k tomu, aby tvrzení o „přeprogramování“ působila jako ověřená věda. Kompendium tento jev obecně popisuje jako [terminologickou mystifikaci](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md). Kritici NLP upozorňují, že obor rád přejímá terminologii z věd, aniž by přebíral jejich metody ověřování (Roderique-Davies 2009).

## Legitimní a manipulativní užití

Legitimní užití je výkladové a sebereflexivní. V psychologii je model užitečným historickým i didaktickým příkladem toho, jak lze popsat cílené chování pomocí zpětné vazby (Miller, Galanter a Pribram 1960). Pro jednotlivce může být užitečný jako otázka: podle čeho poznám, že jsem hotov? Kdo si u úkolu, který nikdy nekončí, uvědomí, že nemá jasné kritérium, nebo že ho stanovil někdo jiný a stále ho posouvá, získá důležitou informaci. Podobně kognitivní terapie pracuje s absolutními pravidly a požadavky, které si člověk klade, i když bez tohoto modelu a s vlastním teoretickým zázemím (Beck 1976). Manipulativní užití má dvě podoby. První je žargonová: model se používá k tomu, aby se pochybnosti a námitky prohlásily za technickou poruchu, kterou „odborník“ opraví, a tím se z rozhovoru vyřadí otázka, zda pochybnosti nejsou oprávněné. Druhá je strukturální: autorita si ponechává kontrolu nad kritériem úspěchu a člověka drží v nekonečné smyčce snahy, ve které se nikdy nedostane k výstupu, a tedy ani ke svobodnému rozhodnutí odejít.

## Stav důkazů

Model TOTE je historicky významný kognitivní model a v obecné rovině, jako popis zpětnovazebního řízení cíleného chování, je přijímán (Miller, Galanter a Pribram 1960). Pozdější kognitivní věda ho rozvinula do podrobnějších modelů řízení činnosti a pracovní paměti; samotné NLP však na tento vývoj nenavázalo. To, co NLP z modelu odvodilo, tedy tvrzení, že lidské strategie lze zachytit jako sledy smyslových reprezentací v podobě smyček a že jejich přepsáním se spolehlivě změní chování, nebylo kontrolovaně ověřeno. Kritické přehledy NLP konstatují, že naprostá většina jeho tvrzení nemá oporu v empirickém výzkumu (Witkowski 2010), a [hodnocení Národní rady pro výzkum USA](@/kompendium/nlp-vzorce/kriticke-hodnoceni/hodnoceni-narodni-rady-pro-vyzkum.md) nenašlo podporu pro tvrzení oboru o zlepšování výkonu (Druckman a Swets 1988). Kritika označující NLP za kargokultovní psychologii poukazuje právě na přejímání vědecké terminologie bez odpovídajících metod (Roderique-Davies 2009). Z toho plyne rozlišení: model sám je legitimní součástí dějin psychologie, ale jeho přítomnost v textu NLP neznamená, že techniky, které se na něj odvolávají, jsou vědecky podložené.

## Obrana a zotavení

První obranou je přeložit žargon do běžné řeči. Pokud někdo označí vaše pochybnosti za smyčku bez výstupu, je užitečné zeptat se: o čem přesně pochybuji, a mám k tomu dobré důvody? Pochybnost je v jazyce modelu test, který nebyl splněn, a to může znamenat, že něco skutečně není v pořádku. Druhou obranou je převzít kritérium. U úkolů a nároků, které nikdy nekončí, je rozumné stanovit si vlastní, konkrétní a dosažitelné měřítko toho, co je dost, a nenechat ho určovat někoho, kdo z vaší nekonečné snahy těží. Třetí obranou je skepse vůči vědeckému lesku: odkaz na kognitivní vědu nebo kybernetiku nedokládá účinnost techniky, která se na ně odvolává (Roderique-Davies 2009). U lidí, kteří odešli z prostředí s nedosažitelnými ideály, bývá zotavení spojeno s přetrvávající vinou a s pocitem, že nikdy nejsou dost dobří. Terapie v takových případech pracuje s rozpoznáním, že kritérium bylo stanoveno tak, aby splnit nešlo, a s postupnou obnovou vlastních měřítek; literatura o odchodu z kultovních skupin popisuje tento proces jako součást obnovy samostatného úsudku (Hassan 1988).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Bateson, G. (1972). *Steps to an Ecology of Mind*. San Francisco: Chandler.
- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Dilts, R., & DeLozier, J. (2000). *Encyclopedia of Systemic Neuro-Linguistic Programming and NLP New Coding*. Scotts Valley: NLP University Press.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Druckman, D., & Swets, J. A. (Eds.) (1988). *Enhancing Human Performance: Issues, Theories, and Techniques*. Washington, DC: National Academy Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Miller, G. A., Galanter, E., & Pribram, K. H. (1960). *Plans and the Structure of Behavior*. New York: Holt, Rinehart and Winston.
- Roderique-Davies, G. (2009). Neuro-linguistic programming: Cargo cult psychology? *Journal of Applied Research in Higher Education*, 1(2), 58–63.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Základní pojmy NLP](@/kompendium/nlp-vzorce/zakladni-pojmy/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců

**Příbuzné vzorce**

- [Neexistuje selhání, jen zpětná vazba](@/kompendium/nlp-vzorce/predpoklady/neni-selhani-jen-zpetna-vazba.md) – příbuzný vzorec (Předpoklady NLP, There is no failure, only feedback)
- [Nejpružnější prvek řídí systém](@/kompendium/nlp-vzorce/predpoklady/zakon-pozadovane-variety.md) – příbuzný vzorec (Předpoklady NLP, The law of requisite variety)
- [Když něco nefunguje, udělej něco jiného](@/kompendium/nlp-vzorce/predpoklady/kdyz-to-nefunguje-udelej-neco-jineho.md) – příbuzný vzorec (Předpoklady NLP, If it is not working, do something else)
- [Zkušenost má strukturu](@/kompendium/nlp-vzorce/predpoklady/zkusenost-ma-strukturu.md) – příbuzný vzorec (Předpoklady NLP, Experience has a structure)
- [Kalibrace](@/kompendium/nlp-vzorce/zakladni-pojmy/kalibrace.md) – příbuzný vzorec (Základní pojmy NLP, Calibration)
- [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) – příbuzný vzorec (Základní pojmy NLP, Strategy (concept))
- [Přerámování selhání na zpětnou vazbu](@/kompendium/nlp-vzorce/reframing/selhani-jako-zpetna-vazba-vzorec.md) – příbuzný vzorec (Reframing a rámce, Failure into feedback)
- [Úroveň schopností](@/kompendium/nlp-vzorce/urovne-a-pozice/uroven-schopnosti.md) – příbuzný vzorec (Logické úrovně a percepční pozice, Capability level)
- [Model SCORE](@/kompendium/nlp-vzorce/urovne-a-pozice/model-score.md) – příbuzný vzorec (Logické úrovně a percepční pozice, SCORE model)
- [Elicitace strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/elicitace-strategie.md) – příbuzný vzorec (Strategie a modelování, Strategy elicitation)
- [Rozhodovací strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/rozhodovaci-strategie.md) – příbuzný vzorec (Strategie a modelování, Decision strategy)
- [Strategie geniality](@/kompendium/nlp-vzorce/strategie-a-modelovani/strategie-geniality.md) – příbuzný vzorec (Strategie a modelování, Strategies of genius)
- [Generátor nového chování](@/kompendium/nlp-vzorce/strategie-a-modelovani/generator-noveho-chovani.md) – příbuzný vzorec (Strategie a modelování, New behaviour generator)
- [Smyčkové strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/smyckove-strategie.md) – příbuzný vzorec (Strategie a modelování, Looping strategies)
- [Dobře formulovaný výsledek](@/kompendium/nlp-vzorce/cile-a-vysledky/dobre-formulovany-vysledek.md) – příbuzný vzorec (Cíle a výsledky, Well-formed outcome)
- [Důkazní procedura](@/kompendium/nlp-vzorce/cile-a-vysledky/dukazni-procedura.md) – příbuzný vzorec (Cíle a výsledky, Evidence procedure)

**V kompendiu**

- [7.5 Kognitivní vědy a EA — duální systém, predikční zpracování, embodied cognition](@/kompendium/07-teoreticke-reflexe/kognitivni-vedy.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-1.1.3 Terminologická mystifikace](@/kompendium/techniques/ea-1-1-3-terminologicka-mystifikace.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) – předchozí vzorec rodiny
- [Logické úrovně](@/kompendium/nlp-vzorce/zakladni-pojmy/logicke-urovne-pojem.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
