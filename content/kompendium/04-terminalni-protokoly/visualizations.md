+++
title = "Vizualizace pro sekci 04 – rozhodovací strom terminálních protokolů"
description = "Interaktivní rozhodovací strom sekce 04: od otázky, zda jsou přítomny signály terminálních protokolů, přes míru jejich projevu k indikované odpovědi; barvy podle rizika."
weight = 99

[taxonomies]
tags = ["kompendium", "vizualizace", "interaktivni", "p5js", "terminalni-protokoly", "rozhodovaci-strom"]
categories = ["academic", "tools"]

[extra]
related_terms = ["pred-simulacni-screening", "ultimatni-scenar", "kontrolovana-rekonstituce"]
parent = "kompendium-04-terminalni-protokoly"
section_icon = "🌳"
toc = false
+++

# Rozhodovací strom terminálních protokolů

Tato vizualizace patří k [sekci 04](@/kompendium/04-terminalni-protokoly/_index.md) a převádí [před-simulační screening](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md) a [intra-simulační monitoring](@/kompendium/04-terminalni-protokoly/intra-simulacni-monitoring.md) do podoby **radiálního rozhodovacího stromu**. Je určena těm, kdo odpovídají za bezpečí lidí v intenzivních výcvikových programech, v terapii nebo ve výzkumu, a pomáhá jim odpovědět na jedinou otázku: co v dané chvíli udělat.

<div id="section-04-decision-tree" class="rounded bg-slate-900"></div>
<div id="tree-detail" class="mt-4 p-4 bg-slate-800 rounded text-slate-200"></div>
{{ <viz_script name="section-04-decision-tree" /> }}

## Proč rozhodovací strom

Terminální protokoly popsané v sekci 04 jsou systémové sekvence, které mohou vést k hlubokému a dlouhodobému narušení poznávání a identity. Pro toho, kdo za účastníky odpovídá, je nejtěžší rozhodnout včas a jednoznačně, kdy pokračovat, kdy zpomalit a kdy program zastavit. Historie psychologie zná případy, kdy se takové rozhodnutí dělalo pozdě: simulace vězení na Stanfordu byla ukončena po šesti dnech z plánovaných dvou týdnů, protože se chování účastníků vymklo kontrole (Haney, Banks a Zimbardo 1973). Strom nemá nahradit úsudek, ale dát mu strukturu, aby se rozhodnutí o zastavení nedalo odkládat ohledem na program, autoritu vedoucího nebo investovaný čas.

Struktura stromu odpovídá zásadě, kterou pro výzkum s lidmi formulovala Belmontská zpráva: riziko pro účastníka se posuzuje průběžně a jeho ochrana má přednost před cílem výzkumu (National Commission 1979).

## Úrovně stromu

**Kořen** uprostřed představuje posuzovaný případ. **První úroveň** odpovídá na otázku, zda byly zachyceny signály terminálních protokolů: ano, nejasné, nebo ne. Signály jsou podrobně popsány v kapitolách o [konceptuální](@/kompendium/04-terminalni-protokoly/konceptualni-dekonstrukce.md) a [identitní dekonstrukci](@/kompendium/04-terminalni-protokoly/identitni-dekonstrukce.md) a o [institucionální anihilaci](@/kompendium/04-terminalni-protokoly/institucionalni-anihilace.md); patří k nim rozpouštění pojmů, ztráta souvislého vyprávění o sobě a oslabení kolektivních opor poznání.

Na větvi **„ano“** rozlišuje **druhá úroveň** míru projevu – mírnou, střední a těžkou – a **třetí úroveň** vede ke kapitolám, které příslušnou situaci popisují. U mírného projevu vede strom ke konceptuální a identitní dekonstrukci jako k rámcům, v nichž se změna posuzuje; u středního k institucionální anihilaci a ke [kontrolované rekonstituci](@/kompendium/04-terminalni-protokoly/kontrolovana-rekonstituce.md), tedy k protokolu, který odlišuje legitimní náročný výcvik od destruktivního; u těžkého k [ultimátnímu scénáři](@/kompendium/04-terminalni-protokoly/ultimatni-scenar.md) a k **tvrdé zastávce**, tedy k okamžitému ukončení programu podle zásad intra-simulačního monitoringu.

