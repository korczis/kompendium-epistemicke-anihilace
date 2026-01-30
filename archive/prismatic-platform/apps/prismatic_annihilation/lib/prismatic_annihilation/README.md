# lib/prismatic_annihilation/ -- Core Modules

> Parent: [lib/](../README.md) | Project: [apps/prismatic_annihilation/](../../README.md)

---

## Overview

Core runtime modules for the epistemic defense system. Each module has a single clear responsibility within the OTP supervision tree.

---

## Module Reference

### Application and Infrastructure

| Module | File | Role |
|--------|------|------|
| `Application` | `application.ex` | OTP app, supervision tree startup, engine pool |
| `TechniqueCache` | `technique_cache.ex` | ETS cache with TTL, O(1) lookup, periodic cleanup |
| `CompendiumLoader` | `compendium_loader.ex` | Loads `priv/data/` JSON into runtime state |
| `TelemetryHandler` | `telemetry_handler.ex` | Emits `:telemetry` events for detection metrics |

### Detection and Analysis

| Module | File | Role |
|--------|------|------|
| `Taxonomy` | `taxonomy.ex` | GenServer managing all 178 technique definitions |
| `DefensiveCoordinator` | `defensive_coordinator.ex` | GenServer for real-time threat coordination |

### Defense

| Module | File | Role |
|--------|------|------|
| `Defense` | `defense.ex` | Countermeasure generation, deployment, 40+ strategies |

### Health Assessment

| Module | File | Role |
|--------|------|------|
| `HealthAssessor` | `health_assessor.ex` | 5-dimension epistemic health evaluation |

### Integration Bridges

| Module | File | Role |
|--------|------|------|
| `TrinityBridge` | `trinity_bridge.ex` | NABLA Trinity Gate Layer 4 extension |
| `EvilBridge` | `evil_bridge.ex` | PrismaticEvil dark epistemic correlation |

---

## Module Details

### Taxonomy (GenServer)

Manages 178 technique definitions loaded from hardcoded data merged with JSON.

```elixir
# Client API
Taxonomy.all()                    # => [%{id: :epistemic_imploze, ...}, ...]
Taxonomy.by_category(:singularity) # Filter by category
Taxonomy.by_chapter(6)            # Filter by chapter (1-15)
Taxonomy.get(:epistemic_imploze)  # Lookup by ID (atom or string)
Taxonomy.search("paralysis")     # Full-text search
Taxonomy.by_severity(:critical)  # Filter by severity
Taxonomy.count()                 # => 178
Taxonomy.category_stats()        # Category breakdown with severity distribution
```

**State**: `%{techniques: [technique()]}` loaded at init, merging hardcoded definitions with TaxonomyServer JSON data.

### Defense

Generates and deploys defensive countermeasures mapped to detected techniques.

```elixir
# Generate prioritized strategies from detections
{:ok, strategies} = Defense.generate_strategy(detections, priority: :protection)

# Deploy countermeasures
{:ok, result} = Defense.deploy(strategies, :simulate)
{:ok, result} = Defense.deploy(strategies, :active, timeout: 30_000)

# Get defenses for a specific technique
strategies = Defense.for_technique(:epistemic_imploze)

# List all 40+ available countermeasures
countermeasures = Defense.available_countermeasures()
```

**Defense Categories**:

| Attack Category | Primary Defense | Secondary Defense |
|-----------------|-----------------|-------------------|
| Singularity | External anchoring | Compartmentalization |
| Metatranscendental | Pragmatic grounding | Type hierarchy |
| Hypertransformative | Immune restoration | Boundary reinforcement |
| Paradoxical | Metalanguage separation | Oscillation breaking |
| Transconceptual | Diversity cultivation | Flexibility exercises |

### HealthAssessor

Evaluates epistemic resilience across 5 weighted dimensions.

