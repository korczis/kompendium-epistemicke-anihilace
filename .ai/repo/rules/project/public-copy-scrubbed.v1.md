---
id: project.public-copy-scrubbed
version: 1
kind: rule
title: Veřejná kopie nenese soukromé adresy ani tajemství
description: Do veřejného repozitáře se nedostane e-mailová adresa autora, přístupový údaj ani vnitřní adresa, ani v obsahu souborů převzaté historie.
statement: Než převezmeš soubor nebo historii z jiného repozitáře, prohledej celou jeho historii na tajemství a soukromé adresy a převezmi ji jen přes scripts/import-lineage.sh s náhradami, které adresy nahradí odkazem na Issues.
status: active
class: blocking
depends_on: []
tags: [archive, privacy, security]
---

# Rationale

Repozitář je veřejný a převzatá historie je jeho součástí: co jednou odejde v historii, nejde
spolehlivě vzít zpět. Zdroje (soukromý monorepozitář platformy, starší repozitáře, gisty)
obsahují autorovu adresu a mohly by obsahovat přístupové údaje.

# Required behaviour

- Před převzetím: prohledat `git log -p` všech převzatých cest na e-mailové adresy,
  klíče a tokeny (`sk-`, `ghp_`, `glpat-`, `AKIA`, `BEGIN … PRIVATE KEY`, `password`)
  a vnitřní adresy (192.168.*, 10.*, 100.*, `*.internal`).
- Převzetí jen přes `scripts/import-lineage.sh`; soubor náhrad (`REPLACE_TEXT`) leží mimo
  repozitář a adresu nikde v repozitáři nejmenuje; adresy nahrazuje odkazem na Issues.
- Nalezené tajemství se nepřebírá vůbec a hlásí se autorovi.
- Převzetí soukromého obsahu jen na výslovné rozhodnutí autora, zapsané doslovně
  (ADR 0002 a `archive/README.md`).

# Failure behaviour

Soukromá adresa nebo tajemství ve veřejném stromu nebo historii je incident: zastavit push,
přepsat historii (`git filter-repo --replace-text`) a ohlásit to autorovi.

# Verification

```sh
git log -p origin/main..HEAD | grep -cE '[A-Za-z0-9._%+-]+@gmail\.com'   # 0
```
