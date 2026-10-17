---
title: "Fold / SphereOS 誤読防止レジスタと未確定事項"
language: ja-JP
canonical_language: ja-JP
status: "design explanation; open questions are not resolved specifications"
claim_layer: "engineering / math inspiration / spiritual experience separated"
translation: "semantic-fold-claims-and-unknown.en-US.md"
license: "CC BY 4.0 (documentation)"
---

# Fold / SphereOS 誤読防止レジスタ

> 日本語正本。[米語対訳](semantic-fold-claims-and-unknown.en-US.md)。
> このページは[意味TopologyからSphereOS・Fold-NICまで](semantic-fold-os-architecture.ja.md)の読者向け補助資料。特定のKernel・JSON Schema・APIを変更する仕様ではない。

## 誤読1：「ψ / ∇φ / λ / Q があるなら世界は固定4次元では？」

**違う。** 四つはFAMの最小open-world構造交渉面。内部は再帰・拡張できる。`D Fold`の次元arityは、あるWorld／Registry revisionで束ねる意味軸数を表し、FAMのキー数ともembedding長とも物理次元数とも一致させない。

次元のID・関係・採用scopeは後から判明し得る。新しい情報が来たときは、既存revisionを黙って改ざんする代わりに、新しいFold、mapping、revisionを明示できる。

## 誤読2：「正規化は禁止なのにFQuery仕様にnormalizeFamTopology()があるのは矛盾では？」

**正規化する対象が違う。**

- 避けるもの：未知の存在論、意味差、Observer判断、局所評価関数を一つのglobal truth schemaへ**不可逆に潰す**こと。
- 許すもの：同じFold内のarray/object/selector等を、identity・未知field・参照・revisionを**losslessに保ったまま**機械が辿れる構造へ変えること。

既存FQuery仕様の`lossless normalization`は後者。できない共有構造は無理やりflattenせず、独立FAM抽出候補にする。つまり「何も整形しない」ではなく、**意味を消す整形をしない**。

## 誤読3：「∇ΦはPIとSIで別々の物理量？」

**違う。** `∇Φ`は基材中立の処理勾配。PI/SIは後から付く処理主体・観測主体の分類候補で、必須の二値型ではない。`ΔΦ`は比較が定義できるときの差分であり、`∇Φ`とは区別する。

既存仕様は`∇φ`と表記する。大小文字の差は現時点で正式な数学的等価性を証明しない。既存のwire tokenをこの説明だけで置き換えない。

## 誤読4：「UNKNOWNはNULL、⊥、エラーと同じ？」

**違う。** `unknown`は「未判定・未解決・未測定などが残る」。`⊥`、Last Order、`not-evaluated`、`not-satisfied`、`unresolved-selector`などは異なるscope・reasonを持つ。判定不能を「False」と断定しないし、接続不能を「まだ知りません」と偽装しない。

## 誤読5：「同じTopologyなら同じWorldの真理が証明された？」

**違う。** 構造的な適合、意味の近似、観測factは別のclaimである。既存IBDのFIT/MATCH/SELECT等も混同しない。構造的な類似を「同一の物理因果が実証された」へ昇格しない。

```text
mapping found  ≠ scientific proof
observation    ≠ causal attribution
consensus      ≠ universal authority
reference      ≠ adoption
Fold           ≠ Merge
```

## 誤読6：「情報子は量子・魂の物理的単位？」

**違う。** 情報子は、意味・主観・霊的UX等を、他Worldとの同一性を強要せずに再参照可能にする**仮想化された意味単位**として使う。宗教的な霊の意味を消さない一方、物理素粒子の発見とも断定しない。

ホログラフィック宇宙論、ポアンカレ、ハミルトン等からの着想は数学・設計の借用であり、科学的証拠や厳密な不変量の証明は別に必要になる。

## 誤読7：「SIOAE/PIOAEとは別々のOAE Kernel？」

