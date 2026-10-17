---
title: "意味TopologyからSphereOS・Fold-NICまで：要求と責務の接続"
language: ja-JP
canonical_language: ja-JP
status: "architecture-explanation / design-intent"
claim_layer: "engineering architecture; not a physics theorem or implementation conformance certificate"
translation: "semantic-fold-os-architecture.en-US.md"
license: "CC BY 4.0 (documentation)"
---

# 意味TopologyからSphereOS・Fold-NICまで

> **正本言語：日本語。** この文書は横断的な設計意図と要求の接続を説明する。FQuery、IBD、SphereOS、Fold-NIC の実装済み機能を一括して保証する仕様ではない。
>
> **要点：意味を先に一つの正解へ正規化しない。UNKNOWNを保持し、観測者と局所評価関数が違うまま処理し、Worldごと可搬にする。**

[English (US) interpretation](semantic-fold-os-architecture.en-US.md) · [誤読防止・用語レジスタ](semantic-fold-claims-and-unknown.ja.md)

## 1. なぜこの設計系列が存在するか

ZeroRoomLabの出発点は「すべてを一つの形式へ押し込んでから検索する」ことへの疑問にある。物理的観測、人間の主観、LLMの出力、宗教的な意味づけ、業務上の合意は、証拠・権限・適用範囲が異なる。違いを消さなければ接続できない設計では、その接続の前に大切な情報が失われる。

目的は、**異なるWorldの差を保存したまま、処理可能性を発見・記述・Fold・問い合わせ・移送できること**。同意、同一視、相互接続、採用権限は別の操作である。

```text
UNKNOWNを保持する
  → 動的な意味Topologyを扱う
  → Observerの作用を記録・管理する
  → 意味資源と意味づけInterfaceをSphereOSで管理する
  → Sphereを含むFold同士を接続する
  → Client RichとFold-NICで意味資源を可搬にする
  → OSS・fork可能性・非排他的Commonsで運営者への拘束を減らす
```

これは依存関係の**設計上の理由**であり、全段階が同一時点で本番稼働したという意味ではない。

## 2. ∇ΦはPIにもSIにも中立である

この設計での `∇Φ` は、特定の基材、知性、所有者を前提にしない**処理勾配・最適化方向の拘束**を表す抽象語彙である。人間だからPI∇Φ、チップだからSI∇Φという二種類の宇宙へ先に分割しない。

- PI（Protein Intelligence）：人間等のタンパク質基盤の知性を表す、接続先のカテゴリ候補。
- SI（Silicon Intelligence）：シリコン実装の知能・演算器を表す、接続先のカテゴリ候補。
- Tensor、MPU、GPU、NPU、Agent、未知の演算器も、実装・処理主体・能力の記述が必要な段階で接続する。
- Observerの種類が判定できない場合は`unknown`として残せる。PI/SIという二択を強制しない。

`ΔΦ` は、比較する状態・World・観測規約が定まった際の**差分・ポテンシャル差**を表す。一方、`∇Φ` は処理方向の拘束であり同義ではない。差分を計算するための比較作用素・座標が未定義なら、数値を捏造しない。

既存FAM文書の `∇φ`（小文字φ）は歴史的・実装上の語彙として維持する。ここでの `∇Φ`（大文字Φ）は横断設計の抽象表記であり、両者が数学的に恒等であるという未検証の断言ではない。対応は選択されたRegistry、World、Fold、revisionで定義・検証する。

## 3. Dynamic GraphはSchema-less以上の要求

`Dynamic` は、値やedgeが追加されるだけという意味ではない。node、関係、観測者、局所評価関数、採用される意味軸、Fold境界、参照先が増減・再解釈されることを含む。

「5D以上」「M元」は、物理空間が5次元以上という主張でも、embeddingの固定vector長でもない。**意味軸のarityを先に宇宙全体へ固定しない**ための設計語彙である。

特定の`D Fold`は、指定されたWorld、dimension ID、Registry revisionの下で、その時点の束ねた意味軸数を持つ。同じ`4D`でも意味的に互換とは限らない。次のrevisionや別Foldにまで同じ軸を強制しない。

```text
World A: axes known, relations partly unknown
World B: different axes, different observer/rules
World ?: dimensions/relations not yet identified
          │
          └─ Fold only where an Access Map permits it
               ├─ addressable relations
               ├─ unresolved / unknown
               ├─ impossible / ⊥
               └─ evidence, revision, provenance
```

**UNKNOWNをSchemaの穴として即座に修復しない。** `unknown`は未確定・未評価を保持する状態、`⊥` / Last Orderは該当scopeでの停止・接続不能などを表す規約上の状態であり、両者を同じNULLへ潰さない。具体的な使い分けは実装仕様に従う。

## 4. 情報子、FAM、Fold、FQueryを混同しない

