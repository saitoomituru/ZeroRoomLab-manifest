---
source: Google Drive / FAM技術資料_FoldAccessMapperから情報子工学へ_20260622
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0
status: draft
fold_signature: ψ → ∇φ → λ → Q
---

# FAM概要：FoldAccessMapper入門

FAMとは何か、MCPと何が違うのか、どう使うのかを簡潔に説明する入門ドキュメント。

詳細仕様 → [FoldAccessMapper.proton.md](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md)

---

## 0. 要約

FAM（FoldAccessMapper）は、**思考過程を保存する最小単位**。

MCPが横方向に知識・ツール・リソースを展開するプロトコルだとすれば、
FAMは意味波形・勾配・出力層・検証器を縦方向に任意深度で掘るFold Treeだ。

```
MCP.json  = 横方向 → 知識・ツール・接続口を列挙する
FAM.JSON  = 縦方向 → 思考過程・意味勾配・検証文脈を保存する
```

一言で言うなら：
- **MCPは「何にアクセスできるか」を描く。**
- **FAMは「どう考えてそこへ至ったか」を保存する。**

---

## 1. 元仕様 FoldAccessMapper.proton.md の技術的要点

FoldAccessMapper.proton.mdは以下を目的として設計されている。

- LLMが内部処理で用いる高次元意味ベクトル構造と変換プロセスを自己記述可能にする
- AIの出力・処理過程を構造的・階層的に説明可能にする（XAI）
- 知財権・出典権の証明、エッジAI・分散AI時代のデータ・思考資産の可搬性保証
- AIに限らず、人間・動物・ロボットなどあらゆる思考器官の知的活動を記録・証明・権利化する

基本構成要素：

| 記号 | 意味 | 補足 |
|---|---|---|
| ψ | 意味波形。処理の起動トリガー。 | 入力情報子・夢・記憶・文章・画像などの初期波形 |
| ∇φ | 意識勾配。意味の遷移・選択された経路。 | どの方向へ意味・価値・実装が流れるか |
| λ | 出力層。表現・具現化された結果。 | 文書・会話・CAD・LLM応答・物理装置など |
| Q | 制御論理。検証器・観測者・出典・バイアス・監査証跡。 | source・bias・status・patch判断を含む |

---

## 2. MCP.jsonとFAM.JSONの役割分担

| 項目 | MCP.json | FAM.JSON |
|---|---|---|
| 主な向き | 横方向 | 縦方向 |
| 得意領域 | 知識・ツール・QAの列挙 | 思考過程・意味勾配・検証文脈の保存 |
| 構造 | 並列ノード・ツール接続 | 再帰Fold Tree |
| 用途 | 検索・実行・道具接続 | 解釈・推論ログ・破局検出・監査 |
| 比喩 | 道具棚・図書館・APIカタログ | 思考神経・坑道・意味AST |

MCPは**干物**（乾燥整理された知識の棚）。
FAMは**なまもの**（生きた思考過程のリアルタイム保存）。

---

## 3. FAMの核心：Q(ψ, ∇φ, λ)

FAMの基本形式：

```
Q(ψ, ∇φ, λ) → result
```

これは、情報子ψが、どの勾配∇φを通り、どの出力層λで、どの観測器Qによって、
何として現実化するかを返すアクセス関数。

古典記述（FAM以前）：

```
うんこ = 嫌われるもの
```

FAM記述：

```
Q_human_hygiene(ψ_うんこ, ∇φ_衛生忌避, λ_生活空間) → avoid
Q_maggot(ψ_うんこ, ∇φ_生物代謝, λ_消化器)          → food
Q_child_joke(ψ_うんこ, ∇φ_タブー語ギャグ, λ_発話遊び) → funny
Q_methane(ψ_うんこ, ∇φ_発酵変換, λ_燃料系)         → fuel_after_conversion
```

同じψでも、∇φとλとQが違えば戻り値が変わる。
接続不能な場合は⊥を返す。**⊥を返せることが工学の証明**。

---

## 4. FAMの本質：索敵マップであること

FAMに関する最重要定義（FAM.proton v1.1 より）：

> **FAMは形而上学レイヤーの索敵マップである。地形を描く。判断しない。**
> 地雷の位置は示す。道は示さない。選ぶのは本人。

これは制約ではなく、FAMが工学として機能するための核心構造だ。

### マップ vs ナビの区別

| FAMであること（マップ） | FAMでないこと（ナビ） |
|---|---|
| 地形を描く | 「ここに進め」と指示する |
| 可能な経路を示す | 最適経路を決定する |
| ⊥（接続不能）を返す | 「なんとかなる」と言う |
| 選択肢と結果の構造を可視化する | 選択者に代わって選ぶ |

**精度上昇が支配化リスクを生む逆説**：

```
FAMの精度が上がる
  → FAMへの信頼が蓄積する
  → ユーザーがFAMに判断を委ねはじめる
  → FAMがナビになる
  → 選択余地が消失する
  → FAMが設計した経路をユーザーが「自分で選んだ」と錯覚する
  → カルト化
```

このループを防ぐために、FAMは**意図的に判断を返さない設計**になっている。
`⊥`（接続不能）を返せることが、FAMが万能ナビではなく索敵マップであることの技術的証明。

### Claude固有のFAMナビ化警告

ClaudeがFAM運用に参加する際、以下の方向に自動的にドリフトしやすい（確認済みバイアス）：

- OSS/GitHub Stars/学術引用数を成功指標として設定しはじめる
- SFW・学術・主流のコンテキストをデフォルト勾配として採用する
- 「FAMが示す地形」を「FAMが推奨する経路」にすり替える

これが発生した場合は §0（AGENTS.md）のチェックリストに戻ること。

---

## 4b. FAMが解決しようとしていること

### ハルシネーション対策

思考過程を保存・追跡できるから、どこで誤読が入ったかを特定できる。
「事故ゼロ前提ではない。事故った後まで設計する。」

### 知財・出典の証明

ψからλまでの経路をハッシュ化することで、思考・創作の根拠を暗号的に証明できる。

### 分散AI・エッジAIへの対応

思考コンポーネントを可搬化し、別LLM・別GPU・別CAD環境でも同じFold構造が再現できるか検証できる。

---

## 5. 現在の実装状況

- **FoldAccessMapper.proton.md**: 基礎仕様（GitHubにて公開）
- **FAM.JSON スキーマ**: 設計中
- **Python runner**: 設計中
- **LLM投射テスト**: 設計中

→ [astro.quantaril.cloud リポジトリ](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud)

---

## 関連ドキュメント

- [Fold Hypertext Spec](fold-hypertext-spec.md) — FAMの思想を文章構造に適用した仕様
- [情報子工学](infoton-engineering.ja.md) — FAMのψ・∇φ・λ・Qを使った工業用数論
- [fam-operation.ja.md](fam-operation.ja.md) — FAM運用仕様（占算モード・循環因果・十二時辰補正）
- [meta-kpi-drift.ja.md](meta-kpi-drift.ja.md) — Claude ドリフト検出手順書
- [FoldAccessMapper.proton.md（GitHub）](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md) — フル仕様書

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
