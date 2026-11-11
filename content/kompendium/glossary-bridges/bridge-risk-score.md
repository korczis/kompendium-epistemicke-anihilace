+++
title = "Bridge: Risk score (rizikové skóre)"
description = "Most mezi heslem rizikového skóre a knihou: číslo s mírou jistoty a řetězcem důkazů, statistické a klinické posuzování a proč skóre samo nemá rozhodovat o člověku."
weight = 1

[taxonomies]
tags = ["kompendium", "glossary-bridge", "risk-score", "cross-link"]
categories = ["academic", "reference"]

[extra]
category = "kompendium-bridge"
related_terms = ["risk-score", "decision-engine", "signal-plurality", "individual-risk-map", "bridge-threshold", "bridge-qdp"]
glossary_target = "risk-score"
toc = false
+++

# Bridge: Risk score (rizikové skóre)

> **Most** vede od hesla glosáře k místům knihy, kde se pojem používá, a od nich k praxi:
> rozpoznání, obraně a zotavení. Přehled všech mostů je v rejstříku
> [Glossary Bridges](@/kompendium/glossary-bridges/_index.md).

## Pojem

[Rizikové skóre](@/glossary/risk-score.md) je na platformě Prismatic, z níž kniha vzešla, číselná
hodnota, která kvantifikuje bezpečnostní riziko konkrétního aktiva, zjištění nebo zranitelnosti –
otevřeného portu, chybně nastavené služby, prošlého certifikátu. Heslo glosáře zdůrazňuje dvě vlastnosti:
každé skóre nese **míru důvěry**, která vyjadřuje, jak jisté je posouzení, a **řetězec důkazů**, který ho
spojuje s konkrétními pozorovatelnými daty. Skóre jednotlivých položek se pak skládají do souhrnného
hodnocení organizace.

Heslo glosáře přesně vymezuje vztah ke knize: rizikové skóre je pojmem bezpečnosti infrastruktury, ne
hodnocení lidí. Kniha z něj přebírá jediný princip – **číslo bez míry jistoty a bez dohledatelných důkazů
nemá rozhodovat o člověku** – a uplatňuje ho na screeningové nástroje a na posuzování rizika v klinické a
forenzní praxi.

## Pojem v jeho vlastním oboru

V bezpečnosti informačních systémů slouží skóre k určení priorit: kterou zranitelnost opravit dřív.
Jeho hodnota závisí na tom, zda je kalibrované – zda skóre 0,8 skutečně odpovídá vyššímu riziku než 0,4 –
a zda je jasné, z čeho vzniklo. Na platformě se skóre opírá o princip [Signal Plurality](@/glossary/signal-plurality.md)
a rozhodování o něm probíhá v [Decision Engine](@/glossary/decision-engine.md), jehož kalibraci popisuje
stránka [Decision Engine a kalibrace](@/kompendium/aiad-integration/decision-engine-ea-calibration.md).
Souvislost s knihou rozvádí kapitola [2.7 Vztah ke Decision Engine a Color Teams](@/kompendium/02-uvod/_index.md).

## Analogie, kterou kniha činí

Posuzování rizika u lidí má dlouhou a poučnou historii. Meehl (1954) ukázal, že jednoduché statistické
předpovědi bývají přesnější než klinický úsudek, a pozdější metaanalýza tento závěr potvrdila na stovkách
studií (Grove a Meehl 1996; Dawes, Faust a Meehl 1989). Zároveň se ukázalo, že i dobré statistické
nástroje mají meze: předpovídají riziko pro skupiny lidí s podobnými znaky, ne jistotu pro jednotlivce.
MacArthurova studie násilí po propuštění z psychiatrické hospitalizace vyústila v doporučení kombinovat
více rizikových modelů a výsledek vyjadřovat jako pravděpodobnostní pásmo, nikoli jako verdikt (Monahan a
kol. 2001).

Kniha z toho vyvozuje dvě zásady, které odpovídají vlastnostem rizikového skóre platformy. Za prvé, skóre
musí nést **míru jistoty**: výsledek dotazníku o manipulaci není „pozitivní“ či „negativní“, ale je
pravděpodobnostním údajem s chybou. Za druhé, skóre musí mít **řetězec důkazů**: musí být zřejmé, z jakých
pozorování vzniklo, aby je mohl kdokoli přezkoumat. Kahneman, Sibony a Sunstein (2021) navíc ukázali, že
lidské úsudky trpí nejen zkreslením, ale i *šumem* – nesystematickým rozptylem mezi posuzovateli –, a
strukturované postupy jsou proto cenné právě tím, že šum snižují.

