+++
title = "Deepfake"
weight = 60

description = "Syntetická audiovizuální média vytvořená hlubokými neuronovými sítěmi, která věrně padělají projev konkrétních osob; strukturální hrozba pro epistemickou bezpečnost."

[taxonomies]
tags = ["glossary", "security", "epistemic", "kompendium", "digitalni"]

[extra]
category = "security"
related_terms = ["epistemic-security", "info-ops", "firehose-of-falsehood", "epistemicka-anihilace", "hyperreality", "delegitimizace"]
author = "Tomáš Korcak (korczis)"
date_created = "2026-04-25"
date_modified = "2026-11-10"
keywords = ["deepfake", "syntetická média", "generativní AI", "forenzní analýza médií", "epistemická hrozba", "GAN", "difuzní model"]
see_also = ["kompendium", "epistemicka-anihilace"]
image = "/images/sections/glossary.png"
image_alt = "Deepfake – glosář"
+++

## Definice

**Deepfake** je syntetický audiovizuální obsah vytvořený hlubokými neuronovými sítěmi
(původně na bázi GAN, dnes převážně difuzních modelů a modelů podmíněných
transformerovou architekturou), který zobrazuje rozpoznatelnou osobu, jak říká nebo dělá
něco, co neřekla ani neudělala. Termín vznikl v roce 2017 na platformě Reddit a postupně se
rozšířil od záměny obličeje ve videu na klonování hlasu (některým systémům podle jejich
autorů stačí několik sekund referenční nahrávky), syntézu celé postavy, ovládání avatarů
v reálném čase a padělání dokumentů (syntetické pasy, lékařské zprávy).

Současné deepfaky technicky stojí na několika rozkladech: **oddělení identity** (oddělit
„kdo“ od „co dělá“), **apriorní časové soudržnosti** (potlačení blikání a artefaktů mezi
snímky) a **zarovnání na biometrické kotvy** (pohyb rtů podle fonémů, pohled k objektům
mimo záběr). Detekce se stala závodem ve zbrojení: klasické artefakty (nesouměrné
mrkání, nekonzistentní odlesky v rohovce, šumové vzorce ve frekvenční oblasti) každá další
generace modelů postupně odstraňuje.

## Původ a kontext pojmu

