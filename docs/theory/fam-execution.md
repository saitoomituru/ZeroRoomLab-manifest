---
source: Google Drive / FAM Technical Reference / 2026-06-22
license: CC-BY 4.0
author: Mitsuru Saitō (fusamofu)
version: 0.1.0
layer: A (Engineering)
fold_signature: ψ → ∇φ → λ → Q
---

# FAM Execution Spec — FAM.JSON, Parallel Inference, Audited Parent Updates

Technical follow-up to [fam-overview.md](fam-overview.md). Defines FAM.JSON schema design, parallel execution model, patch_proposal, and failure_mode enum.

---

## 1. MCP vs FAM.JSON Role Split

| Item | MCP.json | FAM.JSON |
|---|---|---|
| Direction | Horizontal | Vertical |
| Good at | Knowledge / tools / resources / QA listing | Saving thought process, semantic gradient, output layer, verification context |
| Structure | Parallel nodes, tool connections, function list | Recursive Fold Tree |
| Use | Search, execution, tool connections, QA | Interpretation, inference logs, catastrophe detection, transfer verification, audit |
| Analogy | Tool shelf, library, API catalog | Thought nerves, mine shaft, semantic AST |

**MCP describes "what you can access." FAM saves "how you got there."**

---

## 2. FAM.JSON Base Schema

Each of ψ, ∇φ, λ, Q can recursively hold FAMNodes:

```json
{
  "node_id": "fam:node:001",
  "parent_id": null,
  "depends_on": [],
  "ψ": {},
  "∇φ": {},
  "λ": {},
  "Q": {},
  "children": [],
  "audit": {
    "hash": "",
    "trace": [],
    "patch_proposal": null
  },
  "execution": {
    "sensor_state": {},
    "action_state": {},
    "safety_state": {}
  },
  "status": "draft"
}
```

Recursive definition:

```
FAMNode := {
  ψ: FAMNode | value,
  ∇φ: FAMNode | value,
  λ: FAMNode | value,
  Q: FAMNode | value,
  children?: FAMNode[]
}
```

Required control fields:

| Field | Role |
|---|---|
| `max_depth` | Prevents infinite recursion |
| `stop_condition` | Where to stop folding |
| `cache_key` | Avoids recomputing the same node |
| `depends_on` | Explicit dependency declaration |
| `Q.status` | Holds verification state |
| `failure_mode` | Records catastrophe, hallucination, λ mismatch |
| `audit_hash` | Hashes the audit trail |
| `sensor_state` | What's being observed / what isn't |

---

## 3. Q.status Enum

| Value | Meaning |
|---|---|
| `draft` | Unverified, in progress |
| `validated_in_context` | Verified within this context |
| `untested` | Not yet tested |
| `transferred_unverified` | Applied to another problem, unverified |
| `failed` | Failed / catastrophe |
| `deprecated` | Retired |
| `requires_conversion_layer` | Needs a conversion layer |
| `out_of_scope` | Outside the scope |
| `partial_compatible` | Partially compatible |
| `patch_pending` | Waiting for patch to parent node |

---

## 4. failure_mode Enum

