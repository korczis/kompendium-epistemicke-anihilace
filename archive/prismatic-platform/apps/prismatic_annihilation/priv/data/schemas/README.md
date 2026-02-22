# priv/data/schemas/ -- JSON Schema Validation Files

> Parent: [priv/data/](../README.md) | Project: [apps/prismatic_annihilation/](../../../README.md)

---

## Overview

Contains **6 JSON Schema files** (JSON Schema Draft 2020-12) used to validate the structure and content of generated technique data. Used by the Compendium Pipeline validation stage and available for external tooling.

---

## Schema Files

| File | Validates | Key Properties |
|------|-----------|----------------|
| `technique.schema.json` | Individual technique JSON files in `taxonomy/` | `id`, `name`, `category`, `severity`, `reversibility`, `description`, `detection_patterns` |
| `technique_index.schema.json` | The master `technique_index.json` | `total_techniques`, `categories`, `techniques` |
| `detection_patterns.schema.json` | Detection pattern rule files in `patterns/` | `category`, `patterns[]`, `metadata` |
| `pattern_category.schema.json` | Pattern category definitions | Category structure and constraints |
| `relationship_graph.schema.json` | Relationship graph files in `relationships/` | `nodes`, `edges`, `metadata` |
| `severity_network.schema.json` | Severity network file | Severity levels, connections, weights |

---

## Technique Schema Details

`technique.schema.json` is the primary schema. Required fields:

```json
{
  "required": ["id", "name", "category", "severity"],
  "properties": {
    "id": {
      "type": "string",
      "pattern": "^EA-\\d{3}-.+$"
    },
    "name": {
      "type": "object",
      "required": ["cs"],
      "properties": {
        "cs": { "type": "string" },
        "en": { "type": ["string", "null"] }
      }
    },
    "category": { "type": "string" },
    "severity": {
      "type": "object",
      "required": ["level", "score"],
      "properties": {
        "level": {
          "enum": ["extreme", "critical", "high", "medium_high", "medium", "low", "unknown"]
        },
        "score": { "type": "number", "minimum": 0.0, "maximum": 1.0 }
      }
    },
    "reversibility": {
      "type": "object",
      "required": ["level", "score"],
      "properties": {
        "level": {
          "enum": [
            "practically_irreversible", "very_difficult", "difficult",
            "highly_resistant", "moderately_difficult", "partially_reversible",
            "low_reversibility", "irreversible", "very_low", "unknown"
          ]
        },
        "score": { "type": "number", "minimum": 0.0, "maximum": 1.0 }
      }
    }
  }
}
```

---

## Usage in Pipeline

The `Pipeline.validate/1` function uses these schemas to verify data integrity:

```elixir
# Validate all generated data
{:ok, result} = PrismaticAnnihilation.Compendium.Pipeline.validate()
# => %{
#   index_valid: true,
#   total_techniques_in_index: 178,
#   taxonomy_files_count: 178,
#   files_match_index: true,
#   schemas_present: true,
#   patterns_present: true,
#   relationships_present: true
# }
```

---

## External Validation

Schemas can be used with any JSON Schema validator:

```bash
# Using ajv-cli
npx ajv validate -s schemas/technique.schema.json -d taxonomy/EA-001-*.json

# Using Python jsonschema
python -m jsonschema -i taxonomy/EA-001-*.json schemas/technique.schema.json
```

---

## Navigation

| Target | Path |
|--------|------|
| Parent (priv/data/) | [../README.md](../README.md) |
| Project Root | [../../../README.md](../../../README.md) |
| Taxonomy Files | [../taxonomy/README.md](../taxonomy/README.md) |
| Pattern Files | [../patterns/README.md](../patterns/README.md) |
| Relationships | [../relationships/README.md](../relationships/README.md) |
| Pipeline Code | [../../../lib/prismatic_annihilation/compendium/README.md](../../../lib/prismatic_annihilation/compendium/README.md) |

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Developer Portal](/developers/) | [Architecture](/architecture/) | [Meet the Creator](/about/author/)