Slovo spojuje *deep learning* (hluboké učení) a *fake* (padělek). Než se začalo používat,
existovala retuš fotografií a střih zvuku; nové je, že padělek lze vytvořit levně, rychle,
ve velkém a bez odborných dovedností. Právníci Robert Chesney a Danielle Citronová (2019)
popsali tzv. **dividendu lháře** (*liar's dividend*): jakmile je známo, že padělky
existují, lze i pravou nahrávku věrohodně odbýt jako podvrh.

Deepfaky tvoří **epistemickou hrozbu odlišnou od textové dezinformace**, protože
audiovizuální obsah nese evolučně podmíněnou důvěryhodnost na první pohled – „vidět
znamená věřit“ je hluboce zakořeněná [heuristika](@/glossary/heuristika.md). Primární újmu z padělku znásobují tři
druhotné účinky:

1. **dividenda lháře** – pravé záznamy lze nyní věrohodně popřít jako podvrhy;
2. **odrazující účinek** na důvěru ve svědectví obecně;
3. **zneužití k nesouhlasným intimním záznamům**, které podle zprávy Deeptrace (2019,
   firma se později přejmenovala na Sensity) tvořily naprostou většinu (kolem 96 %)
   deepfaků volně dostupných na internetu.

## Jak se projevuje

**Technické stopy (stále méně spolehlivé):**

- nepřirozené mrkání, rozmazané okraje obličeje, nesoulad světla a stínů;
- nesoulad pohybu rtů a hlásek, kovový nebo plochý zvuk hlasu;
- chybějící nebo nekonzistentní metadata, žádný doložitelný původ.

**Kontextové stopy (spolehlivější):**

- záznam se objeví bez původního zdroje a šíří se rychle přes anonymní účty;
- obsah dokonale zapadá do již existující kampaně proti osobě;
- naléhavost: „podívej se hned, než to smažou“;
- žádost o peníze nebo o akci pod vlivem hlasu či videa blízké osoby nebo nadřízeného.

## Mechanismus

Deepfake nepůsobí jen tím, že klame. Na úrovni struktury **mění status audiovizuálního
důkazu jako kategorie**: když lze padělat cokoli, ztrácí váhu i pravda. Tím se otevírají
dvě cesty k [epistemické anihilaci](@/glossary/epistemicka-anihilace.md) – zaplavení
prostoru padělky (srov. [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md))
a zpochybnění pravých záznamů (dividenda lháře). Obě vedou k tomu, co Baudrillard popsal
jako [hyperrealitu](@/glossary/hyperreality.md): simulakra předcházejí skutečnosti a
nahrazují ji (srov. [Simulacra](@/glossary/simulacra.md)).

Obrany založené na původu (*provenance*) – obsahová pověření standardu C2PA, atestace
záznamu vázaná na hardware, vodoznaky – se nasazují, čelí však základní adversariální
dynamice: každou obranu, kterou útočník vidí, lze obejít optimalizací proti ní.

## Odlišení

- **Mělký padělek (*cheapfake*).** Úprava bez neuronových sítí – zpomalení, vystřižení,
  falešný popisek. Často stejně účinný; obranou je kontrola kontextu.
- **Satira a umění.** Syntetická média s jasným označením a bez úmyslu klamat nejsou
  útokem; problémem je odstranění označení při dalším šíření.
- **Dezinformace obecně.** Deepfake je jedním z jejích nástrojů; viz [Info-Ops](@/glossary/info-ops.md)
  a [Propaganda](@/glossary/propaganda.md).

## Význam pro Kompendium

Kompendium řadí útoky pomocí deepfaků mezi techniky poškození reputace a identity: [EA-2.3.7
Deepfake personální](@/kompendium/techniques/ea-2-3-7-deepfake-personalni.md) popisuje
cílený útok na konkrétní osobu, [EA-9.2.1](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md)
syntetickou personu. Filozofické důsledky pro epistemologii svědectví rozebírají [7.
Teoretické reflexe](@/kompendium/07-teoreticke-reflexe/_index.md).

Na platformě, z níž kniha vzešla, jsou deepfaky modelovány jako **hlavní vektor hrozby**
v několika subsystémech:

- fáze hodnocení zdrojů v [Decision Engine](@/glossary/decision-engine.md) přiřazuje
  zpracovávaným audiovizuálním důkazům skóre důvěry v původ; nepodepsaná média z kanálů
  s nízkou důvěrou mají nižší váhu bez ohledu na zdánlivý obsah;
- [NABLA Infinity](@/glossary/nabla-infinity.md) provádí křížové kontroly napříč
  modalitami: tvrzení doložená jediným kanálem (jen video, jen zvuk) mají nižší
  epistemickou váhu než tvrzení potvrzená více kanály s nezávislým původem;
- scénáře Red Teamu ([Color Teams](@/glossary/color-teams.md)) zahrnují útoky s využitím
  deepfaků: podvod s falešným generálním ředitelem, vymyšlená politická podpora, videa
  s falešným svědectvím pod cizí vlajkou.

## Obrana a zotavení

**Pro jednotlivce:**

- ověřovat přes druhý, nezávislý kanál (zavolat zpět na známé číslo, dohodnuté heslo
  v rodině);
- u šokujícího obsahu počkat a hledat původní zdroj (viz [Ověřování
  tvrzení](@/kompendium/self-defense-guides/4-claim-verification.md) a [Rozpoznání obsahu
  z AI](@/kompendium/self-defense-guides/40-ai-content-detection.md));
- při zneužití vlastní podoby zajistit důkazy, nahlásit obsah platformě a vyhledat právní
  pomoc; jde o vážnou újmu, nikoli o „internetovou maličkost“.

**Pro organizace:** postupy dvojího ověření u plateb a citlivých pokynů, výcvik zaměstnanců
(viz [vzdělávací scénář Detekce deepfaků](@/kompendium/educational-scenarios/16-deepfake-detection.md)),
uchovávání originálů s doloženým původem.

Deepfaky nejsou jen problémem „falešného obsahu“; jsou **systémovou erozí audiovizuálního
důkazu** jako kategorie, s důsledky pro žurnalistiku, právo, zpravodajskou činnost
i mezilidskou důvěru.

## Literatura

- Robert Chesney, Danielle Keats Citron: „Deep Fakes: A Looming Challenge for Privacy,
  Democracy, and National Security“, *California Law Review* (2019).
- Jean Baudrillard: *Simulacres et simulation* (1981).

## Související

**Pojmy**

- [Epistemic Security](@/glossary/epistemic-security.md) – obor, který studuje systémové
  hrozby pro kolektivní poznávání.
- [Info-Ops](@/glossary/info-ops.md) – informační operace vojenského typu.
- [Firehose of Falsehood](@/glossary/firehose-of-falsehood.md) – příbuzná dezinformační
  technika.
- [Hyperreality](@/glossary/hyperreality.md) – baudrillardovský rámec syntetické reality.
- [Delegitimizace](@/glossary/delegitimizace.md) – dynamika dividendy lháře.
- [Epistemická anihilace](@/glossary/epistemicka-anihilace.md) – ústřední pojem Kompendia.

**Techniky a obrana**

- [EA-2.3.7 Deepfake personální](@/kompendium/techniques/ea-2-3-7-deepfake-personalni.md) –
  cílený útok na osobu.
- [Detekce deepfaků](@/kompendium/educational-scenarios/16-deepfake-detection.md) –
  vzdělávací scénář.
- [NABLA Infinity](@/glossary/nabla-infinity.md) – křížová kontrola napříč modalitami na
  platformě.
- [Kompendium](@/kompendium/_index.md) – celá taxonomie.

<!-- kompendium:odvozene-vazby:begin (scripts/derive-links.py; neupravovat ručně) -->

## Strukturní vazby

- [Bridge: deepfake](@/kompendium/glossary-bridges/bridge-deepfake.md) – most: jak se tento pojem projevuje v kapitolách knihy

<!-- kompendium:odvozene-vazby:end -->
