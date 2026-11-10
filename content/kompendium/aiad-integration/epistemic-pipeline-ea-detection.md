+++
title = "Epistemický proces a detekce technik EA"
description = "Jak šestnáctiúrovňový epistemický proces Prismatic Platform mění surové signály v ověřené vědění, kde v něm zachytává stopy technik EA a co z jeho stavby plyne pro lidské poznávání."
weight = 27

[taxonomies]
tags = ["kompendium", "aiad-integration", "prismatic", "agents", "nabla"]
categories = ["academic", "platform-integration"]

[extra]
related_terms = ["nabla-infinity-ea-pipeline", "decision-engine-ea-calibration", "qeve-ea-quality-validation", "trinity-gate-ea-verification", "osint-ea-source-validation"]
toc = true
+++

# Epistemický proces a detekce technik EA

[Epistemický proces](@/glossary/epistemic-pipeline.md) (*Epistemic Pipeline*) je ústřední architekturou zpracování vědění na Prismatic Platform, softwarové platformě, z níž kniha vzešla. Podle hesla glosáře definuje šestnáctiúrovňovou cestu, na níž se surová, nestrukturovaná data postupně mění ve formálně ověřené vědění: úrovně L0 až L13 vedou od příjmu surových signálů po integrované vědění a následují dvě vrcholové úrovně – Meta, v níž proces hodnotí sám sebe, a úroveň, kterou platforma označuje jako Consciousness. Na rozdíl od běžných datových procesů, které s informací zacházejí jako se zbožím k přesunu a uložení, zachází epistemický proces s informací jako s **tvrzením, které je třeba ověřit**. Ve vztahu k taxonomii epistemických útoků (EA) je to místo, kde se stopy technik zachytávají na úrovni jednotlivých tvrzení. Stránka popisuje stavbu procesu, jeho obrannou funkci a poučení, které z ní kniha vyvozuje.

## Agent v kostce

Kapitola [2.6 Vztah ke NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) popisuje jednotlivé úrovně: příjem surových signálů, extrakci signálů, jejich validaci, atribuci zdrojů, korelaci signálů, detekci vzorců, identifikaci rozporů, výpočet důvěry, tvorbu hypotéz, syntézu důkazů, integraci vědění, podporu rozhodování, doporučení akce a integrované vědění; nad nimi sebehodnocení procesu a vrcholovou úroveň. Každá úroveň uplatňuje stále propracovanější analytické, validační a syntetické operace a do každé jsou vetkány [axiomy NABLA](@/glossary/nabla-axioms.md).

Původní verze této stránky zdůrazňuje, že proces pracuje s granularitou jednotlivých tvrzení a je výpočetně náročný; proto se v plné hloubce používá pro tvrzení, která byla jinými vrstvami označena jako podezřelá, a ne pro veškerý provoz. Výstupem je „obálka“ se skóre jednotlivých kroků a výsledným hodnocením epistemické integrity tvrzení.

## Proč se týká technik EA

Stavba procesu odpovídá tomu, kde techniky EA zasahují. Na úrovni atribuce zdrojů se zachytává [selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) a zdánlivá pluralita; na úrovni korelace a detekce vzorců koordinované šíření a [cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md); na úrovni identifikace rozporů [strategická reinterpretace](@/kompendium/techniques/ea-1-3-2-strategicka-reinterpretace.md), která mění význam dřívějších tvrzení; na úrovni výpočtu důvěry falešná jistota. Heslo glosáře shrnuje vztah ke knize: proces je strojovou podobou toho, co kniha požaduje od lidského poznávání – nepřijímat tvrzení bez původu, hledat nezávislé zdroje, zachovávat rozpory místo jejich potlačení a připustit „nevím“.

## Jak pracuje

Myšlenka, že informace má projít řadou kroků, než se z ní stane vědění, má kořeny ve filosofii informace i v sociální epistemologii. Floridi (2011) rozlišuje mezi daty, informací a věděním a zdůrazňuje, že informace musí být nejen smysluplná, ale i pravdivá, aby mohla být základem vědění. Goldman (1999) chápe sociální epistemologii jako zkoumání procesů, které zvyšují pravděpodobnost pravdivých přesvědčení ve společenství. Epistemický proces tyto myšlenky převádí do inženýrské podoby: každý krok zvyšuje nároky na doložení, a tvrzení, které některým krokem neprojde, se nestane věděním, i když může zůstat zaznamenáno jako hypotéza.

Úroveň Meta má zvláštní význam: proces v ní hodnotí sám sebe – zda jeho kroky fungují, zda se neobjevují systematické chyby. To je inženýrská obdoba [metakognice](@/glossary/metakognice.md). Označení nejvyšší úrovně jako Consciousness je pojmem platformy; kniha z něj nevyvozuje nic o vědomí ve filosofickém smyslu (srov. [Chalmers a těžký problém vědomí](@/kompendium/07-teoreticke-reflexe/chalmers-hard-problem.md)).

Stavba po úrovních má i praktickou výhodu pro audit. Protože každá úroveň zapisuje svůj výsledek, lze u každého přijatého přesvědčení zpětně zjistit, kterými kroky prošlo a na které úrovni se rozhodlo o jeho osudu. Tato dohledatelnost je obranou proti tomu, aby se do vědění platformy dostalo tvrzení, o němž nikdo neví, odkud se vzalo.

## Spolupráce s dalšími agenty

