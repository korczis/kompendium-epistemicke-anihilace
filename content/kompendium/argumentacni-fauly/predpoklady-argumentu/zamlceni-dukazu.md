+++
title = "Zamlčení důkazů"
description = "Klam, v němž argument opírá závěr jen o část dostupných údajů a mlčí o těch, které by ho oslabily: struktura, znaky, odlišení od výběru a obrana."
weight = 11
insert_anchor_links = "right"

[taxonomies]
tags = ["fauly", "fauly-predpoklady-argumentu", "fauly-neformalni-klam", "fauly-uziti-dvoji"]
categories = ["academic"]

[extra]
toc = true
risk_level = "high"
lang = "cs"
keywords = ["Zamlčení důkazů", "Suppressed evidence", "zamlčený důkaz", "klam neúplného důkazu", "potlačení důkazů", "Klamy předpokladu", "Argumentační fauly"]
schema_type = "DefinedTerm"
catalog = "fauly"
catalog_schema = 1
catalog_id = "AF-03.11"
catalog_slug = "zamlceni-dukazu"
catalog_family = "predpoklady-argumentu"
catalog_family_code = "03"
catalog_family_title = "Klamy předpokladu"
catalog_family_en = "Fallacies of presumption"
catalog_part = "predpoklady-argumentu.b"
catalog_type = "informal"
catalog_type_cs = "neformální klam"
catalog_en = "Suppressed evidence"
catalog_aliases = ["zamlčený důkaz", "klam neúplného důkazu", "potlačení důkazů"]
catalog_use = "dvoji"
catalog_use_cs = "chyba i taktika"
catalog_risk = "vysoke"
catalog_risk_cs = "vysoké"
catalog_broader = ""
catalog_narrower = []
catalog_depth = 0
catalog_ancestors = []
catalog_related = ["vyber-tresnicek", "zkresleni-preziti", "zkresleny-vyber", "mcnamaruv-klam", "zavadejici-graf", "relativni-a-absolutni-riziko", "vytrzeni-z-kontextu", "argument-z-mlceni", "klam-rovnovahy-dukazu"]
catalog_related_declared = ["vyber-tresnicek", "zkresleny-vyber", "vytrzeni-z-kontextu", "argument-z-mlceni", "zkresleni-preziti"]
catalog_kompendium = ["kompendium/techniques/ea-1-1-1-selektivni-expozice.md", "kompendium/techniques/ea-2-1-5-citation-suppression.md", "kompendium/forensic-legal/_index.md"]
catalog_canonical = ""
catalog_links_prose = ["kompendium/argumentacni-fauly/predpoklady-argumentu/argument-z-neuveritelnosti.md", "kompendium/forensic-legal/_index.md", "kompendium/techniques/ea-1-1-1-selektivni-expozice.md", "kompendium/techniques/ea-2-1-5-citation-suppression.md"]
catalog_prev = "falesna-ekvivalence"
catalog_next = "falesny-kompromis"
catalog_position = 11
catalog_family_size = 20
catalog_sources = ["copi-cohen-mcmahon-2014", "damer-2009", "gilovich-1991", "grice-1975", "huff-1954", "johnson-blair-1977", "kahneman-2011", "mill-1843", "nickerson-1998", "vrij-2008", "walton-2008"]
catalog_sources_primary = ["copi-cohen-mcmahon-2014", "damer-2009", "johnson-blair-1977", "walton-2008"]
catalog_sources_roots = ["grice-1975", "mill-1843"]
catalog_sources_critical = ["gilovich-1991", "huff-1954", "kahneman-2011", "nickerson-1998", "vrij-2008"]
catalog_sections = ["Definice", "Původ a souvislosti", "Struktura argumentu", "Detekční znaky", "Odlišení od platné argumentace", "Stav poznání", "Vztah k technikám kompendia", "Obrana a odpověď"]
catalog_trainer_items = 2
catalog_trainer_benign = 1
catalog_review = "agent"
catalog_data = "data/fauly/predpoklady-argumentu.b.toml"
+++

