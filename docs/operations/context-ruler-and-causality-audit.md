# Context Ruler, Causality, and OAE Cross-Audit Contract

Status: `[REVIEW]` `[Layer A/B/C bridge]`\
Established: 2026-07-18\
Applies to: MAGI, Sphere Architect, FAM, IBD, SDKs, READMEs, research Notes, and incident analysis

> Language and authority boundary: this en-US document is an external audit GUI. The
> [Japanese source](context-ruler-and-causality-audit.ja.md) remains canonical. This GUI may guide an audit,
> but it does not replace a selected Registry, grant execution authority, or translate the Japanese-only
> Sphere Context Kernel into English.

## 1. Purpose

Detect cases where a Core, editor, or auditor imports its own ruler without saying so, then overwrites another
theology, physics model, World, jurisdiction, business practice, identity model, or causal hypothesis.

This contract does not blend every ruler into one conclusion. It keeps separate:

- who made the claim;
- which Registry, fact scope, Position, and Evidence they used;
- what they claimed;
- which OAE performed the interpretation.

## 2. Three audits to separate first

### 2.1 Declared Position

Declare which audit angle, value, objective, or branch has priority. Do not perform colorless neutrality while
quietly carrying a preferred ruler.

### 2.2 Position-talk Risk

Audit whether a speaker's position as participant, supplier, failure owner, seller, or evaluator creates a risk of
self-defense, competitor nerfing, blame transfer, or selective evidence.

Holding a Declared Position is not the same as committing a position-talk failure. The former makes a viewpoint
inspectable. The latter lets the speaker's interest distort verification.

### 2.3 Claim Scope / Medium Register

Identify Manifest Layer A, B, or C and the medium: README cover, technical document, research Note, work of art,
or another surface. Do not demand physical proof as the only valid test of philosophy, and do not use poetry as the
only proof of a physical claim.

## 3. Namespace audit

Do not merge concepts merely because Japanese uses the same word for “layer” or “dimension.”

| Key | Meaning |
|---|---|
| `claim_layer` | Manifest Layer A/B/C |
| `technical_layer_ref` | ordered technical dependency or execution axis `L` |
| `context_dimension_ref` | meaning axis `D` |
| `context_dimension_count` | number of unique D axes in a Fold |
| `embedding_dimension` | vector-space dimensionality |
| `sdk_surface` | SDK entry abstraction `S` |
| FAM `λ` | objective/output, not a technical layer |

When a legacy schema retains a field named `layer`, identify its original namespace. Do not silently load a new
meaning into the old field.

## 4. Audit the source of the ruler

At minimum, make the following answerable:

1. Who established the classification Registry?
2. What are its Registry ID, revision, World, and fact scope?
3. Is it a Core default, an upper system, a User rule, or a third-party SDK rule?
4. What becomes `unknown`, `none`, `unmapped`, or `⊥`?
5. What counts as Agency, Event, Effect, and Evidence?
6. Which Presentation Profile exposes the result to a user?

A default is still a ruler. Do not report a default classifier or Causality Profile as “no ruler.”

## 5. OAE role audit

Do not automatically collapse these roles into one person or entity:

- Observer
- Recorder
- Interpreter
- Claimant
- Initiator
- Executor
- Transformer
- Attributed Causal Agency
- Environment
- Affected Entity

A human recording an Effect attributed to a river god does not make the human its cause. A sensor observing an
event does not make the sensor causal. Inputs and outputs alone do not authorize inventing a Transformer or Intent.

## 6. Event, Effect, interpretation, and causal hypothesis

```text
Source Event       observed or recorded sequence
OAE                Effect recorded from a specific Observer / Registry
Interpretation OAE act of interpreting or classifying a Source
Causal Hypothesis  candidate causal graph generated through a Causality Profile
Assertion          claim adopted or presented by a specific Claimant
```

When one Event has multiple hypotheses, keep them as separate An-Chronos-like branches. `adopted-in-scope` is not a
merge into absolute truth across every World.

### 6.1 Temporal-integrity audit

When reading historical material, separate:

- a historical Source Event and its Evidence/Provenance;
- a contemporaneous OAE that was actually emitted at that time;
- an Interpretation OAE produced by the present auditor.

If no contemporaneous OAE can be retrieved, return `historical-oae-unavailable` or `unknown` and set the Last Order
to `stop-retroactive-backfill`. Do not fill historical Observer, Recorder, Initiator, Executor, Transformer, or Intent
roles with present-day inference.

An observation that was never captured must not be filled with a plausible observation. Doing so is a temporal-
integrity failure that rewrites the past of the same worldline.

If a counterfactual or restoration candidate is needed, keep the source World and source Instance Ghost unchanged.
Place the candidate in a separate World and Instance Ghost with a 7D Fold branch receipt. The branch is a current
hypothesis, not a historical observation.

### 6.2 Meaning/Causality Kernel and World connection

A meaning Kernel is more than labels, an ontology dictionary, or a communication schema. It constrains the rules
under which identity, OAE, observation, time, history, branching, cause, and effect can exist. Do not turn a
SemanticKernel mismatch into a continuous connection through an automatic schema conversion.

