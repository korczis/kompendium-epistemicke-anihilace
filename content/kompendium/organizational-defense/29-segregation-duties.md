+++
title = "Oddělení povinností"
description = "Kde jedna osoba zahajuje, schvaluje i kontroluje, nemá kdo chybu nebo manipulaci zachytit. Kapitola popisuje oddělení rolí ve financích, personalistice, datech a ve zjišťování faktů."
weight = 290

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["28-access-control-EA", "30-rotation-of-roles", "25-vendor-management-EA", "32-internal-investigation"]
toc = true
+++

# Oddělení povinností

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Oddělení povinností (segregation of duties) je starý kontrolní princip: kdo operaci zahajuje,
ji neschvaluje, a kdo ji schvaluje, ji nekontroluje. Pokud jedna osoba může vystavit fakturu,
schválit ji a zaúčtovat, nemá kdo chybu ani podvod zachytit. Kompendium tento princip
rozšiřuje i na zjišťování faktů: kdo sbírá data, by neměl být jediným, kdo je vyhodnocuje a
interpretuje; kdo je předmětem stížnosti, nemá ji vyšetřovat. Oddělení povinností je
strukturální překážka, která nevyžaduje, aby kdokoli někoho podezíral.

## Riziko v daném prostředí

Ve veřejné správě rozděluje role při schvalování výdajů zákon č. 320/2001 Sb., o finanční
kontrole ve veřejné správě, a jeho prováděcí předpisy; slabinou bývá formální plnění, kdy
podepisují lidé závislí na jedné osobě. Ve firmě jde o nákup, platby a personální odměny.
Ve výzkumu o oddělení sběru dat od analýzy a o nezávislé ověření výsledků. V médiích o
oddělení autora, ověřovatele faktů a editora. V nemocnici o to, že nežádoucí událost
nehodnotí jen ten, kdo ji způsobil, a že objednávku léčiv nepotvrzuje ten, kdo je vydává. Ve
škole o hodnocení, které by v závažných věcech (opravné zkoušky, komisionální přezkoušení)
nemělo záviset na jediném učiteli. V neziskové organizaci, kde všechno dělá jeden člověk,
je riziko největší.

## Strukturální zranitelnosti

- Jedna osoba může operaci zahájit, schválit i zaúčtovat bez technické zábrany.
- Formální oddělení: podpisy dávají lidé, kteří podepíší cokoli, co jim předloží nadřízený.
- Správce systému může měnit data i záznamy o změnách.
- V malém týmu nejsou lidé, mezi které by šlo role rozdělit.
- Výjimky z oddělení se schvalují snadno a nikdo je neeviduje.

## Ochranné struktury

- Matice neslučitelných rolí: které činnosti nesmí vykonávat jedna osoba (zahájení,
  schválení, provedení, zaúčtování, kontrola).
- Technické vynucení v systémech (workflow s rolemi), ne jen v předpisu.
- Pravidlo čtyř očí nad stanovený limit a u citlivých operací (změny bankovních údajů
  dodavatelů, mimořádné odměny, výjimky z politik).
- Nezfalšovatelný záznam o operacích, spravovaný mimo dosah těch, kdo operace provádějí –
  viz [řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md).
- Oddělení v epistemických funkcích: autor ≠ ověřovatel, sběr dat ≠ analýza, předmět
  stížnosti ≠ vyšetřovatel ([interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md)).
- V malých organizacích kompenzační kontroly: externí účetní, kontrola výpisů předsedou,
  revizní komise.

## Role a odpovědnosti

Vedení schvaluje matici neslučitelných rolí. Finanční útvar a personalistika ji uplatňují v
procesech. IT ji vynucuje v systémech. Interní audit testuje, zda oddělení funguje a zda
výjimky nejsou pravidlem. Každý schvalovatel odpovídá za to, že schvaluje skutečně, a ne jen
podpisem.

## Politiky a postupy

