+++
title = "Sebe-obrana: Detekce AI obsahu"
description = "Jak se bránit syntetickým textům, obrázkům, videím a hlasům: ověření původu, rodinné heslo, zpětné vyhledání a meze detektorů."
weight = 40

[taxonomies]
tags = ["kompendium", "self-defense-guide", "information-hygiene"]
categories = ["academic", "practical"]

[extra]
related_terms = ["4-claim-verification", "37-time-locked-evaluation", "39-information-fasting", "23-trust-calibration"]
toc = true
+++

# Sebe-obrana: Detekce AI obsahu

Generativní modely umějí vytvářet texty, obrázky, videa a hlasy, které je obtížné odlišit od skutečných. To přináší nové formy manipulace: falešné nahrávky blízkých osob žádajících o peníze, syntetické „důkazy“ o lidech, kteří nic neudělali, zástupy umělých profilů, které vytvářejí dojem většinového názoru, i dokumenty, které nikdy neexistovaly. Kniha tyto jevy popisuje jako [deepfake](@/glossary/deepfake.md) a v technikách [deepfake personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md) či [padělání dokumentů](@/kompendium/techniques/ea-9-2-9-AI-document-forgery.md). Spolehlivé rozpoznání podle vzhledu je stále těžší. Proto tento návod klade důraz méně na „oko“ a více na ověřování původu a na předem domluvená pravidla.

## Pro koho je návod

Návod je pro každého, kdo dostává hlasové zprávy, videa a obrázky od lidí, kterým důvěřuje, a zvlášť pro seniory a jejich rodiny, na něž míří podvody s napodobeným hlasem. Pomůže i lidem, proti nimž někdo může vytvořit falešný obsah – veřejně činným osobám, obětem obtěžování, účastníkům sporů –, a kteří se potřebují připravit dřív, než se to stane.

## Situace, ve kterých pomáhá

Pomáhá u telefonátů nebo hlasových zpráv, v nichž „vnuk“, „dcera“ nebo „šéf“ naléhavě žádá peníze; u videí politiků a známých osob s překvapivými výroky; u obrázků z „místa události“; u dokumentů a snímků obrazovky, které se objeví ve sporu; a u kampaní, kde mnoho podobných účtů opakuje stejný příběh ([AI news cascade](@/kompendium/techniques/ea-9-2-6-AI-news-cascade.md)).

## Varovné signály

U podvodů se syntetickým obsahem bývá nejspolehlivějším znakem situace, ne technické detaily: naléhavost, utajení a žádost o peníze v jedné zprávě, a hlas nebo obraz blízkého, který jedná nezvykle a odmítá ověření. Další signál se týká původu – obsah nemá dohledatelný zdroj a nikdo neví, kdo ho první zveřejnil. U textů je varovná plynulost bez konkrétních, ověřitelných detailů nebo s vymyšlenými citacemi.

Vizuální znaky – nepřirozené ruce, písmo, odrazy, okraje – stále mohou pomoci, ale jejich absence nic nezaručuje. Nightingale a Farid (2022) zjistili, že účastníci jejich studie nedokázali obličeje vytvořené generativním modelem spolehlivě odlišit od skutečných fotografií a že syntetické obličeje dokonce hodnotili jako o něco důvěryhodnější. Jakesch, Hancock a Naaman (2023) podobně ukázali, že intuitivní vodítka, podle nichž lidé poznávají text psaný umělou inteligencí, jsou často mylná. Spoléhat na „oko“ proto nestačí.

## Modelová situace

Matce zavolal hlas, který zněl přesně jako její syn: měl nehodu a potřebuje okamžitě peníze na kauci, „nikomu nic neříkej“. Rodina měla pro takové situace domluvené heslo. Matka se na něj zeptala; hlas se vymluvil a začal naléhat. Zavěsila a zavolala synovi na jeho číslo – byl v práci a o ničem nevěděl. Nahrávku čísla si uložila a nahlásila na policii. (Anonymizovaný kompozit.)

