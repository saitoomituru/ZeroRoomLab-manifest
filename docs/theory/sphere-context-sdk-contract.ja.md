# Sphere Context SDK共通契約

状態: `[REVIEW]` `[Layer A/B bridge]`  
制定日: 2026-07-18  
対象: Sphere Architect、IBDSDK、AstroSDK、Atlantis SDK、第三者SDK

## 1. 目的

Sphere Architectの低水準APIから、domain bundle、low-code、prompt surfaceまでを疎結合に組み立てるための共通契約を定める。

この契約では、次の二つを同じ「レイヤー」へ押し込まない。

```text
technical dependency graph  何が何へ依存して実行されるか
context fold manifest        どの意味軸を等価なpeerとして束ねるか
```

SDKはすべてを一つに同梱する製品ではない。目的に応じてcapabilityを選び、上位Registryが制定したD Foldへbindするbundleである。

## 2. 三つの独立した番号

| 名前 | 例 | 数えるもの | 互換判定への利用 |
|---|---|---|---|
| `technical_layer_ref` | `runtime/application` | 技術依存・実行責務 | ABI、runtime、dependency graphと組にする |
| `context_dimension_count` | `4` | Fold内の一意な意味軸数 | 数だけでは互換判定しない |
| `sdk_surface` | `S2` | 利用者へ公開する抽象度 | 同じ機能への入口選択に使う |

`S0`から`S4`はSDKの使いやすさを示すsurfaceであり、OSの技術Layer番号でも、Context Dimension数でもない。

## 3. SDK surface

| Surface | 主な利用者 | 公開するもの |
|---|---|---|
| `S0: envelope` | runtime、adapter実装者 | Ref、Schema、receipt、OAE envelope、error／unknown |
| `S1: SPI` | library、driver実装者 | Registry Provider、Splitter、Transformer、OAE Sink、adapter |
| `S2: domain SDK` | App開発者 | IBDSDK、AstroSDK、Atlantis SDK等のdomain bundle |
| `S3: workflow` | automation、low-code開発者 | typed workflow、FAM Query builder、policy選択 |
| `S4: prompt` | User、Assistant、Agent | promptから型付きQuery／FAMへcompileする入口 |

上位surfaceは下位surfaceを隠してよいが、由来、Registry、Fold、Transformer、OAE、unknownを捨ててはならない。

```text
S4 prompt
  -> S3 typed workflow
  -> S2 domain SDK
  -> S1 SPI
  -> S0 envelope
```

## 4. Bundle Manifest

SDK bundleは、技術capabilityとContext Foldを別fieldで宣言する。

```yaml
sdk_bundle:
  bundle_id: sdk://example/astro-observer@1
  sdk_surface: S2
  capabilities:
    - capability://registry-provider@1
    - capability://fam-query@1
    - capability://oae-producer@1
  technical_dependencies:
    - layer_ref: runtime/application
      requires: ibd-sdk@0.x
  context_fold:
    fold_ref: fold://example/astro@3
    dimension_refs:
      - dimension://cloud-chakra
      - dimension://spiritual
      - dimension://elemental
      - dimension://astral
    context_dimension_count: 4
  registry_refs:
    - registry://example/astro@3
```

`context_dimension_count`は`dimension_refs`の一意数から検査する。同じ`4D`でもFold ID、revision、Dimension IDが違えば自動互換にしない。

## 5. 共通SPI

### 5.1 Registry Provider

Registry、Schema、Dimension、Fold、Causality Profile、Presentation Profileを安定参照で解決する。

```text
resolve(ref, revision_policy) -> resolved | unknown | unavailable | conflict
```

Core既定Registryも暗黙の普遍定規ではなく、IDとrevisionを持つ一つのprofileとして返す。

### 5.2 Classifier / FAM Splitter

入力FAMまたは情報子clusterを、上位Registryの候補Dimension／routeへ分類する。

```text
classify(source, registry_ref, fold_ref, policy_ref)
  -> route candidates + evidence + unknown + splitter receipt
```

Splitterのmulti-label数をD Foldの軸数とみなさない。D FoldはRegistry側のManifestで宣言される。custom Splitterが失敗した場合、明示policyなしに既定Splitterへsilent fallbackしない。

### 5.3 Access Map Provider