## Kde se pojem v knize vyskytuje

V klinické části kniha pracuje se skóry v kapitolách [6.1 Diagnostické indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md)
a u [EA-6.1.1 Strukturovaného screeningového rozhovoru](@/kompendium/techniques/ea-6-1-1-screening-strukturalni-rozhovor.md).
Hodnocení důvěryhodnosti v řízení rozebírá [Posuzování věrohodnosti](@/kompendium/forensic-legal/2-credibility-assessment.md);
kalibraci úsudku popisuje detekční stránka [Epistemická kalibrace](@/kompendium/detection-signatures/epistemicka-kalibrace.md).
Platformní souvislosti nabízí [Perimeter a útočná plocha](@/kompendium/aiad-integration/perimeter-ea-attack-surface.md).
Na skóre navazuje rozhodnutí podle prahu, které rozebírá [Bridge: Práh (threshold)](@/kompendium/glossary-bridges/bridge-threshold.md).

## Od pojmu k praxi

### Rozpoznání zneužitého skóre

Varovným znakem je skóre, které se prezentuje jako jistota („test prokázal“), jehož konstrukci nikdo
nevysvětlí a které rozhoduje samo, bez dalšího posouzení. V manipulativních prostředích se „hodnocení“
může stát nástrojem kontroly: skupina měří duchovní pokrok, oddanost nebo „energii“ člověka a výsledek
používá k tomu, aby ho udržela v pocitu nedostatečnosti. Obecným znakem je, že posuzovaný nemá přístup
ke kritériím ani možnost se proti výsledku ohradit.

### Odlišení

Strukturované posuzování rizika není samo o sobě odlidštěním. Naopak – nástroje jako hodnocení
nebezpečí v partnerském násilí pomáhají rozpoznat situace s vysokým rizikem, které by intuice přehlédla;
Campbellová, Websterová a Glassová (2009) popsaly validaci takového nástroje pro předpověď
nejzávažnějších forem násilí. Rozdíl je v tom, zda skóre slouží ochraně posuzovaného a je kombinováno
s odborným úsudkem, nebo zda o něm rozhoduje bez možnosti přezkumu.

### Obrana

Pro profesionála je obranou proti chybnému použití skóre několik otázek: Jaká je základní četnost jevu
v této populaci? Jak vysoká je chyba nástroje? Z jakých pozorování skóre vzniklo a dají se ověřit?
Kahneman a Tversky (1973) ukázali, že lidé při úsudku soustavně přehlížejí základní četnosti; u vzácných
jevů proto i přesný test vede k mnoha falešně pozitivním výsledkům. Gigerenzer (2002) navrhl vyjadřovat
rizika v přirozených četnostech („z tisíce lidí s tímto výsledkem…“), které jsou srozumitelnější než
procenta a podmíněné pravděpodobnosti.

### Rámec pro profesionály a posuzovaného

Pro posuzovaného je důležité vědět, že má právo znát, na čem hodnocení stojí, a vyjádřit se k němu.
Kniha proto doporučuje, aby klinik výsledek screeningu s klientem probral jako hypotézu, ne jako
diagnózu, a aby v dokumentaci uváděl míru jistoty a zdroje, z nichž vychází. Ve forenzním kontextu platí
totéž ještě přísněji: znalec má popsat, co skóre znamená a co neznamená; viz
[Znalec EA](@/kompendium/forensic-legal/21-expert-witness-EA.md).

## Časté omyly

Prvním omylem je číst skóre jako pravděpodobnost pro konkrétního člověka; statistické nástroje
předpovídají pro skupiny. Druhým omylem je opačný extrém – odmítat strukturované hodnocení ve prospěch
„klinické intuice“; výzkum ukazuje, že intuice bývá méně přesná a více zatížená šumem. Třetím omylem je
myslet si, že skóre bez uvedené míry jistoty je „jednodušší“; ve skutečnosti je zavádějící, protože
zamlčuje to nejdůležitější.

