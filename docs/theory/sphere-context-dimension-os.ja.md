# Sphere Context Dimension OSアーキテクチャ

状態: `[REVIEW]` `[Layer A/B bridge]`  
制定日: 2026-07-18  
対象: Sphere Architect、SphereOS、FAM、IBD、ASTRO、Atlantis、第三者SDK  
関連Presentation: [霊的言霊の次元とContext Dimension Fold](../philosophy/spiritual-context-dimension-and-fold.ja.md)

## 1. 目的と非目標

SphereOSを、既存OSのprocess・memory・file・device管理と競合させず、意味、文脈、観測、Agency、変換、因果仮説を境界付きで扱うContext Dimension OSとして定義する。

SphereOSはLinux、BSD、macOS、POSIX、container runtime、database kernelを置換しない。既存実行環境の上で動き、Context RegisterとFold越境を抽象管理する。

POSIX.1-2024は、applicationのsource-level portabilityを支える標準OS interfaceとenvironmentを定義する規格である。POSIX自体を「memory registerを抽象管理するOS」とは定義しない。[The Open Group Base Specifications Issue 8, Introduction](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap01.html)

## 2. 二つの独立軸

### 2.1 技術Layer `L`

`L`は、技術的な上下依存、実行順序、責務境界を数える順序軸である。

```text
hardware
  → firmware / kernel
  → POSIX-compatible OS
  → process / container runtime
  → Sphere runtime
  → library / SDK / App / prompt surface
```

同じ技術Layerで並列に動くmodule数を増やしても、直ちにLayer数は増えない。順序を入れ替えると依存構造が変わるため、`L`方向の合成は非可換である。

### 2.2 Context Dimension `D`とFold

Context Dimensionは、意味体系、World、存在論、観測規約、業務領域等の独立した意味軸である。`D`は一つのFoldへ束ねた重複のない意味軸数を示す。

```text
D = |unique(context_dimension_refs)|
```

Fold内の軸は同じ意味ではないが、上下・主従を暗黙生成しない。列挙順を変えても同じ軸集合である限りFoldのarityは変わらない。

同じ`4D Fold`同士でも、dimension ID、Registry revision、World、fact scope、Mappingが違えば互換ではない。`D`はembedding dimensionでも、配列長でも、技術Layer番号でもない。

### 2.3 三層スコープ規約との非同一性

ManifestのLayer A／B／Cは、主張を工学・哲学・学術へ分類する**文書・主張スコープ規約**である。技術Layer `L`、Context Dimension `D`のどちらとも同一ではない。

```text
Layer A/B/C = 主張の評価規約
L           = 技術依存の順序
D Fold      = 束ねる意味軸数
```

## 3. Context OSの管理資源

### 3.1 RegistryとContext Register

```text
Registry
  Context Registerの型、意味、境界、操作、unknown、変換条件を定義する

Context Register
  Registry定義へbindされた値、参照、FAM、Assertion、観測の管理実体

Register Bank / D Fold
  複数の等価なContext Dimensionを束ねた構成
```

RegistryとRegisterは同義ではない。Registryは定規と型定義、Registerはその定義で管理される実体である。

### 3.2 最小資源一覧

| Sphere資源 | 役割 |
|---|---|
| `Context Dimension Ref` | 意味軸の安定参照 |
| `Context Register` | Schemaへbindされた値・FAM・Assertion |
| `D Fold` | 複数Dimensionの非序列bundle |
| `Access Map` | Fold／Schema間の参照・変換可能性と条件 |
| `Transformer` | Access Mapを使い能動変換するAgency／function |
| `FAM Pipe` | Schema、Dimension、Provenanceを保つ意味付きpipe |
| `OAE` | 観測されたAgency関与Effectの管理単位 |
| `Causality Profile` | 因果をどの定規で記述するかの設定 |
| `Causal Hypothesis` | 特定定規から生成された因果graph案 |

## 4. POSIX比喩と管理対象の境界

