+++
title = "Doxing"
weight = 100
description = "Zveřejnění osobních údajů o člověku proti jeho vůli s cílem vystavit ho obtěžování, zastrašení nebo umlčení; znaky, dopady, právní rámec a obrana."

[taxonomies]
tags = ["glossary", "security", "legal", "digitalni", "kompendium"]

[extra]
category = "security"
related_terms = ["deplatforming", "osint", "panopticism", "info-ops", "chain-of-custody", "socialni-izolace"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
+++

## Definice

Doxing, psaný též *doxxing*, je shromáždění a zveřejnění osobních údajů o konkrétním člověku
proti jeho vůli: adresy bydliště, telefonu, zaměstnavatele, jmen dětí a jejich školy,
zdravotních nebo finančních informací, nebo skutečné identity za pseudonymem. Rozhodující
je účel nebo předvídatelný důsledek, totiž že dotčený bude vystaven obtěžování, zastrašování,
ztrátě práce nebo fyzickému ohrožení. Výraz pochází z obratu *dropping docs* v hackerských
subkulturách, kde znamenal zveřejnit identitu protivníka (Douglas, 2016).

David Douglas pojem analyticky rozdělil na tři podoby, které se v praxi mísí, ale mají jinou
povahu újmy: deanonymizaci, tedy spojení pseudonymu s občanskou identitou; zveřejnění údajů
umožňujících fyzické dohledání člověka; a zveřejnění informací, které mají dotčeného
zdiskreditovat (Douglas, 2016). Toto rozlišení je důležité pro posouzení, protože první
podoba může mít v určitých případech veřejný zájem na své straně, druhá téměř nikdy.

Doxing není totéž co zveřejnění informace ve veřejném zájmu. Rozhoduje účel, přiměřenost
a cílení: doxing míří na osobu, ne na čin, a zveřejněné údaje nemají vztah k veřejné debatě,
ale k možnosti člověka najít a zasáhnout (Douglas, 2016).

## Co drží ustálená literatura

Danielle Citronová popsala doxing jako součást širšího jevu kybernetického nenávistného
jednání, v němž se útoky proti jednotlivci kombinují – zveřejnění údajů, vlna výhrůžek,
kontaktování zaměstnavatele a vytvoření obsahu, který se při vyhledání jména zobrazí jako
první. Doložila také, že újma je nesouměrně vysoká u lidí, kteří jsou veřejně viditelní
a zároveň mají slabší institucionální ochranu, a že se často týká žen (Citron, 2014).

Výzkum koordinovaných online kampaní 2010. let popsal prostředí, v němž se doxing stává
běžným prostředkem: platformy, jejichž správa a kultura odměňují mobilizaci proti určené
osobě, a v nichž je obtěžování chápáno jako legitimní reakce na „nepřátele“ komunity
(Massanari, 2017). Pro posouzení konkrétního případu z toho vyplývá, že pachatelem nebývá
jediný aktér, ale rozptýlená skupina, u níž nelze určit jedno rozhodnutí.

Jev sám je starší než internet. Zveřejňování jmen a adres „nepřátel“ s výzvou k jejich
pronásledování patří k repertoáru politického nátlaku a sahá k praktikám veřejného
pranýřování; Foucault popsal, jak se tělesná veřejná exekuce proměnila v soustavný dohled,
který si vězeň nakonec provádí sám (Foucault, 1975). Historické případy mobilizace okolí
proti jednotlivci ukazuje kapitola [Kubánské akty
repudia](@/kompendium/historical-cases/9-cuban-akty-repudio.md). Digitální prostředí změnilo
hlavně rychlost a dosah, ne povahu jednání (Citron, 2014).

## Jak se projevuje

Prvním pozorovatelným znakem je samo zveřejnění údajů v diskusi, na sociální síti nebo
v uzavřené skupině, obvykle s implicitní, nikoli výslovnou výzvou k jednání; právě
implicitnost je důvod, proč se jednotlivým příspěvkům obtížně připisuje odpovědnost
(Massanari, 2017). Druhým znakem je náhlá vlna zpráv, telefonátů, zásilek nebo návštěv od
neznámých lidí, často následovaná kontaktováním zaměstnavatele, rodiny nebo školy dětí
(Citron, 2014).

Třetím znakem je souběh s dalšími technikami: s koordinovaným útokem, s vytrženými citacemi
nebo s padělaným obsahem, který doxing doprovodí. Kniha popisuje tyto souběhy v technikách
[EA-2.3.4 Mob coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md) a [EA-2.3.1
Clip takeout](@/kompendium/techniques/ea-2-3-1-clip-takeout.md); příbuzný útok na podobu
a hlas popisuje heslo [deepfake](@/glossary/deepfake.md); že se jednotlivé prostředky
takto skládají, je pro útoky tohoto typu pravidlem, ne výjimkou (Citron, 2014).

U dotčeného je obraz následků shodný s obrazem po pronásledování: akutní strach o bezpečí
sebe i rodiny, hypervigilance, nespavost, stažení z veřejného prostoru a autocenzura.
Hermanová popisuje tuto trojici příznaků – hypervigilance, vtíravé vzpomínky a vyhýbání – jako
jádro posttraumatické reakce na opakované ohrožení, ne jako přehnanou citlivost (Herman,
1992).

## Mechanismus

Kniha se doxingem zabývá jako epistemickým útokem, nejen jako bezpečnostním incidentem
(*interpretace knihy*). Prvním strukturním účinkem je přesun z argumentu na osobu: spor
o tvrzení se mění v ohrožení člověka, který je vyslovil, a tím se mění cena účasti ve veřejné
debatě. Touto cestou se doxing stává technikou umlčení, popsanou jako [EA-2.3.8 Doxxing
epistemický](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md) (Citron, 2014).

Druhým účinkem je odstrašení okolí. Útok nepůsobí jen na dotčeného, ale na všechny, kdo ho
sledují, a zpráva zní, že totéž se stane každému, kdo promluví; Citronová tento efekt
dokumentuje jako soustavné vytlačování celých skupin z online veřejného prostoru (Citron,
2014). Douglas dodává, že újma nespočívá v tom, že se informace stala známou, ale v tom, že
byla vytržena z kontextu, v němž byla dosud prakticky nedostupná (Douglas, 2016).

Třetím účinkem je pocit všudypřítomného dohledu. Vědomí, že kdokoli může znát mou adresu
a denní režim, vede k sebeomezování i bez dalšího útoku; jde o mechanismus, který Foucault
popsal jako [panoptismus](@/glossary/panopticism.md) (Foucault, 1975). Dlouhodobým výsledkem
bývá [sociální izolace](@/glossary/socialni-izolace.md), protože dotčený omezuje kontakty,
které by mohly jeho polohu prozradit.

## Odlišení

Od investigativní žurnalistiky a whistleblowingu se doxing liší veřejným zájmem, ověřováním,
ochranou nezúčastněných, odpovědností redakce a právem na reakci; Douglasova analýza ukazuje,
že tyto znaky lze posuzovat jednotlivě a že rozhodující je proporcionalita zveřejněného
k tvrzenému zájmu (Douglas, 2016). Doxing často používá stejné metody práce s veřejnými
zdroji jako legitimní [OSINT](@/glossary/osint.md); rozdíl není v nástrojích, ale v účelu
a etice, protože legitimní vyšetřování chrání soukromí nezúčastněných a nikdy nevyzývá
k obtěžování.

Od [deplatformingu](@/glossary/deplatforming.md) se liší směrem zásahu: deplatforming odebírá
prostor k projevu, doxing ohrožuje osobu mimo platformu, a oba se v praxi kombinují (Citron,
2014). Od legitimní kritiky se liší předmětem: kritika se týká výroků a jednání, doxing místa,
kde člověk spí (Douglas, 2016).

Od paranoidních obav je třeba odlišit oprávněnou ostražitost. Dotčení po doxingu bývají
hypervigilantní a jejich strach může působit přehnaně, přitom bývá přiměřený skutečnému
riziku; Hermanová varuje právě před patologizací reakce, která je adaptivní odpovědí na
doložené ohrožení (Herman, 1992).

## Právní rámec

Konkrétní kvalifikace závisí na jurisdikci a okolnostech. V evropském prostoru je zpracování
osobních údajů upraveno obecným nařízením o ochraně osobních údajů, nařízení (EU) 2016/679;
dotčený se může obrátit na provozovatele platformy i na dozorový úřad, v Česku na Úřad pro
ochranu osobních údajů. Povinnosti platforem při oznámení nezákonného obsahu zavedl akt
o digitálních službách, nařízení (EU) 2022/2065. Citronová přitom opakovaně dokládá, že
rozhodující překážkou nebývá chybějící norma, ale vymahatelnost v reálném čase (Citron, 2014).

Trestněprávně může doxing naplnit znaky nebezpečného pronásledování podle § 354 zákona
č. 40/2009 Sb., trestního zákoníku, případně vydírání nebo nebezpečného vyhrožování, je-li
spojen s dalším jednáním; občanskoprávně přichází v úvahu ochrana osobnosti. Pro uchování
důkazů a jejich použitelnost v řízení platí nároky popsané v heslech [chain of
custody](@/glossary/chain-of-custody.md) a v kapitolách [Ochrana
svědků](@/kompendium/forensic-legal/22-fact-witness-protection.md) a [Elektronické
důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md).

## Význam pro Kompendium

Doxing patří do skupiny technik mediálního a síťového útoku a objevuje se v kazuistice
[Mediální mob attack](@/kompendium/case-studies/04-medialni-mob-attack.md) i v historickém
případu [Pizzagate](@/kompendium/historical-cases/29-pizzagate.md), kde zveřejnění údajů
navazovalo na dezinformační kampaň (Massanari, 2017). Na populační úrovni s ním počítají
programy [digitálního
občanství](@/kompendium/population-health/16-digital-citizenship-program.md).

Vlastním přínosem knihy je čtení doxingu jako útoku na podmínky poznání, nikoli pouze na
bezpečí: tím, že z veřejné debaty vytlačí ty, kdo mají co doložit, mění se i to, co se
o tématu veřejně ví (*interpretace knihy*, navazující na Citron, 2014).

## Obrana a zotavení

Prevence spočívá v omezení toho, co je o člověku veřejně dostupné, a v oddělení pracovních
a soukromých účtů; Douglasova analýza ukazuje, proč je účinné zvyšovat náklady na propojení
údajů, i když je jednotlivě žádný z nich není tajný (Douglas, 2016). Podrobněji k tomu vede
průvodce [Digitální
hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md).

Při útoku má přednost bezpečí: při konkrétní hrozbě kontakt s policií a informování blízkých,
zaměstnavatele a případně školy dětí. Dokumentace obsahu, než je smazán, rozhoduje o pozdější
možnosti nápravy (Citron, 2014); postup popisuje [Uchování
důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md). Organizace potřebuje
připravenou reakci pro zaměstnance pod útokem, viz [Reakce na
incident](@/kompendium/organizational-defense/31-incident-response-EA.md).

Zotavení pracuje s hypervigilancí a se ztrátou pocitu bezpečí a vede k postupnému návratu do
veřejného prostoru vlastním tempem. Hermanová zdůrazňuje, že obnovu bezpečí nelze přeskočit
a že návrat do kontaktu s veřejností patří teprve do pozdější fáze (Herman, 1992).

## Meze pojmu a kritika

Pojem má neostré hrany a dá se zneužít proti oprávněnému zveřejnění. Douglas sám připouští,
že deanonymizace může být v ojedinělých případech legitimní, například u anonymního účtu,
který sám soustavně ohrožuje druhé, a že posouzení nelze nahradit pravidlem (Douglas, 2016).
Nálepka doxingu se proto někdy objevuje i tam, kde jde o doložení autorství tvrzení.

Druhou mezí je připisování odpovědnosti. Protože škoda vzniká součtem mnoha drobných
jednání, bývá právně nedosažitelná, i když je sociálně zřejmá (Massanari, 2017). Otevřenou
otázkou je, nakolik lze tuto strukturní odpovědnost přenést na platformy, aniž by se
z nástroje ochrany stal nástroj cenzury; náklady obou krajností rozebírá heslo
[deplatforming](@/glossary/deplatforming.md).

## Literatura

- Citron, D. K. (2014). *Hate Crimes in Cyberspace*. Harvard University Press.
- Douglas, D. M. (2016). *Doxing: A conceptual analysis*. Ethics and Information Technology.
- Foucault, M. (1975). *Surveiller et punir: Naissance de la prison*. Gallimard.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Massanari, A. (2017). *#Gamergate and The Fappening: How Reddit's algorithm, governance, and culture support toxic technocultures*. New Media & Society.

## Související

**Pojmy**

- [Deplatforming](@/glossary/deplatforming.md) – souběžné odebrání prostoru k projevu.
- [OSINT](@/glossary/osint.md) – legitimní práce s veřejnými zdroji a její etické meze.
- [Panopticism](@/glossary/panopticism.md) – účinek pocitu všudypřítomného dohledu.
- [Sociální izolace](@/glossary/socialni-izolace.md) – dlouhodobý důsledek stažení z kontaktů.
- [Deepfake](@/glossary/deepfake.md) – útok, který doxing často doprovází.
- [Chain of custody](@/glossary/chain-of-custody.md) – podmínka použitelnosti zajištěných důkazů.

**Techniky a případy**

- [EA-2.3.8 Doxxing epistemický](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md) – doxing jako technika umlčení.
- [EA-2.3.4 Mob coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md) – koordinovaný útok, jehož bývá součástí.
- [Mediální mob attack](@/kompendium/case-studies/04-medialni-mob-attack.md) – kazuistika.

**Obrana**

- [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – dokumentace útoku.
- [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md) – prevence.
- [Reakce na incident](@/kompendium/organizational-defense/31-incident-response-EA.md) – postup organizace.
