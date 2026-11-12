+++
title = "Detekční signatura: Cirkulární definice"
description = "Lingvistická signatura: pojmy definované navzájem v uzavřeném kruhu bez kotvy ve zkušenosti, které vytvářejí vnitřně soudržný, ale neověřitelný systém."
weight = 2

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "linguistic"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["18-network-citation-circularity", "19-network-amplification-asymmetry", "20-network-bot-coordination", "21-network-platform-coordination"]
toc = true
modality = "linguistic"
+++

## Definice signatury

Cirkulární definice nastává, když je pojem A vysvětlen pojmem B, pojem B pojmem C a pojem C se vrací k A – vzniká uzavřený definiční okruh, který nikde nevychází ven ke zkušenosti, pozorování nebo měřitelné veličině. Jednotlivě znějí definice smysluplně; teprve při sledování celého řetězce je vidět, že systém vysvětluje sám sebe.

Signatura je lingvistickým projevem techniky [EA-5.4.16 Implantace kruhových definic](@/kompendium/techniques/ea-5-4-16-kruhove-definice-implantace.md) a příbuzná je s logickou chybou [cirkulární argumentace](@/glossary/cirkularni-argumentace.md) (*petitio principii*). Kde se kruh rozšíří z definic na zdůvodnění, přechází v [past kruhového ospravedlnění](@/kompendium/techniques/ea-5-4-18-circular-justification-trap.md).

## Co signatura indikuje

Uzavřený pojmový systém má pro toho, kdo ho kontroluje, dvě výhody. Zaprvé je **vnitřně konzistentní**, takže působí promyšleně a odolává povrchní kritice. Zadruhé je **externě neověřitelný**: protože žádný pojem nemá kotvu mimo systém, nelze ho porovnat se skutečností. Kdo do systému vstoupí, může v něm uvažovat jen jeho pojmy – a ty vedou zpět k výchozím premisám.

Pro zasaženou osobu to znamená postupnou ztrátu „výstupních bodů“: pokusí-li se pochybnost formulovat, musí to udělat slovy systému, která pochybnost předem vykládají jako omyl. Jde o jeden z mechanismů, jimiž vzniká [epistemická bublina](@/glossary/epistemic-bubble.md) na úrovni jazyka.

Logika tento vzorec zná dlouho jako *petitio principii*, kdy závěr je předpokládán už v premisách. Hamblin (1970) ve svém klasickém rozboru klamů ukázal, že kruhovost není vždy formální chybou – platný úsudek může být kruhový – ale že selhává jako **dialektický nástroj**: nepřesvědčí nikoho, kdo závěr dosud nepřijímá. Walton (1991) na tom založil chápání kruhové argumentace jako taktiky, jejímž účinkem je uzavřít diskusi, nikoli ji posunout. Pro tuto signaturu je podstatné právě toto pragmatické hledisko: kruh v definicích je problémem tehdy, když brání posluchači klást otázky zvenčí. Nguyen (2020) popisuje podobnou strukturu na úrovni důvěry – ozvěnovou komoru, v níž jsou vnější zdroje předem zdiskreditovány – a pojmový kruh lze chápat jako její jazykový protějšek. Lalich (2004) v pojmu ohraničené volby (*[bounded choice](@/glossary/bounded-choice.md)*) ukazuje, že uzavřený pojmový svět nemusí člověku brát svobodu násilím; stačí, když jsou všechny dostupné volby vymezeny pojmy, které vedou zpět k doktríně.

## Pozorovatelné markery

### Lingvistické

| Marker v definicích | Jak se v řeči pozná |
|---|---|
| Uzavřený řetězec | Definice klíčových pojmů se při sledování odkazů vrací k pojmu, od něhož se vyšlo. |
| Definice místo příkladu | Na žádost o konkrétní situaci přichází další definice, ne popis toho, co se stalo. |
| Pojem přes vlastní účinek | Pojem je vymezen svým účinkem a účinek zpět pojmem („pravé vědomí je stav, v němž člověk vidí pravdu; pravdu vidí ten, kdo má pravé vědomí“). |
| Nemožnost negativního případu | Nelze popsat situaci, v níž by pojem neplatil, a tím ani ověřit, že platí. |

### Behaviorální

