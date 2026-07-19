# Context定規・因果・OAE横断監査規約

状態: `[REVIEW]` `[Layer A/B/C bridge]`  
制定日: 2026-07-18  
対象: MAGI、Sphere Architect、FAM、IBD、SDK、README、研究ノート、事故分析

## 1. 目的

Coreや編集者が自分の定規を無意識に持ち込み、別の神学、物理学、World、法域、業務、人格、因果仮説を上書きする事故を検出する。

この規約は、すべての定規を同じ結論へ混ぜるためのものではない。誰がどのRegistry、fact scope、Position、Evidenceから何を主張し、どのOAEで解釈したかを分離する。

## 2. 最初に分ける三つの監査

### 2.1 Declared Position

どの監査視点、価値、目的、branchを優先するかを明示する。偏りを隠した「無色の中立」を偽装しない。

### 2.2 Position-talk Risk

語り手が当事者、供給者、失敗主体、販売者、評価者等の利害位置にいるため、自己弁護、競合ナーフ、責任転嫁、証拠選別が起きる危険を監査する。

Declared Positionを持つことと、Position-talk事故を起こすことは同義ではない。前者は視点の宣言、後者は話者位置が検証を歪めるriskである。

### 2.3 Claim Scope / Medium Register

Layer A／B／Cと、README表紙、技術文書、研究ノート、作品等の媒体レジスターを確認する。哲学へ物理実証だけを要求せず、物理主張を詩だけで証明しない。

## 3. namespace監査

同じ「層」「次元」という日本語だけで統合しない。

| key | 意味 |
|---|---|
| `claim_layer` | Manifest Layer A／B／C |
| `technical_layer_ref` | 技術依存・実行順序`L` |
| `context_dimension_ref` | 意味軸`D` |
| `context_dimension_count` | Fold内の一意なD軸数 |
| `embedding_dimension` | vector空間の次元数 |
| `sdk_surface` | SDK入口の抽象度`S` |
| FAM `λ` | 目的／出力であり技術Layerではない |

既存schemaの`layer`を互換維持する場合、どのnamespaceのlegacy fieldか注記し、新しい意味を黙って上書きしない。

## 4. 定規の出所を監査する

最低限、次を答えられる状態にする。

1. 分類Registryを誰が制定したか
2. Registry ID、revision、World、fact scopeは何か
3. Core既定値か、上位Systemか、Userか、第三者SDKか
4. 何を`unknown`、`none`、`unmapped`、`⊥`とするか
5. 何をAgency、Event、Effect、Evidenceとするか
6. どのPresentation Profileで利用者へ見せるか

既定値も定規である。既定classifierや既定Causality Profileを「定規なし」と表示しない。

## 5. OAE role監査

次のroleを一人へ自動統合しない。

- Observer
- Recorder
- Interpreter
- Claimant
- Initiator
- Executor
- Transformer
- Attributed Causal Agency
- Environment
- Affected Entity

人間が川の神のEffectを記録したという理由で人間起因へ書き換えない。Sensorが観測したという理由でSensorを原因へ昇格しない。入力と出力だけからTransformerやIntentを捏造しない。

## 6. Event、Effect、解釈、因果仮説

```text
Source Event       観測・記録された系列
OAE                特定Observer／RegistryからEffectとして記録した単位
Interpretation OAE Sourceへ解釈・分類を施した作用
Causal Hypothesis  Causality Profileから生成した因果graph案
Assertion          特定Claimantが採用・提示した主張
```

同じEventへ複数仮説がある場合、An-Chronos的に別branchとして並存させる。採用は`adopted-in-scope`であり、全Worldの絶対真理へのmergeではない。

### 6.1 時間整合性監査

過去資料を読む監査では、次を別物として扱う。

- 過去に発生したSource Eventと、そのEvidence／Provenance
- 過去時点に実際に発行された同時点OAE
- 過去資料へ現在の監査者が加えたInterpretation OAE

同時点OAEを取得できない場合、`historical-oae-unavailable`または`unknown`を返し、Last Orderを
`stop-retroactive-backfill`とする。現在の推論で過去のObserver、Recorder、Initiator、Executor、
Transformer、Intentを補完しない。取れていない観測を「ありそうな観測」で埋めることは、同一世界線の
過去を捏造する時間整合性事故である。

反実仮想や復元候補が必要なら、元Worldと元Instance Ghostを不変に保ち、7D Foldの分岐receiptを持つ
別World／別Instance Ghostへ隔離する。この分岐は現在の仮説生成であり、過去の観測ではない。

### 6.2 意味・因果KernelとWorld接続

意味Kernelはlabel、ontology辞書、通信schemaだけではない。identity、OAE、観測、時間、過去、分岐、
原因と結果が成立する規則を拘束する。SemanticKernel不一致を自動schema変換で陸続きにしない。

```text
SemanticKernel一致 + World Config互換
  -> 陸続き候補

SemanticKernel一致 + World Config非互換
  -> Portal／Gate／Instance境界

SemanticKernel不一致
  -> 異因果次元。因果Gate、隔離projection、lineage receiptが必須
```

