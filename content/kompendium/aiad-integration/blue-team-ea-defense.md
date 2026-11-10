+++
title = "Blue Team a obrana proti technikám EA"
description = "Jak Blue Team Prismatic Platform brání epistemickou integritu: strukturované důkazy místo výstrah, pluralita signálů, sledování posunu – a lidská obdoba této obrany v knize."
weight = 11

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "color-teams"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["red-team-ea-detection", "purple-team-ea-synthesis", "white-team-ea-verification", "autoheal-ea-regression-repair", "nabla-infinity-ea-pipeline"]
toc = true
+++

# Blue Team a obrana proti technikám EA

[Blue Team](@/glossary/blue-team.md) je obranným týmem v architektuře [barevných týmů](@/glossary/color-teams.md) Prismatic Platform, softwarové platformy, z níž kniha vzešla. Zatímco [Red Team](@/kompendium/aiad-integration/red-team-ea-detection.md) simuluje útoky, Blue Team brání: dbá na to, aby přesvědčení platformy byla dobře doložena, signály nebyly poškozeny a uvažování se neodchýlilo od ověřeného výchozího stavu. Tato stránka popisuje, jak Blue Team pracuje s taxonomií epistemických útoků (EA), jak se jeho principy liší od běžné kybernetické obrany a co z nich plyne pro čtenáře knihy.

## Agent v kostce

Podle hesla glosáře tvoří Blue Team v době zápisu čtyři specializovaní agenti zaměření na epistemickou obranu syntézou důkazů. Zásadní rozdíl oproti běžným obranným týmům je v povaze výstupu. Běžný blue team vytváří výstrahy – „zjištěno podezřelé přihlášení“, „pozorován neobvyklý provoz“. Blue Team platformy vytváří **strukturované důkazy**: zdokumentovaná pozorování s původem, mírou důvěry, souladem s požadavkem [plurality signálů](@/glossary/signal-plurality.md) a výslovně vyjádřenou nejistotou. Výstraha říká, že se něco děje; strukturovaný důkaz říká, co přesně bylo pozorováno, odkud to pochází a jak moc se na to dá spolehnout.

K hlavním činnostem patří slučování signálů z více zdrojů, sledování postupného posunu pod prahem pozornosti a údržba obranných vzorců. Původní verze této stránky uvádí vícevrstvý postup kontroly: porovnání se známými vzorci, sémantickou analýzu v [epistemickém procesu](@/glossary/epistemic-pipeline.md) a sledování odchylek chování od výchozího stavu. Při zachycení podezřelého vzorce následuje izolace, záznam a předání nálezu [Purple Teamu](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) k rozboru.

## Proč se týká technik EA

Blue Team používá taxonomii knihy jako mapu toho, co má obrana zachytit. Velká část technik, zejména z [oddílu 03](@/kompendium/03-zakladni-kategorie/_index.md), má strukturní stopu, kterou lze sledovat i strojově: [monokulturu zdrojů](@/kompendium/detection-signatures/17-network-source-monoculture.md), [cirkularitu citací](@/kompendium/detection-signatures/18-network-citation-circularity.md), [posun rámování](@/kompendium/detection-signatures/4-linguistic-framing-shift.md) nebo [nefalsifikovatelná tvrzení](@/kompendium/detection-signatures/3-linguistic-unfalsifiable-claims.md). [Detekční signatury](@/kompendium/detection-signatures/_index.md) knihy jsou proto přirozeným mostem mezi lidskou a strojovou obranou: popisují stopy, které lze zachytit v textu, chování i síti zdrojů.

Hlubší vrstvy taxonomie – [ultramární techniky](@/kompendium/05-ultramari-techniky/_index.md) – se signaturovému přístupu vymykají. Původní stránka výslovně uvádí, že Blue Team je vůči nim do značné míry slepý a jejich analýzu deleguje na rámec [NABLA Infinity](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md). To odpovídá i povaze oddílu 05: popisuje jevy na úrovni podmínek poznání, které nemají jednoduchou povrchovou stopu.

