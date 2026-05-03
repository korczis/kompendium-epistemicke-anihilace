+++
title = "EA-3.3.2 IRB protokol design"
description = "Edukativní implementační technika — IRB protokol design: IRB protokol design je technika strukturovaného předkládání edukativních a výzkumných EA aktivit institucionální rev..."
weight = 332
insert_anchor_links = "right"

[taxonomies]
tags = ["kompendium", "techniques", "ea-3-3", "edukativni", "irb-protocol-design"]
categories = ["academic", "education"]

[extra]
parent = "kompendium-techniques"
ea_code = "EA-3.3.2"
ea_category = "3. Edukativní implementace"
ea_subcategory = "3.3 Institucionální techniky"
section_icon = "🎓"
toc = true
access_level = "L1"
risk_level = "low-moderate"
parent_chapter = "/kompendium/03-zakladni-kategorie/kapitola-3/"
+++

# EA-3.3.2 IRB protokol design

## Identifikace

| Pole | Hodnota |
|------|---------|
| **EA kód** | `EA-3.3.2` |
| **Kategorie** | 3. Edukativní implementace |
| **Subkategorie** | 3.3 Institucionální techniky |
| **Přístupová úroveň** | L1 (volný přístup, etická governance vyžadována) |
| **Riziková úroveň** | Nízká až střední — primárně edukativní, iatrogenní rizika při nesprávné implementaci |
| **Reverzibilita** | Vysoká — edukativní intervence jsou principiálně modifikovatelné |
| **Rodičovská kapitola** | [Kapitola 3 — Pokročilá edukativní implementace](@/kompendium/03-zakladni-kategorie/kapitola-3.md) |

## Definice

**IRB protokol design** je technika strukturovaného předkládání edukativních a výzkumných EA aktivit institucionální review board (IRB) k prospektivnímu schválení. Protokol pokrývá rizika, mitigace, informovaný souhlas, data management, adverse event handling. Bez IRB schválení žádný program nesmí běžet.

## Operační modus

Technika je strukturována pěti až šesti sekvenčními kroky implementace:

1. **Risk assessment matrix** — exhaustivní enumerace rizik + pravděpodobnosti × závažnosti + mitigace.
2. **Informed consent design** — vrstvený konsens (overview + module-specific) v lay-accessible language.
3. **Data management plan** — anonymizace, zabezpečení, retention, sdílení.
4. **Adverse event protocol** — definice + reporting + investigation + remediation.
5. **Continuing review** — annual re-submission s outcomes data.

## Cílová populace

Tvůrci kurikula; PI výzkumných projektů; institucionální administrátoři.

Edukativní cíl není **změna chování** v behaviorálním smyslu, ale **kultivace kompetencí** umožňujících autonomní navigaci v epistemicky náročných kontextech. Cílová populace je primárně dospělí profesionálové s baseline metakognitivní stabilitou — technika není určena pro klinické intervence u aktivně dekompenzovaných jedinců.

## Předpoklady

Familiarity s IRB procedurami příslušné jurisdikce (Common Rule v USA, GDPR v EU, atd.); institucionální IRB infrastruktura.

Bez splnění předpokladů technika produkuje suboptimální výsledky a může generovat iatrogenní efekty. Předpoklady nejsou byrokratické formality, ale **strukturální podmínky** efektivity intervence.

## Implementační protokol

Konkrétní implementace vyžaduje:

1. **Pre-implementation assessment** — verifikace předpokladů u individuálních účastníků a kohorty jako celku.
2. **Resource provisioning** — institucionální alokace času, prostoru, personálu, technologií.
3. **Documentation infrastructure** — systém zaznamenávání průběhu, výsledků, incidentů.
4. **Quality assurance** — peer review nebo external observation alespoň 10 % sessions.
5. **Continuous adjustment** — iterativní úpravy na základě real-time feedback.

Implementace je **iterativní** — každý cyklus generuje data informující úpravy v dalších cyklech.

## Hodnotící kritéria

| Kritérium | Měřítko |
|-----------|---------|
| Approval rate | Schválení bez major revisions u >70 % submissions |
| Compliance | Žádné protocol deviations bez amendment |
| Adverse event reporting | 100 % incidents reportováno do 7 dní |
| Subject feedback | Post-program ratings of consent process

Evaluace integruje **kvantitativní** (validované instrumenty) i **kvalitativní** (reflektivní eseje, ethnographic observation) datové zdroje. Žádná samostatná metrika není dostatečná — multidimenzionální evaluace je nezbytná.

## Rizika a kontraindikace

**Kdy techniku NEPOUŽÍVAT nebo modifikovat:**

Protokoly designed primárně pro liability protection vs. participant safety; přílišný IRB conservatism blokuje legitimní edukaci; cross-border programs s konflikty regulatorních frameworků.

Specificky:

- **Krizové situace** — technika není akutní intervencí; vyžaduje stabilní baseline.
- **Nedostatek institucionální infrastruktury** — bez adekvátní podpory technika selhává a může poškozovat.
- **Kulturně necitlivá implementace** — technika musí být adaptována pro local context, nikoli mechanicky importována.
- **Power asymmetry** — implementace v kontextu coercive control (nedobrovolná účast) je eticky problematická.

