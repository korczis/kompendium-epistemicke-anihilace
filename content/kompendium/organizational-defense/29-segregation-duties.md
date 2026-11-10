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
schválit ji a zaúčtovat, nemá kdo chybu ani podvod zachytit. Rámec vnitřní kontroly, který
vydala organizace COSO (2013), řadí oddělení povinností mezi základní kontrolní činnosti, a
model, který navrhli Clark a Wilson (1987), z něj udělal jeden ze dvou pilířů integrity obchodních
informačních systémů vedle dobře formovaných transakcí. Kompendium tento princip rozšiřuje i na
zjišťování faktů: kdo sbírá data, by neměl být jediným, kdo je vyhodnocuje a interpretuje; kdo
je předmětem stížnosti, nemá ji vyšetřovat. Toto rozšíření je interpretací knihy. Oddělení
povinností je strukturální překážka, která nevyžaduje, aby kdokoli někoho podezíral.

## Vymezení a původ principu

Myšlenka oddělení povinností vychází z účetní a auditní praxe a ze studia podvodů. Cressey
(1953) na rozhovorech s odsouzenými za zpronevěru ukázal, že k činu vede souběh finančního
tlaku, příležitosti a sebeospravedlnění; z jeho práce se později odvodil takzvaný trojúhelník
podvodu. Organizace nemůže přímo ovlivnit tlak ani racionalizaci jednotlivce, může však
zmenšit příležitost, a právě to oddělení povinností dělá. Clark a Wilson (1987) tutéž úvahu
přenesli do návrhu informačních systémů: integrita dat nevzniká důvěrou v jednotlivce, ale
tím, že žádná osoba nemůže sama provést celou citlivou transakci.

V současných rámcích je oddělení povinností součástí širší architektury kontroly. COSO (2013)
popisuje pět složek vnitřní kontroly – kontrolní prostředí, hodnocení rizik, kontrolní
činnosti, informace a komunikaci a monitorování – a oddělení povinností patří mezi kontrolní
činnosti. Model tří linií, jak ho formuloval IIA (2020), odděluje řízení rizik v provozu,
stanovení pravidel a dohled a nezávislé ujištění interního auditu. Katalog NIST (2020) pak
oddělení povinností vymezuje jako samostatné opatření informačních systémů, které má zabránit,
aby jedna osoba měla oprávnění k neslučitelným krokům.

## Riziko v daném prostředí

Ve veřejné správě rozděluje role při schvalování výdajů zákon č. 320/2001 Sb., o finanční
kontrole ve veřejné správě, a jeho prováděcí předpisy; slabinou bývá formální plnění, kdy
podepisují lidé závislí na jedné osobě. Ve firmě jde o nákup, platby a personální odměny a
účetní záznamy, jejichž průkaznost vyžaduje zákon č. 563/1991 Sb., o účetnictví. Ve výzkumu
jde o oddělení sběru dat od analýzy a o nezávislé ověření výsledků; předregistrace analýzy,
jak ji popisují Nosek a kol. (2018), odděluje rozhodnutí o metodě od znalosti výsledků, a
chrání tak před nevědomým přizpůsobením analýzy žádoucímu závěru.

V médiích jde o oddělení autora, ověřovatele faktů a editora, protože Kovach a Rosenstiel
(2001) považují disciplínu ověřování za podstatu novinářské práce. V nemocnici jde o to, že
nežádoucí událost nehodnotí jen ten, kdo ji způsobil, a že objednávku léčiv nepotvrzuje ten, kdo
je vydává; Reason (2000) ukazuje, že bezpečí v takových systémech stojí na několika na sobě
nezávislých vrstvách ochrany. Ve škole jde o hodnocení, které by v závažných věcech, například
při komisionálním přezkoušení, nemělo záviset na jediném učiteli. V neziskové organizaci, kde
všechno dělá jeden člověk, je riziko největší; zprávy ACFE (2024) opakovaně ukazují, že malé
organizace mívají méně zavedených protipodvodných kontrol než velké.

## Strukturální zranitelnosti a detekční znaky

Nejzřetelnějším znakem je, že jedna osoba může operaci zahájit, schválit i zaúčtovat bez
technické zábrany, nebo že správce systému může měnit data i záznamy o změnách (NIST, 2020).
Méně zřetelné je oddělení formální: podpisy sice dávají různí lidé, ale všichni podepíší cokoli,
co jim předloží nadřízený. Power (1997) tento jev popisuje obecněji jako „rituál ověřování“, kdy
kontrola vytváří doklad o kontrole, a ne kontrolu samotnou. Zprávy ACFE (2024) o pracovních
podvodech mezi hlavní slabiny, které podvod umožnily, opakovaně řadí chybějící vnitřní kontroly
a jejich obcházení nadřízenými.