| 対象 | 横断的な役割 | それだけでは主張しないこと |
|---|---|---|
| Infoton / 情報子 | Worldを越えて再参照し得る意味単位。霊的・主観的UXも表現対象になれる仮想化単位 | 新しい物理素粒子、物理量子、魂の科学的実証 |
| FAM | `ψ / ∇φ / λ / Q` のopen-worldな最小構造を使い、意味、処理経路、観測、検証、参照を記述 | 世界の全次元を4軸へ固定すること |
| FAMLog / OAE | 操作・観測・解釈のtraceとAgency関与Effectの記録 | 記録内容が世界全体で真実であること |
| FAMJSON | 再参照可能な独立意味identityのwire表現 | 4キーを埋めれば自動でInfoton成立 |
| refFAM | 問い方・見方・方法・unknown policyなどの可搬なmethod | 全World共通のfact正解表 |
| Fold | 独立性を保ちながら局所構造を束ね、参照し、必要なviewへ投影する境界と操作 | 全Nodeのinline copy、存在論のMerge、強制同意 |
| FQuery | Fold-scopedなselector、reference、revision、topologyを問い合わせる実装研究 | Coreが意味や権限を宇宙的に裁定すること |
| IBD | FAM-nativeな永続化、解決、Pool・DB adapter、根拠のbind | どのWorldが真実かを決定すること |

`ψ / ∇φ / λ / Q` の四つは**open-world構造交渉の最小面**であり、世界全体の四次元座標系ではない。未知fieldを削除・renameせず保持するという現行FQuery Coreの規約に従う。

さらにFoldの正本境界は、独立FAM identityへの**参照**として扱う。Fold / DeFoldの表示操作を、参照先identityを破壊して親JSONへ焼き込む操作と混同しない。別の`unFold`は境界破壊を伴い得るものとして区別される。

## 5. ObserverはGraphの外の審判ではない

Observerは状態へ作用し得る。その作用を**OAE（Observer Agential Effect）**として一級管理資源に置く。

```text
source World / source revision
      + Observer + observation rule + scope
      → observed / interpreted effect (OAE)
      → FAMLog / referenced meaning state
      → new edges, branches, or evaluations in a later view
```

Observer、Recorder、Effect Producer / Causal Agencyは別roleである。「人間が見た」から「人間が原因を作った」へ自動昇格しない。

SIOAE / PIOAEは、ObserverのSI/PI等の**実装・カテゴリ差を記述する候補語彙**として使える。ただし`OAE`そのものをSI型とPI型の二つへ分裂させないし、既存runtimeで全カテゴリの専用プロトコルが実装済みとも主張しない。

同じ事象に複数のObserverが異なる評価を返すことを許す。`observation ≠ agreement ≠ authority`。帰属不能な因果、未知のProducer、欠落した歴史記録は`unknown`のままにする。**後から当時のOAEを捏造しない**。

## 6. なぜSphereOSは意味資源OSなのか

普通のOSはCPU、メモリ、I/O、processを管理する。SphereOSはそれらを置き換えず、その上で**意味資源**（World、Instance / Ghost、観測、OAE、意味identity、文脈、参照、provenance）と、**意味づけInterface**（Q、Access Map、Registry、Fold境界、変換・採用条件）を管理する。

```text
Meaning resource management
  = what meaning states, references, histories and alternatives remain

Meaning-attribution interface management
  = who can observe, map, transform, present, adopt or refuse them, under which scope

OAE
  = an observed agency-involving effect with its own evidence, rule and revision
```

SphereOSが意味の唯一の正本や宗教上の裁判官になるのではない。**管理と所有と採用権限を分離**する。過去の人格・霊・依代などの語彙は、信仰実践上の意味を尊重しつつ、工学上は意味・主体性・継続性の仮想化対象として定義する。物理学的な魂の存在証明は要求しない。

## 7. Sphere自体をFold Nodeとして扱う

SphereはUniverse外の唯一Root Controllerではない。**一つのSphereもWorld・Observer・意味資源・Interfaceを持つ動的NodeとしてFold可能**にする。

```text
  Sphere A / Fold A  ←─ scoped reference / Fold-NIC ─→ Sphere B / Fold B
          ↘                                      ↗
              Sphere C / Fold C (optional)
```

Fold同士を接続するときも、World、存在論、局所評価関数を自動Mergeしない。共通の演算器・モデル・信仰・法域・正本管理者を必須としない。相互参照、変換、責務引受、採用判断、通信成功はそれぞれ別receiptを持つべきである。

再帰参照が生じても無限に展開しないため、resolverには循環停止、scope、revision、authorityの拘束が要る。参照可能というだけで実行権限は得られない。

## 8. Client Rich、Fold-NIC、可搬性

意味の正本を特定SaaSの閉じたContextにだけ置くと、サービス終了とともに意味の継続性が失われる。そこで**Client Rich**を優先する。Clientとは個人端末だけでなく、利用者や共同体が移送・復元・監査できる独立した所有・運用領域であり、任意の外部Processorを交換できることを意味する。