**違う。** 現行Sphere共通文書のOAEの正式展開は**Observer Agential Effect**。Observer / Recorder / Producerを分け、rule・revision・scopeを伴う観測を保持する。SIOAE/PIOAEはPI/SI等のカテゴリ区別を考察する語であり、専用ABIの完成を意味しない。

## 誤読8：「SphereOSが全員の意味を中央管理して決定する？」

**違う。** 管理対象は意味資源のidentity・参照・継続性と、誰がどう意味づけ・採用・拒否するかのInterface。**管理 ≠ 所有 ≠ 正統性の裁定**。自分のWorldと異なるWorldの正本を勝手に書き換えない。

SphereOSは既存OS上に載る意味側のレイヤーであって、POSIX、Linux、物理ベンダーを置換する宣言ではない。

## 誤読9：「Fold同士がつながるならすべて共有・実行可能？」

**違う。** 接続・参照・変換・採用・実行は別操作。Fold-NICの通信成功だけで別Worldの権限は増えない。Cross-Foldの作用は許可scope、Observer、revision、receipt、`unmapped_crossing`等とともに扱う。SphereそのものがFold nodeになっても例外ではない。

## 誤読10：「任意NPUが既に動く？非営利ならデータが消えない？」

**どちらも違う。** Hardware-neutralは「未来のチップも自動対応」の意味ではなく、特定vendorを抽象モデルの正本にしないという設計条件。Driver/adapterやconformanceの実装が必要。

非営利・OSSは運営インセンティブの設計であってbackup機構ではない。Client Rich、export、keys、recovery、fork、independent referenceが揃って初めてProvider Exitを試験できる。

## 状態を残しておく設計上の問い

次は**未確定・要検証**であり、この説明で正本仕様を決めない。

1. M元のDynamic Graphに対して、どの構造的性質を保存するMappingと呼ぶか。厳密な不変量や反例は何か。
2. `ΔΦ`の演算域と、異World間で比較不能な状態をどう表すか。
3. FAMの`∇φ`と横断概念`∇Φ`の対応をどのRegistry・revisionで記述するか。
4. SIOAE/PIOAE等のカテゴリをcoreに置かずに、どのprofileで後付けできるか。
5. SphereをFold nodeとして見たときのidentity、recursion stop、permission、migration receiptの互換試験。
6. Fold-NICとFold8Gのnamespace、IAM、Transport、meaning境界の実装責務と現在の完了範囲。
7. 特定NPU/GPGPU等のcapability negotiation、未対応operation、精度・性能・障害の試験。
8. 「意味資源可搬」を成立させるexport、private state、identity continuity、provider disappearance試験。
9. 非営利運用とOSS licenseの適用境界、第三者Worldの閉鎖権、upstreamのfork可能性。

## 読者向け判定手順

文書・発言・実装・評価を読むとき、以下を独立に確認する。

- **Layer**：宗教経験、Narrative、設計仮説、数学、測定fact、実装receiptのどれか。
- **Observer**：誰が、何を、どの規約で見たか。Producerと混同していないか。
- **Scope**：どのWorld／Fold／revision／法域／実行環境か。
- **Status**：提案、設計修正中、実装、試験済み、本番、EOLのどれか。
- **Boundary**：`unknown`、停止条件、実装なし、権限なしを消していないか。

疑義があれば、存在しない実装や当時のOAEを推定生成せず、具体的な反例と該当repository・revisionをIssueへ持ち込む。

### 参照

- [横断アーキテクチャ正本](semantic-fold-os-architecture.ja.md)
- [Sphere Context Dimension OS](sphere-context-dimension-os.ja.md)
- [FAM / Infoton reference boundary](fam-infoton-reference-boundary.ja.md)
- [FQuery selectors and lossless normalization](https://github.com/saitoomituru/FQuery/blob/main/docs/specification/fquery-selector-traversal-normalization.ja.md)
- [FQuery FAM JSON Core](https://github.com/saitoomituru/FQuery/blob/main/docs/specification/fam-json-core.ja.md)
- [日本語正本・英語外部GUIの規約](../operations/default-language-and-translation-policy.ja.md)
