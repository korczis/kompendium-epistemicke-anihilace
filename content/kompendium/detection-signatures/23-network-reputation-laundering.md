+++
title = "Detekční signatura: Praní reputace (reputation laundering)"
description = "Síťová signatura: pochybný zdroj, tvrzení nebo aktér získává důvěryhodnost postupným přijetím renomovanými institucemi, aniž by byly vyřešeny jeho původní nedostatky."
weight = 23

[taxonomies]
tags = ["kompendium", "detection-signature", "diagnostika", "network"]
categories = ["academic", "clinical", "security"]

[extra]
related_terms = ["21-network-platform-coordination", "22-network-narrative-injection", "24-network-deplatforming-cascade", "25-phenomenological-cognitive-fog"]
parent = "kompendium-detection-signatures"
toc = true
modality = "network"
+++

## Definice signatury

Praní reputace je proces, kterým pochybný zdroj, tvrzení nebo aktér postupně získává důvěryhodnost tím, že je přijímán, citován, zván a oceňován institucemi a osobami s dobrou pověstí – aniž by se vyřešilo to, proč byl pochybný. Důvěra se nepřenáší podle zásluh, ale **asociací**: kdo vystoupil na prestižní konferenci, byl citován seriózním deníkem nebo daroval univerzitě, nese část jejich prestiže.

Pojem „praní reputace“ se v analýzách užívá zejména pro snahy aktérů s problematickým původem bohatství nebo moci získat legitimitu přes filantropii, kulturu, vzdělávání a média. Signatura má i opačnou podobu – zneužití stejného mechanismu k poškození pověsti druhého, kterou popisuje technika [EA-2.1.8 Reputation Laundering Inverze](@/kompendium/techniques/ea-2-1-8-reputation-laundering-inverze.md).

## Co signatura indikuje

Instituce a jednotlivci nemají kapacitu ověřit všechno a spoléhají na signály důvěryhodnosti od druhých: „když ho pozvala tato univerzita, musí být v pořádku“. Praní reputace tuto delegovanou důvěru využívá. Každý krok je malý a jednotlivě obhajitelný (jeden rozhovor, jedna konference, jeden dar), ale součtem vznikne obraz renomovaného aktéra.

Mechanismus má řetězovou povahu: první přijetí usnadní druhé, druhé třetí. Instituce, které se zapojí později, se odvolávají na ty předchozí – a vzniká [cirkularita](@/kompendium/detection-signatures/18-network-citation-circularity.md) na úrovni reputace. Pro jednotlivce, který na pochybnost upozorňuje, je situace obtížná: jeho varování stojí proti „všem těm institucím“.

## Pozorovatelné markery

### Obsahové a lingvistické

- Prezentace aktéra se opírá hlavně o výčet asociací (ocenění, partneři, vystoupení), méně o doložitelné výsledky.
- Kritické informace o aktérovi zmizí z jeho veřejných profilů a z výsledků vyhledávání, ale nejsou vyvráceny.
- Používá se jazyk dobročinnosti, inovace a dialogu bez konkrétního obsahu.

### Síťové a časové

- Rychlý sled vystoupení v renomovaných médiích a institucích v krátkém období.
- Nové vazby vznikají hlavně tam, kde aktér poskytuje peníze, přístup nebo jiné výhody.
- Starší kritické zdroje jsou postupně vytlačovány novými, příznivými.

### Aktérské a institucionální

- Instituce přijímají dary nebo spolupráci bez prověření původu prostředků či historie aktéra.
- Prostředníci (PR agentury, poradci, think-tanky) zprostředkují vstup aktéra do prestižních prostředí.
- Kritici čelí právním hrozbám nebo tlaku, což omezuje veřejnou diskusi.

## Detekční kritéria

1. Existují doložené pochybnosti o aktérovi nebo zdroji (původ prostředků, dřívější jednání, kvalita tvrzení).
2. V časovém úseku dochází ke kumulaci asociací s renomovanými institucemi.
3. Původní pochybnosti nebyly vyřešeny ani vysvětleny, jen překryty.
4. Asociace vznikají často za protihodnotu (dar, financování, přístup).

Pozitivní při splnění bodů 1–3; bod 4 zvyšuje závažnost.

## Odlišení od benigních podob

- **Skutečná náprava**: aktér, který své dřívější jednání přizná, napraví škody a změní chování, si legitimně buduje novou reputaci.
- **Rehabilitace po křivém obvinění**: osoba, jejíž pověst byla neoprávněně poškozena, má právo na obnovu; pochybnosti jsou v takovém případě vyvráceny, nikoli překryty.
- **Normální kariérní růst**: nové vazby přicházejí s výsledky práce, bez vzorce výměnných obchodů.
- **Filantropie** sama o sobě není praním reputace; je jím tehdy, když slouží k překrytí nevyřešených problémů.

## Dopad na jednotlivce a klinický rozměr

Signatura zasahuje jednotlivce zejména jako **oběti aktéra**, jehož reputace byla vyprána: jejich zkušenost je zpochybňována autoritou institucí, které aktéra přijaly. To prohlubuje [epistemickou nespravedlnost](@/glossary/epistemicka-injustice.md) (Fricker 2007) – nevěří se jim, protože proti nim stojí „renomovaný“ člověk. Může to vést k pocitu bezmoci, k sebeobviňování a k pochybnostem o vlastní paměti.

