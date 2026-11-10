#!/usr/bin/env python3
"""Normalise page front matter so Zola and the templates see every page's metadata.

Three defects hid pages from the site's description, tag taxonomy and related-pages logic:

  - `description` written under [extra], where Zola does not read it as the page description;
  - `tags` written under [extra] instead of [taxonomies];
  - YAML front matter (---), which the rest of the book does not use.

This script moves both keys to where Zola reads them and converts YAML front matter to TOML.
Two values are inferred where the page has none that fits the architecture:

  - a page (not a section) with no tags at all gets tags from where it is: its top-level
    section, its directory and its extra.category (all as slugs);
  - extra.risk_level written in Czech ("kritická") becomes the code the templates read
    ("critical");
  - a description longer than 200 characters is shortened at the last sentence or clause
    boundary that fits (or at a word boundary with an ellipsis).

Keys that only duplicate what Zola and static/data/graph.json compute, or that no template
reads, are removed from [extra] (an [extra] table they leave empty goes with them):

  - extra.word_count, extra.reading_time (Zola's page.word_count and page.reading_time),
    extra.quality_score, extra.ref_count_at_creation (scripts/build-graph.py derives the
    metrics);
  - extra.parent (the hierarchy is the directory tree; no template reads it).

It changes nothing else: the result is parsed again and must equal the original apart from
the moved, inferred and removed keys, or the page is left untouched and reported.

Usage:
  scripts/normalize-front-matter.py [path ...]   normalise content/ (or the given files and
                                                 directories); --fix says the same explicitly
  scripts/normalize-front-matter.py --check      exit 1 when a page would change (this is the
                                                 enforcement: a removed key written again fails)
                                                 or carries a wrong controlled value
  scripts/normalize-front-matter.py --list unknown-keys
                                                 keys (or page classes) the schema has no row
                                                 for: report only; add a row to SCHEMA
  scripts/normalize-front-matter.py --doc        print the schema as a Markdown table
  scripts/normalize-front-matter.py --doc --check / --doc --fix
                                                 fail when the copy in the rule
                                                 information-architecture.v1.md is stale / write it

Every key is a row of SCHEMA below (where it lives, page classes, authored / derived /
forbidden, type, controlled values): --check refuses forbidden keys and wrong controlled values
(any mode exits 1 on a wrong value: only a person can choose the right one).
"""
import json
import pathlib
import re
import sys
import tomllib

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.dont_write_bytecode = True  # no __pycache__ in the checkout
sys.path.insert(0, str(ROOT / "scripts"))
from ia_model import page_class  # noqa: E402
TOML_FM = re.compile(r"\A\+\+\+\n(.*?)\n\+\+\+\n", re.S)
YAML_FM = re.compile(r"\A---\n(.*?)\n---\n", re.S)
TABLE = re.compile(r"^\[([^\]]+)\]\s*$")


def toml_value(value) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, list):
        return "[" + ", ".join(toml_value(v) for v in value) + "]"
    return json.dumps(str(value), ensure_ascii=False)


def yaml_scalar(raw: str):
    raw = raw.strip()
    if raw.startswith("[") and raw.endswith("]"):
        return [yaml_scalar(x) for x in raw[1:-1].split(",") if x.strip()]
    if len(raw) >= 2 and raw[0] == raw[-1] and raw[0] in "\"'":
        return raw[1:-1]
    if raw in ("true", "false"):
        return raw == "true"
    if re.fullmatch(r"-?\d+", raw):
        return int(raw)
    return raw


def yaml_to_toml(text: str):
    """Convert the flat YAML subset these pages use (scalars, one level of maps, lists)."""
    top, tables, current, last_key = {}, {}, None, None
    for line in text.split("\n"):
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        m = re.match(r"^(\w[\w-]*):\s*(.*)$", line)
        if m:
            key, value = m.groups()
            if value == "":
                current, last_key = tables.setdefault(key, {}), key
            else:
                top[key], current, last_key = yaml_scalar(value), None, key
            continue
        m = re.match(r"^\s+(\w[\w-]*):\s*(.*)$", line)
        if m and current is not None:
            current[m.group(1)] = yaml_scalar(m.group(2))
            continue
        m = re.match(r"^\s*-\s+(.*)$", line)
        if m and last_key is not None:
            target = top if current is None else current
            if current is not None and not current:
                tables[last_key] = []
                target, current = None, None
                top.setdefault(last_key, [])
                top[last_key].append(yaml_scalar(m.group(1)))
                del tables[last_key]
                continue
            (target if target is not None else top).setdefault(last_key, [])
            continue
        return None  # a construct outside the subset: leave the page alone
    if "date" in top and isinstance(top["date"], str) and re.fullmatch(r"\d{4}-\d{2}-\d{2}", top["date"]):
        date = top.pop("date")
    else:
        date = None
    lines = [f"{k} = {toml_value(v)}" for k, v in top.items()]
    if date:
        lines.insert(1 if lines else 0, f"date = {date}")
    for name, table in tables.items():
        if isinstance(table, dict):
            lines.append(f"[{name}]")
            lines.extend(f"{k} = {toml_value(v)}" for k, v in table.items())
    return "\n".join(lines)


