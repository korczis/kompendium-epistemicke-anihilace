---
id: project.content-no-placeholders
version: 1
kind: rule
title: Kniha neobsahuje placeholdery, pahýly ani generovanou výplň
description: Žádná stránka v content/ není placeholder, pahýl, ohlášení budoucího obsahu ani strojově generovaný výplňový blok; nedokončená stránka se nesloučí.
statement: Nikdy nevytvářej ani neslučuj stránku, která je placeholder, pahýl (stub), ohlášení obsahu „v rekonstrukci“ nebo „v přípravě“, rezervovaná kapitola nebo strojově generovaná výplň; chybějící cíl odkazu se řeší plně napsanou stránkou nebo opravou odkazu, nikdy prázdnou stránkou.
status: active
class: blocking
depends_on: [project.content-linked-and-built@1, project.information-architecture@1]
tags: [content, completeness, quality]
---

# Rationale

Při převodu z platformy vzniklo 200 stránek, které knihu jen předstíraly: 18 stránek
s poznámkou „Tato stránka je placeholder vytvořený pro vyřešení broken refs“, 128 hesel
„structural stub“ či „Strukturální stub zápis“ z automatického průchodu z 2026-05-03 a 54
stránek, jejichž text tvořil generovaný blok `NLLB-AUTO-BLOCK` („Manažerské shrnutí …
zero-stub-tolerance doktríny“). Placeholder opravil chybu sestavení, ale vytvořil horší chybu:
čtenář dostal odkaz, který slibuje výklad, a našel prázdnou stránku. Odborný čtenář takovou
stránku čte jako důkaz, že kniha není hotová; vyhledávač ji indexuje jako obsah. Měřeno a
odstraněno 2026-11-10 (úkol `t-20261110003305-5b6f`).

# Required behaviour

- Každá stránka v `content/` je napsaná v plném rozsahu podle pravidla
  `project.content-academic-style`; neexistuje mezistav „zatím pahýl“.
- Nefunkční odkaz `@/` se opraví buď přesměrováním na existující stránku, nebo plně
  napsanou cílovou stránkou ve stejném commitu. Nikdy prázdnou stránkou.
- Zakázané značky (kontroluje `scripts/ia_model.py`, seznam `PLACEHOLDER`): poznámka
  „je placeholder“, nadpis s „placeholder“, „materiál/obsah v rekonstrukci“, „stub“ hesla
  („structural stub“, „stub zápis“, „stub created“), generované bloky (`NLLB-AUTO-BLOCK`,
  `ENHANCED:`, „zero-stub-tolerance“), ohlášení budoucího obsahu („součástí probíhající“,
  „bude doplněno“, „obsah se připravuje“, „coming soon“, „lorem ipsum“), rezervované kapitoly
  a stavové buňky „Příprava“/„Plánováno“/„Rezervováno“/„TBD“, obecný popis „pojem v sekci …
  znalostní báze“ a příznak `stub = true` v `[extra]`.
- Ukázky kódu (ohrazené bloky) se nekontrolují: heslo o kvalitě kódu smí slovo „placeholder“
  citovat jako předmět výkladu.

# Failure behaviour

`scripts/check-ia.py` hlásí porušení `placeholder` na každé takové stránce a skončí kódem 1.
Porušení `placeholder` se do `scripts/ia-baseline.json` nikdy nepřijme: kontrola ho ze
základu při načtení odstraní a `--adopt placeholder` odmítne. Neplatí tedy ratchet jako u
ostatních požadavků; počet povolených placeholderů je trvale nula. CI (`validate`) commit
s placeholderem nepustí do `main` ani do nasazení.

# Verification

```sh
python3 scripts/check-ia.py --list placeholder   # nevypíše nic
python3 scripts/check-ia.py                      # exit 0
bash test/run.sh 02                              # brána odmítne zasazený placeholder
```
