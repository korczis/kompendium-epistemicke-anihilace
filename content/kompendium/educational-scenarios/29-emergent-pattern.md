+++
title = "Vzdělávací scénář: Emergentní vzorec"
date = 2026-04-26
description = "Padesát jednotlivě nevinných záznamů ombudsmana: najít vzorec viditelný až v agregaci pomocí shlukování, časové korelace a anomálií a nepodlehnout iluzi shluku."
weight = 100
draft = false

[taxonomies]
tags = ["kompendium", "educational-scenario", "advanced", "agregace-dat"]

[extra]
level = "Advanced"
type = "educational-scenario"
+++

# Vzdělávací scénář: Emergentní vzorec

> **Úroveň**: Advanced
> **Učební cíl**: Identifikovat vzorec, který je viditelný teprve při agregaci dat, a ověřit, že nejde o artefakt analýzy
> **Doporučená délka**: 180 minut (práce s datovým souborem)
> **Pro koho**: ombudsmani, compliance a interní audit, analytici, výzkumníci, členové etických komisí

Některé vzorce nejsou vidět zblízka: každý jednotlivý incident má rozumné vysvětlení – odklad termínu, změna školitele, nedorozumění o autorství, „osobní důvody“ odchodu – a teprve když se padesát takových záznamů položí vedle sebe, ukáže se, že se soustřeďují kolem stejných míst, lidí a období. Taková vlastnost, patrná jen na úrovni celku a ne jednotlivých prvků, odpovídá tomu, co Simon (1962) popsal jako emergenci v hierarchicky uspořádaných systémech. Zároveň platí opak: lidský mozek nachází vzorce i v náhodě, protože systematicky podceňuje variabilitu malých vzorků (Tversky a Kahneman, 1971) a vidí strukturu tam, kde žádná není (Gilovich, 1991). Scénář proto učí obojí – najít emergentní vzorec a ověřit, že je skutečný – a navazuje na [koordinaci na více cílech](@/kompendium/educational-scenarios/28-multi-target-coordination.md), kde byl vzorec patrný už z kvalitativního srovnání.

## Učební cíle

Po cvičení účastník převede nestrukturované záznamy na analyzovatelné proměnné (kdo, kde, kdy, jaký typ události, jak skončila), tedy provede systematické kódování textových dat, jak je popsáno v tematické analýze (Braun a Clarke, 2006). Použije tři jednoduché analytické přístupy – shlukování podle místa a aktérů, časovou korelaci a vyhledání anomálií vůči základní míře – přičemž posouzení odchylky vůči očekávání vyžaduje zohlednit velikost jednotky (Tversky a Kahneman, 1971). Rozpozná zdroje falešných vzorců, totiž rozdílnou velikost jednotek, zkreslení v ohlašování, vícenásobné srovnávání a iluzi shluku (hledání terče kolem díry po kulce), což jsou klasické cesty k domnělým, avšak neexistujícím vzorcům (Gilovich, 1991). Nakonec formuluje zjištění jako hypotézu k ověření, ne jako obvinění, a navrhne další kroky instituce, přičemž ověření na nových datech je obranou proti nálezu vytvořenému dodatečným hledáním (Nosek et al., 2018).

## Scénář

Kancelář akademického ombudsmana velké univerzity má za šest let padesát smyšlených, anonymizovaných a synteticky připravených záznamů, z nichž žádný nevedl k formálnímu řízení; typické jsou záznamy jako „doktorandka žádá o změnu školitele z osobních důvodů“, „spor o pořadí autorů vyřešen dohodou“, „student přerušil studium, uvádí vyhoření“ nebo „stížnost na nevhodný tón na semináři, vzata zpět“. Účastníci dostanou tabulku se záznamy a s doplňkovými údaji (fakulta, ústav, pracovní skupina jako anonymizovaný kód, typ události, datum, výsledek a počet doktorandů v každé jednotce pro výpočet základní míry), přičemž právě přepočet na základní míru je nutný, aby velikost jednotky nevytvořila zdánlivý vzorec (Tversky a Kahneman, 1971). V týmech nejprve sjednotí typy událostí do kategorií a rozhodnou, co je „stejný typ“, tedy provedou kódování (Braun a Clarke, 2006), poté spočítají míru na sto doktorandů a zjistí, kde se události soustřeďují, dále posoudí, zda se výskyt v čase změnil a zda změny souvisejí s personálními událostmi, a nakonec ověří, zda by vzorec mohl vzniknout jinak. Data obsahují jeden skutečný vzorec – jednu pracovní skupinu s výrazně zvýšenou mírou změn školitele a přerušení studia po nástupu nového vedoucího – a jeden falešný, totiž fakultu s mnoha záznamy, která je prostě největší a má aktivní studentskou radu posílající studenty k ombudsmanovi; rozlišit je lze jen přepočtem a kontrolou artefaktů (Gilovich, 1991).