# Zamlčení důkazů

<!-- kompendium:katalog-hlavicka:begin (scripts/catalogs.py; neupravovat ručně) -->

| Pole | Hodnota |
|------|---------|
| **Identifikátor** | `AF-03.11` |
| **Katalog** | [Argumentační fauly](@/kompendium/argumentacni-fauly/_index.md) |
| **Rodina** | [Klamy předpokladu](@/kompendium/argumentacni-fauly/predpoklady-argumentu/_index.md) |
| **Druh** | neformální klam |
| **Anglicky** | Suppressed evidence |
| **Jiné názvy** | zamlčený důkaz, klam neúplného důkazu, potlačení důkazů |
| **Užití** | chyba i taktika |
| **Riziko zneužití** | vysoké |
| **Stav textu** | text čeká na odbornou recenzi |

<!-- kompendium:katalog-hlavicka:end -->

## Definice

Zamlčení důkazů je klam předpokladu, v němž mluvčí předkládá údaje svědčící pro závěr a
vynechává údaje, které má k dispozici nebo by je při běžné péči měl mít, ačkoli by závěr
oslabily nebo vyvrátily. Jednotlivé premisy mohou být pravdivé. Vadný je předpoklad, který
argument mlčky činí: že předložené údaje jsou celé, nebo aspoň reprezentativní, relevantní
důkazní materiál. Učebnicová tradice řadí takové vady mezi klamy předpokladu, tedy mezi
argumenty, jejichž závěr stojí na neoprávněném předpokladu skrytém v premisách, nikoli na
chybě logické formy (Copi, Cohen a McMahon 2014). Pro kompendium je klam důležitý tím, že
je těžko viditelný. Posluchač hodnotí to, co slyší, a chybějící údaje nevidí. Proto se mu
může zdát argument silný právě v okamžiku, kdy je nejslabší.

## Původ a souvislosti

Myšlenka, že úsudek musí přihlížet k veškerému dostupnému důkazu, je stará jako indukční
logika. John Stuart Mill mezi klamy pozorování zařadil přehlédnutí případů, které by
zobecnění odporovaly: kdo si všímá jen příkladů, jež jeho domněnku potvrzují, nedospívá k
indukci, ale k omylu (Mill 1843). Ve dvacátém století se z téhož principu stal výslovný
požadavek induktivní logiky, známý jako požadavek celkového důkazu, který rozpracoval Rudolf
Carnap: pravděpodobnost hypotézy se má posuzovat vzhledem ke všem relevantním údajům, které
má posuzovatel k dispozici. Teorie neformální logiky vyjadřuje totéž kritériem dostatečnosti.
Johnson a Blair učili posuzovat argumenty podle relevance, dostatečnosti a přijatelnosti
premis (Johnson a Blair 1977) a Damer přidal kritérium vypořádání se s námitkami, podle
něhož dobrý argument nesmí obcházet vážné protidoklady (Damer 2009). Zamlčení důkazů
porušuje obě kritéria zároveň. Má také jazykovou stránku. Podle Griceovy maximy kvantity
posluchač oprávněně předpokládá, že mluvčí sděluje tolik, kolik vyžaduje účel rozhovoru,
a vyvozuje z toho, že to, co nezaznělo, není podstatné (Grice 1975). Výběrová prezentace
této implikatury využívá: neříká nepravdu, ale vyvolává dojem úplnosti.

## Struktura argumentu

Struktura má tři části. První je soubor údajů D1, které závěr podporují a které jsou
předloženy. Druhý je soubor údajů D2, které závěr oslabují, jsou mluvčímu dostupné, ale
zůstávají nevysloveny. Třetí je nevyslovený předpoklad, že D1 představuje celý relevantní
materiál. Závěr by mohl platit vzhledem k D1, ale vzhledem k D1 a D2 dohromady platit
nemusí. Klam tedy nespočívá v tom, co argument říká, ale v tom, jak se vztahuje k důkaznímu
stavu, který mluvčí zná. Statistická popularizace dvacátého století ukázala, jak snadno se
tato struktura skrývá za čísly: průměr bez rozptylu, procento bez základu, srovnání bez
kontrolní skupiny nebo graf bez nepříznivé části časové řady (Huff 1954).

