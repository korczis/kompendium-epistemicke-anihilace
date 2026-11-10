+++
title = "Vizualizace pro sekci 06 – klinická cesta zotavení"
description = "Interaktivní graf klinické cesty po expozici technikám EA: fáze od posouzení po zotavení, jejich stránky v knize a odkazy mezi nimi podle grafu knihy."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "chartjs", "klinicke-aplikace", "zotaveni"]
categories = ["academic", "clinical", "tools"]

[extra]
related_terms = ["supervizni-ramce", "terapeuticke-pristupy", "vulnerabilni-populace", "semi-structured-interview-protokol"]
section_icon = "🏥"
toc = false
+++

# Klinická cesta zotavení

Tato vizualizace patří k [sekci 06](@/kompendium/06-klinicke-aplikace/_index.md) a ukazuje klinickou cestu člověka, který byl vystaven technikám [epistemické anihilace](@/glossary/epistemicka-anihilace.md), jako sled fází péče. U každé fáze uvádí stránky knihy, které se k ní vztahují, a mezi fázemi kreslí oblouky podle toho, jak na sebe tyto stránky v knize odkazují. Je určena klinikům, supervizorům a studentům; klientovi může posloužit jako mapa, která ukazuje, že zotavení má strukturu a že se dá postupovat po krocích. Přiřazení stránek k fázím je redakční rozhodnutí této stránky podle obsahu kapitol; počty a oblouky jsou odvozeny z odkazů a katalogu knihy.

## Fáze cesty a jejich stránky

Graf čte fáze přímo z následujícího číslovaného seznamu: tučný název je název fáze, text položky její popis a odkazy v položce stránky, které k fázi patří.

1. **Posouzení** – vstupní fáze, která má získat obraz toho, co člověk prožil, jak o tom mluví a jaké opory mu zůstaly: [self-report instrumenty](@/kompendium/06-klinicke-aplikace/self-report-instrumenty.md), [semistrukturovaný klinický rozhovor](@/kompendium/06-klinicke-aplikace/semi-structured-interview-protokol.md), [screeningové instrumenty](@/kompendium/06-klinicke-aplikace/screening-instrumenty-detail.md), [observační posouzení](@/kompendium/06-klinicke-aplikace/observational-assessment.md), [rozhovor s blízkými osobami](@/kompendium/06-klinicke-aplikace/collateral-interview-protokol.md) a [rekonstrukce životní časové osy](@/kompendium/06-klinicke-aplikace/biographical-timeline-rekonstrukce.md).
2. **Diagnostika** – převod zjištění v pracovní hypotézu a odlišení od stavů s podobným obrazem: [diagnostické indikátory a markery EA](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md), [diferenciální diagnostika vůči PTSD, komplexnímu traumatu a disociativním poruchám](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md) a [odlišení od psychózy](@/kompendium/06-klinicke-aplikace/dd-ea-psychoza/_index.md).
3. **Intervence** – aktivní terapeutická fáze, která začíná stabilizací a pokračuje obnovou úsudku: [akutní stabilizační protokol](@/kompendium/recovery-protocols/acute-stabilization-protocol.md), [přehled terapeutických přístupů](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md), [protokoly epistemické rekonstrukce](@/kompendium/06-klinicke-aplikace/epistemicka-rekonstrukce.md), [práce s vulnerabilní populací](@/kompendium/06-klinicke-aplikace/vulnerabilni-populace.md) a [kolektivní a institucionální intervence](@/kompendium/06-klinicke-aplikace/kolektivni-intervence.md).
4. **Sledování** – udržení dosažených změn a ochrana klienta i terapeuta: [supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md), [preventivní strategie](@/kompendium/06-klinicke-aplikace/preventivni-strategie.md) a [dlouhodobá prevence relapsu](@/kompendium/recovery-protocols/longterm-relapse-prevention.md).
5. **Zotavení** – dlouhodobé upevnění samostatnosti, návrat do práce, učení a společenství a obnova odolnosti a smyslu: [rekonstrukce identity](@/kompendium/recovery-protocols/midterm-identity-reconstruction.md), [vokační integrace](@/kompendium/recovery-protocols/midterm-vocational-integration.md), [vzdělávací reintegrace](@/kompendium/recovery-protocols/midterm-educational-reintegration.md), [kultivace resilience](@/kompendium/recovery-protocols/longterm-resilience-cultivation.md), [rekonstrukce komunity](@/kompendium/recovery-protocols/longterm-community-rebuilding.md), [prohlubování smyslu](@/kompendium/recovery-protocols/longterm-meaning-deepening.md), [posttraumatický růst](@/kompendium/recovery-protocols/longterm-post-traumatic-growth.md) a [altruistické kanalizování](@/kompendium/recovery-protocols/longterm-altruistic-channeling.md).

