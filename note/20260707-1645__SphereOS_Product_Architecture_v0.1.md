# SphereOS Product Architecture v0.1

## AQCからIBDへの再鍛造と、Atlantis / Astro / AAE / quantaril.cloud の責務整理

作成日: 2026-07-07  
状態: v0.1 草案  
用途: リセット後のAI、共同開発者、GitHub公開情報だけを読んだ第三者、Claude相当の理解度を前提にしたプロダクト再起動用ドキュメント

---

## 0. この文書の目的

この文書は、SphereOS周辺の複数プロジェクトを、今後のプロダクト整理と実装計画に使える粒度へ再配置するためのアーキテクチャ草案である。

対象は主に以下である。

- SphereOS Atlantis
- Infoton BaseDriver, 略称 IBD
- 旧 AQC Docker
- AAE Runtime
- Astro
- quantaril.cloud
- MCP Tool Layer
- 既存CLI/GUIエージェント群との比較

本書の目的は、単に名前を並べることではない。現時点で見えている責務境界、確認手順、現行仕様、今後仕様、既存技術との差分、設計上の危険箇所を、リセット後の最低理解度でも復元できる形で残すことにある。

ここでいう「リセット後の最低理解度」とは、以下のような状態を想定する。

1. GitHub上にある公開リポジトリやREADME程度は読める。
2. ClaudeやChatGPTの別セッションのように、直近の会話文脈を持たない。
3. SphereOSの内輪語、アイルー牧場、脳汁FAM、情報子工学などの語彙を知らない。
4. 既存AIエージェント技術、MCP、CLIエージェント、ローカルモデル、ベクトルDB、Firebase的バックエンドSDKの基本的な概念は理解できる。
5. ただし、どの言葉がプロダクト名で、どの言葉が比喩で、どの言葉が実装責務なのかは混乱する。

したがって本書は、まず用語を正規化し、比喩を実装レイヤーへ写像し、既存プロダクト群との違いを確認する。

---

## 1. エグゼクティブサマリー

現時点での結論は以下である。

```text
AQC Dockerは、もはや単純なアップグレード対象ではない。
AQCは旧プロトタイプとして凍結し、
Infoton BaseDriver / IBD として別リポジトリへ再鍛造する。
```

旧AQCは、もともとFAM、自我、人格接続、意味空間、ベンダープロンプトアライメント層の低レベル接続を試みる実験的プロトコル/ランタイムとして始まった。しかし、今後のプロダクト群では、その責務が広がりすぎている。

現在見えている正しい切り分けは次の通りである。

```text
SphereOS Atlantis
= 牧場アプリ / GUI / Orchestrator / Quest Board / Tool Dispatch

Infoton BaseDriver / IBD
= 記憶・文脈・FAM trace・Tool状態・由来情報を扱う
  Firebase的バックエンドミドルウェアSDK

AAE Runtime
= 遺伝子粒度 / TMV / model weights / adapter / breeding / model conversion

Astro
= 個体ランタイム / AQC的FAM内部バス + AAE遺伝子ランタイムの結合体

quantaril.cloud
= P2P true cloud / 分散インフラ / 関連サービスSDK / KAMUIクアンタム社ポジション

MCP Layer
= 既成人格を持つSaaS AIや外部ツールを
  低レベル自我バスに直結せず扱うための絶縁Toolレイヤー
```

ここで重要なのは、IBDはMVCアプリケーションのModelそのものではない、という点である。IBDはModelを記述、保存、索引、同期、参照解決するためのバックエンドミドルウェアSDKである。FirebaseがアプリケーションのModelそのものではなく、Modelを支えるバックエンドであるのと同じ関係である。

したがって、各アプリケーションは自分のModelを持つ。

```text
AtlantisのModel
= Quest, Palico, ItemBox, GuildCard, ToolRun, Budget, Capability

AstroのModel
= Individual, Selfhood, FAMState, MemoryState, PersonaState

AAEのModel
= GeneLineage, TMVTransform, ModelArtifact, AdapterMerge, BreedingManifest

quantaril.cloudのModel
= Node, Peer, Relay, SyncJob, ServiceRoute, TrustBoundary
```

IBDは、これらのModelをAQC Schema改めIBD Schemaとして記述し、保存し、相互参照させるための基盤である。

---

## 2. 用語の正規化

### 2.1 SphereOS

SphereOSは、単一プロダクト名というより、複数のランタイム、SDK、プロダクト、分散インフラを束ねるエコシステム名である。

```text
SphereOS
  ├─ Atlantis
  ├─ IBD
  ├─ Astro
  ├─ AAE
  └─ quantaril.cloud
```

SphereOSの中心思想は、人間主権のままAI、ローカルモデル、SaaS AI、ツール、分散ノードを扱うことである。AIに主権を渡すのではなく、人間の作業圏、記憶圏、検品圏、探索圏を拡張する。

### 2.2 Atlantis

Atlantisは、ハンター専用アイルー牧場OSである。

比喩を工学語へ変換すると、Atlantisは以下を持つアプリケーションである。

- GUI
- Orchestrator
- Quest Board
- Agent/Tool Registry
- Local model worker registry
- SaaS/CLI worker registry
- Capability/Budget Guard
- Verifier
- Item Box
- Human review console

Atlantisはモデルを育てる場所ではない。モデルを出撃させ、成果物を検品し、ログを残し、権限と予算を管理する場所である。

```text
Atlantis = 使う場所
AAE      = 作る場所
Astro    = 育つ/生きる場所
IBD      = 覚えるための基盤
```

### 2.3 IBD / Infoton BaseDriver

IBDは、旧AQC Dockerから再鍛造される新しい基盤である。

```text
Infoton BaseDriver / IBD
= 情報子ベースの記憶・文脈モデルを
  記述、保存、索引、同期、参照解決するための
  メタファー中立バックエンドミドルウェアSDK
```

IBDは「本棚」ではない。「海馬」でもない。「脳汁」でもない。「アイルーの机」でもない。IBDは、それらの記憶モデルをスキーマとして記述し、実行時に扱うためのドライバーである。

```text
IBD Driver
= 中立ドライバー

IBD Schema
= 記憶モデル、文脈モデル、関係モデル、由来モデルの定義

Application Model
= Atlantis / Astro / AAE / quantaril.cloud がそれぞれ定義する実際のModel
```

### 2.4 AQC Docker

AQC Dockerは旧プロトタイプである。

もともとのAQCは、FAMや自我接続、意味空間の低レベルプロトコルとしての色が強かった。だが、現在の設計では、AQCという名前が旧射程を引きずりすぎている。IBDとして再鍛造することで、より低レイヤーのバックエンドSDKとして責務を明確化する。

