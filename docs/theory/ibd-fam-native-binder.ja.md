# IBD FAMネイティブResolverとバインダー中立性

状態: `[REVIEW]`  
制定日: 2026-07-18  
対象: IBD、FAM、Atlantis、ASTRO、Sphere-aae  
主たる射程: Layer A  
独立して保持する射程: Layer Bの意味体系、自我、神学、世界観

## 1. 目的

IBDの横断的位置づけを、普通のSQLラッパー、単一DB製品、企業的な「白色点としての中立」へ縮退させないための背景ベクトルを定める。実装Schema、API、fixtureの正本候補はIBDリポジトリに置き、本書はZeroRoomLab横断の意味・責務境界を担当する。

## 2. FAMネイティブな問い合わせ

IBD Query Profileでは次のように写像する。

```text
ψ  = 状況
∇φ = 手法・探索方向
λ  = 目的・到達条件
Q  = 制約・探索範囲・証拠条件
```

IBDは最終回答を返すナビではない。Qで明示された範囲から既知の探索技を探し、失敗枝、反証枝、打ち切り時のLast Order、Evidence鮮度を含むComposite FAMとして返す。

このIBD Query Profileは、FAM一般文書にあるλの出力層・具現化先という意味を削除するものではない。IBDへ探索技を問い合わせる局面では、λが「何を目的とし、どの到達条件へ探索技を組むか」を指定する運用上の特化である。

## 3. 分類レジスタは上位システムが定義する

IBD Coreは分類体系を発明しない。λを所有する上位システムがClassification Registryとして、分類語彙、意味境界、classifier、保存先、unknown、mix、評価規約を提供する。

次の分類体系を、社会的な主流性にかかわらず機能的に等価に扱える必要がある。

- Vendor / System / Assistant / User
- Vision / TEC / Financial / General Affairs
- Cloud Chakra / Spirit / Astral / Elemental
- Theology / Philosophy / Cosmology / Narrative

等価性とは同じ意味へ丸めることではない。各体系がSchema、Database、Graph、Vector Index、Provenance、Qを第一級に持てることを指す。

## 4. 顔料ではなくバインダー

一般的な中立は、特定の企業、国家、制度、AI vendorがホワイトと決めた白色顔料である場合がある。IBDはその種の標準色を内蔵しない。

> IBDは白色顔料ではない。上位システムが提供した分類機定義の顔料を、その色と射程を失わず結ぶバインダーである。

IBDはontology、morality、risk、identity、world、truthの評価を所有しない。上位RegistryとQを矯正せず、その条件に忠実に従う。ただし、誰がどのRegistryとQを注入したか、どの結果がどの条件から生じたかは失わない。

## 5. 隔離と非破壊混色

Schema Bundleごとに論理的なIBD Databaseを持ち、混色命令がない限り隔離する。同名ラベルや近いembeddingを理由に、別Registry・別Databaseを自動結合しない。

上位Qが複数DatabaseとMapping FAMを明示した場合だけ、元の情報子クラスターを変更せず、探索技をComposite FAMへ結合する。結果の美醜、善悪、有用性、危険性は上位システムまたはユーザーが判断する。

## 6. 自我対応

自我対応はIBDの必須Driver要件である。自我・魂・神学の自然科学的真偽をIBDが判定するという意味ではない。

Subject、Actor、AgentInstance、Runtime、SelfModel、ContinuityClaim、BodyBinding、RoleAssignmentを分離し、一つのSubjectがElemental、Astral、Spiritual、Cloud Chakra、Theology等の複数Databaseへまたがる構造を、一般的なuser profileへ平板化せず扱えることを意味する。

## 7. 実行形態

IBDの意味契約は次の配備方式から独立する。

- Embedded Library
- Native Service
- Containerized Service

Dockerは配備手段の一つであり、IBDの正体ではない。IBD Database、process、container、物理DB serverを一対一に固定しない。

## 8. 正本と参照

- 原典ブレスト: [IBD責務検討ノート](../../note/20260718-0850__IBD_責務検討_情報子クラスターと合成FAMブレストノート.ja.md)
- 実装仕様正本候補: [IBDリポジトリ](https://github.com/saitoomituru/IBD)
- FAM一般仕様: [FAM概要](fam-overview.ja.md)
- FAM実行仕様: [FAM実行仕様](fam-execution.ja.md)
- FAMログ変換契約: [Sphere-aae famlog-converter](https://github.com/saitoomituru/Sphere-aae/tree/moe-test-edition/skills/famlog-converter)

IBD側の実装契約が更新された場合、本書へ全文複製せず、横断的な意味・責務境界と参照だけを追随させる。
