+++
title = "PubMed/MeSH výzkumná terminologie"
description = "Jak hledat literaturu o psychické manipulaci a kontrole v PubMed a dalších databázích: MeSH, volný text, české zdroje a typické chyby vyhledávání."
weight = 37

[taxonomies]
tags = ["kompendium", "international", "terminology"]
categories = ["academic", "international"]

[extra]
parent = "kompendium-international"
toc = true
+++

# PubMed/MeSH výzkumná terminologie

> **Rámec**: biomedicínské a psychologické databáze · **Oblast**: výzkumná terminologie
> Stránka popisuje, jak převést pojmy této knihy do vyhledávacích dotazů. Neuvádí hotové
> „správné“ deskriptory: tezaury se každoročně mění, a proto každý termín ověřte
> v aktuální verzi MeSH Browseru.

## 1. Účel a rozsah

PubMed je volně přístupné rozhraní americké Národní lékařské knihovny (NLM) k databázi
MEDLINE a dalším zdrojům. Články v MEDLINE jsou indexovány řízeným slovníkem MeSH
(*Medical Subject Headings*), který NLM udržuje a jednou ročně aktualizuje. MeSH je
hierarchický: deskriptory jsou uspořádány do stromů, mají synonyma (*entry terms*)
a lze je zpřesnit podhesly (*subheadings*). Pro psychologii je klíčová databáze APA
PsycInfo s vlastním tezaurem (*Thesaurus of Psychological Index Terms*), pro biomedicínu
Embase s tezaurem Emtree, pro ošetřovatelství CINAHL.

V České republice udržuje Národní lékařská knihovna český překlad MeSH a databázi české
lékařské literatury Bibliographia medica Čechoslovaca (BMČ). Stránka je určena
výzkumníkům, studentům a klinikům, kteří připravují přehled literatury, a navazuje na
stránku [Reprodukční krize a EA výzkum](@/kompendium/critical-perspectives/7-replication-EA-research.md).

## 2. Proč je terminologie problém

Pojmy, s nimiž kniha pracuje, vznikly z velké části v praxi, publicistice a filozofii,
nikoli v medicíně. [Gaslighting](@/glossary/gaslighting.md), [love bombing](@/glossary/love-bombing.md),
[DARVO](@/glossary/darvo.md) nebo [epistemická injustice](@/glossary/epistemicka-injustice.md)
proto pravděpodobně nemají vlastní deskriptor MeSH a jsou dohledatelné jen volným textem
v názvu a abstraktu. Naopak pojmy s dlouhou klinickou tradicí (domácí násilí, PTSD,
disociativní poruchy, týrání dětí) deskriptory mají, ale indexátor je přiřazuje podle
tématu článku, ne podle slov autora. Článek o [coercive control](@/glossary/coercive-control.md)
tak může být indexován pod obecnější heslo o partnerském násilí.

Indexace navíc přichází se zpožděním a nejnovější články mohou být zatím bez deskriptorů.
Kdo hledá jen podle MeSH, přehlédne nové práce; kdo hledá jen volným textem, utone
v nerelevantních výsledcích. Potřeba je obojí.

## 3. Přehled ekvivalentů

Následující tabulka uvádí **kandidátní** řízené termíny a volnotextová slova. U každého
řízeného termínu ověřte v MeSH Browseru, zda existuje, jak přesně zní, od kterého roku
a kam ve stromu patří.

| Pojem knihy | Kandidátní řízený termín (ověřte v MeSH) | Volný text pro název/abstrakt |
|---|---|---|
| [coercive control](@/glossary/coercive-control.md) | heslo pro partnerské a domácí násilí; heslo pro nátlak (*coercion*) | "coercive control", "controlling behavio*" |
| [gaslighting](@/glossary/gaslighting.md) | pravděpodobně bez vlastního deskriptoru | gaslighting, "reality distortion" |
| psychické násilí | heslo pro psychické zneužívání (ověřte rok zavedení) | "psychological abuse", "emotional abuse" |
| [komplexní PTSD](@/glossary/c-ptsd.md) | heslo pro posttraumatickou stresovou poruchu | "complex PTSD", CPTSD, "disturbances in self-organi*" |
| [disociace](@/glossary/disociace.md) | heslo pro disociativní poruchy | dissociat* |
| [trauma ze zrady](@/glossary/betrayal-trauma.md) | pravděpodobně bez vlastního deskriptoru | "betrayal trauma" |
| [trauma bonding](@/glossary/trauma-bonding.md) | pravděpodobně bez vlastního deskriptoru | "trauma bond*", "traumatic bond*" |
| [skupina s vysokou mírou kontroly](@/glossary/high-control-group.md) ([model BITE](@/glossary/bite-model.md)) | heslo pro kulty či náboženské skupiny (ověřte) | cult*, "high-control group*", "coercive group*" |
| [zneužívání seniorů](@/glossary/elder-abuse.md) | heslo pro týrání seniorů | "elder abuse", "financial exploitation" |
| [undue influence](@/glossary/undue-influence.md) | spíše právní databáze | "undue influence" |
| dezinformace, [propaganda](@/glossary/propaganda.md) | heslo pro komunikaci a dezinformace (ověřte) | disinformation, misinformation |

## 4. Typické chyby a falešní přátelé

- **Kódy deskriptorů z druhé ruky.** Identifikátory MeSH (řetězce začínající písmenem D)
  opisované z webů bývají chybné nebo zastaralé. Kód citujte jen ověřený.
