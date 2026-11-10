+++
title = "HAWKEYE a koordinované nepravé chování s ohledem na EA"
description = "Jak systém HAWKEYE na Prismatic Platform rozpoznává koordinované a nepravé chování v provozu webu při ochraně soukromí – a proč chování bez motivace nestačí k závěru o manipulaci."
weight = 32

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "security"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["perimeter-ea-attack-surface", "osint-ea-source-validation", "operational-execution-ea-deployment", "blue-team-ea-defense", "compliance-ea-regulatory-screening"]
toc = true
+++

# HAWKEYE a koordinované nepravé chování s ohledem na EA

[HAWKEYE](@/glossary/hawkeye.md) je podle hesla glosáře systém zpravodajství o návštěvnících webu (*Visitor Intelligence*) Prismatic Platform, softwarové platformy, z níž kniha vzešla. V reálném čase analyzuje chování návštěvníků, koreluje vzorce návštěv s informacemi o hrozbách a zařazuje návštěvníky do kategorií rizika – neškodný, podezřelý, škodlivý, neznámý – s mírou důvěry. Glosář zdůrazňuje, že systém je navržen s ohledem na ochranu soukromí podle obecného nařízení o ochraně osobních údajů. Ve vztahu k taxonomii epistemických útoků (EA) se HAWKEYE uplatňuje tam, kde se manipulace projevuje v provozu: koordinované kampaně, falešné zapojení, organizované recenze či komentáře, které mají vytvořit zdání veřejného mínění. Stránka popisuje tuto roli a zdůrazňuje meze, které jsou pro knihu nejdůležitější.

## Agent v kostce

Glosář vysvětluje základní princip systému: smysluplný bezpečnostní poznatek nevzniká z izolovaných údajů, ale ze spojení více behaviorálních a technických signálů. Jediný požadavek na server o záměru mnoho neprozradí; korelovaný s dalšími signály v čase může ukázat vzorec. Systém tak představuje posun od reaktivní bezpečnosti, která blokuje známé škodlivé aktéry, k proaktivní, která se snaží porozumět vzorcům chování. Klasifikace vstupují do širšího bezpečnostního ekosystému platformy jako signály pro řízení přístupu a další rozhodnutí. Glosář uvádí i to, že systém vynucuje [pluralitu signálů](@/glossary/signal-plurality.md) a pracuje s mírou důvěry.

Původní verze této stránky popisuje použití v souvislosti s technikami EA: HAWKEYE porovnává současné vzorce provozu s historickým výchozím stavem a označuje jako podezřelé koordinované vlny, synchronizované časování a homogenní charakteristiky, které jsou typické pro automatizované sítě.

## Proč se týká technik EA

Kniha popisuje řadu technik, které stojí na zdání, že „mnoho lidí si to myslí“: [pseudokonsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md), [koordinaci mobu](@/kompendium/techniques/ea-2-3-4-mob-coordination.md), [pseudokontroverzi](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md) nebo [platformní koordinovaný útok](@/kompendium/techniques/ea-2-3-6-platform-coordinated-attack.md). V digitálním prostředí se tyto techniky často opírají o koordinované nepravé chování – účty, které jednají synchronizovaně a předstírají nezávislost. HAWKEYE se zaměřuje právě na tuto vrstvu: na stopy, které koordinace zanechává v provozu. Kniha k rozpoznání týchž vzorců z pohledu člověka nabízí signatury [koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md), [platformní koordinace](@/kompendium/detection-signatures/21-network-platform-coordination.md) a [asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md).

## Jak pracuje

Rozpoznávání automatizovaných a koordinovaných účtů je samostatnou oblastí výzkumu. Ferrara a kolegové (2016) popsali vzestup sociálních botů a ukázali, jak mohou ovlivňovat online debatu tím, že zesilují určité obsahy a vytvářejí dojem podpory. Pro detekci je rozhodující kombinace signálů v čase, nikoli jednotlivý znak. HAWKEYE tento princip uplatňuje na provoz vlastních webových aplikací platformy: neposuzuje obsah názorů, ale vzorce chování.

Ochrana soukromí je u takového systému podmínkou, nikoli doplňkem. Technické charakteristiky prohlížečů mohou být samy o sobě dostatečně jedinečné, aby umožnily identifikaci uživatele; Eckersley (2010) ukázal, jak vysoký podíl prohlížečů lze takto rozlišit. Proto glosář klade důraz na ochranu soukromí již v návrhu, na úplnou auditní stopu a na soulad s obecným nařízením o ochraně osobních údajů (Nařízení (EU) 2016/679), včetně zásady minimalizace údajů.

Ochrana soukromí přitom není jen právní povinností, ale i podmínkou důvěry: obranný systém, kterému uživatelé nemohou věřit, podkopává epistemickou bezpečnost, kterou má chránit.

## Spolupráce s dalšími agenty

HAWKEYE předává kontext provozu agentovi [Perimeter](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md), který jej spojuje s mapou vystavených aktiv; s agentem [OSINT](@/kompendium/aiad-integration/osint-ea-source-validation.md) spolupracuje na reputaci adres a domén; blokování známých škodlivých zdrojů provádí s [Operational Execution](@/kompendium/aiad-integration/operational-execution-ea-deployment.md). Jeho signály využívá [Blue Team](@/kompendium/aiad-integration/blue-team-ea-defense.md) a regulatorní souvislosti posuzuje [Compliance](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md).

## Příklad

