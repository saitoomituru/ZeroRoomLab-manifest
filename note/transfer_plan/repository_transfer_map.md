# 他リポジトリへの転送計画

## 1. 基本方針

このリポジトリのノート内容から、他リポジトリに反映すべき事項は、まず [note/transfer_plan](.) に置いて整理する。

> ここで管理している内容は、対象リポジトリへ送る前の staging であり、原典はこの note 側に残す。

---

## 1.5 参照確認結果（2026-07-13、2026-07-18追随確認）

以下の依存リポジトリは、現時点で本環境から参照可能であり、ワークスペース上にも存在していることを確認済みです。

- **quantaril_cloud_Q3**: 存在・読み取り可・Git リポジトリとして参照可。ワークスペース内に追加済み。
- **astro.quantaril.cloud**: 存在・読み取り可・Git リポジトリとして参照可。ワークスペース内に追加済み。
- **IBD**: 存在・読み取り可・Git リポジトリとして参照可。ワークスペース内に追加済み。
- **pain-scouter-assessment**: 存在・読み取り可・Git リポジトリとして参照可。ワークスペース内に追加済み。

この結果を受けて、以降は「転送候補の整理」フェーズに入れる状態です。

---

## 2. 転送対象一覧

| 対象リポジトリ | 転送内容 | 優先度 | 状態 |
|---|---|---|---|
| [quantaril_cloud_Q3](../../../quantaril_cloud_Q3/quantaril_cloud_Q3) | Docusaurus / 生成コード / コンテンツ生成の構造整理 | 高 | [TRANSFERRED] |
| [AQC/astro.quantaril.cloud](../../../AQC/astro.quantaril.cloud) | AQC → IBD / Infoton / SphereOS の責務整理、用語統一 | 高 | [TRANSFERRED] |
| [IBD/IBD](../../../IBD/IBD) | FAMネイティブResolver、分類Registry、Database隔離、非破壊Composite FAM、Last Order、自我対応 | 高 | [TRANSFERRED] |
| [Sphere-aae/Sphere-aae](../../../Sphere-aae/Sphere-aae) | famlog-converterとIBD Classification Registry／Database Routingの接続契約 | 高 | [TRANSFER-QUEUED] |
| [../.. /pain-scouter-assessment/pain-scouter-assessment](../../pain-scouter-assessment/pain-scouter-assessment) | ノートの評価・鑑定系の文脈整理が必要な場合のみ | 中 | [PENDING] |

---

## 3. 各リポジトリへの転送メモ

### 3.1 quantaril_cloud_Q3

- 転送候補: Docusaurus と生成スクリプトの分離方針、文書体系のハブ/ストリーム構造
- 目的: 実装リポジトリ側でも、ノート由来の構造変更を追跡しやすくする
- 反映粒度: 設計方針・運用ルール中心。生ノートそのものは転送しない

### 3.2 astro.quantaril.cloud

- 転送候補: AQC/Infoton/IBD 役割再定義、用語統一、非正規化ノートからの整理内容
- 目的: 実装・README・ドキュメントの整合性を高める
- 反映粒度: README と docs の要約・遷移説明中心

### 3.3 IBD/IBD

- 転送内容: FAMネイティブ問い合わせ、Classification Registry、Schema Bundle単位のIBD Database、非破壊Composite FAM、Last Order、Evidence鮮度、自我対応、実行形態中立
- 目的: IBD リポジトリの設計書と、このレポジトリのノートの接続点を明確にする
- 反映粒度: README、architecture／specification文書、draft JSON Schema、人工fixture
- 反映日: 2026-07-18
- 反映コミット: `20ff580`

### 3.4 pain-scouter-assessment

- 転送候補: 直接の反映はまだ必要ない
- 目的: 将来的に評価・鑑定系のノート整理へ接続する場合に備える
- 状態: 先送り

### 3.5 Sphere-aae/Sphere-aae

- 転送候補: famlog-converterが分類・評価体系を発明せず、上位Classification Registry候補と根拠を出し、決定的graph adapterが指定IBD Databaseへ非破壊routingする境界
- 目的: FAMログのclaim／Actor／Instance／Runtime抽出契約と、IBD Season 0の情報子クラスター保存契約を接続する
- 反映粒度: 既存Skillのreference契約を中心にし、SKILL.mdを重複仕様で肥大化させない
- 状態: `[TRANSFER-QUEUED]`

---

## 4. 転送ルール

1. 転送前に、内容が「正規化済みの設計情報」かどうか確認する
2. 生のノートそのものではなく、対象リポジトリに合わせた要約・リンク・運用ルールとして送る
3. 元データはこの note 側で保持し、対象リポジトリ側は参照・折りたたみ先として扱う
4. 反映済みの場合は、対象行の状態を [TRANSFERRED] に更新する

---

## 5. 次のアクション

- 反映済みの [quantaril_cloud_Q3](../../quantaril_cloud_Q3)、[AQC/astro.quantaril.cloud](../../AQC/astro.quantaril.cloud)、[IBD/IBD](../../IBD/IBD) について、今後の追随更新を監視する
- Sphere-aaeの接続契約を転送後、対象行と3.5を`[TRANSFERRED]`へ更新する
- 追加の転送候補が出た場合は、対象リポジトリごとにこの表を更新する
