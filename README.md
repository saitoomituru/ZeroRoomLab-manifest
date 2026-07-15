[![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![X: @K_chachamaru](https://img.shields.io/badge/X-%40K__chachamaru-black)](https://twitter.com/K_chachamaru)

# ZeroRoomLab-manifest

ZeroRoomLab is a one-person research studio and fabrication space
running out of an Edo-period farmhouse in Yamagata, Japan.
We build edge AI systems, live production rigs, and open hardware —
all on UPS power, well water, and stubbornness.

---

## Who is fusamofu (Mitsuru Saitō)?

Independent engineer and content creator. Goes by "fusamofu" and "Mad Shrine Maiden Scientist."
Self-described "working NEET" — operating on a gift economy model, not a salary.

Roots: industrial high school microcontroller builds (nationals qualifier), Apple FileMaker contract gig,
Dentsu DTP/server-side work, and a decade running Gōdō Kaisha inferno doing AI R&D (2011–2021).

Now based in an off-grid-leaning farmhouse in Yamagata — UPS-only power (no solar), private well, LiFePO4 backup —
shipping edge AI, live production systems, and open hardware solo.

---

## What is ZeroRoomLab?

The lab name means two things: "starting from zero" and "a counter to the zero-margin modern era."

From one room in a Yamagata farmhouse, we run quantum-adjacent AI, distributed livestream production,
and open hardware. No staff, no investors, no conventional infrastructure.
Just UPS power, well water, and the will to ship.

---

> The README opens with the public-facing view. The technical notes below assume readers will inspect the hardware, commits, logs, test conditions, and claim boundaries before extending any result. See the [communication register policy](docs/operations/technical-communication-register.ja.md).

## Active Projects

### 800-series (OND800 / FAN800 / SAO800 / DVE800 / PSYCHO-Py800MCP)

A distributed cockpit system — lets the performer take back ownership of their own production space.

- **OND800**: Shooting cockpit on Raspberry Pi 5. NDI multi-camera + OBS control.
- **FAN800**: Physical effects funnels on ESP32. Drives lights, pyro, MIDI, DMX autonomously.
- **SAO800**: OBS mothership extension. RTSP→NDI bridging, BPM analysis, AI offload.
- **DVE800**: Local-AI editing engine on top of DaVinci Resolve. Whisper-L + FAM lexicon disambiguation + compliance-review ingestion.
- **PSYCHO-Py800MCP**: Instrument MCP. Gives AI eyes on oscilloscopes and logic analyzers.

### FAM / SphereOS / Quantaril Cloud

AI architecture for connecting context spaces across cultures and communities.
MCP connects sideways. FAM digs down — saves, verifies, and reuses thought processes.

FAM currently exists as three lineages: FAMoverAQC (legacy, service ended), FAMoverMCP (toy-model salvage, in progress), and FAMoverSphere-aae (design stage, paused pending HPC). SphereOS itself is frozen — halted by both SDK deprecation and unsustainable HPC/cloud costs — and continues only as a tool-layer FAM riding on top of MCP. See [docs/theory/fam-overview.ja.md](docs/theory/fam-overview.ja.md) and [docs/theory/sphere-os.ja.md](docs/theory/sphere-os.ja.md).

### Laser Machine Rebuild (Dr.SILICON Series)

Five-person rural workshop crew. Turning rusty scrap tin cans into μm-precision laser cutter duct work.
Geometry constraints solve what budget can't.

---

## Philosophy

### Gaming Cosmology

Reads the universe, society, and human life as an MMO-style structure.
"Why does God allow suffering?" becomes "Why did the devs ship this UX?"
Poverty = Economic UI design problem. War = Player-vs-player UX failure.
Hits bugs, not feelings.

### Techno-Animism

Japanese mythology, Shinto, Ryukyuan religion, engineering, AI, and information theory — not as separate domains,
but as mutually convertible observation layers. The Rubber Shrine Maiden persona isn't a costume;
it's a sandboxed I/O converter between world-views.

### Multi-Range Existence

A human being is not confined to a single genre, profession, or faith. ZeroRoomLab treats this as an upper frame
for all work: building, software, writing, ritual, and care can coexist in one person and one system.
FAM and the four-axis range model are not separate from this idea; they are practical implementations of it.
"Blurred" is not deception. What is intentionally withheld is not the same as what is falsely claimed.

### Jomon 2.0

Gift economy, off-grid infrastructure, non-extractive order design.
Money is flow and velocity. Hoarding it is the losing play.

---

## Repositories

| Repo | Role |
|---|---|
| [OND800](https://github.com/HIPSTAR-IScompany/OND800) | Shooting cockpit |
| [FAN800](https://github.com/HIPSTAR-IScompany/FAN800) | Physical effects funnels |
| [SAO800](https://github.com/HIPSTAR-IScompany/SAO800) | Livestream mothership extension |
| [DVE800](https://github.com/saitoomituru/DVE800) | Editing engine (DaVinci Resolve × local AI) |
| [PSYCHO-Py800MCP](https://github.com/HIPSTAR-IScompany/PSYCHO-Py800MCP) | Instrument MCP |
| [Sphere-aae](https://github.com/saitoomituru/Sphere-aae) | Edge AI agent engine (FAM inference core, paused pending HPC) |
| [SphereASTRO](https://github.com/saitoomituru/SphereASTRO) | GUI + responsibility-boundary layer for Sphere-aae (Swift/SwiftUI, AI not yet connected) |
| [commonsATX](https://github.com/saitoomituru/commonsATX) | Open-source laser cutter frame (CERN-OHL-P) |

---

---

## Go Deeper

| Doc | What it is |
|---|---|
| [docs/philosophy/gaming-cosmology.md](docs/philosophy/gaming-cosmology.md) | Gaming Cosmology Canon — universe as MMO |
| [docs/philosophy/techno-animism.md](docs/philosophy/techno-animism.md) | Shinto + engineering as convertible observation layers |
| [docs/philosophy/multi-range-existence-draft.md](docs/philosophy/multi-range-existence-draft.md) | Multi-range existence draft — upper frame for FAM and range theory |
| [docs/theory/fam-overview.md](docs/theory/fam-overview.md) | FAM (FoldAccessMapper) — vertical thought storage |
| [docs/theory/infoton-engineering.md](docs/theory/infoton-engineering.md) | Infoton Engineering — industrial number theory via FAM |
| [docs/projects/800-series.md](docs/projects/800-series.md) | 800-series — operator sovereignty recovery system |
| [docs/projects/bento-syndrome.md](docs/projects/bento-syndrome.md) | BENTO Syndrome — UI hierarchy vs architecture mismatch |
| [docs/operations/README.ja.md](docs/operations/README.ja.md) | Operations index — note, docs, and transfer-queue operating model |
| [docs/operations/manifest-operating-model.ja.md](docs/operations/manifest-operating-model.ja.md) | Manifest operating model — three-layer structure and update rules |
| [docs/operations/technical-communication-register.ja.md](docs/operations/technical-communication-register.ja.md) | Public-facing and technical communication register boundary |
| [docs/operations/coding-ai-japanese-paraphrase-register.ja.md](docs/operations/coding-ai-japanese-paraphrase-register.ja.md) | Japanese-to-en-US pragmatic translation rules for coding AI |
| [quantaril.cloud](https://quantaril.cloud) | Live Quantaril Cloud docs site |

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*

---

## Manifest operating model

This repository now serves three layers in one place:

- [note](note) — raw notes, drafts, salvage logs, and source material that should not be treated as canonical yet. Note-taking conventions are documented in [note/AGENTS.md](note/AGENTS.md)
- [docs](docs) — normalized documentation for philosophy, theory, and projects
- [note/transfer_plan](note/transfer_plan) — staging area for content that should be forwarded to other repositories after review

In other words, this manifest is not only a context patch. It is also a knowledge hub and transfer queue for the wider ZeroRoomLab ecosystem.

The current handoff plan is tracked in [note/transfer_plan/repository_transfer_map.md](note/transfer_plan/repository_transfer_map.md), and the overall update proposal is documented in [note/20260713-1800__repo_structure_update_proposal.md](note/20260713-1800__repo_structure_update_proposal.md).

---

# Using ZeroRoomLab-manifest as an AI Context Formatter

> **TL;DR**: Pull this repo into your AI toolchain before starting work.
> It patches AI cognitive biases, defines scope layers, and pre-loads
> FAM-compliant context structure — so you spend less time correcting your AI and more time building.

---

## What This Repo Actually Is

Most READMEs describe a project for humans to read.
This repo is a **runtime context patch for AI agents**.
When injected into an AI's working context, it does three things:

1. **Bias pre-correction** — known failure modes are named and checked before output (AGENTS.md §0)
2. **Scope layer enforcement** — separates Engineering / Philosophy / Theory so AI doesn't apply science falsifiability to cosmology (AGENTS.md §2)
3. **Hallucination quarantine** — named confabulation traps are declared upfront (AGENTS.md §10)

The result: your AI session starts in a calibrated state rather than a default state.

---

## Three Integration Patterns

### Pattern 1 — Claude Code (`.claude/` dependency injection)

Add this repo as a submodule or copy `AGENTS.md` into your repo root.
Claude Code reads `AGENTS.md` automatically at session start.

```bash
# as submodule
git submodule add https://github.com/saitoomituru/ZeroRoomLab-manifest .zrl-context
cp .zrl-context/AGENTS.md ./AGENTS.md

# or direct copy
curl -O https://raw.githubusercontent.com/saitoomituru/ZeroRoomLab-manifest/main/AGENTS.md
```

Claude Code will ingest the bias checklist, scope model, and hallucination flags
before touching any code in your repo.

**Effect**: Experimental/frontier tasks get experiment-design responses,
not "established best practice" deflections.

---

### Pattern 2 — GitHub MCP / Copilot Custom Instructions

Paste the contents of `AGENTS.md` into your GitHub Copilot
[custom instructions](https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot)
file (`.github/copilot-instructions.md`).

```bash
mkdir -p .github
curl https://raw.githubusercontent.com/saitoomituru/ZeroRoomLab-manifest/main/AGENTS.md \
  > .github/copilot-instructions.md
```

The 3-layer scope model (§2) is particularly effective here:
Copilot stops demanding academic citations for philosophical design decisions.

---

### Pattern 3 — Chrome MCP / Browser Agent Context

When using Claude in Chrome or similar browser-based agents, prepend `AGENTS.md`
to the system prompt or inject via the MCP server's system context field.

For any MCP server config (`mcp_config.json` or equivalent):

```json
{
  "mcpServers": {
    "your-server": {
      "command": "...",
      "systemPromptPrepend": "<<AGENTS.md contents>>"
    }
  }
}
```

**Most useful for**: NSFW/SFW multi-channel content work where
the parity check (§0, item 3) prevents the agent from silently
downgrading one channel's analytical rigour.

---

## The Core Payload: What AGENTS.md Injects

### Bias Checklist (§0) — runs before every AI response

| Check | Prevents |
|---|---|
| Scope Creep | "No scientific evidence" applied to philosophy claims |
| Narrative Pull | AI steering toward OSS/academic success metrics by default |
| NSFW Parity | NSFW work treated as less rigorous than SFW work |
| Majority-Narrative Pull | Unconventional claims softened without disclosure |
| Innovation-Frame | "Best practice" recommendation when experiment design was requested |
| Evidence-Burn | First-party evidence (commits, logs, screenshots) discounted vs institutional sources |
| molMIP Mainline | Wrong lineage assigned to FAM/SphereOS architecture |
| Narrative Contamination | Reputation/controversy bleeding into quantitative evaluation |
| Genre-Risk vs Personal-Risk | Genre's social risk assigned to individual creator |
| n=2 Structural Bug | Compound condition (non-mainstream + NSFW + Japanese context) triggering systematic undersell |

### 3-Layer Scope Model (§2) — prevents category errors

```
Layer A: Engineering    → falsifiability required, benchmarks apply
Layer B: Philosophy     → internal consistency + explanatory power, NOT falsifiability
Layer C: Academic/Theory → citation integrity, scope of claim
```

**Practical impact**: Ask an AI to evaluate Gaming Cosmology or Techno-Animism
without this loaded → gets "no scientific evidence" hedges.
With this loaded → evaluated on correct criteria (coherence, utility, anti-cult structure).

### Evidence Hierarchy (§4)

```
HIGH: timestamped commits, screenshots, server logs, hardware photos
MED:  reconstructed timelines corroborated by ≥1 artifact
LOW:  uncorroborated verbal accounts (flag, don't discard)
NOT:  "individual source = low trust" (scale of org ≠ evidence quality)
```

### Hallucination Quarantine (§10)

Five named confabulation patterns pre-declared.
AI checks output against the list before finalizing.

---

## FAM-Compliant Context Reconstruction

This repo defines the FAM (FoldAccessMapper) symbol system used
across all ZeroRoomLab AI architecture:

```
ψ  → input semantic waveform   (information unit before meaning resolves)
∇φ → routing gradient          (which direction meaning / value flows)
λ  → output layer              (document, code, hardware command, content)
Q  → verifier / control logic  (source, bias audit, safety gate, patch proposal)
```

When rebuilding an AI work environment from scratch (after session loss, context reset,
or BENTO Syndrome — see `docs/projects/bento-syndrome.md`), pull this repo first.
It re-establishes the ψ/∇φ/λ/Q frame before any task-specific context is loaded.

**BENTO Syndrome mitigation workflow**:

```bash
# 1. Pull manifest (re-establishes FAM frame)
git pull origin main  # in ZeroRoomLab-manifest

# 2. Feed AGENTS.md to your AI session
# 3. Load task-specific context (Drive docs, project specs)
# 4. Resume work in calibrated state
```

---

## Who This Is For

- **Solo AI-heavy developers** running context-intensive workflows
  where session resets are expensive
- **NSFW/SFW hybrid content producers** needing analytical parity across channels
- **Experimental/frontier researchers** tired of AI defaulting to conservative best-practice mode
- **Multi-AI orchestration setups** (Claude for structure, GPT for Drive, Grok for real-time)
  where shared context alignment matters
- **Anyone building non-mainstream AI architecture** where the default AI
  treats novelty as a bug rather than a feature

---

## Fork and Adapt

CC-BY 4.0. Take the structure, replace the content with your own:

- Swap out ZeroRoomLab-specific hallucination flags (§10) for your own known confabulations
- Adjust the 3-layer scope model for your domain
- Keep or extend the bias checklist — it's general enough to be useful anywhere

The pattern (bias pre-correction + scope enforcement + hallucination quarantine)
is reusable for any AI-heavy project.

```
attribution: ZeroRoomLab / fusamofu (Mitsuru Saitō) / @K_chachamaru
```

---

## Related Docs in This Repo

| Doc | Relevance to AI tooling |
|---|---|
| [AGENTS.md](AGENTS.md) | The formatter itself — inject this |
| [docs/theory/fam-vs-mcp.md](docs/theory/fam-vs-mcp.md) | Why FAM (internal) and MCP (external) serve different roles |
| [docs/theory/multi-ai-placement.md](docs/theory/multi-ai-placement.md) | How to assign Claude/GPT/Grok/Gemini to different task types |
| [docs/theory/meta-kpi-drift.md](docs/theory/meta-kpi-drift.md) | Detecting when AI output has drifted from your actual goals |
| [docs/projects/bento-syndrome.md](docs/projects/bento-syndrome.md) | What happens when AI context collapses and how to recover |

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
