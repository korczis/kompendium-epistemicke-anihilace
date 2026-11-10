+++
title = "Vzdělávací scénář: Verifikace tvrzení"
date = 2026-04-26
description = "Od virálního „studie ukázala…“ k původní studii: dohledat primární zdroj, posoudit metodologii, vzorek, recenzní řízení a financování."
weight = 100
draft = false

[taxonomies]
tags = ["kompendium", "educational-scenario", "foundation", "verifikace"]

[extra]
level = "Foundation"
type = "educational-scenario"
+++

# Vzdělávací scénář: Verifikace tvrzení

> **Úroveň**: Foundation
> **Učební cíl**: Dohledat primární zdroj tvrzení a posoudit jeho věrohodnost
> **Doporučená délka**: 90–120 minut (práce ve dvojicích)
> **Pro koho**: studenti, kliničtí pracovníci, novináři, lidé rozhodující podle „výzkumu“

Věta „studie ukázala, že…“ je jedním z nejúčinnějších nosičů tvrzení, protože si vypůjčuje
autoritu vědy, aniž by čtenáři dala do ruky cokoli k ověření. Mezi původním výsledkem a virální
větou obvykle leží několik převyprávění, z nichž každé něco zjednoduší. Scénář trénuje cestu
zpět: **od tvrzení k dokladu** a od dokladu k otázce, co skutečně dokládá.

## Učební cíle

Účastník po cvičení:

1. dohledá původní publikaci, z níž virální tvrzení vychází, nebo doloží, že žádná neexistuje;
2. porovná znění tvrzení se skutečným výsledkem a pojmenuje posuny (rozsah, kauzalita, populace);
3. posoudí základní parametry studie: design, velikost a výběr vzorku, velikost efektu,
   recenzní řízení, financování a střet zájmů;
4. formuluje přesnou verzi tvrzení, kterou studie skutečně podporuje.

## Scénář

Dvojice dostanou snímek obrazovky příspěvku, který koluje na sociálních sítích: *„Vědci
prokázali, že 20 minut denně na sociálních sítích zdvojnásobuje riziko depresí u dospívajících.“*
Příspěvek odkazuje na článek populárního webu, ten na tiskovou zprávu univerzity a ta na studii.
(Facilitátor připraví fiktivní, ale realistický řetězec dokumentů, včetně abstraktu a tabulky
výsledků.)

Při dohledávání dvojice zjistí:

- studie je **průřezová**, nikoli experimentální; měří souvislost, ne příčinu;
- vzorek tvoří dobrovolníci z jedné školy, sebe-výpověď v dotazníku;
- výsledek se týká skupiny s *více než* třemi hodinami denně, ne dvaceti minut;
- „zdvojnásobení“ je relativní riziko z malého výchozího čísla; absolutní rozdíl je malý;
- tisková zpráva výsledek zobecnila, populární web přidal kauzalitu a příspěvek číslo.

Druhá varianta (pro pokročilejší skupiny): tvrzení odkazuje na „studii“, kterou nelze najít.
Dvojice musí rozhodnout, kdy hledání ukončit a jak výsledek formulovat. Sem patří i případy,
kdy citaci vytvořil jazykový model – viz
[EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md).

## Signály, kterých si všimnout

- **Chybějící odkaz** – „vědci zjistili“ bez jména, časopisu nebo roku.
- **Posun kauzality** – „souvisí s“ se mění na „způsobuje“.
- **Posun populace** – výsledek z úzké skupiny se vztahuje na všechny.
- **Relativní číslo bez absolutního** – „dvojnásobek“ bez výchozí hodnoty.
- **Nepřiměřená jistota** – „prokázali“ u jediné studie; viz
  [nepřiměřená sebejistota](@/kompendium/detection-signatures/9-behavioral-disproportionate-confidence.md).
- **Rozšiřování rozsahu** – každé převyprávění tvrdí trochu víc; srovnej
  [posun rozsahu](@/kompendium/detection-signatures/7-linguistic-scope-creep.md).
- **Pseudo-empirický nátěr** – grafy a čísla bez metodologie, viz
  [EA-1.3.2 Pseudo-empirická validace](@/kompendium/techniques/ea-1-3-2-pseudo-empiricka-validace.md).

## Diskusní otázky

1. Na kterém článku řetězce došlo k největšímu posunu a proč právě tam?
2. Jak byste tvrzení přeformulovali, aby odpovídalo studii?
3. Co znamená, že studie prošla recenzním řízením – a co to neznamená?
4. Jak zjistit financování a střet zájmů a jakou váhu jim dát?
5. Kdy je rozumné hledání ukončit a tvrzení označit za nedoložené?
6. Co uděláte, když vám tvrzení pošle blízký člověk, kterému na něm záleží?