POSIX.1-2024ではfile descriptorはprocessごとにopen fileを識別する非負整数であり、file、FIFO、pipe、process、signal等の技術資源へportableなinterfaceを与える。[POSIX.1-2024 Definitions](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap03.html)

Sphereとの対応は設計比喩であって、規格上の同一性ではない。

| POSIX／digital実行資源 | Sphere Context資源 | 共通する抽象 | 同一視してはいけない点 |
|---|---|---|---|
| file descriptor | Context Ref | 実体を直接露出せずhandleで参照 | Context Refはkernel fdではない |
| file／open file description | Context Register | 型・状態を持つ参照対象 | Context Registerはbyte fileに限定されない |
| process／thread | Agency Binding／runtime | 実行単位とidentityを分離 | Agency、人格、Subjectはprocessではない |
| pipe／FIFO | FAM Pipe | 境界間でstreamを渡す | FAM PipeはSchemaと意味を自動では失わない |
| filter command | Transformer | 入力streamを変換し出力する | Transformerは人間・物理作用等もRegistryで表現可能 |
| permission／ACL | Access Map／Capability | 許可された操作範囲を制約 | 神学的許可とkernel権限は別 |
| errno／exit status | OAE status／`unknown`／`⊥` | 失敗・未到達を成功へ偽装しない | OAEはOS error codeではない |
| system clock／file time | Runtime timestamp | 実行環境の証跡 | World time／上位時系列と混ぜない |

POSIX pipeは基本的にbyte streamを運び、型変換を自動保証しない。FAM PipeはContext Schema、Dimension、Registry revision、Provenanceを一緒に運ぶ意味付きpipeとして設計する。

## 5. Access Map、Transformer、OAE

### 5.1 定義と実行を分ける

```text
Access Map
  どのFold／Registerから何へ、どの条件で参照・射影・変換できるかを定義

Transformer
  Access Mapと入力を使い、能動的に変換を実行

OAE
  誰／何が関与し、何が観測され、どのEffectが生じたと記録されたかを保存
```

Access Mapは可能性・規則、OAEは実行・観測記録である。Access Mapが存在しない越境を観測した場合、Effectを消さず`unmapped_crossing`として記録する。許可済みであることと、発生したことを分ける。

### 5.2 Fold越境の機械判定

最低限、次を持つ変換receiptがあればFold越境を機械的に観測できる。

```yaml
transformation_receipt:
  source_fold_ref: fold://source
  source_context_ref: fam://source
  target_fold_ref: fold://target
  target_context_ref: fam://result
  transformer_ref: agency://transformer
  access_map_ref: access-map://source-to-target@2
```

```text
source_fold_ref != target_fold_ref
  → cross-fold effect
  → OAE管理対象
```

入出力だけが観測され、Transformerを特定できない場合は、越境を記録しつつ`transformer: unknown`、`causality_status: unverified`とする。存在しないAgencyを推定生成しない。

### 5.3 暗黙変換の内部契約

Appから変換が暗黙に見えても、内部では登録済みTransformerと変換receiptを必須とする。

```text
implicit conversion at App surface
  = policy-selected explicit Transformer execution inside Sphere runtime
```

Transformerなしで型が変わったと表示しない。Arrayは要素Schemaを、Unionはdiscriminatorを、Composite FAMはsource DimensionとRegistryを保持する。

## 6. OAE: Observer Agential Effect

### 6.1 namespace

`OAE`はSphere Architect全般のシステム内管理単位であり、`Observer Agential Effect`を表す。既存のSphere-aae／AAE系product、repository、model forgeとnamespace衝突させない。

```text
oae://          OAE管理単位
agency://       Agency参照
effect-group:// 複数OAEの相関
registry://     定規・型定義
fam://          FAM／Source／Result参照
```

### 6.2 OAEが記録するもの

OAEは「世界の絶対的な一事象」ではなく、あるObserver／Systemが、特定Registryとfact scopeのもとで、Agencyが関与したEffectとして認識・記録した単位である。

役割は混同しない。