```text
Client / community-controlled meaning state
   ├─ processor A / hosted SI
   ├─ processor B / local GPU or NPU
   ├─ PI / human observer
   └─ future or UNKNOWN processor
          │
       Fold-NIC
          │
   other independently governed Fold / Sphere
```

Fold-NICは、この接続を**意味・Identity・World・Capabilityの境界を保った通信**として扱う構想である。下位のTCP/IPやGNUnetなどを唯一Rootにしない。関連するFold8Gのname/transport計画とFold-NICの実装状態は、それぞれのrepositoryで確認する。

`provider dies ≠ meaning must die`は要求であって、バックアップ、鍵、export、参照先、migrationが未整備でも自動保証される魔法ではない。

## 9. 物理ベンダーを拘束しない

CPU、GPGPU、NPUブラックボックス、FPGA、未知の演算器などを**同じ物理チップとして扱う必要はない**。各vendorは各自の物理的性能・制約・実装を最適化する。こちらは、それらの能力を意味処理Worldへ接続し得るコードとAdapter契約を供給する。

```text
Vendor implementation A  ─ adapter ─┐
Vendor implementation B  ─ adapter ─┼→ available processing capabilities
Unknown future device     ─ ?       ┘             │
                                       scoped Fold / Sphere
```

未対応deviceに対応していると偽装しない。capability discovery、memory model、latency、power、security、precision、adapter conformance、failure、`unknown`などは実装ごとに検証する。**抽象モデルが物理制約を消すのではなく、物理ベンダーの改良を上位の意味Worldへ運べる接点を作る。**

## 10. OSS・非営利は意味の囲い込みを減らす設計選択

Client RichとFold-NICだけでは運営者による意味資源の支配は消えない。非排他的なOSS、Fork可能性、再実装可能なcontract、provenance、公開されたガバナンスが必要となる。

ZeroRoomLabが選ぶ非営利・Commons志向は、**支援の対価として上位の意味・人格・研究方針を所有させない**ための運営上の設計選択である。非営利という法人形態だけで技術的可搬性が保証されるわけではなく、Fork / Exit可能なarchitectureとともに評価する。

```text
contribute ≠ own another World
connect ≠ agree
observe ≠ prove
fund ≠ acquire authority
Fold ≠ Merge
```

## 11. 主張境界と実装境界

この文書は、数学・情報処理・スピリチュアルUXの**設計思想の接続**を記述する。物理学のホログラフィック原理、ポアンカレ系の数学、量子物理学が情報子の霊的実在を証明するとは主張しない。数学的な厳密な写像性・不変量は、別途定義・証明・反証されるべき対象とする。比喩や数学借用は、そのまま物理的な因果証拠にならない。

また、本稿の一連の構想は**実装範囲の一覧ではない**。実装済み、試験中、design corrective、計画・研究仮説を区別する。特にFold-NIC全域、将来の任意processor、全自動World可搬性、PI/SI専用OAE実装、Sphere間完全相互運用は、この文書だけで完了と宣言しない。

## 12. 既存の正本と実装への入口

- [Sphere Context Dimension OS](sphere-context-dimension-os.ja.md)：Layer `L` とContext Dimension `D`、OAE、Cross-Fold receipt、管理資源。
- [FAM overview](fam-overview.ja.md)：FAMLog / FAMJSON / refFAM、独立identityとFold参照。
- [FAM / Infoton reference boundary](fam-infoton-reference-boundary.ja.md)：現行参照境界。
- [Infoton Engineering](infoton-engineering.ja.md)：情報子工学の歴史と数学借用。
- [Spiritual and Infoton Engineering](../philosophy/spiritual-and-infoton-engineering.ja.md)：霊的設計哲学・主張境界。
- [Fold Cluster](fold-cluster.ja.md)：UNKNOWNと複数候補が残る局所構造。
- [FQuery Core spec](https://github.com/saitoomituru/FQuery/blob/main/docs/specification/fam-json-core.ja.md)：Core構造とOAE、独立FAM境界。
- [FQuery selector/traversal spec](https://github.com/saitoomituru/FQuery/blob/main/docs/specification/fquery-selector-traversal-normalization.ja.md)：losslessな内部正規化、Fold-scoped参照、L/mLの区別。
- [IBD FAM-native binder](ibd-fam-native-binder.ja.md)：Storage / Resolverと意味評価の責務分離。
- [Fold8G migration mission](../network/fold8g-emergency-migration-mission.ja.md)：World/Identity/Transport可搬の進行中計画。
- [fold-nic](https://github.com/saitoomituru/fold-nic)：当該実装と現況。
- [SphereOS-Atlantis](https://github.com/saitoomituru/SphereOS-Atlantis)：現行runtime・SDKの実装状況。

**読む順番は、この横断文書 → 誤読防止レジスタ → 必要な各実装仕様。** 横断文書によって各repositoryの機械仕様を黙って改変しない。