V inverzní podobě je jednotlivec terčem: jeho pověst je cíleně poškozována asociacemi a citacemi. Klinik by měl takovou zkušenost brát vážně, ověřovat ji doklady a rozlišovat ji od obecně perzekučního myšlení podle konkrétnosti a doložitelnosti.

## Riziko falešné pozitivity

- Nesouhlas s aktérem nebo s jeho politikou není důkazem praní reputace.
- Hodnotitel nemusí znát okolnosti, za nichž byly pochybnosti vyřešeny (například soudní rozhodnutí, vyrovnání).
- Instituce mohou přijmout aktéra po řádném prověření; absence veřejné informace o prověření neznamená, že neproběhlo.

## Validační test

**Reputační časová osa.** Sestaví se přehled pochybností o aktérovi (s daty a zdroji) a vedle něj přehled nových asociací. Ke každé asociaci se doplní, zda jí předcházelo prověření, zda byla spojena s protihodnotou a zda instituce na pochybnosti reagovala. Vzor „pochybnost → přibývající asociace bez reakce na pochybnost“ potvrzuje signaturu. Pro hloubkovou analýzu viz [due diligence](@/glossary/due-diligence.md) a [EA × Due Diligence: Counterparty Manipulation](@/kompendium/cross-domain/12-ea-dd-counterparty-manipulation.md).

## Dokumentace v praxi

Archivovat zdroje pochybností, protože bývají odstraňovány; zaznamenat data a povahu asociací; uchovávat veřejně dostupné informace o darech a partnerstvích. U analýz určených k publikaci postupovat s právní opatrností, protože aktéři s vyspělou reputační strategií často reagují právními kroky (viz [pomluva v EA kontextu](@/kompendium/forensic-legal/14-defamation-EA.md)).

## Doporučený postup

**Pro jednotlivce:** neusuzovat na důvěryhodnost jen podle asociací; ptát se, co aktér doložitelně udělal. Pro oběti aktéra s vypranou pověstí: hledat podporu u lidí a organizací, které jejich zkušenost znají, a dokumentovat.

**Pro instituce:** zavést prověřování dárců a partnerů, zveřejňovat kritéria a umožnit přezkum (viz [politika střetu zájmů](@/kompendium/organizational-defense/3-conflict-of-interest-policy.md), [prověřování kontraktorů](@/kompendium/organizational-defense/26-contractor-vetting.md)).

**Pro profesionála:** validovat zkušenost klienta, kterému se „nevěří“, a pomoci mu najít instituce, které jeho podání posoudí nezávisle.

**Eskalace:** pokud se oběť dostane pod tlak (výhrůžky, žaloby, ztráta zaměstnání) a je ohrožena její stabilita, viz [legal emergency](@/kompendium/emergency-protocols/39-legal-emergency.md) a [witness protection](@/kompendium/emergency-protocols/40-witness-protection.md).

## Ilustrativní příklad

*Anonymizovaný kompozit.* Podnikatel, o jehož firmě vyšly kritické reportáže kvůli zacházení se zaměstnanci, během dvou let financuje stipendia, vystoupí na několika konferencích o etice podnikání a objeví se v rozhovorech s respektovanými novináři, kteří se na reportáže neptají. Bývalá zaměstnankyně, která o firmě svědčila, slyší, že „tak uznávaný člověk by přece nic takového nedělal“. Etická komise jedné z univerzit, na kterou se obrátí, sestaví reputační časovou osu, zjistí, že žádné z původních obvinění nebylo vysvětleno, a pozastaví spolupráci do doby prověření.

## Limity a otevřené otázky

- Vztah mezi asociací a „praním“ je interpretační; signatura vyžaduje opatrný jazyk a doložitelné kroky.
- Institucionální prověřování je nákladné a nerovnoměrně dostupné.
- Inverzní podoba (ničení reputace) se obtížně odlišuje od legitimní kritiky.

## Související

**Sourozenecké signatury**

- [Cirkularita citací](@/kompendium/detection-signatures/18-network-citation-circularity.md) – reputace potvrzovaná navzájem se citujícími zdroji.
- [Injekce narativu](@/kompendium/detection-signatures/22-network-narrative-injection.md) – nový příběh o aktérovi.
- [Deplatformingová kaskáda](@/kompendium/detection-signatures/24-network-deplatforming-cascade.md) – umlčení kritiků.

**Techniky a pojmy**

- [EA-2.1.8 Reputation Laundering Inverze](@/kompendium/techniques/ea-2-1-8-reputation-laundering-inverze.md) – zneužití mechanismu proti druhým.
- [Delegitimizace](@/glossary/delegitimizace.md) – opačný proces ztráty legitimity.
- [Epistemická injustice](@/glossary/epistemicka-injustice.md) – proč se obětem nevěří.

**Obrana**

- [EA × Due Diligence: Source Weighting](@/kompendium/cross-domain/10-ea-dd-source-weighting.md) – vážení zdrojů při prověřování.
- [Politika střetu zájmů](@/kompendium/organizational-defense/3-conflict-of-interest-policy.md) – institucionální pojistka.

---

*Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | [GitHub](https://github.com/korczis/kompendium-epistemicke-anihilace) | [Wiki](https://github.com/korczis/kompendium-epistemicke-anihilace/wiki) | [Kontakt](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [Developer Portal](https://prismatic-reality-com.github.io/prismatic-promo/developers/) | [Glossary](@/glossary/_index.md) | [Kompendium](@/kompendium/_index.md)*
