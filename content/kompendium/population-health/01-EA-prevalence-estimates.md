+++
title = "Odhady prevalence epistemického útoku"
description = "Jak odhadovat, kolik lidí v populaci prožívá epistemické útoky a jejich následky, co z odhadů plyne a proč dnes žádné spolehlivé číslo neexistuje."
weight = 10

[taxonomies]
tags = ["kompendium", "population-health", "epidemiology"]
categories = ["academic", "public-health"]

[extra]
related_terms = ["02-cohort-studies-EA", "03-incidence-cult-exposure", "04-disinformation-population-impact"]
toc = true
+++

# Odhady prevalence epistemického útoku

> Prevalence odpovídá na otázku „kolik lidí je v daném okamžiku postiženo“. U epistemických útoků
> je to otázka metodologicky těžká: chybí ustálená případová definice, validovaný nástroj
> i registr. Stránka popisuje, jak by poctivý odhad vypadal a co z něj smí a nesmí plynout.

## Vymezení

Kompendium rozlišuje dvě roviny, které epidemiologie musí držet odděleně. **Expozice** je
epistemický útok – opakované působení některé z technik taxonomie (kódy `EA-X.Y.Z`, viz
[taxonomie EA](@/glossary/taxonomie-ea.md)), například
[selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md),
[gaslighting](@/glossary/gaslighting.md) nebo [coercive control](@/glossary/coercive-control.md).
**Výsledkem** (outcome) je měřitelné poškození schopnosti poznávat: oslabené
[testování reality](@/glossary/reality-testing.md),
[metakognitivní deficit](@/glossary/metakognitivni-deficit.md), v krajní podobě stav, který
kompendium nazývá [epistemická anihilace](@/glossary/epistemicka-anihilace.md). Rozdíl mezi
tím, kolik lidí je vzorci vystaveno, a tím, kolik rozvine poškození, je v epidemiologii běžný:
Rose (1992) připomíná, že expozice rizikovému faktoru a výskyt onemocnění jsou dvě různá
rozdělení a že populační uvažování o nich začíná právě jejich oddělením.

Prevalence expozice a prevalence poškození jsou proto různá čísla. Mnoho lidí projde
manipulativním vzorcem bez trvalých následků; menší skupina rozvine poškození, které vyžaduje
péči. Právě touto logikou dávky a reakce argumentuje Bradford Hill (1965), když mezi kritérii
příčinného výkladu zdůrazňuje gradient a sílu asociace – odhad, který obě roviny slévá, tento
gradient znemožní změřit a je nepoužitelný pro plánování služeb i pro výzkum.

Žádná z mezinárodních klasifikací nezná „epistemický útok“ jako diagnostickou kategorii:
ani MKN-11 (WHO 2019), ani DSM-5-TR (APA 2022) takovou jednotku neobsahují. Existují blízké
a dobře popsané konstrukty – komplexní posttraumatická porucha, partnerské násilí s prvky
kontroly ve smyslu, jak je popisuje Stark (2007), a zkušenost s
[high-control group](@/glossary/high-control-group.md) ve smyslu Liftona (1961) – a o ty se
odhad musí opírat. Každé číslo „prevalence EA“ je proto odhadem *konstruktu* a musí uvádět,
z jakých zástupných (proxy) ukazatelů vzniklo.

## Případová definice

Bez případové definice nelze počítat; Last (2001) ji ve slovníku epidemiologie řadí mezi první
podmínky každého měření výskytu. Pro populační účely se hodí třístupňová definice, obdobná té,
kterou používá surveillance infekčních nemocí:

| Úroveň | Kritérium | Typický zdroj |
|---|---|---|
| Možný případ | Sebehodnocení opakované zkušenosti s manipulativním vzorcem (izolace, zpochybňování vnímání, kontrola informací) | dotazníkové šetření |
| Pravděpodobný případ | Navíc subjektivní poškození: nejistota ve vlastním úsudku, ztráta důvěry ve vnímání, funkční dopad | screeningový nástroj, viz [screening](@/kompendium/population-health/11-population-screening-EA.md) |
| Potvrzený případ | Klinické posouzení podle [diagnostických indikátorů](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) s vyloučením alternativ | klinická dokumentace |

