+++
title = "Pattern evidence (vzorový důkaz)"
weight = 5
description = "Důkaz z pozorovatelných, opakovatelných konfigurací – stop, signatur chování, statistických pravidelností – ve forenzní, OSINT a investigativní praxi; meze a validita."

[taxonomies]
tags = ["glossary", "forensic-legal", "evidence", "osint", "investigation"]

[extra]
category = "forensic"
status = "active"
author = "Tomas Korcak (korczis)"
difficulty = "intermediate"
abbreviation = "PE"
date_created = "2026-05-03"
date_updated = "2026-05-03"
importance = "critical"
related_terms = ["evidence", "verifiable-evidence", "pattern-matching", "behaviour-pattern", "anomaly-detection", "statistical-detection", "expert-witness"]
keywords = ["pattern evidence", "physical evidence", "behavioral patterns", "forensic pattern analysis", "modus operandi", "signature analysis", "statistical inference", "Daubert"]
key_takeaway = "Pattern evidence supports inference from regularity — that something repeats across cases, locations, or time in ways unlikely to be coincidence. Its evidentiary weight depends entirely on the rigor of the underlying classification scheme and the empirical base rate of the pattern in the relevant population."
see_also = ["forensic-interview", "expert-witness", "chain-of-custody"]
image = "/images/sections/glossary.png"
image_alt = "Pattern evidence (vzorový důkaz) – glosář"
+++

## Definice

**Vzorový důkaz** (*pattern evidence*) je každá třída důkazů, jejíž důkazní hodnota plyne
ze shody pozorované konfigurace se známým referenčním vzorem – otisku prstu s otiskem
podezřelého, stopy pneumatiky se vzorkem dezénu, balistických stop se zbraní, rukopisu se
srovnávacími vzorky, sledu jednání se známým *modus operandi* nebo transakčního vzorce
s typologií praní peněz. Kategorie zahrnuje fyzické (otisky, stopy nástrojů, biologické
stopy), digitální (artefakty souborového systému, síťové toky, signatury malwaru)
a behaviorální (modus operandi pachatelů, typologie podvodů, profily aktivity z
[OSINT](@/glossary/osint.md)) podoblasti.

Zjednodušeně: vzorový důkaz je důkaz z opakování – z toho, že se určitá konfigurace, sekvence
nebo signatura objevuje napříč případy způsobem, který je náhodou nepravděpodobný.

## Původ a kontext pojmu

Tradiční forenzní disciplíny založené na porovnávání znaků se rozvíjely od konce 19. století
(daktyloskopie, srovnávání rukopisu, balistika). Od zprávy Národní akademie věd USA
*Strengthening Forensic Science in the United States: A Path Forward* (2009) a zprávy Rady
prezidentových poradců pro vědu a technologii (PCAST) *Forensic Science in Criminal Courts:
Ensuring Scientific Validity of Feature-Comparison Methods* (2016) jsou však pod intenzivním
kritickým zkoumáním. Oba dokumenty shledaly, že několika historicky přijímaným disciplínám –
analýze otisků zubů, mikroskopickému srovnávání vlasů, některým identifikacím zbraní a stop
nástrojů – chybí empirický základ pro kategorické svědectví o „shodě“.

Moderní přípustnost podle standardu *Daubert* a pravidla 702 federálních pravidel dokazování
(USA) vyžaduje doložené chybovosti, validovanou metodiku a zveřejnění výchozích předpokladů.
V českém trestním řízení se znalecký posudek řídí ustanovením § 105 zákona č. 141/1961 Sb.,
trestního řádu, a zákonem č. 254/2019 Sb., o znalcích, znaleckých kancelářích a znaleckých
ústavech; i pro vzorové důkazy z nich plynou požadavky na odbornost, metodiku a
přezkoumatelnost posudku. Souběžná kapitola knihy: [Pattern
důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md).

## Jak se projevuje

V praxi due diligence vedené přes OSINT bývá vzorový důkaz často nejsilnějším dostupným
signálem:

- opakované zakládání účelových (*shell*) společností na téže registrované adrese;
- opakující se nastrčení ředitelé (*nominee directors*) v nesouvisejících firmách;
- shodné anomálie ve formátu adres v údajích o skutečných majitelích;
- časové vzorce aktivity na sociálních sítích, které naznačují koordinovaný provoz.

Ve vyšetřování finanční kriminality stojí na vzorovém důkazu porovnávání s typologiemi AML
(smurfing, layering, signatury praní peněz přes obchod; viz [EA × Compliance:
AML](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md)). V reakci na
incidenty se přiřazení rodiny malwaru opírá téměř výhradně o shody vzorů kódu, infrastruktury
a TTP (taktik, technik a postupů) s korpusy zpravodajství o hrozbách.

V oblasti epistemické anihilace jsou vzorovým důkazem opakující se sledy chování – například
cyklus idealizace, znehodnocení a odvržení – doložené v čase (viz [rekonstrukci časové
osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md)).

## Mechanismus

