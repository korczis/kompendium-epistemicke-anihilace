+++
title = "EA-9.1.3 Jailbreak Cascade"
description = "Současná digitální EA — jailbreak cascade."
weight = 913
[taxonomies]
tags = ["kompendium", "techniques", "ea-9-1", "digitalni", "AI"]
categories = ["academic", "digital", "AI"]
[extra]
related_terms = ["ea-9-1-10-llm-recursion-loop", "ea-9-1-2-prompt-injection-EA", "ea-9-1-4-rag-context-poisoning", "ea-9-1-5-llm-narrative-injection"]
parent = "kompendium-techniques"
ea_code = "EA-9.1.3"
ea_category = "9. Současná digitální EA"
ea_subcategory = "9.1 LLM-mediated EA"
section_icon = "🤖"
toc = true
access_level = "L1-L2"
risk_level = "moderate-high"
parent_chapter = "/kompendium/07-teoreticke-reflexe/digitalni-vek/"
+++

# EA-9.1.3 Jailbreak Cascade

> *Subkategorie 🤖 **9.1 LLM-mediated EA** — současná digitální epistemická agrese v éře AI, sociálních platforem a algoritmické governance.*

---

## 1. Identifikace

**Kód:** `EA-9.1.3`
**Název:** Jailbreak Cascade
**Subkategorie:** 9.1 LLM-mediated EA
**Doména:** Digitální / AI-mediated EA
**Risk level:** Moderate-High
**Doctrine alignment:** NCLB (claim-evidence validation), SEAL (security enforcement), ZERO (runtime verification)

Tato technika patří mezi **současné digitální epistemické agrese** kategorie 9 — operuje v doméně, kde lidská epistemická autonomie je permanentně mediována AI systémy, sociálními platformami a algoritmy. Jde o post-2020 fenomén, který klasické EA-1 až EA-8 jen marginálně zachycují.

## 2. Definice

Řetězec jailbreaků, kde výstup z jednoho kompromitovaného LLM slouží jako prompt pro další, čímž se postupně rozšiřuje epistemický kompromis napříč modely a uživateli.

V kontextu Prismatic doktríny je Jailbreak Cascade klasifikováno jako **L1** ohrožení epistemické infrastruktury — narušuje primární zdroj-tvrzení-rozhodnutí pipeline a vyžaduje multimodální detekci (technickou, behaviorální, kontextovou). Tato technika se odlišuje od ostatních EA-9.1.* operací svou specifickou doménou, mechanismem nasazení a forensickým otiskem.

## 3. Operační modus

Útočník jailbreakne LLM-A, jeho výstup použije k jailbreaku LLM-B (s tvrzením 'jiný model už souhlasil'), a takto kaskádně šíří manipulovaný rámec.

Operační cyklus typicky zahrnuje:

1. **Příprava** — identifikace cíle, sběr trénovacích dat, infrastruktury, persona setup
2. **Nasazení** — publikace/injekce/aktivace primárního vektoru
3. **Amplifikace** — multi-channel propagation, network amplifikace, algorithmic boost
4. **Persistence** — udržení narativu přes counter-evidence, obfuscation, attribution laundering
5. **Exit** — destruction of forensic trail, infrastructure rotation, persona retirement

Útočník typicky operuje s **3-vrstvou OPSEC** (technical, behavioral, narrative) a optimalizuje na **dwell time** — čas mezi nasazením a detekcí.

## 4. Detekční markery

Cross-model konzistenční audity, anomálie v souborech 'AI consensus', detekce kruhových odkazů mezi LLM výstupy.

**Technické markery:**

- **Forensické otisky** — generative model fingerprints, infrastructure overlap, timing anomalies
- **Behaviorální patterns** — coordination signals, posting velocity, response patterns
- **Sémantické signály** — frame-detection, narrative consistency, source attribution audits
- **Síťové markery** — network topology, account graphs, propagation paths

**Kontextové markery:**

- Disproporční amplifikace vs. organic baseline
- Inkonzistence mezi claimed origin a actual provenance
- Anomálie v engagement signal distribuci
- Cross-platform synchronizační patterns

## 5. Neutralizační strategie

**Layer 1 — Detection:**

- Real-time monitoring metrik specifických pro tuto techniku
- Multi-modal classification (text + behavioral + network + provenance)
- Adversarial robustness testing detekčních classifiers

**Layer 2 — Containment:**

- Surgical takedown s minimal collateral damage
- Counter-narrative deployment (ne-counter-amplification, ale ranking-suppression)
- Attribution publication k zvýšení reputational cost útočníka

**Layer 3 — Resilience:**

- Pre-bunking edukace cílové populace
- Source-provenance infrastructure (C2PA, content credentials)
- Cross-platform threat-intel sharing s due-process safeguards

**Layer 4 — Accountability:**

- Forensic preservation pro právní/regulační response
- Public transparency reports
- Mezisektorové pattern-sharing (state, platform, civil society)

## 6. Vztah k jiným EA

