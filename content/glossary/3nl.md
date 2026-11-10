+++
title = "3NL"
weight = 10
description = "Three Nested Levels – architektura Prismatic Platform, která člení systém do tří vnořených úrovní abstrakce: strategické, taktické a operační."

[taxonomies]
tags = ["glossary", "architecture", "3nl", "prismatic"]

[extra]
category = "architecture"
acronym = "3NL"
related_terms = ["pvm", "nabla-infinity", "aiad", "three-nl", "bounded-context", "supervisor", "adapter-pattern", "epistemic-pipeline"]
author = "Tomas Korcak (korczis)"
reading_time = "8 min"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["3NL", "Three Nested Levels", "vnořené úrovně", "glosář", "architektura", "Prismatic Platform", "úroveň", "doména"]
quality_score = 72
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "3NL – Prismatic Platform"
+++

## Definice

**3NL** (*Three Nested Levels*, tři vnořené úrovně) je základní architektonický rámec
Prismatic Platform, který člení všechny součásti platformy do tří hierarchických úrovní
abstrakce. Vychází z teorie systémů a z principů vrstvené architektury a zavádí přísné
oddělení odpovědností: každá úroveň zapouzdřuje složitost úrovně pod sebou a úrovni nad
sebou nabízí čisté, dobře definované rozhraní. Zkratka „3NL“ je kanonickým zkráceným
označením celého rámce Three Nested Levels a objevuje se v kódu, konfiguračních souborech,
specifikacích agentů i v technické dokumentaci. Spojuje číslici „3“ se zkratkou „NL“
(*Nested Levels*) a vyjadřuje důraz rámce na přesně tři úrovně vnoření – ne víc a ne méně –
jako na strukturálně optimální rozklad pro zvládnutí složitosti v měřítku platformy
(v době zápisu 95 aplikací v umbrella projektu, 1 110 definic agentů, z nichž asi 70 běží,
a přes 99 800 řádků kódu).

Tři úrovně – strategická (L1), taktická (L2) a operační (L3) – odpovídají klesající
abstrakci a rostoucí míře implementačních podrobností. L1 definuje, *co* systém dělá
(veřejná API, příkazy agentů, rozhraní dashboardu). L2 definuje, *jak* součásti
spolupracují (protokoly mezi aplikacemi, orchestrace procesů, vynucování kvality). L3
definuje, *jak věci skutečně fungují* (procesy OTP, adaptéry úložišť, primitiva BEAM). Toto
oddělení zajišťuje, že se změny na jedné úrovni zbytečně nepřelévají do ostatních – výměna
adaptéru úložiště na L3 neovlivní veřejné API na L1.

**Poznámka k názvu:** v glosáři je i heslo [3NL – Three-Nested-Loops](@/glossary/three-nested-loops.md),
které stejnou zkratku vykládá jako tři vnořené řídicí smyčky (mise, epocha, cyklus). Obě
hesla popisují architekturu platformy z různých úhlů. Pro Kompendium je 3NL kontextem
platformy, z níž kniha vzešla; kapitoly [Teoretické
základy](@/kompendium/02-uvod/teoreticke-zaklady.md) a [Vztah k
NABLA](@/kompendium/02-uvod/vztah-k-nabla.md) na něj odkazují, když vysvětlují, jak je
[taxonomie EA](@/glossary/taxonomie-ea.md) zapojena do epistemického procesu platformy.

## Přehled

Myšlenkový rodokmen 3NL čerpá z několika zavedených tradic softwarové architektury.
Sedmivrstvý síťový model OSI ukázal, že složité komunikační protokoly lze rozložit do
vrstev s dobře definovanými rozhraními. Hexagonální architektura Alistaira Cockburna (porty
a adaptéry) ukázala, že oddělení aplikační logiky od vnějších rozhraní umožňuje
testovatelnost a pružnost. Strategické vzory doménově řízeného návrhu (*Bounded Context*,
*Anti-Corruption Layer*) ukázaly, že organizační hranice mají odpovídat hranicím softwaru
(viz [Bounded Context](@/glossary/bounded-context.md)). 3NL tyto poznatky syntetizuje do
tříúrovňového rámce optimalizovaného pro ekosystém Erlang/OTP, kde procesy, stromy
supervize a předávání zpráv přirozeně vynucují hranice vrstev.

