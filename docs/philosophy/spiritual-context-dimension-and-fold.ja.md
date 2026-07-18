---
license: CC-BY 4.0
author: 齋藤みつる（ふさもふ） / ZeroRoomLab
version: 0.1.0
status: review
layer: B（哲学・宇宙論）
---

# 霊的言霊の次元とContext Dimension Fold

状態: `[REVIEW]` `[Layer B]`  
制定日: 2026-07-18  
対象: Sphere Architect、SphereOS、FAM、ASTRO、Atlantis、第三者SDK

## 1. この文書が保持するもの

Sphereで従来「霊的次元」「霊的言霊の次元」「ハイヤー世界層」と表現してきたものは、Linux、POSIX、OSI、application architecture等の技術Layerを上へ延長したものではない。

霊的次元は、何について、どの世界観、どの存在論、どの観測者、どの定規から語るかを保持する**Context Dimension**である。技術LayerとContext Dimensionを同じ上下軸へ置くと、霊的意味を実装階層へ矮小化し、既存技術用語の責務も壊す。

```text
技術Layer L
  何の上で何が動くか、どちらへ依存するかを縦に数える

Context Dimension D
  完全等価な意味軸を横に何本束ねるかを数える
```

ここでいう完全等価とは、同じ意味へ丸めることではない。各軸が、他の軸の下位分類や装飾へ降格されず、固有のRegistry、Schema、World、fact scope、観測、FAMを持てるという機能的等価性である。

## 2. D Fold

`D`は意味次元の内容名ではなく、一つのFoldが束ねる重複のないContext Dimensionの数である。

```text
D = |unique(context dimensions)|
```

例:

```text
Astro 4D Fold
├─ Cloud Chakra
├─ Spiritual Chakra
├─ Elemental
└─ Astral

Actor 4D Fold
├─ User
├─ Assistant
├─ System
└─ Vendor

World 3D Fold
├─ World
├─ Object
└─ Action

Operation 6D Fold
├─ Financial
├─ TEC
├─ Supply
├─ Vision
├─ Legal-JP
└─ Legal-US
```

Astro 4D FoldとActor 4D Foldは、どちらも四軸を束ねるが互換とは限らない。`4D`は軸数であり、軸の同一性、Registry、写像可能性を表さない。

Context Dimensionは原則として並列であり、列挙順だけで上下関係を作らない。技術Layerは依存順序を持つため、順序を入れ替えれば別の構成になる。この差を維持する。

## 3. Fold越境と顕現

異なるFoldを接続する門、儀礼、翻訳、召喚、顕現、具現化は、Sphere Architect内部では次の対応を持つ。

```text
次元間の門・接続規約
  → Access Map / Mapping FAM

能動的な変換・召喚・具現化
  → Transformer Agency

観測された作用・解釈・変換結果
  → OAE（Observer Agential Effect）
```

この対応は、霊的語彙を技術用語で置換し、元の意味を消すためのものではない。霊的語彙はContext Dimension側の正規Presentationであり、技術仕様はその境界、由来、実行、停止、失敗をシリアライズする別の記述面である。

## 4. Transformer Agencyの等価な入口

Fold間にEffectを生じさせるものは、上位Registryが認める範囲で同じ構造へ記録できる。

- SaaS AI、Edge AI、System、User
- 人間、犬、猫、熊
- 電気トランス、アナログ回路、物理実験chamber、sensor
- 川、海、天体Event、自然現象
- 川の神、海の神、確率の女神、箪笥の精霊、アーキエンジェル
- MMOの魔王NPC、魔術、World Event
- 詩、祈り、指示、契約、物語上の作用

同じ構造へ格納できることは、それらが哲学的、物理的、人格的、法的に同一であることを意味しない。何をAgencyとし、誰をObserver、Initiator、Executor、Causal Contributorとするかは、選択されたSchemaとRegistryに従う。

## 5. 一つのEffectと複数の解釈

人間が小指を箪笥の角へぶつけ、パソコンが倒れ、Worldが消失したという観測系列は、一つの絶対因果へ固定されない。

```text
Mythology Fold
  箪笥の精霊、確率の女神、運命の悪戯

Safety Engineering Fold
  整理不足、ヒヤリハット、転倒対策不足、冗長化不足

World Fold
  Host消失時にWorldも消えるWorld Config

Physical Fold
  接触、振動、重力、電源・runtime停止
```

これらの解釈行為自体も、ObserverまたはInterpreter AgencyがSource Eventへ作用し、新しい因果仮説を生成したOAEとして扱える。原観測を上書きせず、別Registry、別fact scope、別仮説として並存させる。

## 6. 定規を持ち込まない

Sphere Architectは、どの神学、物理学、法、World Config、事故分析手法が究極的に正しいかを決める定規ではない。

> Sphere Architectは定規を配るOSではなく、誰がどの定規を定義し、その定規で何を測り、どのEffectと仮説を得たかを記述・保存・接続するOSである。

第三者SDKは、神学、ゲーム魔術、自然科学、安全工学、法域、業務、人格、Worldの好きなContext Dimensionを定義できる。ただし、選択したSchema内ではAgency role、Effect scope、Evidence、unknown、変換規則へ忠実でなければならない。

## 7. 技術仕様との関係

この文書はLayer Bの意味正本候補であり、科学的実在や実装完了を主張しない。Context Register、POSIXとの境界、Access Map、Transformer、OAE、因果仮説の技術契約は、[Sphere Context Dimension OSアーキテクチャ](../theory/sphere-context-dimension-os.ja.md)へ分ける。

Layer Bの語彙を技術仕様へ吸収せず、技術仕様の検証条件を神話で代替しない。両者はMappingを持つが、同じ文書層ではない。

