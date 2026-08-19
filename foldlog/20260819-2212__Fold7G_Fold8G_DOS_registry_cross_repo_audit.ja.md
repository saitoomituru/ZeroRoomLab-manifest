# Fold7G / Fold8G DOS Registry 横断監査

観測時刻: 2026-08-19T22:12:00+09:00  
観測モード: `current-interpretation-of-current-sources`  
対象媒体: research note / GitHub issue / Q Atlantis public engineering map upgrade proposal  
claim scope: `[Layer A/B bridge] [RESEARCH] [NOT IMPLEMENTED]`

## Source revision

- ZeroRoomLab-manifest main: `8233ca1020a73090b6e21d4291cfc9d52fc9cc8e`
- SphereOS-Atlantis main: `bb2e3bc962f28c43e70fad9a337c9bcc33562230`
- Q Atlantis main: `4f7e7654cca5444cd8d142bc31b606d59699b9ec`
- Q Atlantis `fold7g-fold8g-research-map.md` blob: `56f5d6e6c59960b5d466f32b3167ff2e8b2d4a5e`
- MAGI bundle: `magi/0.2.1/bundle.json`, canonical coordinate `0.200.1`
- MAGI source map: `magi/0.2.1/source-map.json`

## [FACT] 対象の現在地

1. Q Atlantis公開研究地図は `G = Fold containerを包むnesting depth` と定義し、Fold7G各G Registryを未確定としている。
2. 同ページはFold8Gについて `independent_contract: unknown`、`runtime: NOT_IMPLEMENTED` と明示している。
3. SphereOS-Atlantis Issue #9 はDevOS Runnerを provider-neutral な durable orchestration semantics として整理し、capability / authority / provenance / receiptを分離している。
4. SphereOS-Atlantis Issue #8 はMatchboxを分散実行control plane候補とし、Fold8Gそのものではないと明示している。
5. 今回の会話で、DOS向けFold7G Registry候補として次の七段が整理された。

```text
G7 World
G6 Position
G5 Causality
G4 Objective / Party
G3 Distribution / Arena
G2 Mission
G1 Reality / Substrate
```

6. G5 Causalityは、上位Meaning / agreementと下位execution / physical realityの間の正当な状態遷移を扱う境界候補として整理された。
7. Fold8Gは、単一World内の八段目として無条件に積むのではなく、複数G7 World間を接続する Gate / Portal / Treaty 等の Inter-World Protocol候補として整理された。

## [INTERPRETATION] Maxwell slot

選択Position: `preserve-unmounted-branches-and-purpose`

- 既存の `G = nesting depth`、Trion Bondの Self-State / Causal Trace / Normative State を焼却せず、新しい七段RegistryはDOS向け具体化候補として追加するのが妥当。
- `World = 国家コード`へ矮小化しない。文化、信仰、共同体、政治思想、ゲームWorld等の複数membershipを保持できる余地を残す。
- Fold8Gの旧lineageを「今回8段目が発見された」と遡及確定しない。今回のInter-World Protocolは2026-08-19時点の新しいcontract candidateとして記録する。
- G7以上の将来branchとして、大陸間、国家間、異なるServer/Shard、異なる因果World等のGateを保持する。

Position-talk risk:
- 現在のSphereDOS用途へ寄せすぎると、Fold7G全体をDevOS専用概念へ縮退させる危険がある。

Action gate: `revise/pass`

## [INTERPRETATION] Uriel slot

選択Position: `preserve-fact-promise-and-responsibility-boundaries`

- Fold7G/8G runtimeは現時点で実装済みと表示しない。
- 今回確定できるのは研究上のRegistry / invariant候補とIssueへの設計入力まで。
- Coreは特定国家、企業、SaaS、宗派、一般AI倫理を唯一のNormative Stateとして制定しない。利用者、World、provider、workspaceが明示した規約・契約をscope付きsourceとして扱う。
- `capability != authority != contract != endorsement` を維持する。
- G1〜G4側で物理的・技術的に可能であることを理由にG6/G7の契約・Worldをsilent rewriteしない。
- 逆にG6/G7の信念・契約だけでG1/G3のexecution authorityを生成しない。
- 上位Foldを変更する場合はG5 Causalityで定義されたauthorized transition、再合意、訂正、rollback、branch等を通す候補とする。

