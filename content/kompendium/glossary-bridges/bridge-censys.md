+++
title = "Bridge: Censys"
description = "Most mezi heslem Censys a knihou: akademický celointernetový sken jako zdroj bezpečnostních dat, nezávislé potvrzení mezi zdroji a riziko, že technická data poslouží k přehnané atribuci."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "censys", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["censys", "shodan", "greynoise", "easm", "osint", "signal-plurality"]
parent = "kompendium-glossary-bridges"
glossary_target = "censys"
toc = false
+++

# Bridge: Censys

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Censys](@/glossary/censys.md) je platforma bezpečnostních dat, která průběžně skenuje veřejný internet
a katalogizuje hostitele, služby, certifikáty a software, jež na síťové dotazy odpovídají. Vzešla
z akademického výzkumu na Michiganské univerzitě. Durumeric, Wustrow a Halderman (2013) představili
skener ZMap, který dokáže projít celý adresní prostor IPv4 v řádu desítek minut, a Durumeric a
spolupracovníci (2015) na jeho datech postavili vyhledávač Censys. Akademický původ se projevuje
důrazem na reprodukovatelnost měření a na zveřejněnou metodiku.

Na platformě, z níž Kompendium vzešlo, je Censys jedním z vnějších zdrojů bezpečnostního modulu pro
[správu vnější útočné plochy](@/glossary/easm.md). Heslo patří do kontextu platformy a kybernetické
bezpečnosti. Kniha ho zařazuje mezi mosty kvůli principu, jímž se jeho data používají: žádné tvrzení se
neopírá o jediný zdroj a nezávislé zdroje se navzájem potvrzují nebo vyvracejí.

## Censys očima knihy

Celointernetové skenování je příkladem poznání, které je **nepřímé a zprostředkované**: nikdo nevidí
„internet“, vidí jen odpovědi zařízení na dotazy v určitém okamžiku a z určitého místa. Výsledek je
proto vždy snímek, ne realita sama. Kniha tuto vlastnost zdůrazňuje, protože z ní plyne nejčastější
chyba při práci s technickými daty: zaměnit záznam o odpovědi za poznání o tom, kdo za ní stojí a s jakým
úmyslem. Rid a Buchanan (2015) v analýze atribuce kybernetických útoků ukázali, že technické
indikátory jsou jen jednou vrstvou atribuce a že spolehlivý závěr o původci vyžaduje spojení
technické, provozní a strategické roviny.

Druhým tématem je **nezávislost zdrojů**. Censys a [Shodan](@/glossary/shodan.md) skenují internet
nezávisle, s jinou metodikou a z jiných míst. Shoda jejich dat je silnějším dokladem než opakování
jednoho z nich; rozpor je podnětem ke zkoumání, ne chybou, kterou je třeba zahladit. Kniha tuto zásadu
formuluje obecně v pojmu [plurality signálů](@/glossary/signal-plurality.md) a v lidské podobě
v návodu [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md).

Třetím tématem je **etika měření**. Durumeric et al. (2013) spolu se skenerem zveřejnili doporučení
pro ohleduplné skenování, například možnost vyřazení na žádost a jasnou identifikaci skenujícího.
Obecný etický rámec výzkumu v informačních technologiích formulovala zpráva Menlo (Dittrich a
Kenneally 2012), která přenáší zásady respektu k osobám, prospěšnosti a spravedlnosti na výzkum sítí.
Kniha z toho přebírá zásadu, že ani veřejně dostupná data nejsou eticky neutrální – viz kapitola
[Dual Use](@/kompendium/08-prilohy/dual-use.md).

## Kde se pojem v knize vyskytuje

Jak se data z veřejných zdrojů na platformě váží a jak se rozpoznávají ozvěnové komory a otrávené
zdroje, popisuje stránka [OSINT a EA](@/kompendium/aiad-integration/osint-ea-source-validation.md).
Propojení vystavených aktiv s riziky manipulace rozebírá stránka
[Perimeter a EA](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md).

