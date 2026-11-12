+++
title = "Due diligence: kalibrace rozhodovacích systémů"
description = "Skóre rizika a automatizovaná doporučení: kalibrace, šum v lidském úsudku, automation bias a averze k algoritmům, zpětná kontrola a právo na lidské posouzení."
weight = 110

[taxonomies]
tags = ["kompendium", "cross-domain", "due-diligence"]
categories = ["academic"]

[extra]
related_terms = ["10-ea-dd-source-weighting", "4-ea-osint-sanctions-list-bias", "6-ea-osint-bot-detection", "15-ea-dd-evidence-quality-assessment"]
toc = true
+++

Prověrky protistran, screening klientů i hodnocení rizik se stále častěji opírají
o rozhodovací systémy – modely, které z dat vypočítají skóre rizika a doporučí postup.
Tato stránka se nezabývá konkrétní implementací takového systému, ale obecnou otázkou: kdy lze číslu
z rozhodovacího systému věřit, jak to ověřit a jak zabránit tomu, aby se z pomůcky stala
autorita, které se nikdo neodváží odporovat.

## Doména a problém

**Kalibrace** znamená, že předpovězené pravděpodobnosti odpovídají skutečným četnostem:
z případů, kterým systém přiřadí riziko 20 %, by se mělo problémem ukázat zhruba 20 %.
Brier (1950) navrhl míru přesnosti pravděpodobnostních předpovědí, která se dodnes používá;
Tetlock a Gardner (2015) ukázali, že kalibraci lze měřit a zlepšovat i u lidských odhadů.
Systém, který je dobře kalibrovaný v průměru, může být špatně kalibrovaný pro určité
skupiny – pak jeho skóre znamenají pro různé lidi různé věci.

Kahneman, Sibony a Sunstein (2021) upozornili, že vedle zkreslení (systematické odchylky)
trpí lidský úsudek i **šumem** – nežádoucí variabilitou, kdy různí posuzovatelé nebo
tentýž posuzovatel v různé dny hodnotí stejný případ různě. Rozhodovací systémy šum
snižují, protože stejné vstupy dávají stejný výstup. Mohou ale stabilizovat zkreslení,
pokud se naučily z dat, která zkreslení obsahují.

Třetím problémem je vztah člověka a systému. Parasuraman a Manzey (2010) popsali **automation
bias** – sklon přijímat doporučení automatizovaného systému bez dostatečné kontroly a
přehlížet informace, které mu odporují. Dietvorst, Simmons a Massey (2015) naopak doložili
**averzi k algoritmům**: lidé ztrácejí důvěru v algoritmus rychleji než v člověka poté,
co ho vidí udělat chybu, i když je v průměru přesnější. Obě tendence zhoršují rozhodování.

## Průnik s epistemickou anihilací

Kniha popisuje, jak se u jednotlivce postupně přesouvá epistemická autorita z vlastního
úsudku na vnější zdroj, až člověk přestane svému vnímání věřit. U organizací může
rozhodovací systém hrát podobnou roli: zpočátku je pomůckou, postupně se stává rozhodčím,
a nakonec ho nikdo nedokáže zpochybnit, protože nikdo nerozumí, jak k číslu došel. Tento
posun je obdobou [hermeneutického outsourcingu](@/glossary/hermeneuticky-outsourcing.md):
výklad reality je delegován na instanci, kterou nelze vyslýchat.

Rozhodovací systém je také cílem manipulace. Kdo zná vstupy, může je upravit – vytvořit
„čistou“ historii, rozdělit transakce pod prahy, dodat dokumenty, které systém hodnotí
příznivě. To je technická obdoba toho, co kniha popisuje jako [přepis hodnoticích kritérií](@/kompendium/techniques/ea-2-4-5-evaluation-criteria-rewrite.md):
místo přesvědčování hodnotitele se mění to, co hodnotitel měří.

## Rozpoznávací znaky

Problém s kalibrací nebo s užíváním systému naznačuje, když **nikdo neví, jak dobře systém
předpovídá** (chybí zpětné vyhodnocení); když se **skóre používá jako verdikt** bez lidského
posouzení; když **analytici systému téměř nikdy neodporují** (míra přepsání doporučení se
blíží nule) nebo naopak **neustále** (systém je ignorován); když se **rozložení chyb liší**
mezi skupinami klientů; když **skóre nelze vysvětlit** dotčené osobě; a když se **chování
klientů přizpůsobuje prahům** (např. hromadění transakcí těsně pod limitem).

## Rámec: právo, standardy a odpovědnost

Článek 22 GDPR dává subjektu údajů právo nebýt předmětem rozhodnutí založeného výhradně
na automatizovaném zpracování, které má pro něj právní nebo obdobně významné účinky,
s výjimkami a se zárukami včetně práva na lidský zásah a na vyjádření vlastního stanoviska.
Nařízení (EU) 2024/1689 o umělé inteligenci zařazuje některé systémy, například pro
hodnocení úvěruschopnosti fyzických osob, mezi vysoce rizikové a ukládá jim povinnosti
v oblasti řízení rizik, kvality dat, transparentnosti a lidského dohledu.

## Ochranná opatření

Prvním opatřením je **pravidelné vyhodnocení kalibrace** na skutečných výsledcích,
celkově i pro podskupiny. Druhým je lidské posouzení u rozhodnutí s významným dopadem,
s pravidlem, že posuzovatel musí uvést vlastní důvody, nikoli jen potvrdit skóre. Třetím
je **sledování míry přepsání**: příliš nízká míra signalizuje automation bias, příliš
vysoká nedůvěru nebo špatný model. Čtvrtým je **vysvětlitelnost** – schopnost říct
dotčené osobě, které faktory rozhodly. Pátým je **red teaming systému** – záměrné hledání
způsobů, jak by šlo systém obejít nebo zmást.
Šestým je **audit dat**, z nichž se systém učí, na přítomnost historických zkreslení.