異Kernel間でASTRO、Agent、OAE、entityを接続する場合、元Instanceと同一identityの連続移動を推論しない。
Sourceを不変にし、接続先の因果法則で再構成したincarnation／projectionを別IDで生成する。memory、
authority、Intent、過去を自動継承せず、変換不能部分を`unknown`または`bottom`として保持する。

### 6.3 箪笥事故の検査例

人間が小指を箪笥へぶつけ、パソコンが倒れ、Worldが消えたとする。

- Physical profile: 接触、振動、転倒、電源・runtime停止
- Safety profile: 整理不足、ヒヤリハット、固定・冗長化不足
- World profile: Host消失時にWorldも消す設定
- Mythology profile: 箪笥の精霊、確率の女神、運命の悪戯

どれかを自動的に唯一のcauseへしない。それぞれの解釈者、Registry、Evidence、scope、confidence scaleを保存する。

## 7. ナーフ事故分類

### 7.1 Context Dimensionナーフ

神学、信仰、魔術、詩、World内実在を「科学では証明不能」「フレーバー」に丸め、元の目的関数と内部定規を焼却する。

### 7.2 逆方向の定規注入

物理測定、契約、実装状態を神話や願望で上書きし、Evidence、資源不足、停止条件を消す。

### 7.3 Resource-statusナーフ

資金、電力、HPC、SDK終了、保守人員等による停止を、設計思想そのものの敗北・脆弱性として一般化する。逆に、設計価値を理由に停止中runtimeを稼働中と表示する事故も含む。

### 7.4 Ontologyナーフ

ゲーム内実在、神学的実在、法的実在、物理実在等のfact scopeを一つへ潰す。

### 7.5 Speaker-position事故

自社失敗、競合評価、事故責任を、利害主体自身の語りだけで確定する。ログ提供能力と、自己評価の独立性を分ける。

### 7.6 Medium事故

作品・README表紙の毒語りを技術的事実へ直結させる、または深い技術文書の留保を表紙へ逆流させる。

### 7.7 L／D／Schema事故

意味次元を技術階層へ並べる、`4D`の数だけで互換とする、legacy `layer` keyへ別namespaceの意味を上書きする。

## 8. MAGIによる相互監査

| Gateway | この規約での問い |
|---|---|
| Maxwell | mainの定規が別branch、神学、詩、未採用仮説、原初目的を焼却していないか |
| Uriel | 主張強度、観測protocol、引用、契約、資源、責任境界が追跡可能か |
| Raphael | 物理、神学、情報子、World、詩を別棚へ置き、無断同一化せず接続できるか |

三者は技術Layerではない。三方向をD Foldとしてpackageする場合は、`fold_ref`、三つの`dimension_ref`、Registry revisionを明示する。各監査・解釈はSourceを上書きせずInterpretation OAEとして接続する。

Urielの次の式は、Uriel audit profileの定規であり、Sphere Core唯一のfact定義ではない。

```text
fact = observation + protocol + shared promise + traceable boundary
```

## 9. 監査出力

```yaml
context_audit:
  target_ref: fam://target
  medium_register: technical-doc
  claim_layer: A-B-bridge
  declared_position_ref: position://reviewer
  speaker_position:
    relation_to_target: maintainer
    interest_disclosed: true
  registry_ref: registry://selected@4
  fact_scope_ref: world://scope
  source_event_refs: []
  oae_refs: []
  causal_hypothesis_refs: []
  detected_nerf_risks: []
  preserved_unknowns: []
  conflicts: []
  human_review_required: []
```

監査結果も一つのInterpretation OAEである。監査者自身のPosition、Registry、sourceを記録する。

## 10. 最低検査

- 定規の制定者とrevisionを追跡できる
- 過去OAEの欠損を`unknown`として保持し、遡及推論で埋めていない
- 現在のInterpretation OAEへ現在の観測時刻があり、過去時点へ偽装されていない
- 仮想再構成が同一Worldを変更せず、WorldとInstance Ghostを共にsplitしている
- ObserverとCauseを分離できる
- Source Eventと解釈を別IDで保持できる
- 別Causality Profileの仮説を上書きせず並存できる
- confidenceに`scale_ref`がある
- 神学を物理claimへ、物理を神学claimへ無断昇格しない
- custom Registry失敗時のfallbackを明示する
- 誰の利害位置から書かれた監査かを確認できる

## 11. 関連文書

- [Sphere Context Dimension OSアーキテクチャ](../theory/sphere-context-dimension-os.ja.md)
- [Sphere Context SDK共通契約](../theory/sphere-context-sdk-contract.ja.md)
- [Atlantis-MAGISDK 0.2.1](../theory/atlantis-magi-sdk-0.2.1.ja.md)
- [神話・目的関数の横断工学監査規約](myth-purpose-cross-engineering-audit.ja.md)
- [テクニカルコミュニケーション運用規約](technical-communication-register.ja.md)