Zranitelností jsou i malé týmy, v nichž nejsou lidé, mezi které by šlo role rozdělit, a
výjimky z oddělení, které se schvalují snadno a nikdo je neeviduje (COSO, 2013). Epistemický
protějšek těchto znaků je jediný zdroj pravdy: jediný člověk, který sbírá, zpracovává a
interpretuje informace pro vedení, nebo jediný vyšetřovatel, který je zároveň blízký
vyšetřovanému. Kniha tento stav spojuje s
[epistemickou monokulturou](@/glossary/epistemicka-monokultura.md) a s
[konfirmačním biasem](@/glossary/konfirmacni-bias.md), který se v takovém uspořádání nemá o co
zarazit (Nickerson, 1998).

## Ochranné struktury

Základem je matice neslučitelných rolí, která určuje, jaké činnosti nesmí vykonávat jedna
osoba: zahájení, schválení, provedení, zaúčtování a kontrolu (COSO, 2013). Matice musí být
technicky vynucena v systémech, nejen popsána v předpisu, a doplněna pravidlem čtyř očí nad
stanovený limit a u citlivých operací, jako jsou změny bankovních údajů dodavatelů, mimořádné
odměny nebo výjimky z politik (NIST, 2020). Nezfalšovatelný záznam o operacích má spravovat
někdo mimo dosah těch, kdo operace provádějí – viz
[řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md).

Oddělení v epistemických funkcích znamená, že autor není zároveň ověřovatelem, sběr dat není
v rukou toho, kdo je jediný analyzuje, a předmět stížnosti nevede šetření
([interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md)).
Kassin a kol. (2013) shrnuli doklady, že forenzní posouzení ovlivňuje kontextová informace a
očekávání posuzovatele; nezávislé ověření proto není byrokratickým přepychem. V malých organizacích nastupují kompenzační kontroly: externí účetní, kontrola
bankovních výpisů předsedou, revizní komise a pravidelný nezávislý audit; jde o praktické doporučení knihy.

## Role, odpovědnosti a právní rámec

Vedení schvaluje matici neslučitelných rolí, finanční útvar a personalistika ji uplatňují v
procesech, IT ji vynucuje v systémech a interní audit testuje, zda oddělení funguje a zda
výjimky nejsou pravidlem (IIA, 2020). Každý schvalovatel odpovídá za to, že schvaluje
skutečně, a ne jen podpisem. Ve veřejné správě je rozdělení rolí příkazce operace, správce
rozpočtu a hlavního účetního přímo součástí řídicí kontroly podle zákona č. 320/2001 Sb. a
vyhlášky č. 416/2004 Sb., kterou se tento zákon provádí.

Vazbu na trestní právo je třeba posuzovat opatrně. Selhání oddělení povinností samo o sobě
trestným činem není; jestliže však umožní zpronevěru nebo podvod, může jít o jednání postižitelné
podle zákona č. 40/2009 Sb., trestního zákoníku, a u právnických osob se uplatní zákon
č. 418/2011 Sb., o trestní odpovědnosti právnických osob, podle něhož má význam i to, zda
organizace vynaložila úsilí, které po ní lze spravedlivě požadovat, aby protiprávnímu jednání
zabránila. Kdy jde o trestný čin, rozebírá kapitola
[Podvod jako element EA](@/kompendium/forensic-legal/17-fraud-EA-element.md).

## Vzdělávání a trénink

Schvalovatelé se učí, co znamená podpis: potvrzení, že věc ověřili, ne že ji viděli (Power,
1997). Vedoucí se učí, že oddělení povinností není nedůvěra k lidem, ale ochrana i pro ně: kdo
pracuje v systému s oddělenými rolemi, je chráněn před podezřením, protože jeho práci lze
nezávisle doložit (COSO, 2013). Výzkumníci a novináři se učí hodnotu nezávislého ověření
([triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)) i ve vlastní
práci, včetně předem stanoveného postupu analýzy (Nosek a kol., 2018).

## Řešení incidentu

Při zjištění, že oddělení selhalo a jedna osoba provedla celý cyklus operace, je třeba nejprve
zajistit záznamy o operacích a oprávněních a poté přezkoumat všechny operace, které tato osoba
provedla bez oddělení. Následuje zjištění, zda šlo o chybu systému, o schválenou výjimku, nebo o
obejití, a oprava matice a technického nastavení (COSO, 2013). Při podezření na podvod se
postupuje podle
[interního vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md) a
zvažuje se oznámení orgánům činným v trestním řízení podle zákona č. 40/2009 Sb.

