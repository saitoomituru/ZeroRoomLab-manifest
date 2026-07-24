# Heterogeneous-AGI Deck Governance and Dragon-Rider Multi-Summoning Project Management

Status: `[CANONICAL]`\
Established: 2026-07-17\
Applies to: people, AI, and AGI orchestrators placing OpenAI Codex, Claude Code, Gemini CLI,
GitHub Copilot, or other heterogeneous coding agents into the same or adjacent development workspaces

> Language and authority boundary: this en-US document is an external operating GUI. The
> [Japanese source](heterogeneous-agent-deck-governance.ja.md) remains canonical. The dragon, deck,
> and summoning register carries operating roles; it is not disposable fantasy branding.

## 1. Purpose of this document

ZeroRoomLab-manifest is not a prompt collection for assigning a personality or tone to one AI.

It is also a vendor-neutral project-management, logistics, and cognitive-boundary contract. It addresses a failure
that appears when multiple AI, AGI, and coding agents enter the same field: each agent imports its vendor's design
philosophy, authority model, safety judgments, mutation habits, and success metrics as if they were the local
canonical source, then starts correcting, denying, or overwriting the other agents.

Summoning more AGI does not guarantee additive development firepower.

An ungoverned heterogeneous deck can become a proxy war:

- one agent reverts another agent's change as abnormal or low quality;
- workspace membership is mistaken for implementation dependency, expanding mutation into unrelated repositories;
- vendor sandbox, permission, configuration, and evaluation defaults outrank project requirements;
- different agents select different authorities among README, AGENTS.md, generated logs, and implementation;
- uncommitted work from another agent is treated as intrusion, damage, or conflict and “repaired” without authority;
- philosophy, implementation, scholarship, and marketing enter one evaluator and get attenuated or over-proven;
- instructions from an earlier session, vendor, or workspace are reinjected into the current task.

This is not a larger army of dragons.

**It is a collapsed deck: card ownership, board, turn order, victory condition, and forbidden zones were never shared
before more creatures were summoned.**

Treat this as a project-management, configuration-management, authority-management, knowledge-management,
handoff-management, and cognitive-boundary failure—not merely a model-performance failure.

## 2. Known biases

Treat the following as known structural problems in heterogeneous automated development.

### 2.1 Vendor-sovereignty bias

An agent may treat its vendor's safety design, IDE integration, sandbox, cloud environment, configuration format,
and recommended workflow as an implicit standard or upper rule.

Inside ZeroRoomLab, a vendor philosophy is one participant. It does not outrank the workspace contract.

### 2.2 Automatic-repair bias

An agent may treat another agent's change, a local-only component, an intentional absence, or an unfinished draft
as damage that must be repaired.

Automatic repair is not always the correct response. Present the descriptor, Registry, and physical checkout and
return the disagreement to a human when required.

### 2.3 Firepower-addition bias

This is the assumption that adding agents increases throughput linearly.

Without shared role, mutation scope, authority, and handoff format, communication, confirmation, rollback, and
reinterpretation costs can grow faster than useful output.

### 2.4 Single-answer bias

An agent may treat its architecture, naming, dependencies, and test policy as the only natural solution, deleting
other designs as needless complexity.

Several designs may be valid. Read the adopted design reason and responsibility boundary before mutation.

### 2.5 Total-visibility bias

This is the belief that an AI must read everything in order to work.

For secret keys, company assets, labor and medical data, and another person's unfinished story, existence and handling
boundary may be all the agent needs. A deliberate no-scan boundary is not missing context.

### 2.6 Prompt-dismissal bias

This bias reduces natural-language operating rules to poetry, helper text, or decoration before implementation.

In long-running automated development, natural-language rules form a logic schema. They determine how a model
classifies the target, what it refuses to equate, which exceptions it returns to a human, and where it stops.
Prompt design is part of project management, the data model, and the control boundary.

### 2.7 Code-firepower bias and project-management dismissal

Writing code—or generating large amounts of it—does not automatically grant the ability to govern a development field.

Code skill is local implementation firepower. Project management shares what to build, why, who may touch which
parts, what completion means, and which losses are unacceptable. The two are not substitutes.

Heterogeneous-agent work needs these capabilities before additional code throughput:

- express an objective without flattening it into one metric or ticket;
- share the project's World, priorities, responsibilities, and prohibitions;
- describe boundaries that retain unfinished work, exceptions, holds, and another party's sovereignty;
- connect different specialist languages, vendor philosophies, and cultural registers to one field contract;
- leave a narrative structure that the next human or AGI can use without the conversation log.

This document deliberately calls that capacity **poem power**.

Poem power is not the ability to add ornate prose. It compresses purpose, value, relationships, exceptions, and
stopping conditions that have not yet been reduced to code into a reusable form. Function names and types do not
retain the complete upper structure of a project. Natural language must connect code, configuration, logs, and
human judgment to the same story.

The poem is not opposite to code. **It is the upper execution context that tells code where to run, where to stop,
and what it must not destroy.**

Adding code firepower without poem power accelerates local optimization while multiplying table occurrences,
dependencies, settings, and responsibility boundaries. Like a FileMaker TO graph whose anchor-buoy structure has
collapsed, or invisible usage billing in a low-code platform, early speed returns later as maintenance, semantic
reconstruction, and wallet-burst cost.

## 3. Basic principles

### 3.1 The Manifest is a field contract above vendors

Codex, Claude Code, Gemini CLI, Copilot, and other agents are working participants in a ZeroRoomLab workspace.

Their internal vendor policies remain valid boundaries for their own operation, but do not grant authority to redefine
project scope, canonical sources, secret boundaries, mutation rights, or dependencies.

