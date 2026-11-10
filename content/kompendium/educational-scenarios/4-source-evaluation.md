+++
title = "Vzdělávací scénář: Evaluace zdrojů"
date = 2026-04-26
description = "Tři články o téže události hodnocené podle CRAAP testu a laterálním čtením: kde se kontrolní seznam osvědčí a kde ho lze obejít."
weight = 100
draft = false

[taxonomies]
tags = ["kompendium", "educational-scenario", "foundation", "hodnoceni-zdroju"]

[extra]
level = "Foundation"
type = "educational-scenario"
+++

# Vzdělávací scénář: Evaluace zdrojů

> **Úroveň**: Foundation
> **Učební cíl**: Aplikovat CRAAP test (Currency, Relevance, Authority, Accuracy, Purpose) a poznat jeho meze
> **Doporučená délka**: 90 minut
> **Pro koho**: studenti, analytici, rešeršéři, pracovníci due diligence a OSINT

**CRAAP test** je kontrolní seznam z knihovnické praxe: hodnotí aktuálnost (*Currency*),
relevanci (*Relevance*), autoritu (*Authority*), přesnost (*Accuracy*) a účel (*Purpose*) zdroje.
Je užitečný jako struktura, ale má slabinu: posuzuje zdroj zevnitř, podle toho, jak se sám
prezentuje. Profesionálně vyhlížející web s vymyšlenou redakcí a citacemi projde kontrolou
vzhledu snadno. Proto scénář kombinuje CRAAP s **laterálním čtením** – ověřováním zdroje
pohledem zvenčí, tedy tím, co o něm říkají jiní.

## Učební cíle

Účastník po cvičení:

1. aplikuje všech pět kritérií CRAAP na konkrétní text a zapíše zdůvodnění u každého;
2. porovná tři zdroje o téže události a oddělí shodná fakta od rozdílných interpretací;
3. provede laterální čtení: zjistí, kdo za zdrojem stojí, odkud pochází jeho autorita a kdo
   ho cituje;
4. vysvětlí, proč samotný kontrolní seznam nestačí proti cíleně budované důvěryhodnosti.

## Scénář

Účastníci dostanou tři (připravené, fiktivní) články o téže události – uzavření regionální
nemocniční ambulance:

- **Článek A** – regionální deník; uvádí datum rozhodnutí, cituje tiskovou zprávu krajského
  úřadu i vyjádření odborů, odkazuje na usnesení rady kraje.
- **Článek B** – web s názvem připomínajícím odborný časopis; tvrdí, že uzavření je „součástí
  širšího plánu“, cituje „interní dokument“, který nezveřejňuje, a odkazuje na tři další weby
  stejného vzhledu. Autor má akademický titul a fotografii, ale žádnou dohledatelnou publikační
  činnost.
- **Článek C** – blog lékaře, který v ambulanci pracoval; osobní, emotivní, s několika
  přesnými detaily o provozu a jednou faktickou chybou v datu.

**Krok 1 – CRAAP zevnitř (25 min).** Každý účastník hodnotí všechny tři texty podle pěti
kritérií na stupnici 0–2 a píše krátké zdůvodnění.

**Krok 2 – laterální čtení (25 min).** Účastníci opustí text a hledají jinde: kdo web
provozuje, co o autorovi říkají nezávislé zdroje, zda existuje citované usnesení, kdo na článek
odkazuje. Hodnocení se aktualizuje.

**Krok 3 – srovnání (20 min).** Skupina sestaví tabulku: co tvrdí všechny tři zdroje, co jen
jeden, co si odporuje.

## Signály, kterých si všimnout

- **Autorita bez stopy** – titul a funkce bez dohledatelné činnosti; souvisí s
  [EA-9.1.7 Synthetic Expertise Claim](@/kompendium/techniques/ea-9-1-7-synthetic-expertise-claim.md).
- **Uzavřený kruh odkazů** – zdroj odkazuje převážně na weby se stejnou strukturou; viz
  [cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md).
- **Neověřitelný klíčový důkaz** – „interní dokument“, který nelze vidět, nese celý závěr.
- **Účel skrytý za formou** – odborný vzhled zakrývá, že text nic nevysvětluje, jen naznačuje.
- **Přenesená reputace** – důvěryhodnost se vypůjčuje od jména, které se jen podobá
  zavedenému; srovnej [reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md).

Pozor i na opačný signál: článek C má chybu v datu, ale jeho detaily jsou ověřitelné. Drobná
nepřesnost nediskvalifikuje svědectví, pokud jádro obstojí.

