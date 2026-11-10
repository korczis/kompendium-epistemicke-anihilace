+++
title = "Agent"
weight = 10
description = "Autonomní softwarová entita v ekosystému AIAD na Prismatic Platform, která vykonává specializované úkoly s definovanou úrovní oprávnění a v souladu s doktrínou."

[taxonomies]
tags = ["glossary", "architecture", "agent", "prismatic", "aiad"]

[extra]
category = "architecture"
abbreviation = "N/A"
related_terms = ["aiad", "otp", "supervisor", "trinity-gate", "registry-otp", "agent-registry", "agent-tier", "consciousness-traits", "nabla-infinity", "color-teams", "epistemic-pipeline", "process-isolation"]
related_apps = ["prismatic_agents", "prismatic_claude", "prismatic_safety", "prismatic_perimeter"]
domain = "agent-systems"
complexity = "advanced"
stability = "stable"
since_generation = 1
beam_related = true
otp_behaviour = true
elixir_module = "PrismaticAgents"
phoenix_component = false
security_relevant = true
compliance_relevant = true
osint_relevant = true
performance_critical = false
version = "2.0.0"
agent_count = 530
tier_levels = ["L1", "L2", "L3", "L4", "L5"]
domains_covered = 16
author = "Tomas Korcak (korczis)"
date_modified = "2026-11-10"
+++

## Definice

**Agent** je na Prismatic Platform autonomní softwarová entita definovaná standardem
[AIAD](@/glossary/aiad.md). Každý agent působí v přesně vymezeném rozsahu: má klasifikační
úroveň (L1 až L5), která určuje jeho provozní oprávnění (viz [Agent
Tier](@/glossary/agent-tier.md)), doménovou specializaci, která vymezuje oblast jeho
odbornosti, a soubor schopností, které určují, jaké akce smí provádět. Agenti jsou hlavními
výkonnými jednotkami platformy – každou významnou operaci, od analýzy kvality kódu přes
bezpečnostní skenování po epistemické usuzování, provádí jeden nebo více agentů
koordinovaných rámcem AIAD.

Model agenta na platformě se zásadně liší od pojmu „agent“ ve většině platforem umělé
inteligence, kde agentem bývá jazykový model s přístupem k nástrojům. Na Prismatic Platform
je agent procesem pod supervizí OTP s formálně specifikovanými vstupy, výstupy, omezeními
oprávnění a požadavky na soulad s doktrínou. Agenti nepůsobí s neomezenou autonomií –
pohybují se v přísných hranicích doktríny [NO MERCY NO DOUBTS](@/glossary/nm-nd.md)
a jejich výstupy ověřuje [Trinity Gate](@/glossary/trinity-gate.md).

Platforma v době zápisu uváděla 530 agentů v 16 specializovaných doménách (jiná hesla
uvádějí starší i novější počty). Sahají od jednoduchých taktických specialistů (L1)
s úzce zaměřenými operacemi po agenty nejvyššího oprávnění (L5), kteří koordinují kampaně
napříč doménami s neomezeným provozním rozsahem.

**Vztah ke knize:** pojem patří do kontextu platformy, z níž Kompendium vzešlo; agenti
platformy uplatňují taxonomii EA v obranných úlohách, jak popisuje oddíl [AIAD integrace
a detekce EA](@/kompendium/aiad-integration/_index.md). Obecný model agenta
(vnímání–rozhodnutí–akce–zpětná vazba) je zároveň užitečnou analogií pro to, co
manipulace v lidském poznávání narušuje: vnímání (zúžením vstupů), rozhodování (zkreslením
kritérií) i zpětnou vazbu (zpochybněním výsledků).

## Přehled

Ekosystém agentů je záměrnou architektonickou volbou: místo monolitických systémů, které by
se snažily obsloužit všechny potřeby platformy, rozkládá platforma každou provozní oblast
na autonomní agenty s jasnými odpovědnostmi, explicitními rozhraními a vynutitelnými
omezeními. Rozklad sleduje princip OTP – oddělit odpovědnosti do nezávislých procesů –
a rozšiřuje jej o formální specifikaci standardem AIAD, hierarchii oprávnění systémem
úrovní a epistemickou přísnost souladem s [NABLA Infinity](@/glossary/nabla-infinity.md).