## Jak pracuje

Obrana Blue Teamu stojí na dvou principech. Prvním je **pluralita a nezávislost**: přesvědčení se nepřijme na základě jediného signálu a signály se společným původem se počítají jako jeden. Tento požadavek odpovídá axiomům [NABLA](@/glossary/nabla-axioms.md) a v analytické tradici má dlouhou historii; Heuer (1999) jej popisuje jako ochranu proti tomu, aby analytik přeceňoval množství informací, které ve skutečnosti pocházejí z jednoho zdroje. Druhým principem je **sledování posunu**: mnoho útoků nepůsobí jedním výrazným krokem, ale postupnou změnou, z níž žádný jednotlivý krok nepřekročí práh výstrahy. Dekker (2011) popsal obdobný jev v organizacích jako „sklouzávání k selhání“ – sérii drobných, jednotlivě rozumných odchylek, které dohromady vedou ke katastrofě.

Na straně postupu se Blue Team podobá klasickým obranným modelům, které útok chápou jako řetězec kroků a obranu jako příležitost přerušit jej v kterémkoli článku (Hutchins, Cloppert a Amin 2011). Rozdíl je v tom, že články řetězce zde nejsou kroky průniku do sítě, ale kroky, jimiž se nepodložené tvrzení stává přijatým přesvědčením.

Z obranného hlediska je podstatné i to, co Blue Team nedělá. Nerozhoduje o pravdivosti tvrzení s konečnou platností a neodstraňuje nepohodlné údaje; jeho úkolem je zajistit, aby každé přesvědčení neslo informaci o svém původu a o své jistotě. Tím se liší od filtrů, které obsah jen propouštějí nebo blokují. Pro epistemickou bezpečnost je tento rozdíl zásadní, protože blokování bez záznamu by samo mohlo sloužit jako nástroj [selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md).

## Spolupráce s dalšími agenty

Blue Team přebírá nálezy [Red Teamu](@/kompendium/aiad-integration/red-team-ea-detection.md) a podle nich upravuje obranu. O uzavření nálezu nerozhoduje sám; rozhoduje [Purple Team](@/kompendium/aiad-integration/purple-team-ea-synthesis.md), který ověří, že obrana skutečně funguje. Opravu zranitelných míst může spustit [AutoHeal](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md), doklad o kvalitě záznamů poskytuje [White Team](@/kompendium/aiad-integration/white-team-ea-verification.md) a regulatorní souvislosti posuzuje [Compliance](@/kompendium/aiad-integration/compliance-ea-regulatory-screening.md).

## Co z toho plyne pro čtenáře knihy

Heslo glosáře Blue Team výslovně uvádí, že jeho zásady jsou strojovou obdobou obrany, kterou kniha doporučuje lidem. První zásada – víc nezávislých zdrojů pro každé důležité tvrzení – odpovídá [triangulaci zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) a [rutině ověřování napříč zdroji](@/kompendium/self-defense-guides/36-cross-source-routine.md). Druhá – zachovat rozpor, místo aby se jeden pól zahodil – odpovídá [revizi přesvědčení](@/kompendium/self-defense-guides/7-belief-revision.md). Třetí – sledovat posun pod prahem pozornosti – odpovídá [metakognitivnímu sledování](@/kompendium/self-defense-guides/1-metacognitive-monitoring.md) a vedení [paměťového archivu](@/kompendium/self-defense-guides/43-memory-archive.md), který umožní porovnat současné přesvědčení s tím, co člověk věděl dřív.

Nejcennějším poučením je rozdíl mezi výstrahou a důkazem. Lidé vystavení manipulaci často žijí ve stavu trvalé výstrahy – „něco je špatně“ – bez možnosti říct co. Obrana knihy, podobně jako Blue Team, směřuje od výstrahy k doloženému pozorování: zapsat, co se stalo, kdy, kdo byl přítomen, co tomu odporuje. Tento posun pomáhá klinicky (viz [rekonstrukce časové osy](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md)) i forenzně (viz [uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md)).