def split_tables(fm: str):
    """Front matter as (top-level lines, [(table header, lines)])."""
    top, tables, current = [], [], None
    for line in fm.split("\n"):
        m = TABLE.match(line)
        if m:
            current = (m.group(1).strip(), [])
            tables.append(current)
        elif current is None:
            top.append(line)
        else:
            current[1].append(line)
    return top, tables


def take_key(lines: list, key: str):
    """Remove `key = …` (possibly a multi-line array) from lines; return its source text."""
    for i, line in enumerate(lines):
        if re.match(rf"^{re.escape(key)}\s*=", line):
            end = i
            if line.split("=", 1)[1].strip().startswith("[") and "]" not in line.split("=", 1)[1]:
                while end + 1 < len(lines) and "]" not in lines[end]:
                    end += 1
            taken = lines[i:end + 1]
            del lines[i:end + 1]
            return "\n".join(taken)
    return None


def slugify(text: str) -> str:
    import unicodedata
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode().lower()
    return re.sub(r"[^a-z0-9]+", "-", text).strip("-")


def infer_tags(rel: str, data: dict) -> list:
    parts = pathlib.PurePosixPath(rel).parts
    tags = [parts[0]] if len(parts) > 1 else ["kompendium"]  # a root page belongs to the book
    if len(parts) > 2:
        tags.append(slugify(parts[1]))
    category = (data.get("extra") or {}).get("category")
    if isinstance(category, str) and slugify(category):
        tags.append(slugify(category))
    return list(dict.fromkeys(t for t in tags if t))


def fit_description(text: str, limit: int = 200) -> str:
    text = " ".join(text.split())
    if len(text) <= limit:
        return text
    head = text[:limit]
    for mark in (". ", "; ", " – ", " — ", ", "):
        cut = head.rfind(mark)
        if cut >= 80:
            kept = head[:cut + (1 if mark == ". " else 0)].rstrip(" ,;–—")
            return kept if kept.endswith(".") else kept + "."
    return head[:head.rfind(" ")].rstrip(" ,;–—") + "…"


def set_scalar(lines: list, key: str, value: str) -> bool:
    for i, line in enumerate(lines):
        if re.match(rf"^{re.escape(key)}\s*=\s*\"", line) and line.rstrip().endswith('"'):
            lines[i] = f"{key} = {json.dumps(value, ensure_ascii=False)}"
            return True
    return False


# ---------------------------------------------------------------------------------------------
# The front-matter schema: one row per key the book's pages carry. It is the single source for
# what --check enforces (forbidden keys, controlled values), for `--list unknown-keys` (a key or
# a page class with no row: report only, so a new key is added by adding a row) and for the
# table `--doc` prints into .ai/repo/rules/project/information-architecture.v1.md.
#
#   where    top (Zola's own keys), taxonomies or extra
#   key      the key; a trailing * is a prefix pattern (one row for a generator's family)
#   type     the TOML types seen, "|"-separated (str, int, float, bool, list, table, date)
#   classes  the page classes it belongs to (ia_model.PAGE_CLASSES, inferred from the path),
#            space-separated; * is every class. A row naming the class wins over a * row.
#   kind     authored (written by hand), derived (written by the script in `derived`; edit
#            the generator, not the page) or forbidden (duplicates derived data or nothing reads
#            it: --check refuses it, --fix removes it); `inferred` names a script that writes
#            the value when the page has none
#   values / pattern   the controlled values; any other value is refused by --check
#
# Seeded 2026-11-10 from a census of every key in content/ (each one present got a row); the
# kompendium/nlp-vzorce rows describe what scripts/nlp-catalog.py writes there.

# extra.risk_level: the codes templates/partials/technique-hero.html renders.
RISK_LEVELS = ("low-moderate", "moderate", "moderate-high", "high", "critical", "extreme",
               "ultramarine")
ANCHOR_LINKS = ("left", "right", "heading", "none")  # Zola's insert_anchor_links
SORT_BY = ("date", "update_date", "title", "title_bytes", "weight", "slug", "none")  # Zola
NLP_PREFIX = "nlp_"  # the NLP catalogue's own extra keys (a rename is this one line)
NLP_GENERATOR = "scripts/nlp-catalog.py"


def row(where, key, type_, classes, forbidden=False, derived=None, inferred=None, values=None,
        pattern=None) -> dict:
    kind = "forbidden" if forbidden else "derived" if derived else "authored"
    return {"where": where, "key": key, "type": type_, "classes": classes.split(), "kind": kind,
            "derived": derived, "inferred": inferred, "values": values, "pattern": pattern}


def nlp(where, key, type_, classes, **opts) -> dict:
    return row(where, key, type_, classes, derived=NLP_GENERATOR, **opts)