```elixir
{:ok, assessment} = HealthAssessor.assess(knowledge_base, depth: :comprehensive)
# => %{overall_score: 0.72, status: :good, dimensions: ..., vulnerabilities: [...]}

{:ok, score} = HealthAssessor.quick_check(knowledge_base)
# => 0.72

{:ok, profile} = HealthAssessor.vulnerability_profile(knowledge_base)
# => %{most_vulnerable_to: [...], overall_resilience: 0.72}
```

**Dimensions** (weighted):

| Dimension | Weight | Assesses |
|-----------|--------|----------|
| Structural Resilience | 25% | Graph robustness, redundancy, concentration risk |
| Logical Coherence | 25% | Contradiction count, logical structure markers |
| Source Diversity | 20% | Source count, independence score |
| Temporal Integrity | 15% | Timestamps, recency |
| Meta-Epistemic Awareness | 15% | Uncertainty markers, provenance, self-model |

### TrinityBridge

Extends NABLA's 3-layer Trinity Gate with annihilation detection as Layer 4.

```elixir
result = TrinityBridge.validate(content, threshold: 0.8)
# {:passed, %{layer1: ..., layer2: ..., layer3: ..., layer4: ...}}
# {:blocked, :layer4, :annihilation_detected, %{severity: :critical, ...}}
```

**Layer Architecture**:
1. Structural Consistency (Graph Theory)
2. Logical Consistency (Rule-Based)
3. Formal Necessity (Modal Logic)
4. **Annihilation Detection** (this module)

### EvilBridge

Correlates annihilation detections with PrismaticEvil dark epistemic patterns.

```elixir
{:ok, correlation} = EvilBridge.correlate(detections)
# => %{synergy_score: 0.75, combined_severity: :critical, threat_vectors: [...]}

{:ok, cross_ref} = EvilBridge.cross_reference(:epistemic_imploze)
# => %{related_evil_techniques: [:epistemic_closure, :reality_manipulation, ...]}
```

### TechniqueCache

ETS-backed cache with configurable TTL (default 1 hour) and periodic cleanup.

```elixir
TechniqueCache.put(:epistemic_imploze, :patterns, compiled_patterns)
{:ok, patterns} = TechniqueCache.get(:epistemic_imploze, :patterns)
# => {:ok, compiled_patterns}  or  :miss

TechniqueCache.invalidate_technique(:epistemic_imploze)
TechniqueCache.stats()
# => %{size: 42, memory_bytes: 8192, table_name: :prismatic_annihilation_technique_cache}
```

### DefensiveCoordinator

GenServer managing active defense state with threat-level escalation.

```elixir
{:ok, ref} = DefensiveCoordinator.activate_defense(:singularity, [])
DefensiveCoordinator.set_threat_level(:elevated)
status = DefensiveCoordinator.status()
# => %{threat_level: :elevated, active_defense_count: 1, ...}
DefensiveCoordinator.deactivate_defense(ref)
```

**Threat Levels**: `:minimal | :low | :elevated | :high | :critical`

---

## Subdirectories

| Directory | Contents | README |
|-----------|----------|--------|
| [compendium/](compendium/README.md) | ETL pipeline: Extractor, Transformer, Generator, Parser, TaxonomyServer | Full pipeline docs |
| [taxonomy/](taxonomy/README.md) | Chapter 6 expansion techniques | Extension docs |
| [patterns/](patterns/README.md) | PatternBehaviour, PatternCompiler, 4 category modules | Detection pattern docs |

---

## Navigation

| Target | Path |
|--------|------|
| Parent (lib/) | [../README.md](../README.md) |
| Project Root | [../../README.md](../../README.md) |
| Compendium Pipeline | [compendium/README.md](compendium/README.md) |
| Detection Patterns | [patterns/README.md](patterns/README.md) |
| Taxonomy Extensions | [taxonomy/README.md](taxonomy/README.md) |
| Data Files | [../../priv/data/README.md](../../priv/data/README.md) |
| Tests | [../../test/README.md](../../test/README.md) |