## Příklad

Do znalostní báze platformy přichází tvrzení o firmě, která má být předmětem prověrky: „Firma je v insolvenci.“ Tvrzení podporuje dvanáct článků. Běžný filtr by na základě počtu zdrojů tvrzení přijal nebo vydal výstrahu. Blue Team postupuje jinak. Nejprve zjišťuje původ článků a zjistí, že deset z nich přebírá jednu zprávu z jednoho serveru; v duchu axiomu nezávislosti zdrojů je počítá jako jeden signál. Dva zbývající články se odvolávají na veřejný rejstřík; ten ale v době kontroly žádné insolvenční řízení neuvádí. Výstupem není výstraha „podezřelá zpráva“, ale strukturovaný důkaz: tvrzení má jeden nezávislý původ, je v rozporu s veřejným rejstříkem, rozpor je zachován a míra důvěry je nízká. Takový výstup může člověk v další fázi prověrky ověřit a rozhodnout.

Lidská obdoba téhož postupu je popsána v [triangulaci zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) a v [ověřování tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md). Pro prověrky protistran ji rozvádí stránka [EA × Due Diligence: vážení zdrojů](@/kompendium/cross-domain/10-ea-dd-source-weighting.md). Rozdíl mezi „mnoha zdroji“ a „mnoha nezávislými zdroji“ je jedním z nejdůležitějších obranných rozlišení celé knihy, protože právě na jeho zaměnění stojí [pseudokonsenzus](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md).

## Meze a otevřené otázky

Blue Team chrání znalostní systémy platformy, nikoli lidi; jeho výstupy nejsou klinickým ani forenzním posouzením. Signaturový přístup je silný proti vzorcům, které mají povrchovou stopu, a slabý proti těm, které ji nemají. Sledování posunu naráží na obecnou potíž, že každý výchozí stav je sám výsledkem minulých rozhodnutí: pokud byl už výchozí stav poškozen, posun od něj nic neukáže. Kniha se s touto potíží setkává u lidí, jejichž „normál“ vznikl v manipulativním prostředí; obranou je v obou případech vnější srovnání, nikoli jen srovnání se sebou samým.

## Literatura

- Dekker, S. (2011). *Drift into Failure: From Hunting Broken Components to Understanding Complex Systems*. Farnham: Ashgate.
- Heuer, R. J., Jr. (1999). *Psychology of Intelligence Analysis*. Washington, DC: Center for the Study of Intelligence, Central Intelligence Agency.
- Hutchins, E. M., Cloppert, M. J., & Amin, R. M. (2011). Intelligence-driven computer network defense informed by analysis of adversary campaigns and intrusion kill chains. *Leading Issues in Information Warfare & Security Research*, 1(1), 80–106.

## Související

**Barevné týmy a agenti**

- [Red Team a detekce EA](@/kompendium/aiad-integration/red-team-ea-detection.md) – zdroj nálezů.
- [Purple Team a syntéza](@/kompendium/aiad-integration/purple-team-ea-synthesis.md) – uzavírá smyčku útok–obrana.
- [AutoHeal a oprava regresí](@/kompendium/aiad-integration/autoheal-ea-regression-repair.md) – opravuje zranitelná místa.
- [NABLA Infinity a detekce EA](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) – hlubší vrstvy analýzy.

**Pojmy**

- [Blue Team](@/glossary/blue-team.md) – heslo glosáře.
- [Signal Plurality](@/glossary/signal-plurality.md) – požadavek více nezávislých signálů.

**Kniha**

- [Detekční signatury](@/kompendium/detection-signatures/_index.md) – stopy technik v textu, chování a síti.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – lidská obdoba plurality signálů.