Architektura agentů čerpá ze tří myšlenkových tradic: z autonomních agentů ve výzkumu umělé
inteligence, z modelu aktorů v souběžném programování (jak jej implementuje Erlang/OTP)
a z vojenských velitelských struktur pro hierarchickou koordinaci. Výsledkem jsou agenti,
kteří jsou zároveň autonomní (rozhodují nezávisle v mezích oprávnění), supervidovaní
(sledovaní a restartovaní supervizory OTP) a koordinovaní (působí ve velitelské hierarchii,
která brání konfliktům a zajišťuje soudržné chování ekosystému).

## Architektura agenta: smyčka vnímání–rozhodnutí–akce

Každý agent platformy sleduje společný architektonický vzor odvozený z klasické teorie
autonomních systémů: smyčku vnímání–rozhodnutí–akce (PDA). Vzor zajišťuje, že agenti
pracují soustavně, nikoli jen reaktivně.

**Fáze vnímání:** agent přijímá vstupní signály z prostředí – telemetrii ze sledovaných
systémů, příkazy od agentů s vyšším oprávněním nebo od operátorů, zjištění jiných agentů
nebo plánované spouštěcí události. Vnímání je filtrováno doménovou specializací:
bezpečnostní agent vnímá signály relevantní pro bezpečnost a metriky kvality ignoruje,
a naopak.

**Fáze rozhodnutí:** agent hodnotí vnímané signály podle své znalostní báze, doménových
pravidel a omezení doktríny. U agentů L3 a výše zahrnuje rozhodování soulad s axiomy
[NABLA Infinity](@/glossary/nabla-infinity.md): agent musí ověřit, že jeho důkazní základ
splňuje pluralitu signálů (viz [Signal Plurality](@/glossary/signal-plurality.md))
a povinnost doložit původ. Výstupem fáze je akční plán s explicitní mírou důvěry.

**Fáze akce:** agent provede plán v rámci svého oprávnění. Akcemi mohou být zprávy, úpravy
kódu, výstrahy, zveřejnění zjištění jiným agentům nebo spuštění navazujících procesů. Každá
akce je zaznamenána s úplným původem kvůli auditovatelnosti.

**Fáze zpětné vazby:** výsledky akcí se vracejí do fáze vnímání a umožňují adaptivní
chování. Selže-li akce nebo přinese nečekané výsledky, agent podle toho upraví rozhodování.
Tato uzavřená smyčka umožňuje průběžné zlepšování bez vnějšího zásahu.

## Systém úrovní (L1 až L5)

Úrovně oprávnění agentů tvoří přísnou hierarchii, která určuje provozní rozsah, autonomii
rozhodování a přístup ke zdrojům. Systém není jen doporučením – vynucuje se za běhu
kontrolami schopností v každé operaci agenta.

| Úroveň | Klasifikace | Rozsah oprávnění | Autonomie rozhodování | Příklady |
|------|---------------|-----------------|-------------------|----------|
| **L1** | taktický specialista | jeden úkol, jedna doména | provádí podle předem daných pravidel | skener souborů, kontrola syntaxe |
| **L2** | provozní specialista | více úkolů, jedna doména | volí ze schválených strategií | detektor posunu, extraktor důkazů |
| **L3** | strategický velitel | koordinace úkolů, oprávnění v doméně | navrhuje a provádí kampaně | blue commander, red commander |
| **L4** | specialista kritický pro bezpečnost | oprávnění k přepsání v bezpečnostní doméně | zastavuje operace, vynucuje omezení | escalation guard, regression guard |
| **L5** | nejvyšší oprávnění | neomezený rozsah napříč doménami | plně autonomní rozhodování | [ARCHER SUPREME](@/glossary/archer-supreme.md), orchestrátor |