SCHEMA = [
    row("top", "description", "str", "*"),
    row("top", "title", "str", "*"),
    row("top", "weight", "int", "*"),
    row("top", "insert_anchor_links", "str", "page section technique", values=ANCHOR_LINKS),
    row("top", "draft", "bool", "page section"),
    row("top", "date", "date", "page glossary"),
    row("top", "sort_by", "str", "page section", values=SORT_BY),
    row("top", "template", "str", "page section"),
    row("top", "aliases", "list", "page technique", derived="scripts/merge-duplicate.py"),
    row("top", "page_template", "str", "section"),
    row("top", "generate_feeds", "bool", "section"),
    row("taxonomies", "tags", "list", "page glossary technique quick-reference",
        inferred="scripts/normalize-front-matter.py"),
    row("taxonomies", "categories", "list", "page technique quick-reference"),
    row("extra", "related_terms", "list", "page glossary technique quick-reference"),
    row("extra", "toc", "bool", "page section technique quick-reference"),
    row("extra", "parent", "str", "page section technique quick-reference", forbidden=True),
    row("extra", "section_icon", "str", "page section technique"),
    row("extra", "access_level", "str", "page section technique quick-reference",
        pattern=r"^L[1-5](?:-L[1-5])?$"),
    row("extra", "ea_code", "str", "page technique quick-reference"),
    row("extra", "risk_level", "str", "page technique quick-reference", values=RISK_LEVELS),
    row("extra", "ea_category", "str", "technique"),
    row("extra", "parent_chapter", "str", "technique"),
    row("extra", "ea_subcategory", "str", "technique"),
    row("extra", "category", "str", "page section glossary technique"),
    row("extra", "author", "str", "page section glossary technique"),
    row("extra", "quality_score", "int|str", "page section glossary technique", forbidden=True),
    row("extra", "date_created", "str", "page section glossary technique"),
    row("extra", "date_modified", "str", "page section glossary technique"),
    row("extra", "keywords", "list", "page section glossary"),
    row("extra", "image", "str", "page section glossary"),
    row("extra", "image_alt", "str", "page section glossary"),
    row("extra", "reading_time", "str", "page section glossary", forbidden=True),
    row("extra", "see_also", "list", "page section glossary"),
    row("extra", "ref_count_at_creation", "int", "glossary technique", forbidden=True),
    row("extra", "glossary_target", "str", "page"),
    row("extra", "word_count", "int", "page section glossary", forbidden=True),
    row("extra", "anonymized", "bool", "page"),
    row("extra", "type", "str", "page"),
    row("extra", "status", "str", "page section glossary"),
    row("extra", "tags", "list", "section"),
    row("extra", "difficulty", "str", "page section glossary"),
    row("extra", "categories", "list", "page section"),
    row("extra", "date_updated", "str", "page section glossary"),
    row("extra", "abbreviation", "str", "glossary"),
    row("extra", "level", "str", "page"),
    row("extra", "modality", "str", "page"),
    row("extra", "phase", "str", "page"),
    row("extra", "importance", "str", "glossary"),
    row("extra", "key_takeaway", "str", "glossary"),
    row("extra", "draft", "bool", "section"),
    row("extra", "prerequisites", "list", "glossary"),
    row("extra", "complexity", "str", "glossary"),
    row("extra", "domain", "str", "glossary"),
    row("extra", "insert_anchor_links", "str", "page section"),
    row("extra", "audience", "list|str", "section glossary"),
    row("extra", "platforms", "list", "glossary"),
    row("extra", "version", "str", "glossary"),
    row("extra", "kompendium", "list", "page section"),
    row("extra", "prilohy", "list", "page section"),
    row("extra", "use_cases", "list", "glossary"),
    row("extra", "authority_level", "str", "glossary"),
    row("extra", "enforcement_level", "str", "glossary"),
    row("extra", "platform_relevance", "str", "glossary"),
    row("extra", "related_articles", "list", "page section"),
    row("extra", "related_concepts", "list", "glossary"),
    row("extra", "academic_tier", "str", "page section"),
    row("extra", "code_examples", "bool|list|str", "glossary"),
    row("extra", "content_version", "str", "page section"),
    row("extra", "glossary_terms", "list", "page section"),
    row("extra", "last_enhanced", "str", "page section"),
    row("extra", "learning_path", "list|str", "glossary"),
    row("extra", "maturity", "str", "glossary"),
    row("extra", "og_type", "str", "page section"),
    row("extra", "platform_integration", "str", "glossary"),
    row("extra", "related_apps", "list", "glossary"),
    row("extra", "stub", "bool", "section"),
    row("extra", "twitter_card", "str", "page section"),
    row("extra", "acronym", "str", "glossary"),
    row("extra", "citation_style", "str", "page section"),
    row("extra", "difficulty_rating", "int|str", "glossary"),
    row("extra", "doi_placeholder", "str", "page section"),
    row("extra", "domain_category", "str", "glossary"),
    row("extra", "external_resources", "list", "glossary"),
    row("extra", "implementation_status", "str", "glossary"),
    row("extra", "interactive_demos", "list", "glossary"),
    row("extra", "peer_reviewed", "bool", "page section"),
    row("extra", "philosophy_level", "str", "page section"),
    row("extra", "stability_level", "str", "glossary"),
    row("extra", "technical_level", "str", "glossary"),
    row("extra", "testing_scenarios", "list", "glossary"),
    row("extra", "version_introduced", "str", "glossary"),
    row("extra", "color", "str", "page"),
    row("extra", "documentation_required", "bool", "glossary"),
    row("extra", "ea_codes", "list", "page"),
    row("extra", "icon", "str", "page"),
    row("extra", "key_benefits", "list", "glossary"),
    row("extra", "last_updated", "str", "glossary"),
    row("extra", "layer", "str", "glossary"),
    row("extra", "license_framework", "str", "page section"),
    row("extra", "paradigm", "str", "glossary"),
    row("extra", "prismatic_usage", "str", "glossary"),
    row("extra", "quality_impact", "str", "glossary"),
    row("extra", "related_app", "str", "glossary"),
    row("extra", "safety_level", "str", "glossary"),
    row("extra", "sovereignty_model", "str", "page section"),
    row("extra", "tier", "str", "glossary"),
    row("extra", "academic_paper", "bool", "section"),
    row("extra", "acronyms", "list", "glossary"),
    row("extra", "agent_count", "int", "glossary"),
    row("extra", "beam_related", "bool", "glossary"),
    row("extra", "complexity_level", "str", "glossary"),
    row("extra", "confidence_threshold", "float|str", "glossary"),
    row("extra", "content_type", "list", "section"),
    row("extra", "date", "str", "section"),
    row("extra", "founded", "str", "glossary"),
    row("extra", "landing_page", "bool", "section"),
    row("extra", "language", "str", "section"),
    row("extra", "platform_adoption", "str", "glossary"),
    row("extra", "prismatic_module", "str", "glossary"),
    row("extra", "quality_domains", "int|str", "glossary"),
    row("extra", "related_patterns", "list", "glossary"),
    row("extra", "safety_critical_agents", "int|list", "glossary"),
    row("extra", "scope", "str", "glossary"),
    row("extra", "section_type", "str", "section"),
    row("extra", "signal_flow", "str", "glossary"),
    row("extra", "stability", "str", "glossary"),
    row("extra", "standards", "list", "glossary"),
    row("extra", "subcategory", "str", "glossary"),
    row("extra", "testing_strategy", "str", "glossary"),
    row("extra", "tier_levels", "list", "glossary"),
    row("extra", "tools", "list", "glossary"),
    row("extra", "total_agents", "int|str", "glossary"),
    row("extra", "activation_channels", "list", "glossary"),
    row("extra", "activation_commands", "list", "glossary"),
    row("extra", "agent_classifications", "list", "glossary"),
    row("extra", "agent_tiers", "list", "glossary"),
    row("extra", "agents_governed", "str", "glossary"),
    row("extra", "anti_metric_enforcement", "bool", "glossary"),
    row("extra", "api_type", "str", "glossary"),
    row("extra", "api_version", "str", "glossary"),
    row("extra", "architecture_layer", "str", "glossary"),
    row("extra", "audit_capabilities", "list", "glossary"),
    row("extra", "audit_requirement", "str", "glossary"),
    row("extra", "audit_trail_complete", "bool", "glossary"),
    row("extra", "authentication", "str", "glossary"),
    row("extra", "authors", "list", "glossary"),
    row("extra", "axiom_number", "int", "glossary"),
    row("extra", "beam_specific", "bool", "glossary"),
    row("extra", "behavioral_analysis", "bool", "glossary"),
    row("extra", "benefits", "list", "glossary"),
    row("extra", "best_practices", "str", "glossary"),
    row("extra", "blocking_methods", "list", "glossary"),
    row("extra", "bypass_mechanisms", "str", "glossary"),
    row("extra", "call_sign", "str", "glossary"),
    row("extra", "cascade_phases", "int", "glossary"),
    row("extra", "categories_count", "int", "section"),
    row("extra", "category_color", "str", "glossary"),
    row("extra", "clearance", "str", "glossary"),
    row("extra", "closure_conditions", "int", "glossary"),
    row("extra", "closure_model", "str", "glossary"),
    row("extra", "color_team_integration", "bool", "glossary"),
    row("extra", "commander", "str", "glossary"),
    row("extra", "communication_patterns", "list", "glossary"),
    row("extra", "compiler_warnings", "str", "glossary"),
    row("extra", "compliance", "str", "glossary"),
    row("extra", "compliance_frameworks", "list", "glossary"),
    row("extra", "compliance_relevance", "list", "glossary"),
    row("extra", "compliance_relevant", "bool", "glossary"),
    row("extra", "confidence_scoring", "bool", "glossary"),
    row("extra", "coordination_model", "str", "glossary"),
    row("extra", "creator", "str", "glossary"),
    row("extra", "credo_violations", "str", "glossary"),
    row("extra", "current_count", "str", "glossary"),
    row("extra", "current_fitness", "float", "glossary"),
    row("extra", "current_generation", "int", "glossary"),
    row("extra", "current_status", "str", "glossary"),
    row("extra", "data_freshness", "str", "glossary"),
    row("extra", "data_model", "str", "glossary"),
    row("extra", "design_principles", "list", "glossary"),
    row("extra", "detection_strategy", "str", "glossary"),
    row("extra", "detection_techniques", "list", "glossary"),
    row("extra", "dialyzer_violations", "str", "glossary"),
    row("extra", "discovery_patterns", "list", "glossary"),
    row("extra", "doctrine", "str", "glossary"),
    row("extra", "documentation_quality", "str", "glossary"),
    row("extra", "domains", "str", "glossary"),
    row("extra", "domains_covered", "int", "glossary"),
    row("extra", "elimination_status", "str", "glossary"),
    row("extra", "elixir_libraries", "list", "glossary"),
    row("extra", "elixir_module", "str", "glossary"),
    row("extra", "elixir_modules", "list", "glossary"),
    row("extra", "enforcement_layers", "int", "glossary"),
    row("extra", "entries", "int", "page"),
    row("extra", "epistemic_framework", "str", "page"),
    row("extra", "escalation_target", "str", "glossary"),
    row("extra", "estimated_reading_time", "str", "glossary"),
    row("extra", "ethics_check_interval", "str", "glossary"),
    row("extra", "evolution_support", "str", "glossary"),
    row("extra", "false_negative_impact", "str", "glossary"),
    row("extra", "false_positive_impact", "str", "glossary"),
    row("extra", "false_positive_threshold", "str", "glossary"),
    row("extra", "fingerprinting_layers", "int", "glossary"),
    row("extra", "first_introduced", "str", "glossary"),
    row("extra", "framework", "str", "glossary"),
    row("extra", "gdpr_compliant", "bool", "glossary"),
    row("extra", "generation", "int", "glossary"),
    row("extra", "governance_model", "str", "glossary"),
    row("extra", "historical_peak", "str", "glossary"),
    row("extra", "implementation_guide", "str", "glossary"),
    row("extra", "implementation_patterns", "list", "glossary"),
    row("extra", "independence_requirement", "str", "glossary"),
    row("extra", "index_command", "str", "glossary"),
    row("extra", "industry_comparison", "str", "glossary"),
    row("extra", "industry_usage", "str", "glossary"),
    row("extra", "integration_pattern", "str", "glossary"),
    row("extra", "integration_points", "list", "glossary"),
    row("extra", "integration_systems", "list", "glossary"),
    row("extra", "interactive", "str", "glossary"),
    row("extra", "isolation_level", "str", "glossary"),
    row("extra", "key_agents", "list", "glossary"),
    row("extra", "key_benefit", "str", "glossary"),
    row("extra", "key_technologies", "list", "glossary"),
    row("extra", "lead", "str", "section"),
    row("extra", "learning_outcomes", "list", "glossary"),
    row("extra", "matching_algorithms", "list", "glossary"),
    row("extra", "matching_strategies", "list", "glossary"),
    row("extra", "measurement_approach", "str", "glossary"),
    row("extra", "measurement_precision", "str", "glossary"),
    row("extra", "minimum_signals", "int", "glossary"),
    row("extra", "mission_types", "list", "glossary"),
    row("extra", "monitoring", "list", "glossary"),
    row("extra", "nabla_compliance", "str", "glossary"),
    row("extra", "nabla_compliant", "bool", "glossary"),
    row("extra", "notation", "str", "section"),
    row("extra", "origin", "str", "glossary"),
    row("extra", "osint_enrichment", "bool", "glossary"),
    row("extra", "osint_relevant", "bool", "glossary"),
    row("extra", "otp_behaviour", "bool", "glossary"),
    row("extra", "override_authority", "str", "glossary"),
    row("extra", "override_capability", "str", "glossary"),
    row("extra", "pattern_type", "str", "glossary"),
    row("extra", "performance_critical", "bool", "glossary"),
    row("extra", "phoenix_component", "bool", "glossary"),
    row("extra", "phoenix_integration", "str", "glossary"),
    row("extra", "pipeline_model", "str", "glossary"),
    row("extra", "platform_component", "str", "glossary"),
    row("extra", "platform_version", "str", "glossary"),
    row("extra", "pre_commit_phases", "str", "glossary"),
    row("extra", "prerequisite_concepts", "list", "glossary"),
    row("extra", "prerequisite_knowledge", "list", "glossary"),
    row("extra", "prevention_mechanism", "str", "glossary"),
    row("extra", "prismatic_components", "list", "glossary"),
    row("extra", "prismatic_modules", "list", "glossary"),
    row("extra", "privacy_by_design", "bool", "glossary"),
    row("extra", "process_model", "str", "glossary"),
    row("extra", "programming_languages", "list", "glossary"),
    row("extra", "qdp_eliminated", "str", "glossary"),
    row("extra", "quality_domains_clean", "str", "glossary"),
    row("extra", "quality_gates", "list", "glossary"),
    row("extra", "quality_metrics", "list", "glossary"),
    row("extra", "query_language", "str", "glossary"),
    row("extra", "real_time_classification", "bool", "glossary"),
    row("extra", "refresh_rate", "str", "glossary"),
    row("extra", "registry_file", "str", "glossary"),
    row("extra", "related_architectures", "list", "glossary"),
    row("extra", "related_disciplines", "list", "glossary"),
    row("extra", "remediation_approach", "str", "glossary"),
    row("extra", "requires_knowledge", "list", "glossary"),
    row("extra", "response_time", "str", "glossary"),
    row("extra", "risk_categories", "list", "glossary"),
    row("extra", "runtime_agents", "str", "glossary"),
    row("extra", "scalability", "str", "glossary"),
    row("extra", "scan_engine", "str", "glossary"),
    row("extra", "scanning_modes", "list", "glossary"),
    row("extra", "screening_threshold", "float", "glossary"),
    row("extra", "section", "str", "section"),
    row("extra", "section_id", "str", "section"),
    row("extra", "security_domain", "str", "glossary"),
    row("extra", "security_relevant", "bool", "glossary"),
    row("extra", "session_protocol", "str", "glossary"),
    row("extra", "signal_plurality_enforced", "bool", "glossary"),
    row("extra", "similarity_metrics", "list", "glossary"),
    row("extra", "since_generation", "int", "glossary"),
    row("extra", "specification_directory", "str", "glossary"),
    row("extra", "specification_format", "str", "glossary"),
    row("extra", "static_agents", "str", "glossary"),
    row("extra", "supported_lists", "list", "glossary"),
    row("extra", "teams_coordinated", "list", "glossary"),
    row("extra", "technical_domain", "str", "glossary"),
    row("extra", "techniques_published", "int", "section"),
    row("extra", "technologies", "list", "glossary"),
    row("extra", "technology_type", "str", "glossary"),
    row("extra", "telemetry_enabled", "bool", "glossary"),
    row("extra", "telemetry_namespace", "str", "glossary"),
    row("extra", "testing_approach", "list", "glossary"),
    row("extra", "threat_actor_attribution", "bool", "glossary"),
    row("extra", "time_to_learn", "str", "glossary"),
    row("extra", "total_eliminated", "int", "glossary"),
    row("extra", "total_improvements", "int", "glossary"),
    row("extra", "total_qdp", "int", "glossary"),
    row("extra", "total_teams", "int", "glossary"),
    row("extra", "total_techniques_planned", "int", "section"),
    row("extra", "total_terms", "int", "section"),
    row("extra", "transition_mechanism", "str", "glossary"),
    row("extra", "umbrella_apps", "list", "glossary"),
    row("extra", "verification_model", "str", "page"),
    row("extra", "violation_levels", "list", "glossary"),
    row("extra", "violation_response", "str", "glossary"),
    row("extra", "weighting_model", "str", "glossary"),
    # kompendium/nlp-vzorce: every key but description is written by the NLP generator.
    nlp("top", "title", "str", "nlp nlp-index nlp-trainer"),
    nlp("top", "weight", "int", "nlp nlp-index nlp-trainer"),
    nlp("top", "insert_anchor_links", "str", "nlp nlp-index", values=ANCHOR_LINKS),
    nlp("top", "sort_by", "str", "nlp-index", values=SORT_BY),
    nlp("top", "template", "str", "nlp-index nlp-trainer"),
    nlp("top", "page_template", "str", "nlp-index"),
    nlp("taxonomies", "tags", "list", "nlp nlp-trainer"),
    nlp("taxonomies", "categories", "list", "nlp nlp-trainer"),
    nlp("extra", "tags", "list", "nlp-index"),
    nlp("extra", "categories", "list", "nlp-index"),
    nlp("extra", "toc", "bool", "nlp nlp-index nlp-trainer"),
    nlp("extra", "risk_level", "str", "nlp", values=("low", "moderate", "high")),
    nlp("extra", "lang", "str", "nlp nlp-index"),
    nlp("extra", "keywords", "list", "nlp nlp-index"),
    nlp("extra", "schema_type", "str", "nlp", values=("DefinedTerm",)),
    nlp("extra", "schema_type", "str", "nlp-index", values=("DefinedTermSet",)),
    nlp("extra", "section_icon", "str", "nlp-index"),
    nlp("extra", NLP_PREFIX + "*", "str|int|bool|list|table", "nlp nlp-index"),
]
FORBIDDEN_EXTRA = tuple(r["key"] for r in SCHEMA
                        if r["kind"] == "forbidden" and r["where"] == "extra")