Na stránku platformy, kde mohou uživatelé hodnotit zveřejněné analýzy, přijde během krátké doby velké množství negativních hodnocení jedné analýzy. HAWKEYE si všimne, že hodnocení přicházejí v pravidelných intervalech, z účtů vytvořených v krátkém časovém okně a s velmi podobnými technickými charakteristikami. Označí vlnu jako podezřelou s mírou důvěry a předá ji k posouzení. Neodstraní ji automaticky: možným vysvětlením je i to, že analýza byla sdílena v jedné komunitě a její členové reagovali spontánně. Teprve kombinace s dalšími signály – například s tím, že se v hodnoceních opakují shodné formulace – posílí hypotézu o koordinaci.

## Co z toho plyne pro čtenáře knihy

Prvním a nejdůležitějším poučením je mez uvedená na původní stránce: **HAWKEYE nevidí motivaci, vidí jen chování**. Koordinované chování může být manipulací, ale také spontánní reakcí skupiny lidí, kteří sdílejí stejný zájem. Kniha na tento rozdíl upozorňuje i u lidí: to, že mnoho lidí reaguje současně a podobně, samo o sobě nedokazuje koordinaci ani úmysl. Závěr o manipulaci vyžaduje více signálů a posouzení kontextu (srov. [riziko falešné pozitivity](@/kompendium/critical-perspectives/5-false-positive-risk.md)).

Druhým poučením je **zdání veřejného mínění**. Pro jednotlivce je užitečné vědět, že počet hlasů, hodnocení nebo komentářů může být uměle zvýšen, a nepovažovat jej za míru pravdy. Kniha tuto obranu rozvádí v [detoxikaci feedu](@/kompendium/self-defense-guides/32-feed-detoxification.md) a ve vzdělávacím scénáři [koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md).

Třetím poučením je **cena sledování**. Systémy, které sledují chování lidí, mají sílu chránit i škodit. Zuboffová (2019) popsala, jak se behaviorální data stávají surovinou pro předpovídání a ovlivňování chování; stejné techniky, které platforma používá k obraně, mohou v jiném kontextu sloužit k manipulaci. Kniha proto stránku [Zuboffová a dozorový kapitalismus](@/kompendium/07-teoreticke-reflexe/zuboff-surveillance-capitalism.md) zařazuje do teoretických reflexí a zdůrazňuje, že obranné sledování musí být omezené účelem, transparentní a podřízené ochraně soukromí.

## Od chování k úsudku

Rozdíl mezi pozorováním chování a úsudkem o úmyslu má v knize obecnou platnost. U lidí se projevuje například v tom, že posuzovatel z opakovaných vzorců komunikace usoudí na manipulativní záměr, i když vzorce mohou mít jiné vysvětlení – naučený styl, kulturní normu, úzkost. HAWKEYE tento rozdíl drží strukturně: jeho výstupem je klasifikace chování s mírou důvěry, nikoli verdikt o aktérovi. Kniha doporučuje lidem tutéž kázeň: popsat, co bylo pozorováno, uvést možná vysvětlení a teprve s dalšími doklady usuzovat na úmysl. Ve forenzní rovině tomu odpovídá rozlišení mezi [vzorcovým důkazem](@/kompendium/forensic-legal/38-pattern-evidence.md) a závěrem o zavinění, který vyžaduje další prvky. Stejná kázeň chrání i před tím, aby se obrana proti manipulaci sama stala nástrojem nespravedlivého obvinění – riziko, které kniha rozebírá v kritické perspektivě [EA jako mocenský nástroj](@/kompendium/critical-perspectives/18-EA-as-power-tool.md).

## Meze a otevřené otázky

HAWKEYE vidí jen chování, nikoli motivaci, a sofistikovaný aktér s lidsky působícím chováním může uniknout. Systém vyžaduje lidské posouzení pro nuance. Klasifikace návštěvníků nese riziko chybného označení legitimních uživatelů, a proto je důležitá míra důvěry a možnost přezkumu. Glosář uvádí řadu technických parametrů systému; podrobnosti technik rozpoznávání se zde neuvádějí, protože pro čtenáře knihy nejsou podstatné. Otevřenou otázkou je, jak daleko smí obranné sledování jít, aby samo nevytvářelo prostředí, před nímž má chránit.

## Literatura

- Eckersley, P. (2010). How unique is your web browser? In M. J. Atallah & N. J. Hopper (Eds.), *Privacy Enhancing Technologies – PETS 2010* (pp. 1–18). Berlin: Springer.
- Ferrara, E., Varol, O., Davis, C., Menczer, F., & Flammini, A. (2016). The rise of social bots. *Communications of the ACM*, 59(7), 96–104.
- Nařízení Evropského parlamentu a Rady (EU) 2016/679 ze dne 27. dubna 2016 (obecné nařízení o ochraně osobních údajů).
- Zuboff, S. (2019). *The Age of Surveillance Capitalism*. New York: PublicAffairs.

## Související

**Agenti**

- [Perimeter a útočná plocha](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md) – kontext vystavených aktiv.
- [OSINT a validace zdrojů](@/kompendium/aiad-integration/osint-ea-source-validation.md) – reputace adres a domén.
- [Compliance a regulatorní screening](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) – ochrana osobních údajů.

**Pojmy**

- [HAWKEYE](@/glossary/hawkeye.md) – heslo glosáře.
- [Signal Plurality](@/glossary/signal-plurality.md) – více signálů pro každý závěr.

**Kniha**

- [Koordinace botů – signatura](@/kompendium/detection-signatures/20-network-bot-coordination.md) – lidský pohled na tentýž vzorec.
- [Zuboffová: dozorový kapitalismus](@/kompendium/07-teoreticke-reflexe/zuboff-surveillance-capitalism.md) – cena sledování.
