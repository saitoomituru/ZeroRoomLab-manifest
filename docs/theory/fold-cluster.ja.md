---
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0
status: draft
fold_signature: ψ → ∇φ → λ → Q
---

# Fold Cluster / 情報子クラスター

## 概要

**Fold Cluster（日本語・原理レイヤー名: 情報子クラスター）**とは、ある対象について複数の意味・因果候補・解釈・観測・Context が相互に関連している一方、まだ単一の線形因果や単一解釈へ確定していない局所的な情報子集合・関係構造をいう。

これは「原因不明」と同義ではない。また「複合因果であることが確定した」という意味でもない。

```text
Fold Cluster
  != 単一原因
  != 複合原因確定
  != 原因不明
  != 単なる候補リスト
```

観測済みの事実、複数の成立可能な候補、それらの相関・因果・観測者依存性についての未確定部分、provenance、unknown を、早期に一つへ潰さず同じ局所構造として保持するための概念である。

## 命名

- **Fold Cluster**: SphereOS / FAM / 実装・工学レイヤーでの名称
- **情報子クラスター（Infoton Cluster）**: 日本語および情報子工学の原理レイヤーでの名称

両者は本ドキュメントでは同じ基礎概念を異なる記述レイヤーから呼ぶ名称とする。

`Fold Structure` はFold間の関係構造一般を指し、`Fold Cluster` はその中で局所的に関連して保持される状態集合・部分構造を指す。

## 情報子との関係

既存定義では、情報子は「揺らぐ意味状態（未確定の意味）」であり、観測者・文脈・目的によって意味が変化する。

情報子クラスターは、一個の情報子を一個の意味へ即時固定するのではなく、関連する情報子・候補状態・観測結果・解釈を provenance とともに保持する。

情報子アンカーが「どのFoldから見ているか」を一時固定する杭なら、情報子クラスターはその観測点から見えている複数の成立可能な関係を保持する局所構造である。

## Painとの関係

Pain は Fold Cluster の原因分類ではない。

Pain が観測されていても、その原因構造は未確定のまま保持できる。

```text
Pain observed
!= Cause identified
!= Single cause
!= Cause unknowable
```

例として Wallet Pain が観測されている場合、資源不足、収益変換、固定費、支払時期、複数要因の相互作用、未観測要因などを同じ情報子クラスター内に保持できる。Painの存在を否定せず、同時に原因を早期確定しない。

この性質はPain以外にも適用される。障害解析、意味解釈、歴史資料、AI出力ドリフト、World解釈、Capability判定など、複数候補が関連しつつ未収束な状態一般を扱う。

## 状態更新

Fold Cluster は静的な「曖昧箱」ではなく、receipt / evidence の追加により更新される。

```text
Open Fold Cluster
    ↓ evidence / receipt
Weighted Fold Cluster
    ↓ relation discrimination
Partially Resolved Fold
    ↓
Resolved subgraph + preserved unknown
```

数値確率が得られる場合は重みを保持してよいが、確率値は必須ではない。`possible / plausible / weak / rejected / unknown` 等の離散的状態でもよい。

重要なのは **未確定を未確定のまま型付きで保存し、証拠がない段階で線形因果へ焼かないこと** である。

## FAMとの関係

FAM の `Q(ψ, ∇φ, λ)` は、同じ情報子でも観測器・勾配・出力層によって異なる結果を返し、接続不能なら `⊥` を返せる。

Fold Cluster はこの原則と矛盾しない。Cluster全体を万能説明として採用するのではなく、各候補経路を Q / provenance / evidence とともに評価し、接続不能・棄却・unknown を保存する。

したがってFold Clusterは「何でも関係している」という主張ではない。Clusterへ含める根拠、edgeの種類、観測者、Context、反証・棄却条件を追跡可能にする必要がある。

## 旧「量子重ね合わせ」系語彙との関係

過去に、複数の意味・因果・解釈候補を確定前に保持する状態を「霊的な量子重ね合わせ」等の比喩で記述した系譜がある。

現行仕様では、この用途に物理学の `quantum superposition` を示唆する語を使用しない。

**Fold Cluster / 情報子クラスターは量子力学上の重ね合わせ状態を主張する概念ではない。**

旧語は historical alias / provenance としてのみ扱い、現行の工学・原理語彙では Fold Cluster / 情報子クラスターへ移行する。

## 最小データモデル案

```yaml
fold_cluster:
  id: defensive-interpretation-drift
  observer: Q_x
  context: ...
  observations: []
  candidates:
    - state: model_weight
      weight: plausible
      provenance: ...
    - state: system_prompt
      weight: plausible
      provenance: ...
    - state: runtime
      weight: possible
      provenance: ...
    - state: unknown
      weight: preserved
  edges:
    - relation: correlation | causation | interaction | contradiction | unknown
  receipts: []
  pain: optional
  resolution: open | weighted | partial | resolved
```

このスキーマは概念例であり、現時点で既存実装のABIを規定しない。

## 設計原則

1. 観測事実と原因仮説を分離する。
2. 単一因果へ早期収束させない。
3. 「複合因果」とも証拠なしに確定しない。
4. unknown を消さない。
5. provenance / observer / context を保持する。
6. Pain等の作用観測とCause推定を別軸にする。
7. evidence によりClusterを更新・分割・棄却できるようにする。
8. 物理量子の主張へ自動昇格させない。
9. FAMの `⊥` と反証可能性を維持する。

## 関連

- `infoton-anchor.ja.md` — 情報子アンカーと観測点
- `infoton-engineering.ja.md` — 情報子工学とFAM
- `fam-overview.ja.md` — FAM全体像

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