Unknown:
- machine-readable Registry schema
- scope inheritance / precedence algorithm
- G5 transition token群
- G8 link-up条件とfailure mode

Action gate: `revise/pass`

## [INTERPRETATION] Raphael slot

選択Position: `preserve-shelves-routes-and-system-green`

- `World membership != normative agreement != content consent != execution authority != endorsement` を維持すると、異なるSaaS / local model / humanを同一Partyへ参加させても一枚の倫理へmergeせずに済む。
- G3 Distribution / Arenaは単なる法域ではなく、VS Code、test play、local runtime、shared server、real actuator等「どの狩場へprojectionするか」を含む。
- Minecraft内のTNTと現実物理の爆発物を同じRealityへ投影するような cross-shelf leakageを禁止する。この例はontology境界の説明であり、現実の危険物操作手順を提供するものではない。
- Fold8Gは異なるG7 World間の接続棚として候補化し、World Aのauthority、identity、causalityをWorld Bへ自動継承しない。
- G8接続は `observe | sandbox | restrict | negotiate | coexist | block | unmount` 等の分岐を残す。

Action gate: `revise/pass`

## agreements

- 新しい七段は既存L/D/G namespaceを置換せず、G Registry候補として追加する。
- G5 CausalityをMeaning/Agreement側とExecution/Reality側の境界に置く設計は、既存のContext定規・因果監査と整合しやすい。
- Fold8Gは「Fold7G内部の単純な8段目」より「複数G7 World間のInter-World Protocol候補」として検証する価値がある。
- Runtime実装、互換性、法的適合、物理的安全を今回の研究メモから自動推定しない。

## disagreements / preserved branches

- Fold8Gを本当にG8というnesting depthとして定義すべきか、Gate protocol familyとして別namespaceにすべきかは未確定。名称lineageを保持して反証対象とする。
- `Distribution / Jurisdiction` の正式名称は未確定。DOS用途では `Arena` が実行面をよく表すが、公開研究地図では法域・媒体・runtimeを包含できる名前を別途検討する。

## [FIX] 今回許可する変更

1. ZeroRoomLab-manifest `note/` に未採用research memoを追加する。
2. SphereOS-Atlantis Issue #9へDOS Fold7G projection候補を追記する。
3. SphereOS-Atlantis Issue #8へFold8G Inter-World Protocol候補とMatchbox非同一性を追記する。
4. Q Atlantis repoには該当Issueがないため、公開 `fold7g-fold8g-research-map` のアップグレードIssueを新設する。
5. 公開ページ本体を今回直接書き換えない。Issueレビュー後の別変更として扱う。

## [UNKNOWN]

- 各Gのmachine-readable schema / Registry ID
- 7G capsuleのVALUE / REFERENCE / LEASE / RECEIPT正規形式
- G5を越えるprojectionとreceiptの最小必須field
- G8 Gateでのidentity / authority / causality translation contract
- MAGI / ZAPとの正式interface
- Fold8G名称を将来も維持するか、Inter-World Bridge系の別stable IDへ分離するか

## [SEMANTIC-STOP]

次の場合はsilent adoptionしない。

- 今回の候補を過去のFold8G仕様だったと遡及生成する
- Worldの思想・信仰・文化membershipを国籍や法域だけへ縮退する
- provider policy、国家、一般的AI倫理をSphere Coreの唯一の規範へ昇格する
- 下位execution可能性から上位契約・同意を生成する
- 上位World設定から下位の実行権限を自動生成する
- Matchbox / Runner実装済みを理由にFold7G/8G runtime実装済みと表示する

## 最終Action Gate

`revise/pass`

今回の変更は「仕様制定」ではなく、既存正本を保持した上での研究候補・Issue入力として実行可能。公開正本への採用は別revisionで行う。
