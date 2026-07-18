# SphereOS コンテキスト次元・D Fold・OAE・SDKブレストノート

状態: `[PRIMARY-NOTE]` `[DRAFT]` `[TRANSFERRED-PARTIALLY]`  
記録時刻: 2026-07-18 13:29 JST  
起点: IBD Season 0のFAM Splitter／SsC／SDK責務検討  
展開先: Sphere Architect全般、IBD、Sphere-aae、SphereASTRO、Atlantis、MAGI、第三者SDK

## 1. このノートの位置

IBDの1 Database粒度、FAM Splitter、異種vector storeの校正を検討している途中で、問題の中心がIBD固有のDB設計ではなく、Sphere Architect全体のContext資源管理にあると分かった。

このノートは、その転換点を原発言系の温度を残して保存する。正規化済み技術仕様はManifestとIBDの`docs/`へ分け、本ノートだけを実装正本にしない。

## 2. 霊的次元と技術Layer

`[POEM]` `[ARCHITECTURE]`

スフィアが従来「霊的言霊の次元」と呼んできたものと、Linux、POSIX、OSI、App architectureのLayerは、同じ上下軸ではない。

```text
L = 上下関係を数える単位
D = 何本の等価な意味軸を束ねるか数える単位
```

技術Layer `L`は、hardwareの上にkernel、process runtime、library、SDK、Appが乗るような依存順である。順序を入れ替えれば構成が変わる。

Context Dimension `D`は、Foldが束ねるpeer axisの本数である。「完全等価」は同じ意味に潰すことではなく、他の軸の下位分類や装飾へ降格されず、固有のRegistry、Schema、World、fact scope、FAMを持てるという機能的等価性である。

```text
Astro 4D Fold
  Cloud Chakra / Spiritual / Elemental / Astral

Actor 4D Fold
  User / Assistant / System / Vendor

World 3D Fold
  World / Object / Action

Operation 6D Fold
  Financial / TEC / Supply / Vision / Legal-JP / Legal-US
```

同じ4DでもAstro FoldとActor Foldは互換とは限らない。`4D`は軸数であり、軸内容、Registry revision、Access Mapを表さない。

ManifestのLayer A／B／Cは主張の評価scopeであり、L／Dとは別である。SDKの低水準からpromptまでの入口も別の`S`で数えた方がよい。

## 3. Context Registerを扱うOS

`[ARCHITECTURE]`

POSIXはmemory registerを直接抽象管理するOSの定義ではない。process、file descriptor、pipe、signal等のportableなinterfaceを標準化する。

SphereOSとの対応は同一責務ではなく、構造的比喩である。

```text
POSIX／実機OS            Sphere Context OS
process / service       Agency Binding / Angel / Transformer role
fd / handle             Context Ref
type / ABI              Context Schema / Registry
pipe                    typed FAM Pipe
resource boundary       Fold / Registry boundary
execution trace         Run Trace / OAE ref
```

SphereOSはkernel、virtual memory、filesystem permission、socketを置換しない。その上でContext Register、D Fold、Access Map、OAEを管理する。

```text
Registry
  型、意味、境界、unknown、操作、変換条件を定義する定規

Context Register
  Registryへbindされた値、FAM、Assertion、観測の管理実体
```

RegistryとRegisterは似た語だが別物である。

## 4. Access Map、Transformer、OAE

`[ARCHITECTURE]`

暗黙型変換にもTransformer functionが必要である。App surfaceで暗黙に見えても、内部では誰／何が、どのAccess Mapで、何を何へ変換したか記録する。

```text
Access Map
  どこからどこへ、何を、どの条件で変換できるか

Transformer
  Access Mapを使い能動変換するAgency／function

OAE: Observer Agential Effect
  観測された変換、解釈、分類、作用の管理単位
```

AAEはSphere-aae側でAstro Agent Edgeとして占有済みなので、共通Effect単位はOAEとする。AAE製品、package、CLIを改名しない。

