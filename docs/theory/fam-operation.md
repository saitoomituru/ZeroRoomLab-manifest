---
source: Google Drive / FAM_v1.1_patch_20260623.md (FAM.proton v1.1 patch notes)
license: CC-BY 4.0
author: Mitsuru Saitō (fusamofu)
version: 0.1.0
layer: A (Engineering)
fold_signature: ψ → ∇φ → λ → Q
---

# FAM Operations — Divination Mode and Resource Judgment

> This doc is the operational implementation of `fam-overview.md`.
> Not for reading FAM as a blueprint — for running FAM as a daily tool.

---

## 0. Setup: Using FAM as a Tool

FAM is designed as an **execution tool**, not a theory.

```
fam-overview.md    = what FAM is (concepts, structure, MCP distinction)
fam-execution.md   = FAM implementation spec (JSON schema, patch proposal flow)
fam-operation.md   = FAM operational use (how, when, what to judge)
```

"Divination mode" means: applying FAM's ∇φ (gradient) settings to activity planning, resource judgment, and time-axis correction. In Gaming Cosmology terms, it's the routing operation for "which direction to send the next move."

---

## 1. Patch 1 — Scout Map Definition: Operational Application

(Theory details in `fam-overview.md` §4)

The single operational rule:

```
FAM does not answer "where should I go next?"
FAM returns "what does the terrain look like?"
```

What that means in practice:

- Seeing FAM's result and then deciding "OK, I'll go that way" — **that's your decision**
- Reading FAM's result as "FAM told me to go there" — **that's navigator misuse**
- When ⊥ (unreachable) comes back, it means "the terrain in that direction is unmeasured" — not "don't go"

---

## 2. Patch 2 — ψ Granularity Setting

Where you set the granularity of ψ (infoton / input unit) changes the resolution of the terrain you get back.

| Granularity | ψ unit | When to use | Heads up |
|---|---|---|---|
| **Coarse (L)** | A day / week / whole project | Rough direction, overall Fold terrain | Details collapse. Too large for decision-making |
| **Medium (M)** | One session / one work block (2–4h) | Main unit for daily operations. Base unit for ∇φ setting | Most divination runs here |
| **Fine (S)** | One post / commit / conversation turn | When precision matters — before/after catastrophe boundary tests | Finer = more noise |
| **Ultra-fine (XS)** | One line / word / click | Debug, reproducibility confirmation | Not for daily use. Observation cost dominates |

**Default: use M (session unit) as baseline, correct with L context fore and aft.**

---

## 3. Patch 3 — Activity Classification (Action vs Observe)

Same ψ, but whether it's "action" or "observation" has opposite effects on ∇φ.

```
Action:    outputs λ. Changes the world.
           examples: posting, pushing code, running hardware, starting a conversation
           → consumes energy. Converts ∇φ outward.

Observe:   updates ∇φ. Records world state.
           examples: reading logs, measuring, researching, taking notes
           → accumulates energy. Updates ∇φ inward.
```

**Cost of conflation:**

Mix action and observation and you get "moving without the terrain updating" or "consuming energy to measure." Either way, inefficient.

```
Wrong: researching while posting (action cost degrades observation efficiency)
Right: observation block (2h) → action block (2h), separated
```

---

## 4. Patch 4 — Circular Causality Resource Judgment (Great Fortune Day / Great Misfortune Day)

In FAM, "resources" are five types: money, physical energy, content, trust, and information. You can't maximize all of them at once — spending one type generates another.

### Great Fortune Day Criteria

```
∇φ is outward (action direction). Energy is rising. Network effect is high.
```

**Best play on a Great Fortune Day: spend content completely, hold money**

```
Why:
  Content value comes from distribution, not scarcity (Gift Economy principle)
  Content released on a Great Fortune Day multiplies (network effect kicks in)
  Money has the same purchasing power on any day → no timing advantage to spending it
  ∴ Great Fortune Day = put content into circulation completely. Don't move money.
```

### Great Misfortune Day Criteria

```
∇φ is inward (observation direction). Energy contracting. Outward output is costly.
```

**Best play on a Great Misfortune Day: prepare-only mode, no money movement**

```
Why:
  Content released on a Great Misfortune Day doesn't ride the network
  Observation / prep / accumulation work doesn't lose efficiency on bad days
  Financial decisions belong when ∇φ is outward
  ∴ Great Misfortune Day = focus on prep. No output. No buying. No selling.
```

