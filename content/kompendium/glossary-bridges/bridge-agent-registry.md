+++
title = "Bridge: Agent Registry (registr agentů)"
description = "Most mezi heslem registru agentů a knihou: evidence toho, kdo v systému mluví, a lidská obdoba – vědět, od koho informace pochází a kdo za ní stojí."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "agent-registry", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["agent-registry", "agent", "agent-tier", "aiad", "bridge-agent", "bridge-hawkeye"]
glossary_target = "agent-registry"
toc = false
+++

# Bridge: Agent Registry (registr agentů)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Agent Registry](@/glossary/agent-registry.md) je na platformě Prismatic, z níž kniha vzešla,
autoritativní katalog všech [agentů](@/glossary/agent.md). U každého zaznamenává jedinečný
volací znak, úroveň oprávnění podle [Agent Tier](@/glossary/agent-tier.md), doménu,
schopnosti, stav a závislosti. Registr se generuje ze specifikačních souborů agentů, brání
duplicitním definicím a běhové prostředí podle něj ověřuje identitu: agent, který v registru
není, na platformě nepůsobí. Heslo glosáře popisuje i vývoj registru od ručně psaného seznamu
k automaticky indexovanému katalogu; počty agentů, které uvádí, jsou údaji v době zápisu.

Pro knihu je registr zajímavý ze stejného důvodu, ze kterého vznikl: v prostředí s mnoha
hlasy je třeba vědět, **kdo mluví, s jakým oprávněním a kdo za jeho slovem ručí**. Tam, kde
tahle evidence chybí nebo je podvržená, vzniká prostor pro jednu z nejstarších forem
epistemické manipulace – vydávání jednoho hlasu za mnoho a cizího hlasu za autoritativní.

## Pojem v jeho vlastním oboru

V informatice řeší registry a adresáře dva problémy: *vyhledání* (který prvek umí co) a
*ověření* (je tento prvek tím, za koho se vydává). V systémech s více agenty patří adresář
služeb a evidence rolí k základní výbavě koordinace, protože agenti musejí najít
spolupracovníky a spolehnout se na to, že výsledek pochází od toho, kdo je k úkolu oprávněn
(Wooldridge 2002). Bez ověřené identity je otevřený systém zranitelný útokem, který Douceur
(2002) pojmenoval *Sybil attack*: jediný aktér vytvoří mnoho falešných identit a získá tím
nepřiměřený vliv na hlasování, reputaci či směrování.

Registr agentů platformy je odpovědí na tento problém v uzavřeném prostředí: identita se
neodvozuje z toho, co agent o sobě tvrdí, ale ze záznamu, který vznikl mimo něj a podléhá
auditu. Glosář k tomu popisuje doménovou klasifikaci, vyhledávání podle úrovně a auditní stopu
změn.

## Analogie, kterou kniha činí

Lidské skupiny mají vlastní „registr“ – sdílenou představu o tom, kdo co ví, komu lze v jaké
věci věřit a kdo za co odpovídá. Psychologie ji popisuje jako *transaktivní paměť*: skupina si
nepamatuje vše, ale pamatuje si, kdo si co pamatuje (Wegner 1987). Tato distribuovaná evidence
je pro poznání nezbytná, protože nikdo nemůže ověřit všechno sám; laik se musí rozhodovat,
kterým expertům věřit, a to podle znaků, které sám dokáže posoudit (Goldman 2001).

Kniha ukazuje, že právě tato evidence bývá cílem manipulace. Technika
[EA-2.1.9 Vytvoření pseudo-konsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md)
vytváří dojem, že mnoho nezávislých hlasů tvrdí totéž, ačkoli jde o jeden zdroj v mnoha
podobách – lidskou obdobu útoku Sybil. Technika
[EA-2.1.8 Inverze reputation laundering](@/kompendium/techniques/ea-2-1-8-reputation-laundering-inverze.md)
naopak propůjčuje pochybnému zdroji důvěryhodnost tím, že ho nechá projít přes uznávané
prostředníky. V obou případech se nezpochybňuje obsah, ale *evidence původu*: kdo mluví a
s jakým oprávněním.

