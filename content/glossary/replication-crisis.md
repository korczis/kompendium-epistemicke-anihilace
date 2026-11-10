+++
title = "Replikační krize (replication crisis)"
weight = 60

description = "Systémové selhání replikace publikovaných výzkumných nálezů, doložené mimo jiné Open Science Collaboration (2015); samotná recenzovaná publikace nestačí jako záruka."

[taxonomies]
tags = ["glossary", "science", "research-methodology", "epistemic", "evidence", "kompendium"]

[extra]
category = "epistemic"
related_terms = ["epistemicka-anihilace", "epistemic-confidence", "epistemicka-pokora", "kompendium-ea", "epistemic-pipeline", "nabla-infinity"]
author = "Tomáš Korcak (korczis)"
reading_time = "4 min"
word_count = 550
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["replication crisis", "Open Science Collaboration", "p-hacking", "publication bias", "evidence calibration"]
quality_score = 88
see_also = ["kompendium", "philosophy", "decisions"]
image = "/images/sections/glossary.png"
image_alt = "Replikační krize (replication crisis) – glosář"
+++

## Definice

**Replikační krize** (*replication crisis*) je empiricky doložené systémové selhání
publikovaných výzkumných nálezů – v psychologii, biomedicíně, ekonomii a dalších oborech –,
které se při opakování podle stejných protokolů nepodaří zopakovat. Určujícím empirickým
milníkem byla studie Open Science Collaboration „Estimating the reproducibility of
psychological science“ (*Science* 349, č. 6251, 2015), která se pokusila zopakovat 100 studií
ze tří předních psychologických časopisů. Podle zvoleného kritéria se původní efekt podařilo
reprodukovat jen ve 36–47 % případů a průměrné velikosti efektů byly zhruba poloviční oproti
originálům.

Krize se neomezuje na psychologii. Navazující práce doložily podobná nebo horší selhání
v biologii nádorů (C. Glenn Begley a Lee M. Ellis, 2012: ve firmě Amgen se podařilo
reprodukovat asi 11 % – 6 z 53 – přelomových preklinických výsledků), v ekonomii (Colin
Camerer a kol., 2016: přibližně 61 % laboratorních experimentů z předních časopisů) a jinde.
Metavýzkum ukazuje na strukturní příčiny: **publikační zkreslení** (pozitivní výsledky se
publikují, negativní končí v šuplíku), **p-hacking** (využívání analytické volnosti, dokud
p neklesne pod 0,05), **HARKing** (formulování hypotéz až po známých výsledcích), nízkou
statistickou sílu a chybějící předregistraci.

## Původ a kontext pojmu

Varování předcházela samotné krizi – vlivný byl zejména článek Johna P. A. Ioannidise „Why
Most Published Research Findings Are False“ (2005) a pojem HARKing, který zavedl Norbert Kerr
(1998). Kolem roku 2011–2012 přibyly v sociální psychologii neúspěšné replikace známých efektů
a kauzy zfalšovaných dat, které debatu urychlily. Krize vyvolala program metodologických
reforem: předregistrace, registrované zprávy (*registered reports*), replikační konsorcia více
laboratoří, otevřená data, transparentní analytické postupy a výslovné uvádění velikostí efektů
s intervaly spolehlivosti místo dichotomické „signifikance“.

## Jak se projevuje

- jediná působivá studie se cituje jako „vědecky dokázáno“;
- efekt se při opakování zmenšuje nebo mizí;
- populární knihy a kurzy stavějí na výsledcích, které se nepodařilo zopakovat;
- argument „je to recenzované“ nahrazuje otázku po velikosti vzorku, předregistraci
  a replikacích;
- naopak cynická reakce: „věda je stejně jen názor“.

## Mechanismus

Epistemický důsledek pro poznávání mimo akademii je rozhodující, ale neintuitivní: **status
recenzované publikace sám o sobě není dostatečnou zárukou** pro přijetí tvrzení. Neznamená to
nihilismus – recenzovaná publikace zůstává *lepší* zárukou než žádná recenze. Znamená to však,
že kalibraci je třeba upravit: jediná pozitivní publikovaná studie nemá vést k tak velkému
posunu důvěry, jaký by vyvodil naivní čtenář.

Pro práci s [epistemickou anihilací](@/glossary/epistemicka-anihilace.md) je krize důležitá,
protože **publikovaný výzkum je sám vektorem**: nálezy s nízkou mírou replikace lze v technikách
EA citovat jako rozhodující důkaz a využít asymetrii mezi společenskou autoritou
„recenzovaného“ a skutečnou důkazní spolehlivostí (srov. [EA-2.1.1 Expertní
disinflace](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md) a [pseudovědu](@/glossary/pseudoscience.md)).

## Odlišení

- **Od podvodu ve vědě** – většina nereplikovaných nálezů není podvod, ale důsledek nízké
  statistické síly, flexibility analýzy a publikačních pobídek.
