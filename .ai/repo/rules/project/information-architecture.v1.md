---
id: project.information-architecture
version: 1
kind: rule
title: Informační architektura knihy je vynucená a odvozená
description: Každá stránka má metadata tam, kde je Zola čte, patří do sítě odkazů a nic, co z obsahu plyne, se nepíše ručně.
statement: Udržuj každou stránku v content/ v jednotné informační architektuře – TOML hlavička s title, description a štítky v [taxonomies], oddíl Související, aspoň tři vnitřní odkazy a aspoň jeden příchozí – a ověř ji před každým commitem skriptem scripts/check-ia.py, který smí stav jen zlepšit.
status: active
class: blocking
depends_on: [project.content-linked-and-built@1]
tags: [content, information-architecture, navigation, seo]
---

# Rationale

Kniha má přes 1800 stránek v desítkách sekcí. Čtenář se v ní orientuje jen přes metadata
a odkazy: popis stránky (vyhledávače, náhledy na sociálních sítích, výpisy sekcí), štítky
(související stránky, výpisy štítků), drobečkovou navigaci a síť odkazů (zpětné odkazy, mapa
knihy). Při měření 2026-11-10 bylo 781 popisů mimo rozsah nebo ukrytých pod `[extra]`,
458 stránek bez štítků v `[taxonomies]`, 72 stránek s YAML hlavičkou a 576 stránek, na které
nevedl žádný odkaz. Takové stránky šablony nevidí, i když na disku jsou.

# Required behaviour

Pro každou stránku (`_index.md` sekcí jsou vyňaty z požadavků na štítky, oddíl Související,
odchozí a příchozí odkazy):

| požadavek | co platí |
|---|---|
| `front-matter`, `toml` | hlavička `+++` (TOML), která se načte, s `title` |
| `description` | nejvyšší úroveň hlavičky, 50–200 znaků, česky; ne pod `[extra]` |
| `tags` | aspoň jeden štítek v `[taxonomies]`; ne pod `[extra]` |
| `czech`, `diacritics` | text je česky a s diakritikou (pravidlo `project.content-czech-diacritics`) |
| `related` | oddíl `## Související` |
| `links-out` | aspoň 3 vnitřní odkazy `@/` na existující stránky |
| `not-orphan` | aspoň jedna jiná stránka sem odkazuje |
| `broken-link` | žádný odkaz `@/` na neexistující stránku |
| `detail` | stránka má skutečný obsah v rozsahu aspoň 2× A4, tedy 1100 slov (asi 550 slov souvislého textu na stranu A4); rozcestník sekce `_index.md` 600, karta `quick-reference` 250; stránka s vlastní šablonou (mapa, stav, matice) je aplikační plocha a je vyňata; žádná stránka „na oko“ |
| `generated` | žádný strojově přidaný text platformy: blok NLLB, „structural stub“, poznámka o zástupné stránce, šablona „pojem v sekci … znalostní báze Prismatic Platform“ (viz `knowledge/curated/platform-artifacts-in-content.md`) |
| `weak-link` | každý vnitřní odkaz vede na detailní stránku, která splňuje `detail` i `generated`; dluh nese **cílová** stránka (tenká stránka, na kterou jiné odkazují), nikdy odkazující: odkaz na tenkou stránku je lepší než žádný odkaz a odstranit odkaz kvůli bráně porušuje „pojem = stránka = odkaz“; `check-ia.py --debt` řadí tenké cíle podle počtu příchozích odkazů (co rozvinout dřív) |
| `summary` | heslo glosáře má krátké shrnutí (`description`) a začíná oddílem `## Definice`, za nímž následuje podrobný výklad |
| `hardcoded-path` | obsah nikdy nepíše základní cestu ani adresu webu (`src`/`href` na `/kompendium-epistemicke-anihilace/…`, `https://korczis.github.io/…`): stránky jsou odkazy `@/`, skripty komponenta `{{ <viz_script name="…" /> }}`, takže se nic nezastará při přesunu webu |
| `term-page` | každý pojem z rejstříku `08-prilohy/index-pojmu.md` má vlastní stránku: heslo glosáře (podle názvu nebo anglického ekvivalentu), esej ve `philosophy/` nebo stránku techniky (podle kódu EA) |

## Akademický standard a tučné písmo

Každá stránka se čte jako jedno akademické dílo: výklad v odstavcích, každé tvrzení s citací
autor–rok, citovaná díla v oddílu Literatura, každý pojem a každá technika s vlastní stránkou
a tučné písmo jako odkaz na pojem. Požadavky mají dvě povahy. **Blokující** požadavky selžou
na každém porušení, které není v základu (`scripts/ia-baseline.json`); u `placeholder` a
`technique-page` se do základu nedostane nic. **Pracovní seznam** (`bold-candidate`) neukládá
povinnost stránce, ale knize: vyjmenovává chybějící hesla glosáře a smí se jen zkracovat.