## Kde se pojem v knize vyskytuje

Platformní stranu pojmu popisuje oddíl [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md),
zejména stránka [Archer Supreme a orchestrace detekce EA](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md),
kde je evidence agentů předpokladem toho, aby se nálezy daly přiřadit konkrétnímu zdroji.
Síťové projevy podvržené identity rozebírají detekční signatury
[Koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md),
[Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) a
[Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md).
Investigativní pohled nabízí stránka
[EA × OSINT: Detekce botů v investigativním workflow](@/kompendium/cross-domain/6-ea-osint-bot-detection.md).

Historickým příkladem rozsáhlého podvrhu identit je činnost
[Internet Research Agency](@/kompendium/historical-cases/22-russian-ira.md), která podle
veřejně dostupných vyšetřovacích zpráv provozovala množství účtů vydávajících se za běžné
občany. Kniha případ používá k ilustraci toho, jak se z jednoho zdroje stává zdánlivý
konsenzus.

## Od pojmu k praxi

### Rozpoznání

Signálem podvržené evidence je **nepoměr mezi počtem hlasů a počtem nezávislých zdrojů**.
Mnoho účtů, které se objeví současně, používají stejné formulace a odkazují jeden na druhého,
nejsou mnoha svědky. Podobně „uznávaný expert“, jehož odbornost nelze dohledat mimo okruh lidí,
kteří ho citují, nemá za sebou registr, ale ozvěnu. V osobních vztazích se tentýž vzorec
objevuje jako odvolávání na nejmenované „všechny ostatní“, kteří prý vidí věci stejně jako
mluvčí. Goldman (2001) navrhuje laikovi ptát se po dohledatelných výsledcích experta, po shodě
nezávislých odborníků a po možných zájmech – tedy po údajích, které tvoří lidský ekvivalent
záznamu v registru.

### Odlišení

Shoda mnoha hlasů sama o sobě manipulaci nedokazuje; vědecký konsenzus vzniká právě nezávislou
shodou. Rozhodující je, zda jsou hlasy skutečně nezávislé – zda dospěly k závěru vlastní
cestou, nebo jen opakují jeden výchozí zdroj. Stejně tak anonymita není podvrhem identity:
oznamovatel nebo zranitelný svědek má dobré důvody nevystupovat pod jménem. Podvrh nastává
tehdy, když se jedna identita vydává za mnoho nebo když se vydává za někoho, kým není.

### Obrana

Obranou je vést si vlastní „registr zdrojů“: u důležitých informací zaznamenat, odkud pocházejí,
kdo je ověřil a na čem stojí jejich důvěryhodnost. Praktické postupy nabízejí příručky
[Kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md),
[Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) a
[Hodnocení mentorů](@/kompendium/self-defense-guides/27-mentor-evaluation.md). V organizacích
odpovídá registru jasná evidence rolí a odpovědností: kdo smí za instituci mluvit, kdo
rozhoduje a kam se lze obrátit, když se tvrzení o oprávnění zdá podezřelé.

### Rámec pro profesionály

Pro vyšetřovatele a analytiky je evidence původu podmínkou použitelnosti nálezu. Kniha proto
v [forenzní dokumentaci](@/kompendium/forensic-legal/10-forensic-documentation.md) a v pravidlech
[řetězce důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) trvá na tom, aby
u každého podkladu bylo zřejmé, kdo ho pořídil a kdy. Klinik se se stejnou otázkou setkává
nepřímo: klient, jehož „registr“ důvěryhodných lidí byl rozvrácen izolací, potřebuje nejprve
znovu najít několik ověřených kotev – viz [Vztahové kotvy](@/kompendium/self-defense-guides/42-relational-anchors.md).

## Časté omyly

