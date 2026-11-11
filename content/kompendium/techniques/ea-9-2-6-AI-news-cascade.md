+++
title = "EA-9.2.6 AI News Cascade"
description = "Vzorec, v němž síť generovaných „zpravodajských“ webů publikuje a vzájemně cituje zprávy o události, která se nestala, a vyrábí tak zdání mnohozdrojového pokrytí."
weight = 926

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-2", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-2-3-synthetic-text-narrative", "ea-9-2-8-AI-eyewitness-fabrication", "ea-9-4-7-cross-platform-bot-cascade"]
ea_code = "EA-9.2.6"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.2 Generativní média"
section_icon = "🎬"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.2.6 AI News Cascade

> *Subkategorie 🎬 **9.2 Generativní média** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.2.6`
**Název:** AI News Cascade
**Subkategorie:** 9.2 Generativní média
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High

## 2. Definice

*AI news cascade* je kaskáda generovaných článků ve zpravodajském stylu, které publikuje síť webů napodobujících média; články se navzájem citují a vytvářejí dojem, že o události (často smyšlené nebo zásadně zkreslené) informuje mnoho nezávislých redakcí. Agregátory a sociální sítě pak kaskádu dále zesilují.

## 3. Mechanismus (strukturálně)

Vzorec padělá to, podle čeho čtenář pozná důvěryhodnou zprávu: zpravodajský styl, název připomínající médium, odkazy na „další zdroje“. Protože weby citují jeden druhého, vede ověřování v kruhu a čtenář, který „si to ověřil na třech webech“, ve skutečnosti potkal tentýž zdroj třikrát. Generování textu umožňuje provozovat desítky takových webů s minimálními náklady. Jde o kombinaci [EA-9.2.3 Synthetic Text Narrative](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md) a [cirkularity citací](@/kompendium/detection-signatures/18-network-citation-circularity.md).

## 4. Detekční markery

- Weby bez tiráže, bez jmen redaktorů a kontaktů; domény registrované nedávno a hromadně.
- Články různých webů mají stejnou strukturu, obrázky a citáty, liší se jen formulacemi.
- Odkazy vedou mezi weby téže sítě; žádný nevede k primárnímu zdroji (úřad, svědek, dokument).
- Zavedená média o události neinformují, nebo ji uvádějí jako nepotvrzenou.
- Publikace přichází v krátkém časovém okně a pak se síť odmlčí.

## 5. Odlišení

*Přebírání agenturní zprávy*: mnoho médií publikuje tutéž zprávu, ale s uvedením zdroje (agentury), který existuje. *Obsahové farmy*: generují text pro reklamu bez konkrétního narativu; kaskáda má směr. *[EA-9.2.8 AI Eyewitness Fabrication](@/kompendium/techniques/ea-9-2-8-AI-eyewitness-fabrication.md)*: smyšlený obrazový „důkaz“ události; kaskáda dodává textové „pokrytí“.

## 6. Dopad a rámec

Kaskáda může vyvolat paniku, ovlivnit trhy nebo poškodit pověst konkrétních osob a institucí, než se stihne ověřit. Zároveň oslabuje důvěru ve zpravodajství jako celek. Právně se uplatní pravidla o šíření poplašné zprávy, pomluvě nebo manipulaci trhu podle okolností; z hlediska regulace jde o oblast transparentnosti platforem a vlastnictví médií ([Regulace platforem](@/kompendium/population-health/25-platform-regulation-EA.md)).

## 7. Obrana a zotavení

*Čtenář*: ověřit, kdo za webem stojí (tiráž, redakce, historie), a hledat primární zdroj, ne další weby. *Redakce a fact-checkeři*: mapovat síť webů, zveřejňovat vazby a postup ověření. *Agregátory a vyhledávače*: snižovat dosah webů bez transparentního vlastnictví a redakce. *Instituce zmíněné ve zprávě*: reagovat rychle oficiálním kanálem a odkazem na ověřitelná fakta.

## 8. Příklad (anonymizovaný kompozit)

Během jednoho odpoledne se na desítce webů s názvy připomínajícími regionální noviny objeví zpráva o údajné kontaminaci pitné vody v okresním městě. Články citují „místní úřady“ a navzájem na sebe odkazují. Lidé začnou skupovat balenou vodu. Vodárna a hygienická stanice zveřejní výsledky rozborů; redakce zjistí, že všechny weby byly zaregistrovány v posledním měsíci a sdílejí hostitelskou infrastrukturu.

## 9. Meze a otevřené otázky

Ne každý web bez tiráže je součástí kaskády a malá nezávislá média mohou mít podobné znaky. Rozhoduje síťová analýza, ne jednotlivý znak. Otevřené zůstává, jak rychle lze kaskádu zachytit dřív, než způsobí škodu.

Výzkum má k dispozici převážně analýzy jednotlivých sítí; srovnávací data o tom, kolik takových sítí existuje a jak velký mají dosah, chybějí, a kniha proto neuvádí odhady. Otevřená zůstává i otázka, jak by agregátory a vyhledávače měly zacházet s weby, které nejsou zjevně falešné, ale nemají transparentní vlastnictví – plošné omezení by poškodilo i malá nezávislá média.

Otevřená zůstává i role jazykových modelů, které mohou obsah kaskády převzít a dál ho šířit v odpovědích, což propojuje tento vzorec se smyčkou popsanou v [EA-9.1.10](@/kompendium/techniques/ea-9-1-10-llm-recursion-loop.md).

Zjištění, že se zdroje citují v kruhu, vypovídá o jejich nezávislosti, nikoli o pravdivosti sdělení. Kaskáda může nést i tvrzení, které je náhodou nebo částečně pravdivé; cirkularita ruší jeho doloženost, ne jeho obsah, a ověřování proto musí pokračovat u primárního pramene, ne skončit odhalením sítě. Rovněž z ní neplyne, kdo síť provozuje: týž znak zanechá státní vlivová operace, obchodní zákazník i jediný provozovatel reklamních webů, a přiřazení aktéra vyžaduje jiné důkazy než obsahovou analýzu. A konečně mlčení zavedených médií není samostatným argumentem v žádném směru – o skutečné místní události mohou mlčet také.

## 10. Pohled zevnitř a práce s postiženým

Čtenář, který podle kaskády jednal, často pociťuje vztek – na weby i na sebe. Pomáhá vysvětlit, že ověřování „na více webech“ bylo rozumné, jen mu chyběla otázka nezávislosti. Pro komunity, které kaskáda zasáhla (panika, obviňování konkrétních lidí), je důležitá rychlá a srozumitelná komunikace místních autorit.

Pro jednotlivce obviněné v kaskádě je klíčová rychlá veřejná oprava a právní pomoc; jejich zkušenost se podobá mediálnímu útoku davu a zaslouží si podobnou psychologickou podporu, protože dozvuky obvinění přetrvávají ve vyhledávání ještě dlouho po vyvrácení.

## 11. Vztah k ostatním kategoriím EA

Vzorec je automatizovanou podobou [EA-2.3.5 Pseudo-kontroverze Amplifikace](@/kompendium/techniques/ea-2-3-5-pseudo-kontroverze-amplifikace.md): spor nebo událost se vyrobí a zesílí, dokud se o nich „nemluví všude“. Cirkulární odkazování mezi weby připomíná [EA-2.1.9 Pseudo-konsenzus vytvoření](@/kompendium/techniques/ea-2-1-9-pseudo-konsenzus-vytvoreni.md), jen místo odborníků vystupují fiktivní redakce.

## 12. Postup při podezření na kaskádu

1. **Zjistit provozovatele** webů – tiráž, registrace domény, kontakty.
2. **Zmapovat odkazy** mezi weby a hledat primární zdroj.
3. **Ověřit u institucí**, které jsou ve zprávě citovány.
4. **Zveřejnit mapu sítě** a výsledek ověření.
5. **Upozornit agregátory** a platformy na síť webů.

## 13. Prevence a odolnost

Odolnost publika stojí na návyku zjistit, kdo za zpravodajským webem stojí, a na znalosti několika důvěryhodných zdrojů pro místní i celostátní zprávy. Instituce mohou kaskádám předcházet pravidelnou a srozumitelnou komunikací, díky níž mají lidé kam se obrátit. Pro redakce je prevencí transparentnost – tiráž, jména redaktorů, opravy –, která je odlišuje od napodobenin. Agregátory a vyhledávače mohou snížit dosah webů bez transparentního vlastnictví. Pro školy je vhodné zařadit nácvik ověřování zpravodajských webů do mediální výchovy už na základním stupni.

## Odborný kontext

Wardle a Derakhshan (2017) zdůraznili, že informační poruchu je třeba zkoumat v celém řetězci – aktér, sdělení, interpret – a že stejné sdělení může v různých fázích šíření měnit povahu. Kaskáda generovaných zpráv cílí především na fázi interpretace: čtenář, který ověřuje „na více webech“, uplatňuje rozumnou strategii, ale nezná vztahy mezi zdroji. Wineburg a McGrew (2019) ukázali, že profesionální ověřovatelé místo čtení podezřelé stránky zjišťují, kdo za ní stojí a co o ní říkají jiní; právě tento postup kaskádu rychle odhalí.

Benkler, Faris a Roberts (2018) na americkém mediálním prostředí doložili, že dezinformace se nejúčinněji šíří tam, kde existuje uzavřený ekosystém médií, která se navzájem citují a nepodléhají vnější korekci. Kaskáda generovaných webů je umělou výrobou takového ekosystému. Paul a Matthews (2016) popsali, že mnohost kanálů a opakování zvyšují přesvědčivost i u nekonzistentních sdělení.

## Souvislosti pro praxi

Pro redakce a fact-checkingové organizace je užitečné průběžně mapovat sítě webů bez transparentního vlastnictví a sdílet je s ostatními. Pro úřady a firmy zmíněné v kaskádě je klíčová rychlá reakce oficiálním kanálem s odkazem na ověřitelná fakta. Pro školy je kaskáda vhodným příkladem k nácviku laterálního čtení: žáci zjišťují, kdo za webem stojí, místo aby četli jeho obsah.

## Literatura

- Benkler, Y., Faris, R., & Roberts, H. (2018). *Network [Propaganda](@/glossary/propaganda.md): Manipulation, Disinformation, and Radicalization in American Politics*. Oxford University Press.
- Paul, C., & Matthews, M. (2016). *The Russian „[Firehose of Falsehood](@/glossary/firehose-of-falsehood.md)“ Propaganda Model*. RAND Corporation.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder*. Council of Europe.
- Wineburg, S., & McGrew, S. (2019). Lateral reading and the nature of expertise. *Teachers College Record*.

## Související

**Sourozenecké techniky**

- [EA-9.2.3 Synthetic Text Narrative](@/kompendium/techniques/ea-9-2-3-synthetic-text-narrative.md) – hromadně generovaný text.
- [EA-9.2.8 AI Eyewitness Fabrication](@/kompendium/techniques/ea-9-2-8-AI-eyewitness-fabrication.md) – obrazový „důkaz“ smyšlené události.
- [EA-9.4.7 Cross-Platform Bot Cascade](@/kompendium/techniques/ea-9-4-7-cross-platform-bot-cascade.md) – šíření napříč platformami.

**Detekce**

- [Detekční signatura: Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – weby citující samy sebe.
- [Detekční signatura: Asymetrie amplifikace](@/kompendium/detection-signatures/19-network-amplification-asymmetry.md) – dosah bez opory.

**Obrana a teorie**

- [Sebe-obrana: Rutina cross-source](@/kompendium/self-defense-guides/36-cross-source-routine.md) – ověřování nezávislých zdrojů.
- [Herman & Chomsky: Propaganda model](@/kompendium/07-teoreticke-reflexe/herman-chomsky-propaganda-model.md) – filtry zpravodajství.