Každá úroveň dává jiný odhad a jiný druh chyby. Rothman, Greenland a Lash (2008) tento
kompromis popisují jako volbu mezi citlivostí a specificitou definice: široká definice
nadhodnocuje (zahrnuje běžné konflikty, neshody a ideologické spory), úzká definice
podhodnocuje (zachytí jen ty, kdo došli do péče). Seriózní zpráva proto uvádí všechny tři
úrovně vedle sebe a k odhadu připojuje definici, z níž vznikl.

## Zdroje dat a metody měření

Nejběžnějším zdrojem jsou **průřezová populační šetření** s pravděpodobnostním výběrem, jejichž
logiku popisuje Kish (1965): umožňují bodovou prevalenci, ale závisejí na self-reportu. Lidé
uprostřed manipulativního vztahu svou situaci často nerozpoznají – samo poškození úsudku
snižuje citlivost dotazu, což je důvod, proč Fricker (2007) upozorňuje, že věrohodnost
vlastního svědectví bývá u postižených systémově snížena. **Klinická a administrativní data**
(ambulance, krizová centra, linky pomoci) zachycují jen vrchol ledovce a jsou zkreslená
dostupností služeb; k tomu, jak málo o populaci vypovídají, viz
[populační dopad linek pomoci](@/kompendium/population-health/20-helpline-population-impact.md).

Časový rozměr přidávají **kohortové studie**, které podle Rothmana, Greenlanda a Lashe (2008)
opakovaně měří tytéž lidi a odliší přechodné stavy od trvalých; jejich návrhu se věnují
[kohortové studie](@/kompendium/population-health/02-cohort-studies-EA.md) a
[longitudinální design](@/kompendium/research-methodology/longitudinal-study-EA.md).
**Kolaterální informace** od blízkých
([collateral interview](@/kompendium/06-klinicke-aplikace/collateral-interview-protokol.md))
zvyšují citlivost tam, kde postižený sám nevidí, ale přinášejí vlastní zkreslení, jak ukazuje
Herman (1992) na roli okolí při rozpoznání traumatu. Pro skupiny, které v běžném výběrovém rámci
nejsou vidět – bývalé členy uzavřených skupin nebo lidi v izolaci – nabízí Heckathorn (1997)
**metody pro skryté populace** (respondent-driven sampling, capture–recapture).

Návrh dotazníku má vlastní úskalí, popsaná v článku o
[survey designu](@/kompendium/research-methodology/survey-design-EA.md): Tourangeau, Rips
a Rasinski (2000) doložili, že sugestivní formulace, pořadí otázek a terminologie („manipulace“,
„sekta“) mění odpovědi víc než skutečný výskyt. Odhad, který tuto citlivost na znění ignoruje,
měří formulaci, nikoli jev.

## Rizikové a protektivní faktory

Faktory jsou rizikové pro *expozici* nebo pro *přechod od expozice k poškození*; nejde
o vlastnosti „slabých“ lidí a většina z nich je situační. Rizikově působí životní přechody
a krize (ztráta práce, rozvod, migrace, úmrtí blízkého, nástup na studia), v nichž podle Liftona
(1961) klesá odolnost vůči totalizujícímu prostředí, dále
[sociální izolace](@/glossary/socialni-izolace.md) a ztráta nezávislých zdrojů informací,
ekonomická či pobytová závislost na osobě nebo instituci a předchozí trauma, zejména zrada
blízkými ([betrayal trauma](@/glossary/betrayal-trauma.md)), jejíž dopad na důvěru popsala
Freydová (1996). Strukturálně zvyšuje riziko vysoká koncentrace autority v uzavřeném prostředí
bez kontrolních mechanismů, kterou Stark (2007) popisuje jako jádro kontrolních vztahů.

Protektivně naopak působí [více nezávislých zdrojů](@/glossary/intelligence-fusion.md) – lidé,
kteří vidí situaci zvenku – a stabilní zázemí, které Herman (1992) klade do středu odolnosti
i zotavení: [bezpečná vazba](@/glossary/secure-attachment.md), soudržná
[narativní identita](@/glossary/narativni-identita.md),
[metakognice](@/glossary/metakognice.md) a
[epistemická pokora](@/glossary/epistemicka-pokora.md). Na populační úrovni k nim Rose (1992)
přidává dostupnost nezávislé pomoci a institucionální pojistky – oddělení rolí, stížnostní
kanály, supervizi – tedy ochranu, která nespoléhá na sílu jednotlivce, ale na uspořádání
prostředí.