### The Core Asymmetry

```
Content output on Great Fortune Day > Content output on Great Misfortune Day × N
(N = network multiplier — hard to measure, definitely real)

Money spent on Great Fortune Day = Money spent on Great Misfortune Day
(purchasing power is equal. Timing creates no difference.)

∴ Saving content on a Great Fortune Day = throwing away a multiplier opportunity.
   Outputting content on a Great Misfortune Day = getting costs multiplied.
```

---

## 5. Patch 5 — Twelve Earthly Branches Correction

∇φ (gradient) gets corrected by time of day. Basic intraday pattern:

| Branch | Time (approx.) | Element | ∇φ tendency | Recommended |
|---|---|---|---|---|
| **Rat (子)** | 23:00–01:00 | Water | Receive / introspect | Late-night reception session. Good for observation |
| **Ox (丑)** | 01:00–03:00 | Earth | Accumulate | Recording, organizing, prep |
| **Tiger (寅)** | 03:00–05:00 | Wood | Rising starts | Early morning thought organization. ∇φ shifts upward |
| **Rabbit (卯)** | 05:00–07:00 | Wood | Outward turn | Prep for action start. Pre-output setup |
| **Dragon (辰)** | 07:00–09:00 | Earth | Action-ready | Morning action zone opens |
| **Snake (巳)** | 09:00–11:00 | Fire | Action peak | Peak focus, output main zone |
| **Horse (午)** | 11:00–13:00 | Fire | Action continues | Late morning zone |
| **Sheep (未)** | 13:00–15:00 | Earth | Transition | Post-meal decline. Switch to observation |
| **Monkey (申)** | 15:00–17:00 | Metal | Analysis / organize | Data analysis, doc review, code review |
| **Rooster (酉)** | 17:00–19:00 | Metal | Wind down | Close the day's activity |
| **Dog (戌)** | 19:00–21:00 | Earth | Inward turn | Reflect, record, set tomorrow's ∇φ |
| **Boar (亥)** | 21:00–23:00 | Water | Pre-reception | Shift to pre-sleep reception mode |

**Important: this is a correction term, not a fixed rule.**

Individual variation, health, and situation dominate. Twelve Branches correction is a ±10–20% micro-adjustment. Don't kill a strong action impulse because "the Branch is wrong." It's a reference, not a command.

---

## 6. Patch 6 — Dominance Risk

(Theory details in `fam-overview.md` §4 "Map vs Navigator")

**Operational detection signals — signs FAM is starting to navigate instead of map:**

```
[ ] Saw FAM's result and felt "that's decided"
[ ] Read ⊥ as "don't go there"
[ ] Felt like decisions got easier the finer the granularity got
[ ] Started explaining to others "FAM says so therefore..."
[ ] Felt anxious on days you didn't use FAM
```

If any of the above fires → stop using FAM for 48 hours. Draw the terrain yourself.

---

## 7. Patch 7 — Water Hour: Reception Mode Put Into Words

"Water Hour" = the Rat Branch (23:00–01:00) and nearby windows — a reception-specialized session.

∇φ properties of this time:

- Outward output cost is high (not suited for sending)
- Inward reception noise is low (well-suited for receiving)
- Ramanujan-style intuition (`dual-axis-narrative.md` §A-0) enters more readily

Recommended in the Water Hour:

```
✓ Record dream fragments
✓ Leave unsolved problems as "questions" (don't demand answers)
✓ Verbalize ψ (don't determine meaning — just write the shape)
✓ Fast notes to Drive or handwritten notebooks

✗ SNS posting
✗ Code commits
✗ Financial decisions
✗ Replies / messages
```

ψ received in the Water Hour gets low-SIN_Temperature verification the next morning (Rabbit–Dragon hours).

---

## References

- [fam-overview.md](fam-overview.md) — FAM overview / scout map definition / dominance risk theory
- [fam-execution.md](fam-execution.md) — FAM.JSON schema / patch proposal flow
- [AGENTS.md](../../AGENTS.md) — §0 checklist (AGENTS.md-side detection of FAM navigator-ization)
- [../philosophy/dual-axis-narrative.md](../philosophy/dual-axis-narrative.md) — Ramanujan context for Water Hour
- Drive: `FAM_v1.1_patch_20260623.md` (primary source / 7 patches original)

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
