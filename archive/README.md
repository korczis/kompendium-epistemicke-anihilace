# Archiv: vývojové linie kompendia

Kniha vznikala od března 2025 na několika místech. Každá linie je sem převzata **i s historií**
(`scripts/import-lineage.sh`, `git filter-repo`), takže `git log -- archive/<linie>` ukazuje
původní commity, autory a data. Na webu se archiv nevykresluje; je to paměť projektu.

Jedinou úpravou obsahu jsou soukromé e-mailové adresy autora (nahrazené textem
„[e-mail odstraněn]“, případně odkazem na Issues) a odkazy na soukromý monorepozitář, které
míří sem.

## Linie

| Složka | Zdroj | Období | Commity | Soubory |
|---|---|---|---:|---:|
| `gists/918701a95ea28eb31f3f3b717ea56e9b/` | gist „Epistemická a kognitivní anihilace: kompletní taxonomie“ (obsah, rejstříky, výkladový slovník) | 2025-03-23 | 1 | 5 |
| `gists/70f09b489526bc5ecf8438400c3c4fdf/` | gist „Hypersyntaktická anihilace“, „Implozivní rekurze“ | 2025-03-26 | 1 | 2 |
| `prismatic-legacy/` | `gitlab.com/korczis/prismatic-legacy`: `unsorted/kompendium`, `sites/blog/content/{kompendium,anihilace}`, zástupné články | 2025-03-23 až 2025-05-07 | 5 | 66 |
| `gists/67b1c61716df44a0f05ecc28f4b9887d/` | gist „Absolutní epistemická disoluční komora“ | 2025-07-10 | 1 | 1 |
| `prismatic/` | `gitlab.com/korczis/prismatic`: `docs/kompendium` (první strukturovaná verze s osmi oddíly) | 2025-07-26 až 2025-07-27 | 3 | 29 |
| `docs-kompendium/` | Prismatic Platform, `docs/kompendium` | 2025-09-30 až 2026-08-30 | 8 | 29 |
| `psychonautic/` | `gitlab.com/korczis/psychonautic`: znalostní báze `epistemic-annihilation.kb.md` | 2026-01-31 | 1 | 1 |
| `../content/kompendium/` | Prismatic Platform, `apps/prismatic_web/priv/content/kompendium` — **plná kniha**, ze které se generuje web | 2026-04-25 až dnes | 51 | 1587 |

Počty commitů zahrnují jen commity, které se dané složky dotkly; slučovací commity linií
v tabulce nejsou.

`prismatic-legacy/unsorted/kompendium/intelectual-brutality.md` je rozhovor, ve kterém poprvé
vznikla struktura knihy. Zip v `prismatic-legacy/junkyard/zip/` obsahuje 14 vygenerovaných
zástupných článků z dubna 2025.

## Co tu není

- Čtyři další gisty („Destroy“ `db3633d25c3f`, „Manifest“ `e44124e8a1e0`, „PICA“ `2da53c372f74`
  a `9b860df57a1a`) se o anihilaci zmiňují, ale součástí knihy nejsou. Autor 2026-11-09
  rozhodl (session `5d49a595-d035-4bbe-b04a-d12695922860`): „ne, ty gisty tam nepřidávej“.
- Vyrenderovaný web z doby platformy stále běží na
  <https://prismatic-reality-com.github.io/prismatic-promo/kompendium/>
  (`github.com/prismatic-reality-com/prismatic-promo`, poslední nasazení `e6caea928`, 2026-05-06).
  Je to výstup z `content/kompendium`, ne samostatná verze.

## Jak byl archiv sestaven

Před zveřejněním proběhlo prohledání všech dosažitelných uzlů (tento MacBook, `imac`,
`ubuntu`/`lundra`, druhý MacBook) přes SSH: každý git repozitář, každý ref, celá historie,
plus soubory mimo git. K tomu GitLab (blob search ve všech projektech) a gisty. Uzly `jetson`,
`able` a `macbook` byly v době hledání offline.

Licence: CC BY-NC-SA 4.0, viz `../LICENSE-CONTENT.md`.