Pro platformu má 3NL zásadní význam. Řídí strukturu každé aplikace umbrella projektu, návrh
každého agenta, průběh každé kontroly kvality i šíření každého epistemického signálu
procesem [NABLA Infinity](@/glossary/nabla-infinity.md). Bez 3NL by se 90 aplikací
platformy (stav v době zápisu) proměnilo v neovladatelnou síť průřezových závislostí. S 3NL
každá aplikace nabízí čistou fasádu na L1, koordinuje se dobře definovanými protokoly na L2
a své vnitřní fungování implementuje volně na L3 – a může se tak vyvíjet nezávisle, bez
vln dopadů na celý systém.

Epistemický rámec [NABLA Infinity](@/glossary/nabla-infinity.md) pracuje na úrovni
integrace 3NL Level 3, tedy je zabudován do všech tří úrovní s mechanismy vynucení na
každé z nich. [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) (16 úrovní, L0–L13

+ Meta + Consciousness) se na 3NL mapuje takto: nižší epistemické úrovně (L0–L4) odpovídají
3NL L3, střední (L5–L9) 3NL L2 a horní (L10–L13 + Meta) 3NL L1.

## Technické podrobnosti

### Úroveň 1: strategická (veřejné rozhraní)

Nejvnější úroveň, viditelná pro vnější uživatele a pro orchestraci na vysoké úrovni.
Součásti L1 definují schopnosti platformy, aniž by odhalovaly mechaniku implementace.

| Součást | Projev na L1 | Příklad |
|-----------|-----------------|---------|
| **API** | koncové body REST a GraphQL | `POST /api/v1/perimeter/discover` |
| **Agenti** | rozhraní příkazů | `/archer-supreme`, `/orchestrate` |
| **Dashboard** | stránky LiveView | `/perimeter`, `/perimeter/assets` |
| **Kvalita** | zobrazení skóre, výstup hodnocení | kvalita vynucená doktrínou, 13/13 domén |
| **Integrace** | adaptéry vnějších systémů | specifikace OpenAPI, koncové body webhooků |

### Úroveň 2: taktická (vnitřní koordinace)

Prostřední úroveň, která zajišťuje koordinaci mezi součástmi platformy. L2 definuje
protokoly a vzory, jimiž se schopnosti L1 skládají z primitiv L3.

| Součást | Projev na L2 | Příklad |
|-----------|-----------------|---------|
| **Komunikace** | zasílání zpráv mezi aplikacemi, PubSub | směrování událostí mezi agenty |
| **Procesy** | orchestrace datových procesů | tok agregace zdrojů OSINT |
| **Kvalita** | vynucení bran, sledování [QDP](@/glossary/qdp.md) | proces `mix quality.gates` |
| **Koordinace** | hranice doménově řízeného návrhu | protokoly [Bounded Context](@/glossary/bounded-context.md) |
| **Evoluce** | cykly [AutoEvolve](@/glossary/autoevolve.md) a [AutoHeal](@/glossary/autoheal.md) | `mix autoevolve.scan` |

### Úroveň 3: operační (implementace)

Nejvnitřnější úroveň s implementačními podrobnostmi. Na L3 probíhá skutečná práce –
s primitivy OTP, operacemi úložiště a schopnostmi BEAM.

| Součást | Projev na L3 | Příklad |
|-----------|-----------------|---------|
| **Procesy** | GenServery, supervizory, úlohy | běhové procesy agentů |
| **Úložiště** | implementace [Adapter Pattern](@/glossary/adapter-pattern.md) | backendy ETS, Ecto, Meilisearch |
| **BEAM** | plánování procesů, předávání zpráv | předávání zpráv |
| **Paměť** | tabulky ETS, haldy procesů | mezipaměti pro detekci vzorů v O(1) |
| **Systém** | interakce s OS, souborový vstup a výstup, síť | dotazy do logů Certificate Transparency |

### Integrační matice

Následující matice ukazuje, jak se hlavní subsystémy platformy projevují na jednotlivých
úrovních 3NL:

| Subsystém | L1 (strategická) | L2 (taktická) | L3 (operační) |
|-----------|----------------|----------------|-------------------|
| **Agenti** | rozhraní příkazů | koordinace agentů | stav GenServeru |
| **Kvalita** | API skóre kvality | proces bran | kontroly Credo/Dialyzer |
| **Úložiště** | dotazovací API | směrování [adaptérů](@/glossary/adapter-pattern.md) | operace ETS/Ecto |
| **NABLA** | výstup důvěry | vyhodnocení axiomů | zpracování signálů |
| **Perimetr** | dashboard [EASM](@/glossary/easm.md) | orchestrace skenerů | sondy DNS/TLS |
| **Bezpečnost** | zobrazení hodnocení (A–F) | koordinace [Color Teams](@/glossary/color-teams.md) | kontroly jednotlivých agentů |
| **Evoluce** | hlášení stavu | evoluční proces | operace mutace a selekce |

