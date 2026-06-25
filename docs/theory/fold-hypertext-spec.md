---
source: Google Drive / fold_hypertext_spec.md
license: CC-BY 4.0
author: ZeroRoomLab / @K_chachamaru
version: 0.1.0
status: draft
---

# Fold構造文章論：情報子工学的ハイパーテキスト仕様書

## Fold Hypertext Architecture — Infoton Engineering Approach

**version:** 0.1.0
**author:** ZeroRoomLab / @K_chachamaru
**license:** CC-BY 4.0
**status:** draft

---

## 0. この仕様書について

これは文章構造そのものを情報子工学・Fold理論・オブジェクト指向・プロトコル設計の観点から記述した仕様書だ。

特定のコンテンツを解説するものではない。**文章がどういう構造を持つと探索体験を最大化しながら情報密度を保てるか**という設計論だ。

事例は最小限に抑える。構造が先で事例は後だ。

---

## 1. 基本定義

### 1.1 情報子（Infoton）としての文章単位

情報子工学では、あらゆる情報単位を以下の属性を持つオブジェクトとして扱う。

```
Infoton {
  φ: 内容（content）      // 何が書かれているか
  ψ: 文脈（context）      // どの座標に置かれているか
  λ: 接続（linkage）      // 何と繋がっているか
  Q: 解像度（resolution） // どの粒度で記述されているか
}
```

文章における情報子の最小単位は**問いと答えのペア**だ。

```
InfPair {
  Q_small: 小さな問い
  A_small: 小さな答え
  resolution: ローカル（その段落内で完結）
}
```

### 1.2 Fold構造の定義

Fold構造とは、同一の命題が異なる解像度（Q）で再帰的に現れる文章アーキテクチャだ。

```
FoldStructure {
  Q_large:  大きな問い（冒頭に置く・答えは置かない）
  body:     [InfPair × n]（小さな問いと答えの配列）
  A_large:  大きな答え（末尾に置く・冒頭に置かない）

  property: ∀ InfPair[i] → isomorphic(FoldStructure)
  // 全ての小さな問いと答えは大きな構造と同型
}
```

**フラクタル性**：どの解像度で切り取っても同じ構造が出る。

### 1.3 M次元展開

同一の命題が異なるスケール（次元）で同型として現れることをM次元展開と呼ぶ。

```
M_dimension {
  level_0: 個人（一人の行動・判断）
  level_1: コミュニティ（集団の動態）
  level_2: 産業（市場・技術の展開）
  level_3: 国家（制度・歴史）
  level_4: 文明（思想・パラダイム）

  property: structure(level_i) ≅ structure(level_j)
  // 全レベルで構造が同型
}
```

---

## 2. オブジェクト指向文章モデル

### 2.1 クラス定義

```
class Article {
  // プロパティ
  title: String           // 大きな問いを含む
  hook: InfPair           // 最初の小さな問いと答え
  chapters: [Chapter]     // 章の配列
  conclusion: Infoton     // 大きな答え

  // メソッド
  enter(chapter_index)    // どこからでも入れる
  expand(direction)       // 横（同レベル）または縦（別レベル）に展開
  fold()                  // 全体を一文に畳む
}

class Chapter {
  title: String
  seed_question: InfPair  // 章の入口となる問いと答え
  body: [Section]

  // 各章は独立して完結する（standalone: true）
  // 前章の知識を必要としない
  standalone: Boolean = true
}

class Section {
  question: String
  answer: Infoton
  resolution: Enum { micro, meso, macro }
  links: [Section]        // 横展開の接続先
  depth_links: [Section]  // 縦展開の接続先
}
```

### 2.2 継承関係

```
FoldDocument
  └── Article
        ├── Chapter (standalone)
        │     ├── Section (micro)
        │     ├── Section (meso)
        │     └── Section (macro)
        └── Conclusion
              └── folds back to Q_large
```

---

## 3. プロトコル定義

### 3.1 読者プロトコル（Reader Protocol）

Fold構造文章は読者に読み順を強制しない。代わりに以下のプロトコルを提供する。

```
ReaderProtocol {
  entry_point: any Chapter  // どこからでも入れる

  navigate {
    horizontal: 同レベルの別章へ（同じ解像度で横移動）
    vertical:   同テーマの別解像度へ（縦移動）
    fold_back:  大きな問いに戻る
    exit:       いつでも離脱可能（離脱コストゼロ）
  }

  guarantee {
    // どこから入っても局所的に完結する
    local_completion: true
    // 全部読んだとき全体構造が見える
    global_coherence: true
  }
}
```

### 3.2 著者プロトコル（Author Protocol）