| požadavek | povaha | co platí |
|---|---|---|
| `placeholder` | blokující, nikdy v základu | žádný zástupný nebo výplňový text: poznámka „tato stránka je placeholder“, pole `placeholder`, „obsah je v rekonstrukci“, záznamy typu „stub entry“, „bude doplněno“, „obsah se připravuje“, *lorem ipsum*, rezervované nebo plánované bloky (`(rezervované)`, buňka `Plánováno`), obecný popis „pojem v sekci … znalostní báze“; blok NLLB a „structural stub“ patří pod `generated` |
| `bullets` | blokující, ratchet | žádná odrážka ani číslovaný bod mimo `## Literatura` a `## Související` a mimo generované bloky: každý bod je odstavec; řádek je položkou seznamu, jen když ji tak vykreslí CommonMark (číslovaný bod přeruší rozepsaný odstavec jen číslem 1, takže „2011)“ nebo „44.“ na začátku zalomeného řádku je text) |
| `citations` | blokující, ratchet | každý odstavec výkladu o 20 a více slovech nese citaci autor–rok: `(Autor, rok)`, `(Autor rok)`, `Autor (rok)`, `(A a B, rok)`, `(A a kol., rok)`, nebo předpis `zákon č. N/RRRR Sb.` či akt EU (`nařízení (EU) 2016/679`, `2011/36/EU`); číslo paragrafu (§ 1724) není rok; vyňaty jsou rámečky `>`, tabulky, nadpisy, kód a generované bloky |
| `bibliography` | blokující, ratchet | stránka, která cituje autora, má oddíl `## Literatura`, a to před `## Související` |
| `citation-unresolved` | blokující, ratchet | každé citované příjmení je v Literatuře téže stránky; české pádové a přechýlené tvary se k heslu přiřadí (Liftona, Liftonovi → Lifton; Arendtová → Arendt; Havla → Havel; Tverského → Tversky) |
| `technique-page` | blokující, nikdy v základu | každý kód `EA-X.Y.Z`, který stránka zmíní, má vlastní stránku techniky (`kompendium/techniques/ea-X-Y-Z…` nebo `extra.ea_code`) |
| `bold-term` | blokující, ratchet | tučný úsek, jehož text je pojmem glosáře (název, název bez závorky, alias v závorce, `extra.aliases`, slug; bez ohledu na velikost písmen a diakritiku), je odkazem na heslo: `**[X](@/glossary/x.md)**` nebo `[**X**](…)`; počítá se jen **chybějící** odkaz, nikdy odkaz na tenkou stránku (dluh tenkého cíle nese `weak-link` na cíli); opravu provede `scripts/link-terms.py --bold` |
| `bold-candidate` | pracovní seznam, jen se zkracuje | tučná fráze nejvýše o 6 slovech, která se vyskytuje na 3 a více stránkách, není pojmem, popiskem ani odkazem, potřebuje vlastní heslo glosáře; `check-ia.py --list bold-candidate` ji vypíše jako `bold:<slug>` s počtem stránek; jakmile heslo vznikne, fráze ze seznamu vypadne a vynucuje ji `bold-term` |

Výjimky tučného písma se odvozují ze struktury, nikdy z ručně psaného seznamu slov: popisek
(tučné následované `:` nebo končící `:`, tučný úvod odstavce nebo bodu končící tečkou), řádek
záhlaví tabulky a první buňka každého řádku, oddíly Související a Literatura, generované bloky,
nadpisy a kód, klíčová věta o více než 6 slovech a vlastní stránka hesla. Žádný z těchto
požadavků nepočítá stránce odkaz jako vadu: `bold-term` a `technique-page` účtují chybějící
odkaz nebo stránku, `bold-candidate` chybějící heslo a nese ho fráze (`bold:<slug>`), ne stránka.

Strukturní vazby, které plynou z cest (karta `qr-ea-X-Y-Z` ↔ technika `ea-X-Y-Z`, most
`bridge-<pojem>` ↔ heslo `glossary/<pojem>`, most mezi sekcemi ↔ obě sekce), zapisuje na obě
strany `scripts/derive-links.py` do generovaného oddílu „Strukturní vazby“ mezi značkami
`kompendium:odvozene-vazby`; ručně se neupravuje a `--check` v CI hlídá, že je aktuální.