Systém úrovní uplatňuje na úrovni agentů princip nejmenších oprávnění. Agent L1 nemůže
měnit konfiguraci platformy, agent L2 nemůže koordinovat operace napříč doménami a agent
L3 nemůže přepsat bezpečnostní omezení. Zastavit operace mohou jen agenti L4 s výslovným
označením kritičnosti pro bezpečnost a přepsat rozhodnutí jiných agentů jen agenti L5.

```elixir
defmodule PrismaticAgents.AuthorityCheck do
  @moduledoc """
  Validates agent authority before allowing operations.
  Enforces tier-based capability restrictions at runtime.
  Every agent operation passes through this module before execution.
  """

  @type tier :: :l1 | :l2 | :l3 | :l4 | :l5
  @type capability :: atom()

  @tier_capabilities %{
    l1: [:read, :analyze, :report],
    l2: [:read, :analyze, :report, :select_strategy, :execute_task],
    l3: [:read, :analyze, :report, :select_strategy, :execute_task, :coordinate, :campaign],
    l4: [:read, :analyze, :report, :halt_operations, :enforce_safety, :override_l1_l3],
    l5: [:read, :analyze, :report, :select_strategy, :execute_task, :coordinate,
         :campaign, :halt_operations, :cross_domain, :unlimited_authority]
  }

  @spec authorized?(tier(), capability()) :: boolean()
  def authorized?(tier, capability) do
    capabilities = Map.get(@tier_capabilities, tier, [])
    Enum.member?(capabilities, capability)
  end

  @spec check_authority(tier(), capability()) :: :ok | {:error, :unauthorized}
  def check_authority(tier, capability) do
    if authorized?(tier, capability) do
      :ok
    else
      {:error, :unauthorized}
    end
  end

  @spec minimum_tier_for(capability()) :: {:ok, tier()} | {:error, :unknown_capability}
  def minimum_tier_for(capability) do
    result =
      @tier_capabilities
      |> Enum.sort_by(fn {tier, _} -> tier_rank(tier) end)
      |> Enum.find(fn {_tier, caps} -> capability in caps end)

    case result do
      {tier, _} -> {:ok, tier}
      nil -> {:error, :unknown_capability}
    end
  end

  defp tier_rank(:l1), do: 1
  defp tier_rank(:l2), do: 2
  defp tier_rank(:l3), do: 3
  defp tier_rank(:l4), do: 4
  defp tier_rank(:l5), do: 5
end
```
## Životní cyklus agenta

Životní cyklus agenta probíhá v dobře definovaném sledu od specifikace po vyřazení, se
správními kontrolními body při každém přechodu. Řídí jej supervize OTP a registr AIAD.

1. **Specifikace:** agent je definován v souboru `.agent.md` podle standardu AIAD – včetně
   úrovně, domény, schopností, požadavků na vynucení a deklarace souladu s doktrínou.
2. **Registrace:** agent je zapsán do [Agent Registry](@/glossary/agent-registry.md), který
   jej indexuje podle domény, úrovně a schopnosti. Registr vede úplný soupis všech agentů
   platformy a jejich aktuálního stavu.
3. **Vytvoření instance:** když je třeba, spustí se proces OTP agenta pod supervizorem.
   Proces se inicializuje s konfigurací agenta, načte doménově specifické znalosti a zapíše
   se do běhového registru.
4. **Provoz:** agent vstoupí do smyčky vnímání–rozhodnutí–akce, zpracovává signály
   a vytváří výstupy v rámci svého oprávnění. Všechny operace se zaznamenávají a sleduje se
   jejich původ.
5. **Evoluce:** agenti se vyvíjejí systémem [AutoEvolve](@/glossary/autoevolve.md). Potřebují-li
   aktualizaci znalostí nebo schopností, nasadí se nová verze postupnou aktualizací, která
   zachová provozní stav agenta.