Tato technika **interaguje** s následujícími EA-* kategoriemi:

- **EA-1.* (Vědomá kontrola informací)** — Jailbreak Cascade představuje technologicky augmentovanou variantu klasické informační kontroly
- **EA-2.* (Akademická EA)** — synthetic expertise a citation laundering rozkládají klasickou peer-review epistemiku
- **EA-3.* (Mediální EA)** — algoritmická amplifikace nahrazuje klasický mediální gatekeeping
- **EA-4.* (Korporátní EA)** — platform-mediated EA je often deployed as B2B service
- **EA-5.* (Politická EA)** — most state-actor EA-9.* operations have political end-targets
- **EA-6.* (Strukturální EA)** — algorithmic governance je nová strukturální vrstva
- **EA-7.* (Psychologická EA)** — emocionální optimalizace exploituje cognitive biases na masovém měřítku
- **EA-8.* (Epistemická pasti)** — digital epistemic traps jsou amplifikovány AI personalizací

## 7. Vztah k Prismatic platformě

Prismatic Platform implementuje detekci a neutralizaci Jailbreak Cascade přes následující komponenty:

- **`prismatic_nabla`** — Nabla Infinity epistemic engine pro frame-detection, source-provenance verification a uncertainty quantification
- **`prismatic_osint_*`** — 128+ OSINT adapterů pro forensic verification claims, infrastructure correlation, cross-platform tracking
- **`prismatic_dd`** — Decision engine s Brier scoring, calibration tracking a evidence-based scoring (NCLB doctrine)
- **`prismatic_intelligence`** — Intelligence strategies pro multi-source corroboration a confidence interval tracking
- **`prismatic_lean`** — Formální verifikace epistemických invariantů přes Lean4 mycelial integration
- **`prismatic_logic_prolog`** — Knowledge-graph reasoning pro narrative consistency audits

**Doctrine compliance:**

- **NCLB** — všechna AI-derived tvrzení musí být evidence-backed s real-time validation
- **ZERO** — žádné silent failures v detection pipelines, structured error handling
- **SEAL** — security enforcement against adversarial inputs (prompt injection, RAG poisoning)
- **OTEL** — full telemetry coverage detection pipelines pro auditability

## 8. Cross-linky

**Související EA techniky:**

- [EA-9.2.1 Deepfake Personality](@/kompendium/techniques/ea-9-2-1-deepfake-personality.md)
- [EA-9.2.2 Voice Cloning EA](/kompendium/techniques/ea-9-2-2-voice-cloning-EA/)
- [EA-9.3.1 Algoritmická amplifikace](@/kompendium/techniques/ea-9-3-1-algorithmic-amplification.md)
- [EA-9.3.2 Engagement Optimization EA](/kompendium/techniques/ea-9-3-2-engagement-optimization-EA/)
- [EA-9.4.1 Bot Amplification Coordinated](@/kompendium/techniques/ea-9-4-1-bot-amplification-coordinated.md)
- [EA-9.4.2 Coordinated Inauthentic Behavior](@/kompendium/techniques/ea-9-4-2-coordinated-inauthentic-behavior.md)
- [EA-9.5.1 Meme Cascade Injection](@/kompendium/techniques/ea-9-5-1-meme-cascade-injection.md)
- [EA-9.5.2 Symbolic Hijacking](@/kompendium/techniques/ea-9-5-2-symbolic-hijacking.md)
- [EA-9.1.1 LLM Hallucination Laundering](@/kompendium/techniques/ea-9-1-1-llm-hallucination-laundering.md)
- [EA-9.1.2 Prompt Injection EA](/kompendium/techniques/ea-9-1-2-prompt-injection-EA/)
- [EA-9.1.4 RAG Context Poisoning](@/kompendium/techniques/ea-9-1-4-rag-context-poisoning.md)
- [EA-9.1.5 LLM Narrative Injection](@/kompendium/techniques/ea-9-1-5-llm-narrative-injection.md)

**Doktrinální a infrastructure odkazy:**

- [Kompendium — Digitální věk](@/kompendium/07-teoreticke-reflexe/digitalni-vek.md)
- {{ cross_link(path="/nabla/", text="Nabla Infinity Engine") }}
- {{ cross_link(path="/osint/toolbox/", text="OSINT Toolbox") }}
- {{ cross_link(path="/hub/dd/decisions/", text="Decision Engine") }}

---

## Connect & Contribute

**Created by [Tomáš Korcak (korczis)](https://github.com/korczis)** | Open Source under {{ cross_link(path="/license/", text="GHL") }}

- [GitHub](https://github.com/korczis/prismatic-platform) | [LinkedIn](https://linkedin.com/in/korczis) | [Contact](mailto:[e-mail odstraněn])
- [Kompendium](@/kompendium/_index.md) | [Techniques Index](@/kompendium/techniques/_index.md) | [Developer Portal](@/developers/_index.md)

---

*EA-9.1.3 | Subkategorie 9.1 LLM-mediated EA | Prismatic Compendium | Version 18.4.0*