<canvas id="section-06-recovery-flow" width="800" height="500"></canvas>
<div id="recovery-flow-detail" class="mt-4 p-4 rounded-lg border border-gray-200 bg-white text-gray-900 dark:border-gray-700 dark:bg-gray-800 dark:text-white"></div>
{{ <viz_script name="section-06-recovery-flow" /> }}

## Co graf zobrazuje

Každý **sloupec** odpovídá jedné fázi ze seznamu nad grafem, v jeho pořadí zleva doprava. **Výška sloupce** je počet stránek knihy, na které položka dané fáze odkazuje. Neznamená tedy počet pacientů, podíl klientů, kteří fází projdou, ani délku či náročnost fáze: říká jen, kolik kapitol kniha k fázi nabízí. **Oblouky** nad sloupci spojují dvě fáze, pokud stránky jedné z nich odkazují na stránky druhé; číslo u oblouku je počet takových odkazů v grafu odkazů knihy a tloušťka a sytost čáry rostou s tímto počtem. Oblouky vpřed (zleva doprava) jsou vyklenuty nahoru, oblouky zpět jsou nižší a šipka ukazuje směr odkazu.

Sloupec Zotavení nese protokoly ze sekce [longitudinálních rekonstruktivních protokolů](@/kompendium/recovery-protocols/_index.md), které rejstřík řadí do středně-dobé a dlouhodobé fáze a které se týkají integrace, odolnosti a smyslu. Akutní stabilizace patří do fáze intervence, protože terapie podle obecně přijímaného pojetí začíná nastolením bezpečí (Herman 1992), a prevence relapsu do fáze sledování.

## Jak graf číst

Klepnutí na sloupec zvýrazní jeho okraj a pod grafem vypíše název a popis fáze, seznam jejích stránek s odkazy a přehled odkazů, které vedou z této fáze do ostatních a z ostatních do ní. Čísla kapitol v detailu přebírá graf z názvů stránek, takže odpovídají číslování v knize.

Graf je třeba číst jako mapu, ne jako jízdní řád. Pořadí sloupců vyjadřuje typický sled péče, ale skutečná cesta se vrací: nový podnět může vyvolat potřebu znovu posoudit stav, objevení dalších vzpomínek může vrátit klienta ze sledování do intervence. Model stadií změny, který James Prochaska a Carlo DiClemente popsali u změny chování, také počítá s tím, že návrat k dřívějšímu stadiu je běžnou součástí změny, ne selháním (Prochaska a DiClemente 1983). Oblouky zpět v grafu tento návrat nezobrazují; zobrazují jen to, že kapitoly pozdějších fází odkazují na kapitoly dřívějších – což je ovšem textová obdoba téže zkušenosti: pozdější práce se k dřívějším krokům odvolává.

Husté oblouky mezi dvěma fázemi naznačují, že je kniha popisuje v těsné souvislosti, a čtenář, který pracuje v jedné z nich, by měl znát i druhou. Slabý nebo chybějící oblouk neznamená, že spolu fáze nesouvisejí; může jen ukazovat, kde je kniha zatím méně provázaná.

## Teoretické opory fázového členění

