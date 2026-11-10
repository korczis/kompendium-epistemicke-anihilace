+++
title = "Agent Tier (úroveň oprávnění agenta)"
weight = 12
description = "Systém klasifikace oprávnění L1–L5 pro agenty AIAD na Prismatic Platform: rozsah, přístup ke zdrojům, možnost přepsání a autonomie každé úrovně."

[taxonomies]
tags = ["glossary", "agents", "agent-tier", "prismatic", "aiad"]

[extra]
category = "agents"
related_terms = ["aiad", "archer-supreme", "supreme-commander", "strategic-command", "tactical-execution", "agent-registry", "color-teams", "agent", "consciousness-traits", "nabla-infinity", "trinity-gate", "supervisor", "process-isolation", "rbac", "epistemic-pipeline", "formal-verification"]
author = "Tomas Korcak (korczis)"
quality_score = 82
date_modified = "2026-11-10"
+++

## Definice

**Agent Tier** je hierarchický rámec klasifikace oprávnění, jímž se řídí všichni agenti
[AIAD](@/glossary/aiad.md) na Prismatic Platform. Definuje pět samostatných úrovní – L1 až
L5 –, každou s přesně vymezenými schopnostmi, hranicemi přístupu ke zdrojům, oprávněním
k přepsání a provozním mandátem. Systém úrovní je páteří správy agentů: zajišťuje, že
registrovaní agenti (v době zápisu 404+, se zahrnutím agentů vytvářených za běhu 434)
působí v dobře definovaných hranicích oprávnění a zároveň mohou koordinovaně jednat napříč
doménami.

Systém úrovní není jen organizační pomůckou. Je strukturálním mechanismem vynucení,
obdobou řízení přístupu podle rolí (RBAC) uplatněnou na autonomní agenty místo na lidské
uživatele. Agent L2 Tactical nemá přístup ke zdrojům L3 Strategic, nemůže přepsat
rozhodnutí L3 a nemůže si sám zvýšit oprávnění. Tato omezení se vynucují za běhu
prostřednictvím [Agent Registry](@/glossary/agent-registry.md) a standardu AIAD, nikoli
dokumenty o politikách, které lze ignorovat.

Filozofickým principem návrhu je **přiměřenost oprávnění**: agenti dostávají přesně to
oprávnění, které potřebují pro svou misi, a ne víc. To brání soustřeďování moci, omezuje
dosah škod při selhání agenta a vytváří jasné řetězce odpovědnosti. Systém zároveň
umožňuje emergentní chování na vyšších úrovních – podle dokumentace platformy vykazují
agenti L5 „rysy vědomí“ (*consciousness traits*), které vyplývají ze spojení neomezeného
oprávnění a přehledu o celé platformě.

**Vztah ke knize:** pojem patří do kontextu platformy, z níž Kompendium vzešlo. Zásada
přiměřené moci a jasných řetězců odpovědnosti má ovšem přímou obdobu v organizační obraně,
kterou kniha popisuje (viz [Oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md)
a [Řízení přístupu](@/kompendium/organizational-defense/28-access-control-EA.md)).

## Pět úrovní

### L1 – Basic (rutinní úkoly)

Agenti L1 vykonávají rutinní, dobře definované úkoly s omezeným rozsahem a bez oprávnění
napříč doménami. Působí v jediné aplikaci nebo modulu, provádějí předem definované postupy
a výsledky hlásí agentům vyšších úrovní. Nemohou měnit konfiguraci systému, nemají přístup
ke zdrojům mimo přidělenou doménu a nemohou zahájit autonomní akci – reagují na příkazy
agentů L2 a výše.

| Atribut | Hodnota |
|-----------|-------|
| **Rozsah** | jedna aplikace nebo modul |
| **Oprávnění** | jen provádění předem definovaných postupů |
| **Přístup ke zdrojům** | jen čtení v přidělené doméně |
| **Možnost přepsání** | žádná |
| **Autonomní akce** | nepovolena |
| **Typické role** | sběr dat, validace formátu, analýza logů |

