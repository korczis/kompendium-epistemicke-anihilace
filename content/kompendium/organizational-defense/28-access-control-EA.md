+++
title = "Řízení přístupů s EA fokusem"
description = "Kdo má přístup, určuje, kdo co vidí a kdo může měnit záznamy. Kapitola popisuje nejmenší nutná oprávnění, pravidelnou recertifikaci, odebírání přístupů a zneužití přístupu k izolaci lidí."
weight = 280

[taxonomies]
tags = ["kompendium", "organizational-defense", "operational"]
categories = ["academic", "organizational", "governance"]

[extra]
related_terms = ["27-information-classification", "29-segregation-duties", "26-contractor-vetting", "24-documentation-standards"]
toc = true
+++

# Řízení přístupů s EA fokusem

> **Pilíř:** Provoz · **Oddíl:** [Organizační obrana](@/kompendium/organizational-defense/_index.md)

Řízení přístupů se obvykle chápe jako bezpečnostní disciplína: kdo se smí přihlásit, kam a
s jakými právy. Z hlediska Kompendia má ještě dva rozměry. Kdo má přístup k informacím,
ovládá, co ostatní mohou vědět; kdo má právo měnit záznamy, ovládá, co bude platit za
minulost. A odebrání přístupu je jedním z nejtišších způsobů, jak člověka vyřadit z
organizace, aniž by ho kdo formálně vyloučil. Kapitola proto řeší přístupy jako otázku
bezpečnosti i epistemické integrity.

## Riziko v daném prostředí

Typickým jevem je postupné hromadění oprávnění (privilege creep): lidé léta získávají práva
a nikdo jim je neodebírá, až vzniknou správci, které nikdo nekontroluje. V nemocnici jde o
přístup do zdravotnické dokumentace, kde nahlížení bez důvodu (například do záznamů známé
osoby nebo kolegy) je vážným porušením. Ve škole o to, kdo může měnit známky a záznamy o
chování v elektronické evidenci. Na univerzitě o přístup k výzkumným datům a k hodnocení.
Ve veřejné správě o přístup do registrů a jeho zneužití k soukromým účelům. V médiích o to,
kdo může tiše upravit již publikovaný článek. Ve firmě o přístup bývalých zaměstnanců a
externistů, který nikdo neukončil.

## Strukturální zranitelnosti

- Přístupy se přidělují snadno a odebírají zřídka.
- Bývalí zaměstnanci a externisté mají stále vzdálený přístup.
- Správcovské účty jsou sdílené, bez rotace a bez vícefaktorového ověření.
- Nezaznamenává se, kdo co viděl a změnil, nebo se záznamy nikdo nečte.
- Jedna osoba může měnit data i záznamy o jejich změnách.
- Přístup se používá jako nástroj moci: člověku se „zapomene“ přidělit přístup k
  informacím, které potřebuje (srov. [institucionální vyloučení](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md)).

## Ochranné struktury

- Princip nejmenších nutných oprávnění a přístup podle role.
- Pravidelná recertifikace: vlastníci dat a vedoucí každé čtvrtletí nebo pololetí potvrzují,
  že přístupy jsou stále potřebné.
- Automatické odebírání nepoužívaných oprávnění po stanovené době a okamžité odebrání při
  odchodu.
- Vícefaktorové ověření na kritických systémech, osobní správcovské účty, přístup na dobu
  nezbytně nutnou.
- Neměnné záznamy o přístupech a změnách, které spravuje někdo jiný než ten, koho
  zaznamenávají – navazuje na [oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md).
- Pravidlo, že omezení přístupu zaměstnance k informacím potřebným pro práci musí být
  odůvodněné a zaznamenané.

## Role a odpovědnosti

Vlastník dat rozhoduje, kdo k nim smí. IT přístupy technicky spravuje, ale o nich
nerozhoduje. Personální útvar hlásí nástupy, změny a odchody. Bezpečnostní manažer nebo
interní audit kontroluje recertifikaci a záznamy. Vedoucí odpovídají za to, že jejich lidé
mají přístupy, které potřebují – ne víc a ne méně.

## Politiky a postupy

1. Politika řízení přístupů s rolemi, schvalováním a lhůtami.
2. Napojení na personální systém: nástup, změna role a odchod automaticky spouštějí změnu
   přístupů.
3. Pravidelná recertifikace s eskalací nepotvrzených přístupů.
4. Monitorování záznamů o přístupech k citlivým datům a namátkové kontroly odůvodnění.
5. Postup pro externí osoby – viz [prověřování kontraktorů](@/kompendium/organizational-defense/26-contractor-vetting.md).
6. Ochrana záznamů o přístupech před úpravou.