## Modelové odpovědi

- **K otázce 1.** Často u tiskové zprávy nebo prvního populárního zpracování: tam se výsledek
  překládá do jazyka „zprávy“ a ztrácí podmínky platnosti.
- **K otázce 2.** Například: *„Průřezová studie na jedné škole zjistila, že dospívající, kteří
  uvádějí více než tři hodiny denně na sociálních sítích, častěji uvádějí depresivní příznaky.
  Studie neprokazuje příčinnou souvislost.“* Přesná verze je delší a méně virální – to je normální.
- **K otázce 3.** Recenze ověřuje rozumnost metodologie a argumentace, ne pravdivost závěru;
  jednotlivé studie se nemusí replikovat, viz [replikační krize](@/glossary/replication-crisis.md).
- **K otázce 4.** Oddíl o financování a deklarace zájmů v publikaci; registr klinických studií,
  pokud jde o intervenci. Střet zájmů je důvod k pozornosti, ne automatické vyvrácení; srovnej
  [conflict of interest ve výzkumu](@/kompendium/research-methodology/conflict-of-interest-research.md).
- **K otázce 5.** Když žádný krok řetězce neuvádí dohledatelný zdroj a hledání v odborných
  databázích nic nenachází. Formulace: „nepodařilo se dohledat zdroj“, nikoli „je to lež“.
- **K otázce 6.** Ptát se, ne vyvracet: „Našel jsem původní studii, podívej, co přesně měřila.“
  Sdílené ověřování chrání vztah lépe než oprava shora.

## Časté chyby

- **Zastavení u tiskové zprávy.** Univerzitní hlavička vyvolává dojem primárního zdroje.
- **Čtení jen abstraktu.** Abstrakt shrnuje závěry autorů, ne nutně jejich omezení.
- **Opačný extrém.** Odmítnout studii, protože „korelace není kauzalita“, je také chyba:
  korelační data mohou být cenná, pokud se správně interpretují.
- **Zaměňování statistické a praktické významnosti.** Statisticky významný efekt může být
  zanedbatelně malý; viz [effect size](@/kompendium/research-methodology/effect-size-EA.md).

## Debriefing pro facilitátora

Ukažte celý řetězec dokumentů vedle sebe a nechte skupinu barevně označit, kde co přibylo
nebo zmizelo. Vizuální obraz posunu bývá silnější než slovní rozbor. Pak se vraťte k osobní
rovině: kolik podobných tvrzení účastníci za poslední měsíc převzali bez ověření.

Téma (duševní zdraví dospívajících) může být pro rodiče ve skupině citlivé. Pokud se debata
stočí k vlastním dětem, uznejte obavu a vraťte se k metodě; cvičení neposuzuje výchovu.

## Rozšiřující úkoly

1. **Řetězec převyprávění.** Najděte skutečné virální tvrzení o výzkumu a zmapujte jeho cestu
   od studie k příspěvku.
2. **Šablona přesného tvrzení.** Vytvořte formulaci, kterou budete používat při citování
   výzkumu: design, populace, velikost efektu, omezení.
3. **Ověření citací z AI.** Nechte si od jazykového modelu vygenerovat tři reference k tématu
   a ověřte, zda existují; postupujte podle návodu [detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md).

## Související

**Navazující scénáře**

- [Evaluace zdrojů](@/kompendium/educational-scenarios/4-source-evaluation.md) – hodnocení nosiče tvrzení.
- [Design falsifikace](@/kompendium/educational-scenarios/6-falsification-design.md) – co by tvrzení vyvrátilo.
- [Vážení důkazů](@/kompendium/educational-scenarios/7-evidence-weighting.md) – kam se studie řadí v hierarchii důkazů.

**Techniky**

- [EA-1.3.2 Pseudo-empirická validace](@/kompendium/techniques/ea-1-3-2-pseudo-empiricka-validace.md) – vědecký vzhled bez vědecké opory.
- [EA-9.1.8 LLM Confabulation Amplification](@/kompendium/techniques/ea-9-1-8-llm-confabulation-amplification.md) – vymyšlené zdroje v oběhu.

**Sebe-obrana**

- [Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) – postup krok za krokem.

**Glosář**

- [Evidence-based](@/glossary/evidence-based.md) – co znamená opírat se o důkazy.
- [Pseudoscience](@/glossary/pseudoscience.md) – rozlišení vědy a jejího napodobení.
- [Replikační krize](@/glossary/replication-crisis.md) – proč jedna studie nestačí.

## Connect

Otázky, zpětná vazba, vlastní případy: [GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [GitHub](https://github.com/korczis)