Epistemický proces volá [NABLA Infinity](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) pro hlubší analýzu, používá jej [DD Engine](@/kompendium/aiad-integration/dd-engine-ea-source-weighting.md) při prověrkách a jeho výstupy zpracovává [Decision Engine](@/kompendium/aiad-integration/decision-engine-ea-calibration.md). Vstupní signály dodává mimo jiné [OSINT](@/kompendium/aiad-integration/osint-ea-source-validation.md), závěry ověřuje [QEVE](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) a přijetí přesvědčení propouští [Trinity Gate](@/kompendium/aiad-integration/trinity-gate-ea-verification.md).

## Příklad

Označené tvrzení zní: „Odborná společnost se od výzkumníka distancovala.“ Proces je rozloží: extrakce určí, kdo, co a kdy; atribuce zjistí, že zdrojem jsou dva články a jeden příspěvek na sociální síti; korelace ukáže, že oba články cituje stejný příspěvek; identifikace rozporů najde na webu společnosti prohlášení, které se týká jiné osoby se stejným příjmením. Výpočet důvěry tedy vychází nízko a hypotéza „záměna osob“ má podle důkazů větší oporu než hypotéza „distancování“. Výsledná obálka ukazuje, ve kterém kroku tvrzení selhalo a proč. Kdyby takové tvrzení prošlo bez kontroly, mohlo by se stát součástí [expertní disinflace](@/kompendium/techniques/ea-2-1-1-expertni-disinflation.md) – i bez úmyslu kohokoli.

## Co z toho plyne pro čtenáře knihy

Prvním poučením je **rozklad tvrzení**. Lidé obvykle přijímají nebo odmítají tvrzení jako celek. Proces ukazuje užitečnější postup: rozložit je na části – kdo, co, kdy, odkud – a u každé zvlášť se ptát, z čeho vychází. Kniha tento postup popisuje ve [verifikaci tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) a v [hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md).

Druhým poučením je **rozdíl mezi zaznamenaným a přijatým**. Proces tvrzení nezahazuje, ale ani je bez ověření nepřijímá; mohou zůstat jako hypotézy. Pro člověka v zotavení je to cenné: nemusí okamžitě rozhodnout, zda je výklad skupiny pravdivý, nebo lživý, může jej „odložit“ jako neověřený a vracet se k němu s novými informacemi (srov. [časově odložené hodnocení](@/kompendium/self-defense-guides/37-time-locked-evaluation.md)).

Třetím poučením je **sebehodnocení**. Úroveň Meta připomíná, že i dobrý postup ověřování se musí občas ověřit sám. V lidské praxi tomu odpovídá [osobní audit zkreslení](@/kompendium/self-defense-guides/38-bias-audit-personal.md) a v profesní praxi supervize.

## Proč je hloubková analýza vzácná

Původní stránka upozorňuje, že plná analýza je nákladná a používá se jen pro vybraná tvrzení. Toto omezení není jen technické; vypovídá o obecné vlastnosti poznávání. Ani člověk nemůže každé tvrzení, s nímž se setká, podrobit důkladnému ověření – pracovní paměť i čas jsou omezené. Simon (1955) popsal lidskou racionalitu jako omezenou: lidé nehledají optimální řešení, ale řešení dostatečně dobré vzhledem ke svým možnostem. Epistemický proces tuto omezenost řeší výběrem: hlubokou analýzu dostanou tvrzení, která jsou podezřelá nebo na nichž hodně záleží. Kniha doporučuje lidem tutéž strategii – nesnažit se ověřit vše, ale vědět, která přesvědčení si důkladné ověření zaslouží, a u nich nespoléhat na dojem. Manipulace často míří právě na to, aby se zásadní tvrzení zdála banální, a proto neprošla kontrolou; [rozpočet pozornosti](@/kompendium/self-defense-guides/34-attention-budget.md) pomáhá toto riziko zmenšit.

## Meze a otevřené otázky

Proces je výpočetně náročný a nelze jej uplatnit na veškerý provoz. Jeho kvalita závisí na dostupnosti zdrojů: kde chybějí, správně vede k nízké důvěře, ale nedokáže chybějící údaje nahradit. Původní stránka uváděla jiný počet úrovní a časové parametry; tato stránka se řídí popisem v glosáři a v kapitole 2.6 a provozní hodnoty neuvádí. Pojmenování vrcholové úrovně patří do jazyka platformy a kniha je nepřebírá jako tvrzení o vědomí.

Kniha k tomu dodává, že ani nejlepší proces ověřování nenahradí lidskou odpovědnost za to, jak se s jeho výsledky naloží.

## Literatura

- Floridi, L. (2011). *The Philosophy of Information*. Oxford: Oxford University Press.
- Goldman, A. I. (1999). *Knowledge in a Social World*. Oxford: Oxford University Press.
- Simon, H. A. (1955). A behavioral model of rational choice. *The Quarterly Journal of Economics*, 69(1), 99–118.

## Související

**Agenti**

- [NABLA Infinity a detekce EA](@/kompendium/aiad-integration/nabla-infinity-ea-pipeline.md) – axiomy vetkané do procesu.
- [QEVE a ověřování](@/kompendium/aiad-integration/qeve-ea-quality-validation.md) – ověřuje závěry.
- [OSINT a validace zdrojů](@/kompendium/aiad-integration/osint-ea-source-validation.md) – dodává vstupní signály.

**Pojmy**

- [Epistemic Pipeline](@/glossary/epistemic-pipeline.md) – heslo glosáře.
- [Metakognice](@/glossary/metakognice.md) – lidská obdoba úrovně Meta.

**Kniha**

- [2.6 Vztah ke NABLA Infinity](@/kompendium/02-uvod/vztah-k-nabla.md) – popis jednotlivých úrovní.
- [Computational epistemology](@/kompendium/07-teoreticke-reflexe/computational-epistemology.md) – teoretické zasazení.
- [Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) – rozklad tvrzení v lidské praxi.