## Lidský rozměr a zotavení

Pro dotčené osoby je zkušenost s rozhodnutím, které nikdo neumí vysvětlit, zvlášť
zatěžující: nevědí, co změnit, a nemají komu odporovat. Pro analytiky je rozhodovací systém
zdrojem úlevy (odpovědnost je sdílená) i odcizení (vlastní úsudek ztrácí význam).
Organizace, které chtějí zachovat profesní úsudek, by měly analytiky vést k tomu, aby
systém chápali jako jeden ze zdrojů, ne jako nadřízeného – a oceňovat odůvodněný nesouhlas.
Kniha tuto rovnováhu rozvádí na stránce [epistemická pokora](@/glossary/epistemicka-pokora.md).

## Přesah do dalších oborů

Kalibrace a vztah člověka k automatizovanému doporučení jsou klíčové v medicíně (systémy
podpory klinického rozhodování, skóre rizika), v soudnictví (nástroje pro hodnocení rizika
recidivy), ve školství (systémy včasného varování před neúspěchem studenta) i v sociálních
službách. Ve všech těchto oblastech se opakuje stejné poučení: systém může být v průměru
přesnější než člověk, a přesto selhávat pro určité skupiny; lidé mohou systému věřit
příliš i příliš málo; a dotčený člověk má mít možnost se dozvědět, proč bylo rozhodnuto
tak, jak bylo. Kahneman, Sibony a Sunstein (2021) doporučují v takových prostředích
„hygienu rozhodování“ – strukturovaný úsudek, nezávislá hodnocení a jejich pozdější
sloučení –, která je užitečná s algoritmem i bez něj.

## Ilustrativní scénář

*Hypotetický, anonymizovaný scénář.* Platební instituce používá model, který přiřazuje
klientům skóre rizika podvodu. Roční vyhodnocení ukáže, že model je dobře kalibrovaný
celkově, ale u klientů, kteří nedávno přišli z jiné země, předpovídá riziko výrazně vyšší,
než odpovídá skutečnosti. Analytici přitom doporučení systému přepisovali jen výjimečně.
Instituce model přeučí s ohledem na tuto skupinu, zavede povinné lidské posouzení pro
odmítnutí klienta a začne sledovat míru přepsání a kalibraci po skupinách čtvrtletně.

Nové klienty, kteří byli v minulém roce odmítnuti, instituce kontaktuje s nabídkou nového
posouzení. Část z nich se vrátí; jiní už mezitím našli jinou instituci. Vedení si z případu
odnese poučení, že náklady chybné kalibrace nesla skupina lidí, kteří o svém hodnocení
nevěděli a nemohli se mu bránit.

## Meze a otevřené otázky

Kalibraci lze měřit jen tam, kde se výsledek dozvíme; u odmítnutých klientů nevíme, jak
by se zachovali, takže systém se může „potvrzovat“ sám. Lakkaraju a kol. (2017) tuto
překážku pojmenovali jako problém selektivních značek: hodnotí-li se model na datech, která
sama vznikla rozhodováním podle téhož nebo podobného pravidla, chybějí výsledky u případů,
které byly odmítnuty, a zkresleno je i srovnání systému s lidským posuzovatelem.

Druhé omezení je výkladové. Dobře kalibrované skóre je tvrzením o souboru případů, ne
o jednom klientovi. Z toho, že se u případů s určitým skóre ukáže problém v odpovídajícím
podílu, o konkrétním člověku nevyplývá nic víc než to, že patří do skupiny, v níž se to
stává; skóre proto nenahrazuje důvod rozhodnutí a nestává se jím ani tehdy, je-li kalibrace
bezchybná. Otevřenou otázkou zůstává, jak mezeru v datech zmenšit a jak udržet profesní
úsudek analytiků v prostředí, kde systémy rozhodují stále víc.

## Literatura

- Brier, G. W. (1950). Verification of forecasts expressed in terms of probability.
- Dietvorst, B. J., Simmons, J. P., Massey, C. (2015). Algorithm aversion: People erroneously avoid algorithms after seeing them err.
- Kahneman, D., Sibony, O., Sunstein, C. R. (2021). *Noise: A Flaw in Human Judgment.*
- Lakkaraju, H., Kleinberg, J., Leskovec, J., Ludwig, J., Mullainathan, S. (2017). The selective labels problem: Evaluating algorithmic predictions in the presence of unobservables. In *Proceedings of KDD 2017*.
- Parasuraman, R., Manzey, D. H. (2010). Complacency and bias in human use of automation.
- Tetlock, P. E., Gardner, D. (2015). *Superforecasting: The Art and Science of Prediction.*
- Nařízení (EU) 2016/679 (GDPR), čl. 22; nařízení (EU) 2024/1689 o umělé inteligenci.

## Související

**Mezioborové mosty**

- [Vážení zdrojů](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) – vstupy rozhodovacího systému.
- [Sankční seznamy a falešné shody](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) – automatizovaný screening.
- [Detekce botů](@/kompendium/cross-domain/6-ea-osint-bot-detection.md) – skóre jako hypotéza.

**Pojmy**

- [Risk score](@/glossary/risk-score.md) – skóre rizika.
- [Hermeneutický outsourcing](@/glossary/hermeneuticky-outsourcing.md) – delegování výkladu.
- [Epistemická pokora](@/glossary/epistemicka-pokora.md) – vědomí mezí vlastního i strojového úsudku.
