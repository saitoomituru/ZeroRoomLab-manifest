# Japanese-to-en-US Paraphrase Register for Coding Agents

Status: `[CANONICAL]`\
Established: 2026-07-15\
Updated: 2026-07-17\
Default English locale: `en-US`\
Applies to: coding agents editing READMEs, AGENTS.md, technical docs, experiment Notes, commits, Issues, PRs,
and code comments

## 1. Purpose

This register is not a table for swapping Japanese words with English words. It extracts speech intent,
the relationship to the reader, expected responsibility, and the strength of an observed fact, then rebuilds
those functions as American technical communication.

Do not weaken the Japanese source with English-language over-caveating. Do not expand Japanese implicit context
into a universal claim either.

## 2. Locale policy

- English artifacts are `en-US` unless the request says otherwise.
- We do not normally maintain en-GB READMEs, translation files, or parallel locale artifacts.
- British English may be used to explain pragmatic differences, but is not the default output target.
- In these repositories, “English version” means `en-US`.
- An explicit file-local locale rule takes priority.

American and British English are mutually intelligible, but their social force and natural expressions of
responsibility are not identical. A coding agent must not flatten them into one abstract `English`.

## 3. Pragmatic mappings

These are not dictionary translations. They are examples that preserve responsibility inside this project.

| Japanese register | Japanese phrase | What dies in a literal translation | Responsibility carried in en-US |
|---|---|---|---|
| geek | 大人のOSSパイレーツ | `adult pirates` foregrounds adult content and crime | inspect the hardware, commits, logs, test conditions, and claim boundaries before extending a result |
| formal work language / Kyoto-style indirection | 腕相応の経験を持つ技術者 | shifts into a personality or credential rank | verify the evidence and stay within the documented scope |
| technical experiment | 手元では再現した | `it worked for me` loses conditions and fact strength | reproduced on the documented hardware and test conditions |
| boundary | それ以上は実機を見に来てくれ | may sound like a dare or demand to visit | conclusions beyond this record require inspection of the hardware and original logs |
| AGI project management | 一見ポエムだが、デッキ崩壊を防ぐプロマネ術 | `poetry` alone becomes decorative prose | a narrative specification and project operating context for preventing workspace-deck collapse in heterogeneous agent development |
| management capability | コード力よりポエム力が大事 | sounds anti-code or like a demand for literary talent | project leadership requires encoding intent, responsibility, boundaries, exceptions, and stopping conditions before coordinating implementation throughput |
| dragon-riding metaphor | ベンダー代理戦争を止める操竜型マルチ召喚 | collapses into fantasy branding | vendor-neutral governance for coordinating heterogeneous coding agents without letting vendor-specific defaults overwrite the workspace contract |

Replacing Japanese `大人` directly with `adult` can foreground age restrictions or adult content.
Translating `パイレーツ` as `pirates` can foreground copyright infringement or crime.
`gentleman` may help in a comparative explanation, but in a public American README it can be overread as a
gender, class, or character qualification.

Japanese `ポエム` may simultaneously carry self-mockery, provocation, design philosophy, and higher-level
context that has not yet been reduced to code. A bare `poetry`, `poetic documentation`, or `manifesto` can make
that work look ornamental and erase its project-management function.

Use functional terms when needed:

- `narrative specification`: a higher-level specification carrying purpose, relationships, exceptions, and prohibitions;
- `intent architecture`: objective and responsibility structure before implementation;
- `project operating context`: field context that lets humans and AGI continue making decisions;
- `workspace contract`: scope, authority, and canonical-source boundaries above a vendor default;
- `agent governance`: control of changes, handoffs, and stops across heterogeneous agents.

If the Japanese deliberately uses the barb of `ポエム力`, do not erase the metaphor. Keep a hook such as
`It may look like poetry`, then immediately unfold the operational function with `but it functions as...`.

Map descriptions of a person's class or character into observable actions when possible: inspect evidence,
read test conditions, stay inside claim boundaries, and share purpose and stopping conditions. Losing some
surface mood does not authorize withdrawing the source's responsibility.

## 4. Coding-agent paraphrase procedure

Before translating Japanese:

1. Identify the medium. A README cover, deep technical document, commit, Issue, and code comment need different registers.
2. Separate factual content from the social act performed by the sentence.
3. Extract what the reader is expected to do: show respect, exercise restraint, self-verify, inspect evidence,
   or stay within a responsibility boundary.
4. Freeze fact strength. Do not turn observed “worked” into unsupported `might work`.
5. Expand implicit scope into named hardware, commit, runtime, workload, log, or test conditions.
6. Replace apparent personality judgments with verifiable behavior where possible.
7. Extract the design function of metaphors. Before deleting poetry, dragons, decks, or summoning, recover the
   objective, governance, scope, handoff, and stop condition they carry.
