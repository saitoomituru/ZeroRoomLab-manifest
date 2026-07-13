# 他リポジトリへの転送計画

## 1. 基本方針

このリポジトリのノート内容から、他リポジトリに反映すべき事項は、まず [note/transfer_plan](.) に置いて整理する。

> ここで管理している内容は、対象リポジトリへ送る前の staging であり、原典はこの note 側に残す。

---

## 1.5 参照確認結果（2026-07-13）

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
| [IBD/IBD](../../../IBD/IBD) | IBD の役割、Schema / Context / Provenance の整理 | 高 | [TRANSFERRED] |
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

- 転送候補: IBD の責務範囲、Schema / Context / Provenance の正規化定義
- 目的: IBD リポジトリの設計書と、このレポジトリのノートの接続点を明確にする
- 反映粒度: 概念レベルの定義と運用ルールに限定

### 3.4 pain-scouter-assessment

- 転送候補: 直接の反映はまだ必要ない
- 目的: 将来的に評価・鑑定系のノート整理へ接続する場合に備える
- 状態: 先送り

---

## 4. 転送ルール

1. 転送前に、内容が「正規化済みの設計情報」かどうか確認する
2. 生のノートそのものではなく、対象リポジトリに合わせた要約・リンク・運用ルールとして送る
3. 元データはこの note 側で保持し、対象リポジトリ側は参照・折りたたみ先として扱う
4. 反映済みの場合は、対象行の状態を [TRANSFERRED] に更新する

---

## 5. 次のアクション

- 反映済みの [quantaril_cloud_Q3](../../quantaril_cloud_Q3)、[AQC/astro.quantaril.cloud](../../AQC/astro.quantaril.cloud)、[IBD/IBD](../../IBD/IBD) について、今後の追随更新を監視する
- 追加の転送候補が出た場合は、対象リポジトリごとにこの表を更新する
