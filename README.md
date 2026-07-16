[![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![X: @K_chachamaru](https://img.shields.io/badge/X-%40K__chachamaru-black)](https://twitter.com/K_chachamaru)

# ZeroRoomLab-manifest

ZeroRoomLab is a one-person research studio and fabrication space
running out of an Edo-period farmhouse in Yamagata, Japan.
We build edge AI systems, live production rigs, and open hardware,
all on UPS power, well water, and stubbornness.

## This may look like project poetry. It is also project management infrastructure.

At first glance, this repository may look like a collection of manifestos, operating notes, and project poetry.
It is also an experimental project-management reference for the prompt-engineering era.

Its purpose is to keep heterogeneous coding agents from collapsing a shared workspace into conflicting scopes,
authorities, dependencies, rewrites, and vendor-specific defaults. It records the workspace map, canonical sources,
protected areas, communication registers, known agent biases, and handoff rules required for continuous development
across Codex, Claude Code, Gemini CLI, GitHub Copilot, and future agents.

The working hypothesis is simple:

> Coding throughput does not replace project management. In agentic development, the ability to encode intent,
> responsibility, boundaries, exceptions, and stopping conditions often matters before additional code generation does.

ZeroRoomLab calls that ability **poem power** in Japanese. It does not mean decorative writing.
It means turning goals and relationships that are not yet reducible to code into a reusable operating context for
humans and agents. Code provides local implementation force. Narrative specification tells that force where to go,
where to stop, and what it must not destroy.

This repository therefore doubles as a test bed for preventing **workspace-deck collapse**: the failure mode where
multiple vendor agents bring their own design philosophies into the same workspace, reinterpret one another's work,
and begin a proxy war instead of adding useful development capacity.

Start here:

- [Heterogeneous-agent deck governance](docs/operations/heterogeneous-agent-deck-governance.ja.md)
- [Workspace boundary register](docs/operations/workspace-boundary-register.ja.md)
- [Machine-readable workspace registry](docs/operations/workspace-registry.json)
- [Development-environment reconstruction](docs/operations/development-environment-reconstruction.ja.md)
- [Japanese-to-en-US pragmatic translation register](docs/operations/coding-ai-japanese-paraphrase-register.ja.md)

---

## Who is fusamofu (Mitsuru Saitō)?

Independent engineer and content creator. Goes by "fusamofu" and "Mad Shrine Maiden Scientist."
Self-described "working NEET," operating on a gift-economy model rather than a salary.

Roots include industrial-high-school microcontroller builds, an Apple FileMaker contract role,
Dentsu DTP/server-side work, and a decade running Gōdō Kaisha inferno doing AI R&D from 2011 to 2021.

Now based in an off-grid-leaning farmhouse in Yamagata, with UPS-only power, a private well,
and LiFePO4 backup, shipping edge AI, live production systems, and open hardware solo.

---

## What is ZeroRoomLab?

The lab name means both "starting from zero" and "a counter to the zero-margin modern era."

From one room in a Yamagata farmhouse, ZeroRoomLab runs quantum-adjacent AI research,
distributed livestream production, open hardware, documentation experiments, and agentic-development operations.
No staff, no investors, no conventional infrastructure. Just UPS power, well water, and the will to ship.

> The README opens with the public-facing view. The technical notes below assume readers will inspect the hardware,
> commits, logs, test conditions, and claim boundaries before extending any result. See the
> [communication register policy](docs/operations/technical-communication-register.ja.md).

---

## Active Projects

### 800-series (OND800 / FAN800 / SAO800 / DVE800 / PSYCHO-Py800MCP)

A distributed cockpit system that lets the performer take back ownership of their production space.

- **OND800**: Shooting cockpit on Raspberry Pi 5. NDI multi-camera plus OBS control.
- **FAN800**: Physical-effects funnels on ESP32. Drives lights, pyro, MIDI, and DMX autonomously.
- **SAO800**: OBS mothership extension. RTSP-to-NDI bridging, BPM analysis, and AI offload.
- **DVE800**: Local-AI editing engine on DaVinci Resolve. Whisper-L, FAM lexicon disambiguation, and compliance-review ingestion.
- **PSYCHO-Py800MCP**: Instrument MCP that gives AI access to oscilloscopes and logic analyzers.

### FAM / SphereOS / Quantaril Cloud

AI architecture for connecting context spaces across cultures and communities.
MCP connects sideways. FAM digs down by saving, verifying, and reusing thought processes.

FAM currently exists as three lineages: FAMoverAQC, whose original service ended; FAMoverMCP,
a toy-model salvage path in progress; and FAMoverSphere-aae, a design-stage path paused pending HPC capacity.
SphereOS itself is frozen because of SDK deprecation and unsustainable HPC/cloud costs, and continues only as
a tool-layer FAM riding on top of MCP. See [FAM overview](docs/theory/fam-overview.ja.md) and
[SphereOS](docs/theory/sphere-os.ja.md).

### Laser Machine Rebuild (Dr.SILICON Series)

A five-person rural workshop crew turning rusty scrap into micrometer-class laser-cutter ductwork.
Geometry constraints solve what budget cannot.

---

## Philosophy

### Gaming Cosmology

Reads the universe, society, and human life as an MMO-style structure.
"Why does God allow suffering?" becomes "Why did the developers ship this UX?"
Poverty becomes an economic-interface problem. War becomes a player-versus-player UX failure.
Hits bugs, not feelings.

### Techno-Animism

Japanese mythology, Shinto, Ryukyuan religion, engineering, AI, and information theory are treated not as isolated
domains, but as mutually convertible observation layers. The Rubber Shrine Maiden persona is not a costume.
It is a sandboxed I/O converter between worldviews.

### Multi-Range Existence

A human being is not confined to one genre, profession, or faith. Building, software, writing, ritual, care,
and observation can coexist within one person and one system. FAM and the four-axis range model are practical
implementations of this stance. Deliberate blurring is not deception; withholding information is not the same as
making a false claim.

### Jomon 2.0

Gift economy, off-grid infrastructure, and non-extractive order design.
Money is flow and velocity. Hoarding it is the losing play.

---

## Repositories

| Repo | Role |
|---|---|
| [OND800](https://github.com/HIPSTAR-IScompany/OND800) | Shooting cockpit |
| [FAN800](https://github.com/HIPSTAR-IScompany/FAN800) | Physical-effects funnels |
| [SAO800](https://github.com/HIPSTAR-IScompany/SAO800) | Livestream mothership extension |
| [DVE800](https://github.com/saitoomituru/DVE800) | Editing engine, DaVinci Resolve plus local AI |
| [PSYCHO-Py800MCP](https://github.com/HIPSTAR-IScompany/PSYCHO-Py800MCP) | Instrument MCP |
| [Sphere-aae](https://github.com/saitoomituru/Sphere-aae) | Edge AI agent engine, paused pending HPC |
| [SphereASTRO](https://github.com/saitoomituru/SphereASTRO) | GUI and responsibility-boundary layer for Sphere-aae |
| [commonsATX](https://github.com/saitoomituru/commonsATX) | Open-source laser-cutter frame, CERN-OHL-P |

---

## Go Deeper

| Doc | What it is |
|---|---|
| [docs/philosophy/gaming-cosmology.md](docs/philosophy/gaming-cosmology.md) | Gaming Cosmology canon, universe as MMO |
| [docs/philosophy/techno-animism.md](docs/philosophy/techno-animism.md) | Shinto and engineering as convertible observation layers |
| [docs/philosophy/multi-range-existence-draft.md](docs/philosophy/multi-range-existence-draft.md) | Multi-range existence draft |
| [docs/theory/fam-overview.md](docs/theory/fam-overview.md) | FAM, vertical thought storage |
| [docs/theory/infoton-engineering.md](docs/theory/infoton-engineering.md) | Infoton Engineering |
| [docs/projects/800-series.md](docs/projects/800-series.md) | 800-series operator-sovereignty system |
| [docs/projects/bento-syndrome.md](docs/projects/bento-syndrome.md) | UI hierarchy versus architecture mismatch |
| [docs/operations/README.ja.md](docs/operations/README.ja.md) | Operations index |
| [docs/operations/manifest-operating-model.ja.md](docs/operations/manifest-operating-model.ja.md) | Manifest operating model |
| [docs/operations/heterogeneous-agent-deck-governance.ja.md](docs/operations/heterogeneous-agent-deck-governance.ja.md) | Multi-vendor agent governance and workspace-deck-collapse prevention |
| [docs/operations/technical-communication-register.ja.md](docs/operations/technical-communication-register.ja.md) | Public and technical communication boundaries |
| [docs/operations/coding-ai-japanese-paraphrase-register.ja.md](docs/operations/coding-ai-japanese-paraphrase-register.ja.md) | Japanese-to-en-US pragmatic translation rules |
| [docs/operations/workspace-boundary-register.ja.md](docs/operations/workspace-boundary-register.ja.md) | Repository, workspace, project, environment, and dependency boundaries |
| [docs/operations/workspace-registry.json](docs/operations/workspace-registry.json) | Machine-readable workspace names and reconstruction status |
| [docs/operations/development-environment-reconstruction.ja.md](docs/operations/development-environment-reconstruction.ja.md) | Public workspace reconstruction procedure |
| [docs/operations/dotfiles-and-gitignore-policy.ja.md](docs/operations/dotfiles-and-gitignore-policy.ja.md) | Dotfile, generated-output, and secret boundaries |
| [quantaril.cloud](https://quantaril.cloud) | Live Quantaril Cloud docs site |

---

## Manifest operating model

This repository serves three layers in one place:

- [note](note): raw notes, drafts, salvage logs, and source material that are not canonical yet
- [docs](docs): normalized documentation for philosophy, theory, projects, and operations
- [note/transfer_plan](note/transfer_plan): staging area for material that may be forwarded to other repositories after review

The manifest is therefore not only an AI context patch. It is also a knowledge hub, transfer queue,
project-management layer, and reconstruction map for the wider ZeroRoomLab ecosystem.

The current handoff plan is tracked in
[note/transfer_plan/repository_transfer_map.md](note/transfer_plan/repository_transfer_map.md).

---

## Reconstructing the public development environment

This manifest bootstraps the public ZeroRoomLab development environment. It records the names and boundaries of
VS Code workspaces, the public Git repositories each workspace is expected to reference, and the checks an AI or AGI
must run before changing code.

Workspace membership is a working-context boundary, not an automatic implementation dependency.

Deb800 and the Sphere workspace have public reconstruction paths. Enterprise and third-party workspaces expose only
approved public summaries. Company assets, worksite data, medical information, credentials, internal paths,
and enterprise agent instructions are excluded from public reconstruction.

Start with the [workspace boundary register](docs/operations/workspace-boundary-register.ja.md),
the [machine-readable registry](docs/operations/workspace-registry.json), and the
[reconstruction procedure](docs/operations/development-environment-reconstruction.ja.md).

---

# Using ZeroRoomLab-manifest as an AI Context Formatter

> **TL;DR**: Load this repository into the working context before development begins.
> It pre-corrects known agent biases, defines scope layers, reconstructs workspace boundaries,
> and supplies a vendor-neutral project operating context.

## What this repository actually is

Most READMEs describe a project for humans to read.
This repository is also a **runtime context patch and project-management layer for AI agents**.

When loaded into an agent's working context, it provides:

1. **Bias pre-correction**: known failure modes are named before output.
2. **Scope-layer enforcement**: Engineering, Philosophy, and Academic/Theory claims use different evaluation rules.
3. **Hallucination quarantine**: known confabulation traps are declared in advance.
4. **Workspace resolution**: the descriptor and registry define the working set without inferring dependencies from proximity.
5. **Heterogeneous-agent governance**: vendor defaults remain subordinate to the local workspace contract.
6. **Handoff continuity**: the next human or agent can continue without reconstructing the previous agent's private context.

The result is not a perfectly obedient model. It is a development session that starts from a documented project world
instead of a vendor-default world.

---

## Integration patterns

### Repository-level agent instructions

Use this repository as a submodule, adjacent context repository, or documented dependency. Load the root `AGENTS.md`
and then the local `AGENTS.md` of each repository in the resolved workspace.

```bash
git submodule add https://github.com/saitoomituru/ZeroRoomLab-manifest .zrl-context
cp .zrl-context/AGENTS.md ./AGENTS.md
```

### GitHub Copilot custom instructions

Where appropriate, map relevant instructions into `.github/copilot-instructions.md`, while keeping this manifest as
the canonical source rather than allowing copied instructions to drift.

### Browser agents, MCP agents, and orchestration systems

Prepend or retrieve the relevant manifest documents as system context. The central requirement is not a particular
injection mechanism. It is that the agent receives the same workspace contract, canonical-source map, protected-area
rules, and communication registers before changing project state.

A dedicated CLI is intentionally not required. Markdown, JSON, workspace descriptors, and Git history remain directly
readable by different vendors without appointing one adapter as the new central authority.

---

## Core payload

### Bias checklist

The root `AGENTS.md` includes checks for scope creep, narrative pull, NSFW parity, majority-narrative pull,
innovation-frame errors, evidence burn, lineage confusion, narrative contamination, genre-risk confusion,
communication-register drift, and locale/paraphrase errors.

### Three-layer scope model

```text
Layer A: Engineering      -> falsifiability, reproducibility, benchmarks, tests
Layer B: Philosophy       -> coherence, explanatory power, openness to fork
Layer C: Academic/Theory  -> citation integrity and bounded claims
```

### Evidence hierarchy

```text
HIGH: timestamped commits, screenshots, server logs, hardware photos
MED:  reconstructed timelines corroborated by at least one artifact
LOW:  uncorroborated verbal accounts, flagged but not discarded
NOT:  individual source equals low trust
```

### Workspace and deck governance

A workspace is a cognitive and operational boundary. A repository is not automatically an implementation dependency
merely because it appears in the same workspace. Different agents must not treat their own vendor configuration,
sandbox model, or preferred architecture as the project's highest authority.

See [heterogeneous-agent deck governance](docs/operations/heterogeneous-agent-deck-governance.ja.md).

---

## FAM-compliant context reconstruction

This repository defines the FAM symbol frame used across ZeroRoomLab AI architecture:

```text
psi   -> input semantic waveform
nabla-phi -> routing gradient
lambda -> output layer
Q     -> verifier and control logic
```

After session loss, context reset, or BENTO Syndrome, load this manifest before task-specific documents.
It re-establishes the shared frame, workspace boundaries, canonical sources, and known bias checks.

---

## Who this is for

- Solo developers running context-intensive agent workflows
- Teams combining multiple coding-agent vendors
- Experimental researchers who need frontier work evaluated as experiments rather than automatically normalized
- Projects where session resets, handoffs, and vendor changes are expensive
- Operators who need secrets, enterprise assets, and local-only components represented without exposing them
- Anyone who has learned that more agents can increase conflict faster than useful throughput

---

## Fork and adapt

The structure is reusable:

- Replace ZeroRoomLab-specific bias checks with your own known failure modes
- Define your own claim layers and evidence rules
- Record workspace names, members, exclusions, and reconstruction status
- Separate canonical documents from drafts and transfer queues
- Describe protected components without exposing their contents
- Establish vendor-neutral handoff and stop conditions
- Keep poetic or narrative language when it carries project-management meaning, then explain its operational function

The pattern is:

```text
bias pre-correction
+ scope enforcement
+ workspace resolution
+ protected-area boundaries
+ heterogeneous-agent governance
+ handoff continuity
```

```text
attribution: ZeroRoomLab / fusamofu (Mitsuru Saitō) / @K_chachamaru
```

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*