Od příbuzného výběru třešniček se zamlčení liší důrazem. Výběr třešniček popisuje aktivní vyhledávání příznivých příkladů,
zamlčení popisuje vynechání nepříznivých. V praxi jde často o dvě strany téže operace. Od
[argumentu z neuvěřitelnosti](@/kompendium/argumentacni-fauly/predpoklady-argumentu/argument-z-neuveritelnosti.md)
se liší tím, že nepřipouští mezeru v poznání, ale zakrývá poznání, které existuje. Na úrovni
celých informačních prostředí odpovídá zamlčení technice, kterou kompendium popisuje jako
[selektivní expozici](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md): člověk je
dlouhodobě vystavován jen té části světa, která potvrzuje žádaný výklad.

## Detekční znaky

Prvním znakem je asymetrie podrobnosti. Příznivé údaje jsou podány konkrétně, s čísly a
příklady, kdežto o možných protidokladech se mluví obecně, nebo vůbec. Druhým znakem jsou
chybějící jmenovatele: uvádí se, kolik lidí se zlepšilo, ale ne kolik jich bylo celkem,
kolik odpadlo a jak se vedlo srovnatelné skupině. Třetím je časový nebo prostorový výřez,
který začíná a končí právě tam, kde se trend hodí. Čtvrtým je odmítnutí poskytnout podklady,
z nichž byla data vybrána, případně odkaz na interní nebo důvěrné zdroje, které nelze
ověřit. Pátým znakem je reakce na dotaz po nepříznivých údajích: mluvčí ho neodpoví, ale
označí za nedůvěru, útok nebo zdržování. Výzkum klamání rozlišuje mezi výslovnou nepravdou
a jemnějšími formami, k nimž patří zamlčení podstatné informace, a upozorňuje, že ty jemnější
se odhalují obtížněji, protože každé jednotlivé tvrzení obstojí (Vrij 2008). Pozorovatel by
proto neměl hodnotit jen pravdivost vyslovených vět, ale i to, zda odpovídají otázce, kterou
argument skutečně řeší.

## Odlišení od platné argumentace

Ne každé vynechání je klamem. Žádný argument nemůže uvést všechno a výběr je nutnou součástí
každého sdělení. Rozhodující jsou tři okolnosti. Za prvé, relevance vynechaného: klam nastává,
jen když by vynechaný údaj změnil sílu závěru, ne když jde o podrobnost bez vlivu. Za druhé,
dostupnost: mluvčí musí údaj znát nebo ho při přiměřené péči znát měl; kdo poctivě předloží
to, co ví, a hranice svého poznání přizná, klam nepáchá. Za třetí, role v dialogu. Walton
připomíná, že standardy úplnosti se liší podle typu dialogu: v otevřeném hledání pravdy se
od účastníků očekává sdílení všeho podstatného, kdežto v ohlášeném sporu dvou stran se ví,
že každá hájí svou pozici a druhá má prostor doplnit, co chybí (Walton 2008). Advokát, který
v soudní řeči neuvádí argumenty protistrany, proto sám o sobě neklame, protože protistrana
je přítomna a má slovo. Jinak je tomu u znaleckého posudku, lékařské informace pacientovi
nebo vědecké zprávy, kde se od mluvčího očekává vyváženost a kde posluchač druhou stranu
neuslyší. V americkém trestním právu se například povinnost žalobce zpřístupnit obhajobě
důkazy svědčící ve prospěch obviněného spojuje s rozhodnutím Brady v. Maryland; podobné
povinnosti zná většina právních řádů v různé podobě.

## Stav poznání

