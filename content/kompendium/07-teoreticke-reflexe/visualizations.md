+++
title = "Vizualizace pro sekci 07 – mapa teoretických rámců"
description = "Interaktivní silová mapa třiceti tří myslitelů, o něž se opírá teorie epistemické anihilace; hrany naznačují vlivové vazby, barvy filozofické tradice."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "p5js", "filosofie", "teoreticky-ramec"]
categories = ["academic", "tools"]

[extra]
related_terms = ["tononi-iit", "varela-enactivism", "wardle-disinformation-typology", "williams-truth-and-truthfulness"]
parent = "kompendium-07-teoreticke-reflexe"
section_icon = "🧠"
toc = false
+++

# Mapa teoretických rámců

Tato vizualizace patří k [sekci 7](@/kompendium/07-teoreticke-reflexe/_index.md) a zobrazuje **třicet tři myslitelů**, jejichž práce pomáhají porozumět [epistemické anihilaci](@/glossary/epistemicka-anihilace.md), jako silově uspořádaný graf. Neslouží jako dějiny filozofie, ale jako orientační mapa: ukazuje, z jakých tradic kniha čerpá, které myšlenky spolu souvisejí a kde v sekci 7 najít podrobný výklad.

<div id="section-07-framework-map" class="rounded bg-slate-900"></div>
<div id="framework-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
{{ <viz_script name="section-07-framework-map" /> }}

## Co mapa zobrazuje

Každý **uzel** představuje jednoho myslitele a nese stručné označení pojmu, pro který je v knize důležitý. **Barva** uzlu označuje tradici: kontinentální filozofii, analytickou filozofii, kognitivní vědy, nebo etiku a politickou filozofii. **Hrany** naznačují vlivové vazby – to, že myšlení jednoho navazuje na druhého, rozvíjí ho nebo se s ním polemicky vyrovnává. Klepnutím na uzel se myslitel zvýrazní, zobrazí se pojem relevantní pro epistemickou anihilaci a odkaz na příslušnou kapitolu.

## Čtyři tradice a jejich přínos

**Kontinentální tradice** dává knize slovník pro moc, jazyk a prožitek. Michel Foucault ukázal, jak se moc uplatňuje skrze dohled, normy a vědění, které určuje, co je „normální“ (Foucault 1975); kniha z něj čerpá při popisu prostředí, v němž je člověk neustále hodnocen a sám se začne hlídat. Theodor Adorno a Max Horkheimer popsali, jak se rozum mění v nástroj ovládání (Horkheimer a Adorno 1947), a Jürgen Habermas proti tomu postavil ideál komunikace, v níž rozhoduje síla lepšího argumentu, ne postavení mluvčího (Habermas 1981). Martin Heidegger a Maurice Merleau-Ponty přinesli pohled na člověka jako bytost, která je vždy již zasazena do světa a tělesně ho vnímá (Heidegger 1927; Merleau-Ponty 1945) – odtud kapitoly o tom, jak manipulace mění samozřejmou půdu, na níž člověk stojí. Paul Ricoeur rozvinul pojem narativní identity, jež je terčem identitní dekonstrukce.

**Analytická tradice** přispívá přesností v otázkách významu, víry a ospravedlnění. Ludwig Wittgenstein ukázal, že význam slov je dán jejich užitím ve sdílených „jazykových hrách“ (Wittgenstein 1953) – to vysvětluje, proč skupina, která si vytvoří vlastní jazyk, může členům změnit i to, co jsou schopni myslet. Willard Van Orman Quine popsal přesvědčení jako síť, v níž se při rozporu dá upravit téměř kterýkoli uzel (Quine 1951); manipulace toho využívá, když člověka vede k tomu, aby místo nepohodlného přesvědčení obětoval vlastní pozorování. Donald Davidson formuloval princip vstřícného výkladu, bez něhož by porozumění druhému nebylo možné (Davidson 1973), a Thomas Kuhn ukázal, jak paradigmata určují, co se vůbec považuje za fakt (Kuhn 1962). Bernard Williams rozlišil dvě ctnosti pravdy – přesnost a upřímnost – a ukázal, že bez nich nemůže fungovat žádné společenství, které sdílí poznání (Williams 2002).

**Kognitivní vědy** dodávají modely toho, jak mysl zpracovává informace. Karl Friston popsal mozek jako systém, který neustále předpovídá své vstupy a snaží se minimalizovat překvapení (Friston 2010); v knize to slouží k výkladu, proč soustavné zpochybňování vnímání tak hluboce destabilizuje. David Chalmers vymezil „těžký problém“ vědomí (Chalmers 1995), Ned Block rozlišil fenomenální a přístupové vědomí a Michael Polanyi popsal tichou znalost, kterou člověk má, ale nedokáže ji plně vyslovit (Polanyi 1966) – a kterou proto snadno ztrácí, když je nucen každé své vědění obhajovat.

**Etika a politická filozofie** se ptají, co je v sázce. Hannah Arendtová na Eichmannově procesu ukázala, jak bezmyšlenkovitost umožňuje podílet se na zlu bez zlého úmyslu (Arendt 1963). Axel Honneth popsal uznání jako podmínku sebedůvěry, sebeúcty a sebehodnocení (Honneth 1992), Martha Nussbaumová a Amartya Sen chápou svobodu jako skutečné schopnosti člověka jednat a rozhodovat. Pro knihu jsou tyto rámce důležité proto, že ukazují epistemickou anihilaci jako újmu na lidské důstojnosti, nejen jako kognitivní poškození.

## Jak číst mapu

Uzly se navzájem odpuzují a hrany je k sobě přitahují; z toho vznikají shluky, které zhruba odpovídají filozofickým rodinám. Uzel lze klepnutím zvýraznit a připnout, pohyb myši nad uzlem zobrazí krátký popis. Polohu uzlů neurčuje žádné měřítko – blízkost na obrazovce vyjadřuje jen hustotu vazeb, ne míru shody mezi mysliteli.

