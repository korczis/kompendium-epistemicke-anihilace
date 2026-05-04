+++
title = "Prověřování kontraktorů"
description = "Organizační obrana — prověřování kontraktorů."
weight = 260
[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]
[extra]
related_terms = ["24-documentation-standards", "25-vendor-management-EA", "27-information-classification", "28-access-control-EA"]
parent = "kompendium-organizational-defense"
toc = true
+++

# Prověřování kontraktorů

> **Bucket:** Operativní · **Pillar:** Organizační obrana proti epistemickým útokům (EA)

Externí kontraktoři jsou často využíváni jako proxy pro EA aktivity — slabší KYC než zaměstnanci.

## 1. Organizační kontext

V kontextu **epistemických útoků (EA)** představuje **prověřování kontraktorů** kritický kontrolní bod, kde se rozhoduje
o tom, zda organizace dokáže rozpoznat manipulaci dříve, než ji asimiluje. Bez funkčního mechanismu v této oblasti
se organizace stává **strukturálně zranitelnou** — útočník (interní nebo externí) může využít chybějící obrany
k postupnému získání vlivu, informací nebo kontroly.

Tato kapitola není teoretickým cvičením. Každý popisovaný prvek vychází z reálných případů institucionálního
zachycení (institutional capture), board capture, nebo whistleblower retaliation, které jsou dokumentovány
v navazujících sekcích kompendia.

## 2. Klíčové prvky obrany

1. **Strukturální nezávislost** — žádná osoba nesmí mít kontrolu nad celým rozhodovacím cyklem
2. **Auditovatelnost** — každá akce musí mít trvalý, nezfalšovatelný záznam
3. **Eskalační kanál** — musí existovat cesta nahoru i mimo strukturu (externí ombudsman, board)
4. **Periodicita** — kontrolní mechanismy musí běžet pravidelně, ne ad-hoc
5. **Transparentnost** — kde to právní rámec dovoluje, výstupy musí být veřejné
6. **Redundance** — žádný kontrolní bod nesmí být single-point-of-failure

## 3. Implementační postup

**Konkrétní krok pro tuto oblast:**

> Aplikujte rozšířené background checks (PEP, sanctions, beneficial ownership) pro kontraktory s přístupem k citlivým systémům.

**Doporučená sekvence implementace:**

1. **Diagnostika** (2 týdny): Zmapujte aktuální stav, identifikujte gap mezi best practice a realitou
2. **Stakeholder alignment** (2 týdny): Získejte buy-in od board / executive / HR / legal
3. **Pilot** (4 týdny): Spusťte na omezeném scope (jeden tým / jedna divize)
4. **Iterace** (4 týdny): Sbírejte feedback, upravujte proces a tooling
5. **Roll-out** (8 týdnů): Postupné rozšíření na celou organizaci s training a komunikací
6. **Audit** (kontinuální): Pravidelná evaluace efektivity, minimálně pololetně

## 4. Indikátory selhání

Následující signály indikují, že tento prvek obrany **nefunguje** nebo byl kompromitován:

- Žádné KYC, kontraktoři mají super-admin rights, no offboarding, persistent VPN access.
- Klíčové metriky se nezveřejňují nebo jsou retroaktivně upravovány
- Osoby zodpovědné za tento prvek jsou izolovány, marginalizovány nebo propuštěny po nepříjemných zjištěních
- Eskalace končí v "černé díře" bez odpovědi v rozumné lhůtě
- Externí auditoři dostávají omezený přístup k datům nebo lidem

Pokud pozorujete **dva nebo více** těchto signálů současně, jedná se o **silný indikátor probíhajícího EA**
a je nutné okamžitě eskalovat na nezávislý orgán (board audit committee, ombudsman, externí counsel).

## 5. Best practices

Tiered access model, time-limited credentials, quarterly access review, mandatory NDA + IP assignment.

**Dodatečné principy:**

- **Defense in depth** — jeden mechanismus nikdy nestačí, vždy kombinujte
- **Trust but verify** — i good-faith aktéři mohou nevědomě umožnit EA
- **Fail loudly** — selhání musí být viditelné, ne potlačené
- **Document everything** — bez záznamu se realita rozpadá v post-hoc rationalization
- **External validation** — interní audit nikdy plně nenahradí externí pohled

## 6. Cross-linky

- [Rotace rolí](@/kompendium/organizational-defense/30-rotation-of-roles.md)
- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md)
- [Struktura jednání](@/kompendium/organizational-defense/22-meeting-structure.md)
- [Trauma-aware management](@/kompendium/organizational-defense/36-trauma-aware-management.md)
- [Kontinuita podnikání s EA fokusem](/kompendium/organizational-defense/37-business-continuity-EA/)
- [Náhrada vedení](@/kompendium/organizational-defense/38-leadership-replacement.md)
- [Kulturní obnova](@/kompendium/organizational-defense/39-cultural-rebuild.md)
- [Kompendium — Hlavní index](@/kompendium/_index.md)
- [Detection Signatures](@/kompendium/detection-signatures/_index.md)
- [Recovery Protocols](@/kompendium/recovery-protocols/_index.md)

## 7. Connect

## Connect

- **Otázky / konzultace**: [[e-mail odstraněn]](mailto:[e-mail odstraněn])
- **GitHub**: [github.com/korczis/prismatic-platform](https://github.com/korczis/prismatic-platform)
- **LinkedIn**: [linkedin.com/in/korczis](https://linkedin.com/in/korczis)
- **Kompendium**: [Hlavní index](@/kompendium/_index.md)

