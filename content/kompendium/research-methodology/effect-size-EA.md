+++
title = "Velikost účinku a klinicky významná změna"
description = "Jak vyjádřit, nakolik se něco změnilo: standardizované rozdíly, poměry šancí, intervaly spolehlivosti a klinicky významná změna u výsledků zotavení."
weight = 18

[taxonomies]
tags = ["kompendium", "research-methodology", "quantitative"]
categories = ["academic", "methodology", "research"]

[extra]
related_terms = ["power-analysis-EA", "meta-analysis-EA", "RCT-EA-considerations", "replication-EA-research"]
toc = true
+++

Hodnota *p* odpovídá na otázku, zda je pozorovaný rozdíl slučitelný s náhodou. Neříká, jak
je rozdíl velký ani zda má pro člověka nějaký význam. Ve výzkumu
[epistemické anihilace](@/glossary/epistemicka-anihilace.md), kde výsledky slouží klinikům,
soudům a tvůrcům politik, je proto hlášení velikosti účinku a její nejistoty základní
povinností. Tato stránka shrnuje hlavní ukazatele, jejich výklad a pasti.

## Vymezení

**Velikost účinku** (*effect size*) je číselné vyjádření síly souvislosti nebo rozdílu.
Hlavní rodiny ukazatelů:

- **standardizované rozdíly průměrů** – Cohenovo *d* nebo Hedgesovo *g* (s korekcí pro malé
  vzorky); rozdíl průměrů vyjádřený v jednotkách směrodatné odchylky;
- **ukazatele souvislosti** – korelace *r*, podíl vysvětleného rozptylu (η², R²);
- **ukazatele pro kategoriální výsledky** – poměr šancí (OR), relativní riziko (RR),
  absolutní rozdíl rizik a z něj odvozený počet lidí, které je třeba léčit (NNT);
- **nestandardizované účinky** – rozdíl v původních jednotkách škály, často nejsrozumitelnější.

Každý odhad se hlásí s **intervalem spolehlivosti** (Cumming 2012), který ukazuje rozsah
hodnot slučitelných s daty.

**Klinicky významná změna** odpovídá na jinou otázku: změnil se tento konkrétní člověk
dostatečně a spolehlivě? Jacobson a Truax (1991) navrhli dvě kritéria – index spolehlivé
změny (*reliable change index*, RCI), tedy změnu větší, než jakou by vysvětlila chyba měření,
a přechod z rozložení klinické populace do rozložení populace běžné.

## Kdy metodu použít

Vždy. Každá kvantitativní studie má hlásit velikost účinku pro hlavní výsledky, ať je
statisticky významný, nebo ne. Zvlášť důležité je to u:

- intervencí pro lidi po zkušenosti s manipulací (zlepšení symptomů, důvěry ve vlastní
  úsudek, sociálního fungování);
- **programů prevence** (viz [Randomizované studie](@/kompendium/research-methodology/RCT-EA-considerations.md));
- **souvislostí** mezi expozicí a následky, které se pak citují v klinických nebo soudních
  textech;
- **podkladů pro [metaanalýzu](@/kompendium/research-methodology/meta-analysis-EA.md)** – bez
  úplného hlášení nelze studii do souhrnu zahrnout.

## Postup

1. **Volba ukazatele podle otázky a dat.** U dvou skupin se spojitým výsledkem *d* nebo *g*;
   u binárního výsledku RR a absolutní rozdíl rizik; u opakovaných měření ukazatel, který
   zohledňuje korelaci měření (a jasné uvedení, který vzorec byl použit).
2. **Výpočet s intervalem spolehlivosti.**
3. **Výklad v kontextu.** Cohenovy orientační hranice (0,2 / 0,5 / 0,8 pro *d*; Cohen 1988)
   byly zamýšleny jako nouzové vodítko tam, kde chybí lepší srovnání. Smysluplnější je srovnání
   s účinky jiných zásahů pro stejný problém nebo s nejmenší změnou, kterou lidé pocítí.
