# Help and Capability Discovery Contract

Status: `[CANONICAL-CANDIDATE]` `[Layer A/B bridge]`  
Established: 2026-07-19  
License: `CC-BY-4.0`  
Applies to: SphereOS Atlantis, Sphere-DOS, tutorials, SaaS AI, VS Code, Codespaces, and non-code contributors

## 1. Purpose

Prevent a repository or tutorial from assuming that every visitor has the context of the Manifest author,
maintainer, or an expert coding agent—and then starting implementation before it has even shown them the doorways.

Help is not a renamed command list. It is a decompression room. It maps current capability, unfinished scaffolding,
participation routes, required environments, permissions, and side effects into the visitor's own language, then
stops mutation until that person chooses what happens next.

## 2. Keep persona, proficiency, and intent separate

```yaml
help_context:
  personas: []
  proficiency: unknown
  intent: look-around
  requested_route: help
```

- `persona`: a self-declared presentation such as gamer, theologian, shrine practitioner, or engineer
- `proficiency`: `unknown | newcomer | explorer | contributor | maintainer`
- `intent`: `look-around | learn | write-note | report-experience | inspect | implement`

Do not infer proficiency, permission, faith, occupation, or implementation intent from a persona.
Engineers keep the Help route. Gamers, theologians, and spiritual practitioners are not automatically beginners.
The defaults are `proficiency: unknown` and `intent: look-around`.

## 3. Help-start invariants

A request to start Help or a tutorial does not authorize:

- creating a branch, changing a file, committing, pushing, or writing an Issue or PR;
- installing dependencies, cloning components, calling a model, or reaching the network;
- granting merge, code-change, or World authority;
- publishing persona, religion, health, identity, or other user-memory data;
- presenting unfinished or untested work as available now.

```yaml
help_receipt:
  mutation_performed: false
  network_access_performed: false
  permissions_granted: false
  identity_inferred: false
```

Even after the visitor explicitly chooses `implement`, the route must resolve AGENTS.md, the Manifest, CORN,
required MAGI hooks, the target schema and tests, and actual authority. Showing Help is not implementation approval.

## 4. What Help shows first

Help gives a short answer covering at least:

1. what this project is;
2. what can be used or tested now;
3. what has scaffolding but no finished body;
4. what is not implemented, not tested, resource-wait, or unknown;
5. how to contribute without writing code;
6. environment and permission requirements;
7. next choices that do not mutate anything.

Default menu:

```text
1. Show me the project map
2. Show only what is implemented
3. Show unfinished quests
4. Show me how to write a Note
5. Show me how to send an Experience Receipt
6. Check the development environment
7. Continue to the branch-and-implementation route
```

Do not choose `7` for the visitor.

## 5. Capability states

| State | Meaning |
|---|---|
| `AVAILABLE-NOW` | Usable or testable within the currently cited evidence |
| `SCAFFOLDED` | Docs, schema, CLI entrance, or other footing exists; the full body does not |
| `NOT-IMPLEMENTED` | A proposal, contract, or quest exists without an implementation |
| `NOT-TESTED` | An implementation or scaffold exists but has not been tested in the named environment |
| `RESOURCE-WAIT` | Waiting for compute, hardware, quota, outside review, or another named resource |
| `UNKNOWN` | Current sources do not support a decision |

Do not promote `SCAFFOLDED` to `AVAILABLE-NOW` or turn `UNKNOWN` into a pass.
Attach source, revision, and test conditions where practical.

## 6. Natural-language entrances and machine output

The following can start Help:

```text
What is this project?
What can it do?
Start beginner Help
I want a gamer-oriented tour
How can I join without writing code?
Show only implemented features
```

Machine output carries at least:

```json
{
  "status": "HELP-READY",
  "proficiency": "unknown",
  "intent": "look-around",
  "capabilities": [],
  "entry_options": [],
  "mutation_performed": false,
  "network_access_performed": false,
  "permissions_granted": false,
  "identity_inferred": false
}
```

CLI, VS Code tasks, SaaS AI, and Codespaces share the same meaning contract. Do not hard-code one vendor's
chat UI or memory feature into Help Core.

### 6.1 Separate PLI, CLI, and the Execution Envelope

This contract calls the natural-language surface that moves from Help into design, Notes, review, and implementation
handoff the **Prompt Line Interface (PLI)**. PLI is not a synonym for a chat bubble, one vendor UI, an assistant
persona, or an LLM driver. It is the `S4: prompt` entrance where purpose, questions, constraints, context, and desired
results are presented and their route is resolved through dialogue.