## Cíl dovednosti

Naučit se zacházet s texty, obrázky, videi a hlasy tak, aby vás syntetický obsah nepřiměl k jednání, které vám ublíží – především ověřováním původu, předem domluvenými pravidly a opatrností k neověřeným „důkazům“.

## Odborné východisko

Chesney a Citronová (2019) v právní analýze deepfakes upozornili na dvojí riziko. Prvním je zřejmé zneužití – podvržené nahrávky, které poškodí pověst, vylákají peníze nebo ovlivní veřejné dění. Druhým je to, co nazvali „dividendou lháře“: když lidé vědí, že nahrávky lze padělat, může kdokoli zpochybnit i pravou nahrávku jako podvrh. Pro sebe-obranu z toho plyne, že ověřování původu chrání oběma směry – před uvěřením podvrhu i před odmítnutím pravdy.

Výzkum dopadů syntetického obsahu na veřejnost naznačuje, že deepfakes nemusí lidi vždy oklamat, ale zvyšují nejistotu a snižují důvěru ve zpravodajství obecně (Vaccari a Chadwick 2020). Tento účinek je pro knihu podstatný, protože odpovídá jádru epistemické manipulace: nejde jen o to vnutit nepravdu, ale o to, aby člověk přestal věřit, že pravdu lze zjistit.

Technické detektory tuto mezeru nezaplní. Liang et al. (2023) zjistili, že běžné detektory textu generovaného umělou inteligencí chybně označovaly texty lidí, pro něž angličtina není rodným jazykem, jako strojově vytvořené výrazně častěji než texty rodilých mluvčích. Výsledek detektoru je proto nanejvýš jedním dokladem, nikdy důkazem. Trvanlivější jsou postupy, které na vzhledu obsahu nezávisejí: zpětné zavolání na známé číslo, domluvené rodinné heslo, dohledání původního zdroje a ověření v jiném kanálu.

## Pět praktických cvičení

### 1. Rodinné heslo

Domluvte se s blízkými na heslu nebo otázce, kterou zná jen rodina, a používejte ji, kdykoli někdo po telefonu nebo ve zprávě naléhavě žádá peníze nebo citlivé údaje. Je to jednoduchá a velmi účinná ochrana proti napodobeným hlasům.

### 2. Ověřit jiným kanálem

Když dostanete neobvyklou žádost od známé osoby, ověřte ji jiným kanálem: zavolejte na číslo, které znáte, napište jinou aplikací, zeptejte se společného známého. Nikdy neověřujte přes kontakt, který vám poslal podezřelou zprávu.

### 3. Hledat původ

U obrázků a videí použijte zpětné vyhledávání obrázků a zjistěte, kde a kdy se obsah poprvé objevil. Hledejte údaje o původu obsahu, pokud je platforma zobrazuje. Obsah bez původu berte jako neověřený, ne jako pravdivý ani falešný.

### 4. Konkrétní fakta

U textů ověřujte konkrétní údaje – jména, čísla, data, citace, odkazy. Generované texty mohou obsahovat vymyšlené citace a odkazy, které vypadají věrohodně, ale nevedou nikam.

### 5. Detektory s rezervou

Nástroje na rozpoznání AI obsahu používejte nanejvýš jako jeden z mnoha signálů. Žádný není spolehlivý a mohou chybovat oběma směry – označit lidský text za strojový i naopak. Rozhodnutí, která mají dopad na lidi, na jejich výsledku nestavějte.

## Jak si vést záznam

Pokud obdržíte podezřelý obsah (hlasovou zprávu, video, dokument), nemažte ho: uložte originál, číslo nebo účet odesílatele, datum a čas. Pokud se objeví falešný obsah o vás, uložte všechny výskyty (odkazy, snímky s datem) dřív, než požádáte o odstranění. Záznamy jsou podkladem pro policii, platformu i právníka ([elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md)).

