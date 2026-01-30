# compendium/ -- ETL Pipeline for Taxonomy Data

> Parent: [lib/prismatic_annihilation/](../README.md) | Project: [apps/prismatic_annihilation/](../../../README.md)

---

## Overview

The Compendium subsystem implements a complete ETL (Extract-Transform-Load) pipeline that processes Czech-language markdown sources from the Garden ecosystem into structured JSON technique definitions. This pipeline populates the `priv/data/` directory with 178 technique files, detection patterns, relationship graphs, and validation schemas.

---

## Pipeline Architecture

```
Garden Sources                 Extract                Transform               Generate
+------------------+     +---------------+     +----------------+     +-----------------+
| Primary Glossary |---->|               |     |                |     |                 |
| (vykladovy-      |     |   Extractor   |---->|  Transformer   |---->|   Generator     |
|  slovnik.md)     |     |               |     |                |     |                 |
+------------------+     | Merges 3      |     | Normalizes,    |     | Writes JSON     |
| Thematic Index   |---->| sources with  |     | translates,    |     | to priv/data/:  |
| (tematicky-      |     | dedup and     |     | categorizes,   |     | - taxonomy/     |
|  rejstrik.md)    |     | priority      |     | scores          |     | - patterns/     |
+------------------+     |               |     |                |     | - schemas/      |
| Archive (36 md)  |---->|               |     |                |     | - relationships/|
+------------------+     +---------------+     +----------------+     +-----------------+
                                                                              |
                                                                              v
                                                                     +-----------------+
                                                                     | TaxonomyServer  |
                                                                     | (hot reload)    |
                                                                     +-----------------+
```

---

## Modules

### Pipeline Orchestrator

**`Pipeline`** (`pipeline.ex`) -- End-to-end orchestrator.

```elixir
# Run full pipeline
{:ok, result} = Pipeline.run(base_path: "/path/to/project", pretty: true)

# Run individual stages
{:ok, extracted} = Pipeline.extract()
{:ok, transformed} = Pipeline.transform(extracted)
{:ok, generated} = Pipeline.generate(transformed)

# Validate existing data
{:ok, validation} = Pipeline.validate()

# Check status
Pipeline.status()
# => "Compendium Pipeline Status\n...\nTotal techniques: 178\n..."
```

**Options**: `:base_path`, `:output_dir`, `:pretty`, `:sources`, `:reload_taxonomy`, `:include_descriptions`, `:include_examples`

---

### Extractor

**`Extractor`** (`extractor.ex`) -- Extracts raw techniques from 3 Garden sources.

```elixir
# Full extraction with dedup and merge
{:ok, result} = Extractor.extract_all(sources: [:primary, :index, :archive])
# => %{techniques: [...], total_count: 178, sources_parsed: [...]}

# Individual sources
{:ok, techniques, warnings} = Extractor.extract_primary(base_path)
{:ok, techniques, warnings} = Extractor.extract_index(base_path)
{:ok, techniques, warnings} = Extractor.extract_archive(base_path)
```

**Source Priority** (for merge conflicts): Primary > Archive > Index

**Source Formats**:
- **Primary** (`vykladovy-slovnik-detailni.md`): Full metadata tables, descriptions, examples, cross-references
- **Index** (`tematicky-rejstrik.md`): 150 technique names with page numbers, organized by category
- **Archive** (36 `.md` files): Zola front matter with extended descriptions

---

### Parser

**`Parser`** (`parser.ex`) -- Parses Czech markdown structure.

```elixir
# Parse detailed glossary
{:ok, techniques} = Parser.parse_detailed_glossary(markdown_content)

# Parse thematic index
{:ok, index_data} = Parser.parse_thematic_index(index_content)

# Parse table of contents
{:ok, toc_data} = Parser.parse_table_of_contents(toc_content)

# Parse all sources from a directory
{:ok, all_data} = Parser.parse_compendium_sources("/path/to/gist")

# Parse single technique entry
technique = Parser.parse_technique_entry(entry_text)
# => %{name_cz: "...", anchor: "...", category: "...", severity: "...", ...}

# Build full technique structs from raw data
{:ok, techniques} = Parser.build_techniques(raw_techniques, validate: true)
```

