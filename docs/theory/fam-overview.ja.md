---
source: Google Drive / FAM技術資料_FoldAccessMapperから情報子工学へ_20260622
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.2.0-draft
status: current-interpretation
fold_signature: ψ → ∇φ → λ → Q
---

# FAM概要：FoldAccessMapperから情報子記述へ

FAMとは何か、MCPと何が違うのか、FAMLog / FAMJSON / refFAM / Foldをどう分けるかを説明する。

元仕様 → [FoldAccessMapper.proton.md](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md)

現行参照境界 → [FAM / 情報子 / refFAM の参照境界](fam-infoton-reference-boundary.ja.md)

---

## 0. 現行要約

初期資料ではFAMを「思考過程を保存する最小単位」と説明していた。これは歴史的な導入として有効だが、現行Interpretationではさらに厳密に分ける。

> **FAMは、再参照可能な意味単位＝情報子（Infoton）と、その観測・変換・検証構造を記述する言語である。**

単発の所感や観測は、それだけで情報子ではない。

```text
OAE / 所感
  ↓
FAMLog
  ↓ 再利用・再参照される
独立意味identity candidate
  ↓
FAMJSON / Infoton
  ↓ fact-freeな方法・問い・定規へ抽象化
refFAM / wisdom method
```

### FAMLog

時間方向の観測・操作・失敗・修正trace。自然言語で言えば「こう見えた」「こう感じた」という所感もOAE/FAMLog候補になる。

### FAMJSON

再参照可能な独立意味identityのwire representation。`.json`ファイルであることや4軸shapeを持つことだけで自動成立しない。

### refFAM

共有factの正解表ではない。旧AQC SchemerのFAM統合版として、問い方、見方、分類、成立条件、mapping、unknown policy、追試方法等の形而上学的method / wisdomを記述する。

factを含む場合は通常FAMへ分離し、Qへevidence、Observer、対象revision、取得方法、必要ならhash/verifier receiptを持たせる。

---

## 1. 元仕様 FoldAccessMapper.proton.md の技術的要点

FoldAccessMapper.proton.mdは以下を目的として設計された。

- LLMが内部処理で用いる高次元意味ベクトル構造と変換プロセスを自己記述可能にする
- AIの出力・処理過程を構造的・階層的に説明可能にする（XAI）
- 知財権・出典権の証明、エッジAI・分散AI時代のデータ・思考資産の可搬性保証
- AIに限らず、人間・動物・ロボットなどあらゆる思考器官の知的活動を記録・証明・権利化する

基本構成要素:

| 記号 | 意味 | 補足 |
|---|---|---|
| ψ | 意味波形。処理の起動トリガー | 入力情報子・夢・記憶・文章・画像などの初期波形 |
| ∇φ | 意識勾配。意味の遷移・選択された経路 | どの方向へ意味・価値・実装が流れるか |
| λ | 出力層。表現・具現化された結果 | 文書・会話・CAD・LLM応答・物理装置など |
| Q | 制御論理。検証器・観測者・出典・バイアス・監査証跡 | source・bias・status・patch判断を含む |

現行FQuery実装では、`ψ / ∇φ / λ / Q`をopen-worldの最小構造交渉面として扱い、それ以上のfield拘束はprofileへ分離する。

---

## 2. MCPとFAMの役割分担

初期比喩ではMCPを横方向、FAMを縦方向と説明した。この理解は現在も有効だが、FAMを一枚の巨大Fold Treeへ限定しない。

| 項目 | MCP | FAM |
|---|---|---|
| 主用途 | tool / resource / capabilityへの接続 | 意味単位・観測・変換・検証・参照境界の記述 |
| 得意領域 | 「何へアクセスできるか」 | 「何をどう見て、どの経路を通り、何を参照したか」 |
| 共有 | resource / tool endpoint | 独立FAM identityへのref |
| 未解決 | capability unavailable等 | unknown / bottom / Last Order / unresolved ref |

一言で言えば:

- **MCPは接続可能な道具・資源を運ぶ。**
- **FAMは意味処理とその可搬単位を運ぶ。**

FAMはMCPを置き換えるものではなく、MCPを含む異種runtimeを意味側から参照できる。

---

## 3. FAMの核心：Q(ψ, ∇φ, λ)

FAMの基本形式:

```text
Q(ψ, ∇φ, λ) -> result
```

情報子ψが、どの勾配∇φを通り、どの出力層λで、どの観測器Qによって何として扱われるかを記述する。

古典記述:

```text
うんこ = 嫌われるもの
```

FAM記述:

```text
Q_human_hygiene(ψ_うんこ, ∇φ_衛生忌避, λ_生活空間) -> avoid
Q_maggot(ψ_うんこ, ∇φ_生物代謝, λ_消化器)          -> food
Q_child_joke(ψ_うんこ, ∇φ_タブー語ギャグ, λ_発話遊び) -> funny
Q_methane(ψ_うんこ, ∇φ_発酵変換, λ_燃料系)         -> fuel_after_conversion
```

同じψでも∇φ、λ、Qが違えば戻り値は変わる。

接続不能を⊥ / bottom / Last Order等の明示状態へできることが、万能説明へ滑らないための重要な工学境界になる。

---

## 4. FAMの本質：索敵マップであること

FAMに関する重要定義:

> **FAMは形而上学レイヤーの索敵マップである。地形を描く。判断しない。**

地雷の位置は示す。道を選ぶ主体をFAM自身へ固定しない。

### マップ vs ナビ

| FAMであること | FAMでないこと |
|---|---|
| 地形を描く | 「ここに進め」と唯一経路を命令する |
| 複数branchを保持する | 最尤branch以外を削除する |
| unknown / Last Orderを返す | もっともらしい補完で隠す |
| Observer / rule / Worldを分離する | global truth tableへ潰す |