## Interpretace a typické chyby

Nejčastější chybou populárních textů je **záměna expozice a poškození**, před níž varuje už
Roseovo (1992) oddělení rizikového faktoru a nemoci. S ní souvisí **ekologický klam**: vyšší
prevalence v určitém prostředí neznamená, že je ohrožen každý jeho člen, ani že prostředí jako
celek je manipulativní – Rothman, Greenland a Lash (2008) jej řadí mezi klasická úskalí
populačního srovnávání. Dále hrozí **artefakt povědomí**, kdy kampaně a mediální pozornost
zvyšují ochotu situaci pojmenovat, takže nárůst hlášení může znamenat lepší rozpoznání, ne vyšší
výskyt; souvislost rozebírají
[kampaně veřejné informovanosti](@/kompendium/population-health/18-public-awareness-campaign.md).

Zvláštní riziko představuje **kruhové uvažování**. Obsahuje-li definice případu kritérium
„neuznává, že je manipulován“, stává se nevyvratitelnou – logickou past rozebírá
[kruhové uvažování v EA detekci](@/kompendium/critical-perspectives/4-circular-reasoning-risk.md).
Konečně hrozí **medikalizace sporu**: názorový či hodnotový konflikt není epistemický útok
a číslo, které tuto hranici nedrží, slouží spíš jako rétorická zbraň, jak varuje Fricker (2007)
v souvislosti s tím, komu se upírá postavení poznávajícího; téhož se týká
[patologizace normálních variací](@/kompendium/critical-perspectives/2-pathologization-critique.md).

## Důsledky pro prevenci a zdravotní systém

Prevalenční odhad je užitečný jen tehdy, když vede k rozhodnutí. Slouží především k **plánování
kapacit** – kolik specializovaných míst je potřeba pro potvrzené případy a kolik nízkoprahových
služeb pro pravděpodobné případy – a k **volbě strategie prevence**. Podle Geoffreyho Rose
(1992) přináší malý posun celé populace často víc než péče o vysoce rizikové jedince („paradox
prevence“); pro EA to znamená univerzální programy, jako je
[mediální gramotnost](@/kompendium/population-health/15-media-literacy-program.md), vedle
cíleného [outreache](@/kompendium/population-health/17-vulnerable-population-outreach.md).

Třetím použitím je **hledání nerovností**. Link a Phelan (1995) ukázali, že rozdíly ve výskytu
mezi sociálními skupinami odrážejí „fundamentální příčiny“ – nerovný přístup k ochranným
zdrojům – nikoli vrozenou „náchylnost“. Pro EA z toho plyne, že rozdíly mezi skupinami (věk,
region, socioekonomický status) ukazují, kde chybějí ochranné struktury, a ne kdo je slabší.

## Modelová situace

Krajský úřad zvažuje zřídit specializovanou poradnu pro lidi po odchodu z manipulativních
skupin. K dispozici má jen počet telefonátů na krizovou linku s touto tematikou a anekdotické
zprávy terapeutů. Poctivá analýza v duchu Rose (1992) nejprve oddělí, co telefonáty měří
(dostupnost linky a ochotu volat), doplní je o krátké šetření mezi praktickými lékaři
a psychology a výslednou potřebu uvede jako rozpětí s explicitními předpoklady. Rozhodnutí se
pak neopírá o „přesné“ číslo, ale o citlivostní analýzu: vyplatí se poradna i při dolní hranici
odhadu?

## Kontrolní otázky pro praxi

Posuzovatel každého populačního odhadu by si měl v duchu kritérií, jež pro hodnocení důkazů
formulují Rothman, Greenland a Lash (2008), položit pět otázek. Měří odhad expozici, poškození,
nebo obojí – a je to v textu výslovně řečeno? Která úroveň případové definice (možný,
pravděpodobný, potvrzený případ) byla použita? Jaké proxy ukazatele odhad nahrazuje a jak dobře
odpovídají konstruktu EA? Mohl nárůst hlášení vzniknout kampaní, novou službou nebo mediální
pozorností spíše než skutečným nárůstem výskytu? A konečně – vede číslo ke konkrétnímu
rozhodnutí o službách, nebo slouží jen jako argument ve sporu?

