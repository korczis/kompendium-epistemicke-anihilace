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
opraví umístění popisu a štítků a převede YAML na TOML beze změny čehokoli jiného.

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
smí jen snižovat a při nule se položka odstraní. Opravují se v obsahu, nepřijímají se.

# Verification

```sh
python3 scripts/normalize-front-matter.py --check  # exit 0
python3 scripts/check-ia.py                        # exit 0; vypíše zbývající porušení
python3 scripts/build-graph.py --check             # exit 0
```
