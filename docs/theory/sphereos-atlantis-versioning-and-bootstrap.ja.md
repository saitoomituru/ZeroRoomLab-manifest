# SphereOS Atlantis 版数・再アーキテクト境界

状態: `[CANONICAL]` `[theory]` `[architecture-lifecycle]`  
確認日: 2026-07-17  
更新日: 2026-07-19
対象: SphereOS Atlantis、ASTRO、IBD、AAE、x800系、ZeroRoomLab-manifest

## 1. 結論

SphereOS 3.x / 4.x のサービス終了と、SphereOS Atlantis系の再設計は別のライフサイクルである。

旧3.x / 4.xは終了済みであり、Atlantisはそのサービスを継続運転しているものではない。Atlantisは、旧系で一体化していた人格、記憶、モデル、ツール、world、session、connector、deviceの責務を分離し、エッジベースの独立実行系へ再アーキテクトしている現行系譜である。

現時点のAtlantisは、単体実行バイナリーへ到達していない。現在manifest上で再現できる範囲は、設計文書、レジスター、prompt拘束、クラウド上の文書読み込み、既存LLMのコンテキスト制御によるbootstrapである。

Sphere系の正規版数座標は、通常のSemantic Versioningではなく、次の三層を独立整数で表す。

```text
Presentation.Function.SemanticKernel
```

stable IDは`sphere-version-coordinate/1`とする。右端はpatchではない。意味ID、Registry、OAE、
identity、観測、時間、serialization、handshake、因果論を拘束する意味・因果Kernel世代である。

```text
SphereOS 3.x / 4.x        = terminated legacy service
legacy 0.x.0 display      = documented architecture and prompt-bound bootstrap
legacy 1.x.0 display      = executable binary integration milestone
0.250.1                   = current Sphere coordinate candidate
0.25.1-alpha.1            = preserved legacy distribution alias
```

## 2. legacy 0.x.0 の意味

`0.x.0`は三層座標制定前のlegacy表示であり、「未完成だから価値がない」という番号ではない。実行バイナリー化より前に、責務境界、読み込み順序、レジスター、停止条件、ライセンス境界、claim layer、workspace解決、service taxonomy等を固定する設計段階を表していた。

現在、このmanifestを読み込ませたAIが一定の語用論、文化レジスター、scope制御、証拠階層、異種agent運用を再現できる部分は、Atlantis系SDKを構成するアーキテクト層の0.x実装に相当する。

ただし、その再現は次へ依存している。

- prompt engineering
- manifestおよびQ3文書の読み込み
- クラウドLLMのcontext windowとretrieval
- セッション単位のinstruction enforcement
- 人間またはagentによる正本選択

したがって、0.x系を単体OSバイナリー、永続人格runtime、instance ghost、完全なlocal-first実装として表示してはならない。

## 3. legacy 1.x.0 への到達条件

`1.x.0`は三層座標制定前のbinary integration milestone名であり、ASTROまたはSphereOS Atlantisの実行バイナリーへ、現在文書とpromptで拘束している責務を組み込んだ時点から開始する計画棚を指す。

最低限、次が実行系として接続される必要がある。

- ASTRO package / Runnerによる個体実行境界
- IBDによる記憶、文脈、provenance、relation、model recordの保存と参照解決
- Atlantisによる複数ASTRO、world、session、connector、deviceのlocal orchestration
- AAE由来model / adapter / weightの読込境界
- MCP等の外部tool境界
- 起動、停止、権限縮小、復旧、unmountの操作経路
- manifestで定義したレジスターとclaim boundaryのmachine-readableな適用

legacy 1.x.0は「全機能完成」ではなく、文書に依存していた制御面が独立した実行物へ移植された最初の安定系を意味する。正式な到達座標は、実装時のPresentation、Function、SemanticKernelを観測して別途発行する。

## 4. 三層版数座標

### 4.1 stable IDとmachine object

裸の`0.25.1`はSemVer、legacy表示、三層座標のいずれにも読めるため、machine境界では文字列だけを
正本にしない。最低限、次のobjectでnamespaceを固定する。