**Markdown Structure Parsed**:
```markdown
### Term Name {#anchor-id}

| Aspekt | Charakteristika |
|--------|-----------------|
| **Kategorie** | Category name |
| **Uroven zavaznosti** | Severity level |
| **Reverzibilita** | Reversibility |
| **Typicke projevy** | Typical manifestations |
| **Obranne strategie** | Defense strategies |

Description paragraph...

#### Priklad
Example case...

**Viz take:**
* [Related term](#anchor)
```

---

### MarkdownExtractor

**`MarkdownExtractor`** (`markdown_extractor.ex`) -- Low-level markdown element extraction.

Extracts headers, metadata tables, descriptions, examples, and cross-reference anchors from individual technique entries. Used by the Parser as a delegate.

---

### Transformer

**`Transformer`** (`transformer.ex`) -- Normalizes and enriches extracted data.

Handles Czech diacritics normalization, severity scoring, reversibility mapping, category classification, and English translation generation.

---

### Generator

**`Generator`** (`generator.ex`) -- Writes structured JSON output.

Generates:
- Individual technique JSON files to `priv/data/taxonomy/`
- Detection pattern files to `priv/data/patterns/`
- Relationship graphs to `priv/data/relationships/`
- Validation schemas to `priv/data/schemas/`
- Master index to `priv/data/technique_index.json`
- Translation map to `priv/data/translations_cs_en.json`

---

### TaxonomyServer

**`TaxonomyServer`** (`taxonomy_server.ex`) -- Runtime GenServer for JSON technique data.

```elixir
# Lookup by ID
{:ok, technique} = TaxonomyServer.get_technique("EA-001-absolutni-epistemicka-imploze")

# Category queries
techniques = TaxonomyServer.by_category("epistemic_destruction")
techniques = TaxonomyServer.by_severity("critical")
techniques = TaxonomyServer.by_subcategory("collapse_patterns")

# Translation
{:ok, english} = TaxonomyServer.translate("Absolutni epistemicka imploze")

# Search
results = TaxonomyServer.search("paralysis", limit: 10)

# Cross-references
related = TaxonomyServer.cross_references("EA-105-epistemicka-imploze")

# Statistics
stats = TaxonomyServer.statistics()
# => %{technique_count: 178, category_count: 12, severity_distribution: %{...}}

# Hot reload from disk
TaxonomyServer.reload()
```

**State Indexes** (all O(1) lookup):
- `techniques` -- Map keyed by technique ID
- `by_category` -- Category to technique ID list
- `by_severity` -- Severity to technique ID list
- `by_subcategory` -- Subcategory to technique ID list
- `translations` -- Czech/English name pairs

---

### TechniqueBuilder

**`TechniqueBuilder`** (`technique_builder.ex`) -- Builds complete technique structs from raw parsed data, handling ID generation, slug creation, and field normalization.

### Validation

**`Validation`** (`validation.ex`) -- Validates built technique structs against required fields and constraints. Used as a quality gate in the pipeline.

---

## Data Flow Summary

```
1. Garden markdown files (Czech)
2. Extractor parses 3 sources, merges with dedup
3. Parser handles markdown structure (tables, headers, cross-refs)
4. MarkdownExtractor extracts low-level elements
5. TechniqueBuilder constructs technique structs
6. Validation verifies completeness
7. Transformer normalizes, scores, translates
8. Generator writes JSON to priv/data/
9. TaxonomyServer loads JSON at runtime
10. Taxonomy GenServer merges hardcoded + JSON data
```

---

## Navigation

| Target | Path |
|--------|------|
| Parent | [../README.md](../README.md) |
| Project Root | [../../../README.md](../../../README.md) |
| Output Data | [../../../priv/data/README.md](../../../priv/data/README.md) |
| Taxonomy JSON | [../../../priv/data/taxonomy/README.md](../../../priv/data/taxonomy/README.md) |
| Detection Patterns | [../patterns/README.md](../patterns/README.md) |
| Tests | [../../../test/README.md](../../../test/README.md) |