Fázové členění vychází z dlouhodobě přijímaného pohledu na zotavení z traumatu. Judith Hermanová popsala zotavení jako postup třemi stadii – nastolení bezpečí, vzpomínání a truchlení, znovunavázání vztahů se světem – a zdůraznila, že postup není přímočarý (Herman 1992). Stevan Hobfoll a jeho kolegové shrnuli pět prvků, které podporují zotavení v prvních týdnech po zátěži: bezpečí, zklidnění, vlastní a komunitní účinnost, propojenost a naději (Hobfoll et al. 2007). Model této stránky doplňuje Hermanové rámec o kroky, které léčbě předcházejí (posouzení, diagnostika) a které ji následují (sledování, dlouhodobé zotavení), protože u epistemické anihilace se poškození netýká jen prožitku, ale i schopnosti ověřovat, čemu věřit.

Christine Courtoisová a Julian Ford zdůrazňují, že u komplexního traumatu je přesná diagnostika předpokladem bezpečné léčby, protože postupy vhodné pro jednorázové trauma mohou u dlouhodobě traumatizovaných lidí stav zhoršit (Courtois a Ford 2009); proto je diagnostika v grafu samostatnou fází. Pro lidi, kteří odešli ze skupin s vysokou mírou kontroly, popsaly Janja Lalichová a Madeleine Tobiasová typické úkoly zotavení: porozumět tomu, co se stalo, obnovit vlastní úsudek a hodnoty, vyrovnat se se ztrátami a znovu vybudovat vztahy (Lalich a Tobias 2006). Steven Hassan zdůrazňuje, že základní podmínkou je obnova přístupu k informacím a k vlastnímu hlasu, ne přechod k jiné autoritě (Hassan 2015), a Bessel van der Kolk upozorňuje na tělesný rozměr traumatu, který musí být součástí i kognitivně zaměřené péče (van der Kolk 2014).

## Jak s grafem pracovat

V klinické praxi může graf sloužit ke společnému plánování: klinik s klientem určí, kde se právě nacházejí, co je cílem dané fáze a jak poznají, že lze postoupit dál, a v detailu fáze najdou kapitoly, které k tomu kniha nabízí. To samo má terapeutický smysl – člověk, jemuž manipulace vzala orientaci v čase a v příčinách, dostává srozumitelnou strukturu, na které se podílí. V supervizi pomáhá graf odhalit, zda se péče nezasekla v jedné fázi, nebo zda nebyla některá fáze přeskočena; typicky jde o situaci, kdy se s intenzivní prací na vzpomínkách začne dřív, než je zajištěno bezpečí.

Obecný příklad (kompozit): muž ve středním věku přichází po rozpadu vztahu, v němž byl roky soustavně zpochybňován. V posouzení popisuje, že si „nepamatuje správně“ a že neví, čemu věřit. Diagnostika vyloučí počínající neurokognitivní poruchu a ukáže obraz odpovídající dlouhodobému [gaslightingu](@/glossary/gaslighting.md). Intervence začíná stabilizací a drobnými cvičeními ověřování – vedením deníku, porovnáváním záznamů s dokumenty –, teprve později přichází zpracování vztahu. Ve fázi sledování se objeví návrat pochybností při kontaktu s bývalou partnerkou kvůli společnému majetku; graf pomůže pochopit, že nejde o selhání léčby, ale o očekávatelný návrat, na který lze připravit plán. Ve fázi zotavení se práce přesouvá k návratu do zaměstnání a k obnově přátelství, které vztah postupně zúžil. Podobné průběhy v akademickém prostředí ukazují anonymizované případové studie [6.7](@/kompendium/06-klinicke-aplikace/pripad-akademie.md) a [6.8](@/kompendium/06-klinicke-aplikace/pripad-doktorat.md).

Fáze sledování se netýká jen klienta. Práce s lidmi, jejichž zkušenost zahrnuje dlouhodobou manipulaci a zpochybňování, zatěžuje i terapeuta: Irene Lisa McCannová a Laurie Anne Pearlmanová popsaly zástupnou traumatizaci jako postupnou proměnu přesvědčení pomáhajícího o bezpečí, důvěře a kontrole, k níž dochází opakovaným kontaktem s traumatem klientů (McCann a Pearlman 1990). Supervizní rámce zařazené do této fáze proto chrání kvalitu péče dvojím způsobem – udržují odstup terapeuta a brání tomu, aby se v terapeutickém vztahu nepozorovaně opakovala dynamika závislosti, z níž klient odešel.

## Co graf ukázat nemůže

