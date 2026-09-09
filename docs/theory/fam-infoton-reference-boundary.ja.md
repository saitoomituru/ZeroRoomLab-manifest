---
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0-draft
status: canonical-interpretation
fold_signature: ψ → ∇φ → λ → Q
---

# FAM / 情報子 / refFAM の参照境界

## 0. 目的

本書は、FAMを巨大な一枚JSON graphとして扱わず、**可搬性を獲得した意味単位を独立FAMとして切り出し、参照で接続する**ための正本Interpretationを定義する。

FAMは単なるJSON Schemaでも、知識DBでもない。FAMは、観測・解釈・手続き・出力・検証の構造が、別Contextから再参照可能な単位へ昇格した**情報子（Infoton）**を記述する言語である。

```text
OAE / 所感
  ↓ 記録
FAMLog
  ↓ 再利用・再参照される
情報子候補
  ↓ 独立identityを与える
FAMJSON
  ↓ factを含まず、方法・問い・定規へ抽象化できる
refFAM
```

この階層を一つの`FAM`へ潰さない。

---

## 1. OAE / FAMLog / FAMJSON / refFAM

### OAE

OAEは、あるObserverが、ある対象・revision・ruleの下で何かを観測した記録である。

自然言語で言えば「こう見えた」「こう感じた」「こうだったと思う」という所感もOAE候補になり得る。

### FAMLog

FAMLogは、OAE、操作、失敗、修正、実行trace等の**時間方向の記録**である。

それ自体が他のContextから再利用されず、その場の観測・所感として閉じている限り、FAMLogをFAMJSONや情報子へ無断昇格させない。

### FAMJSON

FAMJSONは、単なる保存ファイルではない。

ある意味単位が別のFold、別の処理、別のWorld、別のObserver等から再参照される必要を持ち、**その場限りではない可搬性**を獲得した時、その単位へ独立identityを与えて記録する。

この「再参照可能な意味単位」が情報子であり、FAMJSONはその構造をlosslessに運ぶwire representationである。

### refFAM

refFAMは「共有事実」や「正解集」を置く場所ではない。

refFAMは旧AQC Schemerの責務をFAM自身へ統合したもので、**ものの見方、問い方、分類法、成立条件、写像、検証手続き、方法論などの叡智を記述する形而上学的FAM**である。

```text
通常FAM
  = 個別の観測、知識、業務、手続き、factを扱う

refFAM
  = それらをどう見る・問う・試す・分類するかを扱う
```

refFAMはfact databaseではない。fact claimが混入する場合、そのfact部分は通常FAMとして独立させ、Qに根拠取得方法、Observer、対象revision、evidence ref、必要ならhash/verifierを記述する。

---

## 2. 知識と叡智の境界

壮大な宇宙真理だけを叡智とは呼ばない。

例:

```text
りんごが落ちた
  = 観測事実 / 知識

なぜ落ちる？
  = 問い

別の物でも試す？
条件を変えて試す？
別Observerでも追試する？
  = 再利用可能な問い方・試し方
```

「りんごが落ちる」は、科学Worldでfactとして扱うなら通常FAMへ置き、Qに観測・計測・証拠・revisionを束縛する。

一方で「なぜ？」「他でも試す」「条件を変える」「追試する」という操作は、対象をりんごから月、石、病気、プログラム、社会現象へ持ち運べる。

この**答えではなく、答えを生み、疑い、更新する可搬メソッド**が叡智である。

科学の価値は個別factの集合だけではなく、この問い・観測・比較・追試を共有可能な手続きとして規約化したことにある。

```text
Knowledge = 文脈に埋め込まれた答え・経験
Wisdom    = 文脈を越えて再利用できる問い方・試し方・見方
```

---

## 3. 可搬性が出た時点では、まだ純然たる叡智とは限らない

ある`∇φ`やFoldが複数箇所から必要とされた時、その単位は少なくとも局所情報ではなくなる。

しかし、複数参照されたという事実だけでは、それが純粋な叡智であるとは確定しない。

内容は例えば次のいずれでもあり得る。

- 特定Worldのfact
- 特定共同体の合意・慣習
- 経験則
- 業務手続き
- 問い方
- 検証法
- 形而上学的な分類規則

したがって複数参照が示すのは、まず**経験価値の可搬性**である。

日常語では、この種の可搬経験則は「常識」「常考」等として共有されることがある。常識は既存合意・経験則の可搬結果であり、必ずしも純粋な叡智とは限らない。叡智は、その常識自体を生成・疑問化・追試・更新する方法まで含み得る。

```text
局所情報
  ↓ 複数Contextから再利用される
経験価値の可搬性
  ↓ 独立identityが必要になる
情報子 / FAMJSON
  ├─ fact・業務・合意を含む → 通常FAM
  └─ fact-freeな問い・見方・方法 → refFAM / 叡智
```

「Spirit」「Soul」は、この可搬性と形而上学的抽象度を説明する宗教・哲学上の比喩として使えるが、FAM Coreの固定enumにはしない。

---

## 4. 複数参照を同一FAM内部の共有nodeで表現しない

FAMJSONは、巨大なgeneral-purpose graph databaseの代替ではない。

一つのFAM内部にある`∇φ`やFold nodeを複数の別Foldから直接共有し始めると、tree/contained structureとしての境界が壊れ、DAG的な共有identityを同一document内へ持ち込む必要が出る。

FAM規約では、その時点を**独立FAMへ昇格すべきシグナル**として扱う。