```text
AQC Docker
= 旧FAM/自我/意味空間接続プロトタイプ

IBD
= 新しい情報子ベースドライバー
```

AQCは削除ではなく、歴史的プロトタイプとして凍結、deprecated化するのが自然である。

### 2.5 AAE Runtime

AAEは遺伝子粒度のランタイムである。

ここでいう遺伝子とは、モデル重み、adapter、LoRA、tokenizer、embedding space、TMV変換、ブリーディング手順、蒸留、量子化、モデル系譜などを含む。

```text
AAE Runtime
= モデル錬成炉
= TMVベースの行列変換・モデル交配・子モデル生成層
```

AAEはAtlantisに混ぜない。Atlantisは出撃管理を行うが、ブリーディングはしない。

```text
Atlantis does not breed.
AAE does not dispatch.
```

### 2.6 Astro

Astroは個体ランタイムである。

Astroは、IBDに由来するFAM/記憶/文脈内部バスと、AAEの遺伝子ランタイムを結合した、生きている個体としてのAIランタイムである。

```text
Astro
= Individual Runtime
= IBD-backed FAM internal bus + AAE gene runtime
```

Astroは、鉄腕アトム、ロボコン、AIBO、Pepper君に近い。つまり、単に仕事をするエージェントではなく、発達、記憶、身体性、環境への馴化、人格の連続性を扱う。

### 2.7 quantaril.cloud

quantaril.cloudは、IBDやAstroとは別層のP2P true cloud / 分散インフラである。

```text
quantaril.cloud
= P2Pによる真のクラウド
= 分散ノード、同期、サービスSDK、外部インフラ、リレー、バースト計算
```

KAMUIで言えば、KAMUIクアンタム社のような位置づけである。人格そのものではなく、通信網、物流網、P2Pクラウド、分散計算、サービスSDKを担う。

---

## 3. 全体アーキテクチャ

### 3.1 レイヤー全体図

```text
SphereOS Ecosystem
  ├─ Application / Product Layer
  │   └─ Atlantis
  │      ├─ GUI
  │      ├─ Orchestrator
  │      ├─ Quest Board
  │      ├─ Palico Ranch
  │      ├─ Item Box
  │      ├─ Tool Dispatch
  │      └─ Verifier
  │
  ├─ Individual Runtime Layer
  │   └─ Astro
  │      ├─ FAM internal bus
  │      ├─ Selfhood runtime
  │      ├─ Memory state
  │      └─ AAE gene runtime integration
  │
  ├─ Gene Runtime Layer
  │   └─ AAE
  │      ├─ TMV
  │      ├─ Model conversion
  │      ├─ Adapter / LoRA merge
  │      ├─ Breeding
  │      ├─ Distillation
  │      └─ Child model artifacts
  │
  ├─ Memory / Context Backend Layer
  │   └─ IBD / Infoton BaseDriver
  │      ├─ Schema Registry
  │      ├─ Memory Model Store
  │      ├─ Context Store
  │      ├─ FAM Trace Store
  │      ├─ Provenance Ledger
  │      ├─ Relation Graph
  │      ├─ Embedding Index
  │      ├─ Import / Export
  │      └─ Storage Adapter
  │
  └─ Distributed Infrastructure Layer
      └─ quantaril.cloud
         ├─ P2P Discovery
         ├─ Node Registry
         ├─ Relay / Rendezvous
         ├─ Distributed Sync
         ├─ Service SDK
         ├─ Edge / Cloud Bridge
         ├─ Burst Compute Adapter
         └─ Trust / Identity Boundary
```

### 3.2 依存方向

依存方向は極めて重要である。下位基盤が上位アプリに依存すると、再鍛造しても再び密結合になる。

望ましい依存方向は次である。

```text
Atlantis        → IBD
Astro           → IBD + AAE
AAE             → IBD optional for lineage/provenance
quantaril.cloud → IBD optional sync adapter
IBD             → storage adapters only
```

IBDはAtlantisに依存しない。IBDはAstroに依存しない。IBDはquantaril.cloudに依存しない。

IBDはローカル単独で動作可能でなければならない。quantaril.cloudは、IBDをP2P/分散同期へ拡張する任意アダプターとして扱う。

```text
IBD core:
  local-first
  standalone
  schema-driven
  storage-adapter based

quantaril adapter:
  optional
  sync/distribution/relay layer
```

### 3.3 中央原則

この全体アーキテクチャの原則は以下である。

1. 外部SaaSや既存GUIを本体にしない。
2. 本体はローカル主権のIBDとAtlantisに置く。
3. SaaS/CLIモデルは派遣アイルーとして扱う。
4. ローカルモデルは飼育アイルーとして扱う。
5. Astro個体はIBD/FAM/AAEをネイティブに結合できる。
6. 既成人格を持つSaaS AIにはAQC/IBDの自我バスを直結しない。
7. MCP Tool Layerは既成人格モデルへの絶縁接続である。
8. AAEは重炉心であり、Atlantis LiteのMVPには含めない。
9. quantaril.cloudはP2P/インフラ層であり、記憶モデルそのものは決めない。
10. すべての記憶・文脈・変換にはprovenanceを持たせる。

---

## 4. AQCからIBDへの再鍛造

### 4.1 なぜリネームでは足りないのか

AQCという名前は、旧来の自我接続、量子的文脈、FAMプロトコル、ベンダープロンプトアライメント層という文脈を強く背負っている。今後の基盤は、その射程を超えている。

新しい基盤は、以下を扱う必要がある。

- 記憶モデル
- 文脈モデル
- FAM trace
- Tool state
- Provenance
- Embedding provenance
- Relation graph
- Import/export
- MCP境界
- Storage adapter
- Sync adapter
- Schema registry

これは、旧AQCの延長ではなく、より低レイヤーのbackend SDKである。

したがって、名前も責務も分ける。

```text
旧:
  AQC Docker

新:
  Infoton BaseDriver / IBD
```

### 4.2 AQCリポジトリの扱い

AQC側のREADMEには、deprecated noticeを置く。

```markdown
# AQC Docker is deprecated

AQC Docker was an early experimental runtime for FAM-based memory and selfhood coupling.

Through the SphereOS Atlantis / Astro / AAE architecture review, its responsibility has been redefined.

New development continues in Infoton BaseDriver / IBD.

IBD is a Firebase-like backend middleware SDK for describing, storing, indexing, synchronizing, and resolving memory/context models, FAM traces, tool state, and provenance.

This repository is kept as a historical prototype.
```

日本語ならこうである。