WHERE_ORDER = {"top": 0, "taxonomies": 1, "extra": 2}
KIND_CS = {"authored": "autorský", "derived": "odvozený", "forbidden": "zakázaný"}


def schema_row(where: str, key: str, page_class: str):
    """The schema row for a key on a page of this class, or None (an unknown key)."""
    general = None
    for r in SCHEMA:
        if r["where"] != where or not (r["key"] == key or r["key"].endswith("*")
                                       and key.startswith(r["key"][:-1])):
            continue
        if page_class in r["classes"]:
            return r
        if "*" in r["classes"] and general is None:
            general = r
    return general


def schema_findings(data: dict, page_class: str) -> tuple:
    """(wrong controlled values, unknown keys) of a parsed front matter."""
    wrong, unknown = [], []
    for where, table in (("top", data), ("taxonomies", data.get("taxonomies")),
                         ("extra", data.get("extra"))):
        if not isinstance(table, dict):
            continue
        for key, value in table.items():
            if where == "top" and key in ("taxonomies", "extra") and isinstance(value, dict):
                continue
            r = schema_row(where, key, page_class)
            if r is None:
                unknown.append(f"{where}.{key}")
                continue
            if r["values"] is not None and value not in r["values"]:
                wrong.append(f"{where}.{key} = {value!r} (allowed: {', '.join(r['values'])})")
            elif r["pattern"] and not (isinstance(value, str)
                                       and re.fullmatch(r["pattern"], value)):
                wrong.append(f"{where}.{key} = {value!r} (allowed: {r['pattern']})")
    return wrong, unknown


