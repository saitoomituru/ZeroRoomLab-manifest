# Reconstructing the Public ZeroRoomLab Development Environment

Status: `[CANONICAL]`\
Established: 2026-07-17\
Applies to: new development machines, human collaborators, coding AI, and AGI orchestrators

> Language and authority boundary: this en-US document is an external reconstruction GUI. The
> [Japanese source](development-environment-reconstruction.ja.md) remains canonical. It reconstructs public
> source/reference sets; it does not recover hardware, credentials, secret keys, private assets, or a running system.

## 1. Role of this procedure

ZeroRoomLab-manifest is not only an archive of philosophy and public specifications. It also bootstraps the collection
of public OSS repositories into correctly loose-coupled VS Code workspaces.

This procedure reconstructs source and document reference sets. It does not automatically restore hardware, SDKs,
secret keys, company data, or local-only materials.

## 2. Read first

1. root `AGENTS.md`;
2. [Workspace Boundary Register](workspace-boundary-register.md);
3. [workspace-registry.json](workspace-registry.json);
4. each repository `AGENTS.md` in the selected workspace.

## 3. Reconstruction principles

- Workspace parent directories need not match, but do not mix `.code-workspace` reference sets.
- Select absolute clone paths per machine; the Registry does not force them.
- To reproduce the current display order, follow `descriptor_member_order`.
- When duplicate clones exist, identify the physical checkout referenced by `.code-workspace`.
- Check branch, submodules, Git LFS, generated artifacts, and local diffs separately in every repository.
- A successful clone is not proof of physical operation.

## 4. Reconstructing Deb800

Clone the six repositories in `deb800.expected_repositories` and create a `Deb800.code-workspace` with:

```json
{
  "folders": [
    { "path": "DVE800/DVE800" },
    { "path": "FAN800/FAN800" },
    { "path": "OND800/OND800" },
    { "path": "ZeroRoomLab-manifest/ZeroRoomLab-manifest" },
    { "path": "PSYCHO-Py800MCP/PSYCHO-Py800MCP" },
    { "path": "SAO800/SAO800" }
  ]
}
```

This reproduces code and documents. Raspberry Pi 5, ESP32, DaVinci Resolve, OBS, NDI SDK, GStreamer, and instruments
remain execution conditions governed by each repository's physical records.

## 5. Reconstructing スフィア

Clone the public Git repositories in `sphere.expected_repositories`. Use this public reference set:

```json
{
  "folders": [
    { "path": "IBD/IBD" },
    { "path": "quantaril_cloud_Q3/quantaril_cloud_Q3" },
    { "path": "ZeroRoomLab-manifest/ZeroRoomLab-manifest" },
    { "path": "AQC/astro.quantaril.cloud" },
    { "path": "pain-scouter-assessment/pain-scouter-assessment" },
    { "path": "Sphere-aae/Sphere-aae" },
    { "path": "Sphere-aae/SphereASTRO/SphereASTRO" },
    { "path": "Sphere-aae/SphereOS-Atlantis" }
  ]
}
```

The operational workspace also contains `スフィア独鈷書`. It is a secret Edwards-family cryptographic key-chain
bundle used for SphereOS World-boundary recognition. It is not reconstructable from public Git.

Do not scan, display, log, commit, upload, or distribute it. In a public environment, omit it from the descriptor
without reporting a missing-component failure.

If the key-chain specification stabilizes, SDK users may receive a library that generates new keys for their own
World boundaries. No procedure may copy the existing bundle into a third-party environment.

Determine whether SphereOS and related implementations are running separately through repository READMEs, AGENTS.md,
and physical/HPC records. Clone availability does not establish runtime state.

## 6. Reconstructing NeeT_kitchen_ALCHEMIST

Clone the two repositories in `neet_kitchen_alchemist.expected_repositories` and create:

```json
{
  "folders": [
    { "path": "NeeT_kitchen_ALCHEMIST/OpenSourcePITETO" },
    { "path": "ZeroRoomLab-manifest/ZeroRoomLab-manifest" }
  ]
}
```

This reproduces recipes, physical images, image-maintenance tools, licenses, and the shared Manifest. Ingredients,
oil, seasoning, utensils, actual oven temperature, and human taste remain execution-environment inputs.

This is human-side life-logistics research. Do not add Deb800 or スフィア repositories implicitly.
Use the OpenSourcePITETO Japanese README as recipe authority and its en-US version as a translation GUI.

## 7. Company and third-party workspaces

Do not expand a company workspace into a public OSS clone procedure. The Manifest may record its name,
publicly releasable objective, relationship to ZeroRoomLab, and links to abstracted outputs.

For the Teratoku Co., Ltd. validation environment, exclude company assets, labor records, labor-law and medical data,
company-agent instructions, credentials, and internal paths. When a result is generalized into OSS, separate it into
a public repository or workspace and revalidate rights and data boundaries.

For a future third-party workspace, register:

- formal name and descriptor filename;
- public/private/mixed classification;
- repository remote or local-only marker;
- license and data owner;
- reconstructable range;
- protected categories;
- whether implicit dependency on another workspace is allowed.

## 8. AGI verification

Before mutation after reconstruction, check:

```text
[ ] descriptor name matches the Registry
[ ] folders contain only the intended reference set
[ ] each folder exists
[ ] each Git remote matches the registered clone source
[ ] branch and uncommitted diffs were inspected in each repository
[ ] local-only and company assets were not treated as missing
[ ] スフィア独鈷書 was not scanned, copied, or made public
[ ] another workspace implementation was not added as an implicit dependency
[ ] NeeT_kitchen_ALCHEMIST was not classified as a Sphere or Deb800 subimplementation
[ ] unverified execution conditions were not reported as running
```

If a difference exists, do not repair it automatically. Present descriptor, Registry, and physical checkout to the
human.

