+++
title = "Deplatforming"
weight = 60

description = "Odebrání přístupu aktéra k digitální infrastruktuře (sítím, platbám, hostingu, DNS) jako epistemický zásah – mezi snížením škod a rizikem epistemické monokultury."

[taxonomies]
tags = ["glossary", "security", "epistemic", "kompendium", "digitalni"]

[extra]
category = "security"
related_terms = ["epistemic-security", "info-ops", "firehose-of-falsehood", "delegitimizace", "epistemicka-anihilace", "hyperreality"]
author = "Tomáš Korcak (korczis)"
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["deplatforming", "moderace obsahu", "správa platforem", "epistemický zásah", "no-platform", "odepření infrastruktury"]
see_also = ["kompendium", "epistemicka-anihilace"]
image = "/images/sections/glossary.png"
image_alt = "Deplatforming – glosář"
+++

## Definice

**Deplatforming** je cílené odebrání přístupu aktéra k digitální infrastruktuře – účtům na
sociálních sítích, platebním službám, poskytovatelům hostingu, registrátorům DNS,
distribuci v obchodech s aplikacemi, reklamním sítím – obvykle v reakci na porušení
pravidel, zákona nebo norem platformy.

Deplatforming probíhá v několika **vrstvách technologického zásobníku**, z nichž každá se
liší vratností, rozsahem a možnostmi obejití:

| Vrstva | Příklad zásahu | Dopad |
|---|---|---|
| aplikační | pozastavení účtu | nízká cena, snadno obejitelné založením nového účtu |
| agregační | vyřazení z vyhledávání, odebrání monetizace | snižuje dosah, hůře obejitelné |
| distribuční | odstranění z obchodu s aplikacemi | odřízne cesty k instalaci |
| infrastrukturní | hosting, DNS, platby | existenční, nejobtížněji napravitelné |

## Původ a kontext pojmu

Termín se rozšířil kolem roku 2018, kdy hlavní platformy koordinovaně odstranily účty
Alexe Jonese. Praxe je ale starší a širší: zahrnuje odpírání pódia akademickým řečníkům
(*no-platforming*, debaty sahající do 60. a 70. let), rušení bankovních účtů nepohodlných
organizací (*de-banking*) i odepření na úrovni infrastruktury (Cloudflare ukončil služby pro
8chan v roce 2019, Amazon Web Services pro Parler v roce 2021).

Empiricky dobře cílený deplatforming snižuje dosah (Chandrasekharan a kol. 2017 na Redditu,
Jhaver a kol. 2021 na Twitteru). Vytlačení aktéři si však obvykle udrží jádro příznivců
a přesunou se na alternativní platformy se slabší moderací, kde se sdělení často dále
radikalizuje (selekční efekt a menší tření s normami).

## Jak se projevuje

**Deplatforming jako obrana** (zásah platformy proti aktérovi):

- náhlé zmizení účtů, kanálů nebo aplikace aktéra;
- přesun komunity na menší, méně moderované služby;
- v komunitě aktéra narativ pronásledování, který posiluje soudržnost.

**Deplatforming jako útok** (na cílovou osobu):

- koordinované hromadné nahlašování účtu, které vede k automatickému zablokování;
- postupné vyřazení z více služeb v krátké době (*kaskáda*);
- ztráta kontaktu s publikem, klienty nebo komunitou, a tím i ztráta hlasu ve sporu.

Druhou podobu popisuje Kompendium jako [EA-9.6.4 AI Deplatforming
Cascade](@/kompendium/techniques/ea-9-6-4-AI-deplatforming-cascade.md) a detekční
signaturu [Kaskáda deplatformingu](@/kompendium/detection-signatures/24-network-deplatforming-cascade.md).

## Mechanismus

Deplatforming mění **rozložení hlasu** v informačním ekosystému. Odebráním kanálu se
snižuje dosah sdělení, ale současně se mění i složení publika a způsob, jak sdělení vnímá:
zbylí příznivci mohou zásah číst jako potvrzení pronásledování. Proto má zásah dvojí
epistemický účinek – snižuje šíření škodlivého obsahu a zároveň může zpevnit uzavřenou
komunitu (srov. [Epistemic Bubble](@/glossary/epistemic-bubble.md)).

Praxe otevírá **strukturní otázky epistemické bezpečnosti**: deplatforming snižuje konkrétní
škody, ale soustřeďuje redakční moc v rukou soukromých oligopolů, jejichž rozhodnutí
nepodléhají demokratickému procesu, soudnímu přezkumu ani transparentním kritériím. Kritici
z obou konců politického spektra upozorňují na **riziko monokultury** – zásahy na úrovni
platforem, jakkoli dobře míněné, mohou poškodit epistemický ekosystém, který mají chránit
(viz [Epistemická monokultura](@/glossary/epistemicka-monokultura.md)).

