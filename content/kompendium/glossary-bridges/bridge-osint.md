+++
title = "Bridge: OSINT (zpravodajství z otevřených zdrojů)"
description = "Most mezi heslem OSINT a knihou: otevřené zdroje jako obranný a zákonný nástroj ověřování, otrávené zdroje a ozvěnové komory, riziko doxingu a zaujatost vyšetřovatele."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "osint", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["osint", "entity-resolution", "intelligence-fusion", "doxing", "due-diligence", "easm"]
parent = "kompendium-glossary-bridges"
glossary_target = "osint"
toc = false
+++

# Bridge: OSINT (zpravodajství z otevřených zdrojů)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[OSINT](@/glossary/osint.md) (*Open Source Intelligence*, zpravodajství z otevřených zdrojů) je disciplína
sběru, zpracování, analýzy a předávání informací z veřejně a legálně dostupných zdrojů – veřejných
rejstříků, médií, odborných publikací, registrací domén, záznamů certifikátů nebo veřejných profilů.
Od signálového a lidského zpravodajství se liší tím, že nepracuje s utajovanými prostředky; od pouhého
vyhledávání se liší strukturovaným analytickým postupem, ověřováním zdrojů a etickými pravidly sběru.
V posledních letech se OSINT rozšířil i mimo státní zpravodajství: Higgins (2021) popsal, jak skupina
nezávislých badatelů z veřejně dostupných fotografií, videí a dat dokázala ověřit události, které
oficiální zdroje popíraly.

Na platformě, z níž Kompendium vzešlo, tvoří OSINT jeden z hlavních subsystémů. Kniha ho popisuje
**výhradně jako obranný a zákonný nástroj**: k ověřování tvrzení, k rozpoznání koordinovaných kampaní
a k ochraně lidí, nikoli k vyhledávání a sledování jednotlivců.

## OSINT očima knihy

Pro knihu je OSINT především **disciplínou ověřování**. Většina technik EA, které působí ve veřejném
prostoru, stojí na tom, že lidé neověřují: přebírají citáty vytržené z kontextu, sdílejí podvržené
snímky a věří „nezávislým“ zdrojům, které jsou propojené. Dovednosti OSINT – dohledat původní zdroj,
ověřit datum a místo, zjistit, kdo za účtem stojí – jsou obranou proti technikám
[EA-2.3.2 Kolaps kontextu](@/kompendium/techniques/ea-2-3-2-context-collapse.md),
[EA-2.3.3 Vytrhávání citátů](@/kompendium/techniques/ea-2-3-3-quote-mining.md) nebo
[EA-9.4.3 Síť loutkových účtů](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md).
Wardle a Derakhshan (2017) v rámci „informační poruchy“ rozlišili mylnou informaci, dezinformaci a
škodlivou informaci; OSINT pomáhá určit, o který druh jde.

Druhou stránkou je **zranitelnost samotných zdrojů**. Otevřené zdroje lze otrávit: vytvořit falešné
záznamy, nasadit narativ do zdrojů, které analytici běžně používají, nebo vytvořit ozvěnovou komoru,
v níž se tvrzení vzájemně potvrzují. Heuer (1999) upozornil, že analytik, který si vytvoří hypotézu
brzy, pak informace hodnotí podle ní; otrávený zdroj, který hypotézu potvrzuje, proto projde snáz
než zdroj, který jí odporuje. Kniha tento vzorec rozebírá v kapitolách o injekci narativu a o
zaujatosti vyšetřovatele.

Třetí stránkou je **etika**. Veřejná dostupnost informace neznamená, že je přiměřené ji shromáždit
a spojit. Nissenbaum (2010) tento problém vyjádřila pojmem kontextové integrity a Solove (2006) popsal
agregaci údajů jako samostatný druh zásahu do soukromí. Sjednocování veřejných údajů o osobě je
mechanismem [doxingu](@/glossary/doxing.md); proto kniha OSINT vždy spojuje s pravidly účelu, přiměřenosti
a lidské revize.