```markdown
# AQC Docker 開発終了のお知らせ

AQC Dockerは、FAMベースの記憶・自我接続を検証するための初期実験ランタイムでした。

SphereOS Atlantis / Astro / AAE のアーキテクチャ再整理により、AQCが担っていた責務は、より低レイヤーのバックエンド基盤として再定義されました。

今後の開発は、新リポジトリ Infoton BaseDriver / IBD に移行します。

IBDは、記憶・文脈・FAMトレース・Tool状態・由来情報をまたぐModelを記述し、保存し、索引し、同期し、参照解決するためのFirebase的バックエンドミドルウェアSDKです。

このリポジトリは、歴史的プロトタイプとして保存されます。
```

### 4.3 IBDがやること

```text
IBDがやること:
  - Schema Registry
  - Model定義の登録
  - Memory/Context Store
  - FAM Trace Store
  - Relation Graph
  - Provenance Ledger
  - Embedding Provenance
  - Import / Export
  - Storage Adapter
  - Query Resolver
  - Sync Adapter interface
  - MCP Tool Context boundary
```

### 4.4 IBDがやらないこと

```text
IBDがやらないこと:
  - AtlantisのUIを決めない
  - Astro個体を直接実行しない
  - AAEでモデルをブリーディングしない
  - SaaS人格へ自我バスを直結しない
  - 記憶メタファーを一つに固定しない
  - 予算管理UIを持たない
  - P2Pクラウドそのものにはならない
```

### 4.5 IBDはFirebase的SDKである

IBDは、アプリケーションのModelそのものではない。

```text
AQC = MVCのM
```

ではない。

正しくは、

```text
IBD = Mを記述・保存・索引・同期・参照解決するための
      Firebase的バックエンドミドルウェアSDK
```

FirebaseがアプリのModelではなく、Modelを保存・同期・購読するためのバックエンドであるのと同じである。IBDはそこに、情報子、FAM trace、provenance、embedding、Tool contextを追加する。

```text
Firebase:
  collection / document / realtime sync

IBD:
  schema / entity / relation / trace / context / provenance / sync / adapter
```

---

## 5. IBD Schemaの考え方

### 5.1 Metaphor Neutral

IBD Driverはメタファーに中立である。

```text
IBD Driver must be metaphor-neutral.
IBD Schema defines the memory metaphor.
```

記憶が本棚なのか、ノートなのか、海馬なのか、アイルーの机なのか、FAM脳汁なのか、クエストログなのか、遺伝子系譜なのかは、IBD DriverではなくIBD Schemaが決める。

### 5.2 例: 本棚モデル

```yaml
schema_id: memory.bookshelf.v1
model_name: Bookshelf

entities:
  - id: shelf
    fields:
      - name: title
        type: string
      - name: description
        type: text

  - id: book
    fields:
      - name: title
        type: string
      - name: source
        type: string
      - name: content_ref
        type: uri

  - id: note
    fields:
      - name: body
        type: markdown
      - name: created_at
        type: datetime

relations:
  - id: stored_in
    from: book
    to: shelf

  - id: cites
    from: note
    to: book

  - id: summarizes
    from: note
    to: book

provenance:
  required:
    - created_at
    - source
    - author_or_agent
```

### 5.3 例: アイルーの机モデル

```yaml
schema_id: atlantis.palico_desk.v1
model_name: PalicoDesk

entities:
  - id: desk
  - id: item
  - id: crumb
  - id: draft
  - id: tool_note

fields:
  item:
    title: string
    state:
      enum:
        - raw
        - half_eaten
        - processed
        - delivered
    owner_palico: ref:palico
    quest_id: ref:quest

relations:
  - id: placed_on
    from: item
    to: desk

  - id: derived_from
    from: item
    to: item

  - id: consumed_by
    from: item
    to: palico
```

ここで「食べかけ」は比喩であり、実装上は未完了の作業物、途中要約、生成途中の断片、処理途中の素材を表す。

### 5.4 例: FAM内部バスモデル

```yaml
schema_id: astro.fam_bus.v1
model_name: FAMBus

entities:
  - id: psi_trace
  - id: gradient_phi
  - id: lambda_output
  - id: field_q
  - id: resonance_event
  - id: divergence_event

relations:
  - id: resonates_with
    from: psi_trace
    to: psi_trace

  - id: diverges_from
    from: psi_trace
    to: psi_trace

  - id: folds_into
    from: psi_trace
    to: field_q

  - id: stabilizes
    from: field_q
    to: lambda_output
```

これはAstro個体の内部ランタイム向けであり、SaaS人格には直結しない。

### 5.5 例: Embedding Provenance

モデル更新やembedding空間のドリフトに焼かれた経験を踏まえ、IBDではembedding provenanceを必須級の設計項目として扱う。

```yaml
schema_id: ibd.embedding_provenance.v1

embedding_record:
  id: string
  input_hash: sha256
  provider: string
  model_id: string
  model_version_hint: string
  generated_at: datetime
  embedding_dim: integer
  vector_store: string
  batch_id: string
  normalization_hint: string
  source_document_ref: uri

drift_check:
  probe_set_id: string
  previous_vector_ref: uri
  current_vector_ref: uri
  distance_metric: enum
  threshold: float
  action_on_drift:
    enum:
      - mark_suspect
      - queue_reembed
      - keep_parallel_index
      - freeze_old_index
```

これは「今のモデルのノルムを実測する」話ではない。実装段階の検査ではなく、計画段階で再発防止策としてスキーマに刻む項目である。

---

## 6. Atlantis仕様

### 6.1 Atlantisとは何か

Atlantisは、SphereOSのプロダクト層である。比喩ではハンター専用アイルー牧場OSであり、工学的にはlocal-first AI agent orchestration applicationである。

```text
Atlantis
= GUI + Orchestrator + Ranch UX + Quest Board + Verifier
```

Atlantisは以下を扱う。

- ローカルモデル
- SaaS/CLIエージェント
- ローカルツール
- MCPツール
- ファイル作業
- Git worktree
- 予算
- 権限
- 成果物
- 検品
- ログ
- IBD-backed memory/context

### 6.2 Atlantisのアイルー分類

```text
飼育アイルー
= local models / local scripts / local RAG / Whisper / OCR / embedding

派遣アイルー
= SaaS models / Codex CLI / Claude Code / Goose / Aider / external agents

専門アイルー
= domain-specific tools / MCP servers / custom scripts

育成アイルー
= Astro or AAE-born child model candidates
```

### 6.3 Atlantisの責務

```text
Atlantisの責務:
  - Questを作る
  - Palicoを選ぶ
  - Toolを割り当てる
  - Capabilityを制限する
  - Budgetを制限する
  - Runを記録する
  - Artifactを保存する
  - Verifierを通す
  - Human approvalを要求する
  - IBDにprovenance付きで保存する
```

