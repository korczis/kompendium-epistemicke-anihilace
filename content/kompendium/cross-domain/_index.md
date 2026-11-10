+++
title = "Mezioborové mosty"
description = "Jak se pojmy knihy uplatňují v OSINT, due diligence, kybernetické bezpečnosti a compliance: znaky, právní rámec, ochranná opatření a lidský rozměr v každé doméně."
sort_by = "weight"
template = "section.html"

[extra]
toc = true
+++

# Mezioborové mosty

Kniha popisuje [epistemickou anihilaci](@/glossary/epistemicka-anihilace.md) především jako
proces, který u jednotlivce rozkládá schopnost poznávat, hodnotit zdroje a udržet souvislý
obraz reality. Tytéž mechanismy – řízení toho, co člověk vidí, vytváření zdánlivé shody,
přesouvání důvěry na vnější autoritu, obracení viny, zahlcení a časový tlak – se ale
uplatňují i v profesních doménách, kde se rozhoduje o lidech, firmách a rizicích. Tato
sekce je mostem mezi taxonomií knihy a čtyřmi doménami, z nichž kniha historicky vzešla
(srov. [1.6 Vztah ke Prismatic Platformě](@/kompendium/01-predmluva/vztah-k-platforme.md)):
zpravodajstvím z otevřených zdrojů, [due diligence](@/glossary/due-diligence.md), kybernetickou bezpečností a compliance.

## Proč mosty

Profesionálové v těchto doménách pracují s informacemi pod tlakem a často v prostředí,
kde někdo aktivně usiluje o to, aby jejich obraz reality byl zkreslený. Mohou tedy být
terčem manipulace – a zároveň mohou svými rozhodnutími sami vytvářet zkreslené příběhy
o lidech, kteří se nemohou bránit: chybné profily, falešné shody se sankčními seznamy,
předčasné atribuce, nespravedlivá odmítnutí. Mosty proto mají dvojí účel: pomoci
rozpoznat manipulaci zvenčí a pomoci nestát se jejím nevědomým nástrojem. Kritickou
protiváhu, která varuje před tím, aby se rámec knihy stal univerzálním vysvětlením,
nabízí stránka [Framework overreach](@/kompendium/critical-perspectives/3-framework-overreach.md).

Mosty nejsou návody k provádění prověrek ani bezpečnostních operací. Popisují vzorce,
které lze rozpoznat, a pojistky, které omezují škodu; technické detaily útoků záměrně
vynechávají. Čtenář z praxe v nich najde především otázky, které je dobré si položit
dřív, než z neúplných informací vznikne rozhodnutí o člověku.

## Jednotné schéma stránek

Každá stránka popisuje doménu a problém, průnik s mechanismy popsanými v knize, rozpoznávací
znaky, právní a odborný rámec, ochranná opatření, lidský rozměr a zotavení, přesah do dalších
oborů (právo, medicína, školství, organizace, média), ilustrativní scénář a meze a otevřené
otázky. Scénáře jsou hypotetické a anonymizované; nepopisují skutečné případy ani výsledky
konkrétních nasazení. Literatura obsahuje jen díla, předpisy a rozhodnutí, jejichž existence
je jistá.

## OSINT – zpravodajství z otevřených zdrojů

- [Důvěryhodnost zdrojů pod epistemickým tlakem](@/kompendium/cross-domain/1-ea-osint-source-credibility.md) – oddělení zdroje a informace, laterální čtení.
- [Ověřování subjektů v ARES a veřejných rejstřících](@/kompendium/cross-domain/2-ea-osint-czech-ares-validation.md) – úřední záznam není ověřený fakt.
- [Prověrka v justice.cz, Sbírce listin a ISIR](@/kompendium/cross-domain/3-ea-osint-justice-cz-screening.md) – stav a výsledek řízení, presumpce neviny.
- [Sankční seznamy, falešné shody a zkreslení](@/kompendium/cross-domain/4-ea-osint-sanctions-list-bias.md) – kdo nese náklady chyb.
- [Manipulace na sociálních sítích](@/kompendium/cross-domain/5-ea-osint-social-media-manipulation.md) – koordinace, aktéři a nositelé.
- [Detekce botů](@/kompendium/cross-domain/6-ea-osint-bot-detection.md) – skóre jako hypotéza, ne verdikt.
- [Injekce narativu](@/kompendium/cross-domain/7-ea-osint-narrative-injection.md) – datové mezery a trvalý vliv.
- [Triangulace napříč zdroji](@/kompendium/cross-domain/8-ea-osint-cross-source-triangulation.md) – kdy jsou tři zdroje skutečně tři.

