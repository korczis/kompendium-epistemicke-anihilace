+++
title = "Historický případ: Schönův podvod"
date = 2026-04-26
description = "Bell Labs 1998–2002: fyzik Jan Hendrik Schön publikoval vymyšlené průlomy v organické elektronice. Odhalily ho shodné šumové křivky v různých článcích."
weight = 100
draft = false

[extra]
category = "Academic"
type = "historical-case"
+++

# Historický případ: Schönův podvod

> **Kategorie**: Věda, medicína a instituce · **Období**: přibližně 1998–2002 · **Místo**: Bell
> Laboratories (Lucent Technologies), Murray Hill, New Jersey, USA

Jan Hendrik Schön byl na přelomu tisíciletí považován za vycházející hvězdu fyziky pevných
látek. Během několika let publikoval desítky článků o průlomech, které měly změnit elektroniku –
a které se nikomu nepodařilo zopakovat. Jeho případ ukazuje, že ani obor s tvrdými
experimentálními standardy a nejprestižnější časopisy nejsou chráněny, pokud se celý řetězec
důvěry opírá o jednoho člověka a o pověst instituce.

## Kontext

Bell Labs měly mimořádnou reputaci (tranzistor, laser, řada Nobelových cen). Na konci 90. let
čelily tlaku mateřské firmy na komerčně využitelné výsledky. Organická elektronika
a molekulární tranzistory byly horkým tématem s velkým očekáváním. Schön (doktorát na univerzitě
v Kostnici) pracoval v týmu zkušeného fyzika Bertrama Batlogga a spolupracoval s mnoha
spoluautory.

## Co se stalo

- **1998–2001**: Schön ohlašuje řadu výsledků: supravodivost v organických krystalech
  a fullerenech řízenou elektrickým polem, organický laser, tranzistory z jednotlivých molekul.
  V roce 2001 publikuje v tempu, které kolegové popisovali jako jeden článek zhruba každý týden.
- Řada laboratoří se pokouší výsledky zopakovat a neuspěje; neúspěch se většinou připisuje
  vlastní nezkušenosti s Schönovou technikou přípravy vzorků.
- **Jaro 2002**: fyzici Lydia Sohnová a Paul McEuen si všimnou, že grafy z různých článků,
  údajně z různých měření a materiálů, obsahují totožný šum. Podobné shody nacházejí další
  vědci.
- **2002**: Bell Labs ustavují vyšetřovací komisi pod vedením Malcolma Beasleyho. Zpráva ze září
  2002 shledává vědecké pochybení u 16 z 24 prověřovaných obvinění. Schön nemá laboratorní deníky,
  surová data podle svých slov smazal pro nedostatek místa a vzorky byly zničeny nebo
  poškozeny. Je propuštěn.
- **2002–2003**: časopisy *Nature*, *Science* a *Physical Review* stahují desítky jeho článků.
- **2004**: Univerzita v Kostnici mu odebírá doktorský titul; rozhodnutí po letech soudních
  sporů obstálo.

Komise neshledala pochybení u spoluautorů, otevřela však otázku, jakou odpovědnost nese
spoluautor za data, která nikdy neviděl.

## Epistemické mechanismy

### Jediný bod ověření

Klíčová měření prováděl Schön podle svých slov sám, často v laboratoři svého původního
pracoviště v Kostnici, mimo dohled amerických kolegů. Spoluautoři dostávali hotové grafy. Stejně
jako u [Stapela](@/kompendium/historical-cases/34-stapel-fraud.md) šlo o monopol na kontakt
s realitou, kterou ostatní přijímali zprostředkovaně – typický znak
[asymetrického odhalování](@/kompendium/detection-signatures/15-behavioral-asymmetric-disclosure.md).

### Přenos prestiže

Jméno Bell Labs, zkušený spoluautor a opakované publikace v *Nature* a *Science* vytvářely
spirálu, v níž každá další publikace zvyšovala důvěryhodnost té předchozí. Prestiž instituce
fungovala jako náhrada ověření, podobně jako popisuje [Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md)
v síťovém kontextu.

### Selhání replikace jako selhání replikátora

Neúspěšné pokusy o zopakování se nepublikovaly a laboratoře je přičítaly vlastní nedokonalosti.
Toto vychýlení – „chyba je u mě, ne u autority“ – je na individuální úrovni rozpoznatelné jako
[pěstovaná sebepochybnost](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md); zde
vznikalo samovolně z hierarchie prestiže, nikoli cíleným působením.

