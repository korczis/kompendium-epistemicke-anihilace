+++
title = "Regulace platforem v kontextu EA"
description = "Regulační modely a nástroje pro sociální sítě a digitální zprostředkovatele – od odstraňování obsahu po povinnost péče a design – a jejich přínosy i rizika pro prevenci EA."
weight = 250

[taxonomies]
tags = ["kompendium", "population-health", "policy"]
categories = ["academic", "public-health"]

[extra]
related_terms = ["23-EU-policy-EA", "24-WHO-EA-framework", "26-educational-policy-EA", "27-mental-health-policy-EA"]
toc = true
+++

# Regulace platforem v kontextu EA

> Platforma není jen místo, kde se epistemické útoky odehrávají. Její design – co zesiluje,
> co doporučuje, co umožňuje skrýt – určuje, jak snadno se šíří. Veřejné zdraví zná tuto
> situaci z regulace tabáku, potravin a dopravy: chování se mění nejúčinněji změnou prostředí.

## Vymezení

**Regulace platforem** jsou závazná pravidla pro poskytovatele online služeb, které
zprostředkovávají obsah a komunikaci: sociální sítě, videoplatformy, vyhledávače, tržiště,
komunikační aplikace. Z pohledu EA jsou relevantní tři vlastnosti platforem:

1. **zesilování** – [algoritmická amplifikace](@/kompendium/techniques/ea-9-3-1-algorithmic-amplification.md)
   a [optimalizace na zapojení](@/kompendium/techniques/ea-9-3-2-engagement-optimization-EA.md)
   zvýhodňují obsah, který vyvolává silné emoce;
2. **neautenticita** – [sítě falešných účtů](@/kompendium/techniques/ea-9-4-3-sock-puppet-network.md),
   [koordinované kampaně botů](@/kompendium/techniques/ea-9-4-1-bot-amplification-coordinated.md)
   a [trollí farmy](@/kompendium/techniques/ea-9-4-5-troll-farm-EA.md);
3. **uzavírání** – skupiny, kanály a servery, kde lze budovat
   [epistemické bubliny](@/glossary/epistemic-bubble.md) a uzavřené komunity
   ([platformní kult](@/kompendium/case-studies/73-platform-cult.md)).

## Problém z hlediska veřejné politiky

Uživatel nemá vliv na design systému, který formuje jeho informační prostředí, a často
o něm ani neví. Platformy mají ekonomickou motivaci maximalizovat čas a zapojení uživatelů
(kritiku tohoto modelu rozvíjí Shoshana Zuboffová, *The Age of Surveillance Capitalism*,
2019 – viz [Zuboff](@/kompendium/07-teoreticke-reflexe/zuboff-surveillance-capitalism.md)).
Zároveň mají obrovskou moc nad tím, co je ve veřejném prostoru vidět – moc, kterou mohou
použít i nespravedlivě.

## Regulační modely

| Model | Princip | Příklady | Slabiny |
|---|---|---|---|
| Imunita zprostředkovatele | Platforma neodpovídá za obsah uživatelů | USA: oddíl 230 zákona Communications Decency Act (1996) | Malá motivace řešit systémová rizika |
| Oznámení a odstranění | Odpovědnost po upozornění na protiprávní obsah | Původní evropský rámec e-commerce, německý NetzDG (2017) | Řeší jednotlivé příspěvky, ne design; riziko nadměrného mazání |
| Systémová rizika a povinnost péče | Platforma posuzuje a zmírňuje rizika svých služeb | EU: DSA; Spojené království: Online Safety Act (2023) | Náročné vymáhání, nejasné hranice rizik |
| Kodexy designu | Požadavky na výchozí nastavení a rozhraní | Britský kodex pro služby přístupné dětem; zákaz temných vzorců v DSA | Pokrývá jen část služeb |
| Regulátor online bezpečnosti | Nezávislý úřad se stížnostním mechanismem | Austrálie: eSafety Commissioner | Kapacita vůči globálním firmám |

Podrobně k evropským nástrojům viz [EU politika](@/kompendium/population-health/23-EU-policy-EA.md).

## Nástroje se vztahem k EA

- **Posouzení rizik a nezávislé audity** – včetně dopadů na duševní zdraví a zranitelné
  skupiny.
- **Transparentnost doporučovacích systémů** a možnost volby feedu bez profilování.
- **Tření (friction)** – omezení hromadného přeposílání, výzva k přečtení článku před sdílením,
  zpomalení virálního šíření v krizích.
- **Odhalování a odstraňování koordinovaného neautentického chování** se zveřejněním zpráv
  ([detekce botů](@/kompendium/cross-domain/6-ea-osint-bot-detection.md)).
