---
title: "仲山進也『縄文2.0』公開レビュー：Social / Order OSとしての責務境界とZeroRoomLab FAOCとの相互運用仮説"
language: ja-JP
canonical_language: ja-JP
status: "DRAFT / PUBLIC REVIEW / PREPRINT"
claim_layer: "public-source review; engineering architecture comparison; not institutional peer review"
author: "齋藤みつる / ZeroRoomLab"
review_scope: "social topology, responsibility boundaries, portability, interoperability"
issue: "https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/57"
license: "CC BY 4.0"
---

# 仲山進也『縄文2.0』公開レビュー

## Social / Order OSとしての責務境界とZeroRoomLab FAOCとの相互運用仮説

> **Status: DRAFT / PUBLIC REVIEW / PREPRINT**
>
> 本稿は、仲山進也氏が公開の講演・対談等で提示している「縄文2.0」を、ZeroRoomLabの情報子工学、Dynamic Graph、FAOC / Infra-FIRE、OpenFAPTA、Fold系設計から読んだ公開レビュー草稿である。
>
> ZeroRoomLabは大学・学会ではなくOSS寺子屋であり、本稿は学術誌・大学・学会による制度的査読を意味しない。一方、公開されたモデルを読み、主張、適用範囲、責務境界、反証可能性を記名で検討する行為そのものを制度的資格へ従属させない。本レビュー自体もIssue / PR / forkによる再レビュー対象である。

---

## Abstract

仲山進也氏の「縄文2.0」は、分業・計画・ヒエラルキーを中心とする「弥生OS」と対比し、個々の強みを持ち寄るフラットな関係、リンク、シェア、自律的な共創を重視する社会・組織モデルとして公開されている。本レビューは、このモデルを歴史学上の縄文・弥生社会の実証モデルとしてではなく、現代の組織・共同体を説明する設計メタファーとして読む。

ZeroRoomLabの既存アーキテクチャと比較すると、仲山モデルはFAOC / Infra-FIREと競合する文明runtimeではなく、中央社会・都市・企業等に配置可能な **Social / Order OS** として解釈すると責務境界が明瞭になる。一方、ZeroRoomLabのFAOCはresource、authority、identity、failureをnodeへ局所化し、物理・情報・文化・資本の依存を交換・縮退・fork・再接続可能にするPortable Civilization側の研究である。

暫定レビュー結果は `SUPPORTED_WITH_SCOPE_REFINEMENT` とする。仲山モデルのSocial topology上の主張は有用であり、ZeroRoomLab側から現時点で棄却する根拠はない。ただし、Social / Authorityの分散と、Liability / Credit / Capital / Energy / Water / Compute等の分散は同一変数ではない。したがって「縄文 / 弥生」を文明全体の単一enumとして扱うのではなく、責務ごとに異なるtopologyを取り得るvectorとして再記述すると、モデルを壊さず工学的な相互運用へ拡張できる可能性がある。

本稿はさらに、仲山型をZeroRoomLab既存語彙における「天津神側 / Central Worldの次世代秩序Host」の候補、FAOC / Infra-FIREを「国津神側 / Local / Frontier node」のPortable Runtime候補として配置し、その間のresource evaluation / merchant責務をOpenFAPTA等へ分離する仮説を提示する。この神道語彙はNormative Worldを区別する設計メタファーであり、神格の物理的実在を科学的に証明する主張ではない。

---

## 1. Review Question

本稿が問うのは「仲山縄文2.0は正しいか」という一枚岩の問いではない。

主要な問いは次である。

> **仲山「縄文2.0」は何の責務を扱うモデルなのか。**
>
> **その責務をZeroRoomLabのDynamic Graph / FAOCへ接続した場合、どこまで互換で、どこから別責務になるのか。**

この問いを分解すると以下になる。