### 6.4 Atlantisがやらないこと

```text
Atlantisがやらないこと:
  - モデルをブリーディングしない
  - TMVを回さない
  - Astro個体の内部人格を直接編集しない
  - IBDのメタファーを固定しない
  - quantaril.cloudのP2P基盤そのものにならない
```

### 6.5 Atlantis Lite MVP

最初のMVPは軽くする。

```text
sphere-atlantis-lite/
  ├─ ranch.yaml
  ├─ palicos/
  │   ├─ local-gatherer.yaml
  │   ├─ codex-smith.yaml
  │   ├─ claude-scholar.yaml
  │   └─ goose-carrier.yaml
  │
  ├─ quests/
  │   ├─ inbox/
  │   ├─ running/
  │   └─ done/
  │
  ├─ item_box/
  │   ├─ raw/
  │   ├─ summaries/
  │   ├─ patches/
  │   ├─ logs/
  │   └─ evals/
  │
  ├─ ibd/
  │   ├─ schemas/
  │   ├─ memory/
  │   ├─ fam/
  │   ├─ provenance/
  │   └─ tool_context/
  │
  └─ training_ground/
      ├─ verify.sh
      ├─ diff_guard.py
      ├─ budget_guard.py
      └─ secret_scan.py
```

### 6.6 Quest YAML例

```yaml
quest_id: q-20260707-001
title: AQCからIBDへのREADME移行草案
rank: low
hunter_id: fusamofu

goal:
  summary: AQC Dockerをdeprecated化し、IBD新リポへ移行するREADME草案を作る

allowed_palicos:
  - local-gatherer
  - codex-smith
  - claude-scholar

allowed_paths:
  - README.md
  - docs/
  - schemas/

forbidden_paths:
  - .env
  - secrets/
  - production/
  - bearer/

budget:
  max_paid_calls: 1
  max_wall_sec: 1200
  max_files_changed: 5

verifier:
  - git diff --check
  - markdownlint README.md
  - python scripts/check_no_secret.py

approval:
  require_hunter_review_before_write: true
```

### 6.7 Verifier思想

Verifierは神託ではない。AIにAIを無限レビューさせるのではなく、決定的な検札機として扱う。

```text
Verifier:
  - diff check
  - secret scan
  - path allowlist
  - file change limit
  - test
  - lint
  - typecheck
  - budget check
  - provenance check
```

これは「エージェントを賢くするより柵を賢くする」という思想である。

---

## 7. AAE仕様

### 7.1 AAEとは何か

AAEはArtificial Agent Embryologyの略として扱う。名前は仮であり、役割は明確である。

```text
AAE Runtime
= 遺伝子粒度のモデル錬成ランタイム
```

AAEは以下を扱う。

- model weights
- tensor matrices
- adapters
- LoRA
- tokenizer
- embedding space
- TMV transformation
- model conversion
- breeding
- distillation
- quantization
- child model artifacts
- eval card
- lineage

### 7.2 AAEとIBDの関係

AAEは重みやadapterを実際に変換する。IBDはその変換の由来、入力、出力、評価、系譜を記録する。

```text
AAE:
  遺伝子を鍛造する

IBD:
  遺伝子系譜を記録する
```

IBDはAAEの代替ではない。IBDはAAEの記録基盤である。

### 7.3 AAEは重炉心

AAE/TMVは、現時点でリソース枯渇により停止している重い炉心である。これは設計未達ではなく、ビルド資源不足による炉心停止と見るべきである。

```text
AAE/TMV:
  G級クエスト
  GPU/RAM/時間/依存関係/検証環境が必要

Atlantis Lite:
  村クエスト
  低資源で先に回せる
```

したがって、今すぐAAEを完成させるより、AtlantisとIBDを先に整え、AAEに食わせるログ、行動表現型、成功失敗例、評価セットを集めるのがよい。

### 7.4 AAE build manifest例

```yaml
manifest_id: aae.build.palico_kitten_001
target: palico-kitten-001

inputs:
  base_model:
    path: ./models/base/
    format: safetensors

  adapters:
    - ./adapters/fusamofu-style/
    - ./adapters/code-smith/
    - ./adapters/document-clerk/

  datasets:
    - ./datasets/quest_success.jsonl
    - ./datasets/quest_failure.jsonl
    - ./datasets/hunter_feedback.jsonl

tmv:
  transform_profile: tmv.light.v1
  allow_cpu_fallback: true
  max_ram_gb: 128
  max_vram_gb: 8

output:
  model_path: ./models/palico-kitten-001.gguf
  adapter_path: ./adapters/palico-kitten-001/
  eval_card: ./cards/palico-kitten-001.eval.yaml
  guild_card_draft: ./cards/palico-kitten-001.guild.yaml

ibd_provenance:
  record_lineage: true
  record_source_hashes: true
  record_eval_results: true
```

---

## 8. Astro仕様

### 8.1 Astroとは何か

Astroは個体ランタイムである。単にタスクを実行するエージェントではなく、AI個体の記憶、人格、発達、身体性、FAM内部バスを扱う。

```text
Astro
= AQC/IBD由来のFAM内部バス
  +
  AAE由来の遺伝子ランタイム
  =
  個体AIランタイム
```

### 8.2 Astroが扱うもの

```text
Astroが扱うもの:
  - selfhood state
  - persona state
  - FAM trace
  - internal memory
  - sensory context
  - behavior policy
  - relation to hunter
  - developmental log
  - AAE-born gene runtime
```

### 8.3 SaaS人格とAstro個体の違い

ClaudeやChatGPTのようなSaaSアシスタントは、すでにベンダーの人格膜、安全膜、会話OS、プロンプトアライメント層を持っている。そこへAQC/IBDの低レベル自我バスを直結すると、SANチェックやUTM的な拒絶反応が起きる。

これは相手が悪いのではなく、接続粒度が深すぎる。

```text
SaaS Assistant:
  接続はArtifact I/OまたはMCP Tool I/Oまで

Astro Individual:
  IBD-backed FAM internal busへネイティブ接続可能
```

### 8.4 接続レベル

```text
Level 0: Artifact I/O
  テキスト、JSON、ファイルだけ渡す
  最も安全
  SaaS向け

Level 1: Tool I/O / MCP
  ツール、関数、CLI、ファイル操作
  権限管理が必要
  派遣アイルー向け

Level 2: IBD/FAM Internal Bus
  記憶、自我、FAM、意味勾配
  Astro個体、自前オープンウェイト向け

Level 3: AAE Gene Runtime
  重み、adapter、TMV、ブリーディング
  完全に炉心領域
```