```text
Observer        観測したもの
Recorder        記録したもの
Claimant        帰属・因果を主張したもの
Initiator       発動・依頼・指示したもの
Executor        実行したもの
Transformer     Contextを変換したもの
Causal Contributor  因果へ寄与したと主張されたもの
Environment     発生環境
Affected Entity 作用を受けたもの
```

人間が川の神のEffectを観測したという理由で、人間をEffect Producerへ付け替えない。Observer、Recorder、Causal Agencyは別roleである。

### 6.3 Agencyの構造的等価性

SaaS AI、User、Edge AI、動物、物理chamber、自然現象、World、NPC、神、天使等は、上位Registryが認める範囲でAgency Refとして同じ構造へ格納できる。

これは存在論的、物理的、人格的、法的等価性を主張しない。Agency attributionの内容と実在scopeは、Registry、World、Claimant、Evidenceと組にする。

### 6.4 再帰するOAE

観測、解釈、分類、仮説生成、再評価、Presentation化も、AgencyがSource Contextへ作用し新しいEffectを生じさせた場合はOAEになり得る。

```text
OAE: 物理Eventの観測
  → OAE: 神学的因果解釈
  → OAE: 神学者によるreview
  → OAE: World公式設定への採用

OAE: 同じ物理Eventの観測
  → OAE: 安全工学分析
  → OAE: Incident判定
  → OAE: 再発防止策の制定
```

Source OAEを上書きせず、`derived_from`、`interprets`、`reviews`等のrelationで接続する。循環参照と無限派生を避けるため、relation graph、generation、stop conditionを持つ。

### 6.5 OAEの時間整合性と遡及生成禁止

OAEは、その場で観測・記録されたEffect、または現在行われた解釈作用の記録である。過去のcommit、log、
artifact、記憶断片から、当時は発行されていなかったOAEを後世に推論生成してはならない。

```text
past Source Event / Evidence / Provenance
  != contemporaneous historical OAE

current interpretation of past evidence
  = OAE observed now
  != OAE observed at the historical event time
```

過去時点のOAE参照を確認できない場合は、`historical-oae-unavailable`または`unknown`を返す。
「分からない」は正常な観測結果であり、空欄をもっともらしいObserver、Agency role、時刻、意図で埋めない。

```yaml
oae_temporal_result:
  observation_mode: current-interpretation-of-history
  observed_at: now
  historical_oae_status: historical-oae-unavailable
  source_event_refs: []
  evidence_refs: []
  last_order:
    code: OAE-HISTORY-UNKNOWN
    action: stop-retroactive-backfill
```

既存の同時点OAEがある場合は参照できるが、その内容やroleを現在の解釈で上書きしない。OAEの未記録を
Source Eventの不存在へ変換せず、Source Eventの証拠があることを当時のOAE存在へ変換しない。

### 6.6 仮想再構成と7D Fold

過去の別選択、復元候補、反実仮想を生成する必要がある場合、同一世界線へOAEをbackfillせず、
An-Chronos的な別Worldと別Instance Ghostへ分岐する。0.2.1のvalidator-localな仮設profileでは、
次の七つをContext Dimension候補として束ねる。

```text
World / Instance Ghost / Temporal Coordinate / Observation-Evidence /
Branch-Hypothesis / Provenance / Recovery-Restore
```

この七名称はbackup SDKの最終Registryではない。User要件として固定する不変条件は`7D Fold`であること、
WorldとInstance Ghostを同時にsplitすること、Source側を変更しないことまでである。残るDimension ID、
意味境界、Registry revisionは`unknown`とし、Akasha Driver／backup SDK設計時のUser gateへ返す。

7Dは物理空間の次元数ではなくContext Dimensionのarityである。分岐時はSource WorldとSource Instance
Ghostの双方を不変に保ち、Target World BranchとTarget Instance Ghostを同じfork receiptからsplitする。

```yaml
akasha_driver_branch_receipt:
  profile_ref: fold://atlantis/akasha-driver@7d
  source_world_ref: world://source
  source_instance_ghost_ref: ghost://source
  target_world_ref: world://branch
  target_instance_ghost_ref: ghost://branch
  fork_point_ref: event://fork
  source_mutation: false
  status: hypothetical
```