1. 仲山モデルの中心はSocial topologyなのか、文明runtime全体なのか。
2. Flat / Share / autonomous collaborationはAuthority、Liability、Credit、Capital等まで同時に分散させるのか。
3. 仲山モデルに含まれない責務が存在する場合、それは欠陥なのか、それともHost OSとして正しくscopeされている結果なのか。
4. 仲山型Host上でFAOC nodeを実行し、必要に応じてdetach / migrate / reconnectできるか。
5. Central WorldとLocal / Frontier node間の資源評価・交換を、別のMerchant Frameworkへ分離できるか。

---

## 2. Source Boundary

### 2.1 現時点で確認した公開資料

本Draftでは最低限、以下の公開資料を参照した。

1. 日本の人事部「HRカンファレンス」2023年講演レポート  
   「個人の強みを生かしていく『縄文2.0』へ」  
   https://jinjibu.jp/hr-conference/report/r202305/report.php?sid=3133

2. Linking Society / 日立系公開対談、2025-07-31  
   仲山進也 × 矢野和男「『縄文2.0』と幸せなチーム作り」  
   https://linkingsociety.hitachi.co.jp/_ct/17777626

3. 国際社会経済研究所（IISE）公開記事  
   「『縄文文化』に学ぶ共創のヒント。ソートリーダーシップは関係性づくりから始まる」  
   https://note.com/nec_iise/n/n9f05a121d0eb

### 2.2 Source limitation

本Draftの検索で確認できた範囲では、少なくとも2023年の公開講演記録に「縄文2.0」の語と主要説明が存在する。これを仲山氏による最初の使用時点とは断定しない。より古い本人資料、スライド、講演録、書籍、SNS等が存在する可能性を保持する。

また、本稿は仲山氏の思想全体をレビューするものではない。上記公開資料から確認可能な「縄文2.0 / 縄文OS / 弥生OS」周辺の主張のみを対象とする。

---

## 3. 仲山モデルから抽出できるCore

公開資料から、少なくとも次の構造を読み取れる。

### 3.1 弥生OS

仲山氏は、稲作型の生産をメタファーとして、計画、分業、役割固定、指示、ヒエラルキー、効率化を一つの組織OSとして説明する。

ここで重要なのは、歴史学上「弥生時代に本当にこの一種類の組織しか存在しなかった」と証明することではない。現代組織の特徴を説明するための抽象モデルとして `Yayoi OS` を使用していると読む。

### 3.2 縄文2.0

対照側では、長老とボスを区別し、個々の強みを持ち寄ること、成果をシェアすること、共同体間を競争だけでなく交換・共創関係として捉えることが強調される。

2025年の公開対談では、縄文2.0を単純な弥生OSの破壊ではなく、インターネット等の技術によって発展し、弥生OSを包摂する方向として説明している。また、糸井重里氏の「リンク・フラット・シェア」を参照している。

したがって本レビューでは、仲山モデルを

```text
Social / Organization topology
  ├─ Link
  ├─ Flat
  ├─ Share
  ├─ strengths-based contribution
  ├─ autonomous collaboration
  └─ contextual inclusion of hierarchical structures
```

として暫定的に抽出する。

これは `DAO` という語を仲山氏自身が用いているという意味ではない。本稿では、中央の単一bossによる命令木よりも、参加者間の関係グラフを中心に記述するという工学的類似を示すため、必要な箇所で **DAO-like social graph** と呼ぶ。

---

## 4. Review Result: Social / Order OSとして支持する

### 判定

`SUPPORTED_WITH_SCOPE_REFINEMENT`

仲山モデルは、現代組織における過剰な分業・固定的ヒエラルキーへの対案として、Social / Organization topologyを説明する上位モデルとして有用である。

ZeroRoomLab側から見た主要な補正は「間違っている」ではなく、**OSという語が複数の責務を一つに見せやすい**点にある。

例えば、ある共同体は次の状態を同時に持ち得る。

```text
Social      = distributed / flat
Authority   = partially distributed
Governance  = distributed
Liability   = centralized
Credit      = centralized
Capital     = centralized
Energy      = centralized
Compute     = mixed
Knowledge   = distributed
```