### Anonymizovaný příklad

V neziskové organizaci vedla účetnictví, platby i přípravu zpráv pro dárce jedna dlouholetá
pracovnice, které všichni důvěřovali. Zpráva pro dárce popisovala úspěšné projekty, které
neexistovaly v plném rozsahu. Teprve nový předseda revizní komise začal porovnávat bankovní
výpisy se zprávami. Organizace poté zavedla externí účetní a schvalování plateb dvěma osobami.
Kompozit odpovídá vzorci, který Cressey (1953) popsal u lidí v pozici důvěry: příležitost
vzniká tam, kde důvěra nahradila kontrolu.

## Ochrana dotčené osoby

Pracovník, který odmítne podepsat operaci, kterou nemohl ověřit, nebo upozorní na obcházení
oddělení, se vystavuje tlaku nadřízeného. Organizace musí výslovně chránit právo odmítnout
podpis. Oznámení protiprávního jednání chrání zákon č. 171/2023 Sb., o ochraně oznamovatelů.
Zároveň je třeba chránit pracovníky, kteří byli nuceni podepisovat bez ověření – i oni jsou
často oběťmi, nikoli spoluviníky, a tlak nadřízeného na všechny role současně je přesně ten
případ, který zprávy ACFE (2024) popisují jako obcházení kontrol vedením.

## Vyhodnocení a indikátory selhání

O selhání svědčí situace, kdy jedna osoba může vystavit fakturu, schválit ji a zaúčtovat bez
technické zábrany, výjimek je mnoho a jsou dlouhodobé, schvalovatelé neumějí říct, co
schvalovali, a správci systémů mohou měnit záznamy o vlastních změnách (NIST, 2020).
Užitečnými ukazateli jsou počet konfliktů oprávnění zjištěných při pravidelné kontrole, počet a
stáří výjimek a podíl citlivých operací schválených dvěma nezávislými osobami; i zde však platí,
že ukazatel měří doklad o kontrole, ne nutně kontrolu (Power, 1997).

## Meze, kritika a otevřené otázky

Oddělení povinností nechrání před dohodou několika lidí (koluzí) ani před tlakem nadřízeného
na všechny role současně; rámec COSO (2013) mezi vnitřní meze kontroly výslovně řadí právě
koluzi a obejití kontrol vedením. V malých organizacích je plné oddělení nemožné a kompenzační
kontroly jsou nutné. Power (1997) navíc upozorňuje, že rozrůstání kontrol může vytlačit
odbornou úvahu a důvěru, na nichž práce stojí. Otevřené zůstává, jak uplatnit princip v
tvůrčích a výzkumných činnostech, aniž by se z nich stala byrokracie.

## Literatura

- ACFE (2024). *Occupational Fraud 2024: A Report to the Nations*. Association of Certified Fraud
  Examiners.
- Clark, D. D., & Wilson, D. R. (1987). A comparison of commercial and military computer security
  policies. *Proceedings of the IEEE Symposium on Security and Privacy*.
- COSO (2013). *Internal Control – Integrated Framework*. Committee of Sponsoring Organizations of
  the Treadway Commission.
- Cressey, D. R. (1953). *Other People's Money: A Study in the Social Psychology of Embezzlement*.
  Free Press.
- IIA (2020). *The IIA's Three Lines Model: An Update of the Three Lines of Defense*. The
  Institute of Internal Auditors.
- Kassin, S. M., Dror, I. E., & Kukucka, J. (2013). The forensic confirmation bias: Problems,
  perspectives, and proposed solutions. *Journal of Applied Research in Memory and Cognition*,
  2(1).
- Kovach, B., & Rosenstiel, T. (2001). *The Elements of Journalism*. Crown.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of
  General Psychology*, 2(2).
- NIST (2020). *Security and Privacy Controls for Information Systems and Organizations* (SP
  800-53 Rev. 5). National Institute of Standards and Technology.
- Nosek, B. A., Ebersole, C. R., DeHaven, A. C., & Mellor, D. T. (2018). The preregistration
  revolution. *Proceedings of the National Academy of Sciences*, 115(11).
- Power, M. (1997). *The Audit Society: Rituals of Verification*. Oxford University Press.
- Reason, J. (2000). Human error: Models and management. *BMJ*, 320(7237).

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
- [Prevence konfirmačního biasu](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md)
  – nezávislé posouzení v prověrkách.

**Sebe-obrana a pojmy**

- [Sebe-obrana: Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md)
  – nezávislé ověření jako princip.
- [Epistemická monokultura](@/glossary/epistemicka-monokultura.md) – riziko jediného zdroje.
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – proč jediný posuzovatel nestačí.
