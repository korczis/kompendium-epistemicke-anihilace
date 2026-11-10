+++
title = "EA-9.2.9 AI Document Forgery"
description = "Vzorec, v němž generované smlouvy, e-maily, memoranda nebo úřední dopisy napodobují skutečné dokumenty a slouží v podvodech, sporech a fingovaných „únicích“."
weight = 929

[taxonomies]
tags = ["kompendium", "techniques", "ea-9-2", "digitalni", "ai"]
categories = ["academic", "digital", "ai"]

[extra]
related_terms = ["ea-9-2-4-image-manipulation-EA", "ea-9-2-10-AI-personhood-claim", "ea-9-1-6-llm-source-attribution-bypass"]
parent = "kompendium-techniques"
ea_code = "EA-9.2.9"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.2 Generativní média"
section_icon = "🎬"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.2.9 AI Document Forgery

> *Subkategorie 🎬 **9.2 Generativní média** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.2.9`
**Název:** AI Document Forgery
**Subkategorie:** 9.2 Generativní média
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**[Doctrine](@/glossary/doctrine.md) alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

## 2. Definice

*AI document forgery* je padělání dokumentů – smluv, e-mailů, interních memorand, úředních dopisů, výpisů – pomocí generativních nástrojů, které napodobují styl, formát i grafickou úpravu skutečného původce (hlavičkový papír, razítka, podpisy, typický jazyk). Padělek se pak použije jako důkaz v podvodu, právním sporu nebo jako údajný „únik“ v médiích.

## 3. Mechanismus (strukturálně)

Dokument nese autoritu instituce, která ho údajně vydala. Ověřování se v praxi zaměřuje na vnější znaky (hlavička, podpis, styl), a ty lze dnes levně napodobit. Generativní nástroje navíc zvládají jazyk konkrétní instituce, takže padělek „zní“ správně. V mediálním prostředí funguje fingovaný únik obzvlášť dobře, protože potvrzuje to, co publikum o instituci už podezírá; vyvrácení instituce pak působí jako zapírání. Vzorec tak spojuje padělání s [konfirmačním biasem](@/glossary/konfirmacni-bias.md) publika.

## 4. Detekční markery

- Dokument existuje jen jako snímek nebo PDF bez elektronického podpisu; originál nelze dohledat v evidenci původce.
- Formální nesrovnalosti: chybná čísla jednací, neexistující útvar, nesprávná funkce podepisujícího, chybné datum.
- Metadata souboru neodpovídají údajnému vzniku (software, autor, čas).
- Obsah přesně potvrzuje narativ šiřitele a obsahuje formulace, které by instituce obvykle nepoužila.
- „Únik“ přichází z anonymního zdroje bez možnosti ověření a v citlivém okamžiku.

## 5. Odlišení

*Skutečný únik*: dokument lze ověřit u původce, v evidenci nebo z nezávislých zdrojů; instituce ho obvykle nepopírá věcně. *Chyba v dokumentu*: překlep nebo chybné číslo ve skutečném dokumentu; původce ho uzná. *[EA-9.1.6 Source Attribution Bypass](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md)*: smyšlená citace, ne padělaný dokument.

## 6. Dopad a rámec

Padělky se uplatňují v obchodních podvodech (falešná faktura, změna účtu), v rodinných a pracovních sporech i v politických kampaních. Právně jde podle okolností o padělání listin, podvod nebo pomluvu; v řízení je klíčové ověření pravosti u původce a forenzní posouzení. Organizace by měly mít postup pro ověření dokumentů a pro komunikaci při fingovaném úniku ([Obrana narativu v PR](@/kompendium/organizational-defense/34-PR-narrative-defense.md)).

## 7. Obrana a zotavení

*Příjemce dokumentu*: ověřit u původce jiným kanálem; u plateb nikdy nejednat jen podle dokumentu. *Instituce*: používat elektronické podpisy, veřejně dostupné ověření čísel jednacích a rychle reagovat na padělky. *Novináři*: ověřovat dokumenty u původce a ve více nezávislých zdrojích; zveřejňovat postup ověření. *Soudy*: u sporných listin trvat na originálu a forenzním posouzení.

## 8. Příklad (anonymizovaný kompozit)

Účetní malé firmy obdrží e-mail s fakturou dodavatele a dopisem na hlavičkovém papíře o změně bankovního účtu. Dopis je stylisticky bezchybný a podepsaný jednatelem dodavatele. Podle vnitřního pravidla zavolá na známé číslo dodavatele – ten o změně nic neví. Firma incident nahlásí a dodavatel varuje ostatní odběratele.

## 9. Meze a otevřené otázky

Forenzní rozpoznání padělku bez originálu je obtížné; spolehlivá je hlavně kontrola u původce a elektronické podpisy. Otevřenou otázkou je ochrana před fingovanými úniky v situaci, kdy veřejnost instituci nedůvěřuje a jejímu popření nevěří.

Kniha neuvádí čísla o četnosti padělků vytvořených s pomocí AI, protože se v dostupných statistikách nerozlišují od jiných padělků. Otevřené zůstává, jak rychle se elektronické podpisy a veřejné ověřování rozšíří i mimo velké instituce, například k malým firmám a obcím, které jsou dnes nejzranitelnější.

Další otázkou je, jak mají soudy hodnotit listiny bez elektronického podpisu, které tvoří většinu dokumentů v běžném životě, a jak sdílet vzory padělků mezi institucemi, aniž by sloužily jako předloha.

## 10. Pohled zevnitř a práce s postiženým

Zaměstnanec, který podle padělku jednal, se často obává vyhazovu a obviňuje sám sebe; organizace by měla incident posoudit jako selhání procesu. Osoba, kterou fingovaný dokument kompromitoval, zažívá bezmoc vůči „papíru“, který mluví proti ní – potřebuje rychlou právní pomoc a podporu okolí.

U institucí, které se staly obětí fingovaného úniku, se vyplácí otevřeně popsat, jak padělek poznaly, a pomoci tak ostatním. Pro jednotlivce, které padělek osobně poškodil, je důležité rychlé veřejné vyjádření instituce, že dokument nevydala.

Pro účetní a administrativní pracovníky je užitečné mít jasnou oporu vedení, že ověření je vždy správný postup, i když zdrží platbu.

## 11. Vztah k ostatním kategoriím EA

V institucionálním prostředí kapitoly 2 se padělaný dokument může stát nástrojem [EA-2.4.2 Policy Rewriting Skrytá](@/kompendium/techniques/ea-2-4-2-policy-rewriting-skryta.md) – „směrnice“, která nikdy nebyla schválena. Fingovaný únik, který potvrzuje podezření publika, souvisí s [EA-2.3.10 Virální Misrepresentation](@/kompendium/techniques/ea-2-3-10-viralni-misrepresentation.md).

## 12. Postup při sporném dokumentu

1. **Ověřit u původce** jiným kanálem, než jakým dokument přišel.
2. **Zkontrolovat formální náležitosti** – čísla jednací, funkce podepisujících, data.
3. **Prověřit elektronický podpis** a metadata souboru.
4. **Neprovádět platby** ani rozhodnutí jen podle dokumentu.
5. **Nahlásit pokus** a uchovat dokument pro vyšetřování.

## 13. Prevence a odolnost

Prevence stojí na procesech, které nespoléhají na vzhled dokumentu: ověření jiným kanálem, pravidlo dvou osob u plateb, elektronické podpisy a veřejně dostupné ověření pravosti úředních dokumentů. Pro novináře je prevencí ověřování u původce a zveřejnění postupu ověření, pro instituce rychlá a věcná reakce na fingované úniky a pro veřejnost vědomí, že dokument, který přesně potvrzuje to, co si myslíme, si zaslouží zvláštní opatrnost. Organizace by měly mít připravený postup pro případ, že se objeví padělek jejich dokumentu.

## Odborný kontext

Padělání listin je staré jako písmo; generativní nástroje ho mění tím, že zlevňují napodobení stylu, jazyka a grafické úpravy instituce. Fingovaný únik je zvláště účinný proto, že pracuje s konfirmačním zkreslením – sklonem přijímat informace, které potvrzují to, co si už myslíme (Nickerson 1998). Dokument, který „dokazuje“ podezření publika vůči instituci, je přijat rychleji než její popření, a popření se navíc vykládá jako potvrzení.

Chesney a Citron (2019) upozornili, že rozšíření syntetických médií oslabuje důkazní hodnotu i pravých materiálů; u dokumentů to znamená, že vnější znaky (hlavička, razítko, podpis) přestávají stačit a rozhodující je ověření u původce a kryptografické zabezpečení, například elektronický podpis. Wardle a Derakhshan (2017) doporučují posuzovat sdělení podle celého řetězce – kdo dokument vytvořil, kdo ho šíří a komu slouží –, což je u fingovaných úniků často nejrychlejší cesta k odhalení.

## Souvislosti pro praxi

Pro firmy je nejúčinnější obranou pravidlo, že žádná změna bankovního účtu ani mimořádná platba se neprovede jen na základě dokumentu či e-mailu, ale po ověření jiným kanálem. Pro úřady je užitečné zpřístupnit veřejné ověření pravosti dokumentů (čísla jednací, elektronické podpisy). Pro novináře platí, že dokument z anonymního zdroje se zveřejňuje až po ověření u původce nebo v nezávislých zdrojích, a že postup ověření má být součástí článku.

## Literatura

- Chesney, R., & Citron, D. K. (2019). Deep fakes: A looming challenge for privacy, democracy, and national security. *California Law Review*.
- Nickerson, R. S. (1998). Confirmation bias: A ubiquitous phenomenon in many guises. *Review of General Psychology*.
- Wardle, C., & Derakhshan, H. (2017). *Information Disorder*. Council of Europe.

## Související

**Sourozenecké techniky**

- [EA-9.2.4 Image Manipulation EA](@/kompendium/techniques/ea-9-2-4-image-manipulation-EA.md) – padělaný obraz místo dokumentu.
- [EA-9.2.10 AI Personhood Claim](@/kompendium/techniques/ea-9-2-10-AI-personhood-claim.md) – smyšlená osoba jako „autor“.
- [EA-9.1.6 LLM Source Attribution Bypass](@/kompendium/techniques/ea-9-1-6-llm-source-attribution-bypass.md) – smyšlené zdroje.

**Právo a organizace**

- [Podvod jako prvek EA](@/kompendium/forensic-legal/17-fraud-EA-element.md) – právní kvalifikace.
- [Oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md) – ochrana plateb.
- [Obrana narativu v PR](@/kompendium/organizational-defense/34-PR-narrative-defense.md) – reakce na fingovaný únik.

**Pojmy a obrana**

- [Konfirmační bias](@/glossary/konfirmacni-bias.md) – proč padělek „sedí“.
- [Sebe-obrana: Verifikace tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) – ověření u původce.