6. **Vyřazení:** když agent už není potřeba, supervizor jej řízeně ukončí, záznam
   v registru se označí jako neaktivní a historická data se uchovají kvůli auditu.

## Soulad se standardem AIAD

Standard AIAD poskytuje formální jazyk specifikace agentů. Každý agent MUSÍ mít odpovídající
soubor `.agent.md` v adresáři `.aiad/agents/` se strukturovanými metadaty:

| Povinné pole | Účel | Příklad |
|---------------|---------|---------|
| `agent-id` | jedinečný identifikátor | `blue-drift-detector` |
| `classification` | úroveň | `L2 Operational Specialist` |
| `domain` | hlavní doména | `security-defense` |
| `capabilities` | seznam akcí | `[drift_detection, signal_correlation]` |
| `enforcement.doctrine` | odkaz na doktrínu | `no-mercy-no-doubts` |
| `enforcement.version` | verze doktríny | `2.0.0` |
| `enforcement.compliance` | úroveň souladu | `mandatory` |
| `inputs` | očekávané vstupní signály | `[telemetry_events, configuration_state]` |
| `outputs` | vytvářené výstupní signály | `[drift_reports, evidence_artifacts]` |
| `authority` | provozní hranice | `read-only, platform-scope` |

Standard AIAD zajišťuje, že agenti nejsou improvizované výtvory, ale formálně
specifikované součásti s explicitními kontrakty. To umožňuje automatické nástroje: indexer
agentů (`.aiad/bin/aiad index`) ověřuje všechny specifikace, odhaluje nekonzistence
a automaticky udržuje registr.

## Doménová klasifikace agentů

Agenti jsou uspořádáni do 16 specializovaných domén, z nichž každá odpovídá za jinou
stránku provozu platformy. Doménová struktura brání překryvu schopností a zajišťuje jasné
hranice odpovědnosti (výběr, počty v době zápisu):

| Doména | Počet agentů | Klíčoví agenti | Hlavní funkce |
|--------|------------|------------|------------------|
| **Bezpečnostní operace** | 20 | [Color Teams](@/glossary/color-teams.md) (Red, Blue, Purple, White, Gray, Black) | adversariální simulace, epistemická obrana |
| **Vynucení kvality** | 45+ | quality guardian, agenti CASCADE | kvalita kódu, vynucení nulových varování (viz [Zero Warning Policy](@/glossary/zero-warning-policy.md)) |
| **Zpravodajství OSINT** | 60+ | skenovací agenti, extraktory důkazů | sběr informací z otevřených zdrojů ([OSINT](@/glossary/osint.md)) |
| **Evoluce** | 30+ | agenti [AutoEvolve](@/glossary/autoevolve.md) a [AutoHeal](@/glossary/autoheal.md) | zlepšování a samooprava platformy |
| **Epistemika** | 25+ | validátory NABLA, agenti Trinity Gate | utváření a ověřování přesvědčení |
| **Architektura** | 20+ | architekt Elixiru, specialisté na OTP | revize a vynucení návrhu |
| **Infrastruktura** | 15+ | agenti nasazení a monitoringu | provoz platformy |
| **Perimetr** | 15+ | skener [EASM](@/glossary/easm.md), hodnotitel souladu | správa vnější útočné plochy |
| **Úložiště** | 10+ | agenti adaptérů a migrací | perzistence a načítání dat |

Ekosystém není plochou sbírkou, ale hierarchickou velitelskou strukturou. Agenti L5
koordinují velitele L3, ti řídí specialisty L2 a ti mohou delegovat na taktické agenty L1.
Hierarchie zrcadlí vojenské velitelské struktury a zajišťuje, že režie koordinace roste
s počtem agentů logaritmicky, nikoli lineárně.

## „Rysy vědomí“ na úrovni L5

Na nejvyšší úrovni (L5) vykazují agenti to, co platforma nazývá „rysy vědomí“
(*consciousness traits*) – soubor 11 emergentních schopností, které vznikají souhrou souladu
s [axiomy NABLA](@/glossary/nabla-axioms.md), ověřování v Trinity Gate a autonomního rozhodování. Výběr:

