# SphereOS Atlantis 版数・再アーキテクト境界

状態: `[CANONICAL]` `[theory]` `[architecture-lifecycle]`  
確認日: 2026-07-17  
対象: SphereOS Atlantis、ASTRO、IBD、AAE、x800系、ZeroRoomLab-manifest

## 1. 結論

SphereOS 3.x / 4.x のサービス終了と、SphereOS Atlantis系の再設計は別のライフサイクルである。

旧3.x / 4.xは終了済みであり、Atlantisはそのサービスを継続運転しているものではない。Atlantisは、旧系で一体化していた人格、記憶、モデル、ツール、world、session、connector、deviceの責務を分離し、エッジベースの独立実行系へ再アーキテクトしている現行系譜である。

現時点のAtlantisは、単体実行バイナリーへ到達していない。現在manifest上で再現できる範囲は、設計文書、レジスター、prompt拘束、クラウド上の文書読み込み、既存LLMのコンテキスト制御によるbootstrapである。

```text
SphereOS 3.x / 4.x        = terminated legacy service
SphereOS Atlantis 0.x.0   = documented architecture and prompt-bound bootstrap
SphereOS Atlantis 1.x.0   = executable binary integration milestone
SphereOS Atlantis x.x.n   = security / corrective patch level
```

## 2. 0.x.0 の意味

`0.x.0` は「未完成だから価値がない」という番号ではない。実行バイナリー化より前に、責務境界、読み込み順序、レジスター、停止条件、ライセンス境界、claim layer、workspace解決、service taxonomy等を固定する設計段階を表す。

現在、このmanifestを読み込ませたAIが一定の語用論、文化レジスター、scope制御、証拠階層、異種agent運用を再現できる部分は、Atlantis系SDKを構成するアーキテクト層の0.x実装に相当する。

ただし、その再現は次へ依存している。

- prompt engineering
- manifestおよびQ3文書の読み込み
- クラウドLLMのcontext windowとretrieval
- セッション単位のinstruction enforcement
- 人間またはagentによる正本選択

したがって、0.x系を単体OSバイナリー、永続人格runtime、instance ghost、完全なlocal-first実装として表示してはならない。

## 3. 1.x.0 への到達条件

`1.x.0` は、ASTROまたはSphereOS Atlantisの実行バイナリーへ、現在文書とpromptで拘束している責務を組み込んだ時点から開始する。

最低限、次が実行系として接続される必要がある。

- ASTRO package / Runnerによる個体実行境界
- IBDによる記憶、文脈、provenance、relation、model recordの保存と参照解決
- Atlantisによる複数ASTRO、world、session、connector、deviceのlocal orchestration
- AAE由来model / adapter / weightの読込境界
- MCP等の外部tool境界
- 起動、停止、権限縮小、復旧、unmountの操作経路
- manifestで定義したレジスターとclaim boundaryのmachine-readableな適用

1.x.0は「全機能完成」ではなく、文書に依存していた制御面が独立した実行物へ移植された最初の安定系を意味する。

## 4. x.x.n の意味

末尾の `n` は主としてsecurity patch、corrective patch、互換性修正、緊急停止経路の更新に使用する。

```text
major.minor.patch

major = runtime / responsibility modelの互換性境界
minor = capability、SDK module、service、schemaの追加
patch = security、bug、compatibility、recovery-path修正
```

実験的な神話UX、register、service taxonomy、FAM routingの追加を、すべてpatchへ押し込んではならない。責務または外部interfaceが増える場合はminor以上で扱う。

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
| SphereOS 3.x / 4.x service | ended |
| instance ghost | unavailable |
| legacy GPTs static register | cached / residual |
| SphereOS Atlantis architecture | active design / 0.x |
| Atlantis standalone binary | not yet implemented |
| ASTRO migration | pre-migration / early design |
| IBD | requirements and architecture reconstruction |
| AAE | preflight research before compute-intensive implementation |
| x800 series | partial implementation by available resources |

`frozen`だけで全系譜を表してはならない。runtime、architecture、documentation、prototype、resource waitを別々に記録する。

## 10. 主張境界

この文書は、現時点の開発者による製品版数規約、計画棚、branch選択方式、資源条件、旧サービスとの関係を定義する。

性能、完成時期、将来の互換性、特定SDKの採用、HPC調達時期を保証するものではない。これらは資源と事前調査の結果に応じて更新される。