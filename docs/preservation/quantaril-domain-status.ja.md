---
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0
status: canonical-status
updated: 2026-09-11
related_issues:
  - ZeroRoomLab-manifest#13
  - ZeroRoomLab-manifest#26
  - ZeroRoomLab-manifest#27
  - ZeroRoomLab-manifest#28
---

# Quantaril 公式ドメイン現状（2026-09-11）

## いま生きている入口

`https://quantaril.cloud/` は **公式Web入口としては死んでいる**。

原因は技術敗北ではなく **wallet pain / patron不足** による 2026-08-25 更新期限の未更新（#26）。DNS文字列の生存と運営主体の連続性は別物とする（#27）。

生成元・現行の見える場所:

- 生成元リポジトリ: [HIPSTAR-IScompany/quantaril_cloud_QAtlantis](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis)
- 関連実装・証跡: [HIPSTAR-IScompany/astro.quantaril.cloud](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud)
- このマニフェスト上の概念正本: [docs/theory/quantaril-cloud.ja.md](../theory/quantaril-cloud.ja.md)
- 名前空間移行ミッション: [docs/network/fold8g-emergency-migration-mission.ja.md](../network/fold8g-emergency-migration-mission.ja.md)

```text
https://quantaril.cloud/     = historical locator / DEAD as official presence
GitHub QAtlantis origin      = surviving source tree
GitHub ZeroRoomLab-manifest  = status + lineage witness
.fold / Fold8G namespace     = intended successor addressing plane (#28)
```

## 失効ドメイン

```text
quantaril.site    renewal deadline 2026-08-25
quantaril.help    renewal deadline 2026-08-25
quantaril.cloud   renewal deadline 2026-08-25 / observed unreachable 2026-08-26
```

2026-09-11 時点でも `quantaril.cloud` を live canonical として扱わない。

将来同じ文字列が再び応答しても、GitHub 現行正本からの独立確認なしに当プロジェクト公式とみなさない。

## Issue / docs の扱い

- 過去Issueやノートに残る `https://quantaril.cloud/...` は **historical citation**。
- 工学参照が必要な場合は生成元 GitHub を先に見る。
- URL rot を「資料が消滅した」と読まない。ソースツリーは残っている。

## 一文

> 請求書が名前解決を殺した。ソースは GitHub の QAtlantis 生成元に残っている。
