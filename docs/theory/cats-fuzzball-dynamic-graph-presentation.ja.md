# CATS / 毛玉グラフ（仮）

**Status:** Proposal / design note  
**Date:** 2026-10-21  
**Related:** [ZeroRoomLab-manifest #55](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/55), [FQuery GUI #44](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/44)

## 1. 概要

CATS（仮称: **Charts / Analytics / Tables**）は、AAE・OpenFAPTA・FAM/FQuery等のDynamic Graph Engineから利用できる、**汎用・動的・高次元グラフのPresentation Engine**候補である。

初期のグラフ表現を **毛玉グラフ（仮） / Fuzzball Graph** と呼ぶ。

通常のdynamic graphが主として現在のNode/Edgeを描くのに対し、毛玉グラフは、円形・polar状の状態成分に加えて、関係性グラフから生成されたContext Forceを「毛」として描く。これにより、現在成立しているTopologyだけでなく、未成立のpotential、局所的な変化傾向、Frontier、反発・引力・拘束などを別の視覚チャンネルとして提示する。

```text
Dynamic Relationship Graph G(t, context)
        + observation / provenance / uncertainty
        + mapper / refFAM / policy output
                    |
              Field Adapter
                    v
        Force / Constraint / Potential
                    |
          Presentation Projection
                    v
      CATS Presentation Engine
       /          |           \
   Charts     Analytics      Tables
      |
 Fuzzball Graph
```

CATSは意味モデルや実行エンジンそのものではない。AAEやOpenFAPTAの判断・資源配分・人格モデル等をPresentation Coreへ移さない。

## 2. 基本モデル

概念上の時間発展を次のように置く。

```text
G_t -> Field_t -> projected deformation / interaction
    -> observed or engine-approved transition -> G_(t+1)
```

ここで重要なのは、**ForceがNodeの固定属性ではなく、時間依存するRelationship GraphとContextから生成される**ことである。

同じ二つのNodeでも、ContextやRelationによって補完・競合・依存・利益相反・未知共有・無関係など異なるForceを持ち得る。Relationは非対称、多対多、時間依存を許容する。

描画上のForceを積分しただけでcanonical graphを自動更新してはならない。観測された遷移、Engineが確定した遷移、simulation上の予測を区別する。

## 3. 毛玉Glyph

### 3.1 毛玉本体

Node / Fold / Actor / Commons等の比較的まとまった状態を表す。

円周方向はpolar/radar chartに近い成分軸を持てるが、軸語彙はdomain mapper / Presentation FAM側で構成し、CATS Coreへ固定しない。

毛玉本体は概ね **現在のstate** を担当する。

### 3.2 毛 / アホ毛

毛は各Context方向に働く局所Force、gradient、unresolved Frontier、potential等を表す視覚チャンネルである。

```text
state component + local force + boundary + frontier
```

長さ・太さ・曲率・密度・振動等への割当はPresentation契約で変更可能にする。強い局所Forceが突出する場合は「アホ毛」として視認できる。

毛は確定済みEdgeではない。したがって、二つの毛が接近しても「取引成立」「信用発生」「因果関係確定」とは扱わない。

### 3.3 Edge

Edgeは成立・観測済み、またはEngineが明示的に確定したRelationを表す。

これにより、

```text
Edge = established relationship
Hair / Force = tendency / potential / local field
```

を視覚的に分離できる。

まだEdgeが存在しない二主体でも互いに向かう毛があれば「関係形成potential」を表示でき、既存Edgeがあっても反発Forceが強まれば「現在の関係と変化傾向が異なる」ことを表示できる。

## 4. 描画物理と意味論の分離

3D/2D描画ライブラリでは、重力・風・電気・spring等を最終的に抽象Forceとして扱える。CATSでも同様に、domain semanticsとrenderer physicsを分離する。

```text
Semantic Relation / Observation
          |
      Field Adapter
          |
Presentation Force Descriptor
          |
   Renderer Adapter
   /      |       \
gravity  wind   electric/spring
```

重力・風・静電気等は**Presentation metaphor**であり、対象domainに実在する物理力を主張しない。

例えば、同じsemantic Forceを、あるRendererではspring、別Rendererではwindとして描写してもよい。Rendererを変更してもcanonical relation、provenance、traceは変化しないことを要求する。

Node全体の移動を生むmacro forceと、表面の毛を曲げるlocal forceを別チャンネルにできる。この分離により、通常のforce-directed graphではNode位置へ畳み込まれて消えやすい局所場を保持する。

## 5. Dynamic Graphとしての意味

CATS毛玉グラフの狙いは、単にNodeを毛玉型アイコンへ置換することではない。

```text
Graph_t -> Force_t -> potential DeltaGraph -> Graph_(t+1)
```

というdynamic graphのうち、通常のNetwork Viewが主に `Graph_t` を示すのに対し、毛玉グラフは `Graph_t` と `Force_t` を同時に観測できるようにする。

Topologyは「誰と誰がどう関係しているか」、Forceは「その関係群が現在どちらへ変化させようとしているか」、Fold/transitionは「変化が構造として定着した結果」として扱える。

これは予測の正しさを保証するものではない。Forceは使用したmapper/refFAM/policy/modelの出力であり、後の観測と比較・反証可能にする。

## 6. Multiscale / LOD

同一Topologyを解像度に応じて異なる表現へ投影する。

```text
[Macro]
Fold / Actor / Market / Commons群
        |
      zoom
        v
[Fuzzball]
state components + relation + local force
        |
      zoom
        v
[Local chart]
series / volatility / OHLC等
「ローソク毛」
        |
      zoom
        v
[Trace]
originating relation / observation / mapper / policy / FAMLog
```

「ローソク毛」は金融domainではOHLCを表示できるが、CATS CoreはOHLCを要求しない。他domainではセンサ時系列、confidence、resource flow等、その軸に対応するseriesへ置換する。

2D/3D上の距離は高次元Context spaceのprojectionであり、画面上の近さを意味論的同一性と解釈しない。Projection方法、歪み、aggregation、unknownを検査可能にする。

## 7. CATS

### Charts

- Fuzzball / polar glyph
- Dynamic graph
- time series
- candle/OHLC where applicable
- distribution / correlation等のdomain chart

### Analytics

- Force component contribution
- originating relation / edge contribution
- prediction vs observation
- Frontier / volatility / topology等のEngine/Mapper提供値
- projection distortion / confidence / uncertainty

Analyticsの意味判断はCATSが勝手に生成せず、Engine / Mapper / refFAMから供給される。

### Tables

- Node / Edge
- state components
- Force内訳
- time window / parameters
- provenance / confidence / unknown
- trace / FAMLog / OAE

Graphで見えている値をTableでも検査でき、Tableから同じ描画条件を再現できることを目標とする。

## 8. Visual Debugger

毛一本・アホ毛一本を選択し、「なぜこの毛が立っているか」を逆引きできることを重要なUXとする。

```text
selected hair
  -> force components
  -> originating relationship(s)
  -> mapper / refFAM / policy
  -> observation / provenance
  -> trace / FAMLog
```

これによりCATSは単なるダッシュボードではなく、Dynamic Graph Engineの**Visual Debugger / explainability surface**として利用できる。

### 8.1 Simulation / Reality Residual

同一の初期条件・Policy・Lawについてsimulation projectionと現実観測を比較し、差分を単なる描画誤差として捨てず、未説明のResidual Field候補として検査できるようにする。

```text
Simulated Graph / Force
          +
Observed Graph / Force
          |
       Residual
          v
unmodeled relation / observation gap / latency /
external shock / nonlinear response / implementation bug / unknown
```

Residualは未知の実在Forceを自動的に証明するものではない。モデル漏れ、観測誤差、遅延、外生要因、実装不具合等を含む**金融工学・制度工学上のデバッグ対象**としてprovenance付きで保持する。

## 9. GUI検討: Law / Depth / Constraint / Reality Commit

CATSをOpenFAPTA等のsimulation workbenchとして利用する場合、毛玉の「毛並み」とNode/Foldそのものの移動を分離する。

```text
Relationship / State
        |
     Force Field
        |
 local hair deformation
        |
 Constraint / Mobility / Transition Rule
        |
 actual/simulated node movement
```

`Force != 0` でもConstraintによってNodeが移動しない状態を許容する。これにより「Forceが弱いから動かない」と「強いForceを受けているが拘束されて動けない」を区別する。

GUI上ではsimulation中のNodeをcounterfactualに移動し、その位置・Context・Relationで生じる毛並みを観測してよい。現実にその移動が可能かどうかはConstraint / Mobility / Transition側の別判定とする。

### 9.1 Policy parameterではなくLawを転送単位にする

金利、税率、補助、信用枠等の単一parameterだけでなく、少なくとも次の組をsimulation / comparison / commit候補として扱える設計を検討する。

```text
Law
  = payoff / incentive mapping
  + boundary
  + constraint
  + transition rule
  + exposure rule
```

金融domainでは、金利・税・補助・信用・手数料等はRelationship GraphとContextを介して各主体に異なるForceを生じさせる。CATS Coreはこれらの金融語彙を固定せず、domain adapter / refFAM / policyからForce descriptorへ投影する。

### 9.2 Simulationは可逆、Reality exposureは原則として履歴依存

GUIはsimulation上のReset/Rewindと、現実への介入・観測を同一操作として扱わない。

現実では一度Fieldへ曝露された主体が、技能、信用、負債、関係、退出、Commons消耗、新規Fold等の履歴を持ち、Policy parameterを元へ戻しても初期状態へ戻らない場合がある。

```text
Sim:
initial state -> expose -> inspect -> reset / branch / replay

Reality:
state -> exposure -> irreversible or hysteretic Fold
                      -> observation
                      -> revised state/history
```

したがってReality側では、経路依存、hysteresis、不可逆性を第一級の観測対象とする。正の蓄積と負の蓄積は別世界として切り離さず、同一介入が生む複数のFoldとして同時表示できるようにする。

### 9.3 Reality Commit境界

GUI上でsimulationから現実へLawを適用する境界を明示する。設計会話上の比喩として **「ボンドルドGUI」** を用いることがあるが、これはUI/UX検討用のコードネーム・比喩であり、CATSの正式名称、domain semantics、または第三者作品の設定をcanonical modelへ導入するものではない。

この境界の目的は「最適値を自動決定する」ことではなく、simulationで観測したLawについて、現実への適用時にどの不可逆性・不確実性・Constraintを引き受けるかを明示することである。

```text
Law candidate
    |
Simulation branches
    |-- force / hair
    |-- topology transition
    |-- commons / resource effects
    |-- residual / uncertainty
    |-- irreversible-fold candidates
    v
Reality Commit Boundary
    |
Observed exposure / transition
    v
FAM / FAMLog / OAE -> model/refFAM/policy revision
```

Commit操作そのものをCATS Coreの責務にはしない。CATSは候補Law、simulation結果、provenance、不可逆性候補、観測結果を提示し、実際の外部制度変更・金融操作・権限行使はEngine / Authority / Adapter側へ残す。

## 10. AAE / OpenFAPTA / FQueryとの境界

### AAE

AAE内部のEgo/Superego等のモデルをCATS Coreへハードコードしない。AAE Adapterが必要なsemantic relation / state / traceをPresentation契約へ変換する。

### OpenFAPTA

Frontier、volatility、area、topological resource allocation等を表示できる。ただし金融・通貨・信用・Merchant固有語彙をCATS Coreの必須schemaにしない。

OpenFAPTAでの資源配分結果を、毛の太さや長さ等へ割り当てるのはPresentation mappingであり、CATSが配分Policyを決定するわけではない。

### FAM / refFAM / FQuery

FAMは状態・観測等、refFAMは見方・問い・Mapper等、FQueryはquery/controlを担う。CATSはそれらの正本を置換しない。

既存の [FQuery GUI Issue #44](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/44) にあるPresentation FAM / MVC / GUI Event ABI境界を継承し、BaklavaJS等の特定GUI frameworkには依存しない。

### FAMLog / OAE

時間再生、provenance、Force由来説明のtrace sourceとして接続する。AAE等が別形式のtraceを持つ場合はadapterで統合する。

## 11. Presentation Force Descriptor候補

具体schemaは未確定だが、最低限の概念候補を次に置く。

```text
force descriptor
  target_ref
  context_axis / context_ref
  vector or projected vector
  magnitude
  relation_ref[]
  source_observation_ref[]
  mapper_or_policy_ref
  time / window
  confidence / uncertainty
  status: observed | inferred | simulated | unknown
  renderer_hint?     # non-canonical
```

`renderer_hint` はPresentation hintに留め、semantic truthとして扱わない。

## 12. PoC

初期PoCは3Dから始めず、2Dで情報モデルを検証する。

- 3～5主体
- 数個のcontext axis
- attraction / repulsion / asymmetric relation
- relationの時間変化
- observed / inferred / simulated / unknown
- polar state glyph
- local force hair
- established edge
- time playback
- hair -> relation -> trace逆引き
- Charts / Analytics / Tables間の同一データ投影
- ForceとNode mobility/constraintの分離
- simulation branch / reset / replay
- simulated vs observed residual表示
- irreversible / hysteretic Fold候補の表示
- Reality Commit境界をPresentation上で明確に分離

同じfixtureをAAE AdapterとOpenFAPTA Adapterから供給し、CATS Coreがdomain固有実装を要求しないことを検証する。

## 13. Non-goals

- Rendererが信用創造・資源配分・人格推論を実行すること
- 描画上の引力/反発を現実世界の物理因果として扱うこと
- GUI frameworkのJSONをcanonical graph/FAMにすること
- 画面上の近接だけでEdge成立と判定すること
- simulationとobservationを混同すること
- Reality CommitをCATS Core自身が外部システムへ実行すること
- 現段階でCATSまたは毛玉グラフの完成実装が存在すると主張すること

## 14. 次の設計課題

1. Presentation Force Descriptorの最小ABIを確定する。
2. Dynamic relation / state / traceを含む共通fixtureを作る。
3. 2D Fuzzball Rendererでstateとforceの同時表示を検証する。
4. Charts / Analytics / Tables間のselectionとfilterを共通化する。
5. AAE / OpenFAPTA Adapterを独立に実装し、domain依存がCoreへ漏れないことをテストする。
6. 大規模graph向けLOD / clustering / aggregationと情報損失表示を検討する。
7. Law / Constraint / Mobility / Exposure / irreversible FoldのPresentation契約を整理する。
8. Simulation branchとReality observationを同じtrace viewerで比較できるResidual Debuggerを検討する。

---

この文書は設計提案であり、Issue #55とともに更新する。名称 **CATS** および **毛玉グラフ / Fuzzball Graph** は現時点では仮称である。「ボンドルドGUI」は設計会話上の比喩・コードネームであり、正式名称ではない。
