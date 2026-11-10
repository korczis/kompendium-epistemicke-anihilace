+++
title = "AIAD"
weight = 11
description = "AI-Agent Interface Definition – standard Prismatic Platform pro definice agentů: úroveň oprávnění, schopnosti, vstupy a výstupy, povinný blok vynucení doktríny."

[taxonomies]
tags = ["glossary", "agents", "aiad", "prismatic", "architecture"]

[extra]
category = "agents"
abbreviation = "AIAD"
related_terms = ["agent-tier", "agent-registry", "nm-nd", "archer-supreme", "ollama", "3nl", "agent", "openapi", "pvm", "rbac", "strategic-command", "supreme-commander", "tactical-execution", "three-nl"]
author = "Tomas Korcak (korczis)"
reading_time = "8 min"
date_created = "2026-02-23"
date_modified = "2026-11-10"
keywords = ["AIAD", "AI-Agent", "Interface", "Definition", "glosář", "agenti", "Prismatic Platform"]
quality_score = 77
see_also = ["capabilities", "architecture", "agents"]
image = "/images/sections/glossary.png"
image_alt = "AIAD – Prismatic Platform"
+++

## Definice a přehled

**AIAD** (*AI-Agent Interface Definition*) je standardizovaný formát specifikace pro
definování agentů umělé inteligence v Prismatic Platform. Každá definice AIAD deklaruje
úroveň oprávnění agenta (L1–L5), jeho schopnosti, kontrakty vstupů a výstupů, bloky
vynucení (včetně povinného souladu s doktrínou [NM/ND](@/glossary/nm-nd.md)) a provozní
omezení. Standard pokrývá agenty, příkazy, procesy (*pipelines*), politiky a adaptéry
a vytváří jednotnou vrstvu správy nad všemi autonomními součástmi.

Standard vznikl z potřeby řídit stále složitější ekosystém agentů, kteří působí v oblastech
bezpečnosti, zpravodajství, kvality a infrastruktury. Bez jednotného formátu specifikace by
se s růstem platformy zhoršovala spolupráce agentů, jejich dohledatelnost i správa. AIAD to
řeší jediným strojově čitelným formátem kontraktu, který musí splnit každá autonomní
součást.

V jádru je AIAD jazykem pro definici rozhraní (IDL) stavěným pro ekosystémy agentů. Tam,
kde OpenAPI definuje kontrakty REST API a Protocol Buffers rozhraní RPC, definuje AIAD
behaviorální kontrakty, hranice oprávnění a požadavky na soulad s doktrínou u autonomních
agentů. Tím se stává páteří správy celého ekosystému agentů platformy.

**Vztah ke knize:** AIAD patří do kontextu platformy, z níž Kompendium vzešlo. V knize se
s ním setkáte v oddílu [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md),
který popisuje, jak agenti platformy využívají taxonomii EA k obraně – například při
[orchestraci Archer Supreme](@/kompendium/aiad-integration/archer-supreme-ea-orchestration.md)
nebo při [ověřování zdrojů OSINT](@/kompendium/aiad-integration/osint-ea-source-validation.md).

## Technický rozbor

### Formát specifikace

Každá definice AIAD je soubor Markdown se strukturovanou hlavičkou YAML a volně psaným
tělem dokumentace. Konvence přípon je `.agent.md` pro agenty, `.md` pro příkazy,
`.pipeline.md` pro procesy, `.policy.md` pro politiky a `.adapter.md` pro adaptéry.

Hlavička YAML se řídí přísným schématem:

```yaml
# .aiad/agents/example-agent.agent.md
agent-spec:
  id: "example-agent"
  name: "Example Agent"
  version: "1.0.0"
  classification: "L2-TACTICAL"
  domain: "quality"
  authority:
    level: 2
    scope: ["quality-analysis", "code-review"]
    override: []
  capabilities:
    - "static-analysis"
    - "pattern-detection"
    - "recommendation-generation"
  inputs:
    - type: "source-code"
      format: "elixir"
    - type: "configuration"
      format: "yaml"
  outputs:
    - type: "quality-report"
      format: "json"
    - type: "recommendation-list"
      format: "markdown"
  enforcement:
    doctrine: "no-mercy-no-doubts"
    version: "2.0.0"
    compliance: mandatory
  dependencies:
    - "credo"
    - "dialyzer"
  telemetry:
    events: ["scan_started", "scan_completed", "violation_detected"]
```

