+++
title = "Bridge: Agent Tier (úroveň oprávnění agenta)"
description = "Most mezi heslem Agent Tier a knihou: úrovně oprávnění L1–L5, zásada nejmenšího oprávnění a její lidská obdoba v oddělení povinností a v kontrole moci uvnitř skupin."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "agent-tier", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["agent-tier", "aiad", "agent-registry", "supreme-commander", "strategic-command", "tactical-execution"]
parent = "kompendium-glossary-bridges"
glossary_target = "agent-tier"
toc = false
+++

# Bridge: Agent Tier (úroveň oprávnění agenta)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a nápravě. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Agent Tier](@/glossary/agent-tier.md) je systém úrovní oprávnění, jímž platforma, z níž Kompendium
vzešlo, řídí své autonomní agenty definované standardem [AIAD](@/glossary/aiad.md). Pět úrovní L1 až
L5 vymezuje rozsah působnosti, přístup ke zdrojům, oprávnění přepsat rozhodnutí nižší úrovně a míru
autonomie. Úrovně se vynucují za běhu prostřednictvím [registru agentů](@/glossary/agent-registry.md):
agent si nemůže sám zvýšit oprávnění a nemůže přepsat rozhodnutí vyšší úrovně.

Technicky jde o uplatnění dvou starých zásad návrhu bezpečných systémů. Saltzer a Schroeder (1975)
formulovali zásadu nejmenšího oprávnění (*least privilege*): každá součást má mít jen ta práva, která
k úkolu nezbytně potřebuje. Sandhu a spolupracovníci (1996) pak systematizovali řízení přístupu podle
rolí (RBAC), v němž se oprávnění neváže na jednotlivce, ale na roli. Agent Tier přenáší obojí z lidských
uživatelů na autonomní programy. Heslo patří do kontextu platformy; kniha ho zařazuje mezi mosty kvůli
zásadě přiměřené moci a jasných řetězců odpovědnosti, která má přímou obdobu v organizační obraně.

## Úrovně oprávnění očima knihy

Parasuraman, Sheridan a Wickens (2000) navrhli model úrovní automatizace, který rozlišuje, nakolik
systém jen radí a nakolik sám rozhoduje a jedná. Z jejich práce plyne, že s rostoucí autonomií neroste
jen výkon, ale i riziko, že člověk přestane rozhodnutí kontrolovat. Kniha čte úrovně L1–L5 stejně:
nejde jen o hierarchii schopností, ale o rozložení odpovědnosti. Čím výš úroveň, tím silnější musí být
audit, protože chyba na vrcholu se šíří dolů do všech podřízených vrstev.

Lidskou obdobou je stupňovitý přístup k informacím a rozhodování v uzavřených skupinách. Hassan (1988)
v modelu BITE popisuje kontrolu informací, k níž patří rozčlenění vědění podle stupně příslušnosti a
rozdíl mezi „vnitřní“ a „vnější“ naukou. Rozdíl mezi technickým a manipulativním systémem úrovní je
v tom, k čemu hierarchie slouží: v dobře navrženém systému omezuje moc a vytváří dohledatelnost,
v manipulativní skupině soustřeďuje moc a dohledatelnost ruší. Stejná struktura tedy může chránit
i ovládat; rozhoduje, zda nad nejvyšší úrovní existuje kontrola, kterou nejvyšší úroveň nemůže zrušit.

Zvláštní pozornost zaslouží tvrzení dokumentace platformy, že agenti nejvyšší úrovně vykazují „rysy
vědomí“. Kniha takové tvrzení čte kriticky. Dennett (1987) ukázal, že přisuzování mentálních stavů je
interpretační postoj, který může být užitečný k předpovědi chování, aniž by cokoli dokazoval o vnitřní
zkušenosti systému. Připisování vědomí nebo osobnosti softwaru je navíc vzorec, který kniha rozebírá
jako samostatnou techniku – [nárok na osobnost AI](@/kompendium/techniques/ea-9-2-10-AI-personhood-claim.md).

## Kde se pojem v knize vyskytuje