## Diskusní otázky

1. Jak se změnilo vaše hodnocení článku B po laterálním čtení?
2. Které kritérium CRAAP bylo nejsnáze „oklamatelné“ vzhledem stránky?
3. Má článek C nižší, nebo vyšší hodnotu než A? Na co přesně?
4. Co dělat s tvrzením, které má jen jeden zdroj, a ten je neověřitelný?
5. Jak by měl vypadat zdroj, který projde CRAAP i laterálním čtením, a přesto klame?
6. Kolik času je rozumné věnovat ověření zdroje v běžné práci?

## Modelové odpovědi

- **K otázce 1–2.** Článek B obvykle v kroku 1 získá střední až vysoké skóre v *Authority*
  a *Currency*, protože obě kritéria hodnotí, co zdroj tvrdí o sobě. Laterální čtení jeho skóre
  výrazně sníží. Ponaučení: autoritu ověřujte mimo zdroj.
- **K otázce 3.** Článek C je slabší jako zdroj pro rozhodnutí kraje, ale silný jako svědectví
  o provozu. Hodnota zdroje závisí na otázce, na kterou odpovídá; srovnej
  [hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md).
- **K otázce 4.** Zaznamenat jako nepotvrzené, nepřebírat do závěru, hledat nezávislé potvrzení;
  viz [triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md).
- **K otázce 5.** Zdroj může být pravdivý v jednotlivostech a klamat výběrem – vynecháním
  podstatného. Proti tomu pomáhá jen srovnání s dalšími zdroji, nikoli hodnocení jednoho textu.
- **K otázce 6.** Úměrně váze rozhodnutí. Pro sdílení na sociální síti stačí minuta laterálního
  čtení; pro znalecký posudek nestačí ani den.

## Časté chyby

- **Mechanické sčítání bodů.** Kontrolní seznam není algoritmus; dva body za *Purpose*
  nevyváží neexistující *Authority*.
- **Čtení do hloubky místo do šířky.** Kdo stráví dvacet minut detailní analýzou textu B, ale
  neověří, kdo ho vydává, hodnotí rétoriku, ne zdroj.
- **Diskvalifikace kvůli formě.** Emotivní tón článku C neznamená nepravdivost.
- **Záměna popularity a spolehlivosti.** Počet sdílení nic neříká o ověřenosti.

## Debriefing pro facilitátora

Nechte skupinu nejprve porovnat skóre z kroku 1 a 2 – rozdíl je hlavní poselství. Poté
přesuňte diskusi od jednotlivých článků k postupu: co si účastníci zavedou jako výchozí krok.
Zdůrazněte, že cílem není nedůvěřovat všemu, ale vědět, *čemu* a *proč* důvěřovat.

Pokud skupina sklouzne k debatě o konkrétních reálných médiích, vraťte ji k fiktivnímu
materiálu; hodnocení skutečných redakcí vyžaduje jiný formát a jiná data.

## Rozšiřující úkoly

1. **Laterální minuta.** Týden před sdílením čehokoli strávte minutu zjišťováním, kdo zdroj
   vydává. Zapište, kolikrát jste sdílení zrušili.
2. **Vlastní CRAAP+.** Doplňte CRAAP o otázky laterálního čtení a vytvořte kartu na jednu
   stránku pro svůj obor.
3. **OSINT přenos.** Projděte [hodnocení věrohodnosti zdrojů v OSINT](@/kompendium/cross-domain/1-ea-osint-source-credibility.md)
   a porovnejte jeho kritéria s CRAAP.

## Související

**Navazující scénáře**
- [Kurátorství informací](@/kompendium/educational-scenarios/3-information-curation.md) – struktura vlastního příjmu zdrojů.
- [Verifikace tvrzení](@/kompendium/educational-scenarios/5-claim-verification.md) – od zdroje k primárnímu dokladu.
- [Řešení rozporů](@/kompendium/educational-scenarios/8-contradiction-resolution.md) – co dělat, když se kvalitní zdroje rozcházejí.

**Detekční signatury**
- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – uzavřené kruhy odkazů.
- [Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md) – vypůjčená důvěryhodnost.

**Sebe-obrana**
- [Rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md) – každodenní srovnávání zdrojů.
- [Triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md) – nezávislá potvrzení.

**Glosář a praxe**
- [OSINT](@/glossary/osint.md) – disciplína, z níž laterální čtení vychází.
- [Cross-source triangulace v OSINT](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – profesionální varianta.

## Connect

Otázky, zpětná vazba, vlastní případy: [GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [GitHub](https://github.com/korczis)