Odvozená data se negenerují ručně: `scripts/build-graph.py` zapisuje
`static/data/graph.json` (stránky a jejich odkazy) a `static/data/metrics.json` (čísla pro
přehledy); šablony a vizualizace čtou jen tato data. `scripts/normalize-front-matter.py`
opraví umístění popisu a štítků a převede YAML na TOML beze změny čehokoli jiného. Hlavička nenese
nic, co se odvozuje nebo co nic nečte: `extra.word_count`, `extra.reading_time`,
`extra.quality_score`, `extra.ref_count_at_creation` (počítá je Zola a `build-graph.py`)
a `extra.parent` (hierarchii dává strom adresářů) vynucuje `normalize-front-matter --check`,
které je odmítne, a `--fix` je odstraní.

Schéma hlavičky je jediný strojově čitelný zdroj: `data/front-matter.toml` (čte ho
`scripts/normalize-front-matter.py` i další nástroje) má pro každý klíč řádek s oddílem (`top`, `taxonomies`,
`extra`), třídami stránek (odvozenými z cesty, `ia_model.PAGE_CLASSES`), povahou (autorský,
odvozený s generátorem, zakázaný), typem a povolenými hodnotami tam, kde jsou řízené.
`normalize-front-matter --check` odmítne zakázaný klíč i hodnotu mimo povolené; klíč nebo třídu
bez řádku jen vypíše `--list unknown-keys`, takže nový klíč se zavádí novým řádkem schématu.
Tabulka níže je z něj vygenerovaná (`--doc --fix`), ručně se neupravuje a
`--doc --check` ve `scripts/verify-content.sh` hlídá, že je aktuální.