Fold／Schema間の参照・射影・変換可能性、条件、loss、禁止事項を返す。Access Mapの存在だけでEffect発生済みとしない。

### 5.4 Transformer

Access Map、入力Context、Policyを受け、変換結果とreceiptを返す。Transformerはfunction、SaaS AI、User、Edge AI、動物、物理作用、World、神学的Agency等を、選択Registryが許す範囲で参照できる。

構造へ格納できることは存在論的・物理的・人格的な同一性を意味しない。

### 5.5 OAE Producer / Sink

Observer、Recorder、Interpreter、Initiator、Executor、Transformer、帰属されたCausal Agencyを分離したOAEを生成・保存する。

OAE Sinkは因果を創作しない。入力にAgency attributionがなければ`none`または`unknown`を保持する。

### 5.6 Causality Profile Provider

Eventから因果仮説を作る定規を解決する。複数profileの仮説はsource Eventを共有して並存できる。confidenceは`scale_ref`と組にし、異なる定規間でraw値を比較しない。

### 5.7 Presentation Profile

同じContextを神学、ゲーム、自然科学、安全工学、法、財務、人格等のGUI／語彙へ投射する。Presentationはsource Assertion、Registry、fact scopeを上書きしない。

## 6. Access MapとTransformerの接続

```text
Access Map  = 変換できるという静的規則
Transformer = 能動的に変換するAgency／function
OAE         = 変換・解釈・作用が観測された記録
```

同一Fold内の解釈・分類・仮説生成もEffectを生むためOAEになり得る。cross-FoldはOAEの一種であり、OAEの必要条件ではない。

変換receiptの最低field:

```yaml
receipt:
  source_context_ref: fam://source
  target_context_ref: fam://result
  source_fold_ref: fold://source
  target_fold_ref: fold://target
  access_map_ref: access-map://source-to-target@2
  transformer_ref: agency://transformer
  registry_ref: registry://routing@5
  status: completed
```

## 7. Domain SDKの責務

### 7.1 IBDSDK

IBD Store、Meta Catalog、FAM Splitter SPI、SsC、graph／RDB adapter、OAE保存profileを束ねる。Sphere共通の存在論や因果定規をIBD固有仕様へ閉じ込めない。

### 7.2 AstroSDK

人格、自我、continuity、Cloud Chakra、Spiritual、Astral、Elemental等のdomain RegistryとFold bundleを提供できる。IBD Coreへ人格存在論を逆依存させない。

### 7.3 Atlantis SDK

World、Object、Action、World Effect、World Config、複数因果仮説等のdomain profileを提供できる。現実世界の因果定規をゲームWorldへ無断適用しない。

Domain SDKは高級だから技術的に常に上位であるとは限らない。同じruntime上で横並びに構成でき、必要capabilityだけをbundleする。

## 8. 互換性判定

二つのbundleを接続する前に、少なくとも次を検査する。

1. stable IDとrevision policy
2. Dimension ID集合とFold identity
3. Schema compatibility
4. Access Mapの有無とdirection
5. Transformer capabilityとpermission
6. fact scopeとWorld
7. loss／unknown／`⊥`の扱い
8. OAE receiptの保存可否

互換でない場合も、Sourceを捨てず`unmapped`、`incompatible`、`transformer-required`、`human-review-required`として返せる。

## 9. 禁止事項

- `L`、`D`、`S`、embedding dimension、FAMの`λ`、claim Layer A/B/Cを同一keyへ入れる
- 同じD数だけを理由にFoldを自動接続する
- prompt surfaceでProvenanceとRegistryを消す
- App上の暗黙型変換を、内部Transformerなしで成功表示する
- custom provider失敗時に別定規へsilent fallbackする
- Agency種別をCore固定enumへ閉じ、第三者存在論を矮小化する
- Context permissionからkernel／POSIX権限を推定昇格する

## 10. 関連文書

- [Sphere Context Dimension OSアーキテクチャ](sphere-context-dimension-os.ja.md)
- [霊的言霊の次元とContext Dimension Fold](../philosophy/spiritual-context-dimension-and-fold.ja.md)
- [Atlantis-MAGISDK 0.1.0](atlantis-magi-sdk.ja.md)
- [IBD FAMネイティブResolverとバインダー中立性](ibd-fam-native-binder.ja.md)

