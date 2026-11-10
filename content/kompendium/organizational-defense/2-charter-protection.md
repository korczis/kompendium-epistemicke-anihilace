+++
title = "Ochrana zakládací listiny"
description = "Jak chránit stanovy, statut či zřizovací listinu před tichými změnami, které mění smysl organizace: verzování, dvoukolové schvalování, kontrola znění."
weight = 20

[taxonomies]
tags = ["kompendium", "organizational-defense", "governance"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["8-policy-review-cycles", "9-shareholder-protection", "21-decision-traceability", "24-documentation-standards"]
toc = true
+++

# Ochrana zakládací listiny

> **Pilíř:** Správa a řízení · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Stanovy, zakladatelská listina, statut, zřizovací listina nebo nadační listina určují, k čemu
organizace existuje, kdo v ní o čem rozhoduje a kdo komu skládá účty. Jsou to texty, na
které se v běžném provozu nikdo nedívá – a právě proto je jejich tichá úprava jednou z
nejméně viditelných podob epistemického útoku na úrovni instituce. Kdo změní definici účelu,
kvóra nebo pravomocí, změní i to, co bude organizace později považovat za „normální“.

## Riziko v daném prostředí

Vzorec [skrytého přepisování pravidel](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md)
se v zakládacích dokumentech projevuje malými zásahy s velkým dopadem: přesun pravomoci z
kolektivního orgánu na jednotlivce, prodloužení mandátu, zúžení okruhu, kdo smí svolat
mimořádné jednání, vypuštění povinnosti zveřejňovat zprávy. Ve spolku nebo neziskové
organizaci k tomu dochází často „při aktualizaci stanov“, kterou připraví jeden člověk a
členská schůze ji schválí bez čtení. Ve firmě se mění zakladatelské právní jednání při
transakci, kdy pozornost směřuje jinam. Na veřejné vysoké škole se podobný posun může skrýt
ve změně vnitřního předpisu, v nemocnici či škole v organizačním řádu, ve veřejné instituci
ve zřizovací listině. Výsledkem je, že lidé dál jednají podle představy o organizaci, která
už formálně neplatí.

## Strukturální zranitelnosti

- **Nečitelnost změn.** Nové znění se předkládá vcelku, bez srovnání se starým; drobné
  úpravy pojmů ([sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md))
  nejsou vidět.
- **Monopol na přípravu.** Návrh připravuje jediná osoba nebo kancelář, která má zájem na
  výsledku.
- **Časový tlak.** Schválení „dnes, kvůli termínu u rejstříku“ – vzorec
  [vytváření časového tlaku](@/kompendium/detection-signatures/14-behavioral-time-pressure-creation.md).
- **Rozptýlené verze.** Neexistuje jediné úplné aktuální znění; každý pracuje s jinou
  verzí.
- **Odkazy na vnitřní předpisy.** Stanovy delegují podstatné věci na předpis, který mění
  menší okruh lidí.

## Ochranné struktury

- Úplné znění vedené ve verzovaném úložišti s historií všech změn a s povinným
  srovnáním (redline) při každé navržené změně, i typografické.
- Dvoukolové schvalování podstatných změn: první čtení s lhůtou na připomínky, druhé
  hlasování.
- Kvalifikovaná většina a ochranná ustanovení pro změnu účelu, pravomocí orgánů a práv
  menšiny.
- Nezávislé právní posouzení každé změny osobou, která návrh nepřipravovala.
- Využití formálních pojistek, které právo dává: u obchodních korporací vyžaduje změna
  zakladatelského právního jednání zpravidla formu veřejné listiny a změny se promítají do
  veřejného rejstříku; vnitřní předpisy veřejné vysoké školy podléhají registraci
  ministerstvem. Tyto pojistky kontrolují formu, ne smysl změny.

## Role a odpovědnosti

Správce dokumentu (tajemník, právní oddělení) vede úplné znění a historii, ale nenavrhuje
obsah. Navrhovatel změny písemně zdůvodní každou úpravu. Kontrolní orgán (dozorčí rada,
revizní komise) ověří, že změna neoslabuje kontrolu. Členové nebo společníci mají právo na
srovnání a lhůtu. Vedení odpovídá za to, že se podle změněných pravidel nejedná dřív, než
nabudou účinnosti.

## Politiky a postupy

1. Každý návrh změny obsahuje srovnání se stávajícím zněním a tabulku „co se mění a proč“.
2. Minimální lhůta mezi zveřejněním návrhu a hlasováním; zkrácení jen jednomyslně.
3. Veřejný nebo aspoň členům dostupný přehled změn (changelog) se jménem navrhovatele.
4. Pravidelná revize souladu praxe se zněním – navazuje na
   [cykly revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md).
5. Zákaz retroaktivních úprav zápisů a zakládacích dokumentů; oprava jen formou nové,
   datované změny – viz [dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md).

## Vzdělávání a trénink

Členové orgánů, kteří hlasují o změnách, by měli umět číst srovnání znění a rozpoznat typické
posuny: přesun z „rozhoduje“ na „projednává“, z „schvaluje“ na „bere na vědomí“, rozšíření
výjimek, zúžení definic. Krátké cvičení na anonymizovaných příkladech změn stanov ukáže, jak
nenápadný může být zásah do rovnováhy moci. Užitečný je i návyk ptát se: „Kdo by tuto
pravomoc mohl zneužít, kdyby ve funkci seděl někdo jiný?“

## Řešení incidentu

Zjistí-li se, že změna proběhla bez řádného postupu nebo s neúplnou informací:

1. Zajistit všechny verze, pozvánky, podklady a zápisy z jednání, kde se o změně hlasovalo
   (principy [forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md)).
2. Rekonstruovat [časovou osu](@/kompendium/forensic-legal/33-timeline-reconstruction.md):
   kdo navrhl, kdy, kdo dostal jaké znění.
3. Předložit nález kontrolnímu orgánu a nechat posoudit platnost usnesení právníkem bez
   vazby na navrhovatele; soudní přezkum usnesení mívá krátké lhůty, proto jednat bez odkladu.
4. Do vyjasnění pozastavit kroky, které se o sporné ustanovení opírají.

## Ochrana dotčené osoby

Ten, kdo změnu odhalil, bývá obviněn z „formalismu“ nebo z obstrukce. Jeho podnět je
třeba přijmout jako službu organizaci. Zaměstnanec, který upozorní na protiprávní postup,
může požívat ochrany podle zákona č. 171/2023 Sb., o ochraně oznamovatelů, pokud oznámení
spadá do jeho rozsahu. Členové, jejichž práva změna omezila, potřebují srozumitelné
vysvětlení, co se změnilo a jaké mají možnosti.

## Vyhodnocení a indikátory selhání

- Změny bez veřejné rozpravy, urychlené schvalování, retroaktivní úpravy.
- Nikdo nedokáže předložit úplné aktuální znění.
- Historie změn chybí nebo je neúplná.
- Pravomoci se postupně koncentrují u jedné funkce.

Ukazatelem funkčnosti je, že se člen dokáže do deseti minut dozvědět, co platí a kdy a
proč se to změnilo.

## Meze a otevřené otázky

Ochrana znění nechrání před tím, kdo pravidla obchází, aniž by je měnil. Příliš rigidní
stanovy brání nutné adaptaci; cílem není zmrazení, ale viditelnost změn. Otevřenou otázkou
je, jak zapojit členy, kteří na čtení dokumentů nemají kapacitu – srozumitelné shrnutí změn
je proto součástí obrany, ne zdvořilost.

## Související

**Sesterské kapitoly**

- [Cykly revize politik](@/kompendium/organizational-defense/8-policy-review-cycles.md) –
  pravidelná kontrola, zda platné znění odpovídá praxi.
- [Ochrana akcionářů](@/kompendium/organizational-defense/9-shareholder-protection.md) –
  práva menšiny, která tichá změna stanov ohrožuje nejdřív.
- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
  – záznam, kdo a proč změnu navrhl.
- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md)
  – verzování a vlastnictví dokumentů.

**Techniky a signatury**

- [EA-2.4.2 Policy Rewriting Skrytá](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md)
  – vzorec skrytého přepisování pravidel.
- [EA-2.4.5 Evaluation Criteria Rewrite](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md)
  – příbuzná změna kritérií hodnocení.
- [Sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md) –
  jak se posun skrývá v pojmech.

**Právo a důkaz**

- [Rekonstrukce časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md) –
  postup při zpětném dohledání změn.
- [Forenzní dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md) – jak
  zajistit verze a zápisy.