<!-- front-matter-schema:begin (scripts/normalize-front-matter.py --doc; neupravovat ručně) -->
| oddíl | klíč | třídy stránek | povaha | typ | povolené hodnoty |
|---|---|---|---|---|---|
| top | `aliases` | page, glossary, technique | odvozený (`scripts/merge-duplicate.py`) | list |  |
| top | `date` | page, glossary | autorský | date |  |
| top | `description` | všechny | autorský | str |  |
| top | `draft` | page, section | autorský | bool |  |
| top | `generate_feeds` | section | autorský | bool |  |
| top | `insert_anchor_links` | nlp, nlp-index | odvozený (`scripts/nlp-catalog.py`) | str | `left`, `right`, `heading`, `none` |
| top | `insert_anchor_links` | page, section, technique | autorský | str | `left`, `right`, `heading`, `none` |
| top | `page_template` | nlp-index | odvozený (`scripts/nlp-catalog.py`) | str |  |
| top | `page_template` | section | autorský | str |  |
| top | `sort_by` | nlp-index | odvozený (`scripts/nlp-catalog.py`) | str | `date`, `update_date`, `title`, `title_bytes`, `weight`, `slug`, `none` |
| top | `sort_by` | page, section | autorský | str | `date`, `update_date`, `title`, `title_bytes`, `weight`, `slug`, `none` |
| top | `template` | nlp-index, nlp-trainer | odvozený (`scripts/nlp-catalog.py`) | str |  |
| top | `template` | page, section | autorský | str |  |
| top | `title` | všechny | autorský | str |  |
| top | `title` | nlp, nlp-index, nlp-trainer | odvozený (`scripts/nlp-catalog.py`) | str |  |
| top | `weight` | všechny | autorský | int |  |
| top | `weight` | nlp, nlp-index, nlp-trainer | odvozený (`scripts/nlp-catalog.py`) | int |  |
| taxonomies | `categories` | nlp, nlp-trainer | odvozený (`scripts/nlp-catalog.py`) | list |  |
| taxonomies | `categories` | page, technique, quick-reference | autorský | list |  |
| taxonomies | `tags` | nlp, nlp-trainer | odvozený (`scripts/nlp-catalog.py`) | list |  |
| taxonomies | `tags` | page, glossary, technique, quick-reference | autorský, chybí-li, doplní `scripts/normalize-front-matter.py` | list |  |
| extra | `abbreviation` | glossary | autorský | str |  |
| extra | `academic_paper` | section | autorský | bool |  |
| extra | `academic_tier` | page, section | autorský | str |  |
| extra | `access_level` | page, section, technique, quick-reference | autorský | str | `^L[1-5](?:-L[1-5])?$` |
| extra | `acronym` | glossary | autorský | str |  |
| extra | `acronyms` | glossary | autorský | list |  |
| extra | `activation_channels` | glossary | autorský | list |  |
| extra | `activation_commands` | glossary | autorský | list |  |
| extra | `agent_classifications` | glossary | autorský | list |  |
| extra | `agent_count` | glossary | autorský | int |  |
| extra | `agent_tiers` | glossary | autorský | list |  |
| extra | `agents_governed` | glossary | autorský | str |  |
| extra | `aliases` | glossary | autorský | list |  |
| extra | `anonymized` | page | autorský | bool |  |
| extra | `anti_metric_enforcement` | glossary | autorský | bool |  |
| extra | `api_type` | glossary | autorský | str |  |
| extra | `api_version` | glossary | autorský | str |  |
| extra | `architecture_layer` | glossary | autorský | str |  |
| extra | `audience` | section, glossary | autorský | list, str |  |
| extra | `audit_capabilities` | glossary | autorský | list |  |
| extra | `audit_requirement` | glossary | autorský | str |  |
| extra | `audit_trail_complete` | glossary | autorský | bool |  |
| extra | `authentication` | glossary | autorský | str |  |
| extra | `author` | page, section, glossary, technique | autorský | str |  |
| extra | `authority_level` | glossary | autorský | str |  |
| extra | `authors` | glossary | autorský | list |  |
| extra | `axiom_number` | glossary | autorský | int |  |
| extra | `beam_related` | glossary | autorský | bool |  |
| extra | `beam_specific` | glossary | autorský | bool |  |
| extra | `behavioral_analysis` | glossary | autorský | bool |  |
| extra | `benefits` | glossary | autorský | list |  |
| extra | `best_practices` | glossary | autorský | str |  |
| extra | `blocking_methods` | glossary | autorský | list |  |
| extra | `bypass_mechanisms` | glossary | autorský | str |  |
| extra | `call_sign` | glossary | autorský | str |  |
| extra | `canonical` | nlp, nlp-index, nlp-trainer | odvozený (`scripts/catalogs.py`) | str |  |
| extra | `cascade_phases` | glossary | autorský | int |  |
| extra | `catalog` | nlp, nlp-index, nlp-trainer | odvozený (`scripts/catalogs.py`) | str |  |
| extra | `catalog_*` | nlp, nlp-index, nlp-trainer | odvozený (`scripts/catalogs.py`) | str, int, bool, list, table |  |
| extra | `categories` | nlp-index | odvozený (`scripts/nlp-catalog.py`) | list |  |
| extra | `categories` | page, section | autorský | list |  |
| extra | `categories_count` | section | autorský | int |  |
| extra | `category` | page, section, glossary, technique | autorský | str |  |
| extra | `category_color` | glossary | autorský | str |  |
| extra | `citation_style` | page, section | autorský | str |  |
| extra | `clearance` | glossary | autorský | str |  |
| extra | `closure_conditions` | glossary | autorský | int |  |
| extra | `closure_model` | glossary | autorský | str |  |
| extra | `code_examples` | glossary | autorský | bool, list, str |  |
| extra | `color` | page | autorský | str |  |
| extra | `color_team_integration` | glossary | autorský | bool |  |
| extra | `commander` | glossary | autorský | str |  |
| extra | `communication_patterns` | glossary | autorský | list |  |
| extra | `compiler_warnings` | glossary | autorský | str |  |
| extra | `complexity` | glossary | autorský | str |  |
| extra | `complexity_level` | glossary | autorský | str |  |
| extra | `compliance` | glossary | autorský | str |  |
| extra | `compliance_frameworks` | glossary | autorský | list |  |
| extra | `compliance_relevance` | glossary | autorský | list |  |
| extra | `compliance_relevant` | glossary | autorský | bool |  |
| extra | `confidence_scoring` | glossary | autorský | bool |  |
| extra | `confidence_threshold` | glossary | autorský | float, str |  |
| extra | `content_type` | section | autorský | list |  |
| extra | `content_version` | page, section | autorský | str |  |
| extra | `coordination_model` | glossary | autorský | str |  |
| extra | `creator` | glossary | autorský | str |  |
| extra | `credo_violations` | glossary | autorský | str |  |
| extra | `current_count` | glossary | autorský | str |  |
| extra | `current_fitness` | glossary | autorský | float |  |
| extra | `current_generation` | glossary | autorský | int |  |
| extra | `current_status` | glossary | autorský | str |  |
| extra | `data_freshness` | glossary | autorský | str |  |
| extra | `data_model` | glossary | autorský | str |  |
| extra | `date` | section | autorský | str |  |
| extra | `date_created` | page, section, glossary, technique | autorský | str |  |
| extra | `date_modified` | page, section, glossary, technique | autorský | str |  |
| extra | `date_updated` | page, section, glossary | autorský | str |  |
| extra | `design_principles` | glossary | autorský | list |  |
| extra | `detection_strategy` | glossary | autorský | str |  |
| extra | `detection_techniques` | glossary | autorský | list |  |
| extra | `dialyzer_violations` | glossary | autorský | str |  |
| extra | `difficulty` | page, section, glossary | autorský | str |  |
| extra | `difficulty_rating` | glossary | autorský | int, str |  |
| extra | `discovery_patterns` | glossary | autorský | list |  |
| extra | `doctrine` | glossary | autorský | str |  |
| extra | `documentation_quality` | glossary | autorský | str |  |
| extra | `documentation_required` | glossary | autorský | bool |  |
| extra | `domain` | glossary | autorský | str |  |
| extra | `domain_category` | glossary | autorský | str |  |
| extra | `domains` | glossary | autorský | str |  |
| extra | `domains_covered` | glossary | autorský | int |  |
| extra | `draft` | section | autorský | bool |  |
| extra | `ea_category` | technique | autorský | str |  |
| extra | `ea_code` | page, technique, quick-reference | autorský | str |  |
| extra | `ea_codes` | page | autorský | list |  |
| extra | `ea_subcategory` | technique | autorský | str |  |
| extra | `elimination_status` | glossary | autorský | str |  |
| extra | `elixir_libraries` | glossary | autorský | list |  |
| extra | `elixir_module` | glossary | autorský | str |  |
| extra | `elixir_modules` | glossary | autorský | list |  |
| extra | `enforcement_layers` | glossary | autorský | int |  |
| extra | `enforcement_level` | glossary | autorský | str |  |
| extra | `entries` | page | autorský | int |  |
| extra | `epistemic_framework` | page | autorský | str |  |
| extra | `escalation_target` | glossary | autorský | str |  |
| extra | `estimated_reading_time` | glossary | autorský | str |  |
| extra | `ethics_check_interval` | glossary | autorský | str |  |
| extra | `evolution_support` | glossary | autorský | str |  |
| extra | `external_resources` | glossary | autorský | list |  |
| extra | `false_negative_impact` | glossary | autorský | str |  |
| extra | `false_positive_impact` | glossary | autorský | str |  |
| extra | `false_positive_threshold` | glossary | autorský | str |  |
| extra | `fingerprinting_layers` | glossary | autorský | int |  |
| extra | `first_introduced` | glossary | autorský | str |  |
| extra | `founded` | glossary | autorský | str |  |
| extra | `framework` | glossary | autorský | str |  |
| extra | `gdpr_compliant` | glossary | autorský | bool |  |
| extra | `generation` | glossary | autorský | int |  |
| extra | `glossary_target` | page | autorský | str |  |
| extra | `glossary_terms` | page, section | autorský | list |  |
| extra | `governance_model` | glossary | autorský | str |  |
| extra | `historical_peak` | glossary | autorský | str |  |
| extra | `icon` | page | autorský | str |  |
| extra | `image` | page, section, glossary | autorský | str |  |
| extra | `image_alt` | page, section, glossary | autorský | str |  |
| extra | `implementation_guide` | glossary | autorský | str |  |
| extra | `implementation_patterns` | glossary | autorský | list |  |
| extra | `implementation_status` | glossary | autorský | str |  |
| extra | `importance` | glossary | autorský | str |  |
| extra | `independence_requirement` | glossary | autorský | str |  |
| extra | `index_command` | glossary | autorský | str |  |
| extra | `industry_comparison` | glossary | autorský | str |  |
| extra | `industry_usage` | glossary | autorský | str |  |
| extra | `insert_anchor_links` | page, section | autorský | str |  |
| extra | `integration_pattern` | glossary | autorský | str |  |
| extra | `integration_points` | glossary | autorský | list |  |
| extra | `integration_systems` | glossary | autorský | list |  |
| extra | `interactive` | glossary | autorský | str |  |
| extra | `interactive_demos` | glossary | autorský | list |  |
| extra | `isolation_level` | glossary | autorský | str |  |
| extra | `key_agents` | glossary | autorský | list |  |
| extra | `key_benefit` | glossary | autorský | str |  |
| extra | `key_benefits` | glossary | autorský | list |  |
| extra | `key_takeaway` | glossary | autorský | str |  |
| extra | `key_technologies` | glossary | autorský | list |  |
| extra | `keywords` | nlp, nlp-index | odvozený (`scripts/nlp-catalog.py`) | list |  |
| extra | `keywords` | page, section, glossary | autorský | list |  |
| extra | `kompendium` | page, section | autorský | list |  |
| extra | `landing_page` | section | autorský | bool |  |
| extra | `lang` | nlp, nlp-index | odvozený (`scripts/nlp-catalog.py`) | str |  |
| extra | `language` | section | autorský | str |  |
| extra | `last_enhanced` | page, section | autorský | str |  |
| extra | `last_updated` | glossary | autorský | str |  |
| extra | `layer` | glossary | autorský | str |  |
| extra | `lead` | section | autorský | str |  |
| extra | `learning_outcomes` | glossary | autorský | list |  |
| extra | `learning_path` | glossary | autorský | list, str |  |
| extra | `level` | page | autorský | str |  |
| extra | `license_framework` | page, section | autorský | str |  |
| extra | `matching_algorithms` | glossary | autorský | list |  |
| extra | `matching_strategies` | glossary | autorský | list |  |
| extra | `maturity` | glossary | autorský | str |  |
| extra | `measurement_approach` | glossary | autorský | str |  |
| extra | `measurement_precision` | glossary | autorský | str |  |
| extra | `minimum_signals` | glossary | autorský | int |  |
| extra | `mission_types` | glossary | autorský | list |  |
| extra | `modality` | page | autorský | str |  |
| extra | `monitoring` | glossary | autorský | list |  |
| extra | `nabla_compliance` | glossary | autorský | str |  |
| extra | `nabla_compliant` | glossary | autorský | bool |  |
| extra | `nlp_*` | nlp, nlp-index | odvozený (`scripts/nlp-catalog.py`) | str, int, bool, list, table |  |
| extra | `notation` | section | autorský | str |  |
| extra | `og_type` | page, section | autorský | str |  |
| extra | `origin` | glossary | autorský | str |  |
| extra | `osint_enrichment` | glossary | autorský | bool |  |
| extra | `osint_relevant` | glossary | autorský | bool |  |
| extra | `otp_behaviour` | glossary | autorský | bool |  |
| extra | `override_authority` | glossary | autorský | str |  |
| extra | `override_capability` | glossary | autorský | str |  |
| extra | `paradigm` | glossary | autorský | str |  |
| extra | `parent` | page, section, technique, quick-reference | zakázaný | str |  |
| extra | `parent_chapter` | technique | autorský | str |  |
| extra | `pattern_type` | glossary | autorský | str |  |
| extra | `peer_reviewed` | page, section | autorský | bool |  |
| extra | `performance_critical` | glossary | autorský | bool |  |
| extra | `phase` | page | autorský | str |  |
| extra | `philosophy_level` | page, section | autorský | str |  |
| extra | `phoenix_component` | glossary | autorský | bool |  |
| extra | `phoenix_integration` | glossary | autorský | str |  |
| extra | `pipeline_model` | glossary | autorský | str |  |
| extra | `platform_adoption` | glossary | autorský | str |  |
| extra | `platform_component` | glossary | autorský | str |  |
| extra | `platform_integration` | glossary | autorský | str |  |
| extra | `platform_relevance` | glossary | autorský | str |  |
| extra | `platform_version` | glossary | autorský | str |  |
| extra | `platforms` | glossary | autorský | list |  |
| extra | `pre_commit_phases` | glossary | autorský | str |  |
| extra | `prerequisite_concepts` | glossary | autorský | list |  |
| extra | `prerequisite_knowledge` | glossary | autorský | list |  |
| extra | `prerequisites` | glossary | autorský | list |  |
| extra | `prevention_mechanism` | glossary | autorský | str |  |
| extra | `prilohy` | page, section | autorský | list |  |
| extra | `prismatic_components` | glossary | autorský | list |  |
| extra | `prismatic_module` | glossary | autorský | str |  |
| extra | `prismatic_modules` | glossary | autorský | list |  |
| extra | `prismatic_usage` | glossary | autorský | str |  |
| extra | `privacy_by_design` | glossary | autorský | bool |  |
| extra | `process_model` | glossary | autorský | str |  |
| extra | `programming_languages` | glossary | autorský | list |  |
| extra | `qdp_eliminated` | glossary | autorský | str |  |
| extra | `quality_domains` | glossary | autorský | int, str |  |
| extra | `quality_domains_clean` | glossary | autorský | str |  |
| extra | `quality_gates` | glossary | autorský | list |  |
| extra | `quality_impact` | glossary | autorský | str |  |
| extra | `quality_metrics` | glossary | autorský | list |  |
| extra | `quality_score` | page, section, glossary, technique | zakázaný | int, str |  |
| extra | `query_language` | glossary | autorský | str |  |
| extra | `reading_time` | page, section, glossary | zakázaný | str |  |
| extra | `real_time_classification` | glossary | autorský | bool |  |
| extra | `ref_count_at_creation` | glossary, technique | zakázaný | int |  |
| extra | `refresh_rate` | glossary | autorský | str |  |
| extra | `registry_file` | glossary | autorský | str |  |
| extra | `related_app` | glossary | autorský | str |  |
| extra | `related_apps` | glossary | autorský | list |  |
| extra | `related_architectures` | glossary | autorský | list |  |
| extra | `related_articles` | page, section | autorský | list |  |
| extra | `related_concepts` | glossary | autorský | list |  |
| extra | `related_disciplines` | glossary | autorský | list |  |
| extra | `related_patterns` | glossary | autorský | list |  |
| extra | `related_terms` | page, glossary, technique, quick-reference | autorský | list |  |
| extra | `remediation_approach` | glossary | autorský | str |  |
| extra | `requires_knowledge` | glossary | autorský | list |  |
| extra | `response_time` | glossary | autorský | str |  |
| extra | `risk_categories` | glossary | autorský | list |  |
| extra | `risk_level` | nlp | odvozený (`scripts/nlp-catalog.py`) | str | `low`, `moderate`, `high` |
| extra | `risk_level` | page, technique, quick-reference | autorský | str | `low-moderate`, `moderate`, `moderate-high`, `high`, `critical`, `extreme`, `ultramarine` |
| extra | `runtime_agents` | glossary | autorský | str |  |
| extra | `safety_critical_agents` | glossary | autorský | int, list |  |
| extra | `safety_level` | glossary | autorský | str |  |
| extra | `scalability` | glossary | autorský | str |  |
| extra | `scan_engine` | glossary | autorský | str |  |
| extra | `scanning_modes` | glossary | autorský | list |  |
| extra | `schema_type` | nlp | odvozený (`scripts/nlp-catalog.py`) | str | `DefinedTerm` |
| extra | `schema_type` | nlp-index | odvozený (`scripts/nlp-catalog.py`) | str | `DefinedTermSet` |
| extra | `scope` | glossary | autorský | str |  |
| extra | `screening_threshold` | glossary | autorský | float |  |
| extra | `section` | section | autorský | str |  |
| extra | `section_icon` | nlp-index | odvozený (`scripts/nlp-catalog.py`) | str |  |
| extra | `section_icon` | page, section, technique | autorský | str |  |
| extra | `section_id` | section | autorský | str |  |
| extra | `section_type` | section | autorský | str |  |
| extra | `security_domain` | glossary | autorský | str |  |
| extra | `security_relevant` | glossary | autorský | bool |  |
| extra | `see_also` | page, section, glossary | autorský | list |  |
| extra | `session_protocol` | glossary | autorský | str |  |
| extra | `signal_flow` | glossary | autorský | str |  |
| extra | `signal_plurality_enforced` | glossary | autorský | bool |  |
| extra | `similarity_metrics` | glossary | autorský | list |  |
| extra | `since_generation` | glossary | autorský | int |  |
| extra | `sovereignty_model` | page, section | autorský | str |  |
| extra | `specification_directory` | glossary | autorský | str |  |
| extra | `specification_format` | glossary | autorský | str |  |
| extra | `stability` | glossary | autorský | str |  |
| extra | `stability_level` | glossary | autorský | str |  |
| extra | `standards` | glossary | autorský | list |  |
| extra | `static_agents` | glossary | autorský | str |  |
| extra | `status` | page, section, glossary | autorský | str |  |
| extra | `stub` | section | autorský | bool |  |
| extra | `subcategory` | glossary | autorský | str |  |
| extra | `supported_lists` | glossary | autorský | list |  |
| extra | `tags` | nlp-index | odvozený (`scripts/nlp-catalog.py`) | list |  |
| extra | `tags` | section | autorský | list |  |
| extra | `teams_coordinated` | glossary | autorský | list |  |
| extra | `technical_domain` | glossary | autorský | str |  |
| extra | `technical_level` | glossary | autorský | str |  |
| extra | `techniques_published` | section | autorský | int |  |
| extra | `technologies` | glossary | autorský | list |  |
| extra | `technology_type` | glossary | autorský | str |  |
| extra | `telemetry_enabled` | glossary | autorský | bool |  |
| extra | `telemetry_namespace` | glossary | autorský | str |  |
| extra | `testing_approach` | glossary | autorský | list |  |
| extra | `testing_scenarios` | glossary | autorský | list |  |
| extra | `testing_strategy` | glossary | autorský | str |  |
| extra | `threat_actor_attribution` | glossary | autorský | bool |  |
| extra | `tier` | glossary | autorský | str |  |
| extra | `tier_levels` | glossary | autorský | list |  |
| extra | `time_to_learn` | glossary | autorský | str |  |
| extra | `toc` | nlp, nlp-index, nlp-trainer | odvozený (`scripts/nlp-catalog.py`) | bool |  |
| extra | `toc` | page, section, technique, quick-reference | autorský | bool |  |
| extra | `tools` | glossary | autorský | list |  |
| extra | `total_agents` | glossary | autorský | int, str |  |
| extra | `total_eliminated` | glossary | autorský | int |  |
| extra | `total_improvements` | glossary | autorský | int |  |
| extra | `total_qdp` | glossary | autorský | int |  |
| extra | `total_teams` | glossary | autorský | int |  |
| extra | `total_techniques_planned` | section | autorský | int |  |
| extra | `total_terms` | section | autorský | int |  |
| extra | `transition_mechanism` | glossary | autorský | str |  |
| extra | `twitter_card` | page, section | autorský | str |  |
| extra | `type` | page | autorský | str |  |
| extra | `umbrella_apps` | glossary | autorský | list |  |
| extra | `use_cases` | glossary | autorský | list |  |
| extra | `verification_model` | page | autorský | str |  |
| extra | `version` | glossary | autorský | str |  |
| extra | `version_introduced` | glossary | autorský | str |  |
| extra | `violation_levels` | glossary | autorský | list |  |
| extra | `violation_response` | glossary | autorský | str |  |
| extra | `weighting_model` | glossary | autorský | str |  |
| extra | `word_count` | page, section, glossary | zakázaný | int |  |
<!-- front-matter-schema:end -->