Psychologie úsudku vysvětluje, proč je zamlčení tak účinné. Lidé mají sklon vyvozovat závěry
z informací, které mají před sebou, a málo se ptají, co chybí; Kahneman tento rys shrnuje
tak, že pro intuitivní myšlení platí jen to, co je vidět, a soudržnost příběhu se zaměňuje
za jeho úplnost (Kahneman 2011). Výzkum konfirmačního zkreslení dokládá, že lidé při
hledání i hodnocení důkazů upřednostňují údaje slučitelné s tím, co už předpokládají, a
nepříznivé údaje přehlížejí nebo podrobují přísnější kontrole (Nickerson 1998). To znamená,
že zamlčení důkazů není jen taktikou druhých, ale i vlastní chybou, ke které má každý sklon.
Gilovich ukazuje, že mnohá mylná přesvědčení vznikají z neúplných a nereprezentativních dat,
u nichž si člověk neuvědomuje, které případy nikdy neviděl (Gilovich 1991). Ve vědě má
stejná struktura podobu publikačního zkreslení: studie s negativním výsledkem se publikují
méně často, takže souhrn dostupné literatury nadhodnocuje účinky. Tento problém se řeší
předregistrací studií a systematickými přehledy, které hledají i nepublikované výsledky.
Odhad, jak velkou část závěrů v konkrétním oboru zamlčení zkresluje, se liší podle oboru
a kompendium ho bez konkrétního zdroje neuvádí.

## Vztah k technikám kompendia

V prostředích, kde jedna strana kontroluje přístup k informacím, se zamlčení důkazů mění z
jednotlivého klamu v systém. Instituce, která rozhoduje, co se publikuje, kdo je citován a
které výsledky se zmíní ve zprávě, může dosáhnout stejného účinku jako výslovná nepravda,
aniž by kdo řekl nepravdivou větu. Kompendium tyto vzorce popisuje u
[potlačování citací](@/kompendium/techniques/ea-2-1-5-citation-suppression.md) a v oddíle o
[forenzním a právním rozměru](@/kompendium/forensic-legal/_index.md), kde je úplnost
důkazního materiálu podmínkou spravedlivého řízení.

## Obrana a odpověď

Základní odpovědí je otázka po jmenovateli a po srovnání. U každého tvrzení o účinku, riziku
nebo trendu se lze ptát, z jakého celku byly údaje vybrány, co se stalo s případy, které
nejsou zmíněny, a s čím se výsledek srovnává. Druhou odpovědí je otázka po nepříznivých
údajích: jaké výsledky by závěru odporovaly a hledal je někdo? Mluvčí, který argumentuje
poctivě, na takovou otázku odpoví věcně a často sám zmíní slabiny. Kritéria dostatečnosti a
vypořádání s námitkami nabízejí jazyk, jímž lze tuto žádost formulovat bez osobního útoku:
nejde o obvinění ze lži, ale o upozornění, že argument zatím nesplňuje podmínky dobrého
argumentu (Damer 2009). Třetí obranou je vlastní kázeň. Protože sklon přehlížet nepříznivé
údaje je obecný, je užitečné u vlastních závěrů výslovně zapisovat, co by je vyvrátilo, a
aktivně to hledat (Nickerson 1998). V klinické, vyšetřovací a právní praxi se ochrana proti
zamlčení opírá o procedury: úplnou dokumentaci, přístup obou stran ke spisu, oddělení toho,
kdo data sbírá, od toho, kdo z nich vyvozuje závěr, a o nezávislé ověření. Kde taková
procedura chybí, je vhodné výslovně uvést, že závěr byl vyvozen z výběru, a jeho váhu tomu
přizpůsobit.

<!-- kompendium:katalog-vazby:begin (scripts/catalogs.py; neupravovat ručně) -->

## Literatura