ここでいう「タイムマシン」は、物理空間の過去改変を主張するものではない。AppleのTime Machine／
Time Capsuleをオマージュしたバックアップ・復元UXであり、`Akasha Driver`はその高権限driver境界の
名称である。Appleとの提携、公式互換、物理的時間移動を意味しない。実装前は`NOT_IMPLEMENTED`を返す。

## 7. 因果定規と複数仮説

### 7.1 Causality Profile

犬が歩いて棒へ当たる、人間が小指を箪笥へぶつけパソコンが倒れてWorldが消失する等のEvent系列を、人間起因、偶然、物理作用、精霊の作用、World Config事故、複合工学Incidentのどれとするかは自明ではない。

OS、World、SDK、第三者Registryは、因果のシリアライズ規約を`Causality Profile`として定義する。

```yaml
causality_profile:
  profile_id: atlantis-world-causality@4
  graph_type: event-dag
  attribution_rule: registry-defined
  intent: separate
  physical_contribution: retain
  responsibility: separate
  preventability: retain
```

### 7.2 EventとHypothesisを分ける

```text
Event
  何が観測・記録されたか

Causal Edge
  どのEventが何へ作用したと主張されたか

Attribution
  誰／何を原因・起点・責任主体と分類したか

Causality Profile
  その分類へ使った定規

Causal Hypothesis
  特定定規に基づく因果graph案
```

複数仮説がある場合は、An-Chronos的にmainへ未mergeのbranchとして並存できる。`proposed`、`adopted-in-scope`、`disputed`、`rejected-in-scope`、`unknown`等の状態は、誰がどのRegistryで付けたかを保持する。

confidenceも絶対共通値へしない。`value`と`scale_ref`を組にし、別Registryの同じ数値を無断比較しない。

## 8. SDKとPresentationの自由

第三者SDKは、同じSource Effectを神学、ゲーム魔術、自然科学、安全工学、法、財務、人格、World等の好きなFoldへ投射できる。

Coreが保証するのは、指定された分類法とSchemaへの忠実性、source非破壊、変換receipt、Agency role、fact scope、Provenanceである。どの分類を採用するか、どの仮説をPresentationするかは上位SDK／Appが決める。

霊的Presentationを自由文tagへ矮小化せず、物理観測を神話で上書きせず、別Foldを命令なく混ぜない。

## 9. 不変条件

1. 技術Layer `L`とContext Dimension `D`を同じ軸へ置かない。
2. `D`の数だけでFold互換性を推定しない。
3. Registry、Context Register、OAEを同義にしない。
4. Access Mapなしの変換を「定義済み」と表示しない。
5. Transformerなしの暗黙型変換を捏造しない。
6. Observer、Recorder、Initiator、Executor、Causal Agencyを無断で同一化しない。
7. Source Eventと派生解釈を上書き統合しない。
8. 一つのCausality Profileを普遍的な因果定規として持ち込まない。
9. POSIX／kernel資源とContext資源の管理責務を混同しない。
10. `unknown`、`unmapped`、`unverified`、`⊥`を成功へ変換しない。
11. 過去資料から同時点OAEを遡及生成し、同一Worldへbackfillしない。
12. 現在のInterpretation OAEを過去時点の観測へ偽装しない。
13. 仮想再構成ではSource WorldとSource Instance Ghostを変更せず、7D Foldで双方をsplitする。

## 10. 関連文書

- [SphereOS Angel / ArchiAngel サービス分類](sphereos-angel-service-taxonomy.ja.md)
- [Atlantis-MAGISDK 0.2.1](atlantis-magi-sdk-0.2.1.ja.md)
- [FAM概要](fam-overview.ja.md)
- [神話・目的関数の横断工学監査規約](../operations/myth-purpose-cross-engineering-audit.ja.md)
- [IBD FAMネイティブResolverとバインダー中立性](ibd-fam-native-binder.ja.md)
