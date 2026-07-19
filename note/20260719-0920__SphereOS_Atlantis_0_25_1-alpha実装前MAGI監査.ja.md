# SphereOS Atlantis 0.25.1-alpha実装前MAGI監査

状態: `[DRAFT]` `[Layer A/B/C bridge]` `[CURRENT INTERPRETATION OAE]`
観測時刻: `2026-07-19T09:20:02+09:00`
時計校正: `unverified`
対象: ZeroRoomLab-manifest、SphereOS Atlantis
除外: `スフィア独鈷書`の内容、企業・医療・労務・資格情報、対象外repositoryの実装

## 事実・観測

- `/Users/saitoumitsuru/スフィア.code-workspace`の`folders`を今回のworkspace member集合として読んだ。
- `スフィア独鈷書`は存在と非走査境界だけを確認し、内容を走査していない。
- Atlantisの`main`は`f12651b`までfast-forwardした。PR #1で固定revision workspaceとSphere-DOSの最小開発shellが追加されている。
- 現行READMEと`sphere-dos/profile.json`は`0.2.1`設計系列、standalone runtime未実装を表示している。
- Userは、Sphere系全体を単純な`frozen`から解除し、architecture active、legacy salvage complete、runner not started、resource wait等を分離して表示するよう指示した。
- Userは`0.25.1`をalphaとして実装し、MAGI監査後のSphere関係repositoryへの小刻みなcommitとremote pushを承認した。
- Userは、`0.25`を`0.2x`から大きく跳躍したminor番号ではなく、`0.2x`と`0.3x`の中間地点として指定した。
- Userは将来の表記候補として`0.100.0`、`0.200.0`、`0.250.0`のような三層座標を提示し、右端を通常のpatch番号ではなく意味カーネル互換世代として定義した。

## 考察

`0.25.1-alpha`は、standalone OS runtimeの完成宣言ではなく、次のcapabilityを束ねる設計・運用alphaとして扱う。

- repo-nativeなCORN作業指示stack
- Manifest／AGENTS／MAGIを省略しないcontext closure
- GitHub、GitLab等をprojection先とするforge非依存境界
- codeを書かない参加者のNote pull request導線
- 任意personaから開始できるtutorial resolver
- Experience Receipt、cluster保持、Core content non-adjudication
- 実装・配布・資源・内容成熟度を分けるstatus表示

`0.25.1`は、`0.2x`から`0.3x`へ向かう中間設計地点を小数的に表した暫定表記であり、過去に未記録のreleaseを遡及生成する意味でも、通常のSemVer minorを大きく跳躍したという意味でもない。ただし、人間やtoolが通常のSemVerとして読むと誤解しやすいため、将来は各層を独立整数として表すversion coordinateへ移行する候補がある。

### Sphere版数三層座標候補

```text
Presentation.Function.SemanticKernel
```

例:

```text
0.100.7
0.200.7
0.250.7
1.100.7
2.900.7
10.400.7
```

- `Presentation`: UI、配布形態、端末、人格表現、World presentation等の外装世代。
- `Function`: runtime、module、API、機能束、設計・鍛造stage。
- `SemanticKernel`: 意味ID、Registry、OAE、変換、handshake、serialization等を含む相互接続世代。

右端は通常の「軽微なpatch」ではない。意味カーネル層が一致する実装は、プレゼン層や機能層が十世代以上離れていても接続資格を持つ。意味カーネル層が異なる実装は、左二層が近接していても直接接続しない。

```text
0.250.7 <-> 10.400.7  : semantic-kernel match / connection eligible
2.900.7 <-> 2.901.8   : semantic-kernel mismatch / direct connection forbidden
```

右端一致は全機能同一を意味しない。意味カーネル一致後にcapability negotiationを行い、共通Function surfaceだけを接続し、Presentation差は明示的なtransformerまたはprofileで扱う。

この規則は通常のSemantic Versioningと意味が異なるため、単なる表記変更としてsilent導入しない。stable ID、各軸の定義、parse規則、比較規則、接続判定、legacy `0.25.1-alpha`からのmigration、fixture、validator、release表示を別Issueで設計する。

## MAGI三Position

### Maxwell

- 哲学、神学、ゲーム、スピリチュアル、工学の棚を単一の工学定規へ潰さない。
- `note complete != implemented != integrated != released != playable`を保持する。
- 第三者がまだ参加していない状態を、計画の失敗または凍結へ変換しない。
- Presentation、Function、SemanticKernelを上下関係へ変換せず、別責務として保持する。

### Uriel

- version、commit、test、runtime、resourceの状態を別fieldと証拠で追跡する。
- CORNをcanonical work-item sourceとし、forge issueを同期projectionとして扱う。
- syncはidempotent、dry-run、conflict-stop、receipt付きとし、silent overwriteしない。
- 接続可否はversion文字列の大小比較ではなく、SemanticKernel一致とcapability negotiationの証拠で判定する。