- **Od popírání vědy** – replikační krize je sebeoprava vědy jejími vlastními metodami; kdo ji
  používá jako důkaz, že „vědě nelze věřit vůbec“, dělá opačnou chybu než naivní čtenář.
- **Od přirozené nejistoty** – i dobře provedená studie může náhodou dát falešně pozitivní
  výsledek; problémem je systém, který takové výsledky selektivně zesiluje.
- **Od [falzifikace](@/glossary/falsifikace.md)** – neúspěšná replikace sama o sobě původní
  hypotézu nevyvrací; ukazuje, že důkaz pro ni byl slabší, než se zdálo.

## Význam pro Kompendium

V Prismatic Platform literatura o replikační krizi přímo vstupuje do kalibračního modelu
[Decision Engine](@/glossary/decision-engine.md). Posuny důvěry na základě publikovaného výzkumu
se škálují podle **apriorní třídy replikovatelnosti** oboru, z něhož zdroj pochází: jediná
studie z oboru s nízkou replikovatelností (např. psychologie sociálního primingu) vyvolá menší
posun důvěry než jediná studie z oboru s vysokou replikovatelností (např. randomizované
kontrolované studie léčiv s potvrzením ve více centrech), i když obě vyšly ve stejně prestižních
časopisech. Popis této implementace je na stránce [epistemická
kalibrace](@/kompendium/detection-signatures/epistemicka-kalibrace.md).

Pipeline [NABLA Infinity](@/glossary/nabla-infinity.md) podporuje značení kvality zdrojů, v němž
se „recenzovaná publikace“ rozkládá na apriorní replikovatelnost oboru, stav předregistrace,
velikost vzorku a historii replikací konkrétního výsledku. Vzniká tak kalibrace věrná skutečné
důkazní struktuře, ne společenskému signálu.

Krize se týká i Kompendia samého: kniha se opírá o empirickou literaturu o traumatu,
manipulaci a kultech, jejíž část má malé vzorky a málo replikací. Na to upozorňuje kritická
kapitola [Reprodukční krize a EA výzkum](@/kompendium/critical-perspectives/7-replication-EA-research.md).

## Obrana a zotavení

- **Pro čtenáře a klienty**: ptát se, kolik studií tvrzení podporuje, jak velké byly vzorky, zda
  byla studie předregistrovaná a zda ji někdo nezávisle zopakoval; rozlišovat „jedna studie
  ukázala“ od „výzkum opakovaně ukazuje“.
- **Pro profesionály**: u doporučení klientům preferovat metody s replikovanou oporou
  a komunikovat nejistotu otevřeně (srov. [epistemická pokora](@/glossary/epistemicka-pokora.md)
  a [evidence-based](@/glossary/evidence-based.md)).
- **V zotavení**: zotavovací práce v oddílu [rekonstruktivních
  protokolů](@/kompendium/recovery-protocols/_index.md) se výslovně věnuje lidem, jejichž
  epistemické poškození bylo zprostředkováno citacemi výzkumu s nízkou replikovatelností –
  například když manipulativní kouč nebo skupina opírala své nároky o „vědecky prokázané“
  efekty. Pomáhá společně dohledat původní zdroje a jejich status bez zesměšňování.

## Literatura

- Open Science Collaboration: „Estimating the reproducibility of psychological science“,
  *Science* 349 (6251), 2015.
- John P. A. Ioannidis: „Why Most Published Research Findings Are False“, *PLoS Medicine*, 2005.
- C. Glenn Begley, Lee M. Ellis: „Raise standards for preclinical cancer research“, *Nature*,
  2012.
- Colin F. Camerer a kol.: „Evaluating replicability of laboratory experiments in economics“,
  *Science*, 2016.
- Norbert L. Kerr: „HARKing: Hypothesizing After the Results are Known“, *Personality and
  Social Psychology Review*, 1998.

## Související

**Pojmy**

- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – rámec hrozeb.
- [Epistemická pokora](@/glossary/epistemicka-pokora.md) – oprávněná pokora vůči selhání
  replikací.
- [Kompendium EA](@/glossary/kompendium-ea.md) – úplná taxonomická reference.
- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – epistemická architektura platformy.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – engine kalibrace podle kvality zdrojů.
- [Pseudoscience](@/glossary/pseudoscience.md) – kde slabé důkazy přecházejí v pseudovědu.
- [Epistemic Confidence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/epistemic-confidence/) –
  kalibrační rámec platformy (mimo tuto knihu).

**Kniha**

- [Reprodukční krize a EA výzkum](@/kompendium/critical-perspectives/7-replication-EA-research.md) –
  dopad krize na samotnou taxonomii.
- [Kompendium](@/kompendium/_index.md) – celá česká taxonomie.

---

## Autor a zapojení

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [LinkedIn](https://linkedin.com/in/korczis) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues)
- [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Architektura](https://prismatic-reality-com.github.io/prismatic-promo/architecture/) | [O autorovi](https://prismatic-reality-com.github.io/prismatic-promo/about/author/)
