# taxonomy/ -- Extended Taxonomy Definitions

> Parent: [lib/prismatic_annihilation/](../README.md) | Project: [apps/prismatic_annihilation/](../../../README.md)

---

## Overview

Contains extended taxonomy definitions that supplement the core `Taxonomy` GenServer. Currently holds the Chapter 6 expansion module which defines additional techniques beyond the original 150.

---

## Modules

### Chapter6Expansion

**`chapter6_expansion.ex`** -- Defines expanded techniques for Chapter 6 (Epistemic Singularity).

Chapter 6 covers techniques 1-30 in the singularity category. This expansion module adds supplementary technique definitions that were identified through extended research beyond the original compendium.

---

## How It Fits

```
Taxonomy GenServer (taxonomy.ex)
    |
    +-- Hardcoded techniques (build_taxonomy/0)
    |       |-- singularity_techniques/0       (Chapter 6 core)
    |       |-- metatranscendental_techniques/0 (Chapter 7)
    |       |-- hypertransformative_techniques/0 (Chapter 8)
    |       |-- paradoxical_techniques/0        (Chapter 9)
    |       |-- transconceptual_techniques/0    (Chapter 10)
    |       +-- supporting categories           (Chapters 1-5, 11-15)
    |
    +-- JSON techniques (TaxonomyServer)
    |       +-- priv/data/taxonomy/ (178 JSON files)
    |
    +-- Extended definitions (this directory)
            +-- chapter6_expansion.ex
```

The `Taxonomy` GenServer merges hardcoded techniques with JSON-loaded techniques at init time. Extended definitions from this directory provide additional granularity for specific chapters.

---

## Adding New Extensions

To add technique definitions for other chapters:

1. Create a new module file (e.g., `chapter7_expansion.ex`)
2. Define techniques as maps matching the `Taxonomy.technique()` type
3. Expose them via a public function (e.g., `techniques/0`)
4. Wire into `Taxonomy.build_taxonomy/0` if needed

```elixir
defmodule PrismaticAnnihilation.Taxonomy.Chapter7Expansion do
  @moduledoc "Extended Chapter 7 (Metatranscendental) techniques."

  def techniques do
    [
      %{
        id: :extended_technique_name,
        name: "Extended Technique Name",
        name_cz: "Rozsirena technika",
        category: :metatranscendental,
        chapter: 7,
        technique_number: 200,
        severity: :critical,
        reversibility: :difficult,
        temporal_course: "progressive",
        typical_manifestations: ["manifestation1"],
        defense_strategies: ["strategy1"],
        description: "Description of the technique.",
        detailed_principle: "Underlying principle.",
        example: "Concrete example.",
        see_also: [:related_technique],
        detection_patterns: ["pattern1", "pattern2"]
      }
    ]
  end
end
```

---

## Navigation

| Target | Path |
|--------|------|
| Parent | [../README.md](../README.md) |
| Project Root | [../../../README.md](../../../README.md) |
| Core Taxonomy (GenServer) | `../taxonomy.ex` |
| Taxonomy Data (JSON) | [../../../priv/data/taxonomy/README.md](../../../priv/data/taxonomy/README.md) |
| Compendium Pipeline | [../compendium/README.md](../compendium/README.md) |
| Detection Patterns | [../patterns/README.md](../patterns/README.md) |