### Recenzní řízení a tempo

Recenzenti hodnotí rukopis, nikoli surová data, a nepřipouštějí, že autor lže. Rychlost
publikací a soutěž časopisů o senzační výsledky zkracovaly prostor pro pochybnosti.

## Dopady na jednotlivce a společnost

Doktorandi a postdoktorandi v jiných laboratořích věnovali roky marným pokusům o zopakování
a někteří kvůli tomu ztratili kariérní příležitosti. Spoluautoři nesli reputační škodu. Obor
organické elektroniky utrpěl ztrátou důvěry a přesměrováním prostředků. Na úrovni veřejnosti
případ ukázal, že „publikováno v *Nature*“ není samo o sobě zárukou pravdivosti.

## Odhalení, dokumentace a vyrovnání

K odhalení nevedlo recenzní řízení, ale pozorné čtení publikovaných grafů nezávislými vědci
a jejich ochota veřejně se ozvat. Instituce pak reagovala rychle a transparentně. Následovaly
diskuse o povinné archivaci surových dat, o odpovědnosti spoluautorů a o roli časopisů při
požadování podkladů.

## Poučení pro detekci a obranu dnes

1. **Data musí být dohledatelná** – laboratorní deník, surová data a vzorky jsou součástí
   výsledku, ne soukromým majetkem autora.
2. **Spoluautorství znamená odpovědnost** – kdo podepisuje článek, má vidět data a rozumět, jak
   vznikla. Viz [publikační etika](@/kompendium/research-methodology/publication-ethics-EA.md).
3. **Neúspěšné replikace publikovat** – jsou informací, ne ostudou. Viz
   [replikační výzkum](@/kompendium/research-methodology/replication-EA-research.md).
4. **Pozor na „příliš čistá“ data** – opakované průběhy, chybějící šum, dokonalá shoda s teorií.
5. **Oddělit prestiž od posouzení** – hodnotit tvrzení stejně přísně bez ohledu na jméno
   instituce. Pro organizace viz [dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md).

## Hranice výkladu

Schönovy motivy (kariérní tlak, sebeklam, očekávání okolí) lze jen odhadovat. Případ nedokládá
nespolehlivost fyziky jako celku; naopak ukazuje, že experimentální obor se dokázal relativně
rychle opravit, jakmile se nesrovnalosti staly veřejnými. Analogie s manipulací v Kompendiu je
strukturální: jde o to, jak systém důvěry přijímá neověřenou realitu.

## Literatura

- Vyšetřovací komise Bell Labs pod vedením M. R. Beasleyho (2002) – zpráva o Schönově práci
  a spoluautorech, zveřejněná v září 2002.
- Reich, E. S. (2009). *Plastic Fantastic: How the Biggest Fraud in Physics Shook the Scientific
  World*.
- Ritchie, S. (2020). *Science Fictions*.

## Související

**Sousední případy**

- [Stapelův podvod](@/kompendium/historical-cases/34-stapel-fraud.md) – stejný vzorec monopolu
  na data v psychologii.
- [Studená fúze](@/kompendium/historical-cases/36-cold-fusion.md) – nereplikovatelný průlom
  ve fyzice, ale bez podvodu.
- [Replikační krize](@/kompendium/historical-cases/33-replication-crisis.md) – systémové
  selhání ověřování.

**Techniky a pojmy**

- [EA-2.5.3 Self-doubt Cultivation](@/kompendium/techniques/ea-2-5-3-self-doubt-cultivation.md)
  – replikátor pochybuje o sobě místo o autoritě.
- [Falsifikace](@/glossary/falsifikace.md) – role neúspěšného pokusu o zopakování.
- [Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md)
  – prestiž jako náhrada důkazu.

**Klinika, právo a obrana**

- [Publikační etika](@/kompendium/research-methodology/publication-ethics-EA.md) – odpovědnost
  autorů a časopisů.
- [Podvod jako prvek EA](@/kompendium/forensic-legal/17-fraud-EA-element.md) – právní rovina.
- [Mechanismus pro oznamovatele](@/kompendium/organizational-defense/4-whistleblower-mechanism.md)
  – ochrana těch, kdo upozorní.

## Connect

Doplňující prameny, opravy, vlastní výzkum: [GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [GitHub](https://github.com/korczis)