```text
SemanticKernel match + compatible World Config
  -> candidate continuous connection

SemanticKernel match + incompatible World Config
  -> Portal / Gate / Instance boundary

SemanticKernel mismatch
  -> different causal dimension; requires a causal Gate,
     isolated projection, and lineage receipt
```

When connecting ASTRO, an Agent, OAE, or another entity across Kernels, do not infer continuous movement of the
same identity. Keep the Source unchanged and create a separately identified incarnation/projection reconstructed
under the destination's causal rules. Do not automatically inherit memory, authority, Intent, or history. Preserve
untranslatable parts as `unknown` or `bottom`.

### 6.3 Dresser incident example

Suppose a person hits a toe on a dresser, the computer falls over, and the World disappears.

- Physical profile: contact, vibration, fall, power/runtime stop
- Safety profile: clutter, near miss, missing fixture or redundancy
- World profile: configuration that deletes the World when the Host disappears
- Mythology profile: dresser spirit, goddess of probability, a trick of fate

Do not choose one automatically as the only cause. Preserve interpreter, Registry, Evidence, scope, and confidence
scale for each.

## 7. Nerf-failure classes

### 7.1 Context Dimension nerf

Collapsing theology, faith, magic, poetry, or World-local reality into “not scientifically proven” or “flavor,”
burning its objective and internal ruler.

### 7.2 Reverse ruler injection

Overwriting physical measurement, contracts, or implementation state with myth or desire, erasing Evidence,
resource deficits, or stop conditions.

### 7.3 Resource-status nerf

Generalizing a stop caused by funding, power, HPC, SDK shutdown, or maintainer capacity into defeat of the design
itself. The reverse failure also counts: presenting a stopped runtime as running because the design remains valuable.

### 7.4 Ontology nerf

Flattening game-local, theological, legal, and physical existence into one fact scope.

### 7.5 Speaker-position failure

Determining a company's failure, a competitor evaluation, or incident responsibility solely from an interested
party's account. Separate access to logs from independence of self-evaluation.

### 7.6 Medium failure

Treating poison talk in a work of art or README cover as a technical fact, or importing deep technical caveats into
the public cover.

### 7.7 L/D/Schema failure

Placing meaning dimensions on a technical-layer axis, inferring compatibility from the number `4D`, or overwriting a
legacy `layer` key with a different namespace.

## 8. MAGI cross-audit

| Gateway | Question in this contract |
|---|---|
| Maxwell | Is the main ruler burning another branch, theology, poem, unadopted hypothesis, or original purpose? |
| Uriel | Can claim strength, observation protocol, citations, contract, resources, and responsibility be traced? |
| Raphael | Can physical, theological, infoton, World, and poetic materials stay on separate shelves and still connect without unauthorized equivalence? |

The three are not technical layers. If they are packaged as a D Fold, record `fold_ref`, all three `dimension_ref`
values, and the Registry revision. Attach each audit as an Interpretation OAE without overwriting the Source.

Uriel's expression is a ruler belonging to the Uriel audit profile, not the only fact definition in Sphere Core:

```text
fact = observation + protocol + shared promise + traceable boundary
```

## 9. Audit output

```yaml
context_audit:
  target_ref: fam://target
  medium_register: technical-doc
  claim_layer: A-B-bridge
  declared_position_ref: position://reviewer
  speaker_position:
    relation_to_target: maintainer
    interest_disclosed: true
  registry_ref: registry://selected@4
  fact_scope_ref: world://scope
  source_event_refs: []
  oae_refs: []
  causal_hypothesis_refs: []
  detected_nerf_risks: []
  preserved_unknowns: []
  conflicts: []
  human_review_required: []
```

An audit result is also an Interpretation OAE. Record the auditor's Position, Registry, and sources.

## 10. Minimum checks

- The ruler's author and revision are traceable.
- Missing historical OAE remains `unknown` rather than inferred retroactively.
- A present Interpretation OAE has a present observation time and does not impersonate a historical observation.
- A virtual reconstruction does not mutate the same World and splits both World and Instance Ghost.
- Observer and Cause remain separable.
- Source Event and interpretation can retain separate IDs.
- Hypotheses from different Causality Profiles can coexist without overwrite.
- Confidence includes a `scale_ref`.
- Theology is not promoted into a physical claim, and physics is not promoted into a theological claim.
- A failed custom Registry has an explicit fallback.
- The audit discloses the speaker's interest position.

## 11. Related documents

- [Sphere Context Dimension OS architecture — Japanese Kernel Source](../theory/sphere-context-dimension-os.ja.md)
- [Sphere Context SDK contract — Japanese Kernel Source](../theory/sphere-context-sdk-contract.ja.md)
- [Atlantis-MAGISDK 0.2.1](../theory/atlantis-magi-sdk-0.2.1.md) /
  [Japanese Kernel source](../theory/atlantis-magi-sdk-0.2.1.ja.md)
- [Myth and Objective-Function Cross-Engineering Audit](myth-purpose-cross-engineering-audit.md)
- [Technical Communication Register](technical-communication-register.md)