4. **Klinická významnost** – podíl účastníků se spolehlivým zlepšením, beze změny
   a se spolehlivým zhoršením.
5. **Transparentní reportování** – průměry, směrodatné odchylky a počty pro každou skupinu,
   aby šlo ukazatele přepočítat.

## Specifika výzkumu epistemické manipulace

**Co je smysluplná změna.** U dotazníku symptomů traumatu existují zavedené orientační
body. U nových konstruktů, jako je důvěra ve vlastní vnímání, nikoli. Výzkum by proto měl
souběžně zjišťovat, jakou změnu účastníci sami považují za podstatnou (např. kotvením na
otázku „cítíte se lépe / stejně / hůř“).

**Průměr skrývá rozptyl.** U lidí po dlouhodobé manipulaci jsou průběhy velmi rozdílné.
Průměrné zlepšení může vzniknout tak, že se část lidí výrazně zlepší a malá část zhorší.
Hlášení podílu spolehlivě zhoršených je zde etickou nutností – zhoršení může být signálem
[iatrogenního poškození](@/glossary/iatrogenic-harm.md) nebo [retraumatizace](@/glossary/retraumatizace.md).

**Relativní a absolutní riziko.** „Dvojnásobné riziko“ zní dramaticky, ale u vzácného jevu
může znamenat rozdíl několika lidí na tisíc. V komunikaci s veřejností a soudy je třeba uvádět
obojí; jinak se z výzkumu stává nástroj alarmismu, o němž kniha mluví v souvislosti s
[politickou instrumentalizací](@/kompendium/critical-perspectives/6-political-instrumentalization.md).

**Standardizace podle vzorku.** Standardizovaný rozdíl závisí na tom, jak rozptýlený je
vzorek. Studie, která nabírá jen lidi s těžkými obtížemi, má menší rozptyl a stejný rozdíl
bodů v ní vyjde jako větší *d* než ve studii se smíšeným vzorkem. Srovnání standardizovaných
účinků mezi studiemi s odlišným náborem je proto zavádějící; vedle nich je užitečné hlásit
i rozdíl v původních jednotkách škály.

**Nafouknuté účinky malých studií.** Malé studie, které „vyšly“, mají v průměru nadhodnocené
účinky. U nového tématu s malými vzorky je proto vhodné očekávat, že replikace ukážou
menší účinek (viz [replikační výzkum](@/kompendium/research-methodology/replication-EA-research.md)).

## Kritéria kvality

| Oblast | Co doložit |
|---|---|
| Ukazatel | který a proč, u opakovaných měření použitý vzorec |
| Nejistota | interval spolehlivosti u každého hlavního odhadu |
| Kontext | srovnání s relevantními účinky, ne jen Cohenovy hranice |
| Klinická významnost | podíly zlepšených, nezměněných a zhoršených |
| Surová data | průměry, směrodatné odchylky, počty pro přepočet |
| Komunikace | absolutní i relativní vyjádření u rizik |

## Etika a ochrana účastníků

Velikost účinku je místem, kde se výzkum nejčastěji „přibarvuje“: volbou ukazatele, který
vypadá nejlépe, vynecháním intervalu nebo prezentací relativního rizika bez absolutního.
To není jen metodologická chyba – může vést k zavedení neúčinných programů, k přehnaným
tvrzením v soudních posudcích (viz [znalec EA](@/kompendium/forensic-legal/21-expert-witness-EA.md))
nebo ke stigmatizaci skupin lidí. Poctivé hlášení je součástí
[publikační etiky](@/kompendium/research-methodology/publication-ethics-EA.md).

## Časté chyby

- hlášení jen *p*-hodnot, nebo velikosti účinku jen u významných výsledků;
- *d* u opakovaných měření spočtené vzorcem pro nezávislé skupiny bez upozornění;
- „malý účinek, tedy bezvýznamný“ – i malý účinek může mít populační význam,
  pokud je zásah levný a široce dostupný;
- „velký účinek, tedy prokázaný“ – velký účinek z malé studie s širokým intervalem je slabý důkaz;
- záměna statistické a klinické významnosti.

