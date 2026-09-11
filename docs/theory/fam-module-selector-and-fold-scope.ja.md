---
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0-draft
status: canonical-interpretation
fold_signature: ψ → ∇φ → λ → Q
---

# FAM module / selector / Fold scope の正本Interpretation

## 0. 目的

FAMを巨大な一枚JSONや単純なtreeとして扱わず、FAM fileをmodule、nodeをaddressable object、Foldをscope / reference boundaryとして扱う。

FQueryはその上に載る薄いselector / traversal surfaceであり、意味そのものをCoreへhard-codeしない。

```text
Meaning may remain open.
Pointers may not.
```

## 1. `self` と `this`

```text
self
  = current FAM file / current FAM module

this
  = current node
```

`self != this`を不変条件とする。

FAMが複数fileへ分かれても、`self`は現在解決中のmodule boundaryを示す。別FAMは`fam_ref`等の明示referenceを通してresolveする。

## 2. L軸とmL軸のtraversal

構造上の位置と、実際に意味処理が流れた経路を分離する。

```text
L axis
  prev <- this -> next

mL axis
  before <- this -> after
```

`prev / next`はcanonicalな構造・配置・接続位置を辿る。

`before / after`は実際のrunでどこから処理が来て、どこへ渡ったかを辿る。同じFAM revisionでもruntime condition、Observer、model、tool、外部state等により変化し得る。

```text
structural topology != runtime semantic topology
```

`parent / children / siblings`は局所containmentを辿る基本object traversalとして扱う。

## 3. array と object

FAMの最小正規化では次を基本とする。

```text
array
  = sibling collection / parallel representation

object
  = 名前付きaddressable unit
```

JSON arrayのindex順だけからmL実行順を生成しない。意味処理順は`before / after`等の明示されたruntime semantic relationで表す。

## 4. Foldはscopeでありmodule boundaryである

FoldはUI上の折りたたみgroupではない。

```text
Fold
  = semantic scope boundary
  + namespace boundary
  + reference boundary
  + independent FAM extraction boundary
```

同じselector構文を共有していても、別Foldのnamespaceを暗黙に共有しない。

例:

```text
Self Fold
  アストラル
  エレメンタル

Corporate Fold
  設計部
  製造部
  法務部
  庶務
  経営部
```

これらの語の意味はrefFAM / Access Map / Registryが与える。Coreは「アストラルとは何か」「製造部とは何か」を裁定しない。

ただしCoreは、current Foldにその参照が存在するか、cross-Fold traversalが明示許可されているかを機械拘束する。

```text
syntax shared != scope shared
semantic similarity != pointer permission
```

## 5. 科学・Agent・信仰を混線させない

Fold boundaryを無視すると、意味類似度だけで異なる成立条件が短絡する。

例:

```text
Scientific Consensus Fold
  peer-reviewed consensus
  preprint / hypothesis

Local Experiment Fold
  measurement
  evidence
  local hypothesis
  citation

Self Fold
  experiment plan
  judgement

Spiritual Fold
  experiment purpose
  metaphysical meaning
```

これらを暗黙edgeで一つの因果chainへ潰さない。

```text
spiritual purpose
!= experimental evidence
!= scientific consensus
```

cross-Fold mappingが必要なら、adapter、transition、evidence relation、citation等の明示referenceを要求する。

これにより主観真実を否定せず、同時に主観真実をWorld-global factへ自動昇格させない。

## 6. 意味分類とpointer拘束を分離する

```text
「これはエレメンタルか？」
  -> refFAMと比較するLLM / model / Human Observerの仕事

「エレメンタルと判定済みのnodeを取得する」
  -> selector / resolver / IBD / adapterの仕事
```

意味分類は誤る可能性があり、別ObserverのOAEと共存できる。

一方、存在しないpointer、禁止されたFold横断、未解決revision等は機械的に停止できる。

## 7. objective fact と subjective truth

問い合わせは最低限、何を取りに行くかで分岐する。

```text
objective fact
  -> 検証可能なsourceを返せるadapter
  -> API / SQL / sensor / RAG / record等

subjective truth
  -> semantic / vector retrieval可能なadapter
  -> 経験 / 記憶 / 解釈 / 類似Context
```

backend製品は本質ではない。IBD、vector DB、RDB、外部API、業務DB等はadapter contractの差である。

主観側で取得した経験は自動採用しない。

```text
retrieved != adopted
subjective validity != objective universality
```

近隣者の経験を自分のrisk判断へ採用することも、地理・Contextが違うため棄却することも、Observer側の判断として保持できる。

## 8. normalization と情報子

current Fold内でまず次の基本relationへlossless normalizationを試す。

```text
self / this
parent / children
prev / next
before / after
array parallel collection
object addressable unit
```

基本relationだけではidentityを保って表現できない、複数箇所から再参照される、別Foldへ可搬する、独立revisionが必要、循環や共有identityがinline展開を要求する場合、その意味単位を独立FAMJSONへ抽出する。

```text
shared / portable semantic unit
  -> independent identity
  -> FAMJSON / Infoton module
  -> fam_refで再接続
```

循環参照そのものを禁止する必要はない。module reference graphとしてvisited path / revisionを管理し、無限inline expansionを禁止する。

## 9. 可搬性と価値を同一視しない

情報子へ切り出すことは「高価値」「正解」「叡智」の認定ではない。

可搬単位としてIBDや任意のindexへ積み、後から参照数、採用数、棄却数、再利用Context等を観測できる。

当初の用途で使われなかったものも削除義務はない。後から別Observer / 別目的で創作、研究、歴史、業務等の価値軸から再マイニングできる。

```text
portable = identity property
valuable = later observation
```

## 10. refFAMとの境界

通常FAMはfact、経験、業務、観測、手続き等を含められる。

refFAMは、それらをどう見るか、どう分類するか、どの問いを立てるか、どのFold / World / layerをどう扱うかという再利用可能なmethod / worldview / rulerを記述する。

layer namespace自体を特定の自我モデルや企業組織へCore固定しない。

## 11. 実装側不変条件

```text
self = FAM module
this = current node

prev / next = L-axis structural traversal
before / after = mL-axis runtime semantic traversal

array = parallel sibling representation
object = addressable units

selector = current Fold scoped by default
cross-Fold = explicit reference / transition required

meaning classification = Observer/refFAM side
pointer integrity = machine side

normalization failure / independent identity need
  -> FAM extraction
```

## 関連

- [FAM / 情報子 / refFAM の参照境界](fam-infoton-reference-boundary.ja.md)
- [FAM Execution](fam-execution.ja.md)
- ZeroRoomLab-manifest Issue #41
- FQuery selector / traversal / normalization machine contract

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