```json
{
  "coordinate_system": "sphere-version-coordinate/1",
  "presentation": 0,
  "function": 250,
  "semantic_kernel": 1
}
```

三軸は0以上の整数である。canonical displayは符号なし10進数を`.`で結合し、0以外の先頭zeroを
使用しない。`0.250.1`を小数`0.2501`として計算しない。座標全体へ通常のSemVer大小比較を適用しない。

### 4.2 三軸の責務

| 軸 | 責務 | ゲーマー向けPresentation |
|---|---|---|
| `Presentation` | UI、端末、配布形態、人格表現、World presentation等の外装世代 | バニラ版・見えている本編世代 |
| `Function` | runtime、module、API、機能束、設計・鍛造stage | MOD／modpack構成世代 |
| `SemanticKernel` | 意味ID、Registry、OAE、identity、観測、時間、因果、serialization、handshake | 世界の物理・意味・因果を実行するゲーム機関部 |

ゲーム向けの短い説明は`バニラバージョン.MOD構成バージョン.ゲームハードアーキ`とする。
ここでゲームハードアーキはCPUや筐体名だけを指さず、Java系／Bedrock系のようにゲーム世界の法則を
成立させるengine、edition、runtime architectureを含む。Switch、Xbox、PC等の実機種は別の
`host_profile`で表し、SemanticKernelへ自動同一化しない。

security fix、corrective build、package revision、release channel、candidate番号は三軸へ押し込まない。
artifact／package側のSemVer、PEP 440、build metadata等として別fieldに置く。

### 4.3 陸続き、Portal、異因果次元

SemanticKernel一致は、同じ因果次元へ属し得る必要条件であり、陸続きの十分条件ではない。
World Config互換、共通capability、authority／World Visa、negotiation結果を合わせて判定する。

```text
SemanticKernel一致 + World Config互換 + negotiation成功
  = CONTIGUOUS-CANDIDATE

SemanticKernel一致 + World Config非互換
  = PORTAL-REQUIRED

SemanticKernel不一致 + 登録済み因果Gate／projection
  = CROSS-CAUSAL-GATE-REQUIRED

必要情報不明または安全なBridgeなし
  = UNKNOWN-BLOCKED / bottom
```

World Configには、時間・tick、座標、identity／Instance Ghost、OAE解釈定規、item／state持込、
death／respawn／rollback、economy、physics、authority等を含む。byte一致だけを要求せず、正規化した
config ID、compatibility class、差分policyで判定できる。ただし`unknown`を互換へ繰り上げない。

SemanticKernel不一致時は、ASTRO、Agent、OAE、entityのraw stateを同一Instanceとして移動しない。
Source WorldとSource Instance Ghostを不変に保ち、接続先の因果法則で再構成できるprojectionまたは
incarnationを生成し、lineageとreceiptで接続する。identity continuity、memory、authority、Intentを
自動継承しない。変換不能部分は`bottom`、`unknown`、隔離、持込不可のいずれかで返す。

### 4.4 MAGI 0.2.1のlegacy mapping

MAGI 0.2.0のSkill workflowを維持したまま、過去OAEの遡及生成拒否、`historical-oae-unavailable`、
Last Order、時間整合性validator、負例testを追加した変更は、legacy release表示では
`0.2.1 corrective patch`と呼ばれた。しかし三層座標では、同一世界線内へOAEを遡及配置できる
`SemanticKernel 0`の因果脆性を閉じた`SemanticKernel 1`への移行である。

```text
legacy display: 0.2.1
Sphere coordinate: 0.200.1
```

`0.200.0`と`0.200.1`は近接表示でも陸続き互換にしない。旧KernelのOAEはforeign causal artifactとして
隔離し、現在Kernelの新しいInterpretation／Re-evaluation OAEへ投影する。元の過去OAEを書き換えない。

