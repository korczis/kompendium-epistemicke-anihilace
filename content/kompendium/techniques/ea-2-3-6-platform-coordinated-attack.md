+++
title = "EA-2.3.6 Koordinovaný útok napříč platformami"
description = "Vzorec delegitimizační kampaně, která běží současně na více platformách a kanálech, aby cíl nikde neunikl a dojem shody se násobil. Znaky, odlišení, obrana."
weight = 2306
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "techniques", "ea-2-3-6", "delegitimizace", "disinformation", "digitalni"]
categories = ["academic"]

[extra]
related_terms = ["ea-9-3-7-platform-coordinated-attack", "ea-2-3-4-mob-coordination", "ea-9-4-7-cross-platform-bot-cascade", "ea-9-4-2-coordinated-inauthentic-behavior", "info-ops", "deplatforming"]
ea_code = "EA-2.3.6"
ea_category = "2. Scénáře delegitimizace"
ea_subcategory = "2.3 Mediální delegitimizace"
section_icon = "📺"
toc = true
access_level = "L2"
risk_level = "high"
parent_chapter = "/kompendium/03-zakladni-kategorie/kapitola-2/"
+++

# EA-2.3.6 Koordinovaný útok napříč platformami

| Pole | Hodnota |
|------|---------|
| **EA kód** | `EA-2.3.6` |
| **Kategorie** | 2. Scénáře [delegitimizace](@/glossary/delegitimizace.md) |
| **Subkategorie** | 2.3 Mediální delegitimizace |
| **Přístupová úroveň** | L2 (odborná analýza) |
| **Riziková úroveň** | Vysoká – obklopuje cíl ve všech prostředích, kde působí |
| **Reverzibilita** | Střední; obsah zůstává v mnoha archivech a vyhledávačích |
| **Rodičovská kapitola** | [3.2 Scénáře epistemické delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md) |
| **Rychlá karta** | [QR: EA-2.3.6](@/kompendium/quick-reference/qr-ea-2-3-6.md) |

## Definice

Koordinovaný útok napříč platformami je vzorec, v němž delegitimizační kampaň proti
osobě nebo instituci **běží současně ve více prostředích**: na sociálních sítích,
videoplatformách, diskusních fórech, v komentářích zpravodajských webů, v recenzních
systémech, v e-mailech zaměstnavateli i v tradičních médiích. Každá platforma má jiné
publikum a jiná pravidla moderace; kampaň je využívá tak, aby cíl **nikde neunikl** a aby
se opakování na různých místech jevilo jako nezávislé potvrzení.

Stránka popisuje vzorec z hlediska delegitimizace konkrétního cíle. Technickou
a algoritmickou vrstvu téhož jevu popisuje [EA-9.3.7 Koordinovaný útok na platformách](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md).

## Mechanismus (strukturní popis)

1. **Rozdělení rolí.** Na jedné platformě vzniká „důkaz“ (klip, dokument), na jiné se
   interpretuje, na třetí se mobilizuje dav a na čtvrté se oslovují instituce.
2. **Arbitráž moderace.** Obsah odstraněný na jedné platformě přežívá na jiné a vrací se
   odkazem.
3. **Zdání nezávislosti.** Tentýž narativ se objevuje u různých typů zdrojů, což
   navenek působí jako široká shoda; srov. [koordinaci platforem](@/kompendium/detection-signatures/21-network-platform-coordination.md).
4. **Most do mainstreamu.** Jakmile kampaň dosáhne viditelnosti, převezmou ji tradiční
   média jako „kontroverzi“, a tím ji legitimizují.
5. **Trvalost.** Výsledky ve vyhledávačích a archivech zůstávají roky.

Doloženým příkladem kampaní běžících napříč platformami jsou operace ruské Internet
Research Agency kolem amerických voleb v roce 2016, popsané v obžalobě z února 2018
a ve zprávách výboru amerického Senátu; tam šlo o společenský vliv, ne o útok na jednu
osobu, struktura je ale shodná.

## Průběh

Kampaň obvykle začíná v menší komunitě, kde je cíl předem znám jako protivník. Během
dnů se přesune na velké platformy a do komentářů médií. V další fázi přicházejí kontakty
na zaměstnavatele, spolupracovníky a sponzory. Pokud cíl reaguje na jedné platformě,
reakce se šíří na ostatních jako nový materiál. Kampaň může opakovaně ožívat při
každém dalším vystoupení cíle.