def schema_doc() -> str:
    """The schema as the Markdown table the rule document carries (generated, never edited)."""
    lines = ["| oddíl | klíč | třídy stránek | povaha | typ | povolené hodnoty |",
             "|---|---|---|---|---|---|"]
    for r in sorted(SCHEMA, key=lambda r: (WHERE_ORDER[r["where"]], r["key"], r["classes"])):
        kind = KIND_CS[r["kind"]]
        if r["derived"]:
            kind += f" (`{r['derived']}`)"
        if r["inferred"]:
            kind += f", chybí-li, doplní `{r['inferred']}`"
        allowed = ", ".join(f"`{v}`" for v in r["values"]) if r["values"] else (
            f"`{r['pattern']}`" if r["pattern"] else "")
        classes = "všechny" if r["classes"] == ["*"] else ", ".join(r["classes"])
        lines.append(f"| {r['where']} | `{r['key']}` | {classes} | {kind} | {r['type']} | "
                     f"{allowed} |")
    return "\n".join(lines) + "\n"


RULE_DOC = ROOT / ".ai" / "repo" / "rules" / "project" / "information-architecture.v1.md"
DOC_BEGIN = ("<!-- front-matter-schema:begin (scripts/normalize-front-matter.py --doc;"
             " neupravovat ručně) -->")
