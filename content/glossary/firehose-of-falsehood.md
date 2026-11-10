+++
title = "Firehose of Falsehood (palba lží)"
weight = 60

description = "Model propagandy založený na velkém objemu, rychlosti, mnoha kanálech a lhostejnosti k pravdě i konzistenci; obrací kognitivní zátěž proti hledání pravdy."

[taxonomies]
tags = ["glossary", "security", "epistemic", "kompendium", "propaganda"]

[extra]
category = "security"
related_terms = ["info-ops", "epistemic-security", "deepfake", "gish-gallop", "epistemicka-anihilace", "deplatforming"]
author = "Tomáš Korcak (korczis)"
reading_time = "5 min"
word_count = 908
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["firehose of falsehood", "RAND", "Russian propaganda", "disinformation", "Paul Matthews", "information warfare"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Firehose of Falsehood – glosář"
+++

## Definice

**Firehose of Falsehood** (doslova „hasičská hadice lží“, česky též *palba lží*) je model propagandy, který popsali Christopher Paul a Miriam Matthewsová v roce 2016 ve studii RAND Corporation o ruských informačních operacích po anexi Krymu. Model vymezuje čtyři rysy, jimiž se odchyluje od klasické doktríny [propagandy](@/glossary/propaganda.md):

1. **Velký objem a mnoho kanálů** – zahlcení televize, rozhlasu, zpravodajských webů, sociálních sítí, trollích farem, automatizovaných botů a zprostředkujících médií; vzniká stěna obsahu, kterou žádný jednotlivý adresát nedokáže vyhodnotit.
2. **Rychlost, nepřetržitost, opakování** – narativy se šíří během minut po spouštěcí události, během hodin se opakují tisíckrát a obnovují se dřív, než může dopadnout ověření faktů.
3. **Bez závazku k objektivní skutečnosti** – tvrzení nemusí být pravdivá, vnitřně soudržná ani empiricky obhajitelná; stačí, když jsou zaseta do veřejné debaty.
4. **Bez závazku ke konzistenci** – týž zdroj může o téže události předkládat navzájem protichůdná tvrzení bez vnitřních rozpaků, protože cílem není přesvědčit o určité pozici, ale **rozložit jakoukoli stabilní pozici**.

Technika využívá známá kognitivní zkreslení: **efekt iluzorní pravdy** (opakování zvyšuje víru), **heuristiku dostupnosti** (objem vytváří dojem důležitosti), **zkreslení plynulostí** (známá tvrzení působí pravdivě) a **asymetrickou cenu opravy** (vyvrácení vyžaduje víc kognitivního úsilí než tvrzení). Ústřední diagnostické tvrzení Paula a Matthewsové zní, že klasická kontrapropaganda – důraz na důvěryhodnost zdroje, faktickou přesnost a konzistentní sdělení – **strukturně nedokáže udržet krok** s dynamikou palby lží.

## Původ a kontext pojmu

Termín pochází ze zmíněné studie RAND (*The Russian „Firehose of Falsehood“ Propaganda Model*, 2016). Navazuje na starší tradici studia sovětských [aktivních opatření](@/kompendium/historical-cases/21-soviet-active-measures.md) a na výzkum dezinformací (Wardle; viz [Wardle: typologie dezinformací](@/kompendium/07-teoreticke-reflexe/wardle-disinformation-typology.md)). Model byl následně pozorován i mimo ruské státní aktéry: v domácí politice (informační prostředí USA od roku 2016), v komerčních vlivových operacích a v koordinovaných kampaních obtěžování. Nejlépe se chápe ne jako podpis konkrétního aktéra, ale jako **možnost, kterou nabízí současná informační infrastruktura** a kterou může využít každý dostatečně vybavený aktér. Příbuzný případ rozebírá [Internet Research Agency](@/kompendium/historical-cases/22-russian-ira.md).

## Jak se projevuje

Pozorovatelné znaky na úrovni prostředí:

- po události se během minut objeví více protichůdných verzí, často ze zdrojů, které spolu zjevně souvisejí;
- verze se střídají, aniž by kterákoli byla odvolána;
- [koordinované chování botů](@/kompendium/detection-signatures/20-network-bot-coordination.md) a [asymetrie zesílení](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md);
- ověřování faktů přichází, ale nikoho nezajímá, protože téma už je jinde.

Znaky na úrovni člověka:

- únava, otupělost a pocit, že „nic se nedá zjistit“;
- věta „všechno je stejně propaganda“ jako konečný závěr;
- ústup od zpráv úplně, nebo naopak uzavření se do jediného „důvěryhodného“ kanálu.

## Mechanismus

V [Kompendiu](@/kompendium/techniques/_index.md) je palba lží zařazena jako kombinace **epistemické falzifikace EA-1.2** s **kolektivním kognitivním přetížením** (srov. [EA-1.1.2 Informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md)). Je příkladem definičního znaku **autoamplifikace**: oběti zahlcené objemem často začnou tvrdit „všechno je stejně propaganda“ – a tím samy dokončí cíl útočníka, vyřazení hledání pravdy.

Strukturálně jde o **útok na ekonomiku pozornosti a ověřování**. Pravda je v prostředí palby lží stále dostupná, ale cena jejího nalezení převýší ochotu ji platit. Model je kanonickou současnou ilustrací toho, **proč pravdivá odpověď nestačí**: asymetrie mezi útokem a obranou zvýhodňuje útočníka a obrana musí být architektonická, ne rétorická.

## Odlišení

- **Od klasické propagandy:** ta usiluje o přesvědčení o určité pozici a dbá na konzistenci; palba lží usiluje o rozklad pozic.
- **Od [Gish Gallop](@/glossary/gish-gallop.md):** rétorický příbuzný v měřítku jednotlivé debaty; oba využívají asymetrické ceny opravy.
- **Od běžné informační záplavy:** množství zpráv v digitálním prostředí samo o sobě není útok; rozhodující je koordinace, lhostejnost k pravdě a rozpory bez odvolání.
- **Od [hyperreality](@/glossary/hyperreality.md):** Baudrillardův pojem popisuje kulturní stav, v němž se ztrácí rozdíl mezi znakem a skutečností; palba lží je cílená strategie, která takový stav využívá.

## Význam pro Kompendium

Na platformě Prismatic, z níž kniha vzešla:

- [Decision Engine](@/glossary/decision-engine.md) zavádí odolnost proti palbě lží **agregací váženou původem**, ne počtem: 10 000 tvrzení z jedné sítě koordinovaných aktérů má váhu jednoho zdroje, ne 10 000.
- Invarianty rozmanitosti zdrojů v [NABLA Infinity](@/glossary/nabla-infinity.md) výslovně brání útoku objemem: vysoká váha důkazu vyžaduje *nezávislé* zdroje, ne pouze *mnoho* zdrojů.
- Scénáře [Red Team](@/glossary/red-team.md) v rámci [Color Teams](@/glossary/color-teams.md) zahrnují simulace palby lží, které testují odolnost platformy vůči útokům objemem.
- Širší rámec dávají [Info-Ops](@/glossary/info-ops.md) a [Epistemic Security](@/glossary/epistemic-security.md).
- [Deplatforming](@/glossary/deplatforming.md) je jednou (spornou a dílčí) obranou proti útokům tohoto typu.

Pro knihu je pojem mostem mezi individuální a společenskou rovinou EA: popisuje, jak se na úrovni populace vytváří stav, který u jednotlivce odpovídá [epistemické alienaci](@/glossary/epistemicka-alienace.md) – ztrátu víry, že poznání je vůbec možné. Dopady na populaci shrnuje [dopad dezinformací na populaci](@/kompendium/population-health/04-disinformation-population-impact.md).

## Obrana a zotavení

**Pro jednotlivce:** neposuzovat pravdivost podle četnosti; ptát se po nezávislosti zdrojů ([triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)); omezit příjem zpráv na časová okna a odložit hodnocení u čerstvých událostí ([vyhodnocení s časovým odstupem](@/kompendium/self-defense-guides/37-time-locked-evaluation.md), [informační dieta](@/kompendium/self-defense-guides/33-information-diet.md)); bránit se závěru „nic nelze vědět“ – je to výsledek, o který útok usiluje.

**Pro instituce a média:** budovat důvěru předem, ne až v krizi; vysvětlovat metody ověřování, ne jen výsledky; preferovat „předběžné vyvracení“ (*prebunking*) vzorců před vyvracením jednotlivých tvrzení; viz [obrana proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) a [mediální gramotnost](@/kompendium/prevention-resilience/6-media-literacy-prevention.md).

## Literatura

- Christopher Paul, Miriam Matthews: *The Russian „Firehose of Falsehood“ Propaganda Model: Why It Might Work and Options to Counter It* (RAND Corporation, 2016).

## Související

**Pojmy**

- [Info-Ops](@/glossary/info-ops.md) – širší kategorie.
- [Gish Gallop](@/glossary/gish-gallop.md) – příbuzný jev v měřítku jednotlivce.
- [Epistemic Security](@/glossary/epistemic-security.md) – rámec na úrovni oboru.
- [Deepfake](@/glossary/deepfake.md) – sousední plocha hrozby.
- [Deplatforming](@/glossary/deplatforming.md) – dílčí obrana.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – ústřední pojem Kompendia.

**Kniha**

- [Sovětská aktivní opatření](@/kompendium/historical-cases/21-soviet-active-measures.md) – historický předchůdce.
- [Ruská IRA](@/kompendium/historical-cases/22-russian-ira.md) – doložený případ trollí farmy.
- [Obrana proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) – architektonická obrana.
- [Kompendium](@/kompendium/_index.md) – úplná taxonomie.