# Failure behaviour

`scripts/check-ia.py` skončí kódem 1 při každém porušení, které není v
`scripts/ia-baseline.json`. Základ obsahuje jen stav z doby zavedení pravidla a smí se jen
zmenšovat (`--update-baseline` odmítne cokoli přidat). Nový požadavek se zavádí jednou a
výslovně: `--introduce <požadavek>` přidá do základu jeho tehdejší porušení a podruhé už to
neudělá. Zvýšení prahu existujícího požadavku (2026-11-10: `detail` z 600 na 1100 slov na
pokyn autora „rozvin kazdy jeden markdown na 2x A4+ rozsah“) se do základu přidá jednou přes
`--extend <požadavek>` a commit uvede, co se zvýšilo a proč. Commit, který pravidlo poruší, se
opraví dřív, než se sloučí do `main`.

Požadavky `placeholder` a `technique-page` se do základu nedostanou nikdy (`--introduce`
a `--extend` je odmítnou, ruční zápis do základu se ignoruje). Stránky, které je porušovaly
už při jejich zavedení (2026-11-10: `placeholder` 2, `technique-page` 6), počítá
`PENDING_ZERO` ve `scripts/check-ia.py`: brána selže, jakmile jejich počet vzroste, číslo se
smí jen snižovat a při nule položka zůstane s nulou (bez ní by šlo o běžný požadavek, který lze
zapsat do základu). Opravují se v obsahu, nepřijímají se.