## Due diligence

- [Kognitivní zkreslení vyšetřovatele](@/kompendium/cross-domain/9-ea-dd-investigation-bias.md) – heuristiky a tlak zadavatele.
- [Vážení zdrojů a pravděpodobnostní úsudek](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) – diagnostická síla důkazu.
- [Kalibrace rozhodovacích systémů](@/kompendium/cross-domain/11-ea-dd-decision-engine-calibration.md) – automation bias a právo na lidské posouzení.
- [Manipulace ze strany protistrany](@/kompendium/cross-domain/12-ea-dd-counterparty-manipulation.md) – kurátorství datové místnosti.
- [Dezinformace o skutečném majiteli](@/kompendium/cross-domain/13-ea-dd-beneficial-ownership-disinformation.md) – nepravda strukturou.
- [Narativní válka kolem firem](@/kompendium/cross-domain/14-ea-dd-narrative-warfare.md) – hodnotit tvrzení, ne hlasitost.
- [Hodnocení kvality důkazů](@/kompendium/cross-domain/15-ea-dd-evidence-quality-assessment.md) – co dokument skutečně dokládá.
- [Prevence konfirmačního zkreslení](@/kompendium/cross-domain/16-ea-dd-confirmation-bias-prevention.md) – ACH, [red team](@/glossary/red-team.md), předběžná pitva.

## Kybernetická bezpečnost

- [Sociální inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md) – ověřování místo podezíravosti.
- [Cílený phishing](@/kompendium/cross-domain/18-ea-security-spear-phishing.md) – zaměstnanci jako detektor, ne nejslabší článek.
- [Obrana organizace proti dezinformacím](@/kompendium/cross-domain/19-ea-security-disinformation-defense.md) – prebunking a věcná oprava.
- [Vnitřní hrozba](@/kompendium/cross-domain/20-ea-security-insider-threat.md) – mezi manipulací zvenčí a paranoiou zevnitř.
- [Dodavatelský řetězec a narativy o dodavatelích](@/kompendium/cross-domain/21-ea-security-supply-chain-narrative.md) – důvěryhodný kanál jako nosič.
- [Narativ při reakci na incident](@/kompendium/cross-domain/22-ea-security-incident-response-narrative.md) – pravdivost v nejistotě.
- [Zkreslení při atribuci útoků](@/kompendium/cross-domain/23-ea-security-attribution-bias.md) – nejprve doklady, pak jména.
- [Validace zpravodajství o hrozbách](@/kompendium/cross-domain/24-ea-security-threat-intelligence-validation.md) – otrávené zdroje a stárnoucí indikátory.

## Compliance

- [NIS2 a integrita rozhodování](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md) – co vedení skutečně ví.
- [Český zákon o kybernetické bezpečnosti](@/kompendium/cross-domain/26-ea-compliance-zkb-epistemic-integrity.md) – záznamy jako institucionální paměť.
- [GDPR a ochrana před chybným narativem o člověku](@/kompendium/cross-domain/27-ea-compliance-gdpr-narrative-protection.md) – přesnost, oprava, výmaz.
- [AML a rozpoznávání vzorců](@/kompendium/cross-domain/28-ea-compliance-aml-pattern-recognition.md) – oběti podvodů jako nastrčené osoby.
- [KYC a ověřování příběhu klienta](@/kompendium/cross-domain/29-ea-compliance-kyc-narrative-validation.md) – klienti pod vlivem třetí osoby.
- [Rozpoznání regulatorního zajetí](@/kompendium/cross-domain/30-ea-compliance-regulatory-capture-detection.md) – kontrolor v perspektivě kontrolovaného.

## Kam dál

Detekční signatury, na něž stránky odkazují, shrnuje sekce [Detekční signatury](@/kompendium/detection-signatures/_index.md);
organizační opatření sekce [Organizační obrana](@/kompendium/organizational-defense/_index.md);
právní souvislosti sekce [Forenzní a právní rozměr](@/kompendium/forensic-legal/_index.md).
Metody, jimiž lze tvrzení těchto stránek empiricky ověřovat, popisuje sekce
[Výzkumná metodologie](@/kompendium/research-methodology/_index.md). Kontext platformy, z níž
kniha vzešla, popisuje sekce [AIAD Integration](@/kompendium/aiad-integration/_index.md).

## Literatura

- Fricker, M. (2007). *Epistemic Injustice: Power and the Ethics of Knowing.*
- Heuer, R. J. (1999). *Psychology of Intelligence Analysis.*
