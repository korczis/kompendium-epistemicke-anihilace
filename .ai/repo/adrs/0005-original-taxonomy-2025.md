---
schema: adr/v1
id: adr-0005
kind: adr
title: "Původní taxonomie 2025: katalog, aliasy a vlastní stránky bez duplikátů a bez operačních částí"
status: accepted
date: 2026-11-10
tags:
  - content
  - sources
  - taxonomy
provenance:
  origin: authored
---

# 5. Původní taxonomie 2025

## Context

Kniha vznikla z autorovy taxonomie z roku 2025, zapsané v soukromém gistu. Platforma z něj
později vytěžila archiv kódů EA-NNN (viz ADR 0002). Kniha dnes používá kódy EA-X.Y.Z a
z pojmenovaných technik původní taxonomie má vlastní stránku jen malá část.

Pokyn autora doslova (bez diakritiky, jak byl napsán), session
`62aaa969-db73-4419-aeb1-23bc36e05c88` (`kompendium-epistemicke-anihilace-2e`), 2026-11-10
přibližně 06:27Z (záznam fronty 06:26:53Z); předala session 2e a obsahová session ho ověřila
v přepisu:

- „na github, gist, ci druhem mb pro mam jist cele kompendium, jsou tam mraky technik, najdi je
  a integruj“

Zdroje: autorův gist z 2025-03-23 (obsah, abecední a tematický rejstřík, výkladové slovníky)
a dva další autorovy gisty se třemi stránkami jednotlivých technik ve formátu Zola, archivované
v `archive/gists/` (popis v `archive/README.md`), a archiv EA-NNN platformy (ADR 0002), vytěžený
z téhož gistu parserem platformy. Archiv obsahuje jen tyto soubory; dodatek A je v něm pouze
položkou obsahu, ne textem, a gisty vyloučené níže archivovány nejsou.

## Decision

1. **Jeden engine.** Původní techniky vstupují jen jako katalog `puvodni-taxonomie` v
   `data/catalogs.toml` přes `scripts/catalogs.py`: název, slug, původní číslo, zdroje,
   kanonická stránka a převodník na EA-X.Y.Z. Převodník zůstává prázdný, dokud ho někdo
   neprověří; nikdy se neodvozuje porovnáním řetězců.
2. **Shoda znamená alias, ne stránku.** Pojmenovává-li původní technika týž konstrukt jako
   existující stránka EA-X.Y.Z, nese tato stránka původní název jako alias a kanonická stránka
   katalogu ukazuje na ni.
3. **Bez protějšku vlastní stránka.** Původní technika bez protějšku dostane stránku v
   `content/kompendium/puvodni-taxonomie/`. Stránka ji označí jako vlastní pojem knihy, cituje
   skutečné konstrukty, které pojmenovává, a popíše rozpoznání, odlišení, obranu a zotavení,
   bez kroků provedení. Získá-li po prověrce kód EA, přesune se do `techniques/` s aliasem, takže
   nikdy neexistuje dvakrát.
4. **Pojmy výkladového slovníku.** Pojem, který už má heslo glosáře, toto heslo rozšíří; pojem
   bez hesla dostane nové heslo. Kanonickou stránkou pojmu je glosář, kanonickou stránkou
   techniky bez kódu EA je sekce původní taxonomie.
5. **Vyloučeno pravidlem.** Do knihy se nepřevezme: dodatek A původní taxonomie
   („implementační fáze“, „destruktivní účinky“), protože jde o operační postupy, které
   pravidlo `project.content-defensive-frame` vylučuje; gisty se sexuálním obsahem (třída
   `TECHNIKA_*`), osobní lexikon autora, „Biomanipulation“, třída `AM_I_*` a shrnutí cizí knihy
   (autorské právo). Výluky jsou třídy cest a názvů v `data/platform-exclusions.toml` a
   `catalogs.py --check` je odmítne; nespoléhá se na pozornost pracovníka.
6. **Pořadí.** První vlna: 37 pojmů podrobného výkladového slovníku a pět stránek rodin
   (kapitoly 6–10 původní taxonomie). Druhá vlna: techniky abecedního rejstříku. Názvy, které
   jsou jen v archivu, se po prověrce přiřadí, nebo vypustí.

## Consequences

- Každá technika a každý pojem původní taxonomie má právě jednu stránku: existující stránku
  EA-X.Y.Z s aliasem, heslo glosáře, nebo stránku sekce `puvodni-taxonomie`. Tím platí pokyny
  „pojem = stránka = odkaz“ (ADR 0004) i „zadne duplikace“.
- Katalog a výluky vstupují do `main` spolu s `scripts/catalogs.py` a jeho `--check`; dokud
  importér neexistuje, nevstupuje do knihy z původní taxonomie nic.
- Stránky splňují akademický standard (ADR 0004) a ověřitelnost zdrojů
  (`project.content-sources-verifiable`); původní gist je zdrojem názvu, ne doložením tvrzení.
