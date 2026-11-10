---
id: project.content-czech-diacritics
version: 1
kind: rule
title: Obsah je česky a s plnou diakritikou
description: Stránky knihy jsou psané spisovnou češtinou s háčky a čárkami; angličtina zůstává jen u ustálených odborných termínů.
statement: Piš a uchovávej každou stránku v content/ ve spisovné češtině s plnou diakritikou, včetně title a description v hlavičce, a anglické stránky překládej do češtiny.
status: active
class: blocking
depends_on: []
tags: [content, language]
---

# Rationale

Kompendium je česká kniha. Při vzniku na platformě se část stránek psala bez diakritiky
(„Pripadova studie“, „neni“) a část glosáře anglicky. Bez diakritiky se text špatně čte,
hůř se v něm hledá a působí jako koncept, ne jako kniha.

# Required behaviour

- Celý text stránky, `title` i `description` jsou česky s plnou diakritikou.
- Ustálené odborné termíny (coercive control, love bombing, DARVO, gaslighting) mohou zůstat
  v originále, kurzívou nebo jako odkaz na heslo glosáře; poprvé s českým vysvětlením.
- Anglické stránky se překládají do češtiny; název souboru (a tím adresa stránky) se nemění.
- Typografie: české uvozovky „…“, pomlčka – mezi slovy, výpustka …; to opravuje
  `scripts/polish-markdown.py`.
- Výjimka: `archive/` je doslovný záznam zdrojů a nepřekládá se.

# Failure behaviour

Stránka bez diakritiky nebo v angličtině je nález recenze; nová taková stránka se nesloučí.

# Verification

Měření podílu slov s diakritikou na stránku (postup v
`.ai/repo/workflows/content-wave.md`, krok „Změř“): stránka s podílem pod 3 % je bez
diakritiky, anglická stránka má víc anglických než českých funkčních slov.
