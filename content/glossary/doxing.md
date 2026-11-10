+++
title = "Doxing"
weight = 100
description = "Zveřejnění osobních údajů o člověku proti jeho vůli s cílem vystavit ho obtěžování, zastrašení nebo umlčení; znaky, dopady, právní rámec a obrana."

[taxonomies]
tags = ["glossary", "security", "legal", "digitalni", "kompendium"]

[extra]
category = "security"
related_terms = ["deplatforming", "osint", "panopticism", "info-ops", "chain-of-custody", "socialni-izolace"]
author = "Tomas Korcak (korczis)"
date_created = "2026-05-03"
date_modified = "2026-11-10"
quality_score = 75
ref_count_at_creation = 1
+++

## Definice

**Doxing** (také *doxxing*, z anglického *docs*, „dokumenty“) je shromáždění a **zveřejnění
osobních údajů o konkrétním člověku proti jeho vůli** – adresy bydliště, telefonu,
zaměstnavatele, fotografií rodiny, zdravotních nebo finančních informací, skutečné
identity za pseudonymem –, a to s účelem nebo předvídatelným důsledkem, že dotčený bude
vystaven obtěžování, zastrašování, ztrátě práce nebo fyzickému ohrožení.

Doxing není totéž co zveřejnění informace ve veřejném zájmu (investigativní novinařina,
odhalení korupce). Rozhoduje **účel, přiměřenost a cílení**: doxing míří na osobu, ne na
čin, a zveřejněné údaje nemají vztah k veřejné debatě, ale k možnosti člověka najít
a zasáhnout.

## Původ a kontext pojmu

Výraz vznikl v hackerských a online subkulturách na přelomu 20. a 21. století, kde
„dropping docs“ znamenalo zveřejnit identitu protivníka. Do širšího povědomí se dostal
v 2010. letech v souvislosti s koordinovanými online kampaněmi proti novinářkám,
aktivistům, vědcům a herním vývojářkám.

Jev sám je ale starší než internet. Zveřejňování adres a jmen „nepřátel“ s výzvou
k jejich pronásledování patří k repertoáru politického teroru; historické případy
v Kompendiu ukazují veřejné pranýřování a mobilizaci okolí proti jednotlivcům ([Kubánské
akty repudia](@/kompendium/historical-cases/9-cuban-akty-repudio.md)). Digitální prostředí
změnilo hlavně rychlost a dosah: k údajům se lze dostat z veřejně dostupných zdrojů
a jejich šíření je okamžité.

## Jak se projevuje

- zveřejnění údajů dotčeného v diskusi, na sociální síti nebo ve skupině, často
  s implicitní výzvou („tady bydlí, kdyby někdo chtěl něco říct“);
- náhlá vlna zpráv, telefonátů, zásilek nebo návštěv od neznámých lidí;
- kontaktování zaměstnavatele, rodiny nebo školy dětí;
- spojení pseudonymu s občanskou identitou;
- zveřejnění citlivých informací (zdraví, sexualita, minulost) s cílem zostudit;
- souběh s koordinovaným útokem, deepfaky nebo vytrženými citacemi; viz [Mob
  Coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md) a [Clip
  Takeout](@/kompendium/techniques/ea-2-3-1-clip-takeout.md).

**U dotčeného:** akutní strach o bezpečí sebe a rodiny, hypervigilance, nespavost,
stažení z veřejného prostoru, autocenzura, pocit ztráty kontroly nad vlastním životem.

## Mechanismus

Kompendium se doxingem zabývá jako **epistemickým útokem**, nejen jako bezpečnostním
incidentem. Jeho strukturální účinek spočívá ve třech rovinách:

- **Přesun z argumentu na osobu.** Spor o myšlenku se mění v ohrožení člověka, který ji
  vyslovil. Tím se mění náklady účasti ve veřejné debatě; viz [EA-2.3.8 Doxxing
  epistemický](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md).
- **Odstrašení okolí.** Účinek nepůsobí jen na oběť, ale na všechny, kdo útok sledují:
  zpráva zní „tohle se stane každému, kdo promluví“. Výsledkem je ochlazení debaty
  v celé komunitě.
- **Pocit všudypřítomného dohledu.** Vědomí, že kdokoli může znát mou adresu a denní
  režim, vyvolává stav podobný tomu, co Foucault popisuje jako [panoptismus](@/glossary/panopticism.md):
  člověk se začne kontrolovat sám.

Doxing často využívá stejné metody práce s veřejnými zdroji jako legitimní [OSINT](@/glossary/osint.md).
Rozdíl není v nástrojích, ale v účelu, proporcionalitě a etice: legitimní vyšetřování
chrání soukromí nezúčastněných, zveřejňuje jen to, co je pro veřejný zájem nezbytné,
a nikdy nevyzývá k obtěžování.