Čtvrtou stránkou je **napodobení metody**. Komunity šířící konspirační výklady často přebírají
estetiku otevřeného pátrání – „dělej si vlastní výzkum“, snímky obrazovky, šipky a spojnice mezi
lidmi –, ale bez jeho disciplíny: bez hledání vyvracejících dokladů, bez posouzení nezávislosti a bez
ochoty závěr opustit. Douglas, Sutton a Cichocka (2017) ukázali, že konspirační přesvědčení uspokojují
potřebu porozumění, bezpečí a pozitivního obrazu vlastní skupiny; pocit, že člověk „sám odhalil“
skrytou souvislost, tuto potřebu posiluje. Kniha tento vzorec rozebírá v kazuistice
[Zotavení z QAnon](@/kompendium/case-studies/55-qanon-recovery.md). Rozdíl mezi OSINT a jeho napodobeninou
neleží v nástrojích, ale v tom, zda postup připouští, že se hypotéza ukáže jako mylná.

## Kde se pojem v knize vyskytuje

Jak agent platformy shromažďuje a váží veřejné zdroje a rozpoznává ozvěnové komory a otrávené zdroje,
popisuje stránka [OSINT a EA](@/kompendium/aiad-integration/osint-ea-source-validation.md). Řada
mezioborových kapitol se OSINT věnuje podrobně: [Source Credibility under Epistemic Attack](@/kompendium/cross-domain/1-ea-osint-source-credibility.md),
[ARES Validation pod EA Lens](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md),
[Sociální sítě jako EA bojiště](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md),
[Narrative Injection Attacks](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md),
[Cross-Source Triangulation](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) a
[Confirmation Bias v DD procesu](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md).

Etickou stránku rozvádí kapitola [Dual Use](@/kompendium/08-prilohy/dual-use.md) a technika
[EA-2.3.8 Epistemický doxxing](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md); právní stránku
kapitola [Pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md).

## Od pojmu k praxi

### Rozpoznání

Kniha upozorňuje na tři vzorce, v nichž práce s otevřenými zdroji selhává nebo je zneužita. Prvním je
**potvrzení z ozvěny**: tvrzení se objevuje na mnoha místech, ale všechna vedou k jednomu původu – viz
signatura [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md).
Druhým je **injekce narativu**: do zdrojů, které analytici používají, se záměrně vloží obsah, který má
vést k určitému závěru – viz signatura [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md).
Třetím je **davové pátrání**, při němž skupina lidí z veřejných údajů „identifikuje“ pachatele. Známé
případy po teroristických útocích ukázaly, že takové pátrání může označit nevinné lidi a vystavit je
obtěžování dřív, než se omyl vyjasní.

### Obrana

Obranou je disciplína, kterou OSINT jako obor vyžaduje: dohledat původní zdroj, ověřit čas a místo,
posoudit nezávislost potvrzujících zdrojů a vést záznam o tom, jak byl závěr získán. Wineburg a McGrew
(2019) ukázali, že zkušení ověřovatelé faktů čtou „laterálně“ – místo hloubkového čtení podezřelého
zdroje nejdřív zjistí, co o něm říkají jiní. Tuto dovednost kniha doporučuje každému v návodech
[Rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md) a
[Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md).

### Náprava

Když se ukáže, že závěr z otevřených zdrojů byl chybný – například že člověk byl veřejně označen za
někoho, kým není –, je náprava naléhavá, protože omyl se šíří rychleji než oprava. Náprava zahrnuje
zveřejnění opravy na stejných místech, kde se šířil omyl, a podporu zasaženého. Kniha k tomu odkazuje
na kapitolu [PR obrana narativu](@/kompendium/organizational-defense/34-PR-narrative-defense.md).

### Rámec pro profesionály

Pro novináře, analytiky prověrek a vyšetřovatele plyne z knihy několik zásad: shromažďovat jen údaje,
které účel vyžaduje; u každého závěru o osobě uvádět míru jistoty a zdroje; nepublikovat identifikaci
bez nezávislého potvrzení; a respektovat právní rámec ochrany osobních údajů, v Evropské unii
nařízení (EU) 2016/679 (GDPR). Etický rámec výzkumu v informačních technologiích, který formulovala
zpráva Menlo (Dittrich a Kenneally 2012), k tomu přidává požadavek posoudit dopad na osoby, které do
výzkumu nevstoupily dobrovolně.

## Odlišení od příbuzných pojmů