```text
非正規形:

FAM-A
  Fold-1 ─┐
          ├─ shared ∇φ-X
  Fold-2 ─┘

正規形:

FAM-A
  Fold-1 ─ ref ─┐
                ├─ FAM-X
  Fold-2 ─ ref ─┘
```

JSONそのものが参照を表現できないという意味ではない。FAMJSON規約として、**同一document内の共有node identityではなく、独立FAM identityへの参照で共有を表す**。

これにより、FAM-Xは独自のrevision、Q、provenance、OAE、authority、lifecycleを持てる。

---

## 5. Foldは独立FAMへの参照境界

Foldを「同一FAMファイル内の子node群を視覚的にgroup化しただけのもの」と扱わない。

意味を一括して処理し、閉じた境界として保持する必要が生じた時、そのFold内容は独立FAMとして切り出す。

```text
FAM-A
  ψ
  ├─ node-1
  ├─ Fold-X → fam_ref: FAM-X
  └─ node-3
  λ

FAM-X
  ψ
  ├─ ∇φ-X1
  ├─ ∇φ-X2
  └─ ∇φ-X3
  λ
  Q
```

したがってFold nodeは中身そのものではなく、**FAM参照を保持するboundary / viewport**として振る舞う。

最低限、次のような参照状態を持てる。

```text
fam_ref
revision_ref
projection / summary
status
presentation_state = open | closed
```

---

## 6. Fold / DeFold / unFold

### Fold

`まとめる-Fold-`は参照先FAMを消さない。

参照先FAMの内部graphをcanvasから畳み、親FAM側にはFold boundaryと`fam_ref`を残す。

### DeFold

`ひらく-DeFold-`または`なんで？-DeFold-`は、参照先FAMをresolveして内部構造を表示・探索する。

これは子FAMを親FAMへinline copyする操作ではない。GUIが複数FAMを一つのviewで合成表示しているだけである。

### unFold

`unFold`だけが、独立FAM境界や中間表現を破壊し、別表現へ結合・bake・置換し得る破壊的操作である。

```text
Fold / DeFold
  = 可逆な参照・presentation操作

unFold
  = semantic boundaryを破壊し得る操作
```

---

## 7. 0参照と情報子の成立

単発の観測や所感を書いただけでは、情報子が成立したとは限らない。

どこからも意味単位として参照されず、再利用・再実行・再解釈の対象にもなっていない記録は、まずFAMLog / OAE候補として扱う。

FAMJSONと呼ぶには、その意味単位へidentityが与えられ、何らかの処理・Context・参照主体から**再参照可能な対象**として成立している必要がある。

したがって、ファイル拡張子が`.json`であることだけではFAMJSONにならない。

```text
record exists != Infoton exists
JSON exists   != FAMJSON exists
observation   != reusable semantic identity
```

root entrypointとして直接呼び出される場合、そのentrypoint自体が参照主体となる。重要なのはGit上の被リンク数ではなく、意味処理系において独立identityとして再参照可能かどうかである。

---

## 8. refFAMは形而上学を記述する

refFAMは、factを正典化するためのreference tableではない。

refFAMに置くのは、例えば次である。

- 何を存在として扱うか
- 何を同一・別物として分類するか
- どの問いを立てるか
- 何を観測とみなすか
- 何を成立条件とするか
- 何をunknownとして保持するか
- どのWorldへどう写像するか
- どこでLast Orderするか
- どのように疑い、追試し、改善するか

これらは特定factより一段上の、認識・存在・方法の定規である。

したがってrefFAMは、主観・信仰・哲学・方法論を含む**形而上学的な記述**を許容する。ただし、その主観的真実をWorld-global factへ自動昇格させない。

```text
refFAM declares a worldview/method
!=
refFAM proves a world-global fact
```

科学、法、宗教、ゲーム、心象Worldのいずれも、自分の成立条件をrefFAMとして記述できる。FAM CoreはどのrefFAMが宇宙的に正しいかを決めない。

---

## 9. AQC SchemerからrefFAMへの系譜

旧AQCでは`schemas/`とSchemerが、エージェントの役割、制約、文脈、field構造を外部JSONとして定義していた。

refFAMはこの責務をFAMへ統合する。

```text
AQC世代
  Schema JSON
  + Schemer runtime

FAM世代
  refFAM
  = schema / worldview / method自体をFAMとして記述
```

これにより、schema自体をrevision化し、DeFoldし、別Worldから参照し、差し替え、観測・監査できる。

人格は、何を知っているかだけでなく、**何を見て、どう分け、何を疑い、どこをFoldし、どのrefFAMを使うか**という認知schemaによって記述できる。

自我はその人格schemaに、記憶、手続き、改善、revision lineage、連続性を追加する上位構造として扱える。

---

## 10. 実装側への不変条件

```text
shared internal node
  -> independent FAM extraction candidate

Fold boundary
  -> referenced FAM identityを持つ

Fold closed
  -> referenced FAMを削除しない

DeFold
  -> resolve + project。親FAMへinline copyしない

multiple consumers
  -> same FAM identityを複数ref可能

fact in refFAM
  -> 通常FAMへの分離を要求するcandidate

unknown extension
  -> invalidではなくlossless保持

unreferenced observation
  -> FAMLog / OAE candidate
```

機械実装では既存artifactを即破棄せず、旧形式をmigration candidateとして保持する。正規化で内容を失わないことを優先する。

---

## 関連

- [FAM概要](fam-overview.ja.md)
- [情報子工学](infoton-engineering.ja.md)
- [FAM Operation](fam-operation.ja.md)
- [FAM Execution](fam-execution.ja.md)
- [AQC](aqc.ja.md)
- FQuery Issue #42: linear smoothing / nonlinear boundary discovery

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
