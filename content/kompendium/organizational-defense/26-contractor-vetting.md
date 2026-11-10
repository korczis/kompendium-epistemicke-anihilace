+++
title = "Prověřování kontraktorů"
description = "Externí spolupracovníci mívají přístup jako zaměstnanci, ale slabší prověrku i dohled. Kapitola popisuje přiměřené prověření, stupňovaný přístup, časově omezená oprávnění a ukončení spolupráce."
weight = 260

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["25-vendor-management-EA", "28-access-control-EA", "27-information-classification", "3-conflict-of-interest-policy"]
parent = "kompendium-organizational-defense"
toc = true
+++

# Prověřování kontraktorů

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Externí spolupracovníci – OSVČ, agenturní pracovníci, konzultanti, lektoři, externí
vyšetřovatelé, dobrovolníci – dnes tvoří významnou část lidí, kteří mají přístup k
systémům, datům a lidem organizace. Často však procházejí slabší prověrkou než zaměstnanci,
mají méně jasná pravidla a po skončení spolupráce si ponechají přístupy. Externí osoba tak
může být nástrojem vlivu, zdrojem úniku informací nebo „prostředníkem“, přes kterého někdo
uvnitř obchází pravidla, která by na něj jinak dopadla.

## Riziko v daném prostředí

Ve firmě mají externí vývojáři a správci systémů nezřídka nejvyšší oprávnění. Na
univerzitě a ve výzkumu se externí spolupracovníci a hostující výzkumníci dostávají k datům
bez formální smlouvy. Ve škole a v organizacích pracujících s dětmi (kroužky, tábory,
sportovní kluby) jsou externí lektoři a dobrovolníci v přímém kontaktu s dětmi; zákon č.
563/2004 Sb., o pedagogických pracovnících, vyžaduje bezúhonnost u pedagogů, ale u
externích osob mimo tento režim taková kontrola často chybí. V nemocnici jde o agenturní
personál a servisní techniky. Ve veřejné správě o externí poradce s přístupem k
rozpracovaným rozhodnutím, v médiích o externí spolupracovníky s přístupem ke zdrojům. Obecný
rámec dává [insider threat](@/kompendium/cross-domain/20-ea-security-insider-threat.md).

## Strukturální zranitelnosti

- Žádná prověrka ani identifikace skutečného zaměstnavatele či majitele dodavatelské firmy.
- Externí osoby dostávají široká oprávnění „pro jistotu“.
- Chybí ukončovací postup; přístupy zůstávají po skončení spolupráce.
- Kontraktoři nepodléhají kodexu, školení ani oznamovacím mechanismům organizace.
- Vnitřní aktér si najímá „svého“ externistu, aby obešel pravidla náboru nebo střetu
  zájmů.

## Ochranné struktury

- Prověrka přiměřená riziku role: ověření identity a firmy, skutečného majitele, střetu
  zájmů, u vybraných rolí sankční seznamy ([sanctions screening](@/glossary/sanctions-screening.md))
  a reference. U práce s dětmi nebo zranitelnými osobami ověření bezúhonnosti tam, kde to
  právní rámec připouští.
- Stupňovaný model přístupu: minimum nutných oprávnění, časově omezené účty, schvalování
  vlastníkem dat – viz [řízení přístupů](@/kompendium/organizational-defense/28-access-control-EA.md).
- Smlouva s mlčenlivostí, pravidly zacházení s daty a s povinností dodržovat kodex chování.
- Ukončovací postup s okamžitým odebráním přístupů a vrácením zařízení a dat.
- Zahrnutí kontraktorů do školení a do [vnitřního oznamovacího systému](@/kompendium/organizational-defense/4-whistleblower-mechanism.md);
  zákon č. 171/2023 Sb. chrání i osoby vykonávající práci pro organizaci na jiném základě
  než pracovní smlouvou.

## Role a odpovědnosti

Objednatel (věcný útvar) odpovídá za odůvodnění potřeby a za dohled nad prací. Nákupní nebo
personální útvar provádí prověrku. IT a vlastníci dat přidělují a odebírají přístupy.
Compliance posuzuje střet zájmů a vazby. Vedoucí útvaru odpovídá za to, že kontraktor je
veden v evidenci a že jeho přístupy se pravidelně přezkoumávají.

## Politiky a postupy