## Teoretický rámec: informační porucha a síťová struktura

Wardleová a Derakhshan (2017) ve zprávě pro Radu Evropy rozlišili tři typy informační
poruchy: *misinformation* (nepravdivá informace šířená bez úmyslu škodit), *disinformation*
(nepravdivá informace šířená s úmyslem škodit) a *malinformation* (pravdivá informace
použitá ke škodě, například zveřejnění soukromí). Koordinovaný útok napříč platformami
obvykle kombinuje všechny tři: falešná tvrzení, vytržené pravdivé údaje a jejich
nevědomé šíření publikem, které jim uvěřilo. Marwicková a Lewis (2017) popsali, jak
online subkultury využívají „mediální manipulaci“ – plánované šíření obsahu tak, aby ho
převzala tradiční média.

Struktura útoku odpovídá tomu, co síťová teorie popisuje jako decentralizovanou síť:
odstranění jednoho uzlu ji nezastaví. Rámec rhizomu (viz [EA-7.1.7](@/kompendium/techniques/ea-7-1-7-deleuze-rhizome.md))
pomáhá pochopit, proč se obrana zaměřená na jednotlivé příspěvky míjí účinkem a proč je
nutné mapovat celé cesty šíření.

## Postup pro posuzovatele

Analytik, který posuzuje, zda jde o koordinovaný útok, by měl sestavit časovou osu
výskytu narativu na jednotlivých platformách, určit účty s prvním výskytem a s největším
zesílením, hledat opakované formulace a sdílené odkazy a ověřit vztahy mezi účty
(sdílené údaje, vzorce aktivity). Výstup by měl rozlišovat doloženou koordinaci od
pouhé souběžnosti; obvinění z koordinace bez dat samo poškozuje veřejnou debatu.

## Fenomenologické znaky (pohled zevnitř)

| Znak | Jak ho postižený popisuje |
|---|---|
| Obklíčení | „Kamkoli se podívám, jsem tam já – jako nepřítel.“ |
| Ztráta úniku | Odchod z jedné sítě nic neřeší. |
| Paranoidní tíseň | Každé upozornění telefonu vyvolá úlek. |
| Zahlcení institucí | Zaměstnavatel i partneři dostávají zprávy; cíl se stydí. |
| Dlouhá stopa | Strach, že kampaň bude navždy spojena s jeho jménem. |

## Detekční markery (pohled pozorovatele)

| Marker | Co může naznačovat |
|---|---|
| Tentýž narativ v krátkém okně na několika platformách | Koordinace; srov. [kaskádu deplatformingu](@/kompendium/detection-signatures/24-network-deplatforming-cascade.md) |
| Různé platformy hrají odlišnou roli (důkaz, výklad, mobilizace) | Rozdělení rolí |
| Odstraněný obsah se vrací odkazy z jiných míst | Arbitráž moderace |
| Hromadné hlášení účtu cíle na platformách | Zneužití nahlašovacích nástrojů; srov. [EA-9.3.8](@/kompendium/techniques/ea-9-3-8-mass-reporting-coordination.md) |
| Kampaň se probouzí při každém vystoupení cíle | Organizovaná kontinuita |

## Rizikové kontexty

Novináři, výzkumníci dezinformací, političtí aktivisté, vědci v polarizovaných tématech,
moderátoři komunit a veřejné osoby. Riziko roste u menšin, u lidí s velkou digitální
stopou a v jazykových prostředích, kde platformy moderují slabě.

## Odlišení

- **Organické šíření kritiky.** Skutečná kritika se může také šířit napříč platformami;
  chybí ale rozdělení rolí, synchronizace a útoky na soukromí.
- **[EA-2.3.4 Koordinace davu](@/kompendium/techniques/ea-2-3-4-mob-coordination.md).**
  Může probíhat na jedné platformě; zde je podstatou víceprostředí.
- **[EA-9.3.7](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md) a
  [EA-9.4.7](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md).** Popisují
  technické a automatizované vrstvy; tato stránka popisuje dopad na cíl a jeho delegitimizaci.

## Klinický a právní rámec

Klinicky odpovídá obraz chronickému stresu s epizodami akutní krize, hypervigilanci,
nespavosti, depresi a u dlouhých kampaní posttraumatickým příznakům. Je nutné posoudit
bezpečí a riziko sebepoškození.