**Obecný příklad (kompozit).** Vědkyně, která v médiích vysvětluje výsledky výzkumu
na kontroverzní téma, najde v anonymní diskusi svou adresu, fotografii domu a jméno školy,
kterou navštěvují její děti. Během týdne dostane desítky výhrůžných zpráv a její
zaměstnavatel e-maily s požadavkem na její propuštění. Přestane přijímat pozvánky do
médií. Půl roku poté, co útok utichl, se stále vyhýbá veřejným vystoupením – a několik
jejích kolegů odmítá k tématu cokoli říct. Doxing tak zasáhl nejen ji, ale i to, co se
o tématu veřejně ví.

## Odlišení

- **Od investigativní novinařiny a whistleblowingu:** veřejný zájem, ověřování, ochrana
  nezúčastněných, odpovědnost redakce, právo na reakci.
- **Od [deplatformingu](@/glossary/deplatforming.md):** deplatforming odebírá prostor
  k projevu; doxing ohrožuje osobu mimo platformu. Často se kombinují.
- **Od legitimní kritiky:** kritika se týká výroků a jednání; doxing se týká místa, kde
  člověk spí.
- **Od paranoidních obav:** dotčení po doxingu bývají hypervigilantní a jejich strach
  může působit přehnaně. Ve skutečnosti bývá oprávněný; klinik by neměl reakci
  patologizovat, ale pomoci ji regulovat a zároveň ověřit reálná rizika.

## Právní rámec

Konkrétní kvalifikace závisí na jurisdikci a okolnostech. V evropském prostoru je
zpracování osobních údajů upraveno **obecným nařízením o ochraně osobních údajů (GDPR,
nařízení (EU) 2016/679)**; dotčený se může obrátit na provozovatele platformy a na
dozorový úřad (v Česku Úřad pro ochranu osobních údajů). Trestněprávně může doxing
naplnit znaky **nebezpečného pronásledování** (§ 354 trestního zákoníku), vydírání,
nebezpečného vyhrožování nebo jiných činů, pokud je spojen s dalším jednáním.
Občanskoprávně přichází v úvahu ochrana osobnosti. Viz [Ochrana
svědků](@/kompendium/forensic-legal/22-fact-witness-protection.md) a [Elektronické
důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md).

## Význam pro Kompendium

Doxing patří do skupiny technik mediálního a síťového útoku (EA-2.3) a objevuje se
v kazuistikách mediálních útoků ([Mediální mob attack](@/kompendium/case-studies/04-medialni-mob-attack.md))
i v historických případech dezinformačních kampaní ([Pizzagate](@/kompendium/historical-cases/29-pizzagate.md)).
Na populační úrovni s ním počítají programy [digitálního
občanství](@/kompendium/population-health/16-digital-citizenship-program.md).

## Obrana a zotavení

**Prevence:**

- Pravidelně kontrolovat, jaké údaje o mně jsou veřejně dostupné, a omezit je
  (nastavení soukromí, oddělení pracovních a soukromých účtů, opatrnost u fotografií
  s rozpoznatelným místem); viz [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md).
- Dvoufaktorové ověření a silná hesla, aby nebyly zneužitelné účty.

**Při útoku:**

- **Bezpečí na prvním místě.** Při konkrétní hrozbě kontaktovat policii; informovat
  blízké, zaměstnavatele a případně školu dětí.
- **Dokumentovat**, než se obsah smaže: snímky obrazovky s adresou a časem, archivace;
  viz [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md).
- Nahlásit obsah platformě a požadovat odstranění osobních údajů.
- Nereagovat na útočníky přímo; komunikovat přes jednoho pověřeného člověka.

**Pro organizace:** mít připravený postup pro zaměstnance pod útokem ([Reakce na
incident](@/kompendium/organizational-defense/31-incident-response-EA.md)).

**Zotavení:** práce s hypervigilancí a ztrátou pocitu bezpečí, postupný návrat do
veřejného prostoru podle vlastního tempa.

## Související

**Pojmy**

- [Deplatforming](@/glossary/deplatforming.md) – souběžné odebrání prostoru k projevu.
- [OSINT](@/glossary/osint.md) – legitimní práce s veřejnými zdroji a její etické meze.
- [Panopticism](@/glossary/panopticism.md) – účinek pocitu všudypřítomného dohledu.

**Techniky a případy**

- [EA-2.3.8 Doxxing epistemický](@/kompendium/techniques/ea-2-3-8-doxxing-epistemicky.md)
  – doxing jako technika umlčení.
- [EA-2.3.4 Mob Coordination](@/kompendium/techniques/ea-2-3-4-mob-coordination.md)
  – koordinovaný útok, jehož bývá součástí.
- [Mediální mob attack](@/kompendium/case-studies/04-medialni-mob-attack.md) – kazuistika.

**Obrana**

- [Uchování důkazů](@/kompendium/forensic-legal/32-evidence-preservation.md) – dokumentace
  útoku.
- [Digitální hygiena](@/kompendium/prevention-resilience/7-digital-hygiene-prevention.md)
  – prevence.
- [Reakce na incident](@/kompendium/organizational-defense/31-incident-response-EA.md)
  – postup organizace.