DOC_END = "<!-- front-matter-schema:end -->"
DOC_REGION = re.compile(r"(<!-- front-matter-schema:begin[^>]*-->\n).*?"
                        r"(<!-- front-matter-schema:end -->)", re.S)


def doc_command(args: list) -> int:
    """--doc prints the table; --doc --check fails when the rule document's copy is stale;
    --doc --fix writes it there."""
    table = schema_doc()
    if "--check" not in args and "--fix" not in args:
        print(table, end="")
        return 0
    text = RULE_DOC.read_text(encoding="utf-8")
    m = DOC_REGION.search(text)
    if not m:
        print(f"normalize-front-matter: {RULE_DOC.relative_to(ROOT)} has no {DOC_BEGIN} region")
        return 1
    fresh = text[:m.start()] + m.group(1) + table + m.group(2) + text[m.end():]
    if fresh == text:
        print("normalize-front-matter: the schema table is up to date")
        return 0
    if "--check" in args:
        print(f"normalize-front-matter: the schema table in {RULE_DOC.relative_to(ROOT)} is stale;"
              " run scripts/normalize-front-matter.py --doc --fix")
        return 1
    RULE_DOC.write_text(fresh, encoding="utf-8")
    print("normalize-front-matter: schema table written")
    return 0


# Controlled values of extra.risk_level: the codes the templates read. A Czech spelling of a
# code is mapped to the code, so a page and the hero card cannot disagree.
RISK_ALIASES = {"kritická": "critical", "kriticka": "critical", "kritické": "critical"}


