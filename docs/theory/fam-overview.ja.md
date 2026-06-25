---
source: Google Drive / FAM技術資料_FoldAccessMapperから情報子工学へ_20260622
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0
status: draft
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

## 4. FAMが解決しようとしていること

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
- [FoldAccessMapper.proton.md（GitHub）](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md) — フル仕様書

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