Mapa se dá využít třemi způsoby. Čtenář, který zná jednoho autora, může z něj vyjít a podle hran najít příbuzné myšlenky. Čtenář, který řeší konkrétní otázku – třeba proč je ztráta sdíleného jazyka tak ničivá –, si může vybrat tradici a projít její uzly. A učitel může mapu použít k ukázce, že teorie epistemické anihilace nevznikla z jedné školy, ale z rozhovoru několika tradic, které se v jiných souvislostech často míjejí.

Obecný příklad: terapeutka pracuje s klientkou, která po letech v uzavřené skupině říká, že „neumí přemýšlet vlastními slovy“. Na mapě vyjde od Wittgensteina (význam jako užití ve sdíleném společenství), přes hranu k Davidsonovi (porozumění jako vstřícný výklad druhého) a odtud k Honnethovi (uznání jako podmínka sebedůvěry). Tři kapitoly jí dají tři různé, ale spojené pohledy: klientka ztratila společenství, v němž její slova platila, ztratila zkušenost, že jí někdo rozumí, a s tím i důvěru, že její hlas má váhu. Terapeutický plán pak může cílit na všechny tři roviny zároveň.

## Status a meze

Výběr myslitelů i vazeb je **kurátorským rozhodnutím** autora knihy, ne úplným ani neutrálním obrazem dějin myšlení. Hrany zjednodušují: vliv bývá oboustranný, nepřímý nebo polemický, a některé zakreslené vazby jsou spíš tematickou příbuzností než doloženým vlivem. Mapa neobsahuje řadu autorů, o něž se kniha opírá jinde – například Mirandu Frickerovou, jejíž pojem epistemické nespravedlnosti je pro knihu klíčový (Fricker 2007), nebo autory sociální epistemologie rozebírané v kapitole [7.3](@/kompendium/07-teoreticke-reflexe/socialni-epistemologie.md). Kdo potřebuje přesné vymezení vztahu mezi dvěma mysliteli, má sáhnout po příslušné kapitole a po primárních textech, ne po hraně v grafu.

Barevné rozdělení do čtyř tradic je také zjednodušením: Polanyi je zařazen ke kognitivním vědám, i když byl chemikem a filozofem vědy, Arendtová k etice a politice, i když vyšla z fenomenologie. Rozdělení slouží orientaci, ne klasifikaci.

## Literatura

- Arendt, H. (1963). *Eichmann in Jerusalem: A Report on the Banality of Evil*. Viking.
- Chalmers, D. J. (1995). Facing up to the problem of consciousness. *Journal of Consciousness Studies*, 2(3).
- Davidson, D. (1973). Radical interpretation. *Dialectica*, 27(3–4).
- Foucault, M. (1975). *Surveiller et punir: Naissance de la prison*. Gallimard.
- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing*. Oxford University Press.
- Friston, K. (2010). The free-energy principle: A unified brain theory? *Nature Reviews Neuroscience*, 11(2).
- Habermas, J. (1981). *Theorie des kommunikativen Handelns*. Suhrkamp.
- Heidegger, M. (1927). *Sein und Zeit*. Niemeyer.
- Honneth, A. (1992). *Kampf um Anerkennung*. Suhrkamp.
- Horkheimer, M., & Adorno, T. W. (1947). *Dialektik der Aufklärung*. Querido.
- Kuhn, T. S. (1962). *The Structure of Scientific Revolutions*. University of Chicago Press.
- Merleau-Ponty, M. (1945). *Phénoménologie de la perception*. Gallimard.
- Polanyi, M. (1966). *The Tacit Dimension*. Doubleday.
- Quine, W. V. O. (1951). Two dogmas of empiricism. *The Philosophical Review*, 60(1).
- Williams, B. (2002). *Truth and Truthfulness: An Essay in Genealogy*. Princeton University Press.
- Wittgenstein, L. (1953). *Philosophische Untersuchungen / Philosophical Investigations*. Blackwell.

## Související

**Kapitoly sekce 7**

- [7.1 Filozofický rámec EA](@/kompendium/07-teoreticke-reflexe/filosoficky-ramec.md) – Foucault, Adorno, Sloterdijk, Habermas.
- [7.4 EA a postmodernismus](@/kompendium/07-teoreticke-reflexe/postmodernismus.md) – moc, diskurz a ztráta velkých vyprávění.
- [7.10 Wittgenstein: jazykové hry](@/kompendium/07-teoreticke-reflexe/wittgenstein-jezykove-hry.md) – význam jako užití.
- [7.18 Arendt: banalita zla](@/kompendium/07-teoreticke-reflexe/arendt-banalita-zla.md) – krize úsudku.
- [7.22 Honneth: rozpoznání](@/kompendium/07-teoreticke-reflexe/honneth-rozpoznani.md) – uznání jako podmínka sebedůvěry.
- [7.40 Friston: active inference](@/kompendium/07-teoreticke-reflexe/friston-active-inference.md) – predikční mysl.

**Další vizualizace a glosář**

- [Vizualizace sekce 03](@/kompendium/03-zakladni-kategorie/visualizations.md) – techniky, které teorie vysvětluje.
- [Vizualizace sekce 04](@/kompendium/04-terminalni-protokoly/visualizations.md) – rozhodovací strom terminálních protokolů.
- [Globální vizualizace EA taxonomie](@/kompendium/visualizations/_index.md) – přehled celé taxonomie.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – základní pojem knihy.

---

## Kontakt a příspěvky

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glosář](@/glossary/_index.md) | [Filozofie](@/philosophy/_index.md) | [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/)