## Časový rámec a indikátory pokroku

U každého důležitého obsahu pár minut na ověření, jednou měsíčně krátký trénink (například na veřejně dostupných ukázkách). Pokrok poznáte podle toho, že ověřování původu děláte automaticky, že máte s blízkými heslo a že vás naléhavá zpráva s „důkazem“ spíš upozorní, než vystraší.

## Kdy a koho požádat o pomoc

- Pokud jste poslali peníze na základě podvodného hovoru nebo zprávy, okamžitě kontaktujte banku a Policii ČR (158).
- Pokud o vás někdo šíří falešný obsah, včetně intimního, uložte důkazy a obraťte se na policii, linku 116 006 nebo advokáta; nahlaste obsah platformě.
- Pokud vás zkušenost s falešným obsahem psychicky zasáhla, volejte Linku první psychické pomoci 116 123; v akutním ohrožení 112 nebo 155.

## Čeho se vyvarovat

Nesdílejte podezřelý obsah „pro varování“ – šíříte ho tím dál; pokud je třeba varovat, popište ho slovy a obsah nahlaste platformě. Neobviňujte nikoho na základě výsledku detektoru, který se může mýlit oběma směry (Liang et al. 2023).

Nezveřejňujte zbytečně nahrávky svého hlasu a videa, pokud jste v situaci, kdy vás někdo může chtít napodobit. A pokud se stanete obětí syntetického obsahu, nejprve ho zdokumentujte a obraťte se na policii nebo advokáta, než začnete jednat veřejně.

## Meze svépomoci

Detekce AI obsahu je závod ve zbrojení: co funguje dnes, nemusí fungovat zítra, a znaky, které dnes prozrazují syntetický obraz, mohou brzy zmizet. Proto jsou trvanlivější postupy ověřování původu a domluvená pravidla než vizuální odhad. U sofistikovaných padělků je potřeba odborné forenzní posouzení.

## Literatura

- Chesney, R., & Citron, D. (2019). Deep fakes: A looming challenge for privacy, democracy, and national security. *California Law Review*, 107(6), 1753–1820.
- Jakesch, M., Hancock, J. T., & Naaman, M. (2023). Human heuristics for AI-generated language are flawed. *Proceedings of the National Academy of Sciences*, 120(11), e2208839120.
- Liang, W., Yuksekgonul, M., Mao, Y., Wu, E., & Zou, J. (2023). GPT detectors are biased against non-native English writers. *Patterns*, 4(7), 100779.
- Nightingale, S. J., & Farid, H. (2022). AI-synthesized faces are indistinguishable from real faces and more trustworthy. *Proceedings of the National Academy of Sciences*, 119(8), e2120481119.
- Vaccari, C., & Chadwick, A. (2020). Deepfakes and disinformation: Exploring the impact of synthetic political video on deception, uncertainty, and trust in news. *Social Media + Society*, 6(1).

## Související

**Návody**

- [Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) – obecné ověřování.
- [Časově odložené hodnocení](@/kompendium/self-defense-guides/37-time-locked-evaluation.md) – naléhavost jako signál.
- [Kalibrace důvěry](@/kompendium/self-defense-guides/23-trust-calibration.md) – důvěra a ověření identity.

**Techniky a pojmy**

- [Deepfake](@/glossary/deepfake.md) – syntetická média.
- [EA-9.2.8 AI Eyewitness Fabrication](@/kompendium/techniques/ea-9-2-8-AI-eyewitness-fabrication.md) – vymyšlení „očití svědci“.
- [EA-9.4.4 AI Bot Personhood](@/kompendium/techniques/ea-9-4-4-AI-bot-personhood.md) – umělé profily, které se tváří jako lidé.

**Výuka a teorie**

- [Vzdělávací scénář: Detekce deepfake](@/kompendium/educational-scenarios/16-deepfake-detection.md) – cvičný případ.
- [EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) – teoretický rámec.
