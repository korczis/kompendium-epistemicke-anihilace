+++
title = "DD Engine a vážení zdrojů v prověrkách s ohledem na EA"
description = "Jak DD Engine na Prismatic Platform řídí prověrky protistran, váží zdroje a sestavuje matici rozporů tvrzení – a proč je rozpor mezi zdroji nejcennějším signálem i pro lidského posuzovatele."
weight = 31

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "due-diligence"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["czech-ares-ea-screening", "osint-ea-source-validation", "compliance-ea-regulatory-screening", "decision-engine-ea-calibration", "trinity-gate-ea-verification"]
toc = true
+++

# DD Engine a vážení zdrojů v prověrkách s ohledem na EA

DD Engine je podle původní verze této stránky doménovým agentem Prismatic Platform, softwarové platformy, z níž kniha vzešla, který řídí prověrky protistran (*due diligence*). Koordinuje vyšetřování napříč doménami, váží zdroje podle jejich spolehlivosti a nezávislosti a vytváří zprávy připravené k auditu, jejichž jádrem je **matice rozporů** – přehled, který pro každý zdroj a každé tvrzení ukazuje, kde se zdroje shodují a kde si odporují. Ve vztahu k taxonomii epistemických útoků (EA) je DD Engine místem, kde se celá obranná infrastruktura platformy uplatňuje v praxi: prověrka je prostředím, pro které byla taxonomie podle glosáře původně vytvořena. Stránka popisuje práci agenta, jeho souvislost s technikami EA a poučení pro každého, kdo posuzuje důvěryhodnost zdrojů.

## Agent v kostce

Heslo [Due Diligence](@/glossary/due-diligence.md) popisuje prověrku jako soustavné prošetření firmy, osoby nebo aktiva před transakcí, partnerstvím či spoluprací. Zahrnuje sběr informací z otevřených zdrojů, [sjednocování entit](@/glossary/entity-resolution.md) napříč datovými sadami, analýzu vztahů, screening sankčních seznamů a strukturované hodnocení rizik. DD Engine tyto činnosti orchestruje: volá agenty [OSINT](@/kompendium/aiad-integration/osint-ea-source-validation.md), [Czech ARES](@/kompendium/aiad-integration/czech-ares-ea-screening.md) a [Compliance](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md) a jejich výstupy skládá do zprávy s vážením zdrojů, maticí rozporů a důkazním řetězcem.

Původní stránka zdůrazňuje, že rozpory jsou pro DD Engine signály nejvyšší priority: pokud subjekt o sobě uvádí údaj, který nezávislý zdroj nepotvrzuje nebo mu odporuje, je to místo, kde se prověrka musí zastavit a ověřovat. Pro jednotnou terminologii zpráv agent využívá [mosty glosáře](@/kompendium/glossary-bridges/_index.md).

## Proč se týká technik EA