## Ilustrativní příklad

*Hypotetický výsledek.* Studie skupinového programu pro lidi po odchodu ze skupiny
s vysokou kontrolou hlásí zlepšení na škále symptomů traumatu o *g* = 0,45 (95% interval
0,10 až 0,80) oproti čekací listině. Interval je široký: data jsou slučitelná s malým i velkým
účinkem. Analýza spolehlivé změny ukáže, že se spolehlivě zlepšila zhruba třetina účastníků,
většina zůstala beze spolehlivé změny a několik lidí se spolehlivě zhoršilo. Právě poslední
údaj vede tým k rozhovorům s těmito účastníky a zjištění, že pro ně byla skupinová forma
příliš konfrontační. Další verze programu nabízí individuální vstupní konzultaci.

## Jak číst studii tohoto typu

Při čtení výsledku se vyplatí položit si čtyři otázky:

- **Jak velký je účinek v jednotkách, kterým rozumím?** Pokud to zpráva neříká, je užitečné
  přepočítat standardizovaný rozdíl na rozdíl bodů škály nebo na podíl lidí, kteří se
  zlepšili.
- **Jak široký je interval?** Interval, který sahá od téměř nuly po velký účinek, znamená,
  že studie velikost účinku fakticky neurčila.
- **S čím je účinek srovnán?** Zlepšení oproti čekací listině je obvykle větší než oproti
  aktivní kontrole; srovnání účinků z různých designů je zavádějící.
- **Komu se nedařilo?** Zpráva, která nehlásí zhoršení, nedává úplný obraz.

Pro kliniky je užitečné převést výsledek do řeči jednotlivého klienta: „u podobných lidí
se po programu spolehlivě zlepšila asi třetina, většina zůstala zhruba stejně a menšina
se zhoršila“. Taková věta je poctivější než „program má středně silný účinek“.

## Meze a otevřené otázky

Velikost účinku neodpovídá na otázku, *proč* zásah působí. Otevřenou otázkou zůstává,
jak stanovit nejmenší smysluplnou změnu pro konstrukty, které kniha teprve definuje
(např. [epistemická agentnost](@/glossary/epistemicka-agentnost.md)), a jak srovnávat účinky
mezi studiemi, které měří odlišnými nástroji.

## Literatura

- Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences* (2. vyd.).
- Cumming, G. (2012). *Understanding the New Statistics: Effect Sizes, Confidence Intervals, and Meta-Analysis.*
- Jacobson, N. S., Truax, P. (1991). Clinical significance: A statistical approach to defining meaningful change in psychotherapy research.
- Lakens, D. (2013). Calculating and reporting effect sizes to facilitate cumulative science.

## Související

**Metody v této sekci**

- [Analýza síly testu](@/kompendium/research-methodology/power-analysis-EA.md) – očekávaný účinek určuje velikost vzorku.
- [Metaanalýza](@/kompendium/research-methodology/meta-analysis-EA.md) – kombinace účinků napříč studiemi.
- [Replikační výzkum](@/kompendium/research-methodology/replication-EA-research.md) – proč se účinky při opakování zmenšují.
- [Publikační etika](@/kompendium/research-methodology/publication-ethics-EA.md) – poctivé hlášení výsledků.

**Klinika a právo**

- [Terapeutické přístupy](@/kompendium/06-klinicke-aplikace/terapeuticke-pristupy.md) – kde se výsledky intervencí uplatní.
- [Znalec EA](@/kompendium/forensic-legal/21-expert-witness-EA.md) – jak výsledky výzkumu komunikovat soudu.

**Kritika**

- [Iatrogenní účinky intervencí](@/kompendium/critical-perspectives/11-iatrogenic-overreach.md) – proč hlásit zhoršení.

**Pojmy**

- [Iatrogenní poškození](@/glossary/iatrogenic-harm.md) – škoda způsobená péčí.
- [Evidence based](@/glossary/evidence-based.md) – praxe opřená o doložené účinky.