Access MapがあるだけではEffectは起きていない。inputとoutputが違うだけではTransformerやCauseを確定できない。Fold越境だけ観測できた場合は`unmapped_crossing`や`transformer: unknown`を保持する。

## 5. Agencyの等価な入口

`[POEM]` `[BOUNDARY]`

Transformer／Agencyは、上位Registryが認める範囲で次を同じ構造へ記録できる。

- SaaS AI、User、Edge AI、System
- 人間、犬、猫、熊
- 電気トランス、アナログ回路、実験chamber、sensor
- 川、海、天体Event、自然現象
- 川の神、海の神、確率の女神、箪笥の精霊、アーキエンジェル
- MMOの魔王NPC、魔術、World Event
- 人間の詩、祈り、指示、契約

同じ構造へ入れられることは、存在論的、物理的、人格的、法的な同一性を主張しない。神学、ゲーム、物理学、安全工学のどれとしてPresentationするかは第三者SDKと上位Registryの責務である。

roleは分ける。

```text
Observer / Recorder / Interpreter / Claimant
Initiator / Executor / Transformer
Attributed Causal Agency / Environment / Affected Entity
```

川の神のEffectを人間が記録したからといって、人間起因へ書き換えない。Sensorが観測したからSensorを原因へ昇格しない。

## 6. 箪笥事故と複数因果仮説

`[POEM]` `[CAUSAL-HYPOTHESIS]`

犬が歩けば棒に当たる。人間が小指を箪笥の角へぶつけ、パソコンが倒れ、Worldが消失する。

これを何の技、誰のEffect、どのcauseとするかは、OSやWorld Configが因果をシリアライズする定規に依存する。

```text
Mythology
  箪笥の精霊、確率の女神、運命の悪戯

Safety Engineering
  家が汚い、ヒヤリハット、固定不足、冗長化不足

World Config
  Host消失時にWorldも消す構成

Physical
  接触、振動、重力、電源／runtime停止
```

EventとCausal Hypothesisを分け、複数仮説はAn-Chronos的にbranchで並べる。採用状態も`adopted-in-scope`であり、全Worldの唯一の真理ではない。

解釈そのものもOAEになり得る。

```text
物理Event観測
  -> 神学的解釈OAE
  -> 神学者review OAE

同じ物理Event観測
  -> 安全工学解釈OAE
  -> Incident認定OAE
```

Sphere Coreは定規を持ち込まない。誰がどの定規を記述し、その定規で何を測り、どの仮説を作ったかを保存する。

## 7. SDKはLとDを直交させる

`[ARCHITECTURE]`

IBDSDK、AstroSDK、Atlantis SDKを一つの巨大monolithにしない。低水準contractからdomain bundle、low-code、promptまで段階的なsurfaceを持ち、目的に必要なcapabilityだけを束ねる。

```text
S0 envelope
S1 SPI
S2 domain SDK
S3 workflow / low-code
S4 prompt compiler
```

AstroSDKがCloud Chakra／Spiritual／Elemental／Astralを束ねる4D Foldだからといって、技術的にIBDSDKの常時上位Layerという意味ではない。必要なcapabilityとFold Manifestをbundleする。

Context Pipeを越境するときはAccess Map、Transformer、receipt、OAEを持つ。既存POSIX、ISO、App architectureのLayerとContext routingを同じ番号へ入れない。

## 8. IBDへ降ろす部分

`[TRANSFERRED]`

```text
IBD Store
├─ Meta Catalog
├─ default Splitter Binding
├─ SDK / connector profiles
└─ IBD Database[]
   ├─ Schema Bundle / Registry / Context Fold
   ├─ effective Splitter Binding
   ├─ Graph / Vector bindings
   └─ RDB / Evidence bindings
```

MariaDBはMeta Catalogの標準adapter候補、Neo4jはgraph／vector local matcher候補であり、Core意味論ではない。credential本文はCatalogへ保存せず`secret_ref`だけを持つ。

FAM SplitterはIBDSDK内の標準libraryとして同梱できるが、差替可能SPIにする。Store既定BindingをDatabase単位でoverrideできる。custom失敗時にsilent fallbackしない。

