+++
title = "Supreme Commander a strategie obrany proti EA"
description = "Jak agent L5 Supreme Commander na Prismatic Platform určuje priority obrany proti technikám EA, proč i nejvyšší autorita zůstává auditovatelná a co z toho plyne pro řízení lidských institucí."
weight = 17

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "governance"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["archer-supreme-ea-orchestration", "strategic-command-ea-coordination", "tactical-execution-ea-operations", "quality-monitor-ea-tracking", "operational-execution-ea-deployment"]
toc = true
+++

# Supreme Commander a strategie obrany proti EA

[Supreme Commander](@/glossary/supreme-commander.md) je agent nejvyšší úrovně autority L5 na Prismatic Platform, softwarové platformě, z níž kniha vzešla. Podle hesla glosáře odpovídá za strategickou koordinaci a orchestraci v celém ekosystému platformy, koordinuje současně více týmů agentů a má konečnou rozhodovací pravomoc u složitých operací přesahujících rozsah agentů nižších úrovní. Na rozdíl od [Archer Supreme](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md), který se aktivuje v krizích, je Supreme Commander trvalou orchestrační vrstvou. Ve vztahu k taxonomii epistemických útoků (EA) nečte knihu kvůli detekci jednotlivých útoků, ale kvůli **strategickému rozhodování**: které oblasti obrany posílit, kam soustředit kapacitu a jaké zbytkové riziko je přijatelné. Tato stránka popisuje tuto roli a poučení, které z ní kniha vyvozuje.

## Agent v kostce

Glosář přirovnává rozdíl mezi Supreme Commanderem a [Archer Supreme](@/glossary/archer-supreme.md) k rozdílu mezi stálou velitelskou strukturou a jednotkou pro zvláštní operace. Supreme Commander zajišťuje, aby běhoví agenti platformy pracovali soudržně ke strategickým cílům; počet agentů a aplikací, který glosář uvádí, odpovídá stavu v době zápisu. Jeho rozhodnutí podléhají auditu a [axiomům NABLA](@/glossary/nabla-axioms.md) – i nejvyšší autorita tedy musí doložit, z čeho vychází.

Původní verze této stránky popisuje práci agenta na meta-úrovni: sleduje ukazatele celého portfolia obranných opatření – pokrytí jednotlivých oblastí taxonomie, dobu obnovy po incidentech, míru falešných poplachů – a směruje pozornost tam, kde je přínos dalšího úsilí nejvyšší. Výstupem je dokument strategického záměru s prioritami a měřitelnými cíli, z něhož vycházejí plány [Strategic Command](@/kompendium/aiad-integration/strategic-command-ea-coordination.md).

## Proč se týká technik EA

Taxonomie knihy je rozsáhlá a žádná obrana nemůže pokrýt všechny techniky stejně důkladně. Strategické rozhodování proto musí odpovědět na otázku, které techniky jsou pro daný systém nejvýznamnější. Kniha k tomu dává podklady: [rejstřík technik](@/kompendium/08-prilohy/rejstrik-technik.md) a [klasifikační schéma](@/kompendium/08-prilohy/klasifikace.md) ukazují rozsah a stavbu taxonomie, [vizualizace](@/kompendium/visualizations/_index.md) rozložení technik napříč kategoriemi a [detekční signatury](@/kompendium/detection-signatures/_index.md), které techniky mají zachytitelnou stopu. Strategické rozhodnutí pak bere v úvahu, kde jsou systémy platformy nejzranitelnější – například zda je větší riziko v jednostranném výběru zdrojů, nebo ve zdánlivé shodě mnoha hlasů.

## Jak pracuje

Strategické řízení složitého systému vychází z poznatku, že složité systémy jsou hierarchicky uspořádané a že jednotlivé úrovně mají vlastní časové měřítko a vlastní druh informací. Simon (1962) ukázal, že taková „téměř rozložitelná“ hierarchie umožňuje řídit složitost: vyšší úroveň pracuje s agregáty a dlouhým horizontem, nižší s detaily a krátkým horizontem. Supreme Commander je nejvyšší úrovní tohoto uspořádání v obraně platformy a pracuje s ukazateli, nikoli s jednotlivými incidenty.

Práce s ukazateli má známé úskalí. Campbell (1979) upozornil, že čím více se kvantitativní ukazatel používá k rozhodování, tím více podléhá tlakům, které jej zkreslují; Strathernová (1997) toto pozorování shrnula větou, že když se míra stane cílem, přestává být dobrou mírou. Strategická vrstva obrany proto potřebuje ukazatele kombinovat a doplňovat je kvalitativními nálezy barevných týmů, aby nevznikla obrana, která optimalizuje čísla místo odolnosti.

Strategická vrstva se navíc nesmí stát jediným místem, kde se o obraně přemýšlí. Nejcennější podněty k úpravě priorit podle původní stránky přicházejí zdola – z nálezů barevných týmů a z hlášení specializovaných agentů –, a strategie, která je nedokáže přijmout, ztrácí kontakt se skutečným stavem obrany.

## Spolupráce s dalšími agenty

Supreme Commander deleguje provedení strategie na [Strategic Command](@/kompendium/aiad-integration/strategic-command-ea-coordination.md), který ji převádí na plány, a dále na [Tactical Execution](@/kompendium/aiad-integration/tactical-execution-ea-operations.md). Mimo krizové situace je nadřazen Archer Supreme; v krizi přebírá koordinaci Archer Supreme a Supreme Commander zajišťuje strategický rámec. Data pro strategické rozhodování dodává zejména [Quality Monitor](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md).