8. Check whether literal wording foregrounds an unintended category such as age, gender, class, crime, or adult content.
9. Check that the English is neither a broader universal claim nor a defense wall that hides the source conclusion.

The goal is not to make the text safe and bland. The goal is to reproduce its effect in a different language environment.

### 4.1 Targets that stop ordinary paraphrase

A coding agent must not process the following as an ordinary en-US paraphrase:

- executable Prompts, PLI surfaces, or Proton.md sources;
- SemanticKernel sources that constrain identity, OAE, World, time, causality, authority, or stopping;
- Notes that agents read as architecture authority even without an explicit execution grant;
- sources that connect theological or spiritual Meaning to an execution Registry.

Report the target as `[JAPANESE-KERNEL-SOURCE]` and route it to the
[linguistic architecture port contract](default-language-and-translation-policy.md#42-linguistic-architecture-ports).
Do not translate a meaning or causality Kernel merely to increase the English pair count.

## 5. Baseline README boundary examples

Japanese may preserve a project-specific relationship:

> README冒頭は一般公開向けの表紙です。以降の技術ノートは、大人のOSSパイレーツ向けです。

A project-management overview may say:

> このリポジトリは一見ポエムですが、プロンプトエンジニアリング時代に必要な、
> ワークスペースデッキ崩壊を防ぐプロジェクト管理術の試験リポジトリでもあります。

The en-US version keeps the metaphor and unfolds the function:

> This repository may look like a collection of manifestos and project poetry. It is also an experimental
> project-management reference for the prompt-engineering era: a vendor-neutral operating context designed
> to keep heterogeneous coding agents from collapsing a shared workspace into conflicting scopes,
> authorities, and rewrites.

A technical-note boundary states the same responsibility as behavior:

> The README opens with the public-facing view. The technical notes below assume readers will inspect the
> hardware, commits, logs, test conditions, and claim boundaries before extending any result.

These are not word-for-word translations. This project treats them as operationally equivalent.

## 6. References from repository AGENTS.md

ZeroRoomLab repository AGENTS.md files carry a short required link to this register. Do not duplicate the full
policy into every repository.

Recommended instruction:

```markdown
## ZeroRoomLab language register (required)

Before editing a README, technical document, translation, or public claim, read the
[Japanese-to-en-US Paraphrase Register for Coding Agents](https://github.com/saitoomituru/ZeroRoomLab-manifest/blob/main/docs/operations/coding-ai-japanese-paraphrase-register.md)
and load its background vector. Unless another locale is requested, English output is en-US.
Do not translate words in isolation; map intent, reader responsibility, and fact strength into wording that
does the same work in American English.
```

When ZeroRoomLab-manifest exists locally beside the target, prefer the local canonical source; otherwise use
the public URL. Repository-local AGENTS.md may add project-specific technical constraints but may not quietly
weaken this register.

“Load the background vector” means reading this register together with the
[Technical Communication Register](technical-communication-register.ja.md),
[Heterogeneous-Agent Deck Governance](heterogeneous-agent-deck-governance.ja.md), the Manifest AGENTS.md,
and target-repository rules. Do not copy one sample sentence and pretend the claim layer, medium, evidence range,
reader responsibility, and workspace contract came with it.

## 7. Prohibited behavior

- replacing a Japanese metaphor word-for-word without reading its context;
- keeping `adult`, `pirate`, or `gentleman` merely because a surface word appeared in Japanese;
- reducing `ポエム` to `poetry` and deleting its PM functions: purpose, responsibility, exception, boundary, and stop;
- deleting dragons, decks, or summoning and taking the heterogeneous-agent governance problem with them;
- weakening an observed fact into possibility language for the sake of Americanization;
- piling on legal-defense caveats until the source conclusion disappears;
- importing en-US wording backward and sanding relationships or emotion out of the Japanese canonical source;
- adding en-GB or additional locale files without a request;
- copying the entire Manifest canonical source into every repository and creating update drift.
- processing a Japanese Kernel Source as ordinary documentation translation;
- claiming equivalent Kernel behavior without bilingual, architecture, and theological or practitioner review.

## 8. Related documents

- [Heterogeneous-Agent Deck Governance and Dragon-Rider Multi-Summoning Project Management](heterogeneous-agent-deck-governance.ja.md)
- [Technical Communication Register](technical-communication-register.ja.md)
- [Manifest Operating Model](manifest-operating-model.ja.md)
- [Documentation Maintenance Policy](documentation-maintenance-policy.ja.md)
- [ZeroRoomLab AI Agent Operating Guidelines](../../AGENTS.md)

Japanese canonical source:
[コーディングAI向け日本語意訳レジスタ](coding-ai-japanese-paraphrase-register.ja.md)