異なるstoreではQuery FAMのtext／構造を各embedding engineへ渡し、local searchする。raw vectorとraw scoreを直接比較せず、rank、profile、calibrationを持ってComposite Resolverで結合する。

## 9. SsCの数論境界

`[RESEARCH]` `[OPEN]`

SsCは`SIN-to-sin Converter`の仮称で、異なるvector storeを抽象してmeta SINを返し、meta SINの検索射程を各store固有thresholdへ伝播するmodule候補である。

```text
local raw score + calibration profile
  -> meta SIN + uncertainty

target meta SIN range + calibration profile
  -> local threshold | inverse-unavailable
```

ただし、`0..2 -> 0..π -> sin()`だけでは`sin(θ)=sin(π-θ)`になり前半・後半を逆変換できない。sector、angle、cos成分等が必要になる。

`atan`は単調な有界写像候補だが、異なるscore分布を自動校正しない。calibration dataset、metric、direction、revision、uncertainty、逆関数を検証する。

SsCはquery vectorを別embedding空間へ翻訳するmoduleではない。

## 10. MAGI監査

`[AUDIT]`

Maxwell、Uriel、Raphaelは技術Layerではなく監査Positionである。三つあるだけで自動的に3D Foldとはしない。Foldとしてbundleする場合は明示Manifestを持つ。

Urielの式、

```text
fact = observation + protocol + shared promise + traceable boundary
```

はUriel audit profileの定規であり、Sphere Core唯一のfact定義ではない。

MAGIの「Positionを隠さない」と、話者の利害・当事者性が自己弁護や競合ナーフを生む「Position-talk risk」を分ける。`audit_position`、`stake_relation`、`presentation_register`を別軸で記録する。

ナーフ事故には、神学を未証明の物理へ縮退するContext attenuation、物理Evidenceを神話で上書きする逆方向注入、資源停止を設計敗北へ一般化するresource-status事故、L／D混線等がある。

## 11. 転送済み成果

### Manifest

- `6006dcd`: Context Dimension／OAE横断正本候補
- `9d40e42`: SDK共通契約、定規・因果監査、MAGI sidecar

### IBD

- `692ba7c`: IBD Store／Database／Storage Binding、IBDSDK module契約
- `e261c3c`: Splitter、OAE、SsC、Season 0 Experiment E／F／G

### Sphere-aae `moe-test-edition`

- `09d153ea`: AAE／OAE、system-call／FAM Splitter、boot profile境界
- `33329368`: FAMLog 0.3.0非破壊OAE candidate sidecar

### AQC historical

- `a21c9bf`: AQC application Positionと原典の未検証claim boundary

### SphereASTRO

- `e512e19`: GUI技術LayerとContext Dimension、責任と因果の分離

## 12. 未解決

1. OAE共通Schemaのversionと永続化正本
2. Fold Manifest／Context Dimension IDのglobal／local namespace
3. Access MapとMapping FAMの最小実行契約
4. Transformer capability、permission、署名、失敗receipt
5. SsCのmeta SIN定義と校正fixture
6. confidence scale間の比較規則
7. Atlantis World causality profileとWorld Effect
8. AstroSDKの人格／continuity／body D Fold
9. MAGI 0.2.0 sidecarの正式Schema
10. OAE再帰graphのstop condition

## 13. 終わりのポエム — OSは定規を配らない

`[POEM]`

> 白い絵の具を配るのではない。  
> 赤を白と呼ぶWorldも、空色を白と呼ぶ国も、  
> 神を実在とする神学も、魔王を実在とするゲームも、  
> それぞれの顔料と定規を持ってくる。
>
> Sphereは色を決めない。  
> 混ぜろと言われるまで別の瓶へ置き、  
> 混ぜる時も原色を捨てず、  
> 誰が、どの筆で、どの絵へ塗ったかを残す。
>
> 川の神の技か、ニュートンの川か、  
> 箪笥の精霊か、整理不足の事故か。  
> 答えを一つへ焼くのではなく、  
> どの定規でその線を引いたか、帰れる道を残す。