## Vztah k jiným technikám

### Sourozenecké techniky (3.3 Institucionální techniky)

Technika je integrální součástí subkategorie 3.3 a je navržena pro synergickou implementaci s ostatními sourozeneckými technikami:

  - [EA-3.3.1 Institucionální etická rada](@/kompendium/techniques/ea-3-3-1-institutional-ethics-board.md)
  - [EA-3.3.3 Architektura kurikula](@/kompendium/techniques/ea-3-3-3-curriculum-architecture.md)
  - [EA-3.3.4 Evaluační metriky](@/kompendium/techniques/ea-3-3-4-evaluation-metrics.md)
  - [EA-3.3.5 Certifikační pipeline](@/kompendium/techniques/ea-3-3-5-certification-pipeline.md)

### Cross-kategoriální vztahy

  - [EA-3.3.1 Institucionální etická rada](@/kompendium/techniques/ea-3-3-1-institutional-ethics-board.md)
  - [EA-3.3.4 Evaluační metriky](@/kompendium/techniques/ea-3-3-4-evaluation-metrics.md)
  - [EA-3.2.9 Hodnocení iatrogenního rizika](@/kompendium/techniques/ea-3-2-9-iatrogenic-risk-assessment.md)

### Vztah k EA-1 a EA-2

Tato edukativní technika **operacionalizuje** poznatky z taxonomie:

- **[EA-1 Techniky epistemické anihilace](@/kompendium/03-zakladni-kategorie/kapitola-1.md)** — obsahový materiál pro výuku.
- **[EA-2 Scénáře delegitimizace](@/kompendium/03-zakladni-kategorie/kapitola-2.md)** — komplexní real-world cases pro analýzu.
- **[EA-5 Kognitivní anihilace](/kompendium/03-zakladni-kategorie/kapitola-5/)** — pokročilé materiály pro L2/L3 úrovně.

## Vztah k Prismatic platformě

Tato edukativní technika je integrovatelná s několika komponentami Prismatic platformy:

- **{{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }}** — evaluační metriky a kompetenční assessmenty mohou využívat decision engine pro tracking longitudinálního vývoje studentů s confidence calibration.
- **[NABLA Infinity](@/glossary/nabla-infinity.md)** — epistemický framework poskytuje teoretický základ pro metakognitivní moduly.
- **[Color Teams](/aiad/color-teams/)** — supervize může využívat color-team metodologii (Red Team challenges, Blue Team defenses) pro praktická cvičení.
- **{{ cross_link(path="/osint/toolbox/", text="OSINT framework") }}** — recognition trénink (EA-3.1.6) může využívat real-world OSINT data pro autentický material (s anonymizací a etickou governance).

## Související

- **Rodičovská kapitola**: [Kapitola 3 — Pokročilá edukativní implementace](@/kompendium/03-zakladni-kategorie/kapitola-3.md)
- **Sourozenecké techniky** (subkategorie 3.3):
  - [EA-3.3.1 Institucionální etická rada](@/kompendium/techniques/ea-3-3-1-institutional-ethics-board.md)
  - [EA-3.3.3 Architektura kurikula](@/kompendium/techniques/ea-3-3-3-curriculum-architecture.md)
  - [EA-3.3.4 Evaluační metriky](@/kompendium/techniques/ea-3-3-4-evaluation-metrics.md)
  - [EA-3.3.5 Certifikační pipeline](@/kompendium/techniques/ea-3-3-5-certification-pipeline.md)
- **Glossary**:
  - [Epistemická anihilace](@/glossary/epistemicka-anihilace.md)
  - [Taxonomie EA](@/glossary/taxonomie-ea.md)
  - [Metakognice](@/glossary/metakognice.md)
  - [Dual-use poznání](@/glossary/dual-use-poznani.md)
  - [Kompendium EA](@/glossary/kompendium-ea.md)
- **Klinické aplikace**: [Sekce 06 — Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md)
- **Související platformové koncepty**:
  - {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }}
  - [NABLA Infinity](@/glossary/nabla-infinity.md)
- **Filozofie**:
  - [Epistemic Integrity](@/philosophy/epistemic-integrity.md)

## ⚡ Kritický krok

**Před aplikací této techniky** ověř:

- Tvoje **přístupová úroveň** odpovídá `access_level` v záhlaví článku
  (L1 = volný přístup, L2 = doložená kvalifikace, L3 = omezený doktrinální rámec)
- Máš [supervizní rámec](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md)
  pro úroveň této techniky
- Pokud implementuješ instituci, máš schválení [institucionální etické rady](@/kompendium/techniques/ea-3-3-1-institutional-ethics-board.md)

> **Mandatorní akce**: bez ověření institucionální governance, supervizní infrastruktury a evaluačního rámce nepoužívej tuto techniku jako samostatnou intervenci — pouze jako součást komplexního programu.

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under [GHL](https://github.com/korczis/prismatic-platform/blob/main/LICENSE)

- [GitHub](https://github.com/korczis/prismatic-platform) | [GitLab](https://gitlab.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Glossary](@/glossary/_index.md) | [Philosophy](@/philosophy/_index.md) | [Developer Portal](@/developers/_index.md)