1. Matice neslučitelných rolí pro finance, personalistiku, nákup, data a vyšetřování.
2. Postup pro výjimky: odůvodnění, schválení, časové omezení, evidence.
3. Pravidelná kontrola konfliktů oprávnění v systémech.
4. Kompenzační kontroly pro malé týmy.
5. Navázání na [rotaci rolí](@/kompendium/organizational-defense/30-rotation-of-roles.md) a
   na [řízení dodavatelů](@/kompendium/organizational-defense/25-vendor-management-EA.md).

## Vzdělávání a trénink

Schvalovatelé se učí, co znamená podpis: potvrzení, že věc ověřili, ne že ji viděli.
Vedoucí se učí, že oddělení povinností není nedůvěra k lidem, ale ochrana i pro ně – kdo
pracuje v systému s oddělenými rolemi, je chráněn před podezřením. Výzkumníci a novináři se
učí hodnotu nezávislého ověření ([triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md))
i ve vlastní práci.

## Řešení incidentu

Při zjištění, že oddělení selhalo (jedna osoba provedla celý cyklus operace):

1. Zajistit záznamy o operacích a oprávněních.
2. Přezkoumat všechny operace, které tato osoba provedla bez oddělení.
3. Zjistit, zda šlo o chybu systému, o schválenou výjimku, nebo o obejití.
4. Při podezření na podvod postupovat podle [interního vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md)
   a zvážit oznámení orgánům činným v trestním řízení.
5. Opravit matici a technické nastavení.

**Příklad (anonymizovaný kompozit).** V neziskové organizaci vedla účetnictví, platby i
přípravu zpráv pro dárce jedna dlouholetá pracovnice, které všichni důvěřovali. Zpráva pro
dárce popisovala úspěšné projekty, které neexistovaly v plném rozsahu. Teprve nový předseda
revizní komise začal porovnávat bankovní výpisy se zprávami. Organizace poté zavedla
externí účetní a schvalování plateb dvěma osobami.

## Ochrana dotčené osoby

Pracovník, který odmítne podepsat operaci, kterou nemohl ověřit, nebo upozorní na
obcházení oddělení, se vystavuje tlaku nadřízeného. Organizace musí výslovně chránit právo
odmítnout podpis. Oznámení protiprávního jednání chrání zákon č. 171/2023 Sb. Zároveň je
třeba chránit pracovníky, kteří byli nuceni podepisovat bez ověření – i oni jsou často
oběťmi, nikoli spoluviníky.

## Vyhodnocení a indikátory selhání

- Jedna osoba může vystavit fakturu, schválit ji a zaúčtovat bez technické zábrany.
- Výjimek je mnoho a jsou dlouhodobé.
- Schvalovatelé neumí říct, co schvalovali.
- Správci systémů mohou měnit záznamy o vlastních změnách.

## Meze a otevřené otázky

Oddělení povinností nechrání před dohodou několika lidí (koluzí) ani před tlakem nadřízeného
na všechny role současně. V malých organizacích je plné oddělení nemožné a kompenzační
kontroly jsou nutné. Otevřené zůstává, jak uplatnit princip v tvůrčích a výzkumných
činnostech, aniž by se z nich stala byrokracie.

## Související

**Sesterské kapitoly**

- [Řízení přístupů s EA fokusem](@/kompendium/organizational-defense/28-access-control-EA.md)
  – technické vynucení rolí.
- [Rotace rolí](@/kompendium/organizational-defense/30-rotation-of-roles.md) – doplňková
  kontrola v čase.
- [Řízení dodavatelů s EA fokusem](@/kompendium/organizational-defense/25-vendor-management-EA.md)
  – oddělení zadání, výběru a převzetí.
- [Interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md) –
  oddělení vyšetřovatele od předmětu šetření.

**Analýza a právo**

- [EA × Compliance: AML – Pattern Recognition](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md)
  – vzorce ve finančních tocích.
- [Podvod jako element EA](@/kompendium/forensic-legal/17-fraud-EA-element.md) – kdy jde o
  trestný čin.

**Sebe-obrana a pojmy**

- [Sebe-obrana: Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)
  – nezávislé ověření jako princip.
- [Epistemická monokultura](@/glossary/epistemicka-monokultura.md) – riziko jediného zdroje.