Epistemické riziko práce s technickými daty – přehnaná jistota atribuce a přebírání cizích závěrů bez
ověření – je tématem kapitol [Attribution – Beyond Technical Indicators](@/kompendium/cross-domain/23-ea-security-attribution-bias.md)
a [Threat Intel Source Validation](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md).
Metodiku nezávislého potvrzení napříč zdroji přibližuje kapitola
[Cross-Source Triangulation v EA Frameworku](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md).

## Od pojmu k praxi

### Rozpoznání

Kniha nepopisuje, jak data Censys používat k vyhledávání cílů; zajímá ji, jak rozpoznat, kdy se
z technických dat dělá víc, než unesou. Varovným znakem je tvrzení o úmyslu nebo identitě původce,
které stojí jen na jednom typu technického indikátoru, například na tom, kde je server hostován nebo
jaký certifikát používá. Dalším znakem je „potvrzení“, které ve skutečnosti cituje tentýž datový
zdroj přes několik zpráv – kniha tento vzorec popisuje jako
[cirkularitu citací](@/kompendium/detection-signatures/18-network-citation-circularity.md).

### Obrana

Obranou je oddělit tři otázky, které se v praxi snadno slévají: co bylo pozorováno (odpověď služby
v určitém čase), co z toho plyne technicky (konfigurace, zranitelnost) a co se o tom tvrdí dál (kdo
za tím stojí a proč). Heuer (1999) doporučoval u každé hypotézy výslovně zapsat, které doklady ji
podporují a které by ji vyvracely; tentýž postup chrání před přeceněním skenovacích dat. Pro
organizace kniha doporučuje, aby zprávy o hrozbách uváděly zdroj a datum každého technického údaje.

### Náprava

Když se zjistí, že závěr stál na přeceněných technických datech – například že organizace byla veřejně
označena za původce útoku na základě jediného indikátoru –, je náprava dvojí. Technicky jde o opravu
záznamu a zveřejnění, z čeho závěr vycházel. Epistemicky jde o opravu narativu, který se mezitím
rozšířil; kniha k tomu odkazuje na kapitolu
[Incident Response – Narrative Discipline](@/kompendium/cross-domain/22-ea-security-incident-response-narrative.md).

### Rámec pro profesionály

Pro právníky, soudce a vyšetřovatele, kteří se s výstupy skenovacích služeb setkávají jako s důkazem,
je podstatná otázka původu a úplnosti. Výstup vyhledávače je sekundární záznam: neříká, jak přesně
byl dotaz položen, z jakého místa a s jakými filtry. Kapitoly
[Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) a
[Znalec EA](@/kompendium/forensic-legal/21-expert-witness-EA.md) popisují, jak takový záznam
zajistit a jak se ptát znalce, aby odlišil pozorování od interpretace. Rid a Buchanan (2015)
připomínají, že atribuce je vždy otázkou míry jistoty, nikoli binárním závěrem, a proto by ji
i soudní posudek měl formulovat jako odhad s uvedenými předpoklady.

## Odlišení od příbuzných pojmů

Censys je třeba odlišit od [Shodanu](@/glossary/shodan.md), který vznikl jako komerční vyhledávač
zařízení a klade důraz na šíři pokrytí, zatímco Censys vychází z akademické metodiky měření. Od
[GreyNoise](@/glossary/greynoise.md) se liší směrem pohledu: Censys aktivně skenuje a ptá se, co je
vystaveno, GreyNoise pasivně naslouchá a třídí, kdo skenuje. Od [OSINT](@/glossary/osint.md) jako
disciplíny je Censys jen jedním zdrojem; OSINT zahrnuje celý cyklus sběru, ověření, analýzy a
předání a jeho etická pravidla se vztahují i na použití dat Censys.

## Časté omyly

