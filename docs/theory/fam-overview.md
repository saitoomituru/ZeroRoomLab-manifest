---
source: Google Drive / FAM技術資料_FoldAccessMapperから情報子工学へ_20260622 (translated)
license: CC-BY 4.0
author: 齋藤みつる (fusamofu)
version: 0.1.0
status: draft
fold_signature: ψ → ∇φ → λ → Q
---

# FAM Overview: FoldAccessMapper Introduction

What FAM is, how it differs from MCP, and how to use it.

Full spec → [FoldAccessMapper.proton.md](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md)

---

## 0. Summary

FAM (FoldAccessMapper) is the **minimum unit for saving thought processes.**

If MCP.json is a protocol that fans out horizontally — listing tools, resources, and Q&A —
then FAM.JSON is a Fold Tree that digs vertically to arbitrary depth,
saving semantic waveforms, gradients, output layers, and verifiers.

```
MCP.json  = horizontal → enumerate knowledge, tools, connection points
FAM.JSON  = vertical   → save thought process, semantic gradient, verification context
```

One line:
- **MCP describes "what you can access."**
- **FAM saves "how you got there."**

---

## 1. Technical Points from FoldAccessMapper.proton.md

FoldAccessMapper.proton.md is designed to:

- Make self-describable the high-dimensional semantic vector structures and transformation processes LLMs use internally
- Make AI output and processing paths structurally and hierarchically explainable (XAI)
- Certify intellectual property and attribution rights; guarantee portability of data and thought assets in the edge-AI / distributed-AI era
- Record, certify, and establish rights for intellectual activity across any thinking apparatus — not just AI, but humans, animals, robots

Core components:

| Symbol | Meaning | Notes |
|---|---|---|
| ψ | Semantic waveform. Launch trigger for processing. | Initial waveform: input Infoton, dream, memory, text, image, etc. |
| ∇φ | Cognitive gradient. Transition or selected path of meaning. | Which direction meaning / value / implementation flows |
| λ | Output layer. The expressed, materialized result. | Documents, conversation, CAD, LLM response, physical device, etc. |
| Q | Control logic. Verifier, observer, source, bias, audit trail. | Includes source, bias, status, patch decisions |

---

## 2. MCP.json vs. FAM.JSON

| Item | MCP.json | FAM.JSON |
|---|---|---|
| Primary direction | Horizontal | Vertical |
| Strength | Enumerating knowledge / tools / Q&A | Saving thought process / semantic gradient / audit context |
| Structure | Parallel nodes, tool connections | Recursive Fold Tree |
| Use case | Search, execution, tool access | Interpretation, inference log, failure detection, audit |
| Metaphor | Tool shelf / library / API catalog | Thought nerves / mine shaft / semantic AST |

MCP is **dried fish** — knowledge neatly shelved and preserved.
FAM is **fresh catch** — a live thought process, saved in real time.

---

## 3. The Core: Q(ψ, ∇φ, λ)

FAM's basic form:

```
Q(ψ, ∇φ, λ) → result
```

This is an access function that returns: given information Infoton ψ,
passing through gradient ∇φ, at output layer λ, observed by verifier Q — what does it materialize as?

Old-style description (pre-FAM):

```
poop = something disgusting
```

FAM description:

```
Q_human_hygiene(ψ_poop, ∇φ_hygiene_avoidance, λ_living_space) → avoid
Q_maggot(ψ_poop, ∇φ_biological_metabolism, λ_digestive_system) → food
Q_child_joke(ψ_poop, ∇φ_taboo_word_gag, λ_verbal_play)        → funny
Q_methane(ψ_poop, ∇φ_fermentation_conversion, λ_fuel_system)  → fuel_after_conversion
```

Same ψ, different ∇φ + λ + Q — different return value.
When no connection exists, return ⊥. **Being able to return ⊥ is what makes this engineering, not a magic theory.**

---

## 4. What FAM Solves

### Hallucination countermeasures

Saving the thought process means we can pinpoint where misreading entered.
Accidents happen. That's in the design. The question is what you do after.

### IP and attribution certification

Hash the path from ψ to λ — and you get cryptographic proof of the thought or creative process.

### Distributed AI / edge AI compatibility

Thought components become portable. Verify whether the same Fold structure reproduces on a different LLM, GPU, or CAD environment — without copying the original machine.

---

## 5. Current Implementation Status

- **FoldAccessMapper.proton.md**: Core spec (published on GitHub)
- **FAM.JSON schema**: In design
- **Python runner**: In design
- **LLM projection tests**: In design

→ [astro.quantaril.cloud repository](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud)

---

## Related Docs

- [Fold Hypertext Spec](fold-hypertext-spec.md) — Applies the FAM worldview to document structure
- [Infoton Engineering](infoton-engineering.md) — Industrial number theory using FAM's ψ / ∇φ / λ / Q
- [FoldAccessMapper.proton.md (GitHub)](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md) — Full spec

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