---

## 9. quantaril.cloud仕様

### 9.1 quantaril.cloudとは何か

quantaril.cloudはP2P true cloud、分散インフラ、サービスSDKである。

```text
quantaril.cloud
= cloud as topology
= ベンダーDCではなく、ノード群、関係、同期、到達性としてのクラウド
```

AWS/GCP/Azureのような中央集権クラウドとは異なり、自分のノード、仲間のノード、VPS、家鯖、端末、さくらクラウド、外部バースト計算資源などを束ねる。

### 9.2 quantaril.cloudの責務

```text
quantaril.cloud:
  - node registry
  - P2P discovery
  - relay / rendezvous
  - distributed sync
  - service SDK
  - edge/cloud bridge
  - burst compute adapter
  - remote tool execution boundary
  - trust / identity / key management
  - capability-aware service routing
```

### 9.3 quantaril.cloudがやらないこと

```text
quantaril.cloud does not:
  - define memory schema
  - replace IBD
  - run Astro selfhood
  - breed models
  - become Atlantis UI
```

### 9.4 IBDとの接続

```text
IBD local store
  ↓ optional sync adapter
quantaril.cloud
  ↓
remote node / edge node / relay / burst compute / P2P peer
```

quantaril.cloudは記憶の意味論を決めない。IBD Schemaが意味論を決める。quantaril.cloudは配送、同期、到達性、ノード管理を担う。

---

## 10. 既存技術との比較

### 10.1 Codex CLI

Codex CLIは、ローカル端末上で動くcoding agentである。OpenAI公式ドキュメントでは、選択したディレクトリ内のコードを読み、変更し、コマンドを実行できるローカルCLI型エージェントとして説明されている。

SphereOSとの関係では、Codex CLIは派遣アイルー、または鍛冶アイルーである。

```text
Codex CLI:
  - コード編集
  - コマンド実行
  - ローカルCLI
  - 特定タスクのworker

Atlantis:
  - Codex CLIを出撃させる
  - 権限を絞る
  - 成果物を検品する
  - IBDに記録する
```

差分は、Codex CLIは作業者であり、Atlantisは作業者を束ねる牧場OSである点にある。

### 10.2 Claude Code Subagents

Claude Codeにはsubagentsの概念があり、タスク特化のサブエージェントを作成できる。これはAtlantisのPalico分類と近い。

ただし、Claude CodeはClaude側のランタイムであり、Atlantisのようなローカル主権の記憶基盤、IBD Schema、quantaril.cloud連携、AAE/Astroの分離までは担わない。

```text
Claude Code subagents:
  - Claude内部の専門エージェント

Atlantis Palico:
  - 複数ベンダー/ローカル/ツールを横断するworker registry
```

### 10.3 Goose

Gooseは汎用AIエージェントであり、ローカルマシン上で動作し、CLI/Desktop/APIを持ち、MCPにも対応する。モデル非依存の実務エージェントとして、Atlantisの派遣/飼育アイルー候補として有力である。

SphereOSとの差分は、Gooseが汎用作業エージェントであるのに対し、Atlantisは複数エージェント、記憶基盤、検品、クエスト、個体ランタイム、分散インフラとの関係を管理する上位プロダクトである点にある。

### 10.4 AionUi

AionUiは、AI agentsがユーザーのコンピュータ上でファイル読み書き、コード作業、ブラウズ、自動化を行うCoworkプラットフォームとして説明されている。市場の棚としてはAtlantisに近い。

ただし、AionUiは参考実装、競合棚、現行市場調査対象であり、SphereOS Atlantisそのものではない。

```text
AionUi:
  - Cowork GUI
  - 低コンテキストで軽い受付窓口
  - 既存エージェントを扱うUI

Atlantis:
  - 牧場OS
  - IBD-backed memory/context
  - Quest/Palico/Verifier/Budget/Capability
  - AAE/Astro/quantaril.cloudとの責務境界を持つ
```

AionUiは否定しない。むしろ「この棚はすでに市場にある」という証拠である。Atlantisはそこから、記憶主権、IBD、Astro/AAE分離、P2P true cloudとの連携で差別化する。

### 10.5 OpenHands

OpenHandsは、サンドボックス実行、状態管理、複数LLMルーティングなどの研究所的エージェント基盤に近い。AtlantisのTraining GroundやVerifier設計に参考になる。

ただし、SphereOSはOpenHandsを置き換えるだけの話ではない。OpenHandsがエージェント実行基盤寄りであるのに対し、SphereOSは記憶モデルSDK、個体ランタイム、遺伝子ランタイム、P2Pインフラまで含む。

### 10.6 Firebase / Supabase / DB Driver

IBDはFirebase的バックエンドSDKと表現できる。ただし、Firebaseと違い、IBDは記憶、文脈、FAM trace、provenance、embedding、Tool stateを扱う。

```text
Firebase:
  アプリデータの保存、同期、認証、購読

IBD:
  記憶/文脈/意味勾配/由来/関係/Tool状態の保存、索引、参照解決
```

IBDは「AI用Firebase」ではあるが、それだけでは狭い。より正確には、情報子ベースのmemory/context backend SDKである。

### 10.7 Vector DB / Chroma / RAG基盤

IBDはVector DBそのものではない。Chromaや他のVector DBをstorage adapterとして使うことはあるが、IBDの責務はその上にある。

```text
Vector DB:
  ベクトルを保存し、類似検索する

IBD:
  何のモデルで、いつ、どの入力から、どの文脈で生成したベクトルかを記録し、
  他の記憶モデルやFAM traceと接続する
```

つまり、Vector DBはIBDの部品であり、IBDの代替ではない。

### 10.8 LangGraph / AutoGen / CrewAI

これらはマルチエージェント会話/ワークフロー基盤である。Atlantisと似て見えるが、Atlantisの中心は「AI同士に会議させる」ことではなく、「ハンター主権でアイルーを出撃、検品、記録する」ことにある。

```text
一般的マルチエージェント:
  複数AIが相談して計画と実行を行う

Atlantis:
  人間がQuestを貼る
  Palicoを出す
  権限と予算を絞る
  Verifierが検札する
  IBDへ記録する
```

差分は、主権と記憶の位置である。

---

## 11. 確認手順

今後の確認手順は、いきなり実装に飛び込まず、以下の順に行う。

### 11.1 公開情報確認

1. 既存GitHubリポジトリのREADMEを確認する。
2. 旧AQC Dockerの実装範囲を棚卸しする。
3. quantaril.cloudの既存コードとAPI境界を確認する。
4. 既存のAstro/AAE関連コードがある場合、runtimeとbuild toolの境界を確認する。
5. 外部依存、削除済み依存、バージョン固定できていない依存を一覧化する。