```
AuthorProtocol {
  forbidden {
    answer_first: false     // 大きな答えを冒頭に置かない
    explain_structure: false // Fold構造を説明しない（体験させる）
    force_order: false      // 読む順序を指定しない
    chapter_dependency: false // 章間の依存関係を作らない
  }

  required {
    hook: true              // 大きな問いを冒頭に置く
    local_closure: true     // 各章が単独で完結する
    isomorphism: true       // 各章が全体と同型になるよう設計
    answer_last: true       // 大きな答えは最後に置く
  }
}
```

### 3.3 接続プロトコル（Link Protocol）

```
LinkProtocol {
  internal_link {
    type: "fold_reference"  // 同一文書内の別解像度への参照
    direction: horizontal | vertical
    cost: 0                 // 参照コストゼロ
  }

  external_link {
    type: "sibling_document" // 別コラムへのリンク
    requirement: standalone  // リンク先も独立完結している
    direction: "suggested, not required"
    // 読まなくても現在地は完結する
  }

  anti_pattern {
    required_prerequisite: forbidden // 「前章を読んでいること」の要求禁止
    dead_end: forbidden              // 行き止まりの禁止
    forced_path: forbidden           // 唯一の読み順の強制禁止
  }
}
```

---

## 4. 情報密度の設計原則

### 4.1 解像度の三層モデル

```
ResolutionLayer {
  micro: {
    // 具体的・事例的・感覚的
    // 誰でも入れる入口
    // 例：「ソシャゲに10万円課金した人間がいる」
    target: 初読者
    function: entry_point
  }

  meso: {
    // 概念的・構造的・分析的
    // 本論の展開層
    // 例：「性悪説とはプレイヤーの仕様書だ」
    target: 関心読者
    function: elaboration
  }

  macro: {
    // 原理的・哲学的・一般化
    // 全体を統合する層
    // 例：「目的関数を先に置く」
    target: 深読者
    function: synthesis
  }
}
```

### 4.2 密度の配分

```
DensityDistribution {
  micro_ratio:  0.3  // 入口・事例
  meso_ratio:   0.5  // 本論
  macro_ratio:  0.2  // 統合

  // 全体での理想的な密度分布
  early_chapters: micro_heavy    // 最初は入りやすく
  middle_chapters: meso_heavy    // 中盤で本論
  final_chapters: macro_heavy    // 末尾で統合

  // ただし各章が単独で完結するために
  // 各章内でmicro→meso→macroの流れを持つ
  chapter_internal: ascending_resolution
}
```

---

## 5. ハイパーテキスト構造論

### 5.1 従来のハイパーテキストとの差異

```
Traditional Hypertext {
  structure: graph（有向グラフ）
  navigation: link following
  problem: lost_in_hyperspace（どこにいるか分からなくなる）
  coherence: external（目次・地図が必要）
}

Fold Hypertext {
  structure: fractal（フラクタル）
  navigation: resonance（共鳴する場所から入る）
  solution: local_completion（どこにいても完結している）
  coherence: internal（構造が自己説明的）
}
```

### 5.2 囲碁モデル vs チェスモデル

```
Chess Model（従来型文章）{
  // 決まった順序で読む
  // 手順を知らないと理解できない
  entry: fixed (page 1)
  dependency: sequential
}

Go Model（Fold Hypertext）{
  // どこに石を置いてもいい
  // わかるところから始める
  // そこから地が広がる
  // 全体は後で見えてくる
  entry: any point
  dependency: none (local_completion)
  expansion: emergent
}
```

### 5.3 信長の野望モデル

```
NobunaModel {
  entry: any chapter (= 任意の大名)
  expand: horizontal (隣の章・同解像度)
         vertical   (同テーマの別解像度)
  completion: emerges from exploration
}
```

---

## 6. オブジェクト間の関係設計

### 6.1 同型性の保証

```
Isomorphism {
  chapter.structure ≅ article.structure

  具体的には：
  - 各章に「小さな問い」がある（大きな問いの縮小版）
  - 各章に「展開」がある（本論の縮小版）
  - 各章に「局所的な答え」がある（大きな答えの縮小版）

  // 読者が一章だけ読んだとき
  // 全体の構造を直感的に感じられる
}
```

### 6.2 メタ情報の埋め込み

```
MetaEmbedding {
  forbidden: explicit_meta_commentary
  // 「この文章はFold構造で書かれています」は書かない

  required: implicit_meta_encoding
  // 構造がコンテンツそのものになっている
}
```

---

## 7. プロトコルスタック

```
FoldHypertextStack {
  Layer 4: Experience Layer（体験層）
    ├── 探索体験の提供
    ├── 発見の快感（「全部同じ話だった」という収束体験）
    └── 離脱コストゼロの保証

  Layer 3: Navigation Layer（ナビゲーション層）
    ├── entry_point: any Chapter
    ├── expand: horizontal | vertical
    └── fold_back: Q_large

  Layer 2: Structure Layer（構造層）
    ├── FoldDocument
    ├── Chapter (standalone)
    └── InfPair (micro unit)

  Layer 1: Protocol Layer（プロトコル層）
    ├── AuthorProtocol
    ├── ReaderProtocol
    └── LinkProtocol

  Layer 0: Infoton Layer（情報子層）
    ├── φ: content
    ├── ψ: context
    ├── λ: linkage
    └── Q: resolution
}
```