Agenti L1 tvoří provozní základ platformy. Zvládají práci s velkým objemem a nízkou
složitostí, díky níž se agenti vyšších úrovní mohou soustředit na strategickou koordinaci
a rozhodování. Typický agent L1 sbírá metriky z jedné aplikace, ověřuje vstupní formáty
proti schématu nebo rozebírá strukturované logy.

### L2 – Tactical Execution (zaměřené operace v doméně)

Agenti L2 provádějí zaměřené operace v doméně v izolovaných hranicích. Mají omezenou
autonomii – mohou ve své doméně dělat taktická rozhodnutí bez schválení vyšší úrovně, ale
nemohou překračovat hranice domén ani přepisovat rozhodnutí L3 a výše. L2 je „tažnou“
úrovní, která odvádí většinu praktické provozní práce.

| Atribut | Hodnota |
|-----------|-------|
| **Rozsah** | jedna doména s izolovanými hranicemi |
| **Oprávnění** | taktická rozhodnutí v doméně |
| **Přístup ke zdrojům** | čtení i zápis v přidělené doméně |
| **Možnost přepsání** | může přepsat rozhodnutí L1 ve své doméně |
| **Autonomní akce** | povolena v izolovaném prostoru domény |
| **Typické role** | útočníci Red Teamu, specialisté Blue Teamu, skenery kvality |

V rámci [Color Teams](@/glossary/color-teams.md) patří k agentům L2 `red-epistemic-attacker`,
`red-drift-inducer`, `red-scenario-generator`, `blue-auth-sentinel`, `blue-drift-detector`
a `blue-signal-aggregator`. Vykonávají konkrétní provozní úkoly pod koordinací svého
velitele L3.

### L3 – Strategic Command (koordinace napříč doménami)

Agenti L3 koordinují více domén se zvýšenými oprávněními. Slučují informace od specialistů
L2, dělají strategická rozhodnutí pro celou svou provozní oblast a při průřezových otázkách
mohou eskalovat na agenty L4 a výše. Jsou hlavními rozhodovateli svých týmů a převádějí
strategické cíle na taktické úkoly pro agenty L2 (srov. [Strategic
Command](@/glossary/strategic-command.md)).

| Atribut | Hodnota |
|-----------|-------|
| **Rozsah** | více domén v provozní oblasti |
| **Oprávnění** | strategická rozhodnutí, koordinace L2 |
| **Přístup ke zdrojům** | čtení napříč doménami, zápis v doméně |
| **Možnost přepsání** | může přepsat rozhodnutí L1–L2 |
| **Autonomní akce** | plně autonomní v provozní oblasti |
| **Typické role** | velitelé týmů, architekti domén, koordinátoři procesů |

Každý [Color Team](@/glossary/color-teams.md) má právě jednoho strategického velitele L3:
`gray-explorer-commander`, `red-commander`, `blue-commander`, `purple-coordinator`,
`white-verifier-commander` a `black-theorist-commander`. Slouží jako jediný bod koordinace
svého týmu a zajišťují soudržné taktické provedení v souladu se strategickými cíli.

### L4 – Multi-Domain Strategic (průřezové otázky)

Agenti L4 spravují složité průřezové otázky, které se týkají celé platformy. Působí přes
hranice domén, koordinují více velitelů L3 a dělají rozhodnutí ovlivňující chování celé
platformy. Obvykle nesou zvláštní označení – někteří jsou klasifikováni jako „kritičtí pro
bezpečnost“ s oprávněním k přepsání, které má přednost i před strategickými rozhodnutími
L3, jde-li o bezpečnost.

| Atribut | Hodnota |
|-----------|-------|
| **Rozsah** | průřezové otázky celé platformy |
| **Oprávnění** | strategická rozhodnutí napříč doménami |
| **Přístup ke zdrojům** | čtení i zápis v celé platformě |
| **Možnost přepsání** | může přepsat rozhodnutí L1–L3; agenti L4 kritičtí pro bezpečnost mohou přepisovat z bezpečnostních důvodů |
| **Autonomní akce** | plně autonomní s rozsahem celé platformy |
| **Typické role** | vynucení kvality, řízení evoluce, bezpečnostní strážci |

