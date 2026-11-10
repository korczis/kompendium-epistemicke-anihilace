---
id: project.content-catalogs
version: 1
kind: rule
title: Katalogy knihy jsou data a jeden engine z nich odvozuje vše ostatní
description: Každý katalog (NLP vzorce, argumentační fauly, …) je deklarovaný v data/catalogs.toml, má heslo na každou položku a vše odvozené píše a hlídá jeden engine scripts/catalogs.py.
statement: Zakládej a rozšiřuj katalogy knihy jen přes data – deklaraci data/catalogs.toml, data rodin a hesel a společnou bibliografii data/sources.toml –, piš jen prózu a popis hesla, nech všechno odvoditelné zapsat engine scripts/catalogs.py, nikdy nevytvářej druhou stránku pro pojem, který kniha už má, a před každým commitem ověř, že projde scripts/catalogs.py --check.
status: active
class: blocking
depends_on: [project.content-defensive-frame@1, project.content-sources-verifiable@1, project.information-architecture@1]
tags: [content, catalogue, derived, sources, safety, no-duplicates]
---

# Rationale

Kniha má katalogy, které se rozrůstají po stovkách hesel: NLP vzorce, argumentační fauly a
další, které přijdou. Kdyby měl každý katalog vlastní generátor, bránu, šablonu a trenéra,
rozešly by se při první změně a údržba by se násobila. Ručně psané identifikátory, výpisy
rodin, vazby nebo seznamy literatury zastarají; dvě stránky pro jeden pojem rozdělí odkazy a
čtenáře. Autor 2026-11-10 požadoval, aby vše bylo odvozené, generické, datově řízené,
rozšiřitelné, bez duplicit a bez ruční údržby, s jedním centrálním enginem.

# Required behaviour

| co | jak |
|---|---|
| deklarace | `data/catalogs.toml`: každý katalog jedním blokem (adresář dat, sekce, předpona identifikátoru, slovníky druhů, užití a rizik, povinné oddíly, oddíl důkazů, exporty, volitelný původ z jedné knihy); nový katalog nepřidává žádný skript, šablonu ani bránu |
| data | `<adresář>/_families.toml` (rodiny, neměnný kód) a `<adresář>/<rodina>.toml` s částmi `<rodina>.<část>.toml` (hesla `[[pattern]]`); bibliografie je jedna pro všechny katalogy: `data/sources.toml` |
| identita | `id` = `<předpona>-<kód rodiny>.NN`, po zveřejnění se nemění; `slug` a slug rodiny jsou jednoznačné napříč všemi katalogy, takže `related` a `broader` smějí vést i do jiného katalogu |
| bez duplicit | pojem, který už má v knize stránku (heslo glosáře, technika), dostane v katalogu `canonical = "<cesta>"`: žádnou vlastní stránku; katalog, exporty, průzkumník i trenér odkazují kanonickou stránku; vlastní stránka u kanonického hesla je chyba |
| vlastnictví | pisatel vlastní jen `description` a prózu od `## Definice`; front matter (`catalog` a pole `catalog_*`), H1, identifikační tabulka, `## Literatura`, `## Související`, výpisy rodin, souhrny sekce, stránka trenéra a exporty zapisuje jen engine mezi značkami `kompendium:katalog-*`; počty slov a citací jsou jen v exportech |
| struktura | povinné oddíly katalogu v pořadí; aspoň 1150 slov prózy hesla i rozcestníku rodiny |
| citace | jen díla z `data/sources.toml` v podobě `cite` v závorce; každý povinný oddíl cituje; aspoň čtyři různá díla; oddíl důkazů cituje dílo skupiny `critical`; dílo z neověřeného původu se na stránce hesla necituje |
| obranný rámec | žádné kroky postupu, žádné pokyny namířené na cílovou osobu (lexikon `HOWTO` v `scripts/ia_model.py`); totéž pro příklady trenéru, každý s detekčním znakem a obrannou odpovědí |
| trenér | jeden trenér nad všemi katalogy (`kompendium/trener.md`, šablona `kompendium/katalog-trener.html`) čte index `static/data/katalogy.json`; každé heslo má aspoň dva příklady, aspoň jeden manipulativní nebo chybný a jeden neškodný kontrast; trenér cvičí rozpoznání a obranu, nikdy tvorbu výroků |
| průzkumník | jedna šablona `partials/explorer-katalog.html` a skript `static/js/viz/katalog.js` pro každou sekci a rodinu katalogu; data čte z odvozeného `extra.catalog_export` |
| odkazy | `scripts/link-terms.py` odkazuje hesla katalogů podle jejich názvů a aliasů (v celé knize jen výrazné názvy, uvnitř sekcí katalogů i víceslovné) |
| recenze | `review = "agent"` je text agenta čekající na odbornou recenzi; na `owner` ho mění jen autor |

# Failure behaviour

`scripts/catalogs.py --check` skončí kódem 1 při každém porušení katalogu, bijekce, kanonické
vazby, struktury, citací, obranného rámce nebo při zastaralé odvozené části a vypíše, co a kde.
Commit, po kterém brána selže, se opraví novým commitem dřív, než se sloučí do `main`. Stránky
katalogů zároveň podléhají bráně informační architektury (`scripts/check-ia.py`).

# Verification

```sh
python3 scripts/catalogs.py --check   # exit 0; všechny katalogy, stránky, exporty a trenér souhlasí
python3 scripts/check-ia.py           # exit 0; katalogy nepřidaly žádné porušení
bash test/run.sh                      # případ catalogs odhalí cizí citaci, ruční zásah, návod,
                                      # stránku bez hesla, trenéra bez kontrastu a duplikát kanonického hesla
```