OSINT je třeba odlišit od [EASM](@/glossary/easm.md), které uplatňuje podobné metody na vlastní
organizaci, a od [fúze zpravodajství](@/glossary/intelligence-fusion.md), která slučuje zdroje libovolného
druhu. Od [sjednocování entit](@/glossary/entity-resolution.md) se liší tím, že sjednocování je jedním
z kroků analýzy, OSINT celý cyklus. Od doxingu se OSINT liší účelem, přiměřeností a respektem k právům
dotčených osob, nikoli technikou; proto kniha klade důraz na pravidla.

## Časté omyly

Prvním omylem je domněnka, že veřejně dostupné znamená volně použitelné. Druhým omylem je přesvědčení,
že víc zdrojů znamená spolehlivější závěr; rozhoduje jejich nezávislost. Třetím omylem je považovat
OSINT za neutrální techniku: kdo ho dělá, nese odpovědnost za to, co z veřejných údajů složí.

## Příklad (anonymizovaný kompozit)

Po požáru skladu se na sociálních sítích šíří video, které má ukazovat úmyslné založení požáru
příslušníkem menšiny. Regionální redakce video ověří: dohledá jeho nejstarší výskyt, porovná okolí
se satelitními snímky a zjistí, že bylo natočeno o tři roky dřív v jiné zemi. Redakce zveřejní
ověření i s postupem, aby si ho čtenáři mohli zopakovat. Šíření videa nezastaví úplně, ale místní
samospráva se na ověření odvolá a zabrání eskalaci.

## Meze a otevřené otázky

Otevřená zůstává otázka, jak vymezit hranici mezi oprávněným ověřováním a sledováním, když tytéž
metody slouží oběma. Druhou otázkou je, jak se OSINT promění s rozšířením generovaného obsahu, kdy
bude stále těžší odlišit autentický záznam od syntetického – kniha tuto otázku rozvádí v kapitole
[EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md).

## Literatura

- Dittrich, D., & Kenneally, E. (2012). *The Menlo Report: Ethical Principles Guiding Information and Communication Technology Research*. U.S. Department of Homeland Security.
- Douglas, K. M., Sutton, R. M., & Cichocka, A. (2017). The psychology of conspiracy theories. *Current Directions in Psychological Science*, 26(6), 538–542.
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis*. Center for the Study of Intelligence, CIA.
- Higgins, E. (2021). *We Are Bellingcat: An Intelligence Agency for the People*. Bloomsbury.
- Nissenbaum, H. (2010). *Privacy in Context*. Stanford University Press.
- Solove, D. J. (2006). A taxonomy of privacy. *University of Pennsylvania Law Review*, 154(3), 477–564.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder*. Council of Europe.
- Wineburg, S., & McGrew, S. (2019). Lateral reading and the nature of expertise. *Teachers College Record*, 121(11).

## Související

**Glosář**

- [OSINT](@/glossary/osint.md) – heslo, které most propojuje.
- [Doxing](@/glossary/doxing.md) – zneužití spojování veřejných údajů.
- [Entity Resolution](@/glossary/entity-resolution.md) – krok, v němž se záznamy přiřazují osobám.
- [Intelligence fusion](@/glossary/intelligence-fusion.md) – slučování zdrojů.

**Kniha**

- [OSINT a EA](@/kompendium/aiad-integration/osint-ea-source-validation.md) – vážení veřejných zdrojů na platformě.
- [Narrative Injection Attacks](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) – otrávené zdroje.
- [Confirmation Bias v DD procesu](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md) – zaujatost vyšetřovatele.
- [Dual Use](@/kompendium/08-prilohy/dual-use.md) – etika otevřených zdrojů.

**Sesterské mosty**

- [Bridge: Entity Resolution](@/kompendium/glossary-bridges/bridge-entity-resolution.md) – sjednocování záznamů.
- [Bridge: Intelligence fusion](@/kompendium/glossary-bridges/bridge-intelligence-fusion.md) – fúze zdrojů.
- [Bridge: Censys](@/kompendium/glossary-bridges/bridge-censys.md) – technický otevřený zdroj.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [OSINT (zpravodajství z otevřených zdrojů)](@/glossary/osint.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
