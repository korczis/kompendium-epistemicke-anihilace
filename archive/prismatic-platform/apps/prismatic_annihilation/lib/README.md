# lib/ -- Source Code

> Parent: [apps/prismatic_annihilation/](../README.md)

---

## Overview

All Elixir source code for the Prismatic Annihilation epistemic defense system. The code is organized into the main API facade module and a hierarchy of specialized subsystems.

---

## Structure

```
lib/
|-- prismatic_annihilation.ex           # Main API facade (detect, analyze, defend)
|-- mix/
|   +-- tasks/
|       +-- compendium_extract.ex       # mix compendium.extract task
+-- prismatic_annihilation/
    |-- application.ex                  # OTP Application + supervision tree
    |-- taxonomy.ex                     # Technique taxonomy GenServer (178 techniques)
    |-- defense.ex                      # Countermeasure system (40+ strategies)
    |-- defensive_coordinator.ex        # Real-time defense coordination
    |-- health_assessor.ex              # 5-dimension health assessment
    |-- technique_cache.ex              # ETS cache (O(1) lookup, TTL expiry)
    |-- compendium_loader.ex            # priv/data/ loader
    |-- trinity_bridge.ex               # NABLA Trinity Gate Layer 4
    |-- evil_bridge.ex                  # PrismaticEvil correlation bridge
    |-- telemetry_handler.ex            # Telemetry event handling
    |-- compendium/                     # ETL pipeline subsystem
    |-- taxonomy/                       # Extended taxonomy definitions
    +-- patterns/                       # Detection pattern modules
```

---

## Key Modules

### `PrismaticAnnihilation` (Main Facade)

The single entry point for all detection, analysis, and defense operations.

```elixir
# Public API surface
PrismaticAnnihilation.detect(content, opts)           # Quick scan, <100ms target
PrismaticAnnihilation.analyze(content, opts)           # Deep analysis with Trinity
PrismaticAnnihilation.defend(detections, context)      # Generate countermeasures
PrismaticAnnihilation.deploy_defenses(defenses, opts)  # Active/simulate deployment
PrismaticAnnihilation.monitor_stream(stream, callback) # Real-time monitoring
PrismaticAnnihilation.assess_health(knowledge_base)    # Health assessment
PrismaticAnnihilation.taxonomy()                       # All 178 techniques
PrismaticAnnihilation.trinity_validate(content)        # Layer 4 validation
PrismaticAnnihilation.correlate_with_evil(detections)  # Evil correlation
```

### `PrismaticAnnihilation.Application`

OTP Application managing the full supervision tree. See the [root README](../README.md) for the tree diagram.

### Subsystem Directories

| Directory | Purpose | Guide |
|-----------|---------|-------|
| [compendium/](prismatic_annihilation/compendium/README.md) | ETL pipeline: extract from Garden, transform, generate JSON | 10 modules |
| [taxonomy/](prismatic_annihilation/taxonomy/README.md) | Extended taxonomy definitions (Chapter 6 expansion) | 1 module |
| [patterns/](prismatic_annihilation/patterns/README.md) | Detection pattern modules with behaviour, compiler, 4 category modules | 6 modules |

---

## Mix Tasks

### `mix compendium.extract`

Runs the full ETL pipeline to extract, transform, and generate technique JSON from Garden sources.

```bash
mix compendium.extract                   # Full pipeline
mix compendium.extract --stage extract   # Extract only
mix compendium.extract --stage transform # Transform only
mix compendium.extract --validate        # Validate existing data
```

---

## Type System

Core types defined in the main module:

| Type | Description |
|------|-------------|
| `detection()` | Identified technique with confidence, severity, evidence, location |
| `category()` | One of 10 technique categories |
| `severity()` | `:low \| :medium \| :high \| :critical \| :terminal` |
| `evidence()` | Supporting evidence with type, weight, source |
| `analysis_result()` | Full analysis with Trinity validation and defenses |
| `defense_strategy()` | Countermeasure with effectiveness, priority, resources |

---

## Navigation

| Target | Path |
|--------|------|
| Project Root | [../README.md](../README.md) |
| Core Modules | [prismatic_annihilation/README.md](prismatic_annihilation/README.md) |
| Compendium Pipeline | [prismatic_annihilation/compendium/README.md](prismatic_annihilation/compendium/README.md) |
| Detection Patterns | [prismatic_annihilation/patterns/README.md](prismatic_annihilation/patterns/README.md) |
| Data Files | [../priv/data/README.md](../priv/data/README.md) |
| Tests | [../test/README.md](../test/README.md) |

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](/developers/) | [Architecture](/architecture/) | [Meet the Creator](/about/author/)