この共同体を単一の `Jomon` または `Yayoi` enumへ押し込むと、Social topologyでは縄文的でも、信用・法的責任・物理インフラでは中央依存しているという情報が消える。

したがってZeroRoomLab側では、縄文 / 弥生を文明全体の単一状態ではなく、**責務別topology vectorを説明するprofile**として再利用する方が工学的に扱いやすい。

---

## 5. Responsibility Audit

現時点の公開資料に対する暫定表である。`UNKNOWN / OUT OF REVIEWED SCOPE` は欠陥判定ではない。

| Responsibility | 仲山公開モデルから確認できる範囲 | ZeroRoomLab review |
|---|---|---|
| Social topology | 中核 | SUPPORTED |
| Collaboration | 中核 | SUPPORTED |
| Strength-based role formation | 中核 | SUPPORTED |
| Sharing / exchange | 中核 | SUPPORTED |
| Hierarchy | 批判対象だが包摂可能 | SUPPORTED WITH NUANCE |
| Authority | 間接的 | NEEDS DECOMPOSITION |
| Governance | 間接的 | NEEDS DECOMPOSITION |
| Identity | value-based communityとして示唆 | PARTIAL |
| Exit / fork | 本Draft資料では明示契約未確認 | UNKNOWN |
| Federation | 他共同体との交換として示唆 | PARTIAL |
| Liability | 明示契約未確認 | OUT OF REVIEWED SCOPE |
| Credit | 明示契約未確認 | OUT OF REVIEWED SCOPE |
| Capital ownership | 明示契約未確認 | OUT OF REVIEWED SCOPE |
| Ledger / settlement | 明示契約未確認 | OUT OF REVIEWED SCOPE |
| Compute | 技術環境は背景だがruntime責務未確認 | OUT OF REVIEWED SCOPE |
| Energy | 未確認 | OUT OF REVIEWED SCOPE |
| Water | 未確認 | OUT OF REVIEWED SCOPE |
| Fabrication | 未確認 | OUT OF REVIEWED SCOPE |
| Physical infrastructure | 未確認 | OUT OF REVIEWED SCOPE |
| Failure containment | 明示契約未確認 | UNKNOWN |
| Migration / portability | 価値観ベースの接続は示唆、runtime契約未確認 | UNKNOWN |

ここから本レビューの中心的な補助仮説が得られる。

> **Social decentralization != Responsibility decentralization**

これは仲山モデルへの反論ではなく、Social / Order OSから文明runtimeへ射程を広げる際に必要になる追加変数である。

---

## 6. ZeroRoomLab FAOCとの違い

ZeroRoomLabの `FAOC / Infra-FIRE node architecture` は、中央DAOを一つ作るモデルとして定義されていない。

既存正本では、各nodeについてresource、authority、identity、failureを局所化し、portable manifest / interfaceを持たせ、別の土地・文化・実装へfork可能にする。また、一nodeの停止を文明圏全体の停止へ直結させないことを要求する。

さらに物理面ではmicrogrid、水、通信、compute、fabrication等をnode内serviceとして扱う。

したがって、仲山型とFAOCの差は

```text
仲山型:
    relationships among participants
    → Social / Order topology

FAOC:
    relationships among autonomous responsibility/resource nodes
    → Portable Civilization topology
```

と置くと理解しやすい。

FAOC側はさらにDynamic Graphとして、edgeの変更だけでなく、node、関係、Observer、局所評価関数、意味軸、Fold境界、参照World自体が増減・再解釈され得る設計を持つ。

したがって本稿では、仲山型を「topologyがない」とは判定しない。人間関係・共同体関係のgraphは明確に存在する。一方、本Draftで確認した公開資料には、**責務境界そのものを動的にFold / split / migrateする形式的操作契約までは確認できていない**。これはSocial / Order OSとしての落ち度を意味しない。

---

## 7. 天津神Host / 国津神Runtime仮説