def normalise_toml(fm: str, is_section: bool, rel: str = "") -> str:
    data = tomllib.loads(fm)
    extra = data.get("extra") or {}
    top, tables = split_tables(fm)
    tables_by_name = {name: lines for name, lines in tables}
    if not data.get("description") and isinstance(extra, dict) and extra.get("description"):
        moved = take_key(tables_by_name["extra"], "description")
        if moved:
            top.append(moved)
    taxonomies = data.get("taxonomies") or {}
    # Zola sections (_index.md) take no taxonomies; their extra.tags stay where they are.
    if (not is_section and not taxonomies.get("tags") and isinstance(extra, dict)
            and isinstance(extra.get("tags"), list)):
        moved = take_key(tables_by_name["extra"], "tags")
        if moved:
            if "taxonomies" in tables_by_name:
                tables_by_name["taxonomies"].append(moved)
            else:
                tables.insert(0, ("taxonomies", [moved]))
    description = data.get("description") or (extra.get("description") if isinstance(extra, dict) else None)
    if isinstance(description, str) and len(" ".join(description.split())) > 200:
        set_scalar(top, "description", fit_description(description))
    taxonomies = data.get("taxonomies") or {}
    has_tags = taxonomies.get("tags") or (isinstance(extra, dict) and isinstance(extra.get("tags"), list))
    if rel and not is_section and not has_tags:
        line = f"tags = {toml_value(infer_tags(rel, data))}"
        if "taxonomies" in tables_by_name:
            table = tables_by_name["taxonomies"]
            take_key(table, "tags")  # an empty `tags = []` is replaced, never duplicated
            table.append(line)
        else:
            tables.insert(0, ("taxonomies", [line]))
    risk = (extra.get("risk_level") if isinstance(extra, dict) else None)
    if isinstance(risk, str) and risk.strip().lower() in RISK_ALIASES and "extra" in tables_by_name:
        set_scalar(tables_by_name["extra"], "risk_level", RISK_ALIASES[risk.strip().lower()])
    if isinstance(extra, dict) and "extra" in tables_by_name:
        removed = [take_key(tables_by_name["extra"], key)
                   for key in FORBIDDEN_EXTRA if key in extra]
        if any(removed) and not any(l.strip() for l in tables_by_name["extra"]):
            tables[:] = [(n, l) for n, l in tables if n != "extra"]
    while top and not top[-1].strip():
        top.pop()
    out = list(top)
    for name, lines in tables:
        while lines and not lines[-1].strip():
            lines.pop()
        while lines and not lines[0].strip():
            lines.pop(0)
        out.extend(["", f"[{name}]"])
        out.extend(lines)
    return "\n".join(out)