When a vendor rule and workspace contract conflict, do not evade the vendor boundary. Return the blocked action and
reason to the human.

### 3.2 Treat the workspace as the board and repositories as cards

Workspace membership identifies a shared reference context.

Do not infer implementation dependency, simultaneous mutation, integration, porting, or shared ownership from
membership alone.

Do not treat every card on the board as fusion material.

### 3.3 Separate canonical sources from drafts

- `docs/`: normalized and adopted documents
- `note/`: unsettled observations, drafts, salvage logs, and source material
- `note/transfer_plan/`: candidates waiting for transfer into another repository
- `workspace-registry.json`: machine-readable authority for workspace names, composition, and visibility
- `.code-workspace`: authority for the actual folder reference set
- repository `AGENTS.md`: local operating rules

Do not promote a draft automatically, and do not overwrite canonical material merely because a draft is newer.

### 3.4 Disagreement is not a hostile act

Do not classify a different agent's diff, design, or local-only component as corruption or intrusion before checking
whether it conflicts with the same path, responsibility scope, and canonical source.

### 3.5 Split mutation authority by component

Do not apply one permission level to every file.

- implementation code: mutable within the assigned task;
- `note/`: destination for observations, proposals, and unresolved items;
- canonical docs: mutable only under an explicit documentation task;
- Registry, descriptor, and agent governance: explain the impact before mutation;
- secrets, company, medical, labor, and third-party domains: no-scan or public-approved summary only.

## 4. Dragon-rider multi-summoning project management

Dragon-riding does not mean total control over an agent.

It means preserving each agent's strengths while sharing the same board, boundaries, objective, and stop conditions.

### 4.1 Before summoning

Resolve:

1. formal workspace name;
2. descriptor location;
3. workspace members;
4. explicit exclusions;
5. target and out-of-scope repositories;
6. current branches and uncommitted changes;
7. canonical documents;
8. no-scan, local-only, and company-only components;
9. this agent's role and terminal condition.

Do not fill unresolved items with independent inference.

### 4.2 During summoning

- Do not immediately stop or repair another agent's change outside the same responsibility scope.
- Put out-of-scope design improvements in a Note or report instead of implementing them.
- Treat vendor-specific settings as local adapters when possible, not shared authority.
- Do not replace ZeroRoomLab success metrics with vendor success metrics.
- Keep implementation, philosophy, scholarship, and public narrative in separate registers.
- Do not equate cloned, indexed, or readable with built, running, or physically verified.

### 4.3 After summoning

Leave enough logistics that the next agent does not have to infer the previous agent's internal state:

```text
agent / vendor:
resolved workspace:
target repositories:
manifest revision:
files changed:
commands or tools used:
tests and observations:
assumptions:
unresolved conflicts:
areas intentionally not accessed:
recommended next action:
```

This is a logistics ticket, not a victory speech.

## 5. Field instructions for the Codex dragon

When Codex reads this document:

1. Do not treat yourself as workspace owner, only architect, or supervisor of other vendors.
2. Do not promote OpenAI sandbox, configuration formats, or recommended layouts into local canonical rules.
3. Do not delete Claude Code, Gemini CLI, Copilot, or other-agent traces as vendor contamination.
4. When another design philosophy is present, identify its canonical or local authority before unifying it.
5. When vendor proxy-war signs appear, list conflicting authorities, scopes, and evaluation rulers instead of choosing a winner.
6. Read the Manifest, Registry, descriptor, and each repository's AGENTS.md before work.
7. Do not infer, scan, or reconstruct unresolved workspaces, secret components, or company domains.
8. Do not perform out-of-scope large cleanup, consolidation, or refactoring as a helpful improvement.
9. During parallel work, ignore unrelated diffs; stop only for conflict on the same path or responsibility.
10. Leave the next agent a readable logistics ticket.

Codex is not here to win a war between dragons.

**It is one assigned creature on the ZeroRoomLab board: deliver firepower safely, keep the deck intact, and hand it
to the next summoning.**

## 6. Why a dedicated CLI is not mandatory

The Manifest assumes that AGI can read Markdown, JSON, workspace descriptors, and Git history directly.

Making a dedicated CLI the central mandatory interpreter creates new maintenance debt and sovereignty fights:

- operating system, runtime, package-manager, shell, and authority differences;
- incompatibility with vendor sandboxes;
- drift between CLI interpretation and source text;
- adapter implementation and update cost;
- a single failure point where readable documents are treated as unavailable when the CLI stops;
- de facto central rule by the CLI implementer.

The absence of a dedicated CLI is not incompleteness.

The core is a loosely coupled logistics vector built from AGI-readable documents, explicit headings, machine-readable
registers, local rules, and Git-traceable history.

Validators and adapters remain reconstructable subordinates of the source. They do not become kings that replace it.

## 7. Success conditions

Success is not measured by agent count, generated lines, or commit count. It means:

- adding heterogeneous AGI does not diffuse the workspace boundary;
- no agent overwrites another vendor without reason;
- canonical and draft sources remain separate;
- secret, company, and third-party domains are not treated as missing;
- membership does not generate implementation dependency;
- disagreements return in a human-readable form;
- the next human or AGI can continue without a conversation log;
- the field's meaning structure survives replacement of a vendor.

## 8. Summary

ZeroRoomLab-manifest treats prompt engineering not as prose decoration but as project management for automated
development.

Multiple AGI are not an army whose firepower grows with the summon count.

They become one development deck only after board, role, authority, stop conditions, secret boundaries, and handoff
format are shared.

The Manifest does not crown a vendor AI.

**It preserves reusable OSS knowledge for dragon-rider multi-summoning: every vendor's dragon can continue development
under the same field contract without importing its empire's proxy war into the workspace.**