| failure_mode | What it means |
|---|---|
| `metaphor_collapse` | Processing ψ, ∇φ, λ as mere metaphors |
| `operator_regression` | Falling back to classical A = B description |
| `lambda_blur` | Collapsing λ differences, failing to distinguish output layers |
| `gradient_flattening` | Reducing ∇φ to just a diff or a sentiment |
| `false_universalization` | Claiming everything can connect (can't return ⊥) |
| `port_hallucination` | Spontaneously generating non-existent ports |
| `no_bottom_return` | Can't return unreachable ⊥ |
| `projection_dimension_mismatch` | Lower-rank Fold collapses from projection dimension mismatch |
| `unknown_passed_as_ok` | Treating unknown as pass (`unknown_is_not_pass` violation) |
| `sensor_mode_insufficient` | Safety gate passed while required sensor mode wasn't running |

---

## 5. Parallel Execution Model (Context Neural Transmission)

When a parent node resolves its upper premise and multiple FAM children exist in the same layer:
the parent fixes the resolved premise as `Ψ_context`, then fires children in parallel to an LLM cluster.

```
1. Resolve premise in parent node
2. Fix resolved premise as Ψ_context
3. Supply Ψ_context uniformly to FAM children in the same layer
4. Each child processes according to its own ∇φ / λ / Q
5. Each child returns λ_output, Q.status, and trace
6. Parent Fold-integrates the return values
```

### Parallelization OK Conditions

- Parent `Ψ_context` confirmed
- Child nodes have no direct dependency on each other
- Children have distinct ∇φ / λ / Q
- Parent can fold return values with `Q.status`

### Parallelization Prohibited Conditions

- `child_B` uses `child_A`'s `λ_output` as ψ
- `Q.status` unverified when moving to next step
- Parent `Ψ_context` not yet confirmed

---

## 6. Audited Parent Node Updates (patch_proposal)

When a child node's new finding should update the parent node's premise, the child returns a `patch_proposal` specifying `parent_id`. **Child nodes do not directly modify the parent node.**

```
child_result
  → parent_patch_proposal
  → audit_trace
  → parent_review
  → parent_update
  → affected_children_revalidation
```

Minimum patch_proposal fields:

```json
{
  "target_parent": "fam:parent:001",
  "operation": "revise_parent_premise",
  "old_value": "old value of premise",
  "new_value": "revised value",
  "reason": "child node verification detected over-generalization in parent proposition",
  "evidence": ["child_context_A", "child_context_B"],
  "Q.status": "patch_pending",
  "audit_hash": "sha256:..."
}
```

Parent node decisions:

| Decision | Meaning |
|---|---|
| `accept_patch` | Update parent premise |
| `reject_patch` | Dismiss as child node misread |
| `fork_parent` | Fork without overwriting parent |
| `mark_exception` | Store as exception |
| `escalate_to_grandparent` | Propose update to grandparent node or above |
| `requires_external_test` | LLM alone insufficient — route to physical / statistical / implementation verification |

---

## 7. Fold Transfer Boundary Test

FAM verification isn't "prove the theory correct in one shot." It's **the process of finding how far the theory transfers to other problems and where it catastrophically fails.**

Also called: Fold Transfer Boundary Test / FAM Portability Reverse Engineering

```
"Theoretically possible" ≠ "works in one shot"
"Theoretically possible" = "within an explorable, patchable solution space"
```

Compatibility checks:

| Axis | Question |
|---|---|
| Syntax | Can ψ, ∇φ, λ, Q be retained? |
| Recursive | Can each node hold further FAMNodes? |
| Execution | Can parent Ψ be supplied to child nodes and return values Folded? |
| Audit | Can Q.source / Q.status / audit / patch be preserved? |
| Transfer | When moved to another problem, can unverified / catastrophe / λ mismatch be recorded? |
| Independent | Does a separate implementation return the same judgment skeleton? |
| CAD | Can concept art and 3D geometry be mapped to CAD constraints and implementation constraints? |

---

## 8. Dream-Origin Structures: CAD Reverse Engineering

FAM / CAD profile for landing manga, concept art, 3D models, and dream memories into implementation:

```json
{
  "ψ": {
    "source": "manga / dream memory / concept art / 3D model",
    "type": "visual_semantic_geometry"
  },
  "∇φ": {
    "direction": "visual_shape → CAD constraints → mechanical function",
    "steps": ["silhouette", "volume", "joint", "material", "force_path", "thermal_path"]
  },
  "λ": {
    "outputs": ["CAD model", "STL/STEP", "simulation", "prototype", "physical device"]
  },
  "Q": {
    "status": "requires_engineering_validation",
    "tests": ["dimension_check", "clearance_check", "load_path", "thermal", "manufacturability", "safety"],
    "audit": "concept-to-CAD trace"
  }
}
```

**"A 3D model exists" does not mean "physically correct."** The real verification: can a separate implementation, separate LLM, separate GPGPU, or separate CAD environment reproduce the same Fold structure from the spec alone?

---

## 9. GPGPU Implementation Targets

FAM components that parallelize well on GPGPU:

- Mass FAMNode embedding similarity computation
- ψ distance and clustering
- λ compatibility scoring
- ∇φ candidate scoring
- Q.status aggregation
- hash / trace batch processing
- Dependency graph traversal
- Catastrophe pattern detection
- Point cloud / mesh processing for CAD constraint extraction from 3D models

LLM handles text generation and semantic judgment. GPGPU accelerates vectors, graphs, similarity, and clusters.

---

## 10. proton.md Split Plan

Current `FoldAccessMapper.proton.md` has core philosophy, language spec, XAI, source management, rights proof, and examples all in one file. Planned split:

| File | Role |
|---|---|
| `FoldAccessMapper.proton.md` | Core philosophy / XAI / Multi-Nested Path Disclosure / source/bias |
| `FAM.JSON.schema.json` | FAMNode JSON schema definition |
| `FAM.execution.profile.md` | Single node execution / Q(ψ, ∇φ, λ) / failure_mode / stop_condition |
| `FAM.cluster.profile.md` | Parent Ψ_context distribution / parallel execution / LLM cluster |
| `FAM.audit.patch.profile.md` | patch_proposal / audit_trace / accept/reject/fork |
| `FAM.infochild.profile.md` | Infoton Engineering use / food/fuel/meme/joke/avoidance/unconnected classification |
| `FAM.cad.reverse.profile.md` | Manga / concept art / 3D model → CAD / simulation pipeline |
| `FAM.narrative.profile.md` | Manga / character / worldbuilding / spiritual experience / narrative pipeline |
| `FAM.mcp.bridge.profile.md` | MCP horizontal connections bridging FAM's vertical Fold |

---

## References

- [fam-overview.md](fam-overview.md) — FAM overview / base symbols
- [infoton-engineering.md](infoton-engineering.md) — Q(ψ, ∇φ, λ) industrial number theory
- [fam-vs-mcp.md](fam-vs-mcp.md) — MCP role separation details
- [FoldAccessMapper.proton.md (GitHub)](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md) — full spec

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