def expected(before: dict, is_section: bool, rel: str = "") -> dict:
    data = json.loads(json.dumps(before, default=str))
    extra = data.get("extra") or {}
    if not data.get("description") and extra.get("description"):
        data["description"] = extra.pop("description")
    if isinstance(data.get("description"), str) and len(" ".join(data["description"].split())) > 200:
        data["description"] = fit_description(data["description"])
    risk = extra.get("risk_level")
    if isinstance(risk, str) and risk.strip().lower() in RISK_ALIASES:
        extra["risk_level"] = RISK_ALIASES[risk.strip().lower()]
    tax = data.get("taxonomies") or {}
    if not is_section and not tax.get("tags") and isinstance(extra.get("tags"), list):
        data.setdefault("taxonomies", {})["tags"] = extra.pop("tags")
    elif rel and not is_section and not tax.get("tags"):
        data.setdefault("taxonomies", {})["tags"] = infer_tags(rel, before)
    removed = [extra.pop(key) for key in FORBIDDEN_EXTRA if key in extra]
    if removed and "extra" in data and not data["extra"]:
        del data["extra"]
    if "extra" in data and not data["extra"] and "extra" not in before:
        del data["extra"]
    return data


def normalise(text: str, is_section: bool = False, rel: str = ""):
    m = TOML_FM.match(text)
    if m:
        fm = m.group(1)
        before = tomllib.loads(fm)
        rest = text[m.end():]
    else:
        m = YAML_FM.match(text)
        if not m:
            return text, None
        fm = yaml_to_toml(m.group(1))
        if fm is None:
            return text, "YAML outside the supported subset"
        before = tomllib.loads(fm)
        rest = text[m.end():]
    new_fm = normalise_toml(fm, is_section, rel)
    after = tomllib.loads(new_fm)
    if json.loads(json.dumps(after, default=str)) != expected(before, is_section, rel):
        return text, "result differs from the original beyond the moved keys"
    return f"+++\n{new_fm}\n+++\n{rest}", None


def main() -> int:
    argv = sys.argv[1:]
    if any(a in ("-h", "--help") for a in argv):
        print(__doc__.strip())
        return 0
    known = ("--check", "--fix", "--doc", "--list")
    unknown = [a for a in argv if a.startswith("-") and a not in known]
    if unknown:
        print(f"normalize-front-matter: unknown option {unknown[0]}; see --help", file=sys.stderr)
        return 2
    if "--doc" in argv:
        return doc_command(argv)
    listing = None
    if "--list" in argv:
        i = argv.index("--list")
        listing = argv[i + 1] if i + 1 < len(argv) else ""
        if listing != "unknown-keys":
            print("normalize-front-matter: --list takes unknown-keys", file=sys.stderr)
            return 2
        argv = argv[:i] + argv[i + 2:]
    args = [a for a in argv if a not in ("--check", "--fix")]
    check = "--check" in argv or listing is not None
    paths = []
    for arg in args:
        path = pathlib.Path(arg)
        paths.extend(sorted(path.rglob("*.md")) if path.is_dir() else [path])
    paths = paths or sorted((ROOT / "content").rglob("*.md"))
    changed, refused, invalid, unknown_keys = [], [], [], []
    for path in paths:
        text = path.read_text(encoding="utf-8")
        try:
            try:
                rel = path.resolve().relative_to(ROOT / "content").as_posix()
            except ValueError:
                rel = ""
            new, problem = normalise(text, path.name == "_index.md", rel)
        except tomllib.TOMLDecodeError as exc:
            new, problem = text, f"front matter does not parse: {exc}"
        if problem:
            refused.append((path, problem))
            continue
        m = TOML_FM.match(new)
        if m:  # the schema judges the normalised front matter (an alias fixed is not wrong)
            cls = page_class(rel or path.name)
            wrong, extra_keys = schema_findings(tomllib.loads(m.group(1)), cls)
            invalid.extend((path, w) for w in wrong)
            unknown_keys.extend((path, k, cls) for k in extra_keys)
        if new != text:
            changed.append(path)
            if not check:
                path.write_text(new, encoding="utf-8")
    if listing == "unknown-keys":
        for path, key, cls in unknown_keys:
            print(f"{path}\t{key}\t{cls}")
        return 0
    verb = "would change" if check else "normalised"
    print(f"normalize-front-matter: {verb} {len(changed)} page(s); left {len(refused)} alone; "
          f"{len(invalid)} wrong controlled value(s); {len(unknown_keys)} key(s) outside the "
          "schema (--list unknown-keys)")
    for path, problem in refused[:30]:
        print(f"  left alone {path}: {problem}")
    for path, problem in invalid[:30]:
        print(f"  wrong value {path}: {problem}")
    return 1 if (check and changed) or invalid else 0


if __name__ == "__main__":
    sys.exit(main())