Prvním omylem je považovat data celointernetového skenu za úplný obraz. Sken zachytí jen to, co
odpovídá na dotaz z daného místa a v daném čase; filtrování, geografické rozdíly a dočasné výpadky
zůstávají skryty. Druhým omylem je domněnka, že veřejně dostupné znamená eticky bezproblémové.
Třetím omylem je zaměnit akademický původ za záruku správnosti každého výstupu; metodika je
transparentní, ale interpretace zůstává na uživateli.

## Příklad (anonymizovaný kompozit)

Novinář dostane od zdroje „důkaz“, že server spojený s neziskovou organizací komunikuje s infrastrukturou
cizí státní agentury. Důkazem je snímek výsledku vyhledávání ve skenovacích datech. Redakční
bezpečnostní analytik ověří údaje ve dvou nezávislých zdrojích, zjistí, že server je sdílený hosting
s tisíci dalších webů, a že uvedený certifikát používá běžný poskytovatel. Redakce článek nevydá a
zaznamená, že šlo o pokus vytvořit narativ z technicky pravdivého, ale významově prázdného údaje.

## Meze a otevřené otázky

Kniha se dotýká technických zdrojů jen v rozsahu, v němž souvisejí s epistemickou obranou; nenahrazuje
odbornou literaturu o měření internetu. Otevřená zůstává otázka, jak rychle se mění to, co lze ze
skenů zjistit – s rozšířením šifrování a sdíleného hostingu klesá vypovídací hodnota jednotlivých
indikátorů – a jak to promítnout do posuzování věrohodnosti zpráv, které se o taková data opírají.
Nevyjasněná zůstává i hranice mezi bezpečnostním výzkumem a sledováním, o níž zpráva Menlo
(Dittrich a Kenneally 2012) mluví jako o otázce, kterou musí posoudit každý projekt zvlášť.

## Literatura

- Dittrich, D., & Kenneally, E. (2012). *The Menlo Report: Ethical Principles Guiding Information and Communication Technology Research*. U.S. Department of Homeland Security.
- Durumeric, Z., Adrian, D., Mirian, A., Bailey, M., & Halderman, J. A. (2015). A search engine backed by Internet-wide scanning. In *Proceedings of the 22nd ACM Conference on Computer and Communications Security (CCS)*.
- Durumeric, Z., Wustrow, E., & Halderman, J. A. (2013). ZMap: Fast Internet-wide scanning and its security applications. In *Proceedings of the 22nd USENIX Security Symposium*.
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis*. Center for the Study of Intelligence, CIA.
- Rid, T., & Buchanan, B. (2015). Attributing cyber attacks. *Journal of Strategic Studies*, 38(1–2), 4–37.

## Související

**Glosář**

- [Censys](@/glossary/censys.md) – technické heslo, které most propojuje.
- [Shodan](@/glossary/shodan.md) – nezávislý zdroj podobných dat.
- [GreyNoise](@/glossary/greynoise.md) – pasivní pohled na skenovací provoz.
- [EASM](@/glossary/easm.md) – disciplína, v níž se data uplatňují.

**Kniha**

- [OSINT a EA](@/kompendium/aiad-integration/osint-ea-source-validation.md) – vážení veřejných zdrojů.
- [Attribution – Beyond Technical Indicators](@/kompendium/cross-domain/23-ea-security-attribution-bias.md) – meze technické atribuce.
- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – falešné potvrzení.
- [Dual Use](@/kompendium/08-prilohy/dual-use.md) – etika veřejně dostupných dat.

**Sesterské mosty**

- [Bridge: Shodan](@/kompendium/glossary-bridges/bridge-shodan.md) – příbuzný zdroj.
- [Bridge: EASM](@/kompendium/glossary-bridges/bridge-easm.md) – správa vnější útočné plochy.
- [Bridge: OSINT](@/kompendium/glossary-bridges/bridge-osint.md) – disciplína otevřených zdrojů.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Censys](@/glossary/censys.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
