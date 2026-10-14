[![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![X: @K_chachamaru](https://img.shields.io/badge/X-%40K__chachamaru-black)](https://twitter.com/K_chachamaru)

**Code is Apache-2.0. Narrative, terminology, diagrams, and conceptual flavor are
CC BY 4.0. Use freely, but preserve attribution when carrying the flavor forward.**

**コードはApache-2.0、文章・用語・図解・世界観などのフレーバー層はCC BY 4.0です。
自由に利用できますが、フレーバーを継承して語る場合は出典を明記してください。**

詳細な適用境界は[ライセンス境界研究規約](docs/operations/license-boundary-research-policy.ja.md)、
第三者素材は個別表示を優先します。

# ZeroRoomLab-manifest

ZeroRoomLab is a one-person research studio and fabrication space
running out of an Edo-period farmhouse in Yamagata, Japan.

We build edge AI systems, live-production rigs, open hardware,
and shared registers that help humans and different AI agents work
without flattening engineering, culture, philosophy, and unfinished ideas
into one vendor's default worldview.

A core design lineage is:

**Spiritual Engineering → Infoton Engineering → Context Engineering / FAM / SphereOS Atlantis**

Here, Spiritual Engineering is an engineering philosophy, Infoton Engineering is the research domain,
and Context Engineering and SphereOS are implementation layers. The focus is the information-selection problem
*before* representation, discretization, and tokenization flatten meaning into data. This does not replace Shannon
information theory or claim a new physical particle; it investigates the upstream choices about what becomes
information at all. See [Spiritual Engineering and Infoton Engineering](docs/philosophy/spiritual-and-infoton-engineering.ja.md).

The lab does not run one linear roadmap.
It keeps many plans alive as branches, then mounts whichever branch becomes executable
when donations, shrine offerings, salvage hardware, surviving SDKs, compute, power,
or a verified interface arrive.

```text
many plans
  + changing resources
  -> choose a currently executable branch
  -> build, measure, document
  -> preserve the other branches for their next activation window
```

No fixed priority queue does not mean no plan.
It means the plan is resource-gated rather than capital-assured.
A branch that cannot run today is preserved, not declared failed.

## Infra-FIRE: build survival paths that do not require cash at every hop

**Infra-FIRE (Infrastructure FIRE)** is ZeroRoomLab's proposed field-research extension of Financial Independence, Retire Early. Rather than assuming a liquid job market and enough investments to purchase every survival service indefinitely, it investigates ownership, lawful access, fabrication, operation and repair of essential infrastructure as ways to reduce *mandatory cash dependency*. In a remote rural location, “just work a little more” is not necessarily a low-friction fallback.

Land, drinking-water wells, 3D-printed water-system components, agricultural water access, limited off-grid power and local repair skills are research inputs, not declarations of complete self-sufficiency. Financial cash scarcity itself can be a common-mode tail risk, while physical assets also carry failure, safety, logistics, replacement and maintenance risks.

### Jomon Cultural Sphere 2.0 as community-scale Infra-FIRE

**A useful existing-category label for Jomon Cultural Sphere 2.0 is: _a community-scale implementation of Infrastructure FIRE_.** This is a translation layer, not a claim that FIRE literature already defines Jomon 2.0 or that the two concepts are identical.

Conventional FIRE primarily asks whether financial capital can make compulsory wage labor optional. Infra-FIRE extends the question to whether essential services can remain available without requiring cash at every hop. Jomon 2.0 extends that implementation boundary again from an individual household toward forkable lab / workshop / shrine / hamlet / village nodes and a shared commons.

```text
individual FIRE
  -> household Infra-FIRE
  -> ZeroRoomLab / workshop / shrine node
  -> hamlet / village Infra-FIRE
  -> Jomon Cultural Sphere 2.0 commons
```

In this mapping, **Infra-FIRE is an evaluation lens, not the whole civilization model**. Jomon 2.0 also carries governance, culture, meaning, licensing, provenance, education, production and capital-allocation layers. FAOC describes the fractal/autonomous node topology; OpenFAPTA observes resources that do not fit cleanly into a FIAT ledger; Fold NIC explores network portability; SphereOS/FAM and related work handle meaning/context boundaries; physical microgrids, water and fabrication provide the field layer.

See the [Infra-FIRE hypothesis, field boundaries, metrics and OSH release plan](docs/theory/infra-fire.en.md) and the [FAOC / Infra-FIRE node architecture map](docs/theory/faoc-infra-fire-node.ja.md).

**Proposed GitHub Sponsors milestone: $1,000/month recurring.** Funding at that level would allow budgeting for large-file distribution (Git LFS or alternatives), CAD/STL/3MF archival, reproducibility documentation, material/quality testing and staged release of eligible 3D-printed well/water-system parts as open-source hardware. This is a capacity goal, **not an automatic GitHub LFS unlock, a guaranteed release, or a promise that untested printed components are drinking-water safe**. The existing small Git LFS allowance can be used below that threshold.

> Don't just accumulate money to buy survival. Make survival less hostage to a money-shaped single point of failure.

## Fork the Lab. Deploy a World.

ZeroRoomLab is also exploring the lab itself as a **portable / forkable civilization stack**: not one canonical civilization image, but a set of micro-modules, contracts, Worlds, meanings, cultural layers, and physical systems that can be forked, configured, deployed, repaired, and allowed to diverge.

This extends an existing social and capital design lineage rather than replacing it. The **True NEET Whitepaper** (真ニートホワイトペーパー) describes Jomon Cultural Sphere 2.0 as a foundation-style OSS cultural sphere, a forkable CC BY framework, and autonomous micro-components under the metaphor **"Git management by shrine unit" (祠単位のGit管理)**. The Manifest explores the technical / World-deployment side of the same idea.

Three proving grounds run in parallel: fictional/game Worlds, real-world systems, and rural/village deployment. The village is not merely a rehearsal for space. Making advanced civilization deployable in a low-density terrestrial settlement is a production use in its own right. Heavy snow, isolation, constrained logistics, stronger closed-loop operation, and eventually off-Earth environments expand the portability envelope from there.

> **Fork the Lab. Deploy a World.**
>
> A civilization that cannot carry its meaning is only life support.

See [Program Issue #47: Portable Civilization](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/47).

## Life support is not civilization.

If we cannot deploy advanced civilization into a marginal rural village, surviving in space is not a credible civilization architecture.

Technology alone is not enough. Power, water, food, compute, communications, habitat, and fabrication can keep bodies alive, but a collection of life-support systems is not yet a civilization.

Humans also make art, desire and sexuality, stories, rituals, games, families, communities, arguments, reconciliation, religion, philosophy, and metaphysics. They create systems of order and continually reinterpret what their World means. A civilization stack that leaves those things behind on Earth has transported equipment and organisms, not the full conditions from which human Worlds grow.

The difficult cargo is therefore not only mass. **Human order and thought are themselves shaped by the gravity of the World that produced them.** ZeroRoomLab crosses metaphysics, religion, culture, art, sexuality, games, networks, AI, operating systems, fabrication, energy, and rural infrastructure because portability has to reach across those boundaries too.

This does not require one worldview to win. Science, religion, fiction, metaphysics, high culture, low culture, desire, and engineering are not collapsed into one truth register. Nor are they pre-filtered merely by whether an engineer considers them elegant, useful, respectable, or easy to encode. Their claims, authority, evidence, and scope can remain different while the civilization stack preserves the ability to carry, fork, map, refuse, reinterpret, or replace them.

```text
Physical Stack
  -> power / water / food / habitat / fabrication
Information Stack
  -> compute / network / storage / identity / provenance
Meaning Stack
  -> knowledge / culture / art / desire / religion / philosophy / metaphysics / governance
```

A rural village is therefore not a disposable rehearsal for Mars. It is already a production World. Game Worlds and real-world systems run beside it as parallel proving grounds. Snow, isolation, weak logistics, constrained energy, and later more extreme or off-Earth environments expand the portability envelope without turning the village into a mere prerequisite stage.

> **Do not merely transport humans. Deploy the ability for humans to make a World.**
>
> **A civilization that cannot carry its meaning is only life support.**

Funding follows the same non-enclosure rule. The Whitepaper's Patient Capital / Impact Patron model and this repository's Non-Exclusive Seed Steward policy both separate support from exclusive ownership of the upstream commons. GitHub Sponsors can act as a small practical entry point into that support model without becoming equity, repayment, or control.

This repository is the shared development deck for that process.
It stores project intent, workspace maps, claim layers, cultural and technical registers,
protected boundaries, evidence rules, agent handoff routes, and stopping conditions.
It can be loaded into Codex, Claude Code, Gemini CLI, GitHub Copilot, and future agents
before they enter the wider ZeroRoomLab workspace.

ZeroRoomLab calls the ability to preserve goals and relationships that are not yet reducible
to code **poem power**. Code supplies local implementation force. Poem power keeps that force
pointed toward the original purpose without pretending every future branch already exists.

Pull up a chair. Bring a half-dead machine, a strange theory, a translation gripe, a field failure,
a ritual observation, spare compute, food, cash, or the one test rig gathering dust in your garage.
You do not need an institutional badge, one approved worldview, or a polished success story.
Try a branch, bring back the receipt, fork the deck, or replace the ZeroRoomLab loadout with your own.

Engineers, garage hackers, artists, translators, maintainers, shrine and spiritual practitioners,
psychic practitioners, skeptics, operators, donors, and people who can simply say “this did not work
in my world” are all useful collaborators. First-person faith and spiritual experience may enter as
first-person truth; shared measurement enters as shared measurement. Neither side gets to erase the other.

The default asset culture is an open, non-exclusive gift commons. Attribution and lineage are ways to multiply
respect, like stars on a repository, not tokens that let one party own an author, a god, an idea, or every later fork.
Commercial apps, company-local assets, and closed Worlds are supported as narrow downstream scopes. A demon lord may
lock the gates of one castle; that does not turn the open engine, existing commons, unrelated Worlds, or upstream fork
rights into castle property.

When this README says “OSS pirates,” it means lawful independent salvagers: people who read the source and history,
recover abandoned designs, fork the deck, and bring back failure receipts. It is not an invitation to ignore the
conditions attached to a particular asset, venue, provider contract, or jurisdiction.

Start here:

- [Spiritual Engineering and Infoton Engineering](docs/philosophy/spiritual-and-infoton-engineering.ja.md)
- [Baseload collapse and support boundary](docs/philosophy/baseload-collapse-and-support.md) / [日本語](docs/philosophy/baseload-collapse-and-support.ja.md)
- [Heterogeneous-agent deck governance](docs/operations/heterogeneous-agent-deck-governance.ja.md)
- [Workspace boundary register](docs/operations/workspace-boundary-register.ja.md)
- [Machine-readable workspace registry](docs/operations/workspace-registry.json)
- [Development-environment reconstruction](docs/operations/development-environment-reconstruction.ja.md)
- [Japanese-to-en-US pragmatic translation register](docs/operations/coding-ai-japanese-paraphrase-register.ja.md)
- [Myth, purpose, and cross-engineering audit](docs/operations/myth-purpose-cross-engineering-audit.ja.md)
- [Funding and Non-Exclusive Seed Steward policy](FUNDING.md)
- [Gift commons, lineage, and local World extensions](docs/operations/gift-commons-lineage-and-local-world-extension.ja.md)

---

### Current operational status: power-constrained, still shipping

**2026-10-02 — Development, documentation, and salvage continue under severe power and cash constraints.**

Commercial power is not a dependable baseload for the lab when it cannot always be afforded. Emergency off-grid capacity remains prioritized for survival and communications, so high-load compute and continuous development workloads can still be unavailable. Lower-power design, documentation, GitHub work, salvage, and executable branches continue whenever the available resource envelope permits.

This does **not** mean the infrastructure problem is solved. Commercial-power recovery and continuity, additional batteries, generation and charging capacity, power conditioning, and related infrastructure remain active support needs.

The operating model is therefore not simply `running` or `paused`: branches are mounted according to the power, hardware, network, and funding actually available at that moment.

[GitHub Sponsors](https://github.com/sponsors/saitoomituru)

---

## Funding without enclosure

ZeroRoomLab is seeking **Non-Exclusive Seed Stewards** who can help move long-term economic responsibility away from the founder, small donors, and a thin regional nonprofit funding base without purchasing exclusive control over the upstream commons.

No profit, repayment, equity, delivery, technical success, exclusivity, official authority, or media exposure is promised by the public policy alone. A real contribution may still become part of the project's provenance on GitHub, the Web, X, YouTube, TikTok, livestreams, films, music videos, or project mythology.

> Fund the conditions. Maybe become lore.

Read [FUNDING.md](FUNDING.md), the [Japanese funding index](docs/funding/README.ja.md), and the [en-US steward policy](docs/funding/non-exclusive-seed-steward.en-US.md).

Apache-2.0 forks, closed SDKs, proprietary platforms, and commercial games remain allowed under their applicable licenses. Claiming official lineage, orthodoxy, canonical compatibility, or lineage-compatible MAGI status is different: the complete reproducible basis of that authority must be open under the project's ShareAlike lineage policy.

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

## Support under multi-layer baseload collapse

ZeroRoomLab does not sit on top of a stable household, utility, medical, transport,
or public-finance base. Personal credit capacity, the household wallet, shared infrastructure
in a small aging settlement, water and flood control, forestry, electricity, regional medicine
and rescue, municipal finance, and national fiscal choices can all lose capacity at once.

Because these layers are coupled, support cannot honestly be promised as a linear exchange in
which a fixed amount always becomes one named feature, product, or paper. It may first keep the
weakest layer alive: electricity, food, communications, transport, tools, parts, water systems,
medical or rescue access, experimental equipment, or the time required to publish the record.

That does not make this a vague no-delivery pitch. This is an **advance-scout and first-casualty
repository** for last-mile deployment: it absorbs failures early, keeps receipts, and publishes
what can be made reproducible. The exact output remains resource-gated because the failure surface
is wider than software alone.

Read [Baseload collapse and support boundary](docs/philosophy/baseload-collapse-and-support.md)
and [Funding](FUNDING.md).