## Příklad (anonymizovaný kompozit)

Sociální pracovnice použije screeningový dotazník u ženy, která popisuje kontrolující vztah. Výsledek
vychází „nízké riziko“. Pracovnice se na něj nespolehne sama, protože žena během rozhovoru zmínila
výhrůžky, na něž se dotazník neptá, a protože ví, že lidé pod tlakem mohou svou situaci podhodnocovat.
Doplní rozhovor o strukturované otázky na nebezpečí a konzultuje případ s kolegyní. Společně dospějí
k závěru, že riziko je vyšší, než naznačoval dotazník, a sestaví bezpečnostní plán. V dokumentaci uvedou
skóre i důvody, proč se od něj odchýlily.

## Meze a otevřené otázky

Většina nástrojů pro posuzování rizika vznikla pro jiné jevy – násilí, recidivu, sebevražedné jednání –
a pro epistemickou manipulaci validované skóre neexistuje. Kniha proto skóre doporučuje jen jako pomůcku
a vždy spolu s odborným úsudkem. Otevřenou otázkou je, jak vytvořit nástroj, který by zachytil vzorec
manipulace bez rizika, že se stane nálepkou, a jak zabránit tomu, aby se jeho výsledky používaly mimo
účel, pro který vznikl.

## Literatura

- Campbell, J. C., Webster, D. W., & Glass, N. (2009). The Danger Assessment: Validation of a lethality risk assessment instrument for intimate partner femicide. *Journal of Interpersonal Violence*, 24(4), 653–674.
- Dawes, R. M., Faust, D., & Meehl, P. E. (1989). Clinical versus actuarial judgment. *Science*, 243(4899), 1668–1674.
- Gigerenzer, G. (2002). *Calculated Risks: How to Know When Numbers Deceive You*. Simon & Schuster.
- Grove, W. M., & Meehl, P. E. (1996). Comparative efficiency of informal (subjective, impressionistic) and formal (mechanical, algorithmic) prediction procedures: The clinical–statistical controversy. *Psychology, Public Policy, and Law*, 2(2), 293–323.
- Kahneman, D., Sibony, O., & Sunstein, C. R. (2021). *Noise: A Flaw in Human Judgment*. Little, Brown Spark.
- Kahneman, D., & Tversky, A. (1973). On the psychology of prediction. *Psychological Review*, 80(4), 237–251.
- Meehl, P. E. (1954). *Clinical versus Statistical Prediction: A Theoretical Analysis and a Review of the Evidence*. University of Minnesota Press.
- Monahan, J., Steadman, H. J., Silver, E., et al. (2001). *Rethinking Risk Assessment: The MacArthur Study of Mental Disorder and Violence*. Oxford University Press.

## Související

**Glosář**

- [Risk Score](@/glossary/risk-score.md) – heslo, které tento most propojuje s knihou.
- [Decision Engine](@/glossary/decision-engine.md) – kde se skóre převádí na rozhodnutí.
- [Signal Plurality](@/glossary/signal-plurality.md) – skóre z více nezávislých signálů.

**Kniha**

- [2.7 Vztah ke Decision Engine a Color Teams](@/kompendium/02-uvod/_index.md) – souvislost s knihou.
- [6.1 Diagnostické indikátory](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – kombinace znaků místo jediného čísla.
- [Epistemická kalibrace](@/kompendium/detection-signatures/epistemicka-kalibrace.md) – kalibrace úsudku.
- [Posuzování věrohodnosti](@/kompendium/forensic-legal/2-credibility-assessment.md) – skóre v řízení.

**Sesterské mosty**

- [Bridge: Práh (threshold)](@/kompendium/glossary-bridges/bridge-threshold.md) – rozhodnutí podle skóre.
- [Bridge: QDP](@/kompendium/glossary-bridges/bridge-qdp.md) – meze jednoho čísla.
- [Bridge: HAWKEYE](@/kompendium/glossary-bridges/bridge-hawkeye.md) – více signálů a odstupňovaná reakce.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Risk score (rizikové skóre)](@/glossary/risk-score.md) – heslo glosáře, které tento most propojuje s knihou

<!-- kompendium:odvozene-vazby:end -->
