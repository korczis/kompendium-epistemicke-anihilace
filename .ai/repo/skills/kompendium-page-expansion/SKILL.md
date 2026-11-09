---
schema: skill/v1
id: kompendium-page-expansion
version: 1
title: Rozvinout, přeložit a provázat stránku Kompendia
description: Doplní stránku knihy na plný obsah v češtině s diakritikou, provází ji s ostatními stránkami a ověří sestavení, v obranném rámci knihy a bez vymyšlených zdrojů.
status: active
tags: [content, writing, links]
inputs:
  - cesta ke stránce nebo adresáři v content/ a nejlepší existující stránky téhož adresáře
  - seznam cílů odkazů (@/cesta.md a název) vygenerovaný před vlnou
outputs:
  - stránka s plným obsahem, česky, provázaná, s oddílem Související
  - hlášení: slova před a po, obnovená diakritika, vynechané nejisté údaje
---
# Purpose

Jednotný postup pro každou stránku knihy, aby výsledek vlny četl jako jedna kniha, ne jako
sto nezávislých textů. Plní pravidla `project.content-defensive-frame`,
`project.content-czech-diacritics`, `project.content-sources-verifiable` a
`project.content-linked-and-built`; průběh celé vlny je workflow `content-wave.md`.

# When to use

Kdykoli se stránka v `content/` rozvíjí, překládá, opravuje nebo provazuje. Ne pro `archive/`
(doslovný záznam zdrojů) a ne pro generovaný `content/references.md`.

# Procedure

1. Přečti `_index.md` adresáře a dvě nejlepší stránky téhož druhu; převezmi jejich schéma
   nadpisů, aby byl adresář jednotný.
2. Jazyk: celý text včetně `title` a `description` česky s plnou diakritikou; anglickou
   stránku přelož, ustálené termíny ponech v originále s českým vysvětlením.
3. Obsah: tenká stránka (pod ~600 slov) dostane 900–1600 slov podstaty: vymezení, pozorovatelné
   znaky, odlišení od neškodných jevů a klinických stavů, průběh, klinický/právní/organizační
   rámec, obecný anonymní příklad, obranu a zotavení pro postiženého i pro profesionála,
   meze a otevřené otázky. Dlouhá stránka dostane opravu a odkazy, ne vatu.
4. Rámec: mechanismus jen jako rozpoznatelný vzorec; nikdy postup, skript ani rada, jak by
   manipulace „fungovala lépe“.
5. Zdroje: cituj jen jistě existující díla, předpisy a události; nejisté vynech a zapiš do
   hlášení.
6. Odkazy: první zmínka pojmu s vlastní stránkou je `[text](@/cesta.md)`; na konci
   `## Související` s 6–12 odkazy seskupenými podle druhu, každý s důvodem. Jen cíle ze seznamu.
7. Hlavička: platná TOML/YAML; `title`, `weight`, `taxonomies`, `extra` zůstávají;
   `description` 50–200 znaků česky.
8. Ověř: `zola build --force -o "$TMPDIR/kea-out-<id>"` vypíše `Done`; chybu v cizím souboru
   (souběžný pracovník) přeskoč a zkus znovu, chybu ve vlastním opraví hned.

# Output

Změněné stránky a hlášení: tabulka slov před → po, stránky s obnovenou diakritikou, vynechané
nejisté údaje, nedokončené stránky a poslední výsledek sestavení.