Jednotlivé úrovně a jejich obranné úlohy popisuje oddíl [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md).
Nejnižší vrstvu, která vykonává bez otázek a proto potřebuje ověření nad sebou, přibližuje stránka
[Operational Execution a EA](@/kompendium/aiad-integration/operational-execution-ea-deployment.md);
práci podle připravených postupů a eskalaci stránka [Tactical Execution a EA](@/kompendium/aiad-integration/tactical-execution-ea-operations.md);
převod strategického záměru na plány a otázku, zda eskalace k autoritě smí být jedinou cestou nesouhlasu,
stránka [Strategic Command a EA](@/kompendium/aiad-integration/strategic-command-ea-coordination.md).
Nejvyšší úroveň a nutnost jejího auditu rozebírá [Supreme Commander a EA](@/kompendium/aiad-integration/supreme-commander-ea-strategy.md).

Na straně lidských institucí odpovídají zásadě úrovní kapitoly organizační obrany
[Oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md),
[Řízení přístupů s EA fokusem](@/kompendium/organizational-defense/28-access-control-EA.md) a
[Auditní výbor proti EA](@/kompendium/organizational-defense/5-audit-committee-EA.md). Opačný proces –
nepozorované rozšiřování vlastní pravomoci – popisuje technika
[EA-2.4.4 Ovládnutí vedení](@/kompendium/techniques/ea-2-4-4-leadership-capture.md) a detekční signatura
[Posun rozsahu](@/kompendium/detection-signatures/7-linguistic-scope-creep.md).

## Od pojmu k praxi

### Rozpoznání

V technickém systému je varovným znakem každá cesta, jíž si součást může oprávnění zvýšit sama, nebo
role, kterou nikdo nekontroluje. V lidské organizaci je obdobou situace, kdy jedna osoba nebo úzký
okruh rozhoduje, kontroluje vlastní rozhodnutí a zároveň určuje, kdo smí znát podklady. Kipnis (1972)
v experimentech o moci ukázal, že rostoucí moc mění vnímání podřízených i sebe sama; Keltner,
Gruenfeld a Anderson (2003) to shrnuli do teorie, podle níž moc posiluje sklon jednat bez ohledu na
druhé. Pozorovatel si proto všímá nejen toho, kdo moc má, ale i toho, zda se nad ní ještě někdo ptá.

### Obrana

Obrana stojí na třech prvcích, které platforma uplatňuje technicky a kniha doporučuje institucím.
Prvním je přiměřenost: oprávnění odpovídá úkolu a po jeho skončení zaniká. Druhým je oddělení: kdo
rozhoduje, nekontroluje sám sebe. Třetím je dohledatelnost: každé přepsání rozhodnutí nižší úrovně
zanechává záznam, který může přezkoumat někdo mimo hierarchii. Saltzer a Schroeder (1975) k tomu
přidávají zásadu „úplného zprostředkování“ – každý přístup se ověřuje, ne jen první.

### Náprava