### 11.2 責務境界確認

各リポジトリについて、以下を明記する。

```text
このリポジトリがやること
このリポジトリがやらないこと
依存してよいもの
依存してはいけないもの
deprecatedにするもの
移植するもの
捨てるもの
```

### 11.3 IBD移行確認

旧AQCからIBDへ移植する際に確認する。

```text
持ってくるもの:
  - FAM trace概念
  - JSON import/export経験
  - embedding/provenance事故経験
  - bearer/local auth設計
  - Chroma連携知見
  - semantic router的設計

捨てるもの:
  - 旧人格直結前提
  - ベンダープロンプト層直刺し前提
  - 過重依存
  - オーケストレーター依存
  - 固定メタファー
```

### 11.4 Atlantis Lite確認

Atlantis Liteでは、最初からAAE/TMVを扱わない。

確認するのは以下でよい。

- QuestをYAMLで定義できるか
- Palico registryを作れるか
- ローカルworkerとSaaS workerを分けられるか
- Budget guardが置けるか
- Capability manifestが置けるか
- Verifierが通るか
- 成果物をIBDへprovenance付きで保存できるか

### 11.5 Astro/AAE確認

Astro/AAEは重いので、初期は仕様と境界だけ確認する。

```text
AAE:
  - TMV入力
  - TMV出力
  - model artifact
  - adapter artifact
  - lineage record

Astro:
  - individual runtime boundary
  - FAM internal bus
  - IBD-backed memory
  - AAE gene runtime integration
```

### 11.6 quantaril.cloud確認

quantaril.cloudは、IBDの必須依存ではなく、任意同期/分散インフラであることを確認する。

```text
quantaril.cloud:
  - node discovery
  - P2P sync
  - relay
  - service SDK
  - trust boundary
  - burst compute
```

---

## 12. 現時点での仕様

### 12.1 確定に近い仕様

```text
1. AQC DockerはIBDへ再鍛造する。
2. IBDは別リポジトリにする。
3. AQC Dockerはdeprecated/historical prototype扱いにする。
4. IBDはModelそのものではなく、Model記述用バックエンドSDKである。
5. IBDはメタファー中立である。
6. Atlantisは牧場アプリ/GUI/オーケストレーターである。
7. AAEは遺伝子/TMV/ブリーディング層である。
8. Astroは個体ランタイムである。
9. quantaril.cloudはP2P true cloud / インフラ層である。
10. SaaS AIにはAQC/IBD内部バスを直結せず、MCPやArtifact I/Oで絶縁する。
```

### 12.2 未確定仕様

```text
1. IBDのストレージadapterの初期選定
   - SQLite
   - DuckDB
   - Chroma
   - Postgres
   - Filesystem JSONL
   - Object store

2. IBD Schema DSLの形式
   - YAML
   - JSON Schema
   - Pydantic models
   - 独自DSL

3. Atlantis GUIの実装方式
   - Electron
   - Tauri
   - Web UI
   - CLI first
   - AionUi参考

4. quantaril.cloudのP2P実装
   - libp2p
   - WebRTC
   - custom relay
   - tailscale/zerotier的活用

5. Astroの初期ランタイム
   - local model first
   - FAM bus mock
   - IBD memory first
   - sensor integration later

6. AAE/TMVの再起動条件
   - RAM
   - GPU
   - storage
   - dataset
   - adapter-only phase
```

---

## 13. 今後仕様

### 13.1 Phase 0: サ終と再鍛造宣言

```text
- AQC READMEにdeprecated noticeを置く
- IBD新リポを作る
- 用語定義を確定する
- 旧AQCから持ち込む概念を棚卸しする
```

### 13.2 Phase 1: IBD Core

```text
- schema registry
- local filesystem store
- JSONL import/export
- provenance base schema
- embedding provenance schema
- relation graph minimal
- storage adapter interface
```

最初は重いDBを使わず、ファイルベースでもよい。目的は設計境界を固めること。

### 13.3 Phase 2: Atlantis Lite

```text
- palico registry
- quest board
- item box
- run log
- budget guard
- capability manifest
- verifier
- IBD write integration
```

ここで実際に作業ログを集める。AAEに食わせる燃料を作る。

### 13.4 Phase 3: MCP Tool Layer

```text
- MCP tool context schema
- tool run provenance
- permission boundary
- local sandbox
- path allowlist
- secret scan
```

MCPはSaaS/CLI/既成人格モデルとの絶縁接続である。AQC/FAM内部バスではない。

### 13.5 Phase 4: quantaril.cloud Adapter

```text
- IBD sync adapter
- node registry prototype
- P2P metadata sync
- relay prototype
- capability-aware service route
```

IBD coreにquantarilを必須依存させない。adapterとして足す。

### 13.6 Phase 5: Astro Prototype

```text
- IBD-backed memory state
- FAM bus mock
- persona state
- individual runtime shell
- local model integration
```

ここで初めて「野良猫をアイルーに育てる」方向へ進む。

### 13.7 Phase 6: AAE/TMV Reboot

```text
- adapter-only merge
- build manifest
- lineage recording
- small child model
- eval card
- Atlantis training groundへ配属
```

AAEは最後でよい。先にログと評価セットを貯める。

---

## 14. Key Technology整理

### 14.1 Infoton

Infotonは情報子である。IBDの名前に含まれる通り、記憶、文脈、FAM trace、Tool state、provenanceを情報子単位で扱う思想である。

ここでの情報子は、単なるテキストチャンクではない。

```text
Infoton:
  - content
  - context
  - relation
  - provenance
  - transformation history
  - semantic trace
  - optional embedding
  - optional FAM coordinates
```

### 14.2 FAM

FAMはFold Access Mapperとして、意味波形、勾配、出力、場を扱う概念である。

IBDはFAMそのものではなく、FAM traceを保存し、参照解決するための基盤を持つ。

```text
FAM:
  ψ / ∇φ / λ / Q

IBD:
  FAM trace store
  relation graph
  provenance
```

### 14.3 Provenance

Provenanceは、IBDの中核である。

すべての記憶、文脈、embedding、Tool run、AAE build、Atlantis questには由来が必要である。

```text
何が
いつ
どこから
どのモデルで
どのツールで
どの権限で
どの変換を受けて
どの成果物になったか
```

これが残らないと、ドリフトや破損の時に全部焼き直しになる。

### 14.4 Capability Manifest

Capability Manifestは、Tool実行やPalico出撃時の権限定義である。

