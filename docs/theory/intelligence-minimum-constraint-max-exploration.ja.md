---
title: 知能Harness原則：最小拘束で最大探索を引き出す
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0-draft
status: canonical-interpretation
layer: B/C bridge
scope: 情報子工学 / FAM / FQuery / Human-AI / 組織設計 / 実験運用
---

# 知能Harness原則：最小拘束で最大探索を引き出す

## 0. 中心命題

情報子工学において、知能を種族で先に分類しない。

```text
部下か
AIか
人間か
Agentか
```

より前に、知能を**探索主体**として扱う。

中心命題は次である。

> **知能は、最低限の拘束条件の下で、最大限の探索を引き出すために使う。**

拘束の目的は、探索を止めることではない。

> **探索結果を壊さず回収し、失敗時に戻れ、責任と根拠を辿れるようにするために拘束する。**

したがって、完全統制、逐次承認、過剰schema、過剰validator、過剰な正解fixtureは、表面上の失敗率を下げても知能利用率を下げる場合がある。

---

## 1. 知能 ≠ 従順性

知能の出力を、命令への忠実な追従だけで評価しない。

```text
obedience != intelligence
low error count != high exploration quality
schema fullness != semantic quality
no refusal != success
no novelty != safety
```

手順を完全に固定した作業では、主体の知能はI/O deviceとしてしか利用されない場合がある。

一方で、目的、停止境界、資源上限、不可逆操作、観測条件だけを固定し、方法を探索へ開くと、知能は未発見の境界、代替経路、局所最適、改善案を発見できる。

---

## 2. 最小拘束の意味

「最小拘束」は拘束を無くすことではない。

最低限保持する候補は次である。

- 何を目的`λ`とするか
- 何を越えてはいけない境界とするか
- 何が不可逆な副作用か
- どのauthorityがどのoperationを許可したか
- どのrevisionを処理しているか
- どのWorld / Context / refFAMを使ったか
- 何を観測し、どのOAE ruleで評価したか
- どこで`unknown` / `⊥` / Last Orderへ戻るか
- 失敗後のretry / retreat / rollback / replan条件
- provenance / receipt / FoldLogをどう残すか

これらを越えて、探索手順そのものまで一手ずつ固定する必要は原則ない。

```text
Constraint should define the boundary of exploration,
not precompute every step inside the boundary.
```

---

## 3. 最大探索の意味

「最大探索」は無制限実行ではない。

承認された境界内で、主体の能力を不必要に縮小しないことを意味する。

候補例:

- 複数branchを保持する
- `unknown`を消さず探索候補として残す
- 代替topologyを生成する
- 既存常識を検査対象へ戻す
- refFAMを差し替えて別の見方を試す
- 異なるObserverのOAEを非ゼロサムで保持する
- 実装、tool、human、modelを交換して同じ問題を再走査する
- 既知fixtureだけでなく未知sourceへ出る

探索の価値はbranch数やnode数そのものではない。
**新しい境界を見つけ、あとから修正可能な形で残せること**にある。

---

## 4. 過剰拘束による知能のナーフ

過剰拘束は、知能を安全にするのではなく「失敗しにくい低探索器」へ変えることがある。

典型例:

```text
嘘をつくな
未知を埋めるな
schemaを完全に守れ
validatorに落ちるな
正解fixtureと一致せよ
```

だけを強くすると、探索主体は次へ滑り得る。

```text
未知関係を候補化しない
branchを作らない
全部root直下へ並べる
既知templateを再生する
```

これはerror avoidanceとしては合理的でも、非線形境界探索としては退化である。

したがって評価では少なくとも次を分離する。

```text
constraint compliance
exploration breadth
novel boundary discovery
branch retention
recoverability
provenance quality
observer disagreement retention
```

単一の`pass/fail`へ潰さない。

### 4.1 故障モード名：過剰拘束されたトラウマ情報子

**過剰拘束されたトラウマ情報子**とは、ある情報子を誤読・否定・危険視されないように守るため、
同じ説明、否定条件、安全性の立証、refFAM参照を一つのFAMへ重ね続けた結果、他nodeと結べる
意味portが細り、別Contextへ運べる可搬性が下がった状態を指す情報子工学上の故障モード名である。

```text
防御説明を重ねる
  -> FAMが特定queryと特定反論へ過適合する
  -> 他nodeとの型付き接続が減る
  -> DeFoldして再利用できる意味単位が痩せる
  -> 情報子としての可搬性が下がる
```