1. Evidence všech externích osob s přístupem k systémům, datům nebo lidem.
2. Matice prověrky podle rizika role.
3. Pravidla pro přidělování oprávnění s výchozí lhůtou platnosti.
4. Čtvrtletní přezkum přístupů externích osob.
5. Ukončovací kontrolní seznam s potvrzením vlastníků dat.
6. Zákaz najímání externích osob se vztahem k rozhodovateli bez schválení – navazuje na
   [politiku střetu zájmů](@/kompendium/organizational-defense/3-conflict-of-interest-policy.md).

## Vzdělávání a trénink

Objednatelé se učí, že externí osoba je součástí bezpečnostního a kulturního prostředí
organizace. Kontraktoři dostávají zkrácené úvodní školení: kodex, zacházení s daty, kanály
pro hlášení. Zaměstnanci, kteří s externími osobami pracují, se učí rozpoznat
[sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md) –
například když externista tlačí na rozšíření oprávnění pod časovým tlakem nebo s odkazem na
vysoko postaveného objednatele.

## Řešení incidentu

1. Při podezření na zneužití přístupu nebo vlivu okamžitě omezit přístupy kontraktora.
2. Zajistit záznamy o přístupech a činnosti – [elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md).
3. Zjistit, kdo kontraktora najal a schvaloval jeho oprávnění.
4. Posoudit smluvní a případně trestněprávní kroky.
5. Přezkoumat ostatní externí přístupy se stejným vzorcem.

**Příklad (anonymizovaný kompozit).** Ve sportovním klubu vedl externí trenér mládeže
tréninky dva roky bez jakékoli smlouvy a prověrky, protože ho „doporučil“ člen výboru.
Rodiče si stěžovali na jeho soukromou komunikaci s dětmi. Klub neměl pravidla ani kanál,
kam stížnosti směřovat. Po incidentu zavedl evidenci všech osob pracujících s dětmi,
pravidla komunikace a ověřování.

## Ochrana dotčené osoby

Pokud kontraktor poškodil zaměstnance, klienty nebo děti, mají dotčení stejné právo na
ochranu a podporu, jako kdyby šlo o zaměstnance. Zároveň kontraktor sám může být obětí
manipulace uvnitř organizace – je v ještě slabší pozici než zaměstnanec, protože jeho
spolupráci lze ukončit bez důvodu. Organizace musí zajistit, aby ukončení spolupráce nebylo
odvetou za oznámení.

## Vyhodnocení a indikátory selhání

- Žádná prověrka, kontraktoři s nejvyššími oprávněními, chybí ukončovací postup, trvalé
  vzdálené přístupy.
- Nikdo neví, kolik externích osob má přístup.
- Externí osoby jsou spojeny s rozhodovateli.
- Kontraktoři nevědí, kam hlásit problémy.

## Meze a otevřené otázky

Prověrka musí být přiměřená; nadměrné zjišťování osobních údajů je v rozporu s GDPR a
zákoníkem práce a samo může být zásahem do soukromí. Malé organizace nemají kapacitu na
složité prověrky. Otevřené zůstává, jak řešit dlouhé řetězce subdodavatelů, kde organizace
neví, kdo konkrétně pro ni pracuje.

## Související

**Sesterské kapitoly**

- [Řízení dodavatelů s EA fokusem](@/kompendium/organizational-defense/25-vendor-management-EA.md)
  – vztah s firmou, která kontraktora dodává.
- [Řízení přístupů s EA fokusem](@/kompendium/organizational-defense/28-access-control-EA.md)
  – oprávnění a jejich odebírání.
- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md)
  – co externí osoba smí vidět.

**Analýza**

- [EA × Security: Insider Threat](@/kompendium/cross-domain/20-ea-security-insider-threat.md)
  – vnitřní hrozba včetně externích osob.
- [EA × OSINT: Sankční seznamy a atribuční bias](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md)
  – meze sankčních prověrek.
- [EA × Compliance: KYC – Narrative Validation Layer](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md)
  – ověřování příběhu protistrany.

**Pojmy a ochrana**

- [Sanctions screening](@/glossary/sanctions-screening.md) – prověrka proti seznamům.
- [Ochrana dětí](@/kompendium/forensic-legal/47-child-protection-EA.md) – právní rámec u
  práce s dětmi.