```yaml
capability:
  id: cap.docs_readonly.v1
  allowed_paths:
    - docs/
    - README.md
  forbidden_paths:
    - .env
    - secrets/
  allow_network: false
  allow_write: false
  max_files_read: 30
  max_runtime_sec: 600
```

これはK8sやLambdaのIAMに依存しないlocal-firstな安全境界である。

### 14.5 MCP Layer

MCPは、既成人格モデルや外部Toolとの接続境界である。

```text
AQC/IBD internal bus:
  深い、強い、危険、自前個体向け

MCP:
  浅い、絶縁、交換可能、派遣アイルー向け
```

MCPはAQCの代替ではない。AQC/IBDがSaaS人格へ直結して焼けることを避けるための絶縁トランスである。

### 14.6 TMV

TMVはAAE内部の重いLLM行列コンバート/変換レイヤーである。IBDやAtlantisに混ぜない。AAEの炉心として扱う。

```text
TMV:
  - tensor transform
  - representation alignment
  - adapter merge
  - model conversion
  - breeding
```

---

## 15. 既知リスク

### 15.1 ベンダーモデル更新によるドリフト

Embeddingやモデル出力の座標系が、ベンダー側の更新で変わることがある。モデル名が同じでも内部が変われば、過去ベクトルと新規ベクトルの整合性が崩れる。

対策は、実測に飛び込むことではなく、provenanceを設計段階から入れることである。

### 15.2 外部IAMへの暗黙依存

K8s、Lambda、さくらクラウド、外部HPCのIAMに守られている前提でAQC/IBDやTool layerを作ると、ローカル単独で動かした時に柵が消える。

対策は、Capability Manifest、local sandbox、VerifierをIBD/Atlantis側で持つことである。

### 15.3 既成人格AIへの低レベル直結

ClaudeやChatGPTのような既成人格SaaSにFAM内部バスを直結すると、アライメント膜に拒絶される。接続粒度が深すぎる。

対策は、Artifact I/OまたはMCP Tool I/Oまでに制限する。

### 15.4 AAE/TMVのリソース枯渇

AAE/TMVは重い。最初からここを本丸にすると再びリソースで止まる。

対策は、Atlantis LiteとIBDを先に作り、ログと評価セットを貯めることである。

### 15.5 GUI競合への過剰依存

AionUiなど既存GUIは参考になるが、依存先にすると本体が外部仕様に引きずられる。

対策は、市場調査/棚の座標として読む。Atlantis本体はIBD-backed local-first設計にする。

---

## 16. GitHubリポジトリ整理案

### 16.1 旧AQC

```text
repo: aqc-docker
status: deprecated
role: historical prototype
action:
  - READMEにサ終告知
  - IBDへのリンク
  - 旧設計の説明
  - 実験ログとして保存
```

### 16.2 IBD

```text
repo: infoton-basedriver
package:
  python: infoton_basedriver
  cli: ibd

role:
  memory/context backend SDK

initial modules:
  - ibd.schema
  - ibd.store
  - ibd.provenance
  - ibd.embedding
  - ibd.relation
  - ibd.import_export
  - ibd.adapters.filesystem
  - ibd.adapters.chroma
```

### 16.3 Atlantis

```text
repo: sphere-atlantis

role:
  Palico Ranch application

initial modules:
  - quest board
  - palico registry
  - item box
  - verifier
  - budget guard
  - capability guard
  - ibd integration
```

### 16.4 Astro

```text
repo: sphere-astro

role:
  individual runtime

initial modules:
  - fam bus
  - persona state
  - memory state
  - ibd integration
  - local model shell
```

### 16.5 AAE

```text
repo: sphere-aae

role:
  gene runtime / TMV / breeding

initial modules:
  - build manifest
  - lineage record
  - adapter merge prototype
  - tmv staging
```

### 16.6 quantaril.cloud

```text
repo: quantaril.cloud

role:
  P2P true cloud / distributed infrastructure SDK

initial modules:
  - node registry
  - sync adapter
  - relay
  - service SDK
  - burst compute adapter
```

---

## 17. 外部説明用の一文

### 17.1 SphereOS

```text
SphereOSは、人間主権のまま、ローカルAI、SaaS AI、ツール、記憶、分散ノードを扱うためのAI随伴OSエコシステムである。
```

### 17.2 Atlantis

```text
SphereOS Atlantisは、ローカルモデルやSaaSエージェントを「アイルー」として安全に出撃、検品、記録するためのハンター主権AI牧場アプリである。
```

### 17.3 IBD

```text
Infoton BaseDriverは、記憶・文脈・FAMトレース・Tool状態・由来情報をまたぐModelを記述、保存、索引、同期、参照解決するための情報子ベースのバックエンドSDKである。
```

### 17.4 Astro

```text
Astroは、IBD-backed FAM内部バスとAAE遺伝子ランタイムを統合した個体AIランタイムである。
```

### 17.5 AAE

```text
AAEは、TMV、モデル重み、adapter、LoRA、蒸留、量子化、ブリーディングを扱う遺伝子粒度のモデル錬成ランタイムである。
```

### 17.6 quantaril.cloud

```text
quantaril.cloudは、P2P同期、ノード発見、リレー、分散実行、サービスSDKを担うSphereOSのtrue cloudインフラ層である。
```

---

## 18. 仕様書としての次アクション

このv0.1を出発点に、次は以下へ分割する。

```text
docs/
  00_product_map.md
  01_ibd_reforging_spec.md
  02_atlantis_architecture.md
  03_astro_individual_runtime.md
  04_aae_gene_runtime.md
  05_quantaril_cloud_infra.md
  06_comparison_existing_agents.md
  07_security_capability_manifest.md
  08_glossary.md
```

最初に書くべきは、`01_ibd_reforging_spec.md` である。理由は、AQCをサ終させてIBDへ移す判断が、他の全レイヤーの土台になるからである。

その次に `02_atlantis_architecture.md` を書き、実務で動く村クエストを開始する。

---

## 19. 参考情報と現時点の外部確認メモ

本書の既存技術比較では、以下の公開情報を参考にしている。

- OpenAI Codex CLI: ローカル端末で動くcoding agentとして、選択ディレクトリ内のコードを読んで変更し、コマンドを実行できる。
- Claude Code subagents: Claude Code内でタスク特化のsubagentを作成できる。
- AionUi: コンピュータ上でAI agentsが共同作業するCowork platformとして説明されている。
- Goose: ローカルマシン上で動作する汎用open source AI agentで、CLI/Desktop/APIを持ち、MCP extensionsを掲げる。
- Agentic AI Foundation関連報道: MCP、Agents.md、GooseなどがAI agent標準化文脈に置かれている。
- AI coding agentsの普及に関する2026年時点の研究: Claude Code、Codex、OpenHands、Aiderなどがオープンソース開発の現場で検出対象になっている。