## Kategorie a podkategorie

Každá stránka má odvozený typ (`typ`: technika, pojem, most pojmu, kazuistika, krizový
protokol …) a jednu nebo více oblastí (`oblasti`: klinická praxe, právo a forenzní praxe,
filozofie a teorie, digitální prostředí …); stránky s kódem EA mají rodinu (`rodina`, EA-N) a
podrodinu (`podrodina`, EA-N.M). Každá stránka má navíc průřezové dimenze `publikum` (komu slouží: klinik, vyšetřovatel, právník, výzkumník, pedagog, zasažený, obecný) a `pilíř` (jakou obrannou funkci plní: rozpoznání, odlišení, obrana, zotavení, prevence, teorie, kontext), odvozené z typu, takže web propojuje stránky napříč sekcemi i podle publika a funkce. Nic z toho se nepíše na stránku: typy a oblasti s českým
názvem a popisem jsou v `data/categories.toml`, názvy rodin a podrodin v rejstříku technik
(`## Kapitola N — …`, `### N.M …` a řádky `| \`EA-N.M\` | … |`), a `scripts/build-graph.py`
je zapíše do uzlů `static/data/graph.json` spolu s rejstříkem `categories`, z něhož web staví
rozcestníky kategorií a štítky stránek. Nový oddíl bez řádku `typ` sestavení zastaví
(`build-graph.py` skončí chybou, a tím i `--check` a `verify-content.sh`); kategorie se tedy
rozšiřuje přidáním řádku, ne úpravou stránek.

# Verification

```sh
python3 scripts/normalize-front-matter.py --check  # exit 0
python3 scripts/check-ia.py                        # exit 0; vypíše zbývající porušení
python3 scripts/build-graph.py --check             # exit 0
```