- **Označování syntetického obsahu** a původu médií.
- **Přístup výzkumníků k datům** – předpoklad jakéhokoli populačního hodnocení.
- **Ochrana terčů obtěžování** – nástroje proti hromadnému útoku, rychlá reakce, kontakt
  s člověkem, ne jen s automatem.
- **Prostředky nápravy** – odůvodnění rozhodnutí o moderaci, odvolání, mimosoudní řešení sporů.

## Rizika a pojistky

- **Nadměrné odstraňování** a mrazivý účinek na legitimní projev, včetně projevu menšin
  a kritiků moci.
- **Zaujatost moderace** – automatizované systémy chybují nerovnoměrně
  ([content moderation bias](@/kompendium/techniques/ea-9-3-6-content-moderation-bias.md),
  [automated content takedown](@/kompendium/techniques/ea-9-6-3-automated-content-takedown.md)).
- **Zneužití nahlašovacích nástrojů** – [koordinované hromadné nahlašování](@/kompendium/techniques/ea-9-3-8-mass-reporting-coordination.md)
  jako nástroj útoku; regulace musí počítat s tím, že ochranné mechanismy lze obrátit.
- **Státní tlak na platformy** – „neformální“ požadavky na odstranění obsahu bez právního
  základu a přezkumu.
- **Přesun do uzavřených prostor** – tvrdá moderace veřejných ploch může přesunout komunity
  do šifrovaných skupin, kde je izolace ještě větší
  ([deplatformingová kaskáda](@/kompendium/detection-signatures/24-network-deplatforming-cascade.md),
  [deplatforming](@/glossary/deplatforming.md)).

## Evaluace

Transparentní zprávy platforem samy nestačí – vykazují aktivity (počty odstraněných
příspěvků), ne výsledky. Smysluplné hodnocení vyžaduje: nezávislé audity s přístupem
k systémům; data pro výzkum expozice; experimentální srovnání změn designu (například vliv
omezení přeposílání na šíření); sledování nežádoucích účinků na projev. Z hlediska veřejného
zdraví je cílovým ukazatelem změna **expozice populace** manipulativním vzorcům, ne počet
zásahů.

## Modelová situace

Před volbami regulátor požaduje po velké platformě zprávu o rizicích pro volební proces.
Platforma vykazuje statisíce odstraněných příspěvků. Nezávislý audit však zjistí, že
doporučovací systém nadále výrazně zesiluje obsah s koordinovaným původem a že nástroj pro
nahlašování byl použit k hromadnému útoku na novinářku. Regulátor požaduje úpravu
doporučování, ochranu proti zneužití nahlašování a zpřístupnění dat výzkumníkům pro
hodnocení účinku.

## Kontrolní otázky pro praxi

- Hodnotí regulace změnu expozice uživatelů, nebo jen počet zásahů?
- Mají uživatelé zdůvodnění rozhodnutí o moderaci a možnost odvolání?
- Jak je zabráněno zneužití nahlašovacích nástrojů?
- Nevede tvrdá moderace k přesunu komunit do uzavřených prostor?
- Mají nezávislí auditoři a výzkumníci přístup k systémům a datům?

## Limitace a otevřené otázky

- Globální platformy a národní či regionální regulace mají nerovnou sílu.
- Šifrované komunikační služby chrání soukromí, ale i uzavřené skupiny; jejich regulace
  naráží na základní práva.
- Otevřená otázka: lze měnit design platforem tak, aby méně zesiloval manipulaci, aniž by
  stát rozhodoval o obsahu?

## Související

**Sesterské stránky**

- [EU politika k epistemickým útokům](@/kompendium/population-health/23-EU-policy-EA.md) – evropský právní rámec.
- [Prevalence online radikalizace](@/kompendium/population-health/08-online-radicalization-prevalence.md) – co platformy ovlivňují.
- [Programy digitálního občanství](@/kompendium/population-health/16-digital-citizenship-program.md) – strana uživatelů.

**Detekce**

- [Asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md) – síťová signatura.
- [EA × OSINT: sociální sítě](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md) – investigativní pohled.

**Případy**

- [Internet Research Agency](@/kompendium/historical-cases/22-russian-ira.md) – státní kampaň na platformách.
- [Cambridge Analytica](@/kompendium/historical-cases/23-cambridge-analytica.md) – zneužití dat k cílení.

**Teorie**

- [Boyd: sociotechnický pohled](@/kompendium/07-teoreticke-reflexe/boyd-disinformation-age.md) – technologie a společnost dohromady.