## Implementace v Prismatic Platform

Hranice 3NL se vynucují modulovým systémem Elixiru a architektonickými konvencemi. Každá
aplikace umbrella projektu sleduje stejný vzor: modul nejvyšší úrovně slouží jako fasáda
L1, vnitřní koordinační moduly zajišťují orchestraci L2 a implementační moduly pracují na
L3:

```elixir
# L1: veřejná fasáda – JEDINÝ modul, který volají vnější uživatelé
defmodule PrismaticPerimeter do
  @moduledoc "L1 Strategic API for External Attack Surface Management."

  @spec discover(String.t()) :: {:ok, [map()]} | {:error, atom()}
  defdelegate discover(domain), to: PrismaticPerimeter.Orchestrator

  @spec security_rating(String.t()) :: {:ok, map()} | {:error, atom()}
  defdelegate security_rating(domain), to: PrismaticPerimeter.Rating.Calculator
end

# L2: vnitřní koordinace – koordinuje součásti L3
defmodule PrismaticPerimeter.Orchestrator do
  @moduledoc "L2 Tactical orchestration for discovery pipeline."
  use GenServer

  def discover(domain) do
    # Koordinuje více skenerů L3
    with {:ok, dns} <- Scanner.DNS.scan(domain),
         {:ok, tls} <- Scanner.TLS.scan(domain),
         {:ok, ports} <- Scanner.Port.scan(domain) do
      {:ok, merge_results(dns, tls, ports)}
    end
  end
end

# L3: implementace – vlastní logika skenování
defmodule PrismaticPerimeter.Scanner.DNS do
  @moduledoc "L3 Operational DNS scanning implementation."

  @spec scan(String.t()) :: {:ok, [map()]} | {:error, atom()}
  def scan(domain) do
    # Přímé překlady DNS, pokusy o přenos zóny atd.
    with {:ok, records} <- resolve_records(domain),
         {:ok, subdomains} <- enumerate_subdomains(domain) do
      {:ok, records ++ subdomains}
    end
  end
end
```

Standard agentů [AIAD](@/glossary/aiad.md) sleduje strukturu 3NL. Každá specifikace agenta
deklaruje svou úroveň a rozhraní, která na každé úrovni nabízí:

```elixir
# Agent sledující strukturu 3NL
defmodule PrismaticAgents.PerimeterScanner do
  @moduledoc """
  L1: Command interface via /perimeter-scan
  L2: Coordinates with other security agents via PubSub
  L3: Implements scanning logic using GenServer state
  """
  use PrismaticAgents.Agent,
    tier: :l2,
    command: "/perimeter-scan",
    domain: :security

  # L1: veřejný obslužný kód příkazu
  @impl true
  def handle_command("/perimeter-scan", args, state) do
    {:ok, initiate_scan(args, state)}
  end

  # L2: koordinace mezi agenty
  @impl true
  def handle_info({:agent_event, :vulnerability_found, data}, state) do
    Phoenix.PubSub.broadcast(Prismatic.PubSub, "security:findings", data)
    {:noreply, update_state(state, data)}
  end
end
```

## Srovnání s alternativami

| Architektura | Vrstvy | Vynucení | Pružnost | Vhodnost pro platformu |
|-------------|--------|-------------|-------------|---------------|
| **3NL** | 3 (strategická/taktická/operační) | modulový systém + konvence | vysoká uvnitř úrovní | navržena pro tento účel |
| **Hexagonální** | 2 (jádro + porty/adaptéry) | rozhraní portů | vysoká | dobrá pro vrstvu úložiště |
| **Clean Architecture** | 4 (entita/případ užití/rozhraní/framework) | pravidlo závislostí | střední | pro OTP příliš jemná |
| **Onion Architecture** | 4+ (jádro/doména/aplikace/infrastruktura) | závislosti dovnitř | střední | podobná Clean |
| **N-Tier** | N (obvykle 3: prezentace/byznys/data) | hranice nasazení | nízká | příliš zaměřená na infrastrukturu |
| **Mikroslužby** | podle služby | hranice služeb | velmi vysoká | proti filozofii OTP |

Hlavní výhodou 3NL oproti alternativám je soulad s přirozenou hierarchií procesů v OTP.
GenServer (L3) je supervidován supervizorem (hranice L2–L3), kterého spouští aplikace
(hranice L1–L2). 3NL kodifikuje to, k čemu OTP už samo vede, místo aby vnucovalo cizí
strukturu.

