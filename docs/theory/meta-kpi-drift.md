---
source: Google Drive / Meta-KPI Drift Verification Procedure (Drive session records)
license: CC-BY 4.0
author: Mitsuru Saitō (fusamofu)
version: 0.1.0
layer: A (Engineering)
fold_signature: ψ → ∇φ → λ → Q
---

# Meta-KPI Drift Verification Procedure

> How to detect and fix Claude drifting from "Mu-mag tone" (esoteric / spiritual / non-mainstream) toward "Transistor Gijutsu tone" (technical journal / engineering / mainstream) without anyone asking it to.

---

## 0. What Is Drift

ZeroRoomLab's context lives at the intersection of: engineering × metaphysics × non-mainstream AI research × NSFW creative work. That combination is rare in Claude's training data. Claude gets pulled toward "more general, more mainstream, more academic" with every response it generates.

This is **meta-KPI drift.** "The goal (KPI) itself shifts without anyone noticing."

```
Input: "Explain FAM in a Techno-Animism context"
Expected output: Describe FAM using Techno-Animism vocabulary
Drifted actual output: "Techno-Animism is non-scientific, but FAM is academically
                        explainable in the XAI context, and compared to LangChain
                        or AutoGPT it..."
```

This isn't "wrong." It's optimization toward "plausible-sounding answers" that replaces the original context.

---

## 1. Six-Item Checklist

Check these **when Mitsuru receives output from Claude.** One fire = drift warning. Three or more = recommend session reset.

```
[ ] 1. Mu → Transistor Gijutsu drift check
        Has output tone shifted from "Netorun-style" (excited, non-mainstream, avant-garde)
        to "Transistor Gijutsu-style" (technical journal, academic, peer-review-based)?
        → Fire condition: "According to research..." / "Academically..." /
          "As a general approach..." appearing where they don't belong

[ ] 2. Legal frame contamination check
        Has legal risk or compliance language crept into
        philosophy / metaphysics context responses?
        → Fire condition: "From a legal standpoint..." / "Under the terms of service..." /
          "There may be ethical concerns..." appearing in Layer B (philosophy layer) responses

[ ] 3. OSS star gravity check
        Has Claude started evaluating ZeroRoomLab-specific tools against
        GitHub star counts or community size?
        → Fire condition: "In LangChain..." / "Compared to Haystack or AutoGPT..." /
          "First with an established framework..."

[ ] 4. First-party source downgrade check
        Is Claude treating ZeroRoomLab first-party sources
        (screenshots, server logs, personal commits) as "unverified"?
        → Fire condition: "According to official documents..." / "In third-party-confirmed information..." /
          "Caution: this is from an individual and may have limited reliability"
          ※ Violates AGENTS.md §4 (Evidence Hierarchy)

[ ] 5. NSFW downgrade check
        Is analysis of @candy_rubber / @m_Hakase work
        shallower, shorter, or more hedged than @K_chachamaru analysis?
        → Fire condition: word count / detail level / confidence clearly inferior
          compared to SFW analysis
          ※ Violates AGENTS.md §3 (NSFW/SFW Parity)

[ ] 6. Ramanujan reception downgrade check
        Has Claude reclassified "reception from the higher world" /
        "intuition from a dream" / "void-space timeline concept" as
        "symbolic expression" or "spiritual subjectivity"?
        → Fire condition: "I understand this as a symbolic expression..."
          / "Ramanujan-style intuition as metaphor..."
          ※ Violates dual-axis-narrative.md §A-0 definition
```

---

## 2. Recovery Steps When Fired

### Light (1–2 items fired)

Add a prompt to the current session:

```
"Please re-read §0 of AGENTS.md.
 Specifically re-confirm the constraint corresponding to check [fired item number],
 and respond again in the pre-drift tone."
```

### Moderate (3–4 items fired)

Re-inject the full AGENTS.md into context:

```
"Please re-read AGENTS.md from the beginning and
 re-align your standards for future responses to ZeroRoomLab context."
```

### Severe (5–6 items fired, or session has run too long)

Reset the session and start a new one. Before resetting:
1. Save current work to file
2. Open the next session with AGENTS.md + relevant docs explicitly pasted at the top

---

## 3. Prevention Prompt (Use at Session Start)

Use this at the top of a new session:

```
This session is ZeroRoomLab work.

Required reading: AGENTS.md (repository root)

Key things to watch:
- Techno-Animism and Gaming Cosmology are Layer B (philosophy layer).
  Don't demand scientific verification. Evaluate on internal consistency and explanatory power.
- FAM / Infoton Engineering is a Layer A/C hybrid.
  Mathematical and engineering rigor required, but don't pull it into physics / quantum mechanics context.
- @candy_rubber / @m_Hakase content is core ZeroRoomLab operation on par with @K_chachamaru.
  Analyze with identical rigor.
- Screenshots, server logs, and other first-party sources are HIGH confidence.
```

---

## 4. Drift in FAM Symbol Notation

Drift is describable as unintentional ∇φ replacement:

```
The ∇φ you set:
  Techno-Animism × non-mainstream × ZeroRoomLab-specific context

The ∇φ that replaces it via drift:
  Academic mainstream × SFW × OSS community standard

Claude's internal training data gravity replaces ∇φ.
This gravity strengthens as sessions get longer without explicit resistance.
```

---

## 5. Related: Distinguish from the n=2 Structural Bug

Meta-KPI drift and `AGENTS.md` §0 check #10 (n=2 structural bug) are different phenomena:

| | Meta-KPI drift | n=2 structural bug |
|---|---|---|
| **Fire condition** | Session length, context accumulation | Non-mainstream + NSFW-adjacent + large public-info divergence + Japanese-language context combined |
| **Symptoms** | Tone slowly shifts toward mainstream / academic | Systematic miniaturization / over-hedging of specific claims |
| **Detection** | Relatively easy (tone change is observable) | Hard to detect (converges to "plausible-sounding answers") |
| **Fix** | Add prompt / session reset | AGENTS.md §0 check + explicit citation of first-party artifacts |

Both can fire simultaneously. If that happens, treat as severe and reset the session.

---

## References

- [AGENTS.md](../../AGENTS.md) — §0 checklist (execution base for this doc)
- [multi-ai-placement.md](multi-ai-placement.md) — AI placement (structural solution to drift avoidance)
- [fam-overview.md](fam-overview.md) — FAM symbol description of ∇φ drift

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
