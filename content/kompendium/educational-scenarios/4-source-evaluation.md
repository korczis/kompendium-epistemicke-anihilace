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
> **Pro koho**: studenti, analytici, rešeršéři, pracovníci [due diligence](@/glossary/due-diligence.md) a OSINT

CRAAP test je kontrolní seznam z americké knihovnické praxe, který popsala Blakeslee (2004): hodnotí aktuálnost (*Currency*), relevanci (*Relevance*), autoritu (*Authority*), přesnost (*Accuracy*) a účel (*Purpose*) zdroje a byl navržen jako pomůcka pro studenty, kteří se učí vybírat prameny. Jeho strukturní síla je zároveň jeho slabinou: posuzuje zdroj zevnitř, podle toho, jak se sám prezentuje, takže profesionálně vyhlížející web s vymyšlenou redakcí a citacemi projde kontrolou vzhledu snadno. Wineburg a McGrew (2019) ukázali na srovnání profesionálních ověřovatelů faktů se studenty i vysokoškolskými učiteli, že spolehlivější strategií je *laterální čtení* – opuštění hodnoceného textu a ověření zdroje pohledem zvenčí, tím, co o něm říkají jiní. Tento scénář proto kombinuje kontrolní seznam s laterálním čtením a učí účastníka poznat, kde každý z obou postupů selhává.

## Učební cíle

Po cvičení dokáže účastník aplikovat všech pět kritérií CRAAP na konkrétní text a u každého zapsat zdůvodnění, jak doporučuje Blakeslee (2004) jako základ reflektovaného, nikoli mechanického hodnocení. Dále porovná tři zdroje o téže události a oddělí shodná fakta od rozdílných interpretací, což je dovednost, kterou Wineburg (2018) označuje za jádro čtení v digitálním prostředí. Provede laterální čtení ve smyslu Wineburga a McGrewa (2019): zjistí, kdo za zdrojem stojí, odkud pochází jeho autorita a kdo jej cituje. Nakonec vysvětlí, proč samotný kontrolní seznam nestačí proti cíleně budované důvěryhodnosti – výcvik tak sleduje model přenositelného kritického myšlení, jak jej formuloval Facione (1990) v konsenzuální definici expertní skupiny.

## Scénář

Účastníci dostanou tři připravené, fiktivní články o téže události, uzavření regionální nemocniční ambulance, a pracují s nimi jako s realistickým materiálem, u něhož je riziko manipulace jen simulované. Článek A je text regionálního deníku: uvádí datum rozhodnutí, cituje tiskovou zprávu krajského úřadu i vyjádření odborů a odkazuje na usnesení rady kraje. Článek B pochází z webu, jehož název připomíná odborný časopis; tvrdí, že uzavření je „součástí širšího plánu“, cituje „interní dokument“, který nezveřejňuje, a odkazuje na tři další weby téhož vzhledu, přičemž autor má akademický titul a fotografii, ale žádnou dohledatelnou publikační činnost. Článek C je blog lékaře, který v ambulanci pracoval: osobní, emotivní, s několika přesnými detaily o provozu a jednou faktickou chybou v datu. Trojice textů je sestavena tak, aby ztělesnila typické konfigurace zdrojů, s nimiž se čtenář setkává, a aby na fiktivním materiálu umožnila nácvik bez rizika hodnocení skutečných redakcí (Caulfield, 2017).

V první části (asi dvacet pět minut) každý účastník hodnotí všechny tři texty podle pěti kritérií na stupnici 0–2 a píše krátké zdůvodnění, čímž pracuje jen s tím, co texty samy o sobě vypovídají. Ve druhé části (rovněž asi dvacet pět minut) účastníci text opustí a hledají jinde: kdo web provozuje, co o autorovi říkají nezávislé zdroje, zda existuje citované usnesení a kdo na článek odkazuje; hodnocení se poté aktualizuje. Rozdíl mezi oběma skóre je hlavním didaktickým poznatkem cvičení, protože názorně ukazuje, co kritérium uplatněné zevnitř nemůže zachytit (Wineburg a McGrew, 2019). V závěrečné části skupina sestaví srovnávací tabulku toho, co tvrdí všechny tři zdroje, co jen jeden a co si odporuje, a tím převede jednotlivá hodnocení do společného obrazu.

## Signály, kterých si všimnout

Prvním signálem je autorita bez stopy, tedy titul a funkce bez dohledatelné činnosti; tento jev souvisí s technikou [EA-9.1.7 Synthetic Expertise Claim](@/kompendium/techniques/ea-9-1-7-synthetic-expertise-claim.md) a je přesně tím, co laterální čtení odhalí rychleji než vnitřní posouzení (Wineburg a McGrew, 2019). Druhým je uzavřený kruh odkazů, kdy zdroj odkazuje převážně na weby se stejnou strukturou; jde o [cirkularitu citací](@/kompendium/detection-signatures/18-network-citation-circularity.md), kterou Caulfield (2017) popisuje jako typickou pro sítě vzájemně se potvrzujících, ale nezávisle neověřitelných stránek. Třetím je neověřitelný klíčový důkaz: „interní dokument“, který nelze vidět, přesto nese celý závěr, což je klasický příznak tvrzení neseného autoritou místo doložením (Fricker, 2007). Čtvrtým je účel skrytý za formou, kdy odborný vzhled zakrývá, že text nic nevysvětluje, jen naznačuje. Pátým je přenesená reputace, tedy důvěryhodnost vypůjčená od jména, které se jen podobá zavedenému; srovnej [reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md). Pozornost patří i opačnému signálu: článek C má chybu v datu, ale jeho detaily jsou ověřitelné, a drobná nepřesnost svědectví nediskvalifikuje, pokud jádro obstojí – zaměňovat přesnost v jednotlivosti za celkovou spolehlivost je jednou z chyb, před nimiž Blakeslee (2004) varuje.