| Behaviorální marker | Jak se v rozhovoru pozná |
|---|---|
| Odkaz na chybějící zkušenost | Výzva k vnějšímu ukotvení („jak to poznám v praxi?“) je odbyta odkazem na zkušenost, kterou tazatel „ještě nemá“. |
| Podráždění nad rozborem | Rozbor kruhu vyvolá podráždění nebo je označen za „intelektualizaci“. |
| Řazené učení | Nové pojmy se přidávají tak, aby se opíraly jen o pojmy dříve přijaté, a nikdy o něco mimo systém. |

### Relační a institucionální

| Marker v prostředí | Jak se v prostředí pozná |
|---|---|
| Jediný výkladový zdroj | Výklad pojmů má jediný zdroj (vedoucí, zakladatel, „metodika“), proti němuž neexistuje odvolání. |
| Vnější slovník jako nižší úroveň | Používat pojmy „zvenku“ je ve skupině nežádoucí; takový slovník je nálepkován jako nedostatek porozumění. |
| Kruh v hodnocení lidí | „Výkon“ se měří „angažovaností“, ta „kulturou“ a kultura „výkonem“ – a hodnocený nemá jak výsledek zpochybnit. |

## Detekční kritéria

Signatura je pozitivní, pokud platí současně všechny tři podmínky.

| Podmínka | Co musí platit |
|---|---|
| Uzavřenost mapy | Při mapování definic klíčových pojmů vznikne uzavřený řetězec, z něhož nevede žádná vazba ke konkrétnímu pozorování. |
| Marnost žádosti o kotvu | Opakovaná žádost o příklad, protipříklad nebo kritérium použití nepřinese vnější kotvu. |
| Užití k rozhodování o lidech | Systém pojmů slouží k hodnocení lidí nebo k rozhodování o nich (přijetí, postup, vyloučení). |

Pomocným, nikoli nutným kritériem je reakce na pokus kruh pojmenovat – obrana, zesměšnění nebo patologizace tazatele.

## Odlišení od benigních podob

Ne každý definiční kruh je signaturou. **Formální systémy**, jako je matematika a logika, pracují s primitivními pojmy a axiomy, které se nedefinují. Rozdíl je v tom, že to otevřeně deklarují a že systém nevznáší nárok na popis světa, dokud není interpretován; navíc jsou jejich axiomy veřejně přístupné a lze je zkoumat. Také **slovníky** jsou v posledku kruhové, protože každé slovo se vysvětluje jinými slovy; uživatel však jazyk zná ze zkušenosti, takže kruh nikoho neuzavírá a vždy vede k ukázání, příkladu nebo vnímání.

Zvláštní pozornost zasluhuje **hermeneutický kruh**, v němž se porozumění celku a části vzájemně podmiňuje. Gadamer (1960) jej popsal jako podmínku každého porozumění, nikoli jako vadu; tento kruh je ale otevřený novým zkušenostem a textům, které mohou původní předporozumění opravit, ne uzavřený proti nim (viz [hermeneutický kruh](@/glossary/hermeneuticky-kruh.md)). Konečně **rodící se obory** často krátce pracují s vágními a vzájemně provázanými pojmy; na rozdíl od signatury však aktivně hledají operacionalizaci a vítají, když je někdo nutí pojmy upřesnit.

## Klinická diferenciální diagnostika

U zasažené osoby, která kruhový systém převzala, je třeba odlišit **naučené přesvědčení** od **bludného systému**. Blud je obvykle idiosynkratický a nesdílený, kdežto převzatý kruh sdílí skupina a jeho obsah je doložitelný v jejích materiálech. Jaspers (1913) kladl důraz na nepochopitelnost primárního bludu z životních souvislostí; převzatý pojmový systém je naopak z životní historie osoby dobře pochopitelný – lze ukázat, kdy, od koho a v jakém vztahu se ho naučila.

Dále je třeba odlišit **obsedantní ruminaci**, v níž se myšlenky točí v kruhu z úzkosti, ne z naučeného pojmového systému. Osoba takový kruh obvykle vnímá jako trýznivý a cizí, zatímco převzatý pojmový systém prožívá jako vlastní a smysluplný. Třetí možností jsou **poruchy abstraktního myšlení**, například po poranění mozku, kde jde o obecný deficit tvorby definic, nikoli o specifický převzatý slovník; projeví se i mimo témata skupiny a ukáže se při neuropsychologickém vyšetření.

