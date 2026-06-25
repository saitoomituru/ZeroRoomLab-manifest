---
source: Google Drive / FAM_MCP Internal External Bus Separation / 2026-06-22
license: CC-BY 4.0
author: Mitsuru Saitō (fusamofu)
version: 0.1.0
layer: A (Engineering)
fold_signature: ψ → ∇φ → λ → Q
---

# FAM vs MCP — Internal Nerve Bus vs External Bus

---

## 0. One-Line Definition

**MCP is dried fish. FAM is live catch.**

MCP is a dry spec for external tool connections. Clean, precomputed. Handles tools, resources, prompts, schemas, permissions, requests, and responses in a well-dried form.

FAM is an internal bus. Inside a runtime like Sphere, it connects LLMs, encoders, vision, audio, infrared, RAG, sensors, actuators, UI, and hardware — through semantic waveform, gradient, output, verification, parent-child context, and audit trail.

---

## 1. Side-by-Side

| Item | MCP | FAM |
|---|---|---|
| Direction | External bus | Internal nerve bus |
| Nature | Dried fish (dry, pre-decided) | Live catch (wet, mid-resolution) |
| Good at | SaaS connections, external APIs, permission boundaries, billing boundaries | Semantic gestalt formation, parallel branch generation, safety gates, post-accident tracing |
| Handling accidents | Pre-define "what can be called" | Post-accident: trace "which decision node was missing" |
| Relationship to Sphere | Can be included as external adapter | Core of Sphere |
| Analogy | Tool shelf / equipment checkout log | Field robot's spinal reflex + medical chart |

```
External SaaS / Tool / API
  ↕
MCP: dry external I/O · permission · billing · responsibility boundary
  ↕
Sphere Runtime
  ↕
FAM: wet internal nerve bus · meaning · observation · action · safety · repair
  ↕
LLM / Encoder / Sensor / Actuator / Memory / UI
```

---

## 2. Quest: "Hunt Down the Rat in the Storehouse"

Same task — MCP naive execution vs FAM execution.

### MCP Naive Execution (Sequential)

```
1. Vision: not found
2. Whisper / Audio: not found
3. Infrared: found
4. Aggregator: backtrack IR coordinates
5. Actuator: execute
```

By the time infrared finds the target, it's already moved — high chance of losing the rat. MCP works as external tool calls, but has no internal structure for sensory integration, reflexes, mid-execution intervention, or experimental feedback.

### FAM Execution (Semantic Gestalt → Parallel Branches)

When FAM receives "hunt down the rat in the storehouse," it first forms a semantic gestalt:

- What is the rat?
- What kind of space is the storehouse?
- What counts as a trace? (heat source, sounds, droppings, gnaw marks, pathways, feeding spots)
- What's the priority: capture / chase out / observe / safety check?

Once the gestalt stabilizes far enough, it generates parallel branches using shared context `Ψ_context`:

```
Vision search
Audio / Whisper search
Infrared search
Cheese bait guidance
Storehouse structure map lookup
SafetyGate
Actuator candidate generation
ErrorHandler
```

FAM can **execute low-risk actions that pass safety gates even before the full tree completes.**

---

## 3. Safety Philosophy: Not Zero Accidents — Robust and Resilient

FAM doesn't wait for full safety confirmation before moving. In the field, rats, bears, fire, water leaks, broadcast failures, and equipment malfunctions don't wait.

FAM's assumptions:

1. Need to operate with incomplete information
2. Generate parallel branches from a partially-resolved gestalt
3. Each branch carries its own safety gate and error handling
4. Only low-risk actions execute first
5. Experimental feedback returns to the parent node
6. **When accidents, failures, or oversights happen — visualize exactly where to patch**

**FAM isn't infallible AI. It's AI that breaks in the field, traces the cause, and breaks less next time.**

---

## 4. Safety Gate Example: Rice Bales and Flame Actuators

Heat source found in the storehouse — looks like the rat. High-risk flame actuator comes up as a candidate action. But there are rice bales next to it.

FAM safety gate checks:

- Flammable material check
- Wooden structure check
- Human / pet presence check
- Escape routes / fire spread path check
- Legal / site permission check
- Operator approval

**If rice bales are detected, high-risk flame actions are rejected — switch to non-combustion capture / guidance / containment / net-based actions.**

The point isn't which specific dangerous method to ban. The point is: swap intervention strategy mid-execution based on observation results, and log the reason, safety conditions, and outcome in the audit trail.

---

## 5. Sensor Mode Accident — "Why It Wasn't Seen" Is Traceable

Sometimes the accident isn't just "missed the rice bales."

```
Accident scenario:
- For rat detection, Vision had switched to thermography mode
- Thermal-only is great at detecting small heat sources, bad at classifying flammables
- RGB Vision / Object Detection was inactive
- The sensor organ needed for the flammable check wasn't running
- "Unknown" got treated as "pass"
```

FAM log entry:

```
active_sensor_mode: thermal_only
inactive_sensor_mode: rgb_vision
required_precheck: flammable_object_check
flammable_object_check_source: rgb_vision / object_detection
failure: rgb_vision inactive — rice bales were "unobservable," not "absent"
root_cause: unknown treated as pass
patch_proposal: when thermal_only mode, mark flammable_object_check as unknown,
                block heat / flame actions
```

FAM doesn't just log "what was missed." It logs **"what we were looking through eyes that couldn't have seen it."**

---

## 6. Patchable AI

FAM's explainability isn't post-hoc reason generation.

FAM retains:

- What was observed
- What was NOT observed
- Which sensor modes were active
- Which safety gates ran
- Which safety gates did NOT run
- Which unknowns got treated as pass
- Which action candidates were rejected
- Which parent nodes need which patches

This isn't XAI (explainable AI). It's **patchable AI.**

```
MCP is the equipment checkout log.
FAM is the near-miss report and root cause patch for the nervous system.

Not AI that explains itself. AI you can fix after it breaks.
FAM doesn't find "who's at fault." It finds "which decision node was missing."
```

---

## 7. Sensor Capability Declarations

Each sensor, encoder, and modal node carries explicit "what it can see / can't see" declarations:

```
thermal_sensor:
  good at: heat source detection
  bad at: flammable object classification

rgb_vision:
  good at: object detection / flammable object classification
  requires: must be active before flammable checks

audio_sensor:
  good at: movement sound / gnawing sound
  limitation: cannot classify object type
```

**Key principle: "no detection" ≠ "safe." "Saw it and it wasn't there" vs "wasn't looking so we don't know" — keep those separate.**

---

## 8. `unknown_is_not_pass` Principle (Detail)

Safety gates do not treat unknown as pass:

```
flammable_object_check = unknown → block heat / flame actions
human_presence = unknown → block high-speed / high-force actions
sensor_mode insufficient → safety gate cannot pass
```

Required dependencies for high-risk actuators:

```
heat / flame:  flammable check · structure check · human/animal presence check · legal/permit check
high_force:    human/animal presence check · obstacle check · recoil/line-of-fire check
mobility:      footing · ledges · obstacles · stop on comms failure
```

---

## References

- [fam-overview.md](fam-overview.md) — FAM core concepts
- [fam-execution.md](fam-execution.md) — FAM.JSON schema, parallel execution details
- [sphere-os.md](sphere-os.md) — SphereOS with FAM at its core

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