## Diskusní otázky

Diskuse se zaměří na to, jak se změnilo hodnocení článku B po laterálním čtení a které kritérium CRAAP bylo nejsnáze oklamatelné vzhledem stránky; podle Wineburga a McGrewa (2019) bývá nejzranitelnější právě *Authority*, protože ji text hodnotí z vlastní prezentace. Dále skupina zvažuje, zda má článek C nižší, nebo vyšší hodnotu než A a na co přesně, co počít s tvrzením, které má jediný neověřitelný zdroj, jak by měl vypadat zdroj, který projde CRAAP i laterálním čtením, a přesto klame, a kolik času je rozumné věnovat ověření v běžné práci. Otázky jsou formulovány tak, aby vedly k reflektovanému úsudku, nikoli k jediné správné odpovědi, v souladu s pojetím kritické reflexe u Brookfielda (1995).

## Modelové odpovědi

Článek B obvykle v prvním kroku získá střední až vysoké skóre v *Authority* a *Currency*, protože obě kritéria hodnotí, co zdroj tvrdí o sobě; laterální čtení jeho skóre výrazně sníží, a ponaučení zní, že autoritu je třeba ověřovat mimo zdroj (Wineburg a McGrew, 2019). Článek C je slabší jako podklad pro rozhodnutí kraje, ale silný jako svědectví o provozu, protože hodnota zdroje závisí na otázce, na kterou odpovídá; k témuž rozlišení vede [hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md) a obecněji pojetí epistemické důvěry u Frickerové (Fricker, 2007). Tvrzení s jediným neověřitelným zdrojem se zaznamená jako nepotvrzené, nepřebírá do závěru a hledá se nezávislé potvrzení, k čemuž slouží [triangulace zdrojů](@/kompendium/self-defense-guides/3-source-triangulation.md). Zdroj může být pravdivý v jednotlivostech a přesto klamat výběrem, vynecháním podstatného, a proti tomu pomáhá jen srovnání s dalšími prameny, nikoli hodnocení jediného textu (Caulfield, 2017). Čas na ověření je rozumné volit úměrně váze rozhodnutí: pro sdílení na sociální síti stačí minuta laterálního čtení, pro znalecký posudek nestačí ani den.

## Časté chyby

Nejčastější chybou je mechanické sčítání bodů, jako by kontrolní seznam byl algoritmus, ačkoli dva body za *Purpose* nevyváží neexistující *Authority*; Blakeslee (2004) sám zdůrazňuje, že CRAAP je rámec úsudku, ne vzorec. Druhou chybou je čtení do hloubky místo do šířky: kdo stráví dvacet minut detailní analýzou textu B, ale neověří, kdo jej vydává, hodnotí rétoriku, nikoli zdroj, přesně v protikladu k postupu profesionálních ověřovatelů (Wineburg a McGrew, 2019). Třetí chybou je diskvalifikace kvůli formě, kdy emotivní tón článku C je zaměněn za nepravdivost. Čtvrtou je záměna popularity a spolehlivosti, neboť počet sdílení nic nevypovídá o ověřenosti – rys informačního prostředí, který popisuje Caulfield (2017).

## Debriefing pro facilitátora

Facilitátor nechá skupinu nejprve porovnat skóre z obou kroků, protože rozdíl mezi nimi je hlavní poselství cvičení; teprve poté přesune diskusi od jednotlivých článků k postupu, který si účastníci zavedou jako výchozí krok, čímž se dovednost přenese z konkrétního materiálu do praxe (Facione, 1990). Je vhodné zdůraznit, že cílem není nedůvěřovat všemu, ale vědět, čemu a proč důvěřovat, což odpovídá cíli kritického myšlení jako dispozice, nikoli jen techniky (Brookfield, 1995). Pokud skupina sklouzne k debatě o konkrétních reálných médiích, facilitátor ji vrátí k fiktivnímu materiálu, protože hodnocení skutečných redakcí vyžaduje jiný formát a jiná data.

## Rozšiřující úkoly

Jako přenos do praxe lze zavést „laterální minutu“: týden před sdílením čehokoli strávit minutu zjišťováním, kdo zdroj vydává, a zapsat, kolikrát účastník sdílení zrušil; jde o aplikaci návyku, který Wineburg a McGrew (2019) doporučují jako nejúčinnější jednoduché opatření. Dalším úkolem je doplnit CRAAP o otázky laterálního čtení a vytvořit kartu na jednu stránku pro vlastní obor, tedy přizpůsobit obecný rámec specifickému kontextu, jak navrhuje Facione (1990). Posledním je projít [hodnocení věrohodnosti zdrojů v OSINT](@/kompendium/cross-domain/1-ea-osint-source-credibility.md) a porovnat jeho kritéria s CRAAP, aby účastník viděl profesionální variantu téhož postupu.

## Literatura

- Blakeslee, S. (2004). The CRAAP Test. *LOEX Quarterly*, 31(3).
- Brookfield, S. D. (1995). *Becoming a Critically Reflective Teacher*. San Francisco: Jossey-Bass.
- Caulfield, M. (2017). *Web Literacy for Student Fact-Checkers*. Open textbook.
- Facione, P. A. (1990). *Critical Thinking: A Statement of Expert Consensus for Purposes of Educational Assessment and Instruction* (The Delphi Report). Millbrae: California Academic Press.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford: Oxford University Press.
- Wineburg, S. (2018). *Why Learn History (When It's Already on Your Phone)*. Chicago: University of Chicago Press.
- Wineburg, S., & McGrew, S. (2019). Lateral Reading and the Nature of Expertise. *Teachers College Record*, 121(11).

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
