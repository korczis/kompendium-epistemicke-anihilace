+++
title = "Výzva k relevanci"
description = "Otázka, jak příspěvek souvisí s dohodnutým cílem: nástroj udržení tématu, který se v rukou moci mění v cenzuru nepohodlných námitek."
weight = 11
insert_anchor_links = "right"

[taxonomies]
tags = ["nlp", "nlp-reframing", "nlp-vzorec", "nlp-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "moderate"
lang = "cs"
keywords = ["Výzva k relevanci", "Relevancy challenge", "otázka po relevanci", "test relevance", "Reframing a rámce", "NLP vzorce"]
schema_type = "DefinedTerm"
catalog = "nlp"
catalog_schema = 1
catalog_id = "NLP-08.11"
catalog_slug = "vyzva-k-relevanci"
catalog_family = "reframing"
catalog_family_code = "08"
catalog_family_title = "Reframing a rámce"
catalog_family_en = "Reframing and frames"
catalog_part = "reframing.b"
catalog_type = "pattern"
catalog_type_cs = "vzorec"
catalog_en = "Relevancy challenge"
catalog_aliases = ["otázka po relevanci", "test relevance"]
catalog_use = "dvoji"
catalog_use_cs = "terapeutické i vlivové"
catalog_risk = "stredni"
catalog_risk_cs = "střední"
catalog_broader = "ramec-vysledku"
catalog_narrower = []
catalog_depth = 2
catalog_ancestors = ["ramec-vysledku", "ramec-pojem"]
catalog_related = ["cerveny-sled", "kontrola-tonu", "irelevantni-zaver", "meta-model", "som-jiny-vysledek", "ramec-zpetneho-shrnuti", "otevreny-ramec", "dodatecne-ramcovani"]
catalog_related_declared = ["otevreny-ramec", "ramec-zpetneho-shrnuti", "dodatecne-ramcovani", "meta-model"]
catalog_kompendium = ["kompendium/techniques/ea-1-3-3-tematicka-diverze.md", "kompendium/techniques/ea-2-2-9-disciplinary-boundary-coercion.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/nlp-vzorce/reframing/ramec-vysledku.md", "kompendium/nlp-vzorce/reframing/ramec-zpetneho-shrnuti.md", "kompendium/techniques/ea-1-3-3-tematicka-diverze.md", "kompendium/techniques/ea-2-2-9-disciplinary-boundary-coercion.md"]
catalog_prev = "kontrastni-ramec"
catalog_next = "otevreny-ramec"
catalog_position = 11
catalog_family_size = 17
catalog_sources = ["grice-1975", "herman-1992", "levinson-1983", "lifton-1961", "miller-rollnick-2013", "oconnor-seymour-1990", "passmore-rowson-2019", "tosey-mathison-2009", "watzlawick-1967", "witkowski-2010"]
catalog_sources_primary = ["oconnor-seymour-1990"]
catalog_sources_roots = ["grice-1975", "levinson-1983", "watzlawick-1967"]
catalog_sources_critical = ["herman-1992", "lifton-1961", "miller-rollnick-2013", "passmore-rowson-2019", "tosey-mathison-2009", "witkowski-2010"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura vzorce", "Detekční znaky", "Legitimní a manipulativní užití", "Stav důkazů", "Obrana a zotavení"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_provenance = "inferred"
catalog_review = "agent"
catalog_data = "data/nlp/reframing.b.toml"
+++

# Výzva k relevanci

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `NLP-08.11` |
| **Katalog** | [NLP vzorce](@/kompendium/nlp-vzorce/_index.md) |
| **Rodina** | [Reframing a rámce](@/kompendium/nlp-vzorce/reframing/_index.md) |
| **Druh** | vzorec |
| **Anglicky** | Relevancy challenge |
| **Jiné názvy** | otázka po relevanci, test relevance |
| **Obecnější heslo** | [Rámec výsledku](@/kompendium/nlp-vzorce/reframing/ramec-vysledku.md) |
| **Užití** | terapeutické i vlivové |
| **Riziko zneužití** | střední |
| **Vazba na Vaknin 2008** | odvozená: obsah knihy nebyl ověřen |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Výzva k relevanci je komunikační tah, kterým se u příspěvku do rozhovoru ověřuje, jak souvisí
s cílem, na němž se účastníci dohodli. V typické podobě zazní otázka, jakým způsobem poznámka,
námitka nebo nové téma přispívá k dosažení dohodnutého výsledku. Pokud se souvislost ukáže,
příspěvek se začlení. Pokud ne, odloží se, přesune jinam nebo se vyřadí. Vzorec je úzce svázán
s [rámcem výsledku](@/kompendium/nlp-vzorce/reframing/ramec-vysledku.md): bez předem
stanoveného cíle nemá relevance měřítko a otázka po ní se stává čistým výkonem moci. V NLP se
uvádí jako nástroj pro vedení porad, vyjednávání a koučovacích rozhovorů, kde má bránit
rozptýlení pozornosti, a opírá se přitom o obecnou konverzační normu, podle níž má příspěvek
souviset s účelem rozhovoru (Grice 1975). Pro kompendium je důležitý proto, že kdo rozhoduje o relevanci,
rozhoduje i o tom, které skutečnosti se vůbec dostanou do úvahy.

## Původ a souvislosti

NLP od svých počátků zdůrazňovalo, že rozhovor má být vztažen k výsledku, který je možné
popsat a ověřit, a úvodní učebnice proto stavějí řadu komunikačních nástrojů na předem
formulovaném cíli (O'Connor a Seymour 1990). Výzva k relevanci je v tomto smyslu ochranou
rámce výsledku: připomíná cíl ve chvíli, kdy se rozhovor začne vzdalovat. V aplikacích NLP na
porady a vyjednávání se objevuje spolu s
[rámcem zpětného shrnutí](@/kompendium/nlp-vzorce/reframing/ramec-zpetneho-shrnuti.md), který
shrnuje, kam rozhovor dospěl, a s otevřeným rámcem, který naopak vymezuje čas pro témata mimo
program.

Samotný princip, že příspěvek do rozhovoru má souviset s jeho účelem, je ovšem mnohem starší a
lépe prozkoumaný mimo NLP. Grice ho formuloval jako jednu z maxim kooperativní konverzace:
účastníci očekávají, že to, co druhý říká, má k probíranému tématu vztah, a když se zdá, že
nemá, hledají skrytou souvislost (Grice 1975). Lingvistická pragmatika ukázala, že právě toto
očekávání dovoluje sdělovat mnoho nepřímo, ale také, že posuzování relevance je vždy závislé na
tom, jaký účel rozhovoru účastníci sdílejí (Levinson 1983). Výzva k relevanci tedy není
neutrální technikou. Opírá se o běžnou konverzační normu a dává jedné straně pravomoc ji
vymáhat.

## Struktura vzorce

Strukturálně má vzorec tři prvky. Prvním je referenční cíl, vůči kterému se relevance měří:
program porady, zakázka koučinku, dohodnutý problém. Druhým je posuzovaný příspěvek. Třetím je
rozhodovatel, tedy ten, kdo otázku klade a kdo také hodnotí odpověď. Pro analýzu je klíčový
třetí prvek. Watzlawick a spolupracovníci rozlišovali v každé komunikaci obsahovou a vztahovou
rovinu: sdělení vždy kromě obsahu definuje i vztah mezi mluvčími (Watzlawick, Beavin a Jackson
1967). Výzva k relevanci na obsahové rovině řeší téma, na vztahové rovině ale potvrzuje, kdo má
právo vymezit, co do rozhovoru patří.

V legitimní podobě je referenční cíl sdílený a známý předem, otázka je skutečná, tedy připouští
odpověď, která souvislost ukáže, a nerelevantní téma se neruší, jen přesouvá. V manipulativní
podobě se měřítko relevance mění podle potřeby rozhovoru. Cíl se formuluje úzce právě tehdy,
když se objeví nepohodlná námitka, otázka je řečnická a odpověď se nehodnotí, a vyřazené téma
se už nikdy nevrátí. Strukturálně se tak vzorec blíží
[tematické diverzi](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md), s tím rozdílem, že
diverze rozhovor odvádí jinam, kdežto výzva k relevanci ho od nepohodlného tématu brání. V
obou případech se kontrola tématu stává kontrolou toho, co lze vědět.

## Detekční znaky

Manipulativní výzvu k relevanci prozrazuje několik znaků. Otázka po relevanci zazní selektivně:
u námitek, které ohrožují mluvčího nebo jeho plán, ale ne u odboček, které mu vyhovují. Cíl
rozhovoru nebyl předem výslovně dohodnut, nebo se jeho vymezení během rozhovoru zúží. Námitka
se nezapíše a nedostane jiné místo ani čas. Otázka je položena tónem, který odpověď nečeká, a
když přesto přijde, není posouzena. Typickou oblastí jsou varování před riziky, upozornění na
porušení pravidel a osobní zkušenosti, které se nehodí do obrazu: všechny tři lze snadno
prohlásit za „mimo téma“.

V mentorských a akademických vztazích se vzorec objevuje jako opakované vymezování oboru:
otázky, metody nebo zdroje, které by mohly zpochybnit směr práce, se odmítají jako
„nerelevantní pro náš obor“. Kompendium tento mechanismus podrobně popisuje u
[vynucování oborových hranic](@/kompendium/techniques/ea-2-2-9-disciplinary-boundary-coercion.md).
Ve skupinách s vysokou kontrolou se relevance měří vztahem k doktríně: zkušenost člena, která
s doktrínou nesouhlasí, se neprohlašuje za nepravdivou, ale za nepodstatnou. Lifton popsal
podobný princip jako nadřazení doktríny člověku, ve kterém se zkušenost jednotlivce
přizpůsobuje učení, a ne naopak (Lifton 1961). Znakem u člověka, na kterého je výzva
uplatňována dlouhodobě, je, že sám začne předem vyřazovat své postřehy jako nepodstatné a
přestane je vůbec vyslovovat.

## Legitimní a manipulativní užití

Legitimní užití chrání čas a pozornost skupiny a činí to průhledně. Moderátorka porady, která
odkazuje na schválený program a otevřený bod zapíše na příští schůzku, používá výzvu k
relevanci v souladu s konverzační normou, kterou účastníci sdílejí (Grice 1975). V terapii
nebo koučinku může otázka po relevanci pomoci klientovi všimnout si, že se vyhýbá tématu, kvůli
kterému přišel; i zde však platí, že o cíli rozhoduje klient a že odpověď „souvisí to takto“ je
přijatelná. Motivační rozhovor pracuje s podobným zaměřením na cíl, ale zaměření rozhovoru hledá
společně s klientem, zdůrazňuje jeho autonomii a varuje před postojem, ve kterém terapeut ví
lépe, co je podstatné (Miller a Rollnick 2013).

Manipulativní užití slouží k vyřazení informace, která by mohla změnit rozhodnutí. Rozlišuje
se podle tří otázek. Byl cíl dohodnut předem a všemi, nebo ho vymezil ten, komu námitka vadí?
Uplatňuje se výzva na všechny odbočky stejně? A co se s vyřazeným tématem stane: dostane jiné
místo, nebo zmizí? Kritické zhodnocení NLP pro organizační praxi zdůrazňuje, že
u jeho nástrojů je třeba posuzovat nejen deklarovaný účinek, ale i účel a etiku jejich použití
(Tosey a Mathison 2009); u výzvy k relevanci to znamená sledovat, v čí prospěch se kontrola
rozhovoru vykonává.

## Stav důkazů

Výzva k relevanci nebyla jako samostatná technika NLP empiricky zkoumána a o jejím účinku
nelze tvrdit nic na základě kontrolovaných studií. Lze ji posuzovat jen nepřímo. Norma
relevance v rozhovoru je dobře popsána pragmatikou a není objevem NLP (Grice 1975; Levinson
1983). Obecná tvrzení NLP o účinnosti jeho komunikačních nástrojů v organizacích a v koučinku
kritické přehledy nepodporují: nacházejí málo kvalitních studií, převahu kazuistik a
nedostatečně definované intervence (Passmore a Rowson 2019). Witkowski po průchodu databází
výzkumů NLP konstatoval, že kontrolované studie klíčová tvrzení oboru většinou nepotvrzují
(Witkowski 2010). Pro čtenáře z toho plyne, že výzvu k relevanci je třeba chápat jako
pojmenování běžné konverzační praxe, nikoli jako ověřenou techniku, a hodnotit ji podle toho,
kdo ji používá a k čemu.

## Obrana a zotavení

Nejúčinnější obranou je trvat na tom, aby měřítko relevance bylo výslovné. Kdo je vyzván, aby
obhájil souvislost svého příspěvku, může se zeptat, podle jakého cíle se relevance posuzuje a
kdo ho stanovil. Druhou obranou je zajistit dohledatelnost: požádat o zápis námitky do zápisu
porady, poslat ji písemně nebo ji předložit tam, kde se o daném riziku rozhoduje. Informace,
která byla vyřazena jako nerelevantní, ale je zapsaná, zůstává k dispozici pro pozdější
posouzení a chrání i toho, kdo ji vyslovil. Třetí obranou je hledat druhé fórum, tedy jinou
osobu nebo orgán, který může nezávisle posoudit, zda námitka k věci patří. U bezpečnostních a
etických upozornění to bývá oddělená linka nebo pověřená osoba.

V klinické práci s lidmi, jejichž postřehy byly dlouhodobě prohlašovány za nepodstatné, se
pracuje s obnovou důvěry ve vlastní úsudek o tom, co je důležité. Pomáhá vracet se k
vynechaným tématům a výslovně jim přiznávat místo, a postupně klientovi umožnit, aby sám
určoval, o čem se bude mluvit. Herman zdůrazňuje, že u lidí po dlouhodobé kontrole patří k
zotavení obnova autonomie, ve které člověk znovu rozhoduje o tom, co je pro něj podstatné
(Herman 1992). Terapeut nebo kouč, který s výzvou k relevanci pracuje, by měl hlídat, zda ji
neuplatňuje právě na témata, která jsou nepohodlná jemu samému.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Herman, J. L. (1992). *Trauma and Recovery*. New York: Basic Books.
- Levinson, S. C. (1983). *Pragmatics*. Cambridge: Cambridge University Press.
- Lifton, R. J. (1961). *Thought Reform and the Psychology of Totalism: A Study of „Brainwashing“ in China*. New York: W. W. Norton.
- Miller, W. R., & Rollnick, S. (2013). *Motivational Interviewing: Helping People Change* (3. vyd.). New York: Guilford Press.
- O'Connor, J., & Seymour, J. (1990). *Introducing Neuro-Linguistic Programming: Psychological Skills for Understanding and Influencing People*. London: Thorsons.
- Passmore, J., & Rowson, T. S. (2019). Neuro-linguistic programming: A critical review of NLP research and the application of NLP in coaching. *International Coaching Psychology Review*, 14(1), 57–69.
- Tosey, P., & Mathison, J. (2009). *Neuro-Linguistic Programming: A Critical Appreciation for Managers and Developers*. Basingstoke: Palgrave Macmillan.
- Watzlawick, P., Beavin, J. H., & Jackson, D. D. (1967). *Pragmatics of Human Communication*. New York: W. W. Norton.
- Witkowski, T. (2010). Thirty-five years of research on neuro-linguistic programming. NLP research data base. State of the art or pseudoscientific decoration? *Polish Psychological Bulletin*, 41(2), 58–66.

## Související

**Rodina a hierarchie**

- [Reframing a rámce](@/kompendium/nlp-vzorce/reframing/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel
- [Rámec výsledku](@/kompendium/nlp-vzorce/reframing/ramec-vysledku.md) – obecnější heslo, jehož je toto heslo zvláštním případem

**Příbuzná hesla**

- [Červený sleď](@/kompendium/argumentacni-fauly/relevance/cerveny-sled.md) – příbuzné heslo (Argumentační fauly: Klamy relevance, Red herring)
- [Kontrola tónu](@/kompendium/argumentacni-fauly/relevance/kontrola-tonu.md) – příbuzné heslo (Argumentační fauly: Klamy relevance, Tone policing)
- [Irelevantní závěr](@/kompendium/argumentacni-fauly/relevance/irelevantni-zaver.md) – příbuzné heslo (Argumentační fauly: Klamy relevance, Ignoratio elenchi)
- [Meta-model](@/kompendium/nlp-vzorce/meta-model/meta-model.md) – příbuzné heslo (Meta-model, Meta Model)
- [Jiný výsledek](@/kompendium/nlp-vzorce/sleight-of-mouth/som-jiny-vysledek.md) – příbuzné heslo (Sleight of Mouth, Another outcome)
- [Rámec zpětného shrnutí](@/kompendium/nlp-vzorce/reframing/ramec-zpetneho-shrnuti.md) – příbuzné heslo (Reframing a rámce, Backtrack frame)
- [Otevřený rámec](@/kompendium/nlp-vzorce/reframing/otevreny-ramec.md) – příbuzné heslo (Reframing a rámce, Open frame)
- [Dodatečné rámcování](@/kompendium/nlp-vzorce/reframing/dodatecne-ramcovani.md) – příbuzné heslo (Reframing a rámce, Post-framing)

**V kompendiu**

- [EA-1.3.3 Tematická diverze](@/kompendium/techniques/ea-1-3-3-tematicka-diverze.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.2.9 Vynucování oborových hranic](@/kompendium/techniques/ea-2-2-9-disciplinary-boundary-coercion.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Kontrastní rámec](@/kompendium/nlp-vzorce/reframing/kontrastni-ramec.md) – předchozí heslo rodiny
- [Otevřený rámec](@/kompendium/nlp-vzorce/reframing/otevreny-ramec.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
