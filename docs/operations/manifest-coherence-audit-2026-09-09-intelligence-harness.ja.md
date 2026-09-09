---
title: Manifest整合監査 2026-09-09：知能Harness原則
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
status: audit-receipt
observed_revision: 06c104a27930d490db10c7b0283b1431754657f9
---

# Manifest整合監査 2026-09-09：知能Harness原則

## 0. 監査対象

中心命題:

> 知能は、最低限の拘束条件の下で最大限の探索を引き出すために使う。

対象:

- `docs/theory/infoton-engineering.ja.md`
- `docs/theory/human-ai-heterogeneous-bandwidth-loop.ja.md`
- `AGENTS.md`
- `docs/theory/fam-infoton-reference-boundary.ja.md`
- Manifest Issue #41, #12, #33
- FQuery側で進んだopen-world / nonlinear boundary / refFAM / Fold reference設計との整合

## 1. 観測結果

### 1.1 原則は断片的には存在する

`infoton-engineering.ja.md`には、

```text
理論上できる ≠ 一発でできる
理論上できる = 修正可能な探索空間に入っている
```

があり、完全決定論へ落とさず探索可能性を残す思想が存在する。

`human-ai-heterogeneous-bandwidth-loop.ja.md`には、

> 人間は探索空間を切り、AIはその内側を舐め尽くす。

があり、逐次承認でAIを縛るのではなく、事前envelope内部で高密度探索させる設計が明文化されている。

Issue #33にも、所属や資金より探索能力を活かせるcommonsが必要という「探索権」の考え方が存在する。

### 1.2 ただし正本階層が崩れていた

問題は、上記が別々の局所文脈へ散っていたこと。

```text
情報子工学
  -> 探索空間の存在

Human-AI
  -> Human defines / AI saturates

Commons
  -> 探索権

FQuery
  -> open-world / nonlinear discovery
```

として存在するが、これらの上位に

```text
minimum constraint
maximum exploration
```

という知能一般のHarness原則が無かった。

そのため、Human-AI文書だけ読むと

```text
人間 = 境界制定者
AI = 狭い空間だけ探索する者
```

が一般原則であるかのように見え得る。

これは当該物理実験文脈では有効な実装だが、情報子工学全体へ一般化すると過剰拘束になる。

## 2. 構造上の古さ

### A. 種族先行分類

古い記述は、人間とAIの能力差から役割を割り当てている。

現行Interpretationでは、先に見るべきなのは

```text
capability
context bandwidth
authority
risk boundary
recoverability
```

であり、`human` / `AI`は実装属性の一つに降格する。

### B. 安全 = 狭いenvelopeという読み違い余地

物理actuatorでは狭いenvelopeが適切でも、semantic explorationへ同じ幅を持ち込むとFQueryのflat-fanout / linear fixture biasを再発させる。

したがって、envelopeは常に狭い必要はなく、**不可逆危険だけを切り、内部探索幅を最大化する**ことを上位原則とする。

### C. 評価metric不足

従来はfailure avoidance / boundary violationを中心に読める。

今後は少なくとも次も分離する。

- exploration breadth
- nonlinear boundary discovery
- alternative branch retention
- recoverability
- provenance quality
- observer disagreement retention
- constraint density

## 3. 修正方針

新しい正本として

`docs/theory/intelligence-minimum-constraint-max-exploration.ja.md`

を追加する。

関係は次とする。

```text
知能Harness原則
  ↓ 一般原則
情報子工学
  ↓ semantic / Infoton application
FAM / refFAM / FQuery
  ↓ implementation contract
Human-AI heterogeneous loop
  ↓ physical experiment profile / one implementation
```

Human-AI文書は誤りとして破棄しない。
**局所実装として正しいが、一般原則ではない**と位置づけ直す。

## 4. FQueryとの整合

FQuery側のopen-world設計と今回の原則は一致する。

```text
unknown != invalid
unsupported != disposable
alternative branch != error
flat fixture green != nonlinear discovery success
```

これらは「拘束を緩めるため」だけではなく、**知能が探索した候補を失わず回収するための機械契約**として理解する。

refFAMも正解表ではなく、探索を成立させる問い方・定規・停止条件であり、探索空間を閉じるものではない。

## 5. Issueへの投影

- #41 FQuery: constrained surfaceの`constrained`を「探索を狭める」ではなく「最低限の構造・責任・停止境界を与える」と再解釈する
- #12 Safety composition: safety介入の品質へ`exploration preservation`を追加する
- #33 Commons: 探索権を、資源accessだけでなく知能を過剰拘束せず利用できる条件として接続する

## 6. Status

```yaml
principle_presence_before_audit: fragmented
canonical_general_principle: added
human_ai_note: valid-as-local-profile
infoton_engineering: conceptually-compatible-but-underlinked
issue_sync: required
fquery_alignment: strong
implementation_change: not-implied-by-doc-update
```

## 7. 一文要約

> 原則は消えていたのではなく、情報子工学・Human-AI・Commons・FQueryへ分散していた。今回それらの上位に「最小拘束で最大探索」という知能一般のHarness原則を置き、Human/AIの種族別役割分担を一実装profileへ降格した。