```text
PLI   Prompt Line Interface
      Strong at D-axis work: Context Dimensions, nD Folds, Worlds, meanings, purposes, and unknowns

CLI   Command Line Interface
      Strong at L-axis work: tightly constraining runtimes, libraries, SDKs, and applications with commands and args

LLMI  Large Language Model Interface
      An Execution Envelope boundary for model, provider, and inference driver
```

These are tendencies, not castes. Schema, tool contracts, and approval gates can tighten a PLI. DSLs, scripts,
and composition can let a CLI handle abstract structures. A CLI's executability does not prove D-axis semantic
fitness; a PLI's ability to explain does not prove L-axis implementation, reproduction, or execution.

Do not infer an LLM, provider, model, assistant or NPC role, repository authority, Python process, or standalone
runtime from the PLI. Record those separately when relevant:

```json
{
  "interface": {
    "id": "prompt-line",
    "display_name": "Prompt Line Interface",
    "scoped_alias": "Atlantis PLI"
  },
  "interaction_profile": "assistant",
  "bindings": {
    "persona": null,
    "world": null,
    "entity": null
  },
  "execution_envelope": {
    "inference_driver": "unknown",
    "local_process": "unknown"
  }
}
```

Because `PLI` may collide with other abbreviations, do not use it as the default executable command, package,
or file extension. The machine ID is `prompt-line`; the established CLI ID is `command-line`.
Do not frame Prompt Engineering Edition as an imitation, reproduction, fake CLI, or unofficial route.

### 6.2 Interface difference is not authenticity rank

A canonical repository does not make one interface into the only real doorway. Keep these dimensions separate:

```text
Authenticity       signatures, origin, tampering, impersonation
Provenance         repository, revision, contract, observation lineage
Interface          PLI, CLI, GUI, API, IDE, and other interaction surfaces
Execution Envelope model inference, local process, connector, container, bare metal
Capability         read, generate, test, commit, deploy, and other actions
Authority          read, write, push, merge, device-control permissions
Engineering State  AVAILABLE, SCAFFOLDED, NOT IMPLEMENTED, NOT TESTED, and peers
Receipt            operations actually performed, conditions observed, and results
```

`Python process unavailable` describes an Execution Envelope. It does not make the PLI fake.
`standalone runtime: NOT IMPLEMENTED` describes one capability and must not collapse all of Prompt Engineering
Edition into “unimplemented.” Show current doorways first; delay irrelevant boundary detail until the visitor
requests the corresponding operation.

## 7. Shelf-specific presentations

The same capability map may be presented differently:

- game shelf: World Map, quests, implemented features, portals, unexplored ground, kusoge-flag reports;
- theology and spiritual shelf: Meaning, World, Agency, non-jurisdiction, Notes, observation records;
- engineering shelf: architecture, schema, tests, runtime, unfinished work, resources, branches;
- infoton-engineering shelf: FAM, Registry, OAE, provenance, exploration techniques, transformation boundaries.

Presentation does not change state, authority, or implementation evidence. Do not turn unfinished work into a
shipped quest for gamers, and do not reduce Meaning to disposable flavor for engineers.

## 8. Moving into implementation

Implementation requires at least:

```text
intent == implement
target selected
context closure complete
write scope known
required hook complete
```

If anything is missing, return to `HELP-READY` or `CONTEXT-INCOMPLETE`. Do not quietly choose a minimum
implementation. When the visitor lacks merge authority, route them through a fork and PR and treat
`PR_SUBMITTED` as a valid completion.

## 9. Acceptance conditions

- A Help request performs no mutation, network operation, or permission grant.
- Persona alone does not imply proficiency or intent.
- `unknown` proficiency is not promoted to expert or maintainer.
- AVAILABLE, SCAFFOLDED, NOT IMPLEMENTED, NOT TESTED, RESOURCE WAIT, and UNKNOWN remain distinct.
- Help shows Note and Experience routes that require no code.
- Engineers retain a look-around route.
- SaaS AI can re-present the machine output.
- A visitor can begin from documentation without CLI or VS Code.

## 10. Canonical boundary

This document defines the cross-repository Help contract. SphereOS Atlantis owns its capability registry,
persona and proficiency resolver, CLI, human and JSON renderers, fixtures, and tests.

Japanese canonical source: [Help／Capability Discovery共通契約](help-and-capability-discovery.ja.md)