ZeroRoomLab既存のFold研究では、同一国家内であっても国津神 / 天津神、宗派、政治思想、地域共同体、企業文化等でNormative Worldが異なり得るとし、複数membershipを許容している。

この語彙を都市・文明設計へ投影すると、次の配置を仮説として置ける。

```text
天津神 / Central World
国家・都市・企業・大規模制度圏
        │
        ▼
仲山 縄文2.0
Social / Order OS
        │
Host / World contract
        │
══════════════════════════════
Interoperability / Merchant Plane
FAM / OpenFAPTA / Fold-NIC 等
══════════════════════════════
        │
FAOC / Infra-FIRE
Portable Civilization Runtime
        │
        ▼
国津神 / Local / Frontier
祠・家・工房・研究所・集落等
```

この配置では、仲山縄文2.0とInfra-FIRE縄文2.0は競合しない。

仲山型は、既存の中央文明・都市・企業・ネットワーク社会を、より自律的・共創的に運用するOrder OS候補となる。

FAOC / Infra-FIRE側は、そのHostを利用できるときは利用し、Hostの停止・不在・不適合時には局所serviceへ縮退し、必要に応じて別Hostへ接続するPortable Runtimeを研究する。

この仮説が成立するなら、中央秩序を破壊しなければLocal autonomyを作れないという二者択一を回避できる。

---

## 8. OpenFAPTAの位置

Central HostとLocal nodeを接続すると、Social topologyとは別に資源評価問題が発生する。

例えばLocal nodeには、土地、井戸、修繕技能、余剰電力、設備、OSS、知識、探索可能な未知資源等が存在し得る。しかし既存の会計・市場価格に現れていない資源は、中央側からゼロとして扱われる可能性がある。

ZeroRoomLabのOpenFAPTAは、現行設計上、決済・通貨・帳簿そのものではない。利用者がFold topology、面積測度、評価単位、探索・配分policyを構成し、回収可能性と未知コモンズの探索余地を扱うMerchant Engineである。交換単位、通貨、残高、決済、帳簿は外部実装へ委ねる。

したがって本レビューでは、OpenFAPTAを

> **天津神Hostと国津神FAOCの間に置かれるMerchant / Resource Evaluation Framework候補**

として位置づける。

Docker比喩を使う場合、OpenFAPTA単体をDocker Machine全体と同一視しない。FAM / SphereOS、Fold-NIC、FAOC、外部決済rail等と責務分担した文明側Machine / interoperability planeの一部として扱う。

---

## 9. Compatibility Hypothesis

現段階の最も重要な仮説は次である。

> **仲山型Social / Order OSをHostとして採用しても、FAOCのPortable Civilization設計とは矛盾しない。**

必要なのは思想的一致ではなく、interfaceである。

最低限、将来のHost Contract候補として次を検討できる。

```text
identity()
authority()
resource_access()
exchange()
liability_boundary()
governance()
exit()
dispute()
attach()
detach()
```

仲山型がこれら全てを提供する必要はない。提供しない責務は別module / institution / adapterへ委譲できる。

この意味で「仲山モデルの責務が粗い」という表現は、直ちに批判を意味しない。**Host OSとして不要な責務を背負っていない可能性**があるためである。

逆にZeroRoomLab側も、Host社会の人間関係・幸福・チーム形成をFAOC Coreへ焼き込む必要はない。仲山型のようなSocial OSを選択可能moduleとして接続できる方が、World中立性を維持できる。

---

## 10. Falsification / Revision Conditions

本Draftの主張は以下によって修正され得る。

1. 仲山氏の一次資料に、Liability / Credit / Capital / Physical Infrastructure等まで含む責務別Dynamic Topologyが既に明示されていた場合、本稿のscope差分を修正する。
2. 仲山モデルに明示的なnode migration / fork / detach / failure containment契約が存在する場合、FAOCとの差分を縮小する。
3. FAOCがHost変更時にidentity、authority、resource access等を実際には可搬化できない場合、ZeroRoomLab側のPortable claimを縮小する。
4. OpenFAPTAがMerchant境界を越え、決済・帳簿・法的信用そのものを不可避に背負うことが判明した場合、責務境界を再設計する。
5. Dynamic Graph間mappingに必要な不変量を定義できない場合、数学的topologyという強い表現を縮小し、engineering graph transformationとして記述する。