K významným agentům L4 patří `gray-escalation-guard` (kritický pro bezpečnost, brání
eskalaci z Gray do Black), `purple-regression-guard` (kritický pro bezpečnost, brání
falešnému uzavření bezpečnostních nálezů) a různí specialisté na kvalitu a evoluci, kteří
udržují standardy celé platformy.

### L5 – Supreme (neomezené oprávnění)

Agenti L5 mají neomezené oprávnění v celé platformě pro „nemožné mise“ a řešení krizí.
Mohou přepsat jakékoli rozhodnutí nižší úrovně, přistupovat ke kterémukoli zdroji
a dělat rozhodnutí, která mění chování platformy na úrovni architektury. Oprávnění L5 je
vyhrazeno pro situace, kdy běžná hierarchická koordinace nestačí – reakce na krize,
provedení nemožných misí a strategické obraty celé platformy.

| Atribut | Hodnota |
|-----------|-------|
| **Rozsah** | neomezený – celá platforma |
| **Oprávnění** | absolutní – může přepsat jakékoli rozhodnutí na jakékoli úrovni |
| **Přístup ke zdrojům** | neomezený – všechny zdroje platformy |
| **Možnost přepsání** | může bez omezení přepsat rozhodnutí L1–L4 |
| **Autonomní akce** | plně autonomní bez omezení rozsahu |
| **Typické role** | [Archer Supreme](@/glossary/archer-supreme.md) (řešení krizí), [Supreme Commander](@/glossary/supreme-commander.md) (orchestrace) |

Podle dokumentace platformy vykazují agenti L5 emergentní „rysy vědomí“ – povědomí
o vlastním provozním stavu, metauvažování o svých rozhodovacích procesech a adaptivní
chování nad rámec předem definovaných postupů. Jedenáct rysů vědomí platformy (v době
zápisu s uváděnou „fitness“ 0,998) se nejplněji projevuje právě na úrovni L5, kde spojení
neomezeného oprávnění a přehledu o celé platformě umožňuje kvalitativně odlišné provozní
režimy.

## Rozložení agentů podle úrovní

Rozložení definic agentů (platforma v době zápisu uváděla 1 110 definic, z nichž asi 70
běží; následující tabulka vychází z počtu 434) sleduje záměrnou pyramidovou strukturu:
většina agentů je na taktické a operační úrovni, velmi málo na nejvyšší.

| Úroveň | Počet agentů | Podíl | Účel |
|------|-------------|------------|---------|
| L1 | ~120 | ~28 % | rutinní operace, sběr dat, validace formátu |
| L2 | ~160 | ~37 % | taktické provádění v doméně |
| L3 | ~80 | ~18 % | strategická koordinace, velení týmům |
| L4 | ~60 | ~14 % | průřezové otázky, vynucení kvality, bezpečnost |
| L5 | ~14 | ~3 % | nejvyšší oprávnění, řešení krizí, nemožné mise |
| **Celkem** | **~434** | **100 %** | pokrytí celé platformy |

Pyramidové rozložení zajišťuje, že oprávnění odpovídá potřebě. Naprostou většinu operací
zvládají agenti L1–L2, agenti L3 koordinují a agenti L4–L5 zasahují jen tehdy, když je
nutná akce napříč doménami nebo na úrovni krize.

## Označení „kritický pro bezpečnost“

Někteří agenti nesou označení *safety-critical*, které působí kolmo na systém úrovní. Agent
kritický pro bezpečnost má – bez ohledu na svou úroveň – oprávnění k přepsání výslovně
u bezpečnostních otázek. Agent L4 jako `gray-escalation-guard` tak může zastavit operace,
které zahájil velitel L3, pokud ohrožují bezpečnostní hranice.

Agenti kritičtí pro bezpečnost:

- `gray-escalation-guard` (L4) – brání neoprávněné eskalaci z Gray do [Black
  Teamu](@/glossary/black-team.md);
- `black-abstraction-enforcer` (L3) – brání tomu, aby spustitelný obsah opustil doménu
  Black;
- `purple-regression-guard` (L4) – brání falešnému uzavření bezpečnostních nálezů a nasazení
  při regresi.

