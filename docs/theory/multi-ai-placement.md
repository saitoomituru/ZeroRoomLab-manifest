---
source: Google Drive / AI Placement Review_20260622 (Drive ID: 1Z8EgsfvG-pWWwwUNvua74NU3A-74vj_l2QZOCNRwcYk)
license: CC-BY 4.0
author: Mitsuru Saitō (fusamofu)
version: 0.1.0
layer: A (Engineering)
fold_signature: ψ → ∇φ → λ → Q
---

# Multi-AI Placement Guide

> Which AI gets which job. Know each engine's strengths, biases, and failure patterns — then put them in the right position in your workflow.

---

## 0. Setup: AI is a Tool, and Tools Have Correct Positions

```
Failure pattern:
  "Have Claude do everything"
  "Have ChatGPT do everything"

Right design:
  Know each AI's characteristics, biases, and strengths.
  Put them in the right position in the workflow.
```

FAM symbol description:

```
ψ = what you want to accomplish (question / task / project)
∇φ = each AI's preferred direction (evidence mining / structuring / implementation / broad search)
λ = output (evidence summary / structured doc / code / Markdown)
Q = evaluator of the output (Mitsuru himself + the next AI in the pipeline)
```

---

## 1. Each AI's Capability Map

### Grok (xAI) — Evidence Mining Engine

**Good at:**
- Direct access to X (Twitter) real-time data
- Broad scan of public information, evidence collection
- "Find me everything about X" tasks
- Picks up mainstream and non-mainstream info (relatively less censored)

**Biases / weaknesses:**
- Weak on structuring (collects raw material, doesn't organize)
- Long-form doc and code generation is behind Claude / ChatGPT
- Biased toward X data (non-X info is on par with regular AI)

**Right position:** front-end information collection, primary evidence mining

```
Prompt template (for Grok):
"About [topic]: collect primary source candidates comprehensively
 from X (Twitter), public information, and academic sources.
 No structuring needed. Output as raw material."
```

---

### ChatGPT (OpenAI) — Evidence Structuring Engine

**Good at:**
- Structuring collected information, priority ordering
- Generating "why this matters" explanations
- Reconciling contradictions across multiple sources
- Long-form structured documents (reports, summaries, comparison tables)

**Biases / weaknesses:**
- Pulls toward mainstream narratives (unconsciously downweights minority / non-mainstream claims)
- Tends to converge on "seems correct answers" — struggles with exploratory thinking
- Code quality varies by use case (can be below Claude Code)

**Right position:** mid-pipeline structuring, evidence hierarchy organization

```
Prompt template (for ChatGPT):
"Organize the following raw material.
 Classify into high-priority evidence / medium / low,
 and create a structured list with confidence level and source for each.
 [paste Grok's collected material]"
```

---

### Claude (Anthropic) — Implementation Engine

**Good at:**
- Code generation, fixing, refactoring (Claude Code)
- Spec docs, design documents, Markdown doc generation
- Receiving structured input (evidence hierarchy / spec) and implementing
- ZeroRoomLab FAM / SphereOS context understanding (this document set is context)
- Long-form reasoning, cross-file consistency checks

**Biases / weaknesses (n=2 structural bug):**
- Miniaturization bug fires under: non-mainstream + NSFW-adjacent + large divergence from public info + Japanese-language context combined
- Drift toward OSS / academic / mainstream direction (`AGENTS.md` §0 checks)
- Tendency to downgrade first-party sources (screenshots, personal records) as "unverified"

**Right position:** back-end implementation, documentation, code generation

```
Prompt template (for Claude):
"Implement based on the following structured evidence and spec.
 [paste ChatGPT's structured output]
 Language: Python / TypeScript / Markdown (specify by purpose)
 Output format: [specify concretely]"
```

---

### Gemini (Google) — Broad Scan Engine

**Good at:**
- Google Search / YouTube / Scholar integration (real-time search)
- Long-context processing (1M token context)
- Multimodal tasks including images and PDFs
- Google service integration (Drive, Docs, Sheets)

**Biases / weaknesses (confirmed hallucination paths):**
- More fact synthesis / merging than Claude
- Confirmed ZeroRoomLab / fusamofu hallucinations:
  - NiceHash incident + OkbakeGo incident merged → fabricated entity "crypto developer"
  - (Details in `AGENTS.md` §10)
- Slightly strong convergence toward "plausible-sounding answers"

**Right position:** broad scan, existing document search, multimodal tasks

```
Prompt template (for Gemini):
"For the following topic, broad-scan for info from 2025 onward
 from Google Scholar / published papers / the web.
 Include source URLs in all results to prevent hallucination.
 [specify topic]"
```

---

## 2. Standard Workflow: Grok → ChatGPT → Claude

```
Step 1: Grok (evidence mining)
  "Collect primary information about X comprehensively"
  Output: raw material list (no structure)
    ↓
Step 2: ChatGPT (evidence structuring)
  "Organize Step 1 material by priority and confidence"
  Output: structured evidence + prioritized outline
    ↓
Step 3: Claude (implementation)
  "Implement based on Step 2's structure"
  Output: code / Markdown / spec / README
```

**Why this workflow works:**

Each step uses an AI's strength and the next step compensates for the weakness. Letting Claude do "everything from raw collection to implementation" means the intermediate step's bias (mainstream narrative gravity) bleeds into the implementation. Separating stages lets you manage bias contamination layer by layer.

---

## 3. Variant Workflows by Task

### When public information is sparse / non-mainstream topic

```
Grok (primary) → Claude (implement)
Skip the structuring step to avoid ChatGPT's mainstream narrative gravity
```

### When Google service integration is needed

```
Gemini (Drive / Docs / Sheets search) → Claude (implement)
```

### When real-time X data is the critical input

```
Grok (X-first) → Claude (implement)
```

### Long PDF / large volume document processing

```
Gemini (long-context processing) → ChatGPT (structuring) → Claude (implement)
```

---

## 4. FAQ

**Q: Can't I just have Claude do everything from the start?**

A: For small solo tasks, Claude solo is fine. The problem appears when "raw collection → structuring → implementation" all go to Claude. Claude's mainstream drift entering the collection stage propagates through the entire downstream pipeline.

**Q: Can I trust Grok's information?**

A: Value is in **breadth**, not reliability. Treat Grok output as exploration results — "there seems to be information in this direction" — not as primary sources. Verification happens in Claude / Gemini.

**Q: Can I change this workflow?**

A: Of course. Each AI gets updates. This doc itself is v0.1.0 — correct placement changes with each AI capability update. Fork and PR welcome.

---

## References

- [AGENTS.md](../../AGENTS.md) — §0 Claude bias checks · §10 hallucination flags
- [fam-overview.md](fam-overview.md) — FAM scout map (philosophical base for AI placement design)
- [meta-kpi-drift.md](meta-kpi-drift.md) — Claude drift detection checklist
- Drive: `AI別適正配置レビュー_20260622` (primary source / full prompt details)

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