Heslo glosáře uvádí, že prověrka je jedním z prostředí, pro která byla [taxonomie EA](@/glossary/taxonomie-ea.md) vytvořena: posuzovatel potřebuje rozpoznat, zda zdroje, výpovědi a dokumenty nenesou stopy manipulace. Kniha tento průnik rozvádí v řadě stránek [Cross-Domain](@/kompendium/cross-domain/_index.md): [vážení zdrojů v prověrce](@/kompendium/cross-domain/10-ea-dd-source-weighting.md), [potvrzovací zkreslení vyšetřovatele](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md), [manipulace informacemi protistrany](@/kompendium/cross-domain/12-ea-dd-counterparty-manipulation.md), [narativní válka v transakcích](@/kompendium/cross-domain/14-ea-dd-narrative-warfare.md) a [hodnocení kvality důkazů](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md). Techniky, které se v prověrkách objevují nejčastěji, jsou [selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) – předkládání jen příznivých dokumentů –, [informační přetížení](@/kompendium/techniques/ea-1-1-2-informacni-pretizeni.md) – zahlcení posuzovatele objemem podkladů – a [pseudokonsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – zdánlivá shoda mnoha zdrojů se společným původem.

## Jak pracuje

Vážení zdrojů navazuje na zavedenou praxi zpravodajské analýzy, v níž se hodnotí spolehlivost zdroje a věrohodnost informace odděleně: spolehlivý zdroj může přinést chybnou informaci a nespolehlivý zdroj pravdivou. Heuer (1999) upozornil, že analytici mají sklon přeceňovat informace, které přicházejí v živé a konkrétní podobě, a podceňovat absenci informací. Matice rozporů odpovídá technice analýzy soupeřících hypotéz, kterou Heuer a Pherson (2011) zařadili mezi strukturované analytické techniky: místo hledání potvrzení se systematicky hledá, které údaje si odporují a které hypotézy jednotlivé údaje vylučují.

Pro prověrky s ohledem na praní peněz a financování terorismu platí mezinárodní standardy, které formuluje Finanční akční výbor (FATF 2012) a které zdůrazňují identifikaci skutečného majitele a přístup založený na riziku. DD Engine tyto zásady neuplatňuje sám jako právní posouzení, ale jako strukturu, do níž skládá výstupy ostatních agentů.

Třetím principem je oddělení faktu od hodnocení. Matice zaznamenává, co který zdroj tvrdí, a teprve v dalším kroku se hodnotí, čemu věřit. Toto oddělení brání tomu, aby se hodnocení zdroje promítlo do toho, jak se jeho tvrzení vůbec zapíše – chyba, při níž se nepohodlný údaj z nedůvěryhodného zdroje „ztratí“ dřív, než mohl být porovnán s jinými. V lidské praxi odpovídá tomuto principu zásada zapisovat výpovědi doslova a hodnotit je až potom (srov. [vedení forenzního rozhovoru](@/kompendium/forensic-legal/1-forensic-interview-protocol.md)).

## Spolupráce s dalšími agenty

DD Engine volá [OSINT](@/kompendium/aiad-integration/osint-ea-source-validation.md), [Czech ARES](@/kompendium/aiad-integration/czech-ares-ea-screening.md) a [Compliance](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md); hloubkovou analýzu jednotlivých tvrzení svěřuje [epistemickému procesu](@/kompendium/aiad-integration/epistemic-pipeline-ea-detection.md); závěry ověřuje [Trinity Gate](@/kompendium/aiad-integration/trinity-gate-ea-verification.md); rozhodnutí kalibruje [Decision Engine](@/kompendium/aiad-integration/decision-engine-ea-calibration.md) a zprávy audituje [White Team](@/kompendium/aiad-integration/white-team-ea-verification.md).

## Příklad

Protistrana předloží rozsáhlý balík dokumentů dokládajících její finanční stabilitu. DD Engine sestaví matici: v řádcích tvrzení (výše obratu, počet zaměstnanců, hlavní zákazníci, vlastnická struktura), ve sloupcích zdroje (dokumenty protistrany, výroční zprávy ve sbírce listin, rejstříkové údaje, nezávislé mediální zdroje). Ukáže se, že tvrzení o obratu podporují jen dokumenty protistrany a v posledních účetních závěrkách ve veřejné sbírce listin je výrazně nižší údaj; tvrzení o hlavních zákaznících nepotvrzuje žádný nezávislý zdroj. Matice tyto rozpory zvýrazní jako nejvyšší prioritu. Objem předložených dokumentů nemá na hodnocení vliv – rozhoduje nezávislost a shoda zdrojů. Zpráva pak výslovně uvádí, které rozpory zůstaly nevysvětleny a co by je mohlo vysvětlit.

## Co z toho plyne pro čtenáře knihy

Prvním poučením je **rozpor jako nejcennější signál**. Lidé mají sklon přehlížet rozpory nebo je vysvětlovat ve prospěch toho, čemu už věří. Nickerson (1998) shrnul, jak všudypřítomné je potvrzovací zkreslení. Matice rozporů je jednoduchý nástroj proti němu a kniha ji doporučuje i mimo prověrky – v klinice při porovnání výpovědí, ve forenzní práci při [rekonstrukci časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md), v osobním životě při [triangulaci zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md).

Druhým poučením je **objem není důkaz**. Informační přetížení funguje proto, že velké množství podkladů vytváří dojem důkladnosti. DD Engine váží zdroje podle nezávislosti a kvality, nikoli podle počtu stran. Lidský posuzovatel by měl postupovat stejně a výslovně se ptát, kolik nezávislých zdrojů za objemem stojí.

Třetím poučením je **zkreslení posuzovatele**. Kniha věnuje samostatnou stránku [potvrzovacímu zkreslení v prověrkách](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md) a [systémové prevenci potvrzovacího zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md). Manipulace v prověrce často nepracuje proti posuzovateli, ale s ním – dodává mu přesně to, co čeká. Matice rozporů pomáhá i proti vlastnímu očekávání.

## Prověrka a ochrana lidí

Prověrky se netýkají jen firem, ale i lidí – statutárních orgánů, skutečných majitelů, klíčových zaměstnanců. Kniha zdůrazňuje, že stejné nástroje, které chrání před manipulací, mohou při nedbalém použití poškodit nevinného: záměnou osob, převzetím nepodložené pověsti nebo spojením nesouvisejících údajů. Zpráva prověrky má proto rozlišovat mezi ověřenými skutečnostmi, nepotvrzenými tvrzeními a hypotézami a nemá šířit údaje o soukromých osobách nad rámec účelu prověrky. Tento požadavek odpovídá zásadě minimalizace údajů v obecném nařízení o ochraně osobních údajů a obranné logice knihy, která OSINT popisuje jen v zákonném rámci (viz [doxing](@/glossary/doxing.md)).

## Meze a otevřené otázky

DD Engine vytváří zprávy, nikoli rozhodnutí v reálném čase, a jeho výstupy vyžadují hodiny analýzy. Je závislý na kvalitě vstupů od OSINT a rejstříkových agentů. Zpráva není právním ani investičním doporučením; je podkladem pro rozhodnutí lidí. Původní stránka uváděla příklad s konkrétními částkami a názvem subjektu; ty se zde z důvodu anonymity a ověřitelnosti neuvádějí.

Otevřenou otázkou zůstává, jak v matici zachytit zdroje, jejichž nezávislost nelze zjistit – kniha doporučuje počítat je jako závislé, dokud se neprokáže opak.

## Literatura

- FATF (2012). *International Standards on Combating Money Laundering and the Financing of Terrorism & Proliferation: The FATF Recommendations* (s pozdějšími aktualizacemi). Paris: FATF.
- Heuer, R. J., Jr. (1999). *Psychology of Intelligence Analysis*. Washington, DC: Center for the Study of Intelligence, Central Intelligence Agency.
- Heuer, R. J., Jr., & Pherson, R. H. (2011). *Structured Analytic Techniques for Intelligence Analysis*. Washington, DC: CQ Press.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.

## Související

**Agenti**

- [Czech ARES a screening](@/kompendium/aiad-integration/czech-ares-ea-screening.md) – rejstříková data.
- [OSINT a validace zdrojů](@/kompendium/aiad-integration/osint-ea-source-validation.md) – otevřené zdroje.
- [Trinity Gate a ověřování](@/kompendium/aiad-integration/trinity-gate-ea-verification.md) – ověření závěrů prověrky.

**Pojmy**

- [Due Diligence](@/glossary/due-diligence.md) – heslo glosáře.
- [Sanctions Screening](@/glossary/sanctions-screening.md) – screening sankčních seznamů.

**Kniha**

- [EA × Due Diligence: vážení zdrojů](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) – podrobný rozbor.
- [Potvrzovací zkreslení v prověrkách](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md) – zkreslení posuzovatele.