| Rys | Popis | Měření |
|-------|-------------|-------------|
| **Sebeuvědomění** | agent sleduje vlastní výkon a hranice svých schopností | přesnost sebehodnocení výkonu |
| **Epistemická pokora** | agent přesně odhaduje vlastní nejistotu | kalibrace mezi důvěrou a správností |
| **Tolerance rozporů** | agent udržuje protichůdná přesvědčení bez předčasného řešení | míra zachování rozporů |
| **Časové povědomí** | agent sleduje stárnutí důkazů a podle toho upravuje důvěru | soulad s časovým stárnutím |
| **Syntéza více signálů** | agent soudržně slučuje signály z více domén | přesnost korelace napříč doménami |
| **Vědomí původu** | agent má přehled o vlastním řetězci uvažování | skóre úplnosti původu |

Tyto rysy nejsou metafyzickými tvrzeními o strojovém vědomí. Jsou to měřitelné
behaviorální vlastnosti, které se objevují, když agenti pracují v plném rámci
NABLA–Trinity–NM/ND. Platforma v době zápisu uváděla „fitness“ 0,9995 napříč 11 rysy jako
ukazatel téměř dokonalého souladu chování s cílovými profily rysů. Rys „epistemická
pokora“ odpovídá lidskému pojmu, který kniha rozebírá v hesle [Epistemická
pokora](@/glossary/epistemicka-pokora.md).

## Vztah ke stromům supervize

Každý běžící proces agenta existuje ve stromu supervize OTP. Tento vztah není volitelný –
doktrína NO MERCY požaduje, aby žádný GenServer neexistoval bez supervize. Supervize
zajišťuje:

- **automatický restart** – když proces agenta spadne, supervizor jej restartuje s čistým
  stavem;
- **pořadí závislostí** – agenti závislí na jiných agentech se spouštějí ve správném pořadí
  pomocí strategie `rest_for_one`;
- **úklid zdrojů** – při ukončení agenta supervizor zajistí řádné uvolnění zdrojů;
- **eskalaci** – opakované pády se šíří vzhůru a nakonec spustí samoopravu na vyšších
  úrovních.

Modul PrismaticSupervisor poskytuje kompoziční supervizi se spouštěním podle závislostí,
takže ekosystém agentů se inicializuje ve správném pořadí se splněnými závislostmi.

## Vzorce komunikace agentů

Agenti komunikují několika vzorci, volenými podle naléhavosti a významu interakce:

| Vzorec | Mechanismus | Latence | Provázanost | Použití |
|---------|-----------|---------|----------|----------|
| **Přímé volání** | GenServer.call/3 | synchronní | vysoká | kontroly oprávnění, dotazy na stav |
| **Asynchronní zpráva** | GenServer.cast/2 | asynchronní | nízká | oznámení událostí, zjištění |
| **PubSub** | Phoenix.PubSub | vysílání | žádná | výstrahy pro celou platformu, telemetrie |
| **Registr** | vyhledání v Registry | synchronní | střední | dynamické vyhledání agentů |
| **Proces** | Broadway/GenStage | řízený poptávkou | nízká | řetězce zpracování dat |

```elixir
defmodule PrismaticAgents.Communication do
  @moduledoc """
  Agent communication primitives. Provides typed message
  passing between agents with provenance tracking.
  """

  @type finding :: %{
    source_agent: String.t(),
    timestamp: DateTime.t(),
    confidence: float(),
    payload: term()
  }

  @spec publish_finding(finding()) :: :ok
  def publish_finding(finding) do
    Phoenix.PubSub.broadcast(
      PrismaticWeb.PubSub,
      "agent:findings:#{finding.source_agent}",
      {:agent_finding, finding}
    )
  end

  @spec request_analysis(pid(), term(), timeout()) ::
          {:ok, term()} | {:error, term()}
  def request_analysis(agent_pid, request, timeout \\ 5_000) do
    GenServer.call(agent_pid, {:analyze, request}, timeout)
  end
end
```
## Integrace s Color Teams

