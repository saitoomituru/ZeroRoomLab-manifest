# Cross-Shelf Participation, Mutual Non-Jurisdiction, and Experience Receipt Contract

Status: `[CANONICAL-CANDIDATE]` `[Layer A/B bridge]`\
Established: 2026-07-19\
License: `CC-BY-4.0`
Applies to: Notes, tutorials, CORN, Issues, review, Worlds, Meta Engine Core, and user experience

## 1. Purpose

Let philosophers, theologians, religious and spiritual practitioners, gamers, game developers, storytellers,
engineers, legal reviewers, and governance contributors enter Sphere repositories without surrendering the
language of their own shelf.

Opening the entrance does not promote every statement into runtime specification. Keep these events separate:
saving a Note, entering discussion, promotion into a cross-repository contract, implementation, and distribution
into a particular World.

```text
expression
  -> Note / Experience Receipt
  -> shelf-local review
  -> optional Bridge / CORN
  -> implementation proposal
  -> test / integration
  -> scoped distribution
```

## 2. A light shelf-local entrance

Do not put a long engineering, legal, medical, or governance defense wall in front of the default entrance to
theology, spiritual-practice, game, philosophy, or story Notes. The entrance checks only the minimum:

- the submitter has the right to submit the text or material;
- it contains no secret, personal data, or non-public third-party material;
- the shelf, World, and position it speaks from are identified;
- it is identified as a proposal, experience report, or implementation claim;
- it does not command concrete harm or unauthorized real-world operation.

Merging a Note is a receipt that the position was preserved. It is not approval as universal truth by every
religious tradition, every World, Sphere Core, or Origin.

When work is promoted into engineering, runtime, release, another shelf's canonical source, or distribution,
add the schema, tests, rights, safety, operations, and review gates required by that target scope. Do not drag
those deep gates backward until they block the entrance itself.

## 3. Self-declared positions

Faith, religious tradition, play style, ideology, persona, and cultural standpoint are self-declared.
An agent must not infer them from vocabulary, behavior, user memory, or earlier conversations.

When somebody commits an interpretation as a religious practitioner or practitioner of a named tradition,
attach the following within the boundary they chose to make public:

```yaml
declared_position:
  tradition_or_profile: self-declared
  statement: the faith statement or position the person chose to publish
  claim_scope: what this Note addresses
  non_authority_scope: traditions, Worlds, and subjects this Note does not adjudicate
  cross_tradition_bridge: opt-in | none
```

Do not require a legal name, state-recorded religion, organization membership, baptism, initiation record,
or similar credential. An anonymous name, handle, or in-World persona may declare a claim scope.
Do not force faith disclosure on visitors who were not asked for it.

## 4. Mutual non-jurisdiction

- A Catholic Note does not automatically adjudicate Lutheran, Sunni, Ritsuryō Shinto, or Gaming Cosmology positions.
- A Sunni interpretation does not cross into another tradition or game World without an explicit Bridge.
- Gaming Cosmology does not decide whether the doctrines of a religion are correct.
- Engineers do not use runtime authority to approve or deny theological reality.
- Theology and spiritual practice do not overwrite performance, builds, permissions, or test results with revelation.
- Sphere Core does not decide which religion, game, or play style is correct.

A Bridge between traditions is opt-in. Record sources on both sides, the transformation scope, meaning lost in
translation, and reviewers. If no reviewer from the other tradition is available, retain
`cross-tradition-review-wait`; do not appoint yourself as their approval.

## 5. User-memory boundary

An AI may use user memory to suggest vocabulary or possible entrances for a private tutorial. It must not
automatically publish religious tradition, health, identity, attributes, or past statements from memory into
a Note, CORN item, Issue, commit, or PR.

Before publication, the person must be able to inspect the position, name, faith statement, and experience that
would appear in the diff. Without explicit consent, return `not-published-from-memory`.

## 6. Open-ended persona tutorials

The system should accept a natural-language entrance such as:

```text
Start this repository's tutorial for <X>
```

`X` is not limited to shrine maiden, serverless engineer, philosopher, gamer, fleet-game admiral, Catholic,
Lutheran, Sunni, Ritsuryō Shinto practitioner, onmyōji, MAD frog doctor, or MAD shrine maiden.

- Add persona profiles through a declarative registry.
- Do not hard-code every persona into Core.
- Let a person select more than one profile.
- Do not reject an unregistered profile; return it as `provisional-profile` for a User Gate.
- A profile chooses presentation. It does not grant implementation authority or truth-adjudication authority.
- Treat a third-party work's name as a reference alias; do not copy assets, logos, or claim official affiliation.

A Note-only route does not require VS Code. A full development route may lead into Git, tests, Sphere-DOS,
and VS Code or a compatible editor when those tools are actually needed.

Persona is not proficiency or implementation intent. Tutorial defaults are `proficiency: unknown` and
`intent: look-around`. Do not create a branch or change code until the visitor explicitly chooses implementation.
Present current capability, unfinished boundaries, non-code entrances, and next choices according to the
[Help and Capability Discovery Contract](help-and-capability-discovery.md).

## 7. Experience Receipts

Treat statements such as these as valid experience reports:

- the vibes do not match;
- something feels off;
- this is not fun;
- I smell a kusoge flag;
- the explanation is heavy, scary, thin, or boring;
- I cannot figure out the controls;
- my religion or play style cannot enter through this doorway.

