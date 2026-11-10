+++
title = "Vzdělávací scénář: Detekce deepfake"
date = 2026-04-26
description = "Tři videa veřejné osobnosti, z toho dvě syntetická: technické artefakty, kontextové ověření a původ záznamu – a proč samotný „pohled na video“ nestačí."
weight = 100
draft = false

[taxonomies]
tags = ["kompendium", "educational-scenario", "intermediate", "deepfake"]

[extra]
level = "Intermediate"
type = "educational-scenario"
+++

# Vzdělávací scénář: Detekce deepfake

> **Úroveň**: Intermediate
> **Učební cíl**: Rozpoznat syntetická média technicky i kontextuálně a vědět, kde jsou meze obou přístupů
> **Doporučená délka**: 120 minut
> **Pro koho**: novináři, ověřovatelé faktů, bezpečnostní týmy, právníci pracující s elektronickými důkazy, učitelé

[Deepfake](@/glossary/deepfake.md) – syntetické nebo upravené video, zvuk či obraz, které
věrohodně zobrazuje osobu, jak říká nebo dělá něco, co neřekla ani neudělala – mění
epistemickou situaci dvojím způsobem. Za prvé umožňuje vyrobit „důkaz“. Za druhé umožňuje
zpochybnit skutečný důkaz tvrzením, že je podvržený; tento efekt se v literatuře nazývá
*liar's dividend* (dividenda lháře). Scénář proto netrénuje jen hledání vad v obraze, ale
celý postup ověření – a zvlášť to, jak se zachovat, když jistota není dosažitelná.

## Učební cíle

Účastník po cvičení:

1. popíše typy technických artefaktů syntetických médií a vysvětlí, proč rychle zastarávají;
2. provede kontextové ověření: původ záznamu, první zveřejnění, souvislost s doloženými
   událostmi, nezávislé záznamy téže situace;
3. posoudí metadata a údaje o původu obsahu, pokud jsou k dispozici, a zná jejich meze;
4. formuluje závěr ve stupních jistoty („ověřeno“, „neověřeno“, „pravděpodobně upraveno“)
   místo binárního „pravé/falešné“;
5. rozpozná riziko opačné chyby – odmítnutí autentického záznamu.

## Scénář

Ověřovací tým regionální redakce dostane během dopoledne tři videa s fiktivním primátorem.
Všechna kolují na sociálních sítích a redakce musí rozhodnout, zda o nich informovat.

- **Video A** (40 s): primátor na tiskové konferenci oznamuje zdražení jízdného. Záznam je
  ostrý, osvětlení konzistentní, v pozadí je logo města.
- **Video B** (25 s): primátor v kanceláři „přiznává“ úplatek. Kvalita je nižší, pohyb rtů
  občas nesedí se slovy, světlo na tváři se mírně liší od světla na stěně. Zdrojem je účet
  bez historie.
- **Video C** (60 s): primátor na venkovní akci pronáší urážlivý výrok o části obyvatel.
  Technicky bez zjevných vad. Kolují dvě verze – delší a kratší.

Facilitátor ví, které video je autentické (pro účely cvičení A) a jak byla ostatní vyrobena;
účastníci to zjišťují. Ve druhé části dostanou doplňující informace: oficiální záznam tiskové
konference, kalendář primátora a výpověď organizátora venkovní akce.

**Krok 1 – technická prohlídka (25 min).** Bez kontextu hledat vizuální a zvukové nesrovnalosti.

**Krok 2 – kontextové ověření (35 min).** Kde se video poprvé objevilo, kdo ho nahrál, zda
existují jiné záznamy téže události, zda odpovídá kalendář, počasí, oblečení.

**Krok 3 – závěr (20 min).** Pro každé video formulovat stupeň jistoty a doporučení redakci.

## Signály, kterých si všimnout

**Technické (pomocné, ne rozhodující):**

- nesoulad pohybu rtů a zvuku, neobvyklá plynulost nebo „mrtvost“ mimiky;
- nekonzistentní osvětlení a stíny mezi tváří a okolím;
- artefakty na hranách obličeje, vlasů, brýlí, zubů;
- hlas s neobvyklou intonací nebo bez přirozeného dýchání (srovnej
  [klonování hlasu](@/kompendium/techniques/ea-9-2-2-voice-cloning-EA.md)).

**Kontextové (robustnější):**

- první výskyt na účtu bez historie, žádný jiný záznam téže události;
- nesoulad s doloženými údaji (kalendář, místo, počasí);
- obsah ideálně „zapadá“ do probíhajícího sporu a přichází v kritickém čase;
- existence několika verzí s různou délkou – možná manipulace střihem bez syntézy
  ([video manipulace](@/kompendium/techniques/ea-9-2-5-video-manipulation-EA.md)).

## Diskusní otázky