Když se v organizaci ukáže, že moc se soustředila bez kontroly, je náprava strukturální, nikoli jen
personální. Kapitoly [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
a [Mandát etického ředitele](@/kompendium/organizational-defense/7-ethics-officer-mandate.md) ukazují,
jak obnovit záznam rozhodnutí a nezávislý kanál pro námitky. U jednotlivců, kteří v hierarchii
zažili ztrátu vlastního úsudku, navazují protokoly zotavení, například
[Subakutní rekonstrukce důvěry](@/kompendium/recovery-protocols/subacute-trust-rebuilding.md).

## Odlišení od příbuzných pojmů

Agent Tier je třeba odlišit od pouhé organizační struktury. Organigram popisuje, kdo komu podléhá;
systém úrovní navíc vynucuje, co kdo smí, a to i proti vůli toho, kdo je výš. Od autoritářské
hierarchie se liší tím, že omezení platí i pro vrchol a jsou dohledatelná. Od modelu úrovní
automatizace (Parasuraman et al. 2000) se liší tím, že neklasifikuje míru lidského zapojení, ale
rozsah moci jednotlivých programových součástí; obě perspektivy se však doplňují.

## Časté omyly

Prvním omylem je představa, že víc úrovní znamená víc bezpečí. Každá úroveň přidává rozhraní, na němž
se může odpovědnost ztratit. Druhým omylem je spoléhat na to, že vysoké oprávnění je oprávněné jen
proto, že je vysoké; i nejvyšší úroveň potřebuje vnější audit. Třetím omylem je přenášet technický
pojem na lidi tak, že se z lidí stanou „agenti určité úrovně“: kniha analogii používá ke čtení
struktury moci, ne k hodnocení osob.

## Příklad (anonymizovaný kompozit)

Ve výzkumné skupině vedoucí postupně převezme schvalování publikací, rozdělování grantových peněz i
hodnocení doktorandů a k tomu jako jediný komunikuje s vedením fakulty. Nikdo neporušil předpis, ale
všechny kontrolní body se sešly v jedné osobě. Doktorandka, která nesouhlasí s interpretací dat, nemá
komu námitku předložit. Fakulta po stížnosti nezačne posuzovat osobu vedoucího, ale strukturu:
rozdělí schvalovací pravomoci, zřídí nezávislou komisi pro hodnocení a ombudsmana. Situace se
uklidní, aniž by bylo třeba prokazovat zlý úmysl.

## Meze a otevřené otázky

Analogie mezi oprávněními softwarových agentů a mocí v lidských skupinách je strukturní, ne
psychologická. Otevřená zůstává otázka, jak nastavit autonomii programových agentů tak, aby lidský
dohled nebyl jen formální – Parasuraman a Riley (1997) popsali, že lidé automatizaci buď přehnaně
důvěřují, nebo ji odmítají, a obojí oslabuje kontrolu. Druhou otázkou je, jak auditovat nejvyšší
úroveň, když auditor závisí na informacích, které tato úroveň spravuje.

## Literatura

- Dennett, D. C. (1987). *The Intentional Stance*. MIT Press.
- Hassan, S. (1988). *Combatting Cult Mind Control*. Park Street Press.
- Keltner, D., Gruenfeld, D. H., & Anderson, C. (2003). Power, approach, and inhibition. *Psychological Review*, 110(2), 265–284.
- Kipnis, D. (1972). Does power corrupt? *Journal of Personality and Social Psychology*, 24(1), 33–41.
- Parasuraman, R., & Riley, V. (1997). Humans and automation: Use, misuse, disuse, abuse. *Human Factors*, 39(2), 230–253.
- Parasuraman, R., Sheridan, T. B., & Wickens, C. D. (2000). A model for types and levels of human interaction with automation. *IEEE Transactions on Systems, Man, and Cybernetics – Part A*, 30(3), 286–297.
- Saltzer, J. H., & Schroeder, M. D. (1975). The protection of information in computer systems. *Proceedings of the IEEE*, 63(9), 1278–1308.
- Sandhu, R. S., Coyne, E. J., Feinstein, H. L., & Youman, C. E. (1996). Role-based access control models. *IEEE Computer*, 29(2), 38–47.

## Související

**Glosář**

- [Agent Tier](@/glossary/agent-tier.md) – technické heslo, které most propojuje.
- [AIAD](@/glossary/aiad.md) – standard, v němž se úroveň agenta deklaruje.
- [Agent Registry](@/glossary/agent-registry.md) – místo, kde se úrovně vynucují.
- [Supreme Commander](@/glossary/supreme-commander.md) – agent nejvyšší úrovně.

**Kniha**

- [Oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md) – lidská obdoba omezení úrovní.
- [Auditní výbor proti EA](@/kompendium/organizational-defense/5-audit-committee-EA.md) – kontrola nejvyšší autority.
- [EA-2.4.4 Ovládnutí vedení](@/kompendium/techniques/ea-2-4-4-leadership-capture.md) – soustředění moci jako technika.
- [Operational Execution a EA](@/kompendium/aiad-integration/operational-execution-ea-deployment.md) – poslušnost bez ověření.

**Sesterské mosty**

- [Bridge: AIAD](@/kompendium/glossary-bridges/bridge-aiad.md) – standard definic agentů.
- [Bridge: Agent Registry](@/kompendium/glossary-bridges/bridge-agent-registry.md) – vynucení oprávnění za běhu.
- [Bridge: Supreme Commander](@/kompendium/glossary-bridges/bridge-supreme-commander.md) – audit vrcholu hierarchie.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Agent Tier (úroveň oprávnění agenta)](@/glossary/agent-tier.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