### Systém klasifikace oprávnění

AIAD definuje pětistupňovou hierarchii oprávnění, která určuje, k jakým zdrojům a operacím
má každý agent přístup (viz [Agent Tier](@/glossary/agent-tier.md)):

| Úroveň | Klasifikace | Rozsah oprávnění | Možnost přepsání | Příklady agentů |
|-------|---------------|-----------------|--------------------|----|
| L1 | Basic | čtení v jedné doméně | žádná | sběrače dat, formátovače |
| L2 | Tactical | čtení i zápis v jedné doméně | žádná | analyzátory, specialisté |
| L3 | Strategic | koordinace více domén | agenti L1–L2 | velitelé týmů, koordinátoři |
| L4 | Command | oprávnění napříč doménami | agenti L1–L3 | architekti domén, eskalační agenti |
| L5 | Supreme | neomezený přístup k platformě | všichni agenti | [Archer Supreme](@/glossary/archer-supreme.md), [Supreme Commander](@/glossary/supreme-commander.md) |

Každá úroveň dědí všechny schopnosti nižších úrovní. Agent L3 může ve svém rozsahu provést
jakoukoli operaci dostupnou agentům L1 a L2 a navíc koordinovat více domén.

### Typy součástí

AIAD řídí pět odlišných typů součástí platformy (počty jsou stav v době zápisu):

| Součást | Vzor souboru | Účel | Počet |
|-----------|-------------|---------|-------|
| Agenti | `*.agent.md` | autonomní provozní jednotky | 404+ |
| Příkazy | `*.md` | operace, které může vyvolat uživatel | 210+ |
| Procesy | `*.pipeline.md` | vícekrokové pracovní postupy | 40+ |
| Politiky | `*.policy.md` | pravidla správy a vynucení | 25+ |
| Adaptéry | `*.adapter.md` | integrační rozhraní | 15+ |

### Blok vynucení

Každá součást AIAD musí obsahovat povinný blok vynucení, který deklaruje soulad s [doktrínou
NM/ND](@/glossary/nm-nd.md):

```yaml
enforcement:
  doctrine: "no-mercy-no-doubts"
  version: "2.0.0"
  compliance: mandatory
```

Součásti bez tohoto bloku indexer AIAD odmítne a nelze je zapsat do [Agent
Registry](@/glossary/agent-registry.md). Tím je zajištěno, že každá autonomní součást
platformy pracuje podle stejných standardů kvality a provádění.

## Architektura a implementace

### Systém indexace

Nástroje AIAD poskytují automatické vyhledání a indexaci:

```bash
# Indexace všech součástí AIAD
./.aiad/bin/aiad index

# Výstup: prochází strom adresáře .aiad/
# - najde všechny *.agent.md, *.md, *.pipeline.md, *.policy.md, *.adapter.md
# - ověří soulad hlavičky YAML se schématem
# - zkontroluje přítomnost bloku vynucení
# - vytvoří záznamy registru
# - ohlásí chyby validace
```

Indexer vytváří strojově čitelný registr, který spotřebovává běhový systém agentů
v aplikaci `prismatic_agents`. To umožňuje dynamické vyhledávání agentů, směrování podle
schopností a ověřování oprávnění za běhu.

### Struktura adresářů

```
.aiad/
  agents/           # 404+ definic agentů
    archer-supreme.agent.md
    blue-commander.agent.md
    elixir-architect.agent.md
    ...
  commands/          # 210+ definic příkazů
    orchestrate.md
    investigate.md
    ...
  pipelines/         # definice pracovních procesů
    quality-gate.pipeline.md
    ...
  policies/          # pravidla správy
    no-mercy-no-doubts-enforcement.policy.md
    elixir-best-practices.policy.md
    ...
  adapters/          # integrační rozhraní
    ollama.adapter.md
    ...
  doctrine/          # základní principy
    no-mercy-no-doubts.doctrine.md
    addiction-preservation.doctrine.md
    nabla-infinity.doctrine.md
  guides/            # integrační příručky
    AIAD-MASTER-GUIDE.md
    ...
  hooks/             # háčky životního cyklu
    mandatory-evolution.hook.yaml
  bin/               # spustitelné nástroje
    aiad              # hlavní nástroj příkazové řádky
```