## Odlišení

- **Moderace obsahu.** Odstranění jednotlivého příspěvku; deplatforming odebírá celý kanál.
- **[Delegitimizace](@/glossary/delegitimizace.md).** Útok na status zdroje; deplatforming
  útočí na jeho dosah. Často se kombinují.
- **Cenzura státem.** Deplatforming provádějí obvykle soukromé subjekty podle vlastních
  pravidel; právní rámec se liší.

## Význam pro Kompendium

Kompendium chápe deplatforming jako **zásah** s měřitelnými epistemickými náklady
a přínosy, nikoli jako normativní absolutno. [7. Teoretické
reflexe](@/kompendium/07-teoreticke-reflexe/_index.md) jej rozebírají jako **obrannou
techniku proti aktérům EA působícím ve velkém měřítku** – zejména proti koordinovaným
kampaním typu [EA-2.3.4 Mob Coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md)
a [EA-2.3.6 Platform Coordinated
Attack](@/kompendium/techniques/ea-2-3-6-platform-coordinated-attack.md) – a zároveň
upozorňují na riziko epistemické monokultury, které zásah přináší.

Na platformě, z níž kniha vzešla:

- protokoly Blue Teamu v rámci [Color Teams](@/glossary/color-teams.md) hodnotí návrhy na
  deplatforming podle pěti kritérií: (1) specifičnost škody, (2) vratnost zásahu,
  (3) obecnost precedentu, (4) přiměřenost řádného procesu, (5) sledování po zásahu;
- [Decision Engine](@/glossary/decision-engine.md) považuje aktéry nedávno zasažené
  deplatformingem za **nejednoznačné co do původu**: jejich pozdější výstup může být
  skutečně problematický, nebo zkreslený přesunem do prostředí s nižší moderací;
- [NABLA Infinity](@/glossary/nabla-infinity.md) při kontrole rozmanitosti zdrojů výslovně
  vylučuje stav, kdy by se pracovalo jen se „schválenými“ zdroji: model, který uvažuje jen
  nad nimi, nesplňuje invariant rozmanitosti;
- hesla [Info-Ops](@/glossary/info-ops.md) a [Firehose of
  Falsehood](@/glossary/firehose-of-falsehood.md) popisují modely hrozeb, jimiž se
  deplatforming někdy zdůvodňuje.

## Obrana a zotavení

**Pro osobu zasaženou neoprávněným deplatformingem:** zálohovat obsah a kontakty mimo
platformu, využít odvolací mechanismy, dokumentovat průběh a časovou osu, udržovat
alternativní kanály ke komunitě.

**Pro rozhodující instituce:** transparentní pravidla, odůvodnění, odvolání, vratnost
zásahu a následné vyhodnocení dopadu.

Deplatforming je nejlépe chápat jako **kompromis**, nikoli jako vítězství: je jedním
z mnoha nástrojů epistemické bezpečnosti a jeho náklady (centralizace, oslabení řádného
procesu, monokultura) je nutné vážit proti přínosům (snížení škod, prosazení norem) případ
od případu.

## Literatura

- Eshwar Chandrasekharan a kol.: „You Can't Stay Here: The Efficacy of Reddit's 2015 Ban
  Examined Through Hate Speech“, *Proceedings of the ACM on Human-Computer Interaction*
  (CSCW, 2017).
- Shagun Jhaver a kol.: „Evaluating the Effectiveness of Deplatforming as a Moderation
  Strategy on Twitter“, *Proceedings of the ACM on Human-Computer Interaction* (CSCW, 2021).

## Související

**Pojmy**

- [Epistemic Security](@/glossary/epistemic-security.md) – širší rámec oboru.
- [Info-Ops](@/glossary/info-ops.md) – model hrozby, který deplatforming často zdůvodňuje.
- [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) – adversariální vzorec, proti
  němuž deplatforming míří.
- [Delegitimizace](@/glossary/delegitimizace.md) – příbuzný pojem zpochybnění zdroje.
- [Epistemická monokultura](@/glossary/epistemicka-monokultura.md) – riziko přehnaného
  zásahu.
- [Hyperreality](@/glossary/hyperreality.md) – realita konstruovaná platformami.

**Techniky a detekce**

- [EA-9.6.4 AI Deplatforming Cascade](@/kompendium/techniques/ea-9-6-4-AI-deplatforming-cascade.md)
  – deplatforming jako útok na osobu.
- [Kaskáda deplatformingu](@/kompendium/detection-signatures/24-network-deplatforming-cascade.md)
  – jak ji rozpoznat.
- [Kompendium](@/kompendium/_index.md) – celá taxonomie.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: deplatforming](@/kompendium/glossary-bridges/bridge-deplatforming.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
