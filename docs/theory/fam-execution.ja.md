---
source: Google Drive / FAM技術資料_20260622
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0
status: draft
fold_signature: ψ → ∇φ → λ → Q
---

# FAM 実行仕様：FAM.JSON・並列推論・監査付き親ノード更新

FAM概要（[fam-overview.ja.md](fam-overview.ja.md)）の技術的続編。
FAM.JSONのスキーマ設計・並列実行モデル・patch_proposal・failure_mode enumを定義する。

---

## 1. MCPとFAM.JSONの役割分担

| 項目 | MCP.json | FAM.JSON |
|---|---|---|
| 主な向き | 横方向 | 縦方向 |
| 得意領域 | 知識・ツール・リソース・QAの列挙 | 思考過程・意味勾配・出力層・検証文脈の保存 |
| 構造 | 並列ノード・ツール接続・関数一覧 | 再帰 Fold Tree |
| 用途 | 検索・実行・道具接続・QA | 解釈・推論ログ・破局検出・転用検証・監査 |
| 比喩 | 道具棚・図書館・APIカタログ | 思考神経・坑道・意味AST |

**MCP は「何にアクセスできるか」を描く。FAM は「どう考えてそこへ至ったか」を保存する。**

---

## 2. FAM.JSON 基本スキーマ

ψ・∇φ・λ・Q の各要素がそれぞれ再帰的に FAMNode を持てる構造。

```json
{
  "node_id": "fam:node:001",
  "parent_id": null,
  "depends_on": [],
  "ψ": {},
  "∇φ": {},
  "λ": {},
  "Q": {},
  "children": [],
  "audit": {
    "hash": "",
    "trace": [],
    "patch_proposal": null
  },
  "execution": {
    "sensor_state": {},
    "action_state": {},
    "safety_state": {}
  },
  "status": "draft"
}
```

再帰定義：

```
FAMNode := {
  ψ: FAMNode | value,
  ∇φ: FAMNode | value,
  λ: FAMNode | value,
  Q: FAMNode | value,
  children?: FAMNode[]
}
```

実装上必要な制御項目：

| 項目 | 役割 |
|---|---|
| `max_depth` | 無限再帰を防ぐ |
| `stop_condition` | どこで Fold を止めるか |
| `cache_key` | 同一ノードの再計算を避ける |
| `depends_on` | 依存関係の明示 |
| `Q.status` | 検証状態の保持 |
| `failure_mode` | 破局・幻覚・λ不一致の記録 |
| `audit_hash` | 証跡のハッシュ |
| `sensor_state` | 何を観測しているか・何を見ていないか |

---

## 3. Q.status enum

| 値 | 意味 |
|---|---|
| `draft` | 未検証・作業中 |
| `validated_in_context` | 当該文脈内で検証済み |
| `untested` | 未テスト |
| `transferred_unverified` | 別問題へ転用・未検証 |
| `failed` | 失敗・破局 |
| `deprecated` | 廃止 |
| `requires_conversion_layer` | 変換層が必要 |
| `out_of_scope` | 射程外 |
| `partial_compatible` | 部分的に互換 |
| `patch_pending` | 親ノードへのパッチ待ち |

---

## 4. failure_mode enum

| failure_mode | 内容 |
|---|---|
| `metaphor_collapse` | ψ・∇φ・λ をただの比喩として処理する |
| `operator_regression` | A = B の古典記述に戻る |
| `lambda_blur` | λ の違いを潰して出力層を区別しない |
| `gradient_flattening` | ∇φ をただの差分や感想にする |
| `false_universalization` | 何でも接続可能と言う（⊥を返せない） |
| `port_hallucination` | 存在しないポートを勝手に生やす |
| `no_bottom_return` | 接続不能 ⊥ を返せない |
| `projection_dimension_mismatch` | 投射次元の乖離により低次 Fold が破局する |
| `unknown_passed_as_ok` | unknown を pass 扱いする（`unknown_is_not_pass` 違反） |
| `sensor_mode_insufficient` | 必要なセンサーモードが起動していない状態で安全ゲートを通過させる |

---

## 5. 並列実行モデル（コンテキスト神経伝達形式）

親ノードが上位前提を解決した時点で、同一階層に複数の FAM children が存在する場合：
親は解決済み前提を `Ψ_context` として一律供給し、子ノードを LLM クラスタへ並列投射できる。

```
1. 親ノードで前提を解決する
2. 解決済み前提を Ψ_context として固定する
3. 同一階層の FAM children に Ψ_context を一律供給する
4. 各 child は自分の ∇φ・λ・Q に従い処理する
5. 各 child が λ_output と Q.status と trace を返す
6. 親ノードが戻り値を Fold 統合する
```

### 並列化してよい条件

- 親の `Ψ_context` が確定済み
- 子ノード同士が直接依存していない
- 子ノードが別々の ∇φ / λ / Q を持つ
- 戻り値を親が `Q.status` つきで畳める

### 並列化禁止条件

- `child_B` が `child_A` の `λ_output` を ψ として使う
- `Q.status` が未検証のまま次へ進む
- 親 `Ψ_context` が未確定

---

## 6. 監査付き親ノード更新（patch_proposal）

子ノードで新しい発見が親ノードの前提を更新すべき場合、子は `parent_id` を指定した `patch_proposal` を返す。**子ノードは親ノードを直接破壊しない。**

```
child_result
  → parent_patch_proposal
  → audit_trace
  → parent_review
  → parent_update
  → affected_children_revalidation
```