- **Spoléhání na automatické mapování.** PubMed převádí zadané slovo na deskriptor
  (*Automatic Term Mapping*); výsledek je dobré zkontrolovat v podrobnostech dotazu.
  Mapování může dotaz rozšířit tam, kam nechcete.
- **Nepromyšlená exploze termínu.** Vyhledávání podle deskriptoru standardně zahrnuje
  i podřazené termíny; to je žádoucí u obecných hesel, ale může přinést tisíce
  nerelevantních záznamů.
- **České slovo v anglickém poli.** Česká klíčová slova autorů v BMČ nemusejí odpovídat
  českému překladu MeSH; hledejte obojí.
- **Populární výrazy.** „Narcissistic abuse“ nebo „toxic relationship“ vrátí převážně
  populární a nerecenzované texty; viz [Populární terminologie pro veřejnost](@/kompendium/international/38-popular-terminology-public/index.md).
- **Jeden pojem, více významů.** *Coercion* se v literatuře užívá i pro donucovací
  postupy v psychiatrii (nedobrovolná hospitalizace, omezovací prostředky); srov.
  [Coerce léčba a EA framework](@/kompendium/critical-perspectives/16-treatment-coercion-risk.md).

## 5. Doporučený postup

1. **Rozložit otázku na bloky.** Například populace (dospělí po odchodu ze skupiny),
   expozice (kontrola, manipulace), výsledek (PTSD, disociace). Každý blok sestavit
   z řízených termínů i volného textu spojených operátorem OR, bloky spojit AND.
2. **Ověřit každý řízený termín** v MeSH Browseru: definici (*scope note*), synonyma,
   umístění ve stromu a rok zavedení.
3. **Prohledat více databází** – PubMed, PsycInfo, Embase, u právních otázek právní
   databáze, u české literatury BMČ – a pro každou upravit syntax.
4. **Dokumentovat strategii** tak, aby byla opakovatelná: databáze, datum, přesné dotazy,
   počty výsledků. Systematické přehledy se řídí doporučením PRISMA 2020, protokol lze
   registrovat v PROSPERO, metodiku popisuje *Cochrane Handbook*; kvalitu důkazů hodnotí
   systém GRADE.
5. **Nechat strategii posoudit** knihovníkem nebo kolegou; terminologické mezery bývají
   vidět až zvenku.
6. **Číst definice ve studiích.** I když dva články užívají stejný termín, mohou měřit různé
   věci; viz [EN překladové výzvy EA](@/kompendium/international/33-en-translation-issues/index.md).

## 6. Modelová situace

*Anonymizovaný kompozitní příklad.* Doktorandka zkoumá dopady donucující kontroly na
paměť a sebedůvěru obětí. Úvodní dotaz „coercive control“ v PubMed vrátí několik set
záznamů, z nichž část se týká nedobrovolné psychiatrické péče. Doktorandka proto sestaví
tři bloky (partnerské vztahy, kontrolující chování, kognitivní a epistemické dopady),
každý z kandidátních deskriptorů ověřených v MeSH Browseru a z volného textu, a dotaz
zopakuje v PsycInfo s termíny jeho tezauru. Pro českou část hledá v BMČ česky i anglicky.
Strategii si nechá zkontrolovat knihovnicí, která doplní chybějící synonymum. Výsledky
neinterpretuje jako odhad výskytu, protože studie užívají různé definice (srov.
[Self-report instrumenty](@/kompendium/06-klinicke-aplikace/self-report-instrumenty.md)).

## 7. Meze a otevřené otázky

Řízené slovníky odrážejí stav oboru v době, kdy vznikly; nové pojmy se do nich dostávají
pomalu, a co nemá deskriptor, je ve výzkumu méně viditelné. To samo je druh strukturální
nerovnosti: výzkum o psychickém násilí je roztříštěný mezi medicínu, psychologii,
kriminologii, právo a filozofii, které užívají odlišné tezaury. Velká část praktického
poznání (zprávy organizací pomoci obětem, šedá literatura) v databázích chybí úplně.
Otevřené je i to, jak literaturu hodnotit eticky (viz [Publikační etika v EA literatuře](@/kompendium/critical-perspectives/20-publication-ethics-EA.md)
a [Výzkumná exploatace v EA studiích](@/kompendium/critical-perspectives/19-research-exploitation.md)).

## Související

**Terminologie**

- [WHO klinická terminologie EA](@/kompendium/international/36-clinical-terminology-WHO/index.md)
  – klinické pojmy, které se v MeSH promítají.
- [Mnohojazyčné zdroje EA](@/kompendium/international/40-multilingual-resources/index.md)
  – terminologické databáze mimo medicínu.
- [Česko-anglická terminologie EA](@/kompendium/international/31-cs-en-terminology/index.md)
  – převod českých pojmů do anglických dotazů.

**Výzkum a etika**

- [Financování výzkumu EA](@/kompendium/population-health/29-research-funding-EA.md) –
  proč některá témata mají málo literatury.
- [Otázka validity souhlasu v EA výzkumu](@/kompendium/critical-perspectives/15-consent-validity-question.md)
  – etika výzkumu s oběťmi.
- [Otevřené výzkumné otázky](@/kompendium/07-teoreticke-reflexe/otevrene-otazky.md) –
  kde literatura chybí.

**Pojmy**

- [Replication crisis](@/glossary/replication-crisis.md) – proč jedna studie nestačí.
- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – riziko hledat jen to, co potvrdí
  hypotézu.