## Signály, kterých si všimnout

Prvním signálem je shluk nad základní mírou, kdy výskyt v jednotce výrazně převyšuje očekávání podle její velikosti, což je jediný způsob, jak oddělit skutečnou koncentraci od efektu velkého vzorku (Tversky a Kahneman, 1971). Druhým je časový zlom, kdy změna výskytu navazuje na identifikovatelnou událost a posiluje hypotézu o jejím působení (Simon, 1962). Třetím jsou různé kategorie se stejným uzlem, kdy se přerušení studia, změny školitele a spory o autorství sbíhají u téže skupiny; srovnej [vzorcový důkaz](@/glossary/pattern-evidence.md). Čtvrtým jsou vzaté zpět stížnosti, které samy o sobě neznamenají nic, ale v kombinaci se změnami školitele mohou ukazovat na strach z odvety. Pátým jsou eufemismy v záznamech jako „osobní důvody“ a „vyhoření“ opakované u jedné jednotky; srovnej [sémantická eroze](@/kompendium/detection-signatures/8-linguistic-semantic-erosion.md) a nutnost zachytit je kódováním (Braun a Clarke, 2006). Šestým je zkreslení ohlašování, kdy více záznamů vzniká tam, kde je ombudsman známější, ne kde je víc problémů, což je typický zdroj falešného vzorce (Gilovich, 1991).

## Diskusní otázky

Diskuse se zaměří na to, který shluk obstál po přepočtu na základní míru a který zmizel, jak velké musí být odchýlení, aby ho analytik bral vážně, a proč je nebezpečné rozhodnout to až po pohledu na data; práh stanovený až podle dat vede k hledání terče kolem shluku (Gilovich, 1991). Dále se zvažuje, kolik srovnání bylo provedeno a jak to ovlivňuje pravděpodobnost, že jeden shluk vyjde „náhodou“, jak odlišit systémový problém od působení konkrétní osoby a co sdělit rektorovi, aby zjištění vedlo k šetření, ale nepoškodilo předem nikoho konkrétního, přičemž při mnoha porovnáních je nápadný nález pravděpodobný i bez skutečné příčiny (Ioannidis, 2005).

## Modelové odpovědi

Největší fakulta má nejvíc záznamů, ale po přepočtu je průměrná, takže její „vzorec“ vytvořila velikost a ohlašovací kultura, zatímco pracovní skupina s novým vedoucím má míru několikanásobně vyšší a časový zlom (Tversky a Kahneman, 1971). Práh by měl být stanoven před analýzou, protože kdo ho určí až po pohledu na data, snadno nakreslí terč kolem nejbližšího shluku, a ideálně se hypotéza ověří na nových datech (Nosek et al., 2018), srovnej [pre-registraci](@/kompendium/research-methodology/pre-registration-EA-research.md). Při desítkách jednotek a několika kategoriích je pravděpodobné, že některý shluk vyjde nápadně jen náhodou, a proto mají větší váhu vzorce, které se sbíhají ve více nezávislých ukazatelích a mají časový zlom (Ioannidis, 2005), viz [kauzální inference](@/kompendium/research-methodology/causal-inference-EA.md). Systémový problém se projeví napříč jednotkami se společným rysem (financování, pravidla), zatímco osobní působení se váže na konkrétní osobu a sleduje ji i při přesunu, přičemž data to mohou naznačit, ale rozhodnout musí šetření (Simon, 1962). Rektorovi je třeba popsat vzorec, jeho sílu a meze, alternativní vysvětlení a doporučit nezávislé šetření s ochranou studentů, aniž by se jmenovala osoba jako viník (Gilovich, 1991), viz [interní vyšetřování](@/kompendium/organizational-defense/32-internal-investigation.md). Sběr dat lze zlepšit jednotným kódováním záznamů, evidencí velikosti jednotek, pravidelným přehledem a doplňkovými zdroji jako [anonymní zpětná vazba](@/kompendium/organizational-defense/14-anonymous-feedback.md) a [exit interview](@/kompendium/organizational-defense/13-exit-interview-EA.md) (Braun a Clarke, 2006).

