# priv/data/taxonomy/ -- Technique Definition Files

> Parent: [priv/data/](../README.md) | Project: [apps/prismatic_annihilation/](../../../README.md)

---

## Overview

Contains **178 individual JSON files**, each defining one epistemic annihilation technique from the compendium. Files are loaded by the `TaxonomyServer` GenServer at application startup and can be hot-reloaded via `TaxonomyServer.reload/0`.

---

## Naming Convention

Files follow the pattern: `EA-{NNN}-{slugified-czech-name}.json`

```
EA-001-absolutni-axiologicka-neutralizace.json
EA-002-absolutni-axiomaticka-inverze.json
EA-003-absolutni-axiomaticka-transgrediencia.json
...
EA-178-zpochybneni-intencionality.json
```

- **EA** = Epistemic Annihilation (prefix)
- **NNN** = 3-digit sequence number (001-178)
- **slug** = Czech technique name, lowercased, diacritics removed, spaces to hyphens

---

## File Format

Each JSON file conforms to the `technique.schema.json` schema. Example structure:

```json
{
  "id": "EA-105-epistemicka-imploze",
  "name": {
    "cs": "Epistemicka imploze",
    "en": "Epistemic Implosion"
  },
  "category": "epistemic_destruction",
  "subcategory": "collapse_patterns",
  "severity": {
    "level": "critical",
    "score": 0.85
  },
  "reversibility": {
    "level": "very_low",
    "score": 0.15
  },
  "domain": "epistemologie",
  "temporal_profile": "sudden_catastrophic_acceleration",
  "description": {
    "cs": "Dramaticky fenomen nahleheho kolapsu...",
    "en": null
  },
  "example": {
    "cs": "Teoreticky fyzik vyvijejici 'teorii vseho'..."
  },
  "typical_manifestations": [
    "cognitive_singularity",
    "epistemic_compression",
    "knowledge_collapse"
  ],
  "defense_strategies": [
    "epistemic_diversification",
    "cognitive_stabilization",
    "meta_epistemic_anchor"
  ],
  "detection_patterns": [
    "epistemic_gravitational_acceleration",
    "knowledge_horizon_formation",
    "cognitive_supercompression"
  ],
  "cross_references": [
    "epistemicka-cerna-dira",
    "kognitivni-singularita"
  ],
  "page_number": 47,
  "metadata": {
    "anchor": "epistemicka-imploze",
    "source": "primary",
    "extracted_at": "2025-01-15T10:30:00Z"
  }
}
```

---

## Required Fields

Per `technique.schema.json`:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `id` | string | Yes | Pattern: `EA-\d{3}-.+` |
| `name` | object | Yes | `{cs: string, en: string \| null}` |
| `category` | string | Yes | Primary category |
| `severity` | object | Yes | `{level: string, score: number}` |
| `subcategory` | string | No | Subcategory |
| `reversibility` | object | No | `{level: string, score: number}` |
| `description` | object | No | Bilingual description |
| `defense_strategies` | array | No | List of strategy names |
| `detection_patterns` | array | No | Patterns for detection |
| `cross_references` | array | No | Related technique slugs |

---

## Category Distribution

| Category | Count | Example Techniques |
|----------|-------|-------------------|
| Epistemic Destruction | ~45 | Implosion, Black Hole, Sterility, Necrosis |
| Cognitive Destruction | ~35 | Pandemonium, Paralysis, Autokanibalizace |
| Structural Patterns | ~25 | Collapse, Fragmentation, Dezintegrace |
| Axiological/Ontological | ~20 | Annihilation, Nihilismus, Neutralizace |
| Meta-epistemic | ~20 | Meta-cognitive destruction, Rekurzivni dezintegrace |
| Defensive/Therapeutic | ~15 | Reconstruction, Zones, Training strategies |
| Other | ~18 | Mixed category techniques |

---

## Usage at Runtime

```elixir
# TaxonomyServer loads all files at init
TaxonomyServer.count()
# => 178

# Query by category
TaxonomyServer.by_category("epistemic_destruction")

# Lookup by ID
{:ok, technique} = TaxonomyServer.get_technique("EA-105-epistemicka-imploze")

# Search across names and descriptions
results = TaxonomyServer.search("paralysis")
```

---

## Regeneration

```bash
# Regenerate from Garden sources
mix compendium.extract

# Validate existing files against schema
mix compendium.extract --validate
```

---

## Navigation

| Target | Path |
|--------|------|
| Parent (priv/data/) | [../README.md](../README.md) |
| Project Root | [../../../README.md](../../../README.md) |
| Schema Definition | [../schemas/README.md](../schemas/README.md) |
| Detection Patterns | [../patterns/README.md](../patterns/README.md) |
| TaxonomyServer Code | [../../../lib/prismatic_annihilation/compendium/README.md](../../../lib/prismatic_annihilation/compendium/README.md) |
| Relationship Graphs | [../relationships/README.md](../relationships/README.md) |

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](/developers/) | [Architecture](/architecture/) | [Meet the Creator](/about/author/)