Na větvi **„nejasné“** strom nevede k závěru, ale k dalšímu zjišťování: buď k **pokračování monitoringu** pomocí [self-report nástrojů](@/kompendium/06-klinicke-aplikace/self-report-instrumenty.md) a [semistrukturovaného rozhovoru](@/kompendium/06-klinicke-aplikace/semi-structured-interview-protokol.md), nebo k **opakovanému screeningu** spojenému s [diferenciální diagnostikou](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md), která má vyloučit, že pozorované změny mají jinou příčinu – například rozvíjející se psychotickou poruchu nebo reakci na nesouvisející zátěž.

Na větvi **„ne“** strom nekončí uklidněním, ale vede k [preventivním opatřením](@/kompendium/06-klinicke-aplikace/preventivni-strategie.md): ke vzdělávání účastníků a k [supervizi](@/kompendium/06-klinicke-aplikace/supervizni-ramce.md) těch, kdo program vedou.

## Jak číst strom

Větve se rozvíjejí v soustředných kruzích od středu. Klepnutím na uzel se zobrazí popis rozhodovacího kritéria a odkaz na kapitolu, která danou situaci rozebírá. Barvy nesou úroveň rizika: zelená znamená bezpečný stav s preventivní péčí, žlutá stav ke sledování, oranžová stav vyžadující zásah a červená kritickou situaci, v níž má přednost okamžitá ochrana člověka. Barevné kódování je jediným nositelem této informace; zbytek grafiky je záměrně střídmý, aby nepoutal pozornost (Tufte 1983).

Asymetrie stromu je záměrná. Větev „nejasné“ je stejně rozvinutá jako větev „ano“, protože nejistota je v praxi nejčastějším stavem a nejsnáze vede k odkladu. Strom ji neřeší vyčkáváním, ale konkrétními kroky zjišťování.

## Jak se stromem pracovat

Před začátkem náročného programu slouží strom jako kontrolní seznam: má tým nástroje, kterými zjistí, na které větvi se účastník nachází? Kdo rozhodne o tvrdé zastávce a je jeho rozhodnutí nezávislé na vedení programu? V průběhu programu pomáhá v pravidelných poradách, na nichž se u každého účastníka určí aktuální větev. Po skončení programu může sloužit k rozboru: kdy se objevil první signál a kdy na něj tým reagoval.

Obecný příklad (kompozit): v několikadenním výcviku krizového vyjednávání si lektorka všimne, že jeden z účastníků přestal používat vlastní slova a opakuje formulace instruktora, i když se ho ptá na osobní zážitky. Signál není jednoznačný, a strom ji proto vede na větev „nejasné“. Místo aby čekala, zda se stav zlepší, domluví s účastníkem krátký rozhovor podle semistrukturovaného protokolu a požádá o nezávislé posouzení. Ukáže se, že účastník je po několika nocích téměř bez spánku a v osobní krizi, kterou výcvik prohloubil. Program pro něj přeruší a domluví navazující péči. Rozhodnutí neopřela o jistotu, ale o strukturu, která nejistotu převádí v krok.

## Náročný výcvik, nebo destruktivní protokol

Strom předpokládá rozlišení, které je v praxi nejtěžší: ne každá intenzivní zkušenost je škodlivá. Náročný výcvik, psychoterapie, která otevírá bolestná témata, nebo přechodové rituály v profesních komunitách mohou přechodně oslabit jistoty člověka a přesto ho posílit. Rozhodující není samotná intenzita, ale to, zda účastník zůstává autorem svého rozhodnutí: zda může kdykoli odejít bez trestu, zda rozumí tomu, co se s ním děje, zda má přístup k lidem a informacím mimo program a zda se program po skončení snaží jeho samostatnost obnovit. Steven Hassan tyto otázky shrnuje jako rozdíl mezi prostředím, které respektuje svobodnou vůli, a prostředím, které ji soustavně omezuje kontrolou chování, informací, myšlení a emocí (Hassan 2015). Kapitola o kontrolované rekonstituci tento rozdíl převádí do šesti fází, podle nichž lze legitimní program poznat; strom na ni odkazuje právě proto, že bez tohoto rozlišení by každá intenzivní zkušenost vypadala jako signál.