Do not require the reporter to diagnose a technical cause. Preserve the raw expression and separate it from
engineering hypotheses.

```yaml
experience_receipt:
  raw_expression: the reporter's original wording
  reporter_position: self-declared | unknown
  world_ref: null
  presentation_ref: null
  observed_at: null
  impact: self-described | unknown
  hypotheses: []
  handling_state: collecting
```

An Experience Receipt does not prove a bug, but “cause unknown” does not make it disposable.

## 8. Separate engineering hypotheses

The same receipt can open several branches:

- Core defect;
- Presentation mismatch;
- World or meta-algorithm mismatch;
- missing tutorial;
- player-skill or prerequisite-knowledge difference;
- cohort-specific friction;
- intentional friction;
- unknown factor.

More than one treatment may remain valid:

```text
fix implementation
change presentation
add option / accessibility profile
split World / meta-algorithm
collect peer-cluster review
adopt scoped no-change
wait for evidence / resources
```

`by design` may be a scoped design decision, but not a phrase for silencing the reporter. Return at least:
receipt acknowledgement, applicable scope, reason, alternate route, and a trigger for reconsideration.

## 9. Preserve clusters

Do not average all gamers into one group. RTA, TAS, challenge-run, efficiency, casual, joke-play, PvP, PvE,
modder, and game-developer clusters may coexist by self-declaration. Do not flatten internal, regional, or
personal differences within religious and theological traditions either.

- Allow multi-membership.
- Preserve `unknown` and undeclared positions.
- Do not infer religion or identity from behavior.
- Show sample size and distribution; do not erase small clusters with a simple average or vote.
- Do not automatically discard a small cluster as an outlier.
- A dedicated registry, not a Forge label, may be canonical for cluster identity.

Waiting for peer review is a state—`collecting` or `review-wait`—not abandonment.
Lack of replies is not evidence that the reporter was wrong.

## 10. Meta Engine Core does not adjudicate content

If Meta Engine Core directly filters game content, religion, Flavor, or play style, it fails as an engine that
must carry multiple Worlds.

```yaml
last_order:
  code: CORE-CONTENT-NONADJUDICATION
  action: require-explicit-scoped-authority
  recoverable: true
```

When filtering or restriction is necessary, identify the authority:

- World author;
- user-selected profile;
- server or community operator;
- distributor;
- applicable jurisdiction;
- capability or security boundary.

Prefer non-destructive filtering. Preserve the source and leave another Presentation or World available where
possible. Do not mix gates for Core secrets, capability, scope, resources, and execution safety with a judgment
that content itself is true or false.

## 11. Forge Map and Quest Map

Connect two presentations to the same stable ID.

### Forge Map

For engineers, show proposal, contract candidate, implementation in progress, implemented, tested, integrated,
released, and resource-wait.

### Quest Map

For Meaning contributors, show proposal, discussion, adoption candidate, mounted in a World, distributed,
playable, and forked into another World.

A pile of Flavor text or ethical exploration bundles is not an implemented quest. Implemented but undistributed
work is not available to play. Preserve the state information engineers need to see what can be built next.

## 12. Note pull requests

Non-code contributors may submit Notes through a fork, branch, pull request, or a connected SaaS AI's Git
capability. Merge authority follows Forge policy; neither AI nor Sphere-DOS invents it.

The minimum Note PR checks are:

- changes remain inside an allowed path;
- provenance and rights for third-party material are recorded;
- no secret, token, or personal data is included;
- position and non-scope are stated where needed;
- the Note is not misreported as implemented, canonical, or distributed;
- Markdown and required sections are structurally valid.

Do not require runtime tests, review by every religion, or every-World consistency at the Note entrance.

## 13. Safety floor and appeal

Apply the minimum floor to concrete acts, not to a genre's reputation:

- doxxing, targeted harassment, or threats;
- instructions to execute illegal or physical harm;
- exploitation of children;
- presenting an unsupported accusation of a named person's crime as fact;
- dangerous medical instruction presented as a replacement for care;
- unauthorized operation of actuators, systems, or third-party data.

A refusal or scope limit returns the affected passage, governing authority, reason, possible revision, and
an appeal or alternate-World route. Myth, ritual, religion, occult or conspiracy-themed fiction,
NSFW-adjacent culture, and institutional criticism are not floor violations by genre alone.

## 14. Acceptance conditions

- Saving a Note is distinct from runtime adoption.
- Positions are self-declared and are not published from memory.
- Arbitrary personas and multi-profile use remain open.
- Persona does not imply maintainer proficiency or implementation intent; Help alone performs no mutation.
- Raw Experience Receipts remain separate from causal hypotheses.
- Cluster distributions and minority reports are preserved.
- A `by design` response includes scope and a reconsideration trigger.
- Core content filtering requires explicit scoped authority.
- Forge Map and Quest Map do not misreport implementation or distribution state.
- Lack of merge authority does not turn a Note submission into failure.

## 15. Canonical boundary

This document defines the cross-repository operating contract. SphereOS Atlantis owns the implementation of
persona registry, tutorial resolver, Note template, Experience Receipt schema, validator, and tests.
Each religion, game, and World leaves its local content under its own author or community authority.

Japanese canonical source:
[異棚参加・相互非越権・Experience Receipt共通契約](participation-nonjurisdiction-and-experience.ja.md)
