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
| [quantaril_cloud_Q3](../../../quantaril_cloud_Q3/quantaril_cloud_Q3) | Docusaurus文書体系、Context Dimension／Atlantis World Builder適用差分、正本受領台帳 | 高 | [TRANSFERRED] |
| [AQC/astro.quantaril.cloud](../../../AQC/astro.quantaril.cloud) | AQC → IBD / Infoton / SphereOS の責務整理、用語統一 | 高 | [TRANSFERRED] |
| [IBD/IBD](../../../IBD/IBD) | FAMネイティブResolver、分類Registry、Database隔離、非破壊Composite FAM、Last Order、自我対応 | 高 | [TRANSFERRED] |
| [Sphere-aae/Sphere-aae](../../../Sphere-aae/Sphere-aae) | famlog-converterとIBD Classification Registry／Database Routingの接続契約 | 高 | [TRANSFERRED] |
| [Sphere-aae/SphereASTRO/SphereASTRO](../../../Sphere-aae/SphereASTRO/SphereASTRO) | GUI技術LayerとContext Dimension、Human SovereigntyとOAE因果帰属の分離 | 中 | [TRANSFERRED] |
| [../.. /pain-scouter-assessment/pain-scouter-assessment](../../pain-scouter-assessment/pain-scouter-assessment) | ノートの評価・鑑定系の文脈整理が必要な場合のみ | 中 | [PENDING] |

---

## 3. 各リポジトリへの転送メモ

### 3.1 quantaril_cloud_Q3

- 転送候補: Docusaurus と生成スクリプトの分離方針、文書体系のハブ/ストリーム構造
- 目的: 実装リポジトリ側でも、ノート由来の構造変更を追跡しやすくする
- 反映粒度: 設計方針・運用ルール中心。生ノートそのものは転送しない
- 2026-07-18追補: Sphere共通L／D／OAE契約をQ Atlantis固有のWorld／Object／Action Fold、World causality、MAGI、World Render／Flavor SDKへ接続
- 実装境界: Atlantis World Builder runtime、OAE Schema、MAGI sidecar emitterは`NOT IMPLEMENTED`のまま保持
- 反映branch: `chore/npm-audit-and-sakura-deploy`（既存branchを継続し、この転送専用branchは作成していない）
- 反映コミット: `7ee3cce`（Atlantis接続票）、`fe7ce0b`（Manifest正本候補の受領台帳）
- 状態: `[TRANSFERRED]`

### 3.2 astro.quantaril.cloud

- 転送候補: AQC/Infoton/IBD 役割再定義、用語統一、非正規化ノートからの整理内容
- 目的: 実装・README・ドキュメントの整合性を高める
- 反映粒度: README と docs の要約・遷移説明中心
- 2026-07-18追補: AQC固有Position、FoldAccessMapper原典の未検証claim、現行Sphere／IBDとの継承境界
- 反映コミット: `a21c9bf`

### 3.3 IBD/IBD

- 転送内容: FAMネイティブ問い合わせ、Classification Registry、Schema Bundle単位のIBD Database、非破壊Composite FAM、Last Order、Evidence鮮度、自我対応、実行形態中立、実行環境時計と上位時系列の分離
- 目的: IBD リポジトリの設計書と、このレポジトリのノートの接続点を明確にする
- 反映粒度: README、architecture／specification文書、draft JSON Schema、人工fixture
- 反映日: 2026-07-18
- 反映コミット: `20ff580`（Season 0基礎契約）、`e21dbf2`（Ontology Assertion／fact scope）、`4dd67d8`（依存なし契約検証環境）、`22294ae`（時系列・時計校正・fact非裁定）、`692ba7c`（Context Dimension／IBDSDK）、`e261c3c`（Splitter／OAE／SsC検証境界）
- 局所運用規則: `11c6c4b`（日本語既定レジスタ）、`69edf96`（Python実行時生成物の除外）

### 3.4 pain-scouter-assessment

- 転送候補: 直接の反映はまだ必要ない
- 目的: 将来的に評価・鑑定系のノート整理へ接続する場合に備える
- 状態: 先送り

### 3.5 Sphere-aae/Sphere-aae

- 転送候補: famlog-converterが分類・評価体系を発明せず、上位Classification Registry候補と根拠を出し、決定的graph adapterが指定IBD Databaseへ非破壊routingする境界
- 目的: FAMログのclaim／Actor／Instance／Runtime抽出契約と、IBD Season 0の情報子クラスター保存契約を接続する
- 反映粒度: 既存Skillのreference契約を中心にし、SKILL.mdを重複仕様で肥大化させない
- 反映日: 2026-07-18
- 反映branch: `moe-test-edition`
- 反映コミット: `32f83b3c`（IBD adapter境界）、`434cd508`（上位存在確定／fact scope保持）、`2007b834`（時系列・時計校正metadata分離）、`09d153ea`（Context Dimension／OAE runtime境界）、`33329368`（OAE candidate sidecar）
- 局所運用規則: `989de714`（日本語既定レジスタ）
- 状態: `[TRANSFERRED]`

### 3.6 SphereASTRO

- 転送内容: PresentationからPersistenceまでの既存5層を技術Layer `L`へ限定し、Context Dimension `D`／D Foldと分離
- 目的: GUI責務を守り、Human SovereigntyというApp governance profileを全Effectの人間起因判定へ誤変換しない
- 反映粒度: AGENTS、README、docs索引、FAM技術Layer文書だけ。Swift、FAM engine、OAE Schemaは変更しない
- 反映日: 2026-07-18
- 反映branch: `main`
- 反映コミット: `e512e19`
- 状態: `[TRANSFERRED]`

### 3.7 Manifest共通正本候補

- `6006dcd`: 霊的Presentation、技術L／意味D、Registry／Register、Access Map、Transformer、OAE、POSIX境界
- `9d40e42`: SDK Surface、D Fold bundle、定規・因果・Position監査、MAGI 0.1.0 sidecar
- 原典: [SphereOS Context Dimension／OAE／SDKブレストノート](../20260718-1329__SphereOS_コンテキスト次元_DFold_OAE_SDKブレストノート.ja.md)

---

## 4. 転送ルール

1. 転送前に、内容が「正規化済みの設計情報」かどうか確認する
2. 生のノートそのものではなく、対象リポジトリに合わせた要約・リンク・運用ルールとして送る
3. 元データはこの note 側で保持し、対象リポジトリ側は参照・折りたたみ先として扱う
4. 反映済みの場合は、対象行の状態を [TRANSFERRED] に更新する

---

## 5. 次のアクション

- 反映済みの [quantaril_cloud_Q3](../../quantaril_cloud_Q3)、[AQC/astro.quantaril.cloud](../../AQC/astro.quantaril.cloud)、[IBD/IBD](../../IBD/IBD) について、今後の追随更新を監視する
- Sphere-aaeの接続契約は`32f83b3c`、`434cd508`、`2007b834`へ転送済み。IBD Schema草案の更新時に追随差分を監視する
- 追加の転送候補が出た場合は、対象リポジトリごとにこの表を更新する