- Copi, I. M., Cohen, C., & McMahon, K. (2014). *Introduction to Logic* (14. vyd.). Harlow: Pearson.
- Damer, T. E. (2009). *Attacking Faulty Reasoning: A Practical Guide to Fallacy-Free Arguments* (6. vyd.). Belmont: Wadsworth.
- Gilovich, T. (1991). *How We Know What Isn't So: The Fallibility of Human Reason in Everyday Life*. New York: Free Press.
- Grice, H. P. (1975). Logic and conversation. In P. Cole & J. L. Morgan (Eds.), *Syntax and Semantics 3: Speech Acts* (pp. 41–58). New York: Academic Press.
- Huff, D. (1954). *How to Lie with Statistics*. New York: W. W. Norton.
- Johnson, R. H., & Blair, J. A. (1977). *Logical Self-Defense*. Toronto: McGraw-Hill Ryerson.
- Kahneman, D. (2011). *Thinking, Fast and Slow*. New York: Farrar, Straus and Giroux.
- Mill, J. S. (1843). *A System of Logic, Ratiocinative and Inductive*. London: John W. Parker.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*, 2(2), 175–220.
- Vrij, A. (2008). *Detecting Lies and Deceit: Pitfalls and Opportunities* (2. vyd.). Chichester: Wiley.
- Walton, D. N. (2008). *Informal Logic: A Pragmatic Approach* (2. vyd.). Cambridge: Cambridge University Press.

## Související

**Rodina a hierarchie**

- [Klamy předpokladu](@/kompendium/argumentacni-fauly/predpoklady-argumentu/_index.md) – rodina, do níž heslo patří, s přehledem všech jejích hesel

**Příbuzná hesla**

- [Výběr třešniček](@/kompendium/argumentacni-fauly/predpoklady-argumentu/vyber-tresnicek.md) – příbuzné heslo (Klamy předpokladu, Cherry picking)
- [Zkreslení přežitím](@/kompendium/argumentacni-fauly/statisticke/zkresleni-preziti.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Survivorship bias)
- [Zkreslený výběr](@/kompendium/argumentacni-fauly/statisticke/zkresleny-vyber.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Sampling bias)
- [McNamarův klam](@/kompendium/argumentacni-fauly/statisticke/mcnamaruv-klam.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, McNamara fallacy)
- [Zavádějící graf](@/kompendium/argumentacni-fauly/statisticke/zavadejici-graf.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Misleading graph)
- [Záměna relativního a absolutního rizika](@/kompendium/argumentacni-fauly/statisticke/relativni-a-absolutni-riziko.md) – příbuzné heslo (Statistické a pravděpodobnostní klamy, Relative versus absolute risk)
- [Vytržení z kontextu](@/kompendium/argumentacni-fauly/jazykove-klamy/vytrzeni-z-kontextu.md) – příbuzné heslo (Klamy jazyka a dvojznačnosti, Quoting out of context)
- [Argument z mlčení](@/kompendium/argumentacni-fauly/dialekticke-taktiky/argument-z-mlceni.md) – příbuzné heslo (Rétorické a dialogické taktiky, Argument from silence)
- [Klam rovnováhy důkazů](@/kompendium/argumentacni-fauly/hodnoty-a-veda/klam-rovnovahy-dukazu.md) – příbuzné heslo (Klamy hodnot, přírody a vědy, Balance-of-evidence fallacy)

**V kompendiu**

- [EA-1.1.1 Selektivní expozice](@/kompendium/techniques/ea-1-1-1-selektivni-expozice.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [EA-2.1.5 Potlačování citací (citation suppression)](@/kompendium/techniques/ea-2-1-5-citation-suppression.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí
- [Forenzní a právní rozměr EA](@/kompendium/forensic-legal/_index.md) – stránka knihy, na které se toto heslo projevuje nebo s ní souvisí

**V katalogu**

- [Falešná ekvivalence](@/kompendium/techniques/ea-1-2-2-falesna-ekvivalence.md) – předchozí heslo rodiny
- [Falešný kompromis](@/kompendium/argumentacni-fauly/predpoklady-argumentu/falesny-kompromis.md) – další heslo rodiny
- [Trenér rozpoznávání](@/kompendium/trener.md) – procvičení rozpoznání tohoto hesla na příkladech výroků

<!-- kompendium:katalog-vazby:end -->