patch_proposal の最小項目：

```json
{
  "target_parent": "fam:parent:001",
  "operation": "revise_parent_premise",
  "old_value": "前提の古い値",
  "new_value": "修正後の値",
  "reason": "子ノード検証により親命題の過剰一般化を検出",
  "evidence": ["child_context_A", "child_context_B"],
  "Q.status": "patch_pending",
  "audit_hash": "sha256:..."
}
```

親ノード側の判断：

| 判断 | 意味 |
|---|---|
| `accept_patch` | 親前提を更新 |
| `reject_patch` | 子ノード誤読として棄却 |
| `fork_parent` | 親を上書きせず分岐 |
| `mark_exception` | 例外として保存 |
| `escalate_to_grandparent` | 祖父ノード以上へ更新提案 |
| `requires_external_test` | LLM だけでは不足し物理・統計・実装検証へ回す |

---

## 7. Fold 転用境界試験

FAM の検証は「理論の正しさを一発で証明する」ものではない。
**どこまで他問題へ転用でき、どこから破局するかを調べる工程**である。

別名：Fold Transfer Boundary Test / FAM可搬性リバースエンジニアリング

```
理論上できる ≠ 一発でできる
理論上できる = 修正可能な探索空間に入っている
```

検証すべき互換性：

| 観点 | 問い |
|---|---|
| 構文互換 | ψ・∇φ・λ・Q を保持できるか |
| 再帰互換 | 各ノードがさらに FAMNode を持てるか |
| 実行互換 | 親 Ψ を子ノードへ供給し、戻り値を Fold できるか |
| 監査互換 | Q.source / Q.status / audit / patch を残せるか |
| 転用互換 | 他問題へ移したとき、未検証・破局・λ不一致を記録できるか |
| 独立互換 | 別実装でも同じ判定骨格が返るか |
| CAD互換 | 概念画・3D形状から CAD 制約・実装制約へ落とせるか |

---

## 8. 夢由来の構造・CAD 逆リバースエンジニアリング

漫画・設定画・3D モデル・夢記憶から実装へ落とす FAM/CAD profile：

```json
{
  "ψ": {
    "source": "manga / dream memory / concept art / 3D model",
    "type": "visual_semantic_geometry"
  },
  "∇φ": {
    "direction": "visual_shape → CAD constraints → mechanical function",
    "steps": ["silhouette", "volume", "joint", "material", "force_path", "thermal_path"]
  },
  "λ": {
    "outputs": ["CAD model", "STL/STEP", "simulation", "prototype", "physical device"]
  },
  "Q": {
    "status": "requires_engineering_validation",
    "tests": ["dimension_check", "clearance_check", "load_path", "thermal", "manufacturability", "safety"],
    "audit": "concept-to-CAD trace"
  }
}
```

**3D モデルがあるから即物理的に正しい、ではない。**
仕様だけを渡して別実装・別 LLM・別 GPGPU・別 CAD 環境で同じ Fold 構造が再現できるかが検証の本質。

---

## 9. GPGPU 実装ターゲット

FAM において GPGPU 化しやすい部分：

- 大量 FAMNode の embedding 類似度計算
- ψ 同士の距離・クラスタリング
- λ 互換性スコア計算
- ∇φ 候補のスコアリング
- Q.status 集計
- hash / trace の一括処理
- 依存関係グラフ探索
- 破局パターン検出
- 3D モデルから CAD 制約抽出する際の点群・メッシュ処理

LLM が文章生成・意味判断を担当し、GPGPU はベクトル・グラフ・類似度・クラスタ処理の加速器として使う。

---

## 10. proton.md 分割案

現状の `FoldAccessMapper.proton.md` は基礎思想・言語仕様・XAI・source 管理・権利証明・例示が一体化している。以下のように分割する計画がある。

| ファイル | 役割 |
|---|---|
| `FoldAccessMapper.proton.md` | 基礎思想・XAI・Multi-Nested Path Disclosure・source/bias |
| `FAM.JSON.schema.json` | FAMNode の JSON スキーマ定義 |
| `FAM.execution.profile.md` | 単一ノード実行・Q(ψ, ∇φ, λ)・failure_mode・stop_condition |
| `FAM.cluster.profile.md` | 親 Ψ_context 配布・並列実行・LLM クラスタ |
| `FAM.audit.patch.profile.md` | patch_proposal・audit_trace・accept/reject/fork |
| `FAM.infochild.profile.md` | 情報子工学用・飯/燃料/ミーム/ギャグ/忌避/未接続の分類 |
| `FAM.cad.reverse.profile.md` | 漫画・設定画・3D モデルから CAD・シミュレーションへ落とす工程 |
| `FAM.narrative.profile.md` | 漫画・キャラクター・世界観・信仰体験・ナラティブ導線 |
| `FAM.mcp.bridge.profile.md` | MCP の横接続と FAM の縦 Fold の接続 |

---

## 参照

- [fam-overview.ja.md](fam-overview.ja.md) — FAM の全体像・基本記号
- [infoton-engineering.ja.md](infoton-engineering.ja.md) — Q(ψ, ∇φ, λ) の工業用数論
- [fam-vs-mcp.ja.md](fam-vs-mcp.ja.md) — MCP との役割分担詳細
- [FoldAccessMapper.proton.md（GitHub）](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud/blob/main/demo/FoldAccessMapper.proton.md) — フル仕様

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