Právně jsou relevantní nebezpečné pronásledování (§ 354 trestního zákoníku), pomluva
(§ 184), nebezpečné vyhrožování (§ 353), civilní ochrana osobnosti a povinnosti platforem
podle nařízení (EU) 2022/2065 o digitálních službách. U organizovaných kampaní je
klíčové doložit koordinaci. Viz [elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md),
[obrazec důkazů](@/kompendium/forensic-legal/38-pattern-evidence.md) a
[trestní spolčení](@/kompendium/forensic-legal/20-criminal-conspiracy-EA.md).

## Obrana a neutralizace

**Pro cíl.** Centralizovat dokumentaci (jedna osoba, jeden archiv); požádat o pomoc
organizace podporující cíle online obtěžování; zabezpečit účty a soukromé údaje;
komunikovat odpověď na jednom vlastním místě. Viz [zachování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md)
a [detox informačních kanálů](@/kompendium/self-defense-guides/32-feed-detoxification.md).

**Pro instituce.** Mít připravený postup pro kampaně proti zaměstnancům, informovat
předem partnery, nerozhodovat pod tlakem objemu. Viz [reakce na incident](@/kompendium/organizational-defense/31-incident-response-EA.md).

**Pro platformy.** Sdílet signály koordinace, chránit před hromadným hlášením.

## Zotavení

Zotavení je dlouhé, protože kampaň zanechává trvalou digitální stopu. Kromě terapie
pomáhá práce na vlastním veřejném obrazu (nový obsah, který stopu vyvažuje) a obnova
sociálních vazeb mimo sítě. Viz [akutní sociální znovupropojení](@/kompendium/recovery-protocols/acute-social-reconnection.md)
a [budování odolnosti](@/kompendium/recovery-protocols/longterm-resilience-cultivation.md).

## Ilustrativní příklad (anonymizovaný kompozit)

Novinářka publikuje investigativní článek o financování politické strany. Druhý den se
na fóru objeví „analýza“ jejích údajných vazeb, na videoplatformě několik videí
s výňatky z jejích starých příspěvků a na sociálních sítích hashtag s jejím jménem.
Redakce dostává stovky e-mailů, její účet je hromadně nahlášen a dočasně zablokován.
Redakce s pomocí analytiků zmapuje, že první příspěvky pocházely z několika propojených
účtů; zveřejní přehled a platformy účty odstraní. Kampaň se však vrací při každém
jejím dalším článku; redakce proto zavede postup, podle něhož novinářku při dalších
vlnách chrání a komunikaci přebírá vedení.

## Případy, které techniku ukazují

Historické: [ruská IRA](@/kompendium/historical-cases/22-russian-ira.md) a
[Pizzagate](@/kompendium/historical-cases/29-pizzagate.md), kde narativ přecházel mezi
fóry, sociálními sítěmi a videoplatformami až k ozbrojenému incidentu v prosinci 2016.
Anonymizované kompozity: [mediální mob útok](@/kompendium/case-studies/04-medialni-mob-attack.md)
a [kult platformy](@/kompendium/case-studies/73-platform-cult.md).

## Poznámka ke kódu

Tentýž anglický název nese technika [EA-9.3.7](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md)
v kategorii 9 (digitální a algoritmické techniky). Nejde o kolizi kódu, ale o dvojí
popis jednoho jevu: EA-2.3.6 z hlediska delegitimizace cíle, EA-9.3.7 z hlediska
platformní mechaniky.

## Literatura

- Marwick, A., & Lewis, R. (2017). *Media Manipulation and Disinformation Online*.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder*. Rada Evropy.
- Citron, D. K. (2014). *Hate Crimes in Cyberspace*.

## Související

**Techniky**

- [EA-9.3.7 Koordinovaný útok na platformách](@/kompendium/techniques/ea-9-3-7-platform-coordinated-attack.md)
  – technický popis.
- [EA-2.3.4 Koordinace davu](@/kompendium/techniques/ea-2-3-4-mob-coordination.md) –
  jednoplatformní podoba.
- [EA-9.4.2 Koordinované neautentické chování](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md)
  – falešné účty.
- [EA-2.3.8 Epistemický doxxing](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md) –
  přesah do soukromí.

**Pojmy**

- [Glosář: informační operace](@/glossary/info-ops.md) – státní a organizovaná podoba.
- [Glosář: deplatforming](@/glossary/deplatforming.md) – cíl hromadného hlášení.

**Pomoc**

- [Zachování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – doložení
  koordinace.
