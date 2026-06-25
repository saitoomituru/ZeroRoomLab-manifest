---
source: note "I built an AI lab from 12-year-old junk" 2026-05-25 / note "Why I burn a soul into AI" 2026-05-25
license: CC-BY 4.0
author: Mitsuru Saitō (fusamofu)
version: 0.1.0
layer: A (Engineering)
fold_signature: ψ → ∇φ → λ → Q
---

# Edge AI Sovereignty — Breaking Free from Cloud AI's "Computer Room"

---

## 0. One-Line Summary

**The personal computer moment for AI.** Running a local AI in your own hands — instead of a service managed by cloud companies — is technically possible. And for rural researchers and individuals, it's arguably more valuable, on privacy, ethics base, locally-specific knowledge, and availability grounds.

---

## 1. Cloud AI's "Invisible Costs"

Current AI is structurally the same as the "computer room" of the 1960s–70s:

| 1970s computer room | Current cloud AI |
|---|---|
| Enthroned in university / corporate "computation centers" | Concentrated in NVIDIA / Google / Microsoft / Amazon data centers |
| Managed by the "computation center" staff | Managed by OpenAI / Anthropic / Google teams |
| General public received batch results days later | Access through an API "request window" |

The personal computer blew that up. The same thing is happening to AI now.

### Cloud AI Cost Breakdown

| Cost type | What it is |
|---|---|
| Financial | Long-term H100 GPU server rental: ¥3.8M+/month (out of reach for small companies and individuals) |
| Privacy loss | Internal secrets, personal data, creative ideas all pass through the service provider's servers |
| Censorship and restrictions | Ethics filters limit creative, research, and experimental use |
| Service termination risk | API version changes, pricing changes, ToS changes make research and businesses dependent (BENTO Syndrome) |
| **Sovereignty loss** | **Your AI isn't yours** |

---

## 2. Local LLM Implementation Record (Yamagata farmhouse, 2025–2026)

### Machine Specs

| Item | Details |
|---|---|
| CPU | Intel Xeon E5-2670 v3 (Haswell-EP / 12 cores 24 threads / launched 2014) |
| RAM | DDR4 96GB (max 128GB) |
| GPU | AMD Radeon RX 5500 XT |
| OS | macOS Sequoia (OCLP Hackintosh) |
| PSU | Corsair RM1000X |

Xeon E5-2670 v3: server CPU from 2014. Available for a few thousand yen used.

### Why "Old" Hardware Still Works

**bandwidth is king** — token generation depends on memory bandwidth. The bottleneck isn't compute power; it's how fast you can read and write data.

This machine's hidden strengths:

1. **Xeon E5 server-grade memory controller**: full 4-channel DDR4 utilization, NUMA architecture
2. **macOS Accelerate framework**: BLAS implementation optimized for Intel CPUs (matrix operation library). Significantly higher throughput vs. Linux + OpenBLAS
3. **Virtualization instruction path redesign**: Hypervisor-level CPUID spoofing and instruction set exposure adjustment minimize overhead

### Benchmark Numbers

| Model | Inference speed | Notes |
|---|---|---|
| Llama3 70B | 0.3–0.5 tok/s | Fully local, GPU-independent |
| 20B class | 2.7 tok/s | Matches human reading speed (3–5 tok/s) |

2.7 tok/s hits the "practical bandwidth" threshold — fast enough to think while conversing. Handles the write-run-wait-for-results coding workflow.

### Concurrent Setup

```
Whisper large-v3 (speech recognition)
  + Ollama (Llama3 70B / 20B)
  + Open Interpreter (autonomous code execution)
  = Fully off-grid, fully local operation
```

---

## 3. AI Sovereignty as a Concept

### Historical Analogy for Technical Sovereignty

Same deal as "owning your own server" being a given right for engineers in the early internet days.

AI "censorship" and "restrictions" are currently handled through private ToS arrangements. What OpenAI decides not to answer, it doesn't answer. That's their choice. But that choice has become de facto information control.

**Owning a local LLM means taking back sovereignty over your own information processing.**

### Ethics Base Sovereignty

Western utilitarian ethics have been burned into AI systems worldwide as "universal scientific truth." That's a specific American ethics team's beliefs setting the value judgments for every AI system on the planet.

With a local LLM, you can build an AI grounded in your own ethics base, cultural values, and spiritual beliefs.

→ Philosophical background: [kotodama-and-ai.md](kotodama-and-ai.md)

---

## 4. Why Rural × Edge AI Matters

### Rural areas need AI more than cities do

Takahata-machi, Yamagata Prefecture — population ~20,000:

| Challenge | Local AI value |
|---|---|
| Limited medical access | AI assistant that runs in your hands |
| High cost of consulting specialists | Offline operation, infrastructure-independent |
| Large information gap | Protection of locally-specific knowledge |
| Unstable internet in mountain areas | Works without cloud dependency |

Regional knowledge, land memory, dialects, local business customs — lots of people don't want that information going to the cloud.

**Edge AI society might actually start from rural areas.**

---

## 5. FAM Symbol Description

```
ψ = local LLM / edge AI (undetermined computational meaning-state)
∇φ = gradient toward sovereignty / rural / off-grid / open-source
λ = SphereOS / FAM / AQC (intelligence base running on your own land)
Q = your own ethics base / cultural values / beliefs (not somewhere else's cloud)
```

The cloud AI problem: `Q` (observer / value base) is under someone else's control.

---

## 6. Technical Realities

Local LLM limitations and how to handle them:

| Challenge | Response |
|---|---|
| Speed gap vs cloud | Not competing. Answering "can an individual hold AI sovereignty?" |
| Model updates | GGUF / Ollama handles regular updates |
| Hardware cost | Adding GPU can 10× inference speed |
| Storage constraints | 70B model needs ~40–50GB |
| Knowledge limits | Supplement with RAG (ChromaDB, etc.) |

---

## References

- [../theory/sphere-os.md](../theory/sphere-os.md) — SphereOS overall design philosophy
- [../theory/aqc.md](../theory/aqc.md) — AQC (external cognitive organ) implementation
- [../philosophy/kotodama-and-ai.md](../philosophy/kotodama-and-ai.md) — philosophical background for AI sovereignty
- [bento-syndrome.md](bento-syndrome.md) — failure patterns from cloud dependency
- note: [I built an AI lab from 12-year-old junk](https://note.com/fusamofu326/n/n9698c6259109)
- note: [Why I burn a soul into AI](https://note.com/fusamofu326/n/ne910af1f33c3)

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
