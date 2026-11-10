---
schema: knowledge/v1
id: platform-artifacts-in-content
kind: knowledge
class: lesson
title: "Strojově přidané texty platformy v obsahu knihy nejsou obsah knihy a každá jejich třída má vlastní nástroj"
description: "Když vlna obsahu narazí na zástupnou stránku, structural stub, blok NLLB, abecední related_terms, krátký duplikát nebo číslo bez zdroje."
status: verified
epistemics: observed
date: 2026-11-10
tags:
  - content
  - information-architecture
provenance:
  origin: authored
---

# Strojově přidané texty platformy v obsahu knihy nejsou obsah knihy a každá jejich třída má vlastní nástroj

Kniha vznikla uvnitř monorepozitáře Prismatic Platform a platforma do obsahu strojově přidávala
texty, aby se zavřely „broken refs“ a zvedly metriky. Při rozvoji obsahu 2026-11-09/10 se
ukázalo šest tříd takových artefaktů. Každá se pozná mechanicky a má svůj nástroj nebo postup;
žádná se nesmí brát jako obsah knihy.

| Třída | Jak se pozná | Co s ní |
|---|---|---|
| Zástupná stránka | věta „Pozn.: Tato stránka je placeholder vytvořený pro vyřešení broken refs“, `stub = true` | napsat jako skutečný rozcestník, nekopírovat kapitolu, na kterou vede (hotovo 2026-11-10) |
| Anglický „structural stub“ | „structural stub“ / „Strukturální stub“ v textu, chybná `extra.category = "architecture"` u filozofických a klinických pojmů | napsat celé české heslo ve schématu glosáře; opravit kategorii |
| Blok NLLB | `<!-- ENHANCED:NLLB-AUTO-BLOCK BEGIN -->`: „Manažerské shrnutí“, „Koncepční síť“ (Mermaid), „Související pojmy“ | `scripts/strip-generated-blocks.py`, ale jen spolu se skutečným oddílem Související: blok bývá jediný zdroj odkazů a jeho odstranění osiří cílové stránky |
| `related_terms` podle abecedy | sousedé v abecedě místo významu („adapter, adaptive-testing, 3nl, accreditation …“; Trauma → „Dlouhodobé altruistické kanalizování“) | nahradit skutečně souvisejícími slugy; okolí stránky odvozuje šablona z grafu odkazů |
| Krátký duplikát | `techniques/ea-1-1-1.md` vedle `ea-1-1-1-selektivni-expozice.md`; popis „… — pojem v sekci … znalostní báze Prismatic Platform“ | `scripts/merge-duplicate.py <stub> <plná>`: alias na starou adresu, přesměrované odkazy, stub pryč |
| Generovaná čísla | prevalence, N, CI, Cohenovo d, NNT, prahy („SHAPS > 25“ mimo rozsah škály), počty agentů a aplikací platformy | čísla bez zdroje odstranit; údaje o platformě jen „v době zápisu“, rozpory mezi zdroji uvést |

## Chyby, které se v původním textu opakovaly

- Kódy EA přiřazené špatným technikám (EA-1.1.3 je terminologická mystifikace, ne „echo chamber
  engineering“; EA-3 je výcvik a supervize, ne útočná rodina; delegitimizace je EA-2.1).
- Paragrafy přiřazené špatnému kodexu (vydírání je § 175 trestního zákoníku, ne občanského),
  pravděpodobně vymyšlené spisové značky, zrušené předpisy (zákon 36/1967 Sb.).
- Tvrzení, že koercivní kontrola nebo gaslighting jsou diagnózy DSM-5 (nejsou).
- Rady proti obrannému rámci: oběť se má konfrontovat s pachatelem, mediace v rodině u násilí ze
  cti, cvičení „zahraj si manipulátora a obejdi detekci“.

## Ponaučení pro další vlny

- Ověřovat přesně ten strom, který se commituje (`git archive $(git write-tree)`), ne pracovní
  strom, ve kterém souběžně píšou agenti.
- Nástroj, který přepisuje obsah, musí odmítnout neznámý přepínač (`--help` jednou přepsal
  836 stránek).
- Odkaz, jehož text přechází přes konec řádku, musí autolinker chránit.
- Brána IA vypisuje nejvýš 60 stránek: úplný seznam se bere z `check-ia.py --list` nebo
  z modelu, nikdy z výpisu.
- V zsh se proměnná s více argumenty nerozdělí; seznam cest předávat polem.

## Otevřené otázky na autora a neověřené údaje (2026-11-10)

Položeno autorovi v session `30dc7a0e-8a7f-48e6-8922-1b1b2dc08588`, zatím bez odpovědi:

- Scénáře K a L (`03-zakladni-kategorie/scenar-k`, `scenar-l`): kapitola 3.2 definuje jen A–I;
  stránky je popisují jako pracovní označení odvozená z kazuistik, které je citují.
- ECRI v `08-prilohy/diagnosticke-nastroje.md` se nepodařilo ověřit jako validovaný nástroj;
  heslo `glossary/ecri.md` to uvádí otevřeně.

Ponecháno, jak je, a označeno jako neověřené: rok „Wanless & Berk (2017)“ a tvrzení o NABLA
L0–L13 v `08-prilohy/bibliografie.md`; „ZKB 264/2025 Sb.“ v heslech compliance-framework a easm
(označení platformy, ne citace knihy). Chybný záznam „Ofshe & Watters (1994) Therapy's
Delusions“ (správně Making Monsters 1994, Therapy's Delusions 1999) je v bibliografii doslova
s viditelnou poznámkou. Odpověď autora se zapíše doslova sem nebo do ADR a otázka se odstraní.