## Status a meze

Strom je **pracovní pomůckou**, ne validovaným klinickým algoritmem. Úrovně a přiřazení kapitol vycházejí z obsahu sekce 04, nikoli z empirického ověření na souboru případů. Nenahrazuje klinické vyšetření, nepodává diagnózu a neurčuje léčbu; v situaci ohrožení života nebo zdraví mají přednost krizové služby a zdravotní péče.

Strom také nepostihuje vliv autority a skupinového tlaku na samotného posuzovatele. Milgramovy pokusy ukázaly, jak silně může situace a autorita potlačit úsudek jednotlivce (Milgram 1974); lektor, který je součástí programu, nemusí být schopen nezávisle rozhodnout o jeho zastavení. Proto kapitola [Kapitola 5: Specializované bezpečnostní protokoly](@/kompendium/04-terminalni-protokoly/kapitola-5.md) trvá na nezávislém dohledu a strom tento požadavek předpokládá. Následky, které už nastaly, řeší sekce [06. Klinické aplikace](@/kompendium/06-klinicke-aplikace/_index.md) a zotavení po pobytu v prostředí s vysokou mírou kontroly popisuje i Hermanové pojetí stadií zotavení (Herman 1992).

## Literatura

- Haney, C., Banks, W. C., & Zimbardo, P. G. (1973). Interpersonal dynamics in a simulated prison. *International Journal of Criminology and Penology*, 1.
- Hassan, S. (2015). *Combating Cult Mind Control* (rev. vyd.). Freedom of Mind Press.
- Herman, J. L. (1992). *Trauma and Recovery*. Basic Books.
- Milgram, S. (1974). *Obedience to Authority: An Experimental View*. Harper & Row.
- National Commission for the Protection of Human Subjects of Biomedical and Behavioral Research (1979). *The Belmont Report*.
- Tufte, E. R. (1983). *The Visual Display of Quantitative Information*. Graphics Press.

## Související

**Kapitoly sekce 04**

- [4.1 Před-simulační screening](@/kompendium/04-terminalni-protokoly/pred-simulacni-screening.md) – vstupní posouzení, z něhož strom vychází.
- [4.2 Intra-simulační monitoring](@/kompendium/04-terminalni-protokoly/intra-simulacni-monitoring.md) – průběžné sledování a tvrdá zastávka.
- [Kontrolovaná rekonstituce](@/kompendium/04-terminalni-protokoly/kontrolovana-rekonstituce.md) – odlišení legitimního výcviku od destruktivního.
- [Ultimátní scénář](@/kompendium/04-terminalni-protokoly/ultimatni-scenar.md) – nejtěžší konfigurace.
- [Kapitola 5: Specializované bezpečnostní protokoly](@/kompendium/04-terminalni-protokoly/kapitola-5.md) – institucionální pojistky.

**Navazující péče a další vizualizace**

- [Diferenciální diagnostika](@/kompendium/06-klinicke-aplikace/diferencialni-diagnostika.md) – vyloučení jiných příčin.
- [Vizualizace sekce 03](@/kompendium/03-zakladni-kategorie/visualizations.md) – časné fáze, z nichž terminální protokoly vyrůstají.
- [Vizualizace sekce 06](@/kompendium/06-klinicke-aplikace/visualizations.md) – klinická cesta zotavení.
- [Globální vizualizace EA taxonomie](@/kompendium/visualizations/_index.md) – přehled celé taxonomie.

---

## Kontakt a příspěvky

**Autor: [Tomáš Korcak (korczis)](https://github.com/korczis)** | Licence: [GHL](https://github.com/korczis/kompendium-epistemicke-anihilace/blob/main/LICENSE-CONTENT.md)

- [Glosář](@/glossary/_index.md) | [Filozofie](@/philosophy/_index.md) | [Portál pro vývojáře](https://prismatic-reality-com.github.io/prismatic-promo/developers/)
