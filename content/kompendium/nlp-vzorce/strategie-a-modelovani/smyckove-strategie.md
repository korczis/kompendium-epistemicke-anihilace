+++
title = "Smyčkové strategie"
description = "Pojem NLP pro vnitřní postupy, jejichž výstupní test nelze splnit, takže se točí dokola: od váhání a přemítání po cíleně nastavená nesplnitelná měřítka."
weight = 19
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-strategie-a-modelovani", "nlp-pojem", "nlp-uziti-zadne"]
categories = ["academic"]

[extra]
parent = "kompendium-nlp-vzorce-strategie-a-modelovani"
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Smyčkové strategie", "Looping strategies", "strategie bez výstupu", "looping", "Strategie a modelování", "NLP", "neurolingvistické programování"]
schema_type = "DefinedTerm"
nlp_schema = 1
nlp_id = "NLP-14.19"
nlp_slug = "smyckove-strategie"
nlp_family = "strategie-a-modelovani"
nlp_family_code = "14"
nlp_family_title = "Strategie a modelování"
nlp_family_en = "Strategies and modelling"
nlp_part = "strategie-a-modelovani.b"
nlp_type = "concept"
nlp_type_cs = "pojem"
nlp_en = "Looping strategies"
nlp_aliases = ["strategie bez výstupu", "looping"]
nlp_use = "zadne"
nlp_use_cs = "výkladový pojem"
nlp_risk = "stredni"
nlp_risk_cs = "střední"
nlp_broader = "strategie-pojem"
nlp_narrower = []
nlp_depth = 1
nlp_ancestors = ["strategie-pojem"]
nlp_related = ["tote-model", "vnitrni-dialog", "elicitace-strategie", "rozhodovaci-strategie", "presvedcovaci-strategie"]
nlp_related_declared = ["tote-model", "rozhodovaci-strategie", "presvedcovaci-strategie", "vnitrni-dialog", "elicitace-strategie"]
nlp_kompendium = ["kompendium/techniques/ea-2-5-8-recursive-doubt-spiral.md", "kompendium/techniques/ea-5-4-17-infinit-regres-implantace.md", "kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md"]
nlp_links_prose = ["glossary/heuristika.md", "kompendium/techniques/ea-2-5-8-recursive-doubt-spiral.md", "kompendium/techniques/ea-5-4-17-infinit-regres-implantace.md"]
nlp_prev = "generator-noveho-chovani"
nlp_next = "modelovani-nevedomim"
nlp_position = 19
nlp_family_size = 20
nlp_sources = ["beck-1976", "charvet-1997", "dilts-1980", "ellis-1962", "gilovich-1991", "hassan-1988", "herman-1992", "lifton-1961", "miller-galanter-pribram-1960", "sharpley-1987", "witkowski-2010"]
nlp_sources_primary = ["charvet-1997", "dilts-1980"]
nlp_sources_roots = ["miller-galanter-pribram-1960"]
nlp_sources_critical = ["beck-1976", "ellis-1962", "gilovich-1991", "hassan-1988", "herman-1992", "lifton-1961", "sharpley-1987", "witkowski-2010"]
nlp_citations = 19
nlp_words = 1264
nlp_reading_minutes = 6
nlp_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
nlp_trainer_items = 2
nlp_trainer_benign = 1
nlp_vaknin = "inferred"
nlp_review = "agent"
nlp_catalogue = "data/nlp/strategie-a-modelovani.b.toml"
+++

# Smyčkové strategie