### Integrace za běhu

Za běhu načítá definice AIAD aplikace `PrismaticAgents` a ukládá je do mezipaměti ETS pro
vyhledání v čase O(1):

```elixir
defmodule PrismaticAgents.Registry do
  @moduledoc """
  Runtime registry for AIAD agent definitions.
  Provides O(1) lookup by agent ID, domain, or capability.
  """

  def lookup(agent_id) do
    case :ets.lookup(@table, agent_id) do
      [{^agent_id, definition}] -> {:ok, definition}
      [] -> {:error, :not_found}
    end
  end

  def find_by_capability(capability) do
    :ets.match_object(@table, {:_, %{capabilities: :"$1"}})
    |> Enum.filter(fn {_, def} -> capability in def.capabilities end)
  end

  def find_by_authority(min_level) do
    :ets.foldl(fn {id, def}, acc ->
      if def.authority.level >= min_level, do: [{id, def} | acc], else: acc
    end, [], @table)
  end
end
```

### Validační proces

Definice AIAD procházejí před registrací vícestupňovou validací:

1. **Validace schématu** – hlavička YAML odpovídá specifikaci schématu AIAD.
2. **Konzistence oprávnění** – cíle přepsání mají nižší úroveň než agent sám.
3. **Přítomnost vynucení** – blok vynucení NM/ND existuje ve správné verzi.
4. **Řešení závislostí** – všechny deklarované závislosti existují jako registrované
   součásti.
5. **Jedinečnost schopností** – žádná schopnost není v konfliktu s již registrovanými agenty.
6. **Úplnost dokumentace** – tělo v Markdownu splňuje minimální standard dokumentace.

## Použití v Prismatic Platform

Platforma v době zápisu provozovala 404+ agentů splňujících AIAD ve 14 doménách; výběr:

| Doména | Počet agentů | Klíčoví agenti |
|--------|------------|------------|
| Kvalita | 45+ | quality-guardian, credo-enforcer, dialyzer-validator |
| Bezpečnost | 40+ | red-commander, blue-commander, purple-coordinator |
| Zpravodajství | 35+ | osint-coordinator, entity-resolver, threat-analyst |
| Infrastruktura | 30+ | deployment-coordinator, health-monitor, auto-healer |
| Úložiště | 25+ | storage-orchestrator, adapter-validator, migration-manager |
| Evoluce | 20+ | auto-evolver, fitness-evaluator, consciousness-tracker |
| EASM | 15+ | perimeter-scanner, rating-calculator, compliance-assessor |
| API | 10+ | api-scanner, endpoint-validator, spec-generator |

Bezpečnostní agenti odpovídají týmům [Color Teams](@/glossary/color-teams.md);
zpravodajští agenti pracují s [OSINT](@/glossary/osint.md) a s [Entity
Resolution](@/glossary/entity-resolution.md); agenti EASM s [External Attack Surface
Management](@/glossary/easm.md).

### Vyvolání agentů

Agenti se vyvolávají přes systém příkazů nebo programově:

```bash
# Přes systém příkazů
/archer-supreme --mission=crisis-resolution --target=quality-degradation

# Přes orchestraci
/orchestrate --agents=quality-guardian,credo-enforcer --task=full-audit
```

```elixir
# Programové vyvolání
{:ok, result} = PrismaticAgents.invoke("quality-guardian", %{
  task: :full_audit,
  scope: :all_apps,
  enforcement: :strict
})
```

### Vytváření nových agentů

Standard AIAD poskytuje postup vytváření agentů ze šablony:

```bash
# Vygenerování kostry agenta
./.aiad/bin/aiad new agent my-new-agent --domain=quality --level=2

# Vytvoří: .aiad/agents/my-new-agent.agent.md
# - předvyplněnou hlavičku YAML se strukturou podle schématu
# - blok vynucení NM/ND
# - šablonu dokumentace s povinnými oddíly
# - zástupné deklarace schopností
```

## Příklady kódu

### Programové čtení definice AIAD