## Limitace a otevřené otázky

Neexistuje validovaný a mezikulturně ověřený nástroj; překlad pojmů je sám zdrojem chyby, jak
pro oblast dotazníků dokládají Tourangeau, Rips a Rasinski (2000), a kulturní podmíněnost
kategorií rozebírá
[kulturní zaujatost EA kategorií](@/kompendium/critical-perspectives/10-cultural-bias-critique.md).
Poškození úsudku navíc snižuje schopnost ho hlásit – stejný problém, jaký epidemiologie podle
Rothmana, Greenlanda a Lashe (2008) zná u stavů s narušeným náhledem. Fenomén se mění
s technologiemi, a jak připomíná Zuboff (2019), odhad z doby před algoritmickými feedy nelze
přenášet do prostředí, které pozornost samo tvaruje
([EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md)). Otevřenou
otázkou zůstává, zda má smysl jedno souhrnné číslo, nebo jen profil prevalencí jednotlivých
vzorců (izolace, kontrola informací, zpochybňování vnímání).

## Literatura

- APA. *Diagnostic and Statistical Manual of Mental Disorders* (DSM-5-TR). American Psychiatric Association, 2022.
- Bradford Hill, A. „The Environment and Disease: Association or Causation?“ *Proceedings of the Royal Society of Medicine*, 1965.
- Freyd, J. J. *Betrayal Trauma: The Logic of Forgetting Childhood Abuse.* Harvard University Press, 1996.
- Fricker, M. *Epistemic Injustice: Power and the Ethics of Knowing.* Oxford University Press, 2007.
- Heckathorn, D. D. „Respondent-Driven Sampling.“ *Social Problems*, 1997.
- Herman, J. L. *Trauma and Recovery.* Basic Books, 1992.
- Kish, L. *Survey Sampling.* Wiley, 1965.
- Last, J. M. (ed.). *A Dictionary of Epidemiology.* Oxford University Press, 2001.
- Lifton, R. J. *Thought Reform and the Psychology of Totalism.* Norton, 1961.
- Link, B. G.; Phelan, J. „Social Conditions as Fundamental Causes of Disease.“ *Journal of Health and Social Behavior*, 1995.
- Rose, G. *The Strategy of Preventive Medicine.* Oxford University Press, 1992.
- Rothman, K. J.; Greenland, S.; Lash, T. L. *Modern Epidemiology.* Lippincott Williams & Wilkins, 2008.
- Stark, E. *Coercive Control: How Men Entrap Women in Personal Life.* Oxford University Press, 2007.
- Tourangeau, R.; Rips, L. J.; Rasinski, K. *The Psychology of Survey Response.* Cambridge University Press, 2000.
- WHO. *Mezinárodní klasifikace nemocí* (MKN-11). World Health Organization, 2019.
- Zuboff, S. *The Age of Surveillance Capitalism.* PublicAffairs, 2019.

## Související

**Sesterské stránky**

- [Kohortové studie](@/kompendium/population-health/02-cohort-studies-EA.md) – jak oddělit přechodnou expozici od trvalého poškození.
- [Incidence expozice kultům](@/kompendium/population-health/03-incidence-cult-exposure.md) – nové případy místo existujících.
- [Populační screening](@/kompendium/population-health/11-population-screening-EA.md) – kdy má smysl případy aktivně vyhledávat.

**Metodologie**

- [Survey design v EA výzkumu](@/kompendium/research-methodology/survey-design-EA.md) – formulace otázek a zkreslení.
- [Výzkum zranitelných populací](@/kompendium/research-methodology/vulnerable-population-research.md) – etika práce se skrytými skupinami.

**Klinika a kritika**

- [Diagnostické indikátory a markery EA](@/kompendium/06-klinicke-aplikace/diagnosticke-indikatory.md) – podklad pro potvrzený případ.
- [Riziko falešně pozitivních detekcí](@/kompendium/critical-perspectives/5-false-positive-risk.md) – proč široká definice škodí.

**Glosář**

- [Taxonomie EA](@/glossary/taxonomie-ea.md) – kódy technik, které tvoří expozici.
- [Self-report](@/glossary/self-report.md) – meze sebehodnocení.