Graf je ilustrativní didaktická pomůcka nad strukturou knihy, ne standard péče, validovaný klinický postup ani klinická data. Starší verze této stránky mluvila o tloušťce šipek jako o „častějším přechodu klienta“; žádná taková data kniha nemá, a graf proto ukazuje jen odkazy mezi kapitolami. Nenahrazuje odborné vyšetření a nepopisuje léčbu jednotlivých poruch; u akutního ohrožení mají přednost krizové služby a [akutní intervenční protokoly](@/kompendium/emergency-protocols/_index.md). Neukazuje ani souběžné potřeby, které zotavení podmiňují – bezpečné bydlení, právní ochranu, finanční nezávislost –, a nezobrazuje roli blízkých a komunity, kterou rozebírají jiné části knihy.

Edward Tufte požaduje, aby každý grafický prvek nesl informaci a nevyvolával dojem přesnosti, kterou data nemají (Tufte 1983); Alberto Cairo k tomu dodává, že poctivá vizualizace má sdělit i nejistotu svých dat (Cairo 2016). Nejistota této vizualizace leží především v přiřazení stránek k fázím: je výsledkem úsudku, ne měření, a jiný autor by některé kapitoly zařadil jinam. Proto je přiřazení zapsáno otevřeně v seznamu nad grafem, kde je lze přečíst, zpochybnit a upravit.

## Literatura

- Cairo, A. (2016). *The Truthful Art: Data, Charts, and Maps for Communication*. New Riders.
- Courtois, C. A., & Ford, J. D. (Eds.) (2009). *Treating Complex Traumatic Stress Disorders: An Evidence-Based Guide*. Guilford Press.
- Hassan, S. (2015). *Combating Cult Mind Control* (rev. vyd.). Freedom of Mind Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Hobfoll, S. E., Watson, P., Bell, C. C., et al. (2007). Five essential elements of immediate and mid-term mass trauma intervention: Empirical evidence. *Psychiatry*, 70(4).
- Lalich, J., & Tobias, M. (2006). *Take Back Your Life: Recovering from Cults and Abusive Relationships*. Bay Tree.
- McCann, I. L., & Pearlman, L. A. (1990). Vicarious traumatization: A framework for understanding the psychological effects of working with victims. *Journal of Traumatic Stress*, 3(1).
- Prochaska, J. O., & DiClemente, C. C. (1983). Stages and processes of self-change of smoking: Toward an integrative model of change. *Journal of Consulting and Clinical Psychology*, 51(3).
- Tufte, E. R. (1983). *The Visual Display of Quantitative Information*. Graphics Press.
- van der Kolk, B. (2014). *The Body Keeps the Score*. Viking.

## Související

**Kapitoly sekce 06**

- [Diagnostické indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – znaky EA pro fázi diagnostiky.
- [Diferenciální diagnostika](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md) – odlišení od PTSD, komplexního traumatu a disociativních poruch.
- [Terapeutické přístupy](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md) – přehled pro fázi intervence.
- [Epistemická rekonstrukce](@/kompendium/06-klinicke-aplikace/epistemicka-rekonstrukce.md) – obnova schopnosti ověřovat.
- [Supervizní rámce](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md) – ochrana klienta i terapeuta.

**Protokoly zotavení**

- [Longitudinální rekonstruktivní protokoly](@/kompendium/recovery-protocols/_index.md) – fáze zotavení a jejich protokoly.
- [Dlouhodobá kultivace resilience](@/kompendium/recovery-protocols/longterm-resilience-cultivation.md) – ochranné faktory a ukončení péče.

**Další vizualizace a rámce**

- [Vizualizace sekce 04](@/kompendium/04-terminalni-protokoly/visualizations.md) – strom odkazů terminálních protokolů.
- [Vizualizace sekce 03](@/kompendium/03-zakladni-kategorie/visualizations.md) – techniky EA-1 a jejich vazby.
- [Diagnostické nástroje](@/kompendium/08-prilohy/diagnosticke-nastroje.md) – instrumenty pro fázi posouzení.
- [Globální vizualizace](@/kompendium/visualizations/_index.md) – přehled celé taxonomie.