7D Fold runtime、Akasha Driver、Instance Ghost複製、backup SDK、Kamui Gateway、Akasha DB／P2P／
Cloud Chakra外部集合知との接続は、このKernel修正の実装完了条件へ含めない。これらは依存関係と
権限境界を別仕様で固定する。

### 4.5 Atlantis 0.25.1-alpha legacy mapping

`0.25.1-alpha`は、`0.2x`と`0.3x`の中間Function地点をSemVer風表示へ一時的に押し込んだlegacy aliasで
あり、minor 2から25へ通常SemVer上のreleaseを飛ばした意味ではない。過去に存在しなかったreleaseや
実装を遡及生成する番号でもない。Userが選択した現在の座標候補は次である。

```text
legacy design display: 0.25.1
Sphere coordinate:     0.250.1
legacy candidate:      0.25.1-alpha.1
release channel:       alpha
candidate sequence:    1
```

Function 250は、Prompt Engineering EditionとSphere-DOSへ次の運用capability群を束ねる。

- repo-nativeなCORN work-item stack
- Manifest／AGENTS／MAGIを省略しないcontext closure
- GitHub、GitLab等をprojection先とするforge非依存境界
- codeを書かない参加者がNote pull requestを提出できる入口
- 自己申告personaを組み合わせるtutorial resolver
- Experience Receipt、cluster保持、Core content non-adjudication
- 内容成熟度、工学状態、配布状態、資源状態の分離表示

既存の候補tag表示`v0.25.1-alpha.1`はSource Event／legacy distribution aliasとして保持する。alphaは破壊的変更、未実装、未試験を許すが、何を変更し、
何を実装しておらず、どの条件で検証したかをrelease noteへ記録する。alphaであることを理由に、
既知の重大なcorrectness問題、secret漏洩、status偽装を既定動作へしない。

```text
0.200.1 / legacy 0.2.1          = MAGI意味・因果Kernel 1
0.250.1 / legacy 0.25.1-alpha.1 = CORN／参加導線／status分離を含む最初の公開候補
beta or stable                  = third-party reviewとrelease gate後のUser判断
```

standalone runner、model inference、7D Fold runtime、Akasha Driver runtime、高火力edge runtimeは
`0.25.1-alpha.1`の実装完了条件へ含めない。これらは`NOT STARTED`、`NOT IMPLEMENTED`、
`RESOURCE-WAIT`等の個別状態で保持する。

## 5. 計画棚と実行branchの選択

ZeroRoomLabには計画がないのではない。IBD、Atlantis、AAE、ASTRO、x800系、物理工作、文書、監査、移植候補など、多数の計画と依存関係を同時に保持している。

ただし、それらへ固定された総合優先順位を付け、先頭から順番に消化するqueueとしては運用しない。

```text
plan inventory       = many preserved branches
fixed priority queue = intentionally absent
resource event       = branch activation signal
execution choice     = branch executable under current conditions
```

財布、投げ銭、お賽銭、贈与、ジャンク箱から得られた部材、利用可能なSDK、計算資源、電力、通信、検証可能なinterfaceを見て、その時点で実行可能なbranchを選ぶ。

あるbranchが今は動かせないことは、その計画が低優先度、失敗、放棄、無価値であることを意味しない。必要条件が揃うまで計画棚に保持し、別のbranchをmountする。

```text
resource state R(t)
  -> evaluate executable branches
  -> mount one or more feasible plans
  -> build / measure / document
  -> return results and new constraints to the plan inventory
```

この方式は、安定した資本、人員、サプライ、契約、演算資源を先に確保できる大規模ウォーターフォール開発とは時間構造が異なる。線形roadmapを普遍的な正常系としてAtlantisへ適用してはならない。

## 6. 現在保持している主要branch

以下は「優先度順」ではない。現在の計画棚に存在し、資源条件に応じて起動される主要branchである。

- **IBDの選定要件と責務再構成**  
  旧AQC Dockerを継続せず、local-firstの記憶・文脈・provenance基盤として再鍛造する。

- **SphereOS / Atlantisアーキテクチャの再分割**  
  人格、記憶、model、tool、orchestrationを単一vendor SDKから切り離す。