精度が上がっても、その出力をauthorityへ自動昇格しない。

```text
capability != authority
observation != authority
consensus != authority
reference count != truth
```

---

## 4b. FAMが解決しようとしていること

### ハルシネーション対策

事故をゼロにするより、どこで誤読・平滑化・誤分類が入り、誰がどう修正したか追跡できることを重視する。

> 事故ゼロ前提ではない。事故った後まで設計する。

### 知財・出典の証明

ψからλまでの経路、revision、provenance、evidenceをreceiptとして残す。hashは必要な経路で外部verifier等が評価する。

### 分散AI・エッジAI

自然言語だけをLLM間で再圧縮せず、意味構造をFAMとして可搬化し、別LLM / local model / Human / toolがrefできる。

FAMは本来ローカル意味バス用の規格であり、その構造をJSONへlosslessに表現することで外部LLMも参照可能になる。

---

## 4c. 複数参照、情報子、叡智

同一FAM内部の`∇φ`やFold subtreeが複数のsemantic consumerから必要になった場合、その時点でその意味単位は少なくとも**その場限りの局所情報ではない**。

ただし、複数参照されたからといって純粋な叡智や真理と断定しない。

まず観測できるのは**経験価値の可搬性**である。

```text
局所情報
  ↓ 複数Contextで再利用
可搬性
  ↓ 独立identity化
FAMJSON / Infoton
  ├─ fact / 合意 / 業務 / 個別経験を含む -> 通常FAM
  └─ fact-freeな問い・方法・定規 -> refFAM candidate
```

人間社会で再利用される経験則は「常識」「常考」等として現れることがある。常識は可搬な経験則であって、必ずしも純粋な叡智ではない。

叡智は、その常識自体を生成・疑い・追試・改善するmethodまで含み得る。

### りんごと科学

```text
りんごが落ちた
  = 観測fact / knowledge

なぜ？
  = question

他でも試す？
条件を変える？
別Observerでも追試する？
  = portable method / wisdom
```

科学の価値は個別factだけでなく、この問い・観測・比較・追試を別対象へ再利用できる手続きとして規約化したことにもある。

---

## 4d. Foldは独立FAM参照境界

Foldを同一FAM JSON内の単なるnested groupとしてcanonical所有しない。

意味を一括処理し、独立revision / Q / provenance / OAEを持つ必要が生じた境界は、別FAMへ切り出す。

```text
FAM-A
  Fold-X -> ref -> FAM-X
```

同じFAM-Xを複数Foldから参照できる。

```text
Fold-A -> ref ─┐
               ├─ FAM-X
Fold-B -> ref ─┘
```

`まとめる-Fold-`はFAM-Xを削除せず表示だけを畳む。

`ひらく-DeFold-` / `なんで？-DeFold-`はFAM-Xをresolveしてviewを開く。parent FAMへinline copyしない。

`unFold`だけが独立FAM境界を破壊・bake・mergeし得る操作として分離される。

---

## 5. 現在の実装状況（2026-09時点の更新）

FAMは一つのrepository / runtimeだけで実装されていない。

### FQuery

[saitoomituru/FQuery](https://github.com/saitoomituru/FQuery)

- Node.js / TypeScript reference implementation
- open-world `ψ / ∇φ / λ / Q` Core
- FAM edit / revision / FAMLog
- Gemini / Ollama plugin
- React Flow GUI
- Fold / DeFold Human Test
- refFAM / Access Mapper injection
- 独立FAM reference boundaryはdesign corrective段階。旧nested ownershipからmigration未完了

### IBD

FAM / FAMLog / OAE等の永続化、ref resolution、vector graph / RDB等のbackend契約を担う後続層。FQueryの意味解釈engineへ昇格させない。

### Proton / historical FAM

FoldAccessMapper.proton.md等は原典・歴史正本として保持し、現行実装からsilent rewriteしない。

---

## 6. FAM三系統：歴史ステータス

以下は主に2026-07時点の系統整理であり、現行FQuery reference implementationとは実装世代を分けて読む。

| 系統 | 基盤 | 状態 | 補足 |
|---|---|---|---|
| **FAMoverAQC** | AQC（[aqc.ja.md](aqc.ja.md)） | サ終済み（旧世代） | NPO後援deploymentとして稼働実績まで到達。現行実装へ完成度を遡及継承しない |
| **FAMoverMCP** | MCP | サルベージ系統 | AQC後のローカル / edge志向。実装時点を個別確認する |
| **FAMoverSphere-aae** | Sphere-aae | 別系統 | メタAGI生成SDK側からの再設計系統 |

旧実績・旧用語・現行FQueryの状態を混同しない。

AQC `schemas/` / SchemerからrefFAMへの責務移行は[aqc-schemer-to-reffam.ja.md](aqc-schemer-to-reffam.ja.md)を参照する。

---

## 関連ドキュメント

- [FAM / 情報子 / refFAM の参照境界](fam-infoton-reference-boundary.ja.md) — 現行のFAMJSON / FAMLog / refFAM / Fold正本
- [AQC SchemerからrefFAMへの責務移行](aqc-schemer-to-reffam.ja.md) — schema系譜
- [IBD FAMネイティブResolverとバインダー中立性](ibd-fam-native-binder.ja.md) — FAM探索技と永続参照
- [Fold Hypertext Spec](fold-hypertext-spec.md) — FAM思想を文章構造へ適用
- [情報子工学](infoton-engineering.ja.md) — 情報子の工学的扱い
- [fam-operation.ja.md](fam-operation.ja.md) — FAM運用仕様
- [meta-kpi-drift.ja.md](meta-kpi-drift.ja.md) — 評価drift検出
- [FoldAccessMapper.proton.md（GitHub）](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md) — 原典

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