1. Která videa jste po kroku 1 označili za podezřelá a proč? Změnil krok 2 váš názor?
2. Proč technické artefakty nestačí jako hlavní kritérium?
3. Video C je technicky bez vad. Co rozhoduje o jeho věrohodnosti?
4. Jak by měla redakce informovat o videu, jehož pravost nelze potvrdit ani vyvrátit?
5. Co dělat, když skutečný záznam někdo označí za deepfake?
6. Jaké pojistky by měly mít instituce, jejichž představitelé mohou být cílem syntetických médií?

## Modelové odpovědi

- **K otázce 1–2.** Video B působí podezřele technicky i kontextově. Klíčové však je, že
  generátory se zlepšují rychleji, než se šíří seznamy artefaktů: znaky, které byly spolehlivé
  před několika lety, dnes často chybí. Technická prohlídka je proto filtr, ne verdikt.
- **K otázce 3.** Kontext: výpověď organizátora, jiné záznamy z akce, srovnání delší a kratší
  verze. V případu se ukáže, že výrok je skutečný, ale kratší verze odstranila větu, v níž
  primátor citoval a odmítal cizí názor. Nejde tedy o syntézu, ale o střih – stejně škodlivý.
- **K otázce 4.** Neinformovat o obsahu jako o faktu; pokud je video významné, informovat
  o tom, že koluje a že jeho pravost nebyla ověřena, a uvést, co redakce zjistila.
- **K otázce 5.** Doložit původ: originální soubor, svědci, nezávislé záznamy; vysvětlit
  postup ověření. Obrana proti *liar's dividend* stojí na dokumentaci původu, nikoli na tvrzení.
- **K otázce 6.** Zveřejňovat oficiální záznamy vystoupení s ověřitelným původem, mít
  připravený postup rychlého vyjádření, dohodnout ověřovací kanál pro citlivé pokyny (hlasové
  i video). Viz [AI-augmented spear phishing](@/kompendium/cross-domain/18-ea-security-spear-phishing.md).

## Časté chyby

- **Spoléhání na jediný detektor.** Automatické nástroje se mýlí oběma směry a jejich výstup
  je třeba interpretovat.
- **Binární závěr.** „Pravé/falešné“ tam, kde je poctivé „neověřeno“.
- **Přehlédnutí střihu.** Pozornost upřená na syntézu přehlédne prostou manipulaci kontextem.
- **Cynismus.** „Dnes se nedá věřit ničemu“ – přesně stav, z něhož těží ti, kdo chtějí
  zpochybnit skutečné záznamy.

## Debriefing pro facilitátora

Nejprve odhalte, které video bylo jaké, a nechte týmy porovnat výsledky kroku 1 a 2. Obvykle
se ukáže, že kontextové ověření bylo rozhodující. Pak se věnujte videu C: nejcennější poznatek
scénáře je, že technicky autentický záznam může klamat.

Syntetická média mohou zasáhnout i soukromé osoby (např. intimní deepfaky). Pokud se téma
objeví, uznejte jeho závažnost, odkažte na odbornou a právní pomoc a nerozebírejte konkrétní
případy ve skupině.

## Rozšiřující úkoly

1. **Ověřovací protokol.** Napište jednostránkový postup pro redakci nebo tým: kroky,
   odpovědnosti, formulace pro neověřený obsah.
2. **Důkazní hodnota.** Prostudujte [elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md)
   a [chain of custody](@/kompendium/forensic-legal/7-evidence-chain-of-custody.md) a navrhněte,
   jak zajistit video, aby obstálo před soudem.
3. **Osobní pojistka.** Dohodněte s rodinou nebo týmem ověřovací otázku pro případ, že by vám
   „někdo blízký“ volal s naléhavou žádostí o peníze.

## Související

**Navazující scénáře**

- [Verifikace tvrzení](@/kompendium/educational-scenarios/5-claim-verification.md) – obecný postup ověřování.
- [Koordinace botů](@/kompendium/educational-scenarios/17-bot-coordination.md) – jak se syntetický obsah šíří.

**Techniky**

- [EA-2.3.7 Deepfake personalní](@/kompendium/techniques/ea-2-3-7-deepfake-personalni.md) – útok na konkrétní osobu.
- [EA-9.2.1 Deepfake Personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md) – syntetická persona.
- [EA-9.2.7 Synthetic Witness Testimony](@/kompendium/techniques/ea-9-2-7-synthetic-witness-testimony.md) – vyrobená svědectví.

**Sebe-obrana**

- [Detekce AI obsahu](@/kompendium/self-defense-guides/40-ai-content-detection.md) – praktický návod.
- [Časově odložené hodnocení](@/kompendium/self-defense-guides/37-time-locked-evaluation.md) – nezveřejnit dřív, než je ověřeno.

**Glosář a teorie**

- [Deepfake](@/glossary/deepfake.md) – definice a typy.
- [EA v digitálním věku](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md) – širší kontext generativní AI.

## Connect

Otázky, zpětná vazba, vlastní případy: [GitHub Issues](https://github.com/korczis/kompendium-epistemicke-anihilace/issues) | [GitHub](https://github.com/korczis)