```elixir
defmodule PrismaticAgents.Definition do
  @moduledoc """
  Parses and validates AIAD agent definitions.
  """

  @spec parse(String.t()) :: {:ok, map()} | {:error, term()}
  def parse(file_path) do
    with {:ok, content} <- File.read(file_path),
         {:ok, frontmatter, body} <- extract_frontmatter(content),
         {:ok, spec} <- validate_schema(frontmatter),
         :ok <- validate_enforcement(spec) do
      {:ok, %{spec: spec, documentation: body, source: file_path}}
    end
  end

  defp validate_enforcement(%{"enforcement" => %{"doctrine" => "no-mercy-no-doubts"}}), do: :ok
  defp validate_enforcement(_), do: {:error, :missing_enforcement_block}
end
```

### Kontrola oprávnění

```elixir
defmodule PrismaticAgents.Authority do
  @moduledoc """
  Validates agent authority for requested operations.
  """

  @spec authorized?(map(), atom()) :: boolean()
  def authorized?(agent_def, operation) do
    required_level = operation_authority(operation)
    agent_def.authority.level >= required_level
  end

  defp operation_authority(:read), do: 1
  defp operation_authority(:write), do: 2
  defp operation_authority(:coordinate), do: 3
  defp operation_authority(:override), do: 4
  defp operation_authority(:supreme), do: 5
end
```

## Osvědčené postupy

1. **Začínat na nejnižší úrovni oprávnění** – noví agenti mají začínat na L1 nebo L2
   a povyšovat se jen tehdy, když je vyšší oprávnění prokazatelně nutné.
2. **Deklarovat schopnosti přesně** – široké deklarace vedou k nejednoznačnému směrování.
   Je třeba konkrétně uvést, co každý agent umí.
3. **Dokumentovat vztahy přepsání** – může-li agent přepsat jiné, je třeba výslovně popsat,
   za jakých podmínek k tomu dochází.
4. **Verzovat definice** – v definicích AIAD používat sémantické verzování. Zásadní změna
   kontraktu agenta vyžaduje zvýšení hlavní verze.
5. **Testovat proti schématu** – před zapsáním nových nebo změněných definic spustit
   `./aiad/bin/aiad validate`.
6. **Udržovat bloky vynucení aktuální** – při aktualizaci verze doktríny NM/ND musí všechny
   definice AIAD aktualizovat své bloky vynucení.

## Časté chyby

- **Chybějící bloky vynucení** – nejčastější selhání validace AIAD. Každá součást vyžaduje
  blok vynucení NM/ND, bez výjimky.
- **Eskalace oprávnění** – agenti požadují vyšší oprávnění, než jejich klasifikace dovoluje.
  Indexer odmítne agenty L2, kteří si nárokují přepisovací schopnosti L3.
- **Kruhové závislosti** – dva agenti deklarují závislost jeden na druhém. Řešitel
  závislostí cykly odhalí a odmítne.
- **Zastaralé registrace** – změna definice agenta bez opětovného spuštění indexeru. Po
  každé změně je nutné spustit `./.aiad/bin/aiad index`.
- **Překryv schopností** – více agentů deklaruje stejné schopnosti bez jasné priority
  směrování. K rozlišení slouží pole `priority`.

## Související

**Platforma**

- [Agent Registry](@/glossary/agent-registry.md) – centrální katalog všech agentů AIAD.
- [Agent Tier](@/glossary/agent-tier.md) – systém klasifikace oprávnění L1–L5.
- [Agent](@/glossary/agent.md) – obecný pojem agenta na platformě.
- [NM/ND Doctrine](@/glossary/nm-nd.md) – povinný blok vynucení ve všech definicích AIAD.
- [Archer Supreme](@/glossary/archer-supreme.md) – příklad agenta L5 pro řešení krizí.
- [Supreme Commander](@/glossary/supreme-commander.md) – agent L5 pro strategickou
  koordinaci.
- [3NL](@/glossary/3nl.md) – architektonický rámec, jehož strukturu agenti AIAD sledují.

**Kompendium**

- [AIAD integrace a detekce EA](@/kompendium/aiad-integration/_index.md) – jak agenti
  platformy využívají taxonomii knihy k obraně.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: aiad](@/kompendium/glossary-bridges/bridge-aiad.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
