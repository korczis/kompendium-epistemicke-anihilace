---
id: project.nlp-catalog
version: 1
kind: rule
title: Katalog NLP vzorců je jediný zdroj sekce nlp-vzorce a vše ostatní se z něj odvozuje
description: Každý NLP vzorec, princip a pojem má záznam v data/nlp/, vlastní stránku a odvozené vazby; brána scripts/nlp-catalog.py --check drží katalog, stránky, citace a data trenéru v souladu.
statement: Zapisuj každé heslo sekce content/kompendium/nlp-vzorce/ nejdřív do katalogu data/nlp/, piš jen jeho prózu a popis, nech front matter, tabulku, Literaturu, Související, výpisy rodin a data trenéru odvodit skriptem scripts/nlp-catalog.py a před každým commitem ověř, že projde scripts/nlp-catalog.py --check.
status: active
class: blocking
depends_on: [project.content-defensive-frame@1, project.content-sources-verifiable@1, project.information-architecture@1]
tags: [content, nlp, catalogue, derived, sources, safety]
---

# Rationale

Sekce NLP vzorců má přes 400 hesel ve 22 rodinách, každé s vlastní stránkou, rozcestníky
rodin a interaktivním trenérem rozpoznávání. Píší ji paralelně agenti a bude se rozšiřovat.
Ručně psané identifikátory, výpisy rodin, zpětné vazby mezi vzorci nebo seznamy literatury by
se rozešly s obsahem při první změně. Vymyšlená citace by zpochybnila celou knihu a text, který
by fungoval jako návod, by obrátil sekci proti lidem, které má chránit. Autor 2026-11-10
rozhodl o kanonickém katalogu z primární a kritické literatury a o nové sekci; rozhodnutí jsou
zapsána přes `majordomus decision`.

# Required behaviour

| co | jak |
|---|---|
| zdroj pravdy | `data/nlp/_families.toml` (rodiny, neměnný kód), `data/nlp/<rodina>.toml` a jeho části `<rodina>.<část>.toml` (hesla `[[pattern]]`), `data/nlp/_sources.toml` (ověřená bibliografie) |
| identita | `id` = `NLP-<kód rodiny>.NN`, po zveřejnění se nemění; `slug` je jednoznačný v celém katalogu; `type` je `pattern`, `principle` nebo `concept` |
| bijekce | každé heslo má stránku `content/kompendium/nlp-vzorce/<rodina>/<slug>.md`, každá stránka sekce má heslo; každá rodina má `_index.md` |
| vlastnictví | pisatel vlastní jen `description` a prózu od `## Definice`; front matter, H1, identifikační tabulka, `## Literatura`, `## Související`, výpisy rodin, souhrny sekce a `static/data/nlp-trener.json` zapisuje jen `scripts/nlp-catalog.py` mezi značkami `kompendium:nlp-*` |
| vazby | `broader` je směrová vazba (podřazené se odvozují), `related` je symetrická (zrcadlí ji generátor), `kompendium` vede na existující stránky knihy mimo sekci |
| struktura | povinné oddíly v pořadí: Definice, Původ a souvislosti, Struktura vzorce, Detekční znaky, Legitimní a manipulativní užití, Stav důkazů, Obrana a zotavení; aspoň 1150 slov prózy, rozcestník rodiny také |
| citace | jen díla z `_sources.toml` v podobě `cite` v závorce; každý povinný oddíl cituje; aspoň čtyři různá díla; Stav důkazů cituje kritické dílo; Literatura obsahuje přesně citovaná díla; Vaknin 2008 se na stránce hesla necituje, dokud je vazba jen `inferred` |
| obranný rámec | žádné kroky postupu, žádné pokyny namířené na cílovou osobu (lexikon `HOWTO` v `scripts/ia_model.py`, požadavek `howto` v `check-ia.py`); totéž platí pro příklady trenéru, z nichž každý nese detekční znak a obrannou odpověď |
| metadata | front matter každého hesla nese pod `[extra]` všechna odvoditelná pole `nlp_*` (identita, rodina, druh, užití, riziko, hierarchie a předci, symetrické vazby, odkazy v próze, citovaná díla podle skupin, počty citací a slov, oddíly, trenér, původ, recenze, zdrojový soubor) a `keywords`, `lang`, `schema_type`; nic z toho se nepíše ručně |
| export | `static/data/nlp-katalog.json` je celý katalog pro integrace (rodiny, hesla se stejnými poli jako front matter, typované hrany, citovaná díla); `static/data/nlp-trener.json` jsou data trenéru; oba odvozuje generátor |
| trenér | každé heslo má aspoň dva příklady, aspoň jeden manipulativní a jeden neškodný kontrast; data trenéru se odvozují, nikdy se nepíšou ručně |
| recenze | `review = "agent"` znamená text agenta, který čeká na odbornou recenzi; na `owner` ho mění jen autor po recenzi |

# Failure behaviour

`scripts/nlp-catalog.py --check` skončí kódem 1 při každém porušení katalogu, bijekce,
struktury, citací, obranného rámce nebo při zastaralé odvozené části a vypíše, co a kde.
Commit, po kterém brána selže, se opraví novým commitem dřív, než se sloučí do `main`.
Stránky sekce zároveň podléhají bráně informační architektury (`scripts/check-ia.py`), která
smí stav jen zlepšit.

# Verification

```sh
python3 scripts/nlp-catalog.py --check   # exit 0; katalog, stránky a data trenéru souhlasí
python3 scripts/check-ia.py              # exit 0; sekce nepřidala žádné porušení
bash test/run.sh                         # případ nlp-catalog odhalí zastaralý blok a cizí citaci
```