### Raphael

- shelf-localなNote受付では過剰防戦を置かず、runtime昇格、越境、公開配布時に必要なgateを適用する。
- 利用者の「波動が合わない」「面白くない」等をraw Experience Receiptとして保持し、工学的原因へ即時同一化しない。
- 宗派、プレイスタイル、personaは自己申告とmulti-membershipを基本とし、行動から推定しない。
- 旧Presentationや旧Functionを、意味カーネル一致時に年齢だけを理由として排除しない。

## Position-talk監査

- Declared Position: Userが指定した0.25.1-alpha設計系列を、Manifest契約とAtlantis実装へ分離して鍛造するcoding agent。
- Position-talk Risk: 現在のcwd、OpenAI／GitHub、standalone binary、線形roadmapを暗黙のmainへ置く危険がある。
- Medium / Claim Scope: Manifestは横断契約、Atlantisは実装・validator・CLI・test、noteは未確定材料と現在監査を担当する。
- Ruler Provenance: workspaceはdescriptor、横断規約はManifest、Atlantis局所実装はAtlantis AGENTSとtest、最終version選択はUser指示に由来する。
- Nerf Risk: resource waitを失敗へ変換すること、神学・ゲームUXをflavorだけへ縮退すること、Noteを実装済みへ誤昇格すること。
- User Gate: alphaからbeta／stableへの昇格、GitHub repository settings、公開security受付経路、第三者作品固有aliasの配布範囲、三層版数座標の正式名称と初回SemanticKernel番号。

## OAE時間整合性

```yaml
magi_temporal_receipt:
  version: 0.2.1
  observation_mode: current-interpretation-of-history
  observed_at: 2026-07-19T09:20:02+09:00
  historical_oae_status: historical-oae-unavailable
  historical_role_attribution: none
  last_order:
    code: OAE-HISTORY-UNKNOWN
    action: stop-retroactive-backfill
```

過去commitとartifactはSource Event／Evidenceとして参照できるが、当時のObserver、Intent、Agency roleを現在の推論で補完しない。

## 判定

`revise-and-proceed`

最初に既存workspace実装のdirty checkout判定、部分初期化によるworkspace縮退、GitHub URL固定を是正する。その後、横断契約、CORN最小核、Note／tutorial導線、release noteの順に小さなcommitへ分ける。standalone runtime、model inference、7D Fold runtime、Akasha Driver runtimeは本alphaの実装済みcapabilityへ含めない。

三層版数座標は本PRへ即時全面導入せず、Issueで仕様、legacy mapping、validator、接続fixtureを設計する。現行`0.25.1-alpha`はSource Eventとして保持し、後から新表記へ黙って書き換えない。

## 仮説・ブレスト

- `0.25.1-alpha.1`を最初の公開候補tagとし、第三者reviewとfork経由のNote PR到達試験をbeta以降の判断材料にする。
- resource wait中のwork itemは期限だけで自動closeせず、資源eventで再評価する。
- 三層座標の右端は`patch`ではなく`semantic_kernel_generation`等のmachine fieldとして別名を持たせる。
- Presentation／Functionが異なってもSemanticKernel一致なら接続し、共通機能範囲をnegotiationするfixtureを用意する。

## 内観メモ

火力を投入することと、全branchを同時に燃やすことは同じではない。停電に強い小commitは、細切れの成果ではなく、次の人間・AIが盤面を復元するための召喚石になる。

版数の右端は尻尾ではない。時代の違う器同士が同じ意味を受け渡せるかを決める、世代横断の鍵穴である。

## 未解決・⊥

- `0.25.1-alpha`からstableへ昇格する時期: `unknown`
- Windows実機、GitLab実サービス、第三者SaaS AI全種での動作: `NOT TESTED`
- 高火力runtimeの調達時期: `resource-wait`
- 三層版数座標の正式名称、初回SemanticKernel番号、legacy version mapping: `User／design gate`

## 本編昇格候補

- Sphere系状態表示規約
- CORN／forge projection／context closure契約
- 相互非越権、Experience Receipt、cluster保持、Core content non-adjudication
- Presentation.Function.SemanticKernel版数座標と世代横断接続契約

## source・Provenance

- `/Users/saitoumitsuru/スフィア.code-workspace`
- `AGENTS.md` §0.4、§0.5
- `docs/theory/atlantis-magi-sdk-0.2.1.ja.md`
- `docs/operations/context-ruler-and-causality-audit.ja.md`
- `docs/theory/sphereos-atlantis-versioning-and-bootstrap.ja.md`
- `SphereOS-Atlantis` PR #1およびcommit `f12651b`
- 2026-07-19のUser指示と実行承認
- 2026-07-19のUserによる三層版数座標と意味カーネル互換規則の追加指示