<!-- kompendium:nlp-hlavicka:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-14.19` |
| **Rodina** | [Strategie a modelování](@/kompendium/nlp-vzorce/strategie-a-modelovani/_index.md) |
| **Druh** | pojem |
| **Anglicky** | Looping strategies |
| **Jiné názvy** | strategie bez výstupu, looping |
| **Obecnější vzorec** | [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) |
| **Užití** | výkladový pojem |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:nlp-hlavicka:end -->

## Definice

Smyčkovými strategiemi se v NLP označují vnitřní postupy, které nemají funkční výstup. Strategie je v tomto pojetí posloupnost operací a testů, která končí, když test potvrdí, že bylo dosaženo cíle: rozhodnutí padlo, informace je dost, věc je pravdivá. U smyčkové strategie test buď nelze splnit, nebo vede zpět na začátek, a člověk tak opakuje tytéž kroky bez konce. Typickým příkladem je rozhodování, při němž se možnosti srovnávají znovu a znovu a každá další informace vyvolá nové srovnání, nebo přesvědčování, při němž člověk potřebuje stále nové potvrzení a žádné ho neuspokojí natrvalo. Pojem vychází z modelu strategií, který stojí na kybernetické smyčce testu a operace, v níž je výstup podmíněn shodou se stanoveným kritériem (Miller, Galanter a Pribram 1960; Dilts a kol. 1980). Kompendium ho zařazuje jako výkladový pojem, protože sám nepopisuje techniku, ale typ vady vnitřního postupu. Pro obranu je užitečný dvojím způsobem: pomáhá popsat, proč se člověk zasekne v nekonečném váhání, a pomáhá rozpoznat situace, kdy mu nesplnitelné měřítko nastavil někdo jiný.

## Původ a souvislosti

Kybernetický model chování, z něhož NLP vychází, popsali Miller, Galanter a Pribram jako jednotku TOTE: organismus testuje, zda stav odpovídá cíli, a pokud ne, jedná a testuje znovu, dokud se rozdíl neodstraní, a teprve pak smyčku opouští (Miller, Galanter a Pribram 1960). Z této stavby přímo plyne, že smyčka bez dosažitelného výstupu se nezastaví. Dilts a spolupracovníci převedli model do řeči smyslových reprezentací a strategie popisovali jako posloupnosti vizuálních, auditivních a kinestetických kroků; mezi vlastnostmi strategie, které ovlivňují její účinnost, uvádějí i to, zda má jasně vymezený test a výstup (Dilts a kol. 1980). V literatuře o metaprogramech se objevuje příbuzný postřeh: lidé se liší v tom, kolik příkladů nebo jak dlouhé období potřebují, aby byli o něčem přesvědčeni, a u některých se přesvědčení nikdy neustálí natrvalo a musí se obnovovat znovu (Charvet 1997). Mimo NLP mají smyčky bez výstupu bohatou tradici v kognitivní terapii. Beck popsal, jak se u depresivních a úzkostných lidí opakují automatické myšlenky, které se samy potvrzují (Beck 1976), a Ellis ukázal, jak absolutní požadavky typu „musím to udělat dokonale“ vytvářejí měřítka, která nelze splnit, a tím udržují úzkost a sebeodsuzování (Ellis 1962).

## Struktura vzorce

Strukturálně lze smyčkové strategie rozdělit podle toho, kde se výstup ztrácí. V prvním typu je test nesplnitelný, protože je formulován absolutně: „až si budu úplně jistý“, „až to bude dokonalé“, „až nebude žádná pochybnost“. Takové kritérium nelze nikdy potvrdit, a smyčka proto pokračuje. Ve druhém typu je test pohyblivý: kdykoli se k němu člověk přiblíží, posune se, například proto, že každá nová informace otevírá novou otázku. Ve třetím typu je test sebevztažný: pochybnost o splnění testu se sama stává důvodem, proč test není splněn, takže smyčka se uzavírá sama do sebe. Tento poslední typ kompendium podrobně rozebírá jako [rekurzivní spirálu pochybnosti](@/kompendium/techniques/ea-2-5-8-recursive-doubt-spiral.md). Vnitřní prožitek je u všech typů podobný: opakované přemítání, vnitřní dialog, který se vrací k týmž otázkám, únava a pocit, že rozhodnutí je stále „těsně před“; kognitivní terapie popisuje podobné opakování myšlenek, které se samy potvrzují, u úzkosti a deprese (Beck 1976). Pro analýzu je důležité rozlišit, zda smyčka vznikla uvnitř, z vlastních zvyků a obav, nebo zda byla nastavena zvenčí. Ve druhém případě patří kritérium někomu jinému, a ten ho může libovolně posouvat. Lifton popsal tuto dynamiku v uzavřených systémech jako požadavek čistoty: měřítka dokonalosti jsou nastavena tak, aby jich nikdo nemohl dosáhnout, a trvalý pocit nedostatečnosti váže člověka k autoritě, která jediná může udělit rozhřešení (Lifton 1961).

## Detekční znaky

U vnitřně vzniklé smyčky jsou znaky především prožitkové: opakované srovnávání možností bez rozhodnutí, potřeba stále nových informací, pocit, že rozhodnutí nikdy není dost podložené, a únava z vlastního přemýšlení. Člověk často sám popisuje, že se „točí v kruhu“. U smyčky nastavené zvenčí jsou znaky vztahové a jazykové. Prvním znakem je absolutní nebo neurčité kritérium, které formuluje druhá osoba: „až budeš opravdu připravená“, „až to budeš myslet vážně“, „až to pochopíš“. Druhým znakem je, že o splnění kritéria rozhoduje výhradně tato osoba a že důvody, proč splněno není, se mění. Třetím znakem je výklad pochybnosti jako důkazu nesplnění: kdo pochybuje, „ještě není připravený“, a kdo je připravený, ten nepochybuje. Tato konstrukce zaručuje, že člověk, který zvažuje odchod ze skupiny nebo ze vztahu, nikdy nedosáhne stavu, v němž by mohl odejít s pocitem oprávněnosti. Čtvrtým znakem je řetězení zdůvodnění, kdy každá odpověď vyvolá další „proč“, aniž by se kdy uznala za dostatečnou, což kompendium popisuje jako [implantaci nekonečného regresu](@/kompendium/techniques/ea-5-4-17-infinit-regres-implantace.md). Obecně platí, že kde nelze uvést, jak by vypadalo splnění, nejde o měřítko, ale o nástroj kontroly. Hassan popisuje, jak se v kultovních skupinách pochybnosti člena soustavně vykládají jako jeho vlastní selhání, a ne jako informace o skupině (Hassan 1988).

## Legitimní a manipulativní užití

Jako výkladový pojem má smyčková strategie legitimní a užitečné místo. Pomáhá člověku pojmenovat vlastní zaseknutí: vidět, že problém není v nedostatku informací, ale v chybějícím výstupním testu, a doplnit ho o konkrétní kritéria a časovou hranici. Podobně postupuje kognitivní terapie, když s klientem zkoumá absolutní požadavky a nahrazuje je realistickými a ověřitelnými měřítky (Ellis 1962; Beck 1976). V poradenství pomáhá pojem rozlišit pečlivé zvažování od přemítání, které už nepřináší nic nového. Manipulativní užití nespočívá v samotném pojmu, ale v cíleném nastavení smyček druhým lidem. Nesplnitelné kritérium připravenosti, lásky nebo věrnosti udržuje člověka v trvalém úsilí o splnění a v závislosti na tom, kdo o splnění rozhoduje. Ve skupinách s vysokou mírou kontroly se tak udržuje člen, který stále „ještě není dost daleko“, a v kontrolujících vztazích partner, který stále „ještě nedokázal“, že mu na druhém záleží. Zvláštní podobou je užití pojmu samotného jako zbraně: když člověk vznese námitku, označí se jeho uvažování za „smyčku“, kterou je třeba přerušit, a tím se z rozhovoru vyřadí legitimní pochybnost.

## Stav důkazů

Pojem smyčkové strategie je popisný a nebyl předmětem samostatného kontrolovaného výzkumu. Jeho jádro, totiž že postup bez dosažitelného výstupu se nezastaví, je logickým důsledkem kybernetického modelu, z něhož vychází (Miller, Galanter a Pribram 1960). Jevy, které pojem popisuje, jsou však v psychologii dobře známé pod jinými názvy. Opakující se negativní myšlení u deprese a úzkosti popsala kognitivní terapie (Beck 1976) a role absolutních požadavků v udržování úzkosti je ústředním tématem racionálně emoční terapie (Ellis 1962). Specifická tvrzení NLP, například že smyčku lze spolehlivě zjistit z očních pohybů nebo z predikátů a odstranit krátkou intervencí, nejsou podložena. Výzkum reprezentačních systémů a očních přístupových signálů, na nichž popis strategií v NLP stojí, tato tvrzení opakovaně nepotvrdil (Sharpley 1987; Witkowski 2010). Hrozí i opačné riziko: pojem se dá použít ke zpětnému výkladu téměř jakéhokoli váhání, a stává se tak nevyvratitelným, protože každé nerozhodnutí lze dodatečně označit za smyčku (Gilovich 1991). Pojem je proto užitečný jako [heuristika](@/glossary/heuristika.md) pro sebepozorování, nikoli jako diagnóza.

## Obrana a zotavení

Proti vnitřní smyčce pomáhá doplnit chybějící výstup: stanovit konkrétní, splnitelná kritéria a časovou hranici, po níž se rozhodne podle toho, co je k dispozici. Užitečné je uvědomit si, že úplná jistota není dosažitelná a že rozumné rozhodnutí se dělá při rozumné míře informací. Pokud přemítání přetrvává a narušuje spánek, práci nebo vztahy, je vhodné vyhledat odbornou pomoc, protože může jít o projev úzkostné nebo depresivní poruchy. Proti smyčce nastavené zvenčí je hlavní obranou pojmenovat nesplnitelné kritérium. Otázka „podle čeho přesně poznám, že jsem připravená“ často odhalí, že odpověď neexistuje nebo že se mění. Druhou obranou je převzít kritérium zpět: rozhodnout se podle vlastních, konkrétních měřítek, nikoli podle toho, zda to druhý uzná. Třetí obranou je vnější pohled. Člověk mimo vztah nebo skupinu může snáze vidět, že měřítko je posouváno, a potvrdit, že pochybnost není důkazem nepřipravenosti, ale běžnou součástí každého závažného rozhodnutí. U lidí, kteří v takové smyčce žili dlouhodobě, přetrvává po odchodu sklon k sebeobviňování a k pocitu, že nikdy nejsou dost dobří. V zotavení pomáhá postupné obnovování realistických měřítek a zkušenost, že rozhodnutí lze udělat a unést i bez úplné jistoty (Herman 1992).

<!-- kompendium:nlp-vazby:begin (scripts/nlp-catalog.py; neupravovat ručně) -->

## Literatura

- Beck, A. T. (1976). *Cognitive Therapy and the Emotional Disorders*. New York: International Universities Press.
- Charvet, S. R. (1997). *Words That Change Minds: Mastering the Language of Influence* (2. vyd.). Dubuque: Kendall/Hunt.
- Dilts, R., Grinder, J., Bandler, R., & DeLozier, J. (1980). *Neuro-Linguistic Programming: Volume I. The Study of the Structure of Subjective Experience*. Cupertino: Meta Publications.
- Ellis, A. (1962). *Reason and Emotion in Psychotherapy*. New York: Lyle Stuart.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Rochester: Park Street Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Miller, G. A., Galanter, E., & Pribram, K. H. (1960). *Plans and the Structure of Behavior*. New York: Holt, Rinehart and Winston.
- Sharpley, C. F. (1987). Research findings on neurolinguistic programming: Nonsupportive data or an untestable theory? *Journal of Counseling Psychology*, 34(1), 103–107.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Strategie a modelování](@/kompendium/nlp-vzorce/strategie-a-modelovani/_index.md) – rodina, do níž vzorec patří, s přehledem všech jejích vzorců
- [Strategie](@/kompendium/nlp-vzorce/zakladni-pojmy/strategie-pojem.md) – obecnější vzorec, jehož je tento vzorec zvláštním případem

**Příbuzné vzorce**

- [Model TOTE](@/kompendium/nlp-vzorce/zakladni-pojmy/tote-model.md) – příbuzný vzorec (Základní pojmy NLP, TOTE model)
- [Vnitřní dialog](@/kompendium/nlp-vzorce/zakladni-pojmy/vnitrni-dialog.md) – příbuzný vzorec (Základní pojmy NLP, Internal dialogue)
- [Elicitace strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/elicitace-strategie.md) – příbuzný vzorec (Strategie a modelování, Strategy elicitation)
- [Rozhodovací strategie](@/kompendium/nlp-vzorce/strategie-a-modelovani/rozhodovaci-strategie.md) – příbuzný vzorec (Strategie a modelování, Decision strategy)
- [Strategie přesvědčení o pravdivosti](@/kompendium/nlp-vzorce/strategie-a-modelovani/presvedcovaci-strategie.md) – příbuzný vzorec (Strategie a modelování, Convincer strategy)

**V kompendiu**

- [EA-2.5.8 Rekurzivní spirála pochybnosti](@/kompendium/techniques/ea-2-5-8-recursive-doubt-spiral.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-5.4.17 Implantace nekonečného regresu](@/kompendium/techniques/ea-5-4-17-infinit-regres-implantace.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí
- [EA-1.3.1 Imunizace proti falsifikaci](@/kompendium/techniques/ea-1-3-1-imunizace-proti-falsifikaci.md) – stránka knihy, na které se tento vzorec projevuje nebo s ní souvisí

**V katalogu**

- [Generátor nového chování](@/kompendium/nlp-vzorce/strategie-a-modelovani/generator-noveho-chovani.md) – předchozí vzorec rodiny
- [Nevědomé modelování](@/kompendium/nlp-vzorce/strategie-a-modelovani/modelovani-nevedomim.md) – další vzorec rodiny
- [Trenér rozpoznávání NLP vzorců](@/kompendium/nlp-vzorce/trener.md) – procvičení rozpoznání tohoto vzorce na příkladech výroků

<!-- kompendium:nlp-vazby:end -->