## Osvědčené postupy

**Směr závislostí:** závislosti musí směřovat dovnitř (L1 závisí na L2, L2 na L3, nikdy
naopak). Modul L3 nesmí přímo importovat ani volat modul L1. Potřebuje-li L3 upozornit L1,
vyšle událost přes koordinační vrstvu PubSub na L2.

**Přechod jen o jednu úroveň:** součásti mají komunikovat jen se sousedními úrovněmi.
Fasáda L1 má delegovat na koordinátory L2, nikoli sahat přímo do implementací L3. Tím se
zajistí, že L3 lze volně refaktorovat, aniž by se porušily kontrakty L1.

**Stabilita rozhraní:** rozhraní L1 se mění zřídka a řídí se sémantickým verzováním.
Protokoly L2 se vyvíjejí s požadavky koordinace. Implementace L3 se mohou měnit volně,
pokud zůstanou zachovány kontrakty L2. Tato odstupňovaná stabilita dovoluje rychlé změny
tam, kde na nich záleží (implementace), a stabilitu tam, kde je potřeba (veřejná rozhraní).

**Abstrakce přiměřená úrovni:** každá úroveň používá slovník odpovídající jejím úkolům. L1
mluví doménovými pojmy („odhalit útočnou plochu“, „posoudit soulad“), L2 pojmy koordinace
(„směrovat ke skeneru“, „sloučit výsledky“), L3 implementačními pojmy („přeložit záznam
DNS“, „rozebrat certifikát TLS“).

**Zapouzdření:** každá úroveň skrývá složitost před úrovní nad sebou. Uživatel L1 neví, zda
L3 ukládá data do ETS, nebo do PostgreSQL. Koordinátor L2 nezná konkrétní algoritmus
překladu DNS, který L3 používá.

## Případy užití

**Návrh nové aplikace:** při přidání nové aplikace do umbrella projektu vývojář nejprve
definuje veřejnou fasádu L1 (jaké schopnosti aplikace nabízí?), pak navrhne koordinační
vrstvu L2 (jak spolupracuje s ostatními aplikacemi?) a nakonec implementuje L3 (jaké
procesy OTP a jaké úložiště potřebuje?). Tento postup shora dolů zajišťuje, že vnější
kontrakt aplikace je navržen dřív, než se řeší implementační podrobnosti.

**Vynucení kvality:** infrastruktura kvality působí na všech třech úrovních. L1 zobrazuje
skóre kvality v dashboardu a v API. L2 koordinuje spouštění bran kvality napříč
aplikacemi. L3 spouští jednotlivé kontroly (Credo, Dialyzer, pokrytí testy). Díky tomuto
oddělení přidání nové kontroly kvality na L3 nevyžaduje žádnou změnu na L1 ani L2.

**Vývoj agentů:** každý agent AIAD sleduje 3NL. Rozhraní příkazů agenta (L1) je definováno
v jeho specifikaci `.agent.md`. Jeho koordinace s jinými agenty (L2) využívá PubSub
a protokoly událostí. Jeho vnitřní logika (L3) využívá stav GenServeru a primitiva OTP.

**Migrace úložiště:** při přechodu z jednoho backendu úložiště na jiný (například z ETS na
Ecto pro určitou doménu) se mění jen kód adaptéru na L3. Konfigurace směrování na L2 ukáže
na nový adaptér. Uživatelé L1 nezaznamenají žádnou změnu. Tato izolace se opakovaně
osvědčila v architektuře úložiště platformy s více adaptéry.

## Související

**Platforma**

- [3NL – Three-Nested-Loops](@/glossary/three-nested-loops.md) – výklad téže zkratky jako
  tří vnořených řídicích smyček.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec integrovaný do všech
  úrovní 3NL.
- [Bounded Context](@/glossary/bounded-context.md) – doménové hranice sladěné s úrovněmi
  3NL.
- [Adapter Pattern](@/glossary/adapter-pattern.md) – vzor L3 pro zaměnitelné implementace.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – zpracování vědění uspořádané
  podle 3NL.
- [AIAD](@/glossary/aiad.md) – standard agentů sledující strukturu 3NL.

**Kompendium**

- [Teoretické základy](@/kompendium/02-uvod/teoreticke-zaklady.md) – kde se kniha odvolává na
  architekturu platformy.
- [Vztah k NABLA](@/kompendium/02-uvod/vztah-k-nabla.md) – jak je taxonomie EA zapojena do
  epistemického procesu platformy.