## Vzdělávání a trénink

Uživatelé se učí, proč nesdílet hesla a účty a proč hlásit oprávnění, která nepotřebují.
Vedoucí se učí recertifikovat skutečně, a ne hromadným potvrzením. Správci systémů se učí
odolávat tlaku na mimořádné přístupy („ředitel to potřebuje hned“) – vzorec
[sociálního inženýrství](@/kompendium/cross-domain/17-ea-security-social-engineering.md)
spojený s autoritou a časovým tlakem.

## Řešení incidentu

Při podezření na zneužití přístupu (nahlížení bez důvodu, změna záznamů, únik):

1. Zajistit záznamy o přístupech a změnách dřív, než mohou být přepsány.
2. Omezit přístupy dotčeného účtu.
3. Zjistit rozsah: jaká data, jaké změny, kdo je dotčen.
4. Obnovit původní stav dat z neměnných záloh a doložit rozdíl.
5. Informovat dotčené osoby a podle GDPR případně dozorový úřad.

Při podezření, že přístup byl odebrán jako forma vyloučení:

1. Ověřit, kdo a proč přístup omezil, a zda to bylo zaznamenáno a odůvodněno.
2. Obnovit přístup, pokud pro omezení nebyl důvod, a posoudit, zda nejde o odvetu.

**Příklad (anonymizovaný kompozit).** V redakci se ukázalo, že u několika publikovaných
článků byly bez poznámky změněny pasáže, které se nelíbily inzerentovi. Systém umožňoval
úpravy bez záznamu verzí. Po zavedení povinného záznamu úprav a poznámky o opravě se tichá
změna publikovaného textu stala dohledatelnou.

## Ochrana dotčené osoby

Osoba, jejíž údaje byly neoprávněně zobrazeny nebo změněny (pacient, žák, zaměstnanec), má
právo to vědět a domáhat se nápravy. Zaměstnanec, kterému byl přístup odebrán po oznámení
nebo stížnosti, může jít o oběť odvetného opatření podle zákona č. 171/2023 Sb. Pro člověka,
kterému se náhle „ztratí“ přístupy a informace, je situace dezorientující; potřebuje rychlé
vysvětlení a nápravu.

## Vyhodnocení a indikátory selhání

- Bývalí zaměstnanci stále mají vzdálený přístup, správci bez rotace, bez vícefaktorového
  ověření na kritických systémech.
- Recertifikace je hromadné potvrzení bez kontroly.
- Záznamy o přístupech nikdo nečte nebo je lze upravit.
- Přístupy se odebírají bez záznamu a důvodu.

Metriky: podíl přístupů recertifikovaných v termínu, doba od odchodu do odebrání přístupů,
počet správcovských účtů.

## Meze a otevřené otázky

Přísné řízení přístupů může zpomalit práci a vést k obcházení (sdílení účtů). V nouzi
(zdravotnictví) je třeba mít možnost mimořádného přístupu, který se dodatečně zdůvodní.
Otevřené zůstává, jak řídit přístupy v cloudových nástrojích, kde si uživatelé sdílejí
dokumenty sami a organizace ztrácí přehled.

## Související

**Sesterské kapitoly**

- [Klasifikace informací](@/kompendium/organizational-defense/27-information-classification.md)
  – co je citlivé.
- [Oddělení povinností](@/kompendium/organizational-defense/29-segregation-duties.md) – kdo
  smí měnit data a kdo záznamy.
- [Prověřování kontraktorů](@/kompendium/organizational-defense/26-contractor-vetting.md) –
  přístupy externích osob.
- [Dokumentační standardy](@/kompendium/organizational-defense/24-documentation-standards.md)
  – verze a ochrana proti přepisu.

**Analýza a bezpečnost**

- [EA × Security: Insider Threat](@/kompendium/cross-domain/20-ea-security-insider-threat.md)
  – zneužití legitimního přístupu.
- [EA × Compliance: NIS2 – Information Integrity Pillar](@/kompendium/cross-domain/25-ea-compliance-nis2-integrity.md)
  – integrita informací jako požadavek.
- [Elektronické důkazy](@/kompendium/forensic-legal/35-electronic-evidence-EA.md) – záznamy
  o přístupech jako důkaz.

**Techniky**

- [EA-2.1.7 Institucionální vyloučení](@/kompendium/techniques/ea-2-1-7-institucionalni-vyloucenni.md)
  – odebrání přístupu jako vyloučení.