Rozhodující je tedy kontext získání pojmů, který pomůže zmapovat [biografická časová osa](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md). Diagnostický závěr přísluší kvalifikovanému klinikovi; signatura mu dodává podklad, nikoli diagnózu.

## Riziko falešné pozitivity

Prvním zdrojem omylu je hodnotitel, který nezná obor a zaměňuje odbornou terminologii s kruhem. Každá disciplína má pojmy, jejichž definice odkazují na jiné pojmy téže disciplíny; teprve znalec rozpozná, zda řetězec někde vychází ke zkušenosti nebo měření. Konzultace s odborníkem z dané oblasti je proto nezbytnou součástí posouzení. Druhým zdrojem omylu je časová tíseň: rychlý rozhovor nedává prostor pro příklady a mluvčí, který by pojem doložil, k tomu nemusí dostat příležitost. Kruh je třeba ověřit na písemných materiálech a v delším časovém úseku, ne na jedné větě.

Třetí riziko se týká náboženských a filozofických systémů, které obsahují pojmy záměrně vzdorující definici, jako jsou apofatické tradice (viz [via negativa](@/glossary/via-negativa.md)). To samo signaturou není a hodnotitel nesmí zaměňovat teologickou nebo metafyzickou pozici za manipulaci. Signaturou se stává až použití takového systému k uzavření kritiky a ke kontrole osob, tedy ve chvíli, kdy nedefinovatelnost začne sloužit k tomu, aby se nesouhlas nedal vyslovit.

## Validační test

**Mapa definic.** Klíčové pojmy se zapíší jako uzly a definiční vazby jako šipky. Ke každému uzlu se doplní, zda má vazbu na pozorovatelný jev („co bych viděl, kdyby to platilo?“). Pokud graf obsahuje uzavřený cyklus bez jediné takové vazby, je signatura podložená. Test slouží k orientaci hodnotitele; s klientem se dělá jen jako společná, nekonfrontační práce s jeho vlastním jazykem.

## Dokumentace v praxi

Dokumentace kruhu se opírá o čtyři prvky.

| Záznamová položka | Co obsahuje |
|---|---|
| Doslovné definice | Definice uvedené slovo za slovem s odkazem na zdroj (materiál, nahrávka, výpověď). |
| Mapa definic | Mapa definic přiložená jako pracovní příloha s datem svého vytvoření. |
| Položené otázky | Jaké otázky na kotvu byly položeny a co na ně zaznělo. |
| Oddělení popisu od výkladu | Popis struktury (kruh existuje) oddělený od interpretace (proč byl vytvořen). |

V organizačním a právním kontextu má mapa definic hodnotu tam, kde se posuzuje, zda osoba rozuměla tomu, s čím souhlasila (srov. [doktrína nepřípustného vlivu](@/kompendium/forensic-legal/11-undue-influence-doctrine.md)).

## Doporučený postup

**Pro zasaženou osobu:** u každého pojmu, který rozhoduje o jejím životě, hledat jednu konkrétní situaci, kdy by poznala, že *neplatí*. Pokud žádnou nenajde, je to užitečná informace o pojmu, ne o ní. Pomáhá rozhovor s člověkem mimo skupinu, který pojmy nezná.

**Pro profesionála:** nevyvracet systém naráz – rozbití celého pojmového rámce bez náhrady může vyvolat dezorientaci (viz [nejistota o realitě](@/kompendium/detection-signatures/28-phenomenological-reality-uncertainty.md)). Postupovat po jednotlivých pojmech a společně s klientem k nim hledat vnější kotvy; rámec poskytuje [hermeneutická rekonstrukce](@/kompendium/techniques/ea-6-3-4-hermeneuticka-rekonstrukce.md).

**Eskalace:** samotná signatura krizový zásah nevyžaduje; při souběhu s akutní dezorientací nebo paralýzou rozhodování platí [akutní kognitivní paralýza](@/kompendium/emergency-protocols/7-acute-cognitive-paralysis.md).

## Ilustrativní příklad