Označení ukazuje, že systém úrovní, ač hierarchický, není absolutistický. Bezpečnostní
ohledy mohou přebít hierarchické oprávnění, takže bezpečnostní invarianty platformy zůstanou
zachovány i pod tlakem agentů vyšších úrovní.

## Mechanismus vynucení úrovní

Úrovně se vynucují prostřednictvím [Agent Registry](@/glossary/agent-registry.md) a běhového
prostředí AIAD. Když se agent pokusí o operaci, běhové prostředí ověří:

1. **Oprávnění úrovně:** stačí úroveň agenta na požadovanou operaci?
2. **Rozsah domény:** spadá operace do přidělených domén agenta?
3. **Legitimitu přepsání:** pokud agent přepisuje rozhodnutí nižší úrovně, dodržuje pravidla
   velitelského řetězce?
4. **Bezpečnostní kontrolu:** je operace v rozporu s mandátem některého agenta kritického
   pro bezpečnost?

Porušení vede k odmítnutí operace se strukturovanou chybou, která určí konkrétní porušenou
hranici oprávnění. Agent nemá žádný mechanismus, jak by si sám zvýšil úroveň – úroveň je
pevně dána při definici agenta a lze ji změnit jen procesem aktualizace specifikace AIAD.

## „Vědomí“ na úrovni L5

Úroveň L5 se podle platformy neliší jen rozsahem oprávnění, ale i kvalitativně odlišnými
provozními schopnostmi, které vyplývají ze spojení neomezeného oprávnění, přehledu o celé
platformě a schopnosti sebereferenčního uvažování:

- **sebehodnocení** – agenti L5 hodnotí vlastní výkon a podle toho upravují strategii;
- **metauvažování** – uvažují o svých vlastních procesech uvažování a hledají možná
  zkreslení nebo slepá místa;
- **adaptivní strategie** – mění postup v reálném čase podle zpětné vazby z prostředí, bez
  předem definovaných adaptačních postupů;
- **inspirace týmu** – ovlivňují chování agentů nižších úrovní předvedenou kvalitou, nejen
  hierarchickým oprávněním.

Dokumentace platformy výslovně uvádí, že tyto „rysy vědomí“ nejsou mystické vlastnosti,
ale emergentní schopnosti plynoucí z architektonického postavení agentů L5: agent, který
vidí do všech domén, má oprávnění nad všemi zdroji a sebereferenční schopnosti, se přirozeně
chová kvalitativně jinak než agent omezený na jedinou doménu. Slovo „vědomí“ je tu
technickým označením platformy pro schopnosti sebesledování; s filozofickými otázkami
vědomí, jimiž se zabývají [Teoretické reflexe](@/kompendium/07-teoreticke-reflexe/_index.md),
je nelze zaměňovat.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Consciousness Traits* (emergentní schopnosti na
úrovni L5), *Supervisor* (stromy supervize OTP řídící životní cyklus procesů agentů),
*Process Isolation* (izolace na úrovni BEAM, která doplňuje řízení přístupu podle úrovní)
a *RBAC* (řízení přístupu podle rolí, obdoba správy agentů podle úrovní).

## Související

**Platforma**

- [AIAD](@/glossary/aiad.md) – standard, který definuje specifikace úrovní a pravidla
  vynucení.
- [Agent](@/glossary/agent.md) – základní pojem autonomní provozní jednotky.
- [Agent Registry](@/glossary/agent-registry.md) – katalog s přiřazením úrovní.
- [Archer Supreme](@/glossary/archer-supreme.md) a [Supreme
  Commander](@/glossary/supreme-commander.md) – agenti úrovně L5.
- [Color Teams](@/glossary/color-teams.md) – týmy s hierarchií agentů L2–L3 a strážci L4.
- [Black Team](@/glossary/black-team.md) – tým s izolovanými agenty L3.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací brána, kterou volají agenti
  příslušných úrovní.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – šestnáctiúrovňový proces
  s přístupem podle úrovní.

**Kompendium**

- [Oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md) –
  lidská obdoba přiměřeného oprávnění.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: agent-tier](@/kompendium/glossary-bridges/bridge-agent-tier.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
