---
source: Master context / ふさもふ_コンテキスト_マスター_2026-06-13 (technical background section)
license: CC-BY 4.0
author: 齋藤みつる (fusamofu)
version: 0.1.0
fold_signature: ψ → ∇φ → λ → Q
---

# ZeroRoomLab Technical Timeline

Mitsuru Saitō (fusamofu) — technical history and project chronology.

**Misinfo guard — never write these:**
- "national champion" → correct: "nationals qualifier" or "placed in nationals"
- "Apple employee" → correct: "contract-based engagement"

---

## Timeline

| Period | Event |
|---|---|
| Elementary school | Reverse-engineered PS encryption, burned to microcontroller, traded chips with overseas hackers in English, sold to Chinese contacts to help cover rent ("Heisei-era homeless kid"). Activity stopped; spent formative years at a child welfare facility. |
| Industrial high school | Micro-car radio-controlled rally (microcontroller car). **Regional championship winner / placed in nationals** (not national champion — a common misunderstanding). Quit after being assaulted. Left school due to dysgraphia. |
| Freelance period | Acquired IT certifications in succession. Non-regular employment at NEC and BIGLOBE. |
| Apple Japan period | Scouted to FileMaker team via NEC contacts. Contract-based engagement — four-digit-万円 offer. Developed technology to adapt iPhone to Japan's feature phone culture. Contract ended with "all deliverables belong to us" terms — work history erased from résumé. |
| Dentsu period | DTP and server-side work. Formed background as Dentsu-lineage designer. |
| 2011–2021 | Ran Gōdō Kaisha inferno (see below). |
| 2013 | Built generative art pipeline: Blender + number theory-based world generator + Adobe integration. |
| 2022-03 | Shipped a context-aware automatic video editing tool — FileMaker + AWS Lambda + proprietary corpus + YT Studio FM plugin. Semantically smarter than CapCut, six months before ChatGPT launch. |
| 2019– | Independent AI architecture development: Sphere Architecture / FAM / EdoHAGE1024. GPT-3.5~4 + WebRTC P2P LLM system (ran on GPTs Store → stopped by API changes → migrated to Ollama local). |
| Yamagata move | Relocated from Tokyo to Yamagata. Taken in by partner's old farmhouse. Started from zero — no electricity, no water — drilled a well with a boring machine, built self-sufficient infrastructure. |

---

## Gōdō Kaisha inferno (2011–2021)

- Incorporated from infernoayaseWorks
- AI development, medical AI research, content operations
- 2019: Submitted technology presentations to University of Tokyo Iwasaki Lab, Kyoto University, and Mizueda Medical Corporation (mol MIP project)
- Dissolution reasons: AI IP dispute, conflict with overseas data protection interests (Baidu/Alibaba-affiliated), industrial espionage, internal embezzlement, medical information data breach
- **¥300M national compensation claim (priority creditor, bankruptcy exemption-exempt) remains outstanding**

---

## AI Architecture Lineage: mol MIP → FAM

### mol MIP (Molecular Medical Intelligence Processor)

- Foundation: technology presentation submitted to Iwasaki Lab (U Tokyo) and Mizueda Medical in 2019
- Proposed as an attention function design for a medical-grade human psychological simulator LLM
- Key design: **amygdala emulation** as an attention function
- Brain structure mapping: prefrontal cortex / hippocampus / amygdala / nucleus accumbens / A10 neural nucleus / olfactory bulb / caudate nucleus
- **300-person committee model**: expanded Dunbar's number to ~300 as a "shared recognition space" — proposed hypothesis that "divergence from shared recognition is how psychiatric disorders get diagnosed"
- Mizueda subsequently documented this as the "silence problem and limits of community psychiatry" in a medical publication

### Legal Clearance (Confirmed)

- Deliberation by Igaki Patent Law Office: **IP boundary between Iwasaki Lab and fusamofu confirmed**
- Academic portion → Iwasaki Lab IP / FAM implementation → fusamofu IP
- FAM use and continued development: legally clear

### FAM (FoldAccessMapper)

- Maps "reading the room" spaces — which vary by region and culture — via Fold structure
- Connects silos in an explainable form
- Core description and connection layer within Quantaril Cloud's lower implementation group
- Integrates with AQC / SphereOS / ChromaDB

---

## Current Technology Stack

| Category | Details |
|---|---|
| Hardware | ASRock X99 Extreme4 / i7-5820K (Haswell-E, 6C/12T) / SMBIOS/CPUID tuned to Xeon E5-2670 v3 profile / RX 5500 XT / macOS 15.7.7 Hackintosh |
| Local LLM | Ollama (96GB) — Llama3 70B CPU+RAM verified in production (36,654 impressions) |
| Cloud AI | Claude API / MCP integration (Gmail, Calendar, Drive) |
| Video | DaVinci Resolve / OBS + X Media Studio (RTMP) |
| Data | Python / pandas / FileMaker / ChromaDB |
| 3D | Blender MCP / FreeCAD MCP / NOVA3D Whale3 Ultra (medical-grade servo swap) |

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