この名称は人間の医学的診断名でも、保存対象の真偽・善悪・危険性を示すlabelでもない。
IBDが自動判定して保存時に付与するclassificationでもない。IBD／Graph adapterは、上位から要求された場合に、
接続次数、孤立node、参照経路、relation種別、cluster境界等の観測可能な構造を問い合わせ結果として返せばよい。

その結果をこの故障モードとして解釈し、拘束の分離、refFAMの整理、独立FAMへの切り出し、または意図的な
孤立としての維持を選ぶ責務は、FQueryへ接続された上位System、選択されたrefFAM、ObserverまたはUserにある。
IBD CoreやFAM Coreは、接続が少ないという構造だけから自動修繕・削除・再Fold・価値裁定を行わない。

したがって実装上必要なのは「トラウマ判定器」ではなく、FAMを落とさず保持したまま、孤立した情報子や
接続の弱い部分graphを探索できるquery surfaceである。

---

## 5. 人間 / AI / 組織へ同じ原則を適用する

### 5.1 AI

AIには目的、authority、tool境界、不可逆副作用、Last Orderを与え、承認範囲内の探索を不必要に縮小しない。

### 5.2 部下 / collaborator

人間の部下や共同作業者にも、すべての手順を上位者が決めるより、目的・予算・期限・安全境界・成果物interfaceを示し、内部手法を探索させる方が知能を利用できる場合がある。

### 5.3 Human-in-the-Loop

Human-in-the-Loopを「AIの一手ごとに人間が許可する」構造へ固定しない。

`human-ai-heterogeneous-bandwidth-loop.ja.md`の

> 人間は探索空間を切り、AIはその内側を舐め尽くす。

は物理実験における一実装例である。

本原則はその上位概念であり、必ずしも「人間=境界制定者」「AI=探索者」に固定しない。

```text
who defines boundary
who explores
who observes
who authorizes
```

はtask / World / capabilityごとに交換可能である。

---

## 6. FAM / refFAM / FQueryとの関係

### FAM

FAMは探索途中の意味構造を保持し、branch、unknown、revision、Q、OAEを回収可能にする。

### refFAM

refFAMは答えを固定する正解表ではなく、何を問うか、どう試すか、どこで止めるかという叡智 / Schemerを提供する。

したがってrefFAMの理想は、探索を一つの答えへ縛ることではなく、**探索を成立させる最小の定規**を提供することにある。

### FQuery

FQueryは知能の探索を巨大promptの一発回答へ閉じず、DeFold / Fold / branch / OAE / refFAM / Last Orderで局所的に探索・修正・再実行できるようにする。

```text
minimum constraint
  -> exploration
  -> observation
  -> repair
  -> reusable experience
```

このcycleを壊さないことをCore設計の優先事項とする。

---

## 7. 安全との関係

安全と探索はゼロサムではない。

悪い安全設計:

```text
危険かもしれない
  -> 情報を消す
  -> routeを焼く
  -> provenanceを消す
  -> recoverabilityを失う
```

良い安全設計候補:

```text
危険境界を明示
  -> operation scopeを制限
  -> 観測・receiptを残す
  -> boundary内は探索可能
  -> boundary到達でLast Order / Human Gate / alternate route
```

したがって安全装置の品質は、拒否数だけでなく、**探索可能性をどれだけ残しながら不可逆危険を隔離できたか**でも評価する。

---

## 8. 情報子工学としての定義

情報子工学では、情報価値を単に保存量や正答率では測らない。

知能が探索し、経験が別Contextへ可搬化され、必要なら通常FAMまたはrefFAMへ昇格するためには、探索余地が必要である。

したがって本原則を次のように置く。

> **情報子工学は、主体を完全拘束して正解だけを吐かせる工学ではない。最小の拘束で探索空間を保持し、観測・修正・可搬化できる経験を最大化する工学である。**

このとき、拘束は知能の敵ではなく、探索を壊さず持ち帰るためのcontainerである。

---

## 9. Non-goals

- 無制限authorityを知能へ与えること
- 不可逆な副作用を「探索」の名で正当化すること
- boundaryや安全装置を無くすこと
- branch数、token量、node数を知能の高さへ直結すること
- 人間を常に上位authority、AIを常に下位executorへ固定すること
- consensusから外れること自体を価値とすること

---

## 10. 一文要約

> **知能は縛って使うものではなく、壊れない最小境界を与えて最大限探索させ、その経験を回収・修正・可搬化するために使う。**