Důkazní síla vzoru stojí na třech veličinách: jak specifický je vzor (jak málo jiných zdrojů
by ho mohlo vytvořit), jaká je jeho **výchozí četnost** (*base rate*) v relevantní populaci
a jak spolehlivá je klasifikační metodika (míra falešně pozitivních a falešně negativních
určení). Bez znalosti výchozí četnosti se snadno podlehne klamu prokurátora – záměně
pravděpodobnosti shody při nevině s pravděpodobností neviny při shodě.

Vzor také musí pocházet z nezávislých pozorování: deset záznamů z téhož zdroje není deset
opakování (srov. [Signal Plurality](@/glossary/signal-plurality.md) a [Entity
Resolution](@/glossary/entity-resolution.md)).

## Odlišení

- **Od [detekce anomálií](https://prismatic-reality-com.github.io/prismatic-promo/glossary/anomaly-detection/)** –
  inverzní přístup: hledá odchylku od vzoru, ne shodu s ním.
- **Od jednotlivé stopy** – jediný otisk je identifikační stopa; vzorovým důkazem v širším
  smyslu se stává opakovaná konfigurace.
- **Od narativní soudržnosti** – přesvědčivý příběh, který „do sebe zapadá“, není vzorový
  důkaz; může jít o [konfirmační bias](@/glossary/konfirmacni-bias.md) vyšetřovatele.
- **Od profilování** – vzor jednání v konkrétních případech neopravňuje k závěrům o skupině
  lidí.

## Význam pro Kompendium

Behaviorální vzory jsou v kauzách [coercive control](@/glossary/coercive-control.md) a psychické manipulace často jediným
dostupným důkazem, protože jednotlivé incidenty vypadají izolovaně banálně. Kniha proto
zdůrazňuje dokumentaci v čase ([Forenzní
dokumentace](@/kompendium/forensic-legal/10-forensic-documentation.md)), uchování důkazů
([Chain of Custody](@/glossary/chain-of-custody.md)) a zapojení znalce ([Expert
Witness](@/glossary/expert-witness.md)), který vzor uvede a vysvětlí jeho meze. Zároveň
varuje před opačným rizikem – vidět vzor tam, kde není (viz [Riziko falešně pozitivních
detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md)).

## Obrana a zotavení

Každé použití vzorového důkazu vyžaduje zdokumentovanou metodiku, obhajitelnou referenční
datovou sadu a výslovné přiznání omezení daných výchozí četností. Praktický minimální standard:

1. popsat vzor předem, ne až po prohlédnutí dat;
2. uvést, kolik případů vzor splňuje a kolik ne;
3. odhadnout nebo aspoň diskutovat výchozí četnost;
4. nechat závěr přezkoumat nezávislou osobou;
5. formulovat závěr pravděpodobnostně, ne jako kategorickou „shodu“.

Pro oběť: vést datovaný záznam událostí, ukládat komunikaci a hledat třetí osoby, které mohou
jednotlivé epizody potvrdit ([Třetiosobní
potvrzení](@/kompendium/forensic-legal/37-third-party-corroboration.md)).

## Literatura

- President's Council of Advisors on Science and Technology: *Forensic Science in Criminal
  Courts: Ensuring Scientific Validity of Feature-Comparison Methods* (PCAST, 2016).
- National Research Council: *Strengthening Forensic Science in the United States: A Path
  Forward* (NAS, 2009).
- Federal Rules of Evidence, Rule 702 – Testimony by Expert Witnesses (USA).
- Zákon č. 141/1961 Sb., trestní řád, § 105 (znalec).

## Související

**Pojmy**

- [Expert Witness](@/glossary/expert-witness.md) – znalec, bez něhož vzorový důkaz u soudu
  neobstojí.
- [Chain of Custody](@/glossary/chain-of-custody.md) – integrita důkazu od zajištění po soud.
- [Due Diligence](@/glossary/due-diligence.md) – hlavní oblast užití v platformě.
- [Signal Plurality](@/glossary/signal-plurality.md) – nezávislost pozorování, z nichž vzor
  vzniká.

**Hesla platformy mimo tuto knihu**

- [Evidence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/evidence/),
  [Verifiable Evidence](https://prismatic-reality-com.github.io/prismatic-promo/glossary/verifiable-evidence/) –
  nadřazená kategorie a standard kvality.
- [Pattern Matching](https://prismatic-reality-com.github.io/prismatic-promo/glossary/pattern-matching/),
  [Behaviour Pattern](https://prismatic-reality-com.github.io/prismatic-promo/glossary/behaviour-pattern/),
  [Statistical Detection](https://prismatic-reality-com.github.io/prismatic-promo/glossary/statistical-detection/) –
  technický mechanismus, behaviorální podmnožina a kvantitativní rámec hodnocení.

**Kniha**

- [Pattern důkaz](@/kompendium/forensic-legal/38-pattern-evidence.md) – forenzní kapitola
  o vzorových důkazech v kauzách EA.
- [Rekonstrukce časové osy](@/kompendium/forensic-legal/33-timeline-reconstruction.md) –
  jak se behaviorální vzor dokládá v čase.