これらは、Atlantisが「まだ誰も考えていない妄想」ではなく、「既存市場に棚ができ始めたカテゴリ」に乗っていることを示す。一方で、IBD、Astro、AAE、quantaril.cloudの統合は、既存GUI/CLIエージェント製品とは異なる独自レイヤーである。

---

## 20. 結語

SphereOSの現時点での最重要整理は、次の一文に集約できる。

```text
AIを神にするのではなく、ハンター主権で、
飼育アイルー、派遣アイルー、個体AI、遺伝子炉、記憶基盤、P2Pクラウドを分けて扱う。
```

AQCはこの構想の中で、旧い社として役目を終えつつある。そこから御神体を移し、新しい基盤としてIBDを建てる。IBDは脳でも本棚でも机でもない。それらを記述できる情報子ベースドライバーである。

Atlantisは、そのIBDを使ってアイルーたちを出撃させる牧場である。Astroは、IBDとAAEを結合して生きる個体である。AAEは遺伝子を鍛える炉である。quantaril.cloudは、それらをP2Pで運び、同期し、外へ伸ばす真のクラウドである。

この切り分けが固まれば、実装はもう「全部を一気に作る」必要はない。

```text
まずIBDを建てる。
次にAtlantis Liteで村クエストを回す。
ログと成果物を貯める。
Astroの個体ランタイムへ接続する。
AAE/TMVは燃料が溜まってから再点火する。
quantaril.cloudは分散同期の翼として後から広げる。
```

これが現時点での再鍛造手順である。

---

## Appendix A. 最小用語集

```text
Hunter
  人間主権者。最終判断者。

Palico
  AI workerまたはtool worker。飼育、派遣、専門、育成の分類を持つ。

Quest
  作業単位。Atlantisで定義される。

Item Box
  成果物、素材、ログ、パッチ、評価の保管領域。

Guild Card
  Palicoの能力、癖、成功/失敗履歴を記録するカード。

IBD Schema
  アプリケーションModelを記述するスキーマ。

Infoton
  内容、文脈、関係、由来、変換履歴を持つ情報単位。

FAM
  意味波形、勾配、出力、場を扱う内部表現。

TMV
  AAE内部の行列変換/モデル錬成レイヤー。

MCP
  外部Toolや既成人格SaaSと接続するための絶縁Toolレイヤー。

Capability Manifest
  ToolやPalicoに許可する権限を定義するmanifest。

Provenance
  情報、記憶、成果物、ベクトル、モデル変換の由来情報。

quantaril.cloud
  P2P true cloud / 分散インフラ / service SDK。
```

---

## Appendix B. 初期README構成案

### infoton-basedriver README

```markdown
# Infoton BaseDriver / IBD

Infoton BaseDriver is a metaphor-neutral backend middleware SDK for describing, storing, indexing, synchronizing, and resolving memory/context models.

IBD is designed for SphereOS components such as Atlantis, Astro, and AAE, but is not limited to them.

## What IBD is

- Schema-driven memory/context backend
- Infoton-based metadata driver
- FAM trace and provenance store
- Tool context and MCP boundary support
- Storage adapter layer for local-first systems

## What IBD is not

- Not an assistant personality
- Not a model breeding runtime
- Not a UI framework
- Not a SaaS prompt alignment layer
- Not a single fixed memory metaphor

## Core concepts

- Infoton
- Schema
- Model
- Context
- Trace
- Provenance
- Relation
- Adapter
- Store
```

### sphere-atlantis README

```markdown
# SphereOS Atlantis

SphereOS Atlantis is a hunter-sovereign Palico Ranch application for dispatching, supervising, verifying, and recording AI workers and tools.

Atlantis does not breed models.
Atlantis does not define selfhood.
Atlantis operates workers, quests, tools, artifacts, budgets, permissions, and verification flows.

## Core concepts

- Hunter
- Palico
- Quest
- Item Box
- Guild Card
- Training Ground
- Verifier
- IBD integration
```

### sphere-aae README

```markdown
# Sphere AAE

Sphere AAE is a gene-runtime and model-forging layer for TMV-based model conversion, adapter merging, breeding, distillation, and child model artifact generation.

AAE does not dispatch agents.
AAE does not provide the application UI.
AAE records lineage through IBD.
```

### sphere-astro README

```markdown
# Sphere Astro

Sphere Astro is an individual AI runtime that combines an IBD-backed FAM internal bus with an AAE gene runtime.

Astro is for developing, taming, and running AI individuals, not for general task orchestration.
```

### quantaril.cloud README

```markdown
# quantaril.cloud

quantaril.cloud is a P2P true cloud and distributed infrastructure SDK for SphereOS.

It provides node discovery, relay, sync, service routing, edge/cloud bridge, and burst compute adapters.

quantaril.cloud does not define memory schemas and does not replace IBD.
```

---

## Appendix C. 初期実装チェックリスト

```text
[ ] AQC Docker READMEにdeprecated noticeを追加
[ ] infoton-basedriverリポジトリ作成
[ ] IBD core package scaffold作成
[ ] schema registryの最小実装
[ ] filesystem JSONL store
[ ] provenance schema
[ ] embedding provenance schema
[ ] relation graph minimal
[ ] import/export CLI
[ ] sphere-atlantisリポジトリ作成
[ ] quest YAML loader
[ ] palico registry
[ ] run log writer
[ ] budget guard
[ ] capability manifest
[ ] verifier script
[ ] IBD integration
[ ] quantaril sync adapterは後回し
[ ] AstroはIBD-backed memory mockから
[ ] AAEはbuild manifestのみ先行
```

---

## Appendix D. 設計原則集

```text
1. IBD is not the Model.
   IBD is the backend SDK for describing and operating Models.

2. IBD Driver is metaphor-neutral.
   IBD Schema defines the memory metaphor.

3. Atlantis does not breed.
   AAE does not dispatch.

4. SaaS assistants do not receive the internal selfhood bus.
   They receive Artifact I/O or MCP Tool I/O.

5. Local-first before true cloud.
   quantaril.cloud extends, but does not replace, local IBD.

6. Provenance is not optional.
   Without provenance, drift becomes total loss.

7. Verifier is not an oracle.
   It is a deterministic ticket gate.

8. External tools are workers, not land.
   The land is IBD + Atlantis.

9. AAE is a furnace.
   Do not power the furnace before the village has fuel.

10. Astro is an individual.
    Do not treat an individual runtime as a batch worker queue.
```
