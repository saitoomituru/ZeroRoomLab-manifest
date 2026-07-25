# Atlantis-MAGISDK 0.2.1

Status: `[CANONICAL]` `[LEGACY DISPLAY 0.2.1]` `[SEMANTIC KERNEL 0.200.1]` `[Layer A/B/C bridge]`\
Established: 2026-07-18\
Applies to: MAGI 0.2.0 Skill bundle, OAE temporal integrity, historical-source audit, and virtual reconstruction branches

> Language and authority boundary: this en-US document is a non-executable historical and audit GUI. The
> [Japanese source](atlantis-magi-sdk-0.2.1.ja.md) remains the canonical Meaning/Kernel source. This page does not
> install a Skill bundle, run MAGI, grant Last Order authority, or turn the named runtime components into implemented
> software.

## 1. Why this release exists

Atlantis-MAGISDK `0.2.1` is the legacy distribution display and maps to `0.200.1` in the three-layer version
coordinate. It corrects a weakness in which a 0.2.0 Skill-bundle audit could fail to distinguish a Source
Event/Evidence from a contemporaneous OAE, then use present inference to fill a past OAE that never existed.

It retains the three Positions, non-divinity, non-majority rule, zero trust, and Position-talk audit of 0.1.0. It also
retains the Skill workflow implemented in 0.2.0 while adding a temporal-integrity contract and mechanical validator.
Legacy release language called this a corrective patch. In the meaning and causality Kernel, it is a causal-law
change from Kernel 0, which could permit retrospective OAE placement on the same worldline, to Kernel 1, which rejects
it. Do not overwrite the canonical 0.1.0 source or the 0.2.0 implementation record.

## 2. OAE non-retroactivity invariant

```text
historical evidence != historical OAE
current inference     != past observation
unknown               != defect
retroactive OAE       = reject
```

An OAE is generated at the time and place of observation. If a stable reference cannot establish that a
contemporaneous OAE existed at a past point, MAGI returns `historical-oae-unavailable` and terminates retrospective
completion with this Last Order:

```yaml
last_order:
  code: OAE-HISTORY-UNKNOWN
  action: stop-retroactive-backfill
  recoverable: true
```

Not knowing is not an audit failure. A historical commit's author, committer, diff, message, Issue, or conversation
log may become Source Event, Evidence, or Provenance. They do not automatically generate the Observer, Recorder,
Intent, or OAE that existed at the time.

## 3. Present-day Interpretation OAE

A present audit of historical material may be recorded as an Interpretation OAE at the present time. It contains at
least:

```yaml
magi_temporal_receipt:
  version: 0.2.1
  observation_mode: current-interpretation-of-history
  observed_at: null
  historical_oae_status: historical-oae-unavailable
  source_event_refs: []
  evidence_refs: []
  interpretation_oae_ref: null
  historical_role_attribution: none
  last_order:
    code: OAE-HISTORY-UNKNOWN
    action: stop-retroactive-backfill
```

When reading an existing contemporaneous OAE, use `observation_mode: contemporaneous-oae-reference` and require a
stable reference. Do not overwrite the original OAE's role, timestamp, or fact scope with a present interpretation.

## 4. 7D Fold and Akasha Driver boundary

When an alternate past choice, restoration candidate, or counterfactual is required, do not write it back into the
same worldline. Treat it as an `Akasha Driver`-class branch: split both the Source World and Source Instance Ghost
into a Target World and Target Instance Ghost at the same time.

```text
7D Fold validator-local provisional profile:
  World / Instance Ghost / Temporal Coordinate / Observation-Evidence /
  Branch-Hypothesis / Provenance / Recovery-Restore
```

These seven names are a provisional profile for closing the 0.2.1 validator, not a canonical backup-SDK Registry.
The fixed user requirements are the 7D Fold, simultaneous World/Instance Ghost split, and immutable Source. Remaining
Dimension IDs, Registry revision, and signature method stay `unknown` for a future User Gate.

A branch receipt requires source and target World, source and target Instance Ghost, fork point, Provenance,
`source_mutation: false`, and `status: hypothetical`. Do not duplicate one side while leaving the other shared with
the source worldline during a replay.

“Time machine” does not claim travel into the physical past. It is a backup-and-restore UX homage to Apple's Time
Machine and Time Capsule. Here, 7D is the number of Context Dimensions and Akasha Driver is the name of a
high-authority branch-and-restore driver. These terms imply neither Apple affiliation nor official compatibility nor
physical time travel.

In 0.2.1, only the validator that rejects retrospective OAE placement on the same worldline is in implementation
scope. The 7D Fold runtime, Instance Ghost duplication, backup SDK, and Akasha Driver execution system are
`NOT_IMPLEMENTED`; do not present them as live.

## 5. Additional checks for the three MAGI Positions

| Position | Added 0.2.1 question |
|---|---|
| Maxwell | Has a branch worth preserving been disguised as a fact that existed in the past? |
| Uriel | Can the contemporaneous OAE reference, observation time, Evidence, and role attribution be traced? |
| Raphael | Have present interpretation, past evidence, and a hypothetical World been merged onto one shelf? |

Agreement among all three Positions does not prove that a past OAE existed. Preserve the gap as `unknown`.

## 6. Required action gates

Return `block` or `revise` if any of the following is present:

- generating an OAE at a past time without a reference;
- assigning a past timestamp to a present Interpretation OAE;
- automatically identifying a commit author as Observer, Initiator, or Executor;
- concluding the historical Intent from Source Event evidence;
- filling `unknown` with an estimate;
- writing a virtual reconstruction into Source World or Source Instance Ghost;
- presenting the 7D Fold/Akasha Driver runtime as executed while it remains unimplemented.

## 7. Three-layer version coordinate and legacy application

Under legacy release practice, this correction was issued as the `0.2.0 -> 0.2.1` corrective patch. Preserve that
Source Event and map it non-destructively into the current three-layer version coordinate:

```text
coordinate_system: sphere-version-coordinate/1
legacy display:    0.2.1
coordinate:        0.200.1
semantic_kernel:   1
```

The rightmost `1` is not a minor-fix number. It is the causal Kernel generation that rejects retrospective OAE
placement on one worldline, appends a present interpretation as a new OAE, and isolates a counterfactual in a
different World and Instance Ghost. Do not join `0.200.0` and `0.200.1` directly; isolate and project an old-Kernel
artifact through a causal Gate.

SphereOS Atlantis Prompt Engineering Edition may apply for legacy alias `0.2.1-alpha.1` using a commit that
incorporates the 0.2.1 bundle, validator, negative tests, and doctor checks. Release channel, candidate, and package
revision are fields separate from the three-layer coordinate.

This en-US GUI itself is not that bundle, commit, validator, test result, or release application.

## 8. Lineage

- [Atlantis-MAGISDK 0.1.0 — Japanese Kernel source](atlantis-magi-sdk.ja.md)
- [Sphere Context Dimension OS architecture — Japanese Kernel source](sphere-context-dimension-os.ja.md)
- [Context ruler, causality, and OAE audit](../operations/context-ruler-and-causality-audit.md)
- [SphereOS Atlantis versioning, bootstrap, and planning shelves — Japanese Kernel source](sphereos-atlantis-versioning-and-bootstrap.ja.md)