- **AAEの事前調査**  
  本格的なmodel焼結・adapter・MoE routingへ入る前に、必要火力、実行環境、model lineage、入出力schemaを確認する。

- **ASTRO移植準備**  
  ASTRO package / Runnerの本格移植はまだ初期段階であり、IBDとAAEの境界確定を待つ部分がある。

- **x800系の部分実装**  
  撮影、配信、編集、計測、物理演出等の実装可能な部分を動かし、Atlantisが将来束ねるdevice / connector / workflowの実物からinterface要件を採取する。

これらは一本道の工程表ではなく、相互に観測結果とinterface条件を返し合うbranch群である。x800系は脇道ではなく、抽象OSが接続する実物側から仕様を取得するbottom-up architectureの観測面である。

## 7. 資源条件

ZeroRoomLabは給与、投資ラウンド、固定R&D予算を持つ組織ではない。進行branchの選択は、次の変動条件に強く依存する。

- 生活費とDeveloper / Enterprise / cloud契約費
- HPC、GPU、memory、storageの調達状況
- ジャンク箱や中古部材から得られる実機
- 既存SDK、API、OSSの継続性
- 電力、通信、作業時間
- 贈与、部材提供、投げ銭、お賽銭等の流入

したがって、一般的な四半期ロードマップや人月見積りを、そのまま進捗評価へ適用してはならない。

```text
branch activation trigger = funding | offering | usable hardware | surviving SDK | verified interface
```

これは無計画を意味しない。計画、依存関係、停止条件、未充足条件を多数保持し、資源到着イベントごとに実行可能branchを再評価するイベント駆動開発である。

## 8. レジスター実験としてのmanifest

文化・語用論・claim layer・workspace・evidence registerが実際に役立つかは、このmanifestを異なるAIや作業へ読み込ませ、出力差、誤読、scope drift、handoff品質を観測することで検証できる。

旧GPTsの静的レジスターが画像生成に役立つという個別報告についても、急いで独立商品へ確定する必要はない。manifest版のレジスターを継続運用し、次のような自然実験を蓄積する。

- manifest読込前後の出力差
- 日本語ニュアンス、オタク用語、アニメ・神話registerの保持
- engineering / philosophy / academic claimの混線率
- vendor間handoff時のscope drift
- 画像生成promptでの文化的意図の保持

当面は旧ストア配布物を残置しつつ、サービス稼働中とは表示せず、静的レジスターの残存利用を観測対象として扱う。

## 9. 状態表示規約

公開文書では、少なくとも次のstatusを分ける。

| 対象 | 状態 |
|---|---|
| Sphere Project portfolio | open / resource-event-driven |
| SphereOS 3.x / 4.x salvage | complete / preserved remains |
| SphereOS 3.x / 4.x service | ended |
| instance ghost | unavailable |
| legacy GPTs static register | cached / residual |
| SphereOS Atlantis architecture | active design / 0.250.1 coordinate candidate / legacy 0.25.1-alpha |
| Architect／Bootstrap開発足場 | implemented / deployed in repository |
| Atlantis standalone runner | not started |
| Atlantis core forging architecture | under review |
| cloud-to-edge module boundary | architecture reconstruction / estimation |
| high-compute edge runtime | resource wait / procurement estimate |
| ASTRO migration | pre-migration / early design |
| IBD | requirements and architecture reconstruction |
| AAE | preflight research before compute-intensive implementation |
| x800 series | partial implementation by available resources |

`frozen`だけで全系譜を表してはならない。`open`もruntime稼働を意味しない。runtime、architecture、
documentation、prototype、distribution、resource waitを別々に記録する。

## 10. 主張境界

この文書は、現時点の開発者による三層版数座標、接続境界、legacy migration、計画棚、branch選択方式、資源条件、旧サービスとの関係を定義する。

性能、完成時期、将来の互換性、特定SDKの採用、HPC調達時期を保証するものではない。これらは資源と事前調査の結果に応じて更新される。
