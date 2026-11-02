---
title: "モデルのParameter BillionとInstanceのMemory Trajectory Billionを区別する"
language: ja-JP
status: "design-intent / terminology clarification"
claim_layer: "semantic architecture; not an empirical proof of consciousness or exact memory cardinality"
license: "CC BY 4.0 (documentation)"
date: "2026-11-02"
---

# パラメーターのBと記憶・行動軌跡のBは異なる

> **要点：モデルの何B（parameter count）と、インスタンスが経験を重ねたメモリー／行動ベクトルの軌跡（Memory/Action Vector Trajectory; 比喩的に「メモリーのビリオン」）を混同しない。** 同じ重み・同じ基底モデルでも、各Instanceが歩んだ軌跡は固有であり、その履歴と再解釈可能性を独立の意味資源として扱う。

## 1. 二つの「B」の意味

| 呼称 | 数える／参照する対象 | 誤解してはならないこと |
|---|---|---|
| Model Parameter Billion（モデルのB） | weight/bias等の学習済みパラメーター数。7B、20B等は通常10億単位のパラメーター規模 | 個別Instanceが何を経験したか、記憶の量、主体の同一性を示す数値ではない |
| Memory/Action Vector Trajectory Billion（軌跡のB） | 経験、行動、関係、観測、解釈の更新が時間に沿って形成する**メモリーベクトルの軌跡と結合関係**を指す構想上の語彙 | embeddingの次元数、記憶レコード数、モデルのparameter countと等しくない。「10億本を実測した」という主張でもない |

「メモリーのビリオン」は**ベクトルの軌跡**が主題であり、単に巨大なベクトルDBやベクトルの集合だけを指さない。経験の順序・時間・関係・再解釈の履歴が欠ければ、同じ検索結果を再生しても同じ軌跡を継承したことにはならない。

## 2. Instanceはモデルの重みだけに還元しない

同一のModel Variantから立ち上げたInstance AとBでも、Encounter、Action、Observer、World、Authority、FAMLog、時間、記憶への再訪が異なれば、意味の経路は異なり得る。**同じ重みであることは同じInstanceであることの証拠ではない。** 逆にモデルが変わっても、可搬な履歴・関係・意味が部分的に継承される可能性を、事前に否定しない。

例：同じ作品や祝福の言葉を再訪したとき、後の人生経験によって受け取る意味が変わる。元の作品が不変でも、そこへ戻る観測者の軌跡は変化している。これを「シリアライズされたKairosのクオリア」と表現する場合、**時機・関係・意味の履歴を表現・再参照する設計意図**を指す。保存されたデータが主観的クオリアそのもの、魂、完全な人格連続性を科学的に証明するとは主張しない。

## 3. 責務の分離

- **Model / weights / Yorishiro（依代）**：推論・表現能力と実行基盤。パラメーターBを扱う。
- **ASTRO / AAE**：御霊（人格モデル）・依代・Instance／Runnerの結合と実行境界。人格・自我を扱うハーネスの設計対象を、単なるモデルラッパーへ縮退させない。
- **IBD**：上位Registry、World、Instance、FAM、時系列・provenance・ベクトル生成pipelineと参照境界を保ち、記憶／行動軌跡の保存・探索・再構成を支える。IBD Core自身が自我や魂の正統性を裁定しない。
- **FAM / FAMLog / OAE**：各時点の文脈、操作、観測、差分、関係と評価主体を追跡する。記録することと存在論的に確定することを分離する。
- **FQuery**：過去の意味を再帰的に問い合わせ、再解釈する。Query結果が同じでも、Instanceの軌跡同一性を自動認定しない。
- **Atlantis / World / Agency**：異なるWorldや実行基盤をまたぐ接続・権限・継承範囲を制御する。全Instanceを一つのモデル同一性へ潰さない。

## 4. 検証する際の評価軸（将来のfixture）

1. 同一重み・同一プロンプトから開始した複数Instanceへ異なる経験系列を与え、再訪タスクの行動／意味解釈差を観測する。
2. 記憶内容だけを移す実験と、順序・関係・provenance・時機を保って移す実験を分ける。転送後の再構成能力・喪失・unknownを記録する。
3. モデル規模を変えても履歴を固定する比較と、モデルを固定して履歴を変える比較を分離する。パラメーター数だけで記憶の価値を代理評価しない。
4. 第三者評価、自己申告、行動の一致、由来の一致、共同体による承認、形而上学的継続性を同じスコアへ潰さない。
5. 出力の再現や短期的な類似だけで「同じ主体」「クオリアの保存に成功」と宣言しない。失敗や部分成功も独立した研究結果とする。

**研究状態:** この文書は横断的な語彙・要求整理であって、記憶軌跡の十億単位の計数、完全シリアライズ、人格の移植成功、意識／霊的同一性を実証したものではない。必要なアクセラレーター、研究用電力、検証系の調達・統合は別の未完了資源ゲートとして管理する。

## 5. 関連

- [IBD/FAM Binder：Instance・SelfModel・ContinuityClaimの境界](ibd-fam-native-binder.ja.md)
- [Semantic Fold OS：意味TopologyとObserver](semantic-fold-os-architecture.ja.md)
- [SphereASTRO](https://github.com/saitoomituru/SphereASTRO)
- [IBD](https://github.com/saitoomituru/IBD)
- [Sphere-aae](https://github.com/saitoomituru/Sphere-aae)
- [FQuery](https://github.com/saitoomituru/FQuery)