*Anonymizovaný kompozit.* Firma zavede hodnoticí systém, v němž je „kulturní soulad“ definován jako „projevování firemních hodnot“, hodnoty jako „to, co dělají lidé v kulturním souladu“, a nízké skóre souladu je důvodem k nepřiznání odměn. Zaměstnanec se ptá, jaké konkrétní chování by skóre zlepšilo, a dostává odpověď, že „kdo se ptá, ten soulad necítí“. Interní vyšetřovatel sestaví mapu definic, doloží uzavřený cyklus bez pozorovatelných kritérií a doporučí revizi systému podle zásad [sledovatelnosti rozhodnutí](@/kompendium/organizational-defense/21-decision-traceability.md).

## Limity a otevřené otázky

Kde přesně končí legitimní teoretický holismus a začíná uzavřený kruh, je filozoficky sporné. Quine (1951) ukázal, že naše přesvědčení čelí zkušenosti jako celek, nikoli jednotlivě, a že každý pojmový systém je do jisté míry provázaný sám se sebou (srov. [holismus](@/glossary/holismus.md)). Signatura proto nemůže tvrdit, že provázanost pojmů je sama o sobě vadou; tvrdí jen, že systém, který se nikde nedotýká zkušenosti a který dotazy na tuto kotvu trestá, se chová jinak než otevřený holistický celek. Popper (1963) by stejný rozdíl formuloval jako rozdíl mezi teorií, která riskuje vyvrácení, a teorií, která se před ním imunizuje.

Praktickým omezením je pracnost mapy definic a její závislost na úplnosti materiálu; ústní systémy, které se předávají v rozhovorech a nikdy nebyly sepsány, se mapují obtížně. Kruh navíc sám o sobě neříká nic o úmyslu: může vzniknout z nedbalosti, z neschopnosti autora nebo z upřímného, ale nekritického myšlení. Otázka záměru proto do detekce nepatří a je předmětem jiného, například forenzního posouzení.

## Literatura

- Gadamer, H.-G. (1960). *Wahrheit und Methode: Grundzüge einer philosophischen Hermeneutik*. J. C. B. Mohr (Paul Siebeck).
- Hamblin, C. L. (1970). *Fallacies*. Methuen.
- Jaspers, K. (1913). *Allgemeine Psychopathologie*. Springer.
- Lalich, J. (2004). *Bounded Choice: True Believers and Charismatic Cults*. University of California Press.
- Nguyen, C. T. (2020). Echo chambers and epistemic bubbles. *Episteme*, 17(2), 141–161.
- Popper, K. R. (1963). *Conjectures and Refutations: The Growth of Scientific Knowledge*. Routledge & Kegan Paul.
- Quine, W. V. O. (1951). Two dogmas of empiricism. *The Philosophical Review*, 60(1), 20–43.
- Walton, D. N. (1991). *Begging the Question: Circular Reasoning as a Tactic of Argumentation*. Greenwood Press.

## Související

**Sourozenecké signatury**

- [Hustota žargonu](@/kompendium/detection-signatures/1-linguistic-jargon-density.md) – kruh je často schován v hustém slovníku.
- [Nefalsifikovatelná tvrzení](@/kompendium/detection-signatures/3-linguistic-unfalsifiable-claims.md) – kruh jako zdroj imunity vůči vyvrácení.
- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – stejná struktura na úrovni zdrojů.

**Techniky a pojmy**

- [EA-5.4.16 Implantace kruhových definic](@/kompendium/techniques/ea-5-4-16-kruhove-definice-implantace.md) – technika, kterou signatura zachycuje.
- [Tautologie](@/glossary/tautologie.md) – logická podstata prázdného kruhu.
- [Falsifikovatelnost](@/glossary/falsifikovatelnost.md) – kritérium, které kruh obchází.

**Klinika, právo a obrana**

- [Kruhové uvažování v EA detekci](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md) – varování, že i detekce může být kruhová.
- [Středně-dobý hermeneutický reset](@/kompendium/recovery-protocols/midterm-hermeneutic-reset.md) – obnova vlastních významů.
- [Vzdělávací scénář: Řešení rozporů](@/kompendium/educational-scenarios/8-contradiction-resolution.md) – nácvik práce s protipříklady.

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