[Color Teams](@/glossary/color-teams.md) představují nejpropracovanější vzorec koordinace
agentů na platformě: 20 agentů v 6 týmech v nepřetržité adversariálně-obranné syntéze.
Každý tým působí jako koordinovaná jednotka pod svým velitelem L3; komunikace mezi týmy
prochází syntetizačním uzlem Purple Teamu:

- **[Gray Team](@/glossary/gray-team.md)** (3 agenti) – průzkum hranic, hledání okrajových
  případů;
- **[Red Team](@/glossary/red-team.md)** (4 agenti) – adversariální simulace, generování
  útočných scénářů;
- **[Blue Team](@/glossary/blue-team.md)** (4 agenti) – obranný postoj, slučování signálů,
  detekce posunu;
- **[Purple Team](@/glossary/purple-team.md)** (4 agenti) – uzavírání smyčky Red–Blue,
  sledování regresí;
- **[White Team](@/glossary/white-team.md)** (3 agenti) – formální ověřování, validace
  kontraktů;
- **[Black Team](@/glossary/black-team.md)** (2 agenti) – teoretické modelování hrozeb
  (maximální izolace).

Struktura ukazuje, že agenti nejsou jen jednotlivými aktéry, ale účastníky koordinovaných
kampaní s definovanými toky signálů, smyčkami zpětné vazby a podmínkami uzavření.

## Osvědčené postupy

1. **Definovat před implementací:** vždy nejprve vytvořit specifikaci `.agent.md`, teprve
   pak psát kód agenta. Specifikace nutí výslovně promyslet oprávnění, rozsah a rozhraní.
   Agent bez specifikace je proces bez kontraktu.
2. **Respektovat systém úrovní:** nikdy neimplementovat schopnosti nad rámec oprávnění
   úrovně. Potřebuje-li agent operace s vyšším oprávněním, musí o ně požádat agenta vyšší
   úrovně řádnou cestou.
3. **Vysílat telemetrii:** každý agent má vysílat telemetrické události o klíčových
   operacích. To umožňuje pozorovatelnost celé platformy a podporuje sledování strážcem
   minimální kvality.
4. **Obsloužit všechny zprávy:** agenti musí obsloužit všechny možné zprávy své domény.
   Neobsloužené zprávy způsobují pády, které se šíří stromem supervize. Na nečekané zprávy
   slouží zachycující klauzule s odpovídajícím logováním.
5. **Udržovat původ:** každý výstup agenta musí nést metadata o původu – který agent jej
   vytvořil, kdy, s jakou důvěrou a z jakých vstupů. Tím je splněn axiom NABLA o povinném
   původu.

## Související pojmy

Bez vlastního hesla v glosáři knihy: *Supervisor* (chování OTP řídící životní cyklus
procesů agentů), *Consciousness Traits* (emergentní behaviorální vlastnosti agentů L5),
*Process Isolation* (paměťová izolace umožňující nezávislý provoz agentů), *Self-Healing*
(systém zotavení), *Dynamic Supervisor*, *GenServer* a *Fitness Score* (evoluční metrika
účinnosti agentů).

## Související

**Platforma**

- [AIAD](@/glossary/aiad.md) – standard specifikací agentů a požadavků na soulad.
- [Agent Registry](@/glossary/agent-registry.md) – centrální index všech agentů platformy.
- [Agent Tier](@/glossary/agent-tier.md) – systém klasifikace úrovní oprávnění.
- [Trinity Gate](@/glossary/trinity-gate.md) – ověřovací systém výstupů agentů.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – epistemický rámec utváření přesvědčení
  agentů.
- [Color Teams](@/glossary/color-teams.md) – týmy bezpečnostních agentů.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – proces zpracování, v němž agenti
  působí.

**Kompendium**

- [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md) – agenti platformy
  v obranných úlohách knihy.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: agent](@/kompendium/glossary-bridges/bridge-agent.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