---

## 8. アンチパターン

### 8.1 クソゲー文章設計

```
AntiPattern {
  linear_dependency {
    // 「第一章を読まないと第二章が理解できない」
    problem: 離脱コストが高くなる
  }

  answer_first {
    // 「この文章の結論はXです。以下その説明をします」
    problem: 読者が検証モードに入る。探索体験が消える
  }

  structure_explanation {
    // 「この文章はFold構造で書かれており〜」
    problem: 体験が説明に置き換わる
  }

  over_reference {
    // 「第三章で述べたように〜」の多用
    problem: 線形依存関係の生成
  }
}
```

### 8.2 神ゲー文章設計

```
BestPractice {
  local_closure {
    benefit: 離脱コストゼロ
    benefit: どこからでも入れる
  }

  question_led {
    benefit: 探索モードに入る
    benefit: 読者が自分で発見する快感
  }

  isomorphic_chapters {
    benefit: 一章だけ読んでも全体が感じられる
    benefit: 全部読むと「全部同じだった」という収束体験
  }

  zero_exit_cost {
    benefit: 読者のストレスゼロ
    benefit: 再訪率の向上
  }
}
```

---

## 9. 実装ガイドライン

### 9.1 章の設計チェックリスト

```
□ この章だけで完結するか？
□ 前章の知識を前提にしていないか？
□ 「小さな問い」が冒頭にあるか？
□ 「局所的な答え」が章末にあるか？
□ micro（具体）→ meso（概念）→ macro（原理）の流れがあるか？
□ 次章への「フラグ」はあるか？（強制ではなく示唆として）
□ 大きな問いとの同型性があるか？
```

### 9.2 文書全体の設計チェックリスト

```
□ 大きな問いは冒頭にあるか？
□ 大きな答えは末尾にあるか？（冒頭にないか？）
□ どの章から読んでも楽しめるか？
□ Fold構造を説明する文章が混入していないか？
□ 全章が読み終わったとき「全部同じ話だった」と感じるか？
□ 外部リンクはすべて「推奨」であって「必須」でないか？
□ 章間の依存関係グラフは有向非循環グラフ（DAG）か？
```

### 9.3 情報子密度の計算

```
InftonDensity {
  target_density: 2-4 InfPairs / 1000chars

  too_sparse: < 1 InfPair / 1000chars
  // 読み物になりすぎて構造が見えない

  too_dense: > 6 InfPairs / 1000chars
  // 箱条書きになりすぎて体験が消える
}
```

---

## 10. FAMとの関係

```
FAM vs FoldHypertext {
  FAM {
    対象: AIの推論プロセス
    unit: Fold（推論の折り畳み単位）
    structure: ψ/∇φ/λ/Q四成分
    purpose: 推論の記述・接続・検証
  }

  FoldHypertext {
    対象: 人間が読む文章
    unit: InfPair（問いと答えのペア）
    structure: φ/ψ/λ/Q四成分（同型）
    purpose: 探索体験の設計・情報密度の保証
  }

  共通点 {
    // どちらもFold構造
    // どちらもψ/λ/Q的な四成分
    // どちらも局所完結・大域整合
    // どちらもM次元展開可能
    // 文章はFAMの人間向けUI実装とも言える
  }
}
```

---

## 付録A：ゲーミング宇宙論への適用例（最小）

```
GameCosmology {
  Q_large: "人はなぜ課金してまで苦労するのか？"

  chapters: [
    { seed: "性悪説って何？",       answer: "仕様書だ" },
    { seed: "管子の何が問題？",     answer: "エージェントがいない" },
    { seed: "天武天皇が変えたのは？", answer: "目的関数" },
    { seed: "ニートは何をしている？", answer: "さすらっている" },
    // ...
  ]

  A_large: "さすらえる余白のある社会が神ゲーだ"

  isomorphism: ∀chapter → { 問い・展開・局所的答え }
  m_dimension: 個人→コミュニティ→産業→国家→文明

  entry_point: any chapter
}
```

## 付録B：参照概念

```
References {
  infoton_engineering: "情報子数論入門 / ZeroRoomLab"
  FAM: "FoldAccessMapper spec v1.0 / ZeroRoomLab"
  hypertext_theory: "Ted Nelson, Vannevar Bush"
  go_model: "囲碁の着手自由性・地の概念"
  fractal_text: "フラクタル構造の自己相似性"
  OOP: "オブジェクト指向設計の継承・プロトコル概念"
}
```

---

**© ZeroRoomLab / @K_chachamaru**
*CC-BY 4.0 — 引用・転載・リミックス自由。出典明記のこと。*
