# VS Code Workspace Boundary Register

Status: `[CANONICAL]`\
Established: 2026-07-17\
Applies to: people, coding AI, and AGI orchestrators working with ZeroRoomLab repositories

> Language and authority boundary: this en-US document is an external reconstruction GUI. The
> [Japanese source](workspace-boundary-register.ja.md) remains canonical. Exact local folder names, especially
> secret boundaries, must not be translated, normalized, or scanned.

## 1. Purpose

ZeroRoomLab treats a VS Code workspace as more than an editor display setting. It is a **cognitive and working
boundary** that binds multiple repositories into one operating context.

A repository, workspace, project, execution environment, and implementation dependency are different concepts.
Inferring a workspace from the current directory or neighboring repositories can cross abstract-engine, bare-metal,
or company-asset boundaries. This register prevents those accidental connections while keeping the public OSS
development environment reconstructable.

## 2. Units and responsibilities

| Unit | Responsibility |
|---|---|
| repository | Git history, code, documents, license, mutation authority |
| VS Code workspace | working, cognitive, and reference set spanning repositories |
| project | objective and progress-management unit; may span workspaces |
| execution environment | OS, host, SDK, Python, physical devices, environment variables, credentials |
| implementation dependency | import, link, build, communication, or data-exchange dependency |
| Manifest | shared foundation for AI cognition, terminology, claim boundaries, and reconstruction |

Membership in one workspace does not create mutual implementation dependency. Separation into different workspaces
does not erase historical or philosophical relations. Workspace separation is a loose-coupling boundary that prevents
implicit dependency.

## 3. Handling `.code-workspace`

A `.code-workspace` file is a JSON or JSONC configuration. It may contain `folders`, settings, tasks, launch data,
extension recommendations, and environment-variable references. It is not itself an execution environment.

Use the `folders` array of the actual descriptor as primary evidence for scope. The machine-readable Manifest Registry
indexes names and meanings; it does not replace machine-local absolute paths or the current folder list.

## 4. Required AI/AGI resolution procedure

1. Preserve the workspace name, filename, spelling, and case given by the user.
2. Resolve only registered names and explicit aliases through [workspace-registry.json](workspace-registry.json).
3. Read the corresponding `.code-workspace`; establish the target set from `folders`.
4. Load Manifest AGENTS.md and operating registers as shared context.
5. Read each member repository's AGENTS.md and apply the nearest constraints.
6. Do not expand scope from `cwd`, neighboring folders, README links, or conceptual lineage.
7. Do not autocorrect a registered name into a repository name.
8. If resolution fails, return `⊥` and ask rather than guessing.

Before scanning or mutation, state:

```text
Workspace: <registered name>
Descriptor: <the .code-workspace that was read>
Members: <reference set resolved from folders>
Excluded: <unregistered, separate-boundary, and private domains>
Environment: <verified execution environment, or unknown>
```

## 5. Meaning of current workspaces

### Deb800

The x800 bare-metal/field implementation layer: recording, physical effects, streaming, editing, and physical
measurement. Do not make SphereOS, FAM, or another abstract meta-engine an implicit dependency.

### スフィア

The abstract meta-engine layer containing SphereOS, FAM, AQC, IBD, Quantaril Cloud, and related work. It may share
lineage and interfaces with x800, but not the same working boundary.

The operational workspace includes a folder whose exact name is `スフィア独鈷書`. It is not a general design Note.
It is a secret Edwards-family cryptographic key-chain bundle used for SphereOS World-boundary recognition.

Never scan, summarize, display, log, commit, upload, distribute, or reconstruct its contents.

If the key-chain specification becomes stable, third-party SDK users may receive a separate generator for creating
their own World-boundary keys. The existing secret bundle is never a template or distribution artifact.

### NeeT_kitchen_ALCHEMIST

Human-side life-logistics research where low-resource residents use household equipment, public knowledge, and
feedback from human hands, eyes, nose, and mouth to produce edible outcomes and reusable knowledge. The first
implementation is `OpenSourcePITETO`, a household potato-chip experiment.

It belongs neither to the Sphere abstract meta-engine layer nor the Deb800 production and instrumentation layer.
It may reuse ideas and experiment methods without making SphereOS, FAM, or x800 hardware runtime dependencies.
Human bodies and household equipment remain first-class even without AI, expensive instruments, employment,
or a business model.

See [Human-Side Life Logistics Research](../projects/neet-kitchen-alchemist.ja.md).

### Company construction-DX validation workspace

A construction-DX, CCUS, and multi-agent validation environment exists with Teratoku Co., Ltd. The Manifest may
record the company overview, publicly releasable work, and abstract OSS results. The internal workspace contains
company assets.

Labor records, labor-law materials, medical information, company Gemini instructions, Drive documents, credentials,
and internal folder structure are not public reconstruction inputs. Treat only the existence and approved public
summary until knowledge is generalized and separated into abstract OSS.

## 6. Rules for crossing a boundary

- Re-resolve scope before reading or mutating a repository in another workspace.
- A Manifest link is a reference path, not an automatic implementation dependency or permission grant.
- Register license, secrets, credentials, data owner, and publication range for third-party workspaces.
- A local cryptographic key bundle is not “unreconstructable material”; it is material that must not be reconstructed
  or copied.
- Separate knowledge from company and personal assets before publishing it as OSS; verify source, rights, and
  reproduction conditions.
- Use only human-registered workspace aliases.

## 7. Related documents

- [workspace-registry.json](workspace-registry.json) — machine-readable names, composition, and public boundary
- [Public Development Environment Reconstruction](development-environment-reconstruction.md)
- [Manifest Operating Model](manifest-operating-model.ja.md)
- [Technical Communication Register](technical-communication-register.md)