## Časté chyby

Nejčastější chybou jsou absolutní čísla, protože bez základní míry vítězí velikost jednotky a vzniká zdánlivý shluk (Tversky a Kahneman, 1971). Druhou je práh po faktu, tedy hranice „nápadnosti“ stanovená až podle dat, kterou Gilovich (1991) popisuje jako chybu terče kolem díry po kulce. Třetí je kauzalita z korelace, kdy časový zlom podporuje hypotézu, ale nedokazuje příčinu (Simon, 1962). Čtvrtou je nálepka na osobu, kdy se statistický vzorec ve zprávě promění v obvinění, ačkoli při mnoha srovnáních je náhodný nález pravděpodobný (Ioannidis, 2005). Pátou je zahození kvalitativních dat, protože text záznamů obsahuje informace, které tabulka ztratí a které zachytí jen kódování (Braun a Clarke, 2006).

## Debriefing pro facilitátora

Facilitátor nechá týmy nejprve odhalit falešný vzorec (velká fakulta), protože jde o nejcennější moment scénáře, a teprve potom diskutuje skutečný, čímž předvede, jak snadno velikost a ohlašovací kultura vytvoří domnělou strukturu (Gilovich, 1991). Zdůrazní, že kvantitativní analýza je zde nástrojem pro to, kde se dívat, ne pro to, co se stalo, protože o příčině rozhoduje až šetření (Simon, 1962). Datový soubor je syntetický, ale připomíná skutečné záznamy, a proto facilitátor připomene zásady ochrany osobních údajů a minimalizace dat při práci s reálnými záznamy; viz [datová bezpečnost výzkumu](@/kompendium/research-methodology/data-security-EA-research.md).

## Rozšiřující úkoly

Jako přenos lze navrhnout kódovací schéma pro záznamy, se kterými účastník pracuje (stížnosti, incidenty, exit interview), tedy aplikovat tematickou analýzu na vlastní data (Braun a Clarke, 2006). Dalším úkolem je prostudovat [AML: pattern recognition](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md) a porovnat jeho metody se scénářem, protože rozpoznávání vzorců v transakcích čelí témuž riziku falešných shluků (Ioannidis, 2005). Posledním je přečíst [výzkumnou laboratoř jako kult](@/kompendium/case-studies/35-research-lab-cult.md) a zvážit, které stopy by se objevily v datech ombudsmana, tedy jak by se emergentní vzorec projevil v záznamech (Simon, 1962).

## Literatura

- Braun, V., & Clarke, V. (2006). Using Thematic Analysis in Psychology. *Qualitative Research in Psychology*, 3(2), 77–101.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Ioannidis, J. P. A. (2005). Why Most Published Research Findings Are False. *PLoS Medicine*, 2(8), e124.
- Nosek, B. A., Ebersole, C. R., DeHaven, A. C., & Mellor, D. T. (2018). The Preregistration Revolution. *Proceedings of the National Academy of Sciences*, 115(11), 2600–2606.
- Simon, H. A. (1962). The Architecture of Complexity. *Proceedings of the American Philosophical Society*, 106(6), 467–482.
- Tversky, A., & Kahneman, D. (1971). Belief in the Law of Small Numbers. *Psychological Bulletin*, 76(2), 105–110.

## Související

**Navazující scénáře**

- [Koordinace na více cílech](@/kompendium/educational-scenarios/28-multi-target-coordination.md) – kvalitativní podoba téže úlohy.
- [Koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md) – agregace v síťových datech.
- [Zkreslení v peer review](@/kompendium/educational-scenarios/13-peer-review-bias.md) – akademické prostředí na úrovni instituce.

**Metodologie**

- [Časové řady v EA monitoringu](@/kompendium/research-methodology/time-series-EA.md) – analýza časového zlomu.
- [Tematická analýza](@/kompendium/research-methodology/thematic-analysis-EA.md) – kódování textových záznamů.

**Organizační obrana**

- [Sledovatelnost rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md) – data, která umožňují vzorec vidět.
- [Učení po incidentu](@/kompendium/organizational-defense/40-post-incident-learning.md) – co s výsledkem udělat.

**Glosář**

- [Pattern evidence](@/glossary/pattern-evidence.md) – vzorec jako důkaz.
- [Graph theory](@/glossary/graph-theory.md) – nástroje pro shlukování podle vztahů.