## Příklad

Souhrnné ukazatele ukazují, že obrana zachycuje téměř všechny simulované útoky založené na jednostranném výběru zdrojů, ale výrazně méně útoků, které stojí na postupném přepisování významu dříve přijatých tvrzení. Supreme Commander nerozhoduje o konkrétní opravě; stanoví prioritu: v příštím období posílit obranu proti postupné reinterpretaci, a to i za cenu pomalejšího rozvoje jiných oblastí. Zároveň stanoví, podle čeho se úspěch pozná – nejen podle počtu zachycených simulací, ale i podle nálezů Gray Teamu o mezerách ve specifikaci. Rozhodnutí je zaznamenáno s odůvodněním, aby je bylo možné zpětně přezkoumat.

V lidské rovině odpovídá tomuto rozhodnutí volba, kterou dělá vedení organizace při plánování prevence: zaměřit se na to, kde jsou skutečná rizika, a ne na to, co se nejsnáze měří (srov. [prevence na pracovišti](@/kompendium/prevention-resilience/5-workplace-prevention-EA.md)).

## Co z toho plyne pro čtenáře knihy

Heslo glosáře shrnuje jedinou poznámku, kterou kniha k Supreme Commanderovi připojuje: i nejvyšší autorita v systému zůstává auditovatelná a vázaná axiomy – opak toho, co kniha popisuje u charismatických vůdců uzavřených skupin, jejichž rozhodnutí nelze zpochybnit (srov. [kult osobnosti](@/glossary/kult-osobnosti.md) a [charisma](@/glossary/charisma.md)). Pro lidské instituce to znamená, že strategická rozhodnutí vedení mají být doložená, zpětně přezkoumatelná a otevřená námitkám. Kniha k tomu nabízí [dohledatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md) a [ochranu stanov](@/kompendium/organizational-defense/2-charter-protection.md).

Druhým poučením je **přiznané zbytkové riziko**. Strategie, která tvrdí, že pokrývá vše, je nepoctivá. Supreme Commander podle původní stránky výslovně stanovuje, kde se zbytkové riziko toleruje; organizace, která chce být odolná vůči manipulaci, má umět říct, které hrozby vědomě nepokrývá a proč – a tím otevřít prostor pro to, aby to někdo zpochybnil.

Třetím poučením je **pozor na ukazatele**. Kniha popisuje techniky, které míří právě na hodnoticí kritéria instituce, například [přepisování kritérií hodnocení](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md). Instituce, která řídí jen podle čísel, je vůči takovým technikám zvlášť zranitelná.

## Priority jako etické rozhodnutí

Volba priorit obrany není jen technická. Rozhodnutí posílit obranu proti jedné skupině technik znamená, že jiné budou po určitou dobu pokryty slaběji, a tedy že někdo nese vyšší zbytkové riziko. V softwaru se toto riziko týká kvality závěrů platformy; v lidských institucích se týká konkrétních lidí – studentů, zaměstnanců, pacientů. Kniha proto doporučuje, aby instituce svá rozhodnutí o prioritách prevence nejen zaznamenávaly, ale také zveřejňovaly těm, jichž se týkají, a nechaly je připomínkovat. Belmontská zpráva (National Commission 1979) formuluje pro výzkum princip spravedlnosti jako požadavek, aby rizika a přínosy nebyly rozděleny nerovnoměrně bez důvodu; obdobnou otázku si má klást každá strategie ochrany. Užitečným rámcem je i [zapojení zainteresovaných stran](@/kompendium/organizational-defense/10-stakeholder-engagement.md), které dává hlas těm, kdo by jinak zbytkové riziko nesli mlčky.

## Meze a otevřené otázky

Supreme Commander pracuje s agregáty a je vzdálen konkrétním útokům; nehodí se pro taktická rozhodnutí ani pro rychlou reakci. Jeho rozhodnutí jsou omezena kvalitou ukazatelů. Jazyk vojenského velení, jímž platforma strukturu popisuje, kniha nepřebírá do lidské roviny; tam by naopak upozorňoval na hierarchii, v níž chybí kanály pro nesouhlas. Údaje o rozsahu platformy uváděné v glosáři odpovídají stavu v době zápisu.

## Literatura

- National Commission for the Protection of Human Subjects of Biomedical and Behavioral Research (1979). *The Belmont Report*. Washington, DC: U.S. Department of Health, Education, and Welfare.
- Campbell, D. T. (1979). Assessing the impact of planned social change. *Evaluation and Program Planning*, 2(1), 67–90.
- Simon, H. A. (1962). The architecture of complexity. *Proceedings of the American Philosophical Society*, 106(6), 467–482.
- Strathern, M. (1997). 'Improving ratings': Audit in the British University system. *European Review*, 5(3), 305–321.

## Související

**Strategičtí agenti**

- [Archer Supreme a orchestrace](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md) – krizová koordinace.
- [Strategic Command a koordinace](@/kompendium/aiad-integration/strategic-command-ea-coordination.md) – převod strategie na plány.
- [Quality Monitor a sledování](@/kompendium/aiad-integration/quality-monitor-ea-tracking.md) – zdroj ukazatelů.

**Pojmy**

- [Supreme Commander](@/glossary/supreme-commander.md) – heslo glosáře.
- [Charisma](@/glossary/charisma.md) – autorita bez auditu v lidských skupinách.

**Kniha**

- [Dohledatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md) – auditovatelné řízení.
- [Přepisování kritérií hodnocení](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md) – útok na ukazatele instituce.