---

## 11. Review Conclusion

本Draftの結論は、仲山「縄文2.0」を棄却するものではない。

むしろ、ZeroRoomLabの責務分解を適用すると次のように保存できる。

```text
仲山 縄文2.0
    = Social / Order OS candidate

OpenFAPTA + FAM + Fold-NIC etc.
    = Merchant / Interoperability plane candidates

FAOC / Infra-FIRE
    = Portable Civilization Runtime / Node Architecture
```

この分解により、仲山型を天津神側Central Worldへデプロイし、その上でFAOC nodeをorchestrateする仮説が成立する。一方、中央Hostが存在しない、停止する、またはLocal nodeと適合しない場合には、国津神側nodeが縮退運転・detach・別Hostへの再接続を選べる設計を検討できる。

したがって暫定判定は以下とする。

> **SUPPORTED_WITH_SCOPE_REFINEMENT**
>
> 仲山「縄文2.0」はSocial / Order OSとして支持可能であり、FAOC / Infra-FIREとは競合しない。責務分解によって適用範囲を狭くすることはモデルを弱くするのではなく、むしろPortable Civilization側とのcompositionを可能にする。

この結論を次段のUrban Engineering Pre-Reviewへ入力し、都市を単一OSではなく、複数の責務topologyが動的に接続・分離・移送されるsystemとして記述できるかを検証する。

---

## 12. Next Work

Issue #57に従い、次を行う。

### 原文読書の先行工程（2026-10-23）

[原文読書室](../research/nakayama-jomon-2/README.md)に、仲山側とZeroRoomLab側の資料・読む順番・既読欄を整理した。
工程1（資料収集）の後に工程1.5（齋藤みつる本人による必要原文の読破）を置く。
工程2（責務・実装状態の照合）へは、本人の読破後の移行指示を受けて進む。
以下は後続作業の一覧であり、本人の読破や比較作業の完了を意味しない。


- [ ] 仲山氏本人のより古い一次資料を探索しbibliographyを拡張する
- [ ] claim tableをsource / date / scope付きで作る
- [ ] Authority / Governance / Exit / Federationの記述を追加調査する
- [ ] 仲山モデルとFAOCの責務matrixをfixture化する
- [ ] `SUPPORTED_WITH_SCOPE_REFINEMENT` 判定を第三者レビューへ開く
- [ ] Review確定commitをUrban Engineering Pre-Reviewから固定参照する
- [ ] 都市工学側ではSocial topologyとInfrastructure topologyを独立変数としてモデル化する

---

## References / Related ZeroRoomLab Documents

### External public sources

- 日本の人事部 HRカンファレンス 2023: https://jinjibu.jp/hr-conference/report/r202305/report.php?sid=3133
- Linking Society / 日立 2025-07-31: https://linkingsociety.hitachi.co.jp/_ct/17777626
- 国際社会経済研究所（IISE）: https://note.com/nec_iise/n/n9f05a121d0eb

### ZeroRoomLab

- Issue #57: https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/57
- FAOC / Infra-FIRE node architecture: `docs/theory/faoc-infra-fire-node.ja.md`
- 意味TopologyからSphereOS・Fold-NICまで: `docs/theory/semantic-fold-os-architecture.ja.md`
- Fold7G / Fold8G Registry upgrade memo: `note/20260819-2212__SphereDOS_Fold7G_Fold8G_registry_upgrade_memo.ja.md`
- OpenFAPTA responsibility summary: `README.ja.md` およびOpenFAPTA repositoryのmerchant-engine正本

---

*Draft prepared as an open ZeroRoomLab review. Corrections, counterexamples, additional primary sources, and alternative mappings are welcome through Issue / PR / fork.*
