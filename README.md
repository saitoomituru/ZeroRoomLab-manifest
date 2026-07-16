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

## Divination mode for projects that are stuck

This repository also preserves a divination framework salvaged from the discontinued SphereOS 3.x and 4.x line.
Those systems lost their original operating path after repeated OpenAI SDK and API sunsets.

The current document-based version can combine FAM terrain scanning with astrology, yin-yang and five-phase analysis,
rokuyō calendar references, market conditions, and a user-supplied random seed. It is intended for reframing a stuck
project, exposing overlooked resource conflicts, and deciding what to observe next. It does not replace testing,
accounting, contracts, safety checks, or the user's own decision.

The previous personality-model and instance-ghost UX has not been rebuilt. The current experience is closer to a
slightly mechanical cat-shaped shrine-maiden robot than a seamless spiritual interface, but it can still perform the
minimum divination workflow.

Read:

- [FAM operation specification](docs/theory/fam-operation.ja.md)
- [FAM divination quick start](docs/theory/fam-divination-quickstart.ja.md)

Astrology and calendar modes require external retrieval. The agent should obtain astronomical data from sources such
as NASA, JAXA, or the National Astronomical Observatory of Japan, derive the chart from the **user's location** and
current time, and retrieve relevant historical or ritual references instead of relying only on model memory.

For tarot, omikuji, hexagram, or other random-draw equivalents, the person being read must provide the random seed.
They may obtain it through their own religious practice or create at least 64 digits with physical TRPG dice or another
person-operated random source. The assistant should not silently generate the seed on the user's behalf.

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

## Active projects

### 800-series

A distributed cockpit system that lets the performer take back ownership of their production space.

- **OND800**: Raspberry Pi 5 shooting cockpit with NDI multi-camera and OBS control
- **FAN800**: ESP32 physical-effects funnels for lights, pyro, MIDI, and DMX
- **SAO800**: OBS mothership extension with RTSP-to-NDI bridging, BPM analysis, and AI offload
- **DVE800**: Local-AI editing engine on DaVinci Resolve
- **PSYCHO-Py800MCP**: Instrument MCP for oscilloscopes and logic analyzers

### FAM / SphereOS / Quantaril Cloud

AI architecture for connecting context spaces across cultures and communities.
MCP connects sideways. FAM digs down by saving, verifying, and reusing thought processes.

FAM currently exists as three lineages: FAMoverAQC, whose original service ended; FAMoverMCP,
a salvage path in progress; and FAMoverSphere-aae, a design-stage path paused pending HPC capacity.
SphereOS itself is frozen because of SDK deprecation and unsustainable HPC/cloud costs, and continues as
a document and tool-layer lineage riding on top of MCP.

### Laser Machine Rebuild

A five-person rural workshop crew turning rusty scrap into micrometer-class laser-cutter ductwork.
Geometry constraints solve what budget cannot.

---

## Repository map

| Repo | Role |
|---|---|
| [OND800](https://github.com/HIPSTAR-IScompany/OND800) | Shooting cockpit |
| [FAN800](https://github.com/HIPSTAR-IScompany/FAN800) | Physical-effects funnels |
| [SAO800](https://github.com/HIPSTAR-IScompany/SAO800) | Livestream mothership extension |
| [DVE800](https://github.com/saitoomituru/DVE800) | Editing engine |
| [PSYCHO-Py800MCP](https://github.com/HIPSTAR-IScompany/PSYCHO-Py800MCP) | Instrument MCP |
| [Sphere-aae](https://github.com/saitoomituru/Sphere-aae) | Edge AI agent engine |
| [SphereASTRO](https://github.com/saitoomituru/SphereASTRO) | GUI and responsibility-boundary layer |
| [commonsATX](https://github.com/saitoomituru/commonsATX) | Open-source laser-cutter frame |

---

## Manifest operating model

This repository serves three layers in one place:

- [note](note): raw notes, drafts, salvage logs, and source material that is not canonical yet
- [docs](docs): normalized documentation for philosophy, theory, projects, and operations
- [note/transfer_plan](note/transfer_plan): staging area for material that may move to another repository after review

The manifest also bootstraps the public ZeroRoomLab development environment. Workspace membership is a working-context
boundary, not an automatic implementation dependency. Enterprise and third-party workspaces expose only approved public
summaries. Company assets, labor data, medical information, credentials, internal paths, and enterprise agent instructions
are excluded from public reconstruction.

---

## Using this repository as an AI context formatter

Pull this repository into the AI toolchain before starting work. It provides:

1. Bias pre-correction
2. Scope-layer enforcement
3. Hallucination quarantine
4. Workspace and repository boundary resolution
5. Vendor-neutral project governance
6. Handoff logistics for heterogeneous agents

The result is not a smarter model in isolation. It is a better-governed development deck.

### Integration patterns

- Copy or reference `AGENTS.md` from Claude Code, Codex, Gemini CLI, or another coding agent
- Mirror the relevant rules into `.github/copilot-instructions.md` for GitHub Copilot
- Load `workspace-registry.json` and the actual `.code-workspace` descriptor before repository-scoped work
- Read each member repository's local `AGENTS.md` after resolving the workspace
- Do not infer implementation dependencies from neighboring folders or workspace membership

---

## Go deeper

| Document | Purpose |
|---|---|
| [AGENTS.md](AGENTS.md) | Root AI operating guidelines |
| [docs/operations/README.ja.md](docs/operations/README.ja.md) | Operations index |
| [docs/operations/heterogeneous-agent-deck-governance.ja.md](docs/operations/heterogeneous-agent-deck-governance.ja.md) | Multi-agent project governance |
| [docs/operations/workspace-boundary-register.ja.md](docs/operations/workspace-boundary-register.ja.md) | Workspace and repository boundary model |
| [docs/operations/workspace-registry.json](docs/operations/workspace-registry.json) | Machine-readable workspace registry |
| [docs/operations/development-environment-reconstruction.ja.md](docs/operations/development-environment-reconstruction.ja.md) | Public environment reconstruction |
| [docs/operations/coding-ai-japanese-paraphrase-register.ja.md](docs/operations/coding-ai-japanese-paraphrase-register.ja.md) | Japanese-to-en-US pragmatic translation |
| [docs/theory/fam-overview.ja.md](docs/theory/fam-overview.ja.md) | FAM overview |
| [docs/theory/fam-operation.ja.md](docs/theory/fam-operation.ja.md) | FAM operational and divination modes |
| [docs/theory/fam-divination-quickstart.ja.md](docs/theory/fam-divination-quickstart.ja.md) | Divination quick start |
| [docs/projects/bento-syndrome.md](docs/projects/bento-syndrome.md) | Context-collapse failure mode |

---

## Fork and adapt

CC-BY 4.0. Take the structure and replace the project-specific content with your own.

- Replace the known bias list with your own failure modes
- Define your own workspace and secret boundaries
- Separate engineering, philosophy, and academic claims
- Preserve the distinction between canonical documents, drafts, and transfer queues
- Keep project intent readable by humans and agents without requiring a proprietary central interpreter

```text
attribution: ZeroRoomLab / fusamofu (Mitsuru Saitō) / @K_chachamaru
```

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*