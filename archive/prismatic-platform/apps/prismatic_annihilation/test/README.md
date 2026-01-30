# test/ -- Test Suite

> Parent: [apps/prismatic_annihilation/](../README.md)

---

## Overview

Comprehensive test suite covering detection accuracy, defense mechanisms, compendium pipeline stages, integration bridges, and property-based testing. Tests are organized to mirror the source code structure.

---

## Structure

```
test/
|-- test_helper.exs                          # Test configuration and setup
|-- prismatic_annihilation_test.exs          # Main API facade tests
|-- compendium/
|   |-- extractor_test.exs                   # Extractor stage tests
|   |-- pipeline_test.exs                    # Full pipeline tests
|   |-- taxonomy_server_test.exs             # TaxonomyServer GenServer tests
|   +-- transformer_test.exs                 # Transformer stage tests
+-- prismatic_annihilation/
    |-- defense_test.exs                     # Defense generation and deployment
    |-- health_assessor_test.exs             # Health assessment dimensions
    |-- integration_test.exs                 # Cross-module integration
    |-- taxonomy_test.exs                    # Taxonomy GenServer tests
    |-- taxonomy_extended_test.exs           # Extended taxonomy validation
    |-- technique_cache_test.exs             # ETS cache behavior
    |-- telemetry_handler_test.exs           # Telemetry event tests
    |-- trinity_bridge_test.exs              # Trinity Gate Layer 4 tests
    +-- compendium/
        |-- markdown_extractor_test.exs      # Markdown parsing tests
        |-- parser_test.exs                  # Czech markdown parser tests
        |-- technique_builder_test.exs       # Technique construction tests
        +-- validation_test.exs              # Validation gate tests
```

---

## Running Tests

```bash
# All tests
cd apps/prismatic_annihilation && mix test

# By tag
mix test --only detection          # Detection engine tests
mix test --only defense            # Defense mechanism tests
mix test --only integration        # Integration tests
mix test --only property           # Property-based tests

# Specific file
mix test test/prismatic_annihilation/defense_test.exs

# With coverage
mix test --cover
```

---

## Test Categories

### API Tests (`prismatic_annihilation_test.exs`)

Tests the main facade module: `detect/2`, `analyze/2`, `defend/2`, `deploy_defenses/2`, `monitor_stream/3`, `assess_health/2`, `taxonomy/0`, `trinity_validate/2`, `correlate_with_evil/1`.

### Compendium Pipeline Tests

| File | Tests |
|------|-------|
| `extractor_test.exs` | Garden source parsing, merge logic, deduplication |
| `pipeline_test.exs` | End-to-end pipeline, stage coordination, validation |
| `taxonomy_server_test.exs` | GenServer lifecycle, queries, reload, search |
| `transformer_test.exs` | Normalization, scoring, translation |
| `markdown_extractor_test.exs` | Header extraction, metadata tables, cross-refs |
| `parser_test.exs` | Czech markdown structure, UTF-8, diacritics |
| `technique_builder_test.exs` | Technique struct construction, ID generation |
| `validation_test.exs` | Required fields, constraint checking |

### Core Module Tests

| File | Tests |
|------|-------|
| `defense_test.exs` | Strategy generation, deployment, countermeasure mapping |
| `health_assessor_test.exs` | 5-dimension assessment, scoring, recommendations |
| `taxonomy_test.exs` | Technique lookup, category/chapter filtering, search |
| `taxonomy_extended_test.exs` | Extended techniques, chapter expansion |
| `technique_cache_test.exs` | ETS put/get, TTL expiry, invalidation, cleanup |
| `telemetry_handler_test.exs` | Event handling, metric emission |
| `trinity_bridge_test.exs` | Layer 4 validation, blocking, confidence impact |
| `integration_test.exs` | Cross-module workflows, end-to-end scenarios |

---

## Test Patterns

### Arrange-Act-Assert

```elixir
test "detect/2 returns detections above threshold" do
  # Arrange
  content = "systematic delegitimization of research methodology"

  # Act
  {:ok, detections} = PrismaticAnnihilation.detect(content, threshold: 0.6)

  # Assert
  assert is_list(detections)
  assert Enum.all?(detections, &(&1.confidence >= 0.6))
end
```

### GenServer Testing

```elixir
test "TaxonomyServer loads techniques on init" do
  {:ok, pid} = TaxonomyServer.start_link(name: :test_taxonomy)
  count = GenServer.call(pid, :count)
  assert count > 0
  GenServer.stop(pid)
end
```

### ETS Cache Testing

```elixir
test "TechniqueCache respects TTL" do
  TechniqueCache.put(:test_id, :patterns, "value", 1)
  assert {:ok, "value"} = TechniqueCache.get(:test_id, :patterns)

  Process.sleep(5)
  assert :miss = TechniqueCache.get(:test_id, :patterns)
end
```

---

## Coverage

```bash
# Generate coverage report
mix test --cover

# HTML coverage report (with excoveralls)
mix coveralls.html
```

---

## Navigation

| Target | Path |
|--------|------|
| Project Root | [../README.md](../README.md) |
| Source Code | [../lib/README.md](../lib/README.md) |
| Core Modules | [../lib/prismatic_annihilation/README.md](../lib/prismatic_annihilation/README.md) |
| Compendium Pipeline | [../lib/prismatic_annihilation/compendium/README.md](../lib/prismatic_annihilation/compendium/README.md) |
| Data Files | [../priv/data/README.md](../priv/data/README.md) |
