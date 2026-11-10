+++
title = "EA-9.1.6 LLM Source Attribution Bypass"
description = "Vzorec, v němž jazykový model k tvrzení „doplní“ věrohodně vypadající, ale smyšlené nebo zkreslené zdroje, které pak slouží jako krytí. Znaky, odlišení, obrana."
weight = 916

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-1-1-llm-hallucination-laundering", "ea-9-1-7-synthetic-expertise-claim", "ea-9-2-9-AI-document-forgery"]
parent = "kompendium-techniques"
ea_code = "EA-9.1.6"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.6 LLM Source Attribution Bypass

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.6`
**Název:** LLM Source Attribution Bypass
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*Source attribution bypass* je vzorec, v němž jazykový model připojí k tvrzení citace, které neexistují, nebo přisoudí skutečnému autorovi dílo či výrok, který nikdy nevznikl. Výsledný text vypadá jako doložený a citace slouží jako krytí pro tezi, jež by bez nich neobstála. Typicky vzniká při zadání „doplň zdroje“ k předem dané tezi.

## 3. Mechanismus (strukturálně)

Model generuje citace stejně jako ostatní text: podle toho, jak citace v daném oboru obvykle vypadají. Proto bývají smyšlené odkazy formálně bezchybné – reálné jméno autora, věrohodný časopis, rok, rozsah stran. Čtenář, který nemá čas zdroje ověřovat, bere počet a formu citací jako známku kvality. Vzorec tím obrací funkci citace: místo cesty k ověření se z ní stává ornament autority, což je jádro [reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md).

## 4. Detekční markery

- DOI nevedou nikam nebo vedou na jiný článek; URL vrací chybu nebo nesouvisející stránku.
- Autor existuje, ale v jeho bibliografii dílo chybí; časopis v daném roce takové číslo nevydal.
- Citace jsou příliš „přesné“ k tezi – každá potvrzuje přesně to, co text tvrdí.
- Text s mnoha citacemi neobsahuje jediný přímý citát ani konkrétní údaj ze zdroje.
- Po upozornění autor místo opravy nabídne jinou, opět neověřitelnou citaci.

## 5. Odlišení

*Citační chyba*: překlep v roce či stránce u existujícího díla; zdroj lze dohledat. *[EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md)*: vymyšlená je teze; zde je teze vložena a vymyšlena je její opora. *Predátorské časopisy*: zdroj existuje, ale má nízkou kvalitu; jde o jiný problém hodnocení zdroje.

## 6. Dopad a rámec

Vzorec poškozuje především odborné prostředí: posudky, žádosti, studentské práce, právní podání a novinářské texty s neexistujícími zdroji. Kromě ztráty důvěryhodnosti může mít disciplinární a právní následky (plagiát, vědecký podvod, nepravdivé tvrzení v podání). Pro čtenáře zasaženého opakovaně vede k paušální nedůvěře k citacím jako takovým.

## 7. Obrana a zotavení

*Čtenář a recenzent*: ověřovat vzorek citací – existenci díla, autora a to, zda zdroj opravdu říká, co se mu připisuje. *Instituce*: vyžadovat u odborných textů prohlášení o použití AI a namátkovou kontrolu zdrojů. *Autor*: do textu přebírat jen citace, které sám otevřel a přečetl. *Vzdělávání*: učit [hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md) jako práci se zdrojem, ne s jeho formou.

## 8. Příklad (anonymizovaný kompozit)

Do připomínkového řízení dorazí obsáhlé stanovisko s dvaceti odkazy na odborné studie. Úředník ověří pět z nich: dvě neexistují, jedna existuje, ale tvrdí opak, dvě jsou v pořádku. Stanovisko bylo zjevně sestaveno s pomocí modelu, kterému autor zadal tezi a požádal o „podložení literaturou“. Úřad stanovisko nevyřadí, ale vyzve autora k doložení zdrojů; ten část tvrzení stáhne.

## 9. Meze a otevřené otázky

Smyšlené citace nevznikají jen s AI – lidé je vytvářeli i dříve. Novinkou je jejich množství a formální dokonalost. Otevřenou otázkou je, jak sladit ověřování citací s kapacitou recenzentů a úřadů.

Pro výzkum zůstává otevřené, jak často se smyšlené citace dostávají do recenzovaných publikací a do právních podání; dostupné jsou zatím jednotlivé zdokumentované případy, nikoli systematická data. Kniha proto neuvádí odhady a doporučuje ověřovat citace jako běžnou součást posuzování.

## 10. Pohled zevnitř a práce s postiženým

Student nebo odborník, kterému byly smyšlené citace prokázány, prožívá často silný stud a strach z následků; někdy si původ citací ani neuvědomoval. Vedoucí práce a instituce by měli odlišit úmyslný podvod od nedbalosti a nabídnout cestu k nápravě – přepracování, doložení, školení. Čtenáři, který na smyšlený zdroj spoléhal, pomůže vědět, že chyba nebyla v jeho důvěře k vědě, ale v padělku, který se za vědu vydával.

Pro studenty je užitečné vědět, že přiznání chyby a oprava citací jsou běžnou součástí akademické práce a že instituce rozlišují mezi nedbalostí a podvodem.

## 11. Postup při ověřování citací

1. **Vybrat vzorek** citací, včetně těch nejdůležitějších pro argument.
2. **Ověřit existenci** díla v katalogu, databázi nebo u vydavatele.
3. **Otevřít zdroj** a zkontrolovat, zda říká, co se mu připisuje.
4. **Vyzvat autora** k doložení sporných citací.
5. **Rozhodnout o důsledcích** podle povahy chyby – oprava, přepracování, řízení.

## 12. Prevence a odolnost

Prevence stojí na jasných pravidlech odpovědnosti za citace, na vzdělávání v práci se zdroji a na časové kapacitě recenzentů a vedoucích prací, kteří citace ověřují. Pro autory je nejjednodušší ochranou zásada citovat jen to, co sami otevřeli a přečetli. Knihovny a univerzity mohou pomoci dostupnými nástroji pro ověřování existence publikací a jasnými postupy pro případ, že se smyšlené citace objeví v již odevzdané nebo publikované práci.

## Odborný kontext

Smyšlené citace jsou dobře doloženou podobou halucinace jazykových modelů: přehledová literatura je řadí mezi chyby, kdy model generuje údaje, které ve vstupu ani ve světě nemají oporu, a upozorňuje, že u citací je chyba zvlášť zrádná, protože formální úprava působí věrohodně (Ji et al. 2023). Bender et al. (2021) obecněji varují, že plynulost textu svádí čtenáře k přisouzení znalosti a záměru, které model nemá.

Citace je ve vědecké a právní praxi především slibem ověřitelnosti. Kde se z ní stane ornament, ztrácí čtenář hlavní nástroj, jak posoudit tvrzení, a přechází na hodnocení formy. Wineburg a McGrew (2019) ukázali, že i vzdělaní čtenáři – studenti a akademici – posuzují zdroje podle vzhledu a interních znaků, zatímco profesionální ověřovatelé okamžitě zjišťují, co o zdroji vědí jiní. Tento rozdíl vysvětluje, proč smyšlené citace obstojí u běžného čtenáře a neobstojí u zkušeného recenzenta.

Pro instituce z toho plyne praktický závěr: ověřování citací je třeba chápat jako běžnou součást posuzování textu, nikoli jako výjimečné podezření. Namátková kontrola existence a obsahu několika zdrojů je levná a odhalí většinu případů.

## Souvislosti pro praxi

Univerzity, redakce a úřady by měly mít jasné pravidlo, kdo za citace odpovídá: autor textu, bez ohledu na to, jaký nástroj použil. Pravidlo by mělo rozlišovat nedbalost (neověřené citace z nástroje) od úmyslného podvodu a nabízet přiměřené důsledky – přepracování, opravu, v závažných případech disciplinární řízení. Recenzenti a vedoucí prací potřebují čas a podporu na ověřování; bez nich zůstane požadavek kontroly jen formální a smyšlené zdroje budou dál procházet.

## Literatura

- Bender, E. M., Gebru, T., McMillan-Major, A., & Shmitchell, S. (2021). On the dangers of stochastic parrots: Can language models be too big? *Proceedings of FAccT 2021*.
- Ji, Z. et al. (2023). Survey of hallucination in natural language generation. *ACM Computing Surveys*.
- Wineburg, S., & McGrew, S. (2019). Lateral reading and the nature of expertise. *Teachers College Record*.

## Související

**Sourozenecké techniky**

- [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md) – vymyšlená teze místo vymyšlené opory.
- [EA-9.1.7 Synthetic Expertise Claim](@/kompendium/techniques/ea-9-1-7-synthetic-expertise-claim.md) – citace jako součást předstírané odbornosti.
- [EA-9.2.9 AI Document Forgery](@/kompendium/techniques/ea-9-2-9-AI-document-forgery.md) – padělaný dokument místo padělané citace.

**Detekce**

- [Detekční signatura: Reputation laundering](@/kompendium/detection-signatures/23-network-reputation-laundering.md) – autorita propůjčená zdrojem.
- [Detekční signatura: Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – citace, které vedou samy na sebe.

**Obrana**

- [Sebe-obrana: Hodnocení důkazů](@/kompendium/self-defense-guides/2-evidence-evaluation.md) – co zdroj skutečně říká.
- [Sebe-obrana: Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) – postup ověření jednotlivého údaje.

**Pojmy**

- [Evidence-based](@/glossary/evidence-based.md) – co znamená opřít tvrzení o důkaz.
