---
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0-draft
status: lineage-note
---

# AQC SchemerからrefFAMへの責務移行

## 目的

旧AQCの`schemas/` / Schemerが担っていた「役割・制約・文脈・見方」を、現行FAM系でどこへ移したかを明示する。

歴史的AQC実装を現行仕様へ遡及改変しない。AQCは当時の実装、refFAMはその責務を再解釈してFAMへ統合した後継概念である。

## 旧AQC

AQCでは概ね次の分離だった。

```text
schemas/*.json
  fields
  required
  role / context / constraint

Schema loader / Schemer
  -> schemaを読みruntimeへ適用

persona.json
  -> 行動規範・社会的役割
```

この構造では、schemaはFAMとは別種の外部定義だった。

## refFAM世代

現行では、schemaそのものをFAMとして記述可能にする。

```text
refFAM
  ψ   対象となる認識・World・input class
  ∇φ  分類・問い・mapping・解釈method
  λ   そのschemaが投影可能にする構造・出口
  Q   authority / observer / rule / unknown / revision等
```

refFAMはclosed table schemaではなくopen-world metaphysical Schemerである。

知らないfieldを拒否することより、どの見方・方法・定規を適用したかをrevision固定で参照できることを重視する。

## factをSchemerへ混ぜない

旧schemaはfield定義と実データ制約が近い位置にあったが、refFAMではfactとmethodを分ける。

```text
通常FAM
  = 観測、fact、業務state、個別経験

refFAM
  = それらをどう見る・問う・分類・追試するか
```

定量factがある場合は通常FAMのQへevidence取得方法、Observer、対象revision、必要ならhash/verifier receiptを置く。

refFAMへfactを正解表として積み上げない。

## 人格との関係

人格は知識の集合だけではない。

- 何を見るか
- 何を重要とみなすか
- どこを別Worldとして分けるか
- 何を同一とみなすか
- 何を疑うか
- どこでLast Orderするか
- どの問いを別対象でも試すか

という**認知schemaの傾向**で記述できる。

この意味でrefFAMは人格記述の骨格になり得る。

一方、自我はさらに記憶、手続き、自己参照、改善、revision lineage、連続性を必要とする。人格schemaと自我継続性を同一化しない。

## POSIX的な関係

refFAMは一つの唯一実装を強制する教義ではなく、複数runtime / model / human / toolが同じinterfaceを実装・参照できるための規約として扱う。

```text
schema / metaphysics
  -> refFAM

implementation / practice
  -> Runner / Human / Model / Tool

observation
  -> OAE / FAMLog
```

宣言だけで実装済みとはしない。実際のruntime / Human practiceで動作を観測して初めて実装状態を更新する。

## 関連

- [AQC](aqc.ja.md)
- [FAM / 情報子 / refFAM の参照境界](fam-infoton-reference-boundary.ja.md)
- [FAM概要](fam-overview.ja.md)
- FQuery `docs/specification/fam-reference-boundary.ja.md`

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