Omylem je domnívat se, že ověření identity řeší pravdivost. Registr zaručuje, *kdo* mluví, ne
*co* je pravda; ověřený zdroj se může mýlit a anonymní zdroj může mít pravdu. Druhým omylem je
chtít po lidech „registr“ v podobě úplné kontroly nad tím, s kým mluví a čemu věří. Taková
kontrola je naopak typickým znakem prostředí s vysokou mírou kontroly, jak ho popisuje
[Bridge: BITE model](@/kompendium/glossary-bridges/bridge-bite-model.md). Lidská obdoba registru
má sloužit tomu, kdo ji vede, ne tomu, kdo by chtěl řídit jeho okolí.

## Příklad (anonymizovaný kompozit)

Zastupitelka obce dostane během týdne desítky e-mailů proti plánované stavbě. Působí jako
spontánní reakce občanů. Asistent si všimne, že mnoho zpráv má stejné odstavce, odchází
z nově založených adres a odkazuje na jediný blog. Zastupitelka proto zprávy nehodnotí podle
počtu, ale podle počtu nezávislých podání a pozve k veřejnému projednání ty, kdo se podepsali
celým jménem a adresou v obci. Ukáže se, že námitky existují, ale jsou výrazně méně rozšířené,
než naznačovala vlna e-mailů. Rozhodnutí se tak opírá o skutečný, nikoli zdánlivý obraz.

## Meze a otevřené otázky

Analogie mezi technickým registrem a lidskou evidencí důvěry je neúplná: lidská důvěra je
proměnlivá, kontextová a nelze ji redukovat na záznam. Otevřené zůstává, jak chránit evidenci
původu v prostředí generativních modelů, které umějí vytvořit přesvědčivé hlasy bez skutečných
autorů, aniž by se obrana změnila v plošné sledování lidí. Kniha k tomu odkazuje na
[Dual-use poznání](@/kompendium/glossary-bridges/bridge-dual-use-poznani.md): nástroj, který ověřuje
identitu, může v jiných rukou sloužit k jejímu zneužití.

## Literatura

- Douceur, J. R. (2002). The Sybil attack. In P. Druschel, F. Kaashoek, & A. Rowstron (Eds.), *Peer-to-Peer Systems* (LNCS 2429, pp. 251–260). Springer.
- Goldman, A. I. (2001). Experts: Which ones should you trust? *Philosophy and Phenomenological Research*, 63(1), 85–110.
- Wegner, D. M. (1987). Transactive memory: A contemporary analysis of the group mind. In B. Mullen & G. R. Goethals (Eds.), *Theories of Group Behavior* (pp. 185–208). Springer.
- Wooldridge, M. (2002). *An Introduction to MultiAgent Systems*. Wiley.

## Související

**Glosář**

- [Agent Registry](@/glossary/agent-registry.md) – heslo, které tento most propojuje s knihou.
- [Agent](@/glossary/agent.md) – jednotka, kterou registr eviduje.
- [Agent Tier](@/glossary/agent-tier.md) – úrovně oprávnění zapsané v registru.

**Kniha**

- [EA-2.1.9 Vytvoření pseudo-konsenzu](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md) – jeden hlas vydávaný za mnoho.
- [Detekční signatura: Koordinace botů](@/kompendium/detection-signatures/20-network-bot-coordination.md) – síťový projev podvržené identity.
- [Kurátorství zdrojů](@/kompendium/self-defense-guides/31-source-curation.md) – osobní evidence původu informací.
- [Řetězec důkazů](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) – původ podkladu ve forenzní praxi.

**Sesterské mosty**

- [Bridge: Agent](@/kompendium/glossary-bridges/bridge-agent.md) – pojem agenta a lidská agentnost.
- [Bridge: HAWKEYE](@/kompendium/glossary-bridges/bridge-hawkeye.md) – rozpoznávání podle více signálů.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Agent Registry (registr agentů)](@/glossary/agent-registry.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
