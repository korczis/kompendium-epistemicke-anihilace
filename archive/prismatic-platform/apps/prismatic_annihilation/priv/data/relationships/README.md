# priv/data/relationships/ -- Cross-Reference and Relationship Graphs

> Parent: [priv/data/](../README.md) | Project: [apps/prismatic_annihilation/](../../../README.md)

---

## Overview

Contains **4 JSON files** defining relationships, hierarchies, and networks between techniques. These files enable graph-based analysis of technique interactions and cascading effects.

---

## Files

### category_hierarchy.json

Defines the hierarchical organization of technique categories and subcategories.

```json
{
  "hierarchy": {
    "epistemic_destruction": {
      "subcategories": ["collapse_patterns", "implosion_patterns", "sterility_patterns"],
      "parent": null,
      "severity_range": ["high", "terminal"]
    },
    "cognitive_destruction": {
      "subcategories": ["paralysis_patterns", "fragmentation_patterns"],
      "parent": null,
      "severity_range": ["medium", "critical"]
    }
  }
}
```

**Usage**: Category navigation, hierarchical filtering, taxonomy visualization.

---

### cooccurrence_matrix.json

Records which techniques frequently co-occur in detected attack patterns.

```json
{
  "matrix": {
    "EA-105-epistemicka-imploze": {
      "EA-115-epistemicka-cerna-dira": 0.85,
      "EA-109-epistemicka-singularita": 0.78,
      "EA-103-epistemicka-fragmentace": 0.65
    }
  }
}
```

**Usage**: Attack chain detection, combinatorial threat assessment, predictive defense.

---

### cross_references.json

Maps technique-to-technique cross-references extracted from the "Viz take" (See also) sections of the original compendium.

```json
{
  "references": {
    "epistemicka-imploze": [
      "epistemicka-cerna-dira",
      "kognitivni-singularita",
      "informacni-gravitacni-kolaps"
    ]
  }
}
```

**Usage**: `TaxonomyServer.cross_references/1`, technique exploration, related content discovery.

---

### severity_network.json

Defines severity relationships and escalation paths between techniques.

```json
{
  "network": {
    "escalation_paths": [
      {
        "from": "epistemic_fragmentation",
        "to": "epistemic_implosion",
        "probability": 0.6,
        "conditions": ["sustained_attack", "no_defense"]
      }
    ],
    "severity_connections": [
      {
        "technique": "EA-105",
        "can_escalate_to": ["EA-115", "EA-109"],
        "can_be_triggered_by": ["EA-103", "EA-100"]
      }
    ]
  }
}
```

**Usage**: Escalation prediction, cascading defense planning, threat trajectory modeling.

---

## Graph Operations

These files support graph-based analysis via the `libgraph` dependency:

```elixir
# Build technique relationship graph
{:ok, cross_refs} = File.read("priv/data/relationships/cross_references.json")
{:ok, data} = Jason.decode(cross_refs)

graph =
  data["references"]
  |> Enum.reduce(Graph.new(), fn {source, targets}, g ->
    Enum.reduce(targets, g, fn target, g ->
      Graph.add_edge(g, source, target)
    end)
  end)

# Find connected components
components = Graph.components(graph)

# Find shortest path between techniques
path = Graph.shortest_path(graph, "epistemicka-imploze", "epistemicka-cerna-dira")
```

---

## Navigation

| Target | Path |
|--------|------|
| Parent (priv/data/) | [../README.md](../README.md) |
| Project Root | [../../../README.md](../../../README.md) |
| Taxonomy Files | [../taxonomy/README.md](../taxonomy/README.md) |
| Pattern Files | [../patterns/README.md](../patterns/README.md) |
| Schemas | [../schemas/README.md](../schemas/README.md) |
| Pipeline Code | [../../../lib/prismatic_annihilation/compendium/README.md](../../../lib/prismatic_annihilation/compendium/README.md) |

---

**CONFIDENTIAL AND PROPRIETARY**
*Property of Prismatic Platform. Unauthorized distribution prohibited.*

[GHL License](../../../../../docs/ghl/README.md)
