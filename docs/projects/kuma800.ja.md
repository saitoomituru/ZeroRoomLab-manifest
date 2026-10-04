# KUMA800 — 独立開発終了・成果保存

状態: [ARCHIVE] 独立開発・今季運用計画終了（2026-10-04）
正本: [KUMA800 ADR 0006](https://github.com/saitoomituru/KUMA800/blob/main/docs/decisions/0006-KUMA800の独立開発を終了し成果を保存する.ja.md)
保存実装: [edf56b3](https://github.com/saitoomituru/KUMA800/commit/edf56b3fef1a81ecbd06673f2dc50ed9f112faf0)

電力問題による今季頓挫とFQuery／Sphereの進展を踏まえ、KUMA800の独立開発を終了する。収集・保存・read-only MCP・worker復旧／隔離・provenanceの実装と検証記録を保持し、必要な個別adapterやpluginとして再利用できる入口を残す。移植は未実施。

常駐の人間・物理受入、鮮度／drift監視、GUI等は未達。#6のenqueue喪失窓も未解決で保存する。実host停止とGitHub archived flagは実施receiptがある場合だけ確認済みとする。

## 管理上の教訓

非線形なマイクロモジュール依存へ固定の優先順位・線形計画を被せたことが今回の失敗点の一つ。局所の必要順序を保持しつつ、全体は起動条件・依存edge・資源eventでbranchを選ぶ。
[検証Note](../../note/20261004-1828__KUMA800終了と非線形依存の計画検証.ja.md)と[監査receipt](../../foldlog/20261004-1828__KUMA800独立開発終了のMAGI監査.ja.md)を参照する。

[元提案 #10](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/10)を終了受領先とする。
[FQuery #46](https://github.com/saitoomituru/FQuery/issues/46)、[SphereOS Atlantis #14](https://github.com/saitoomituru/SphereOS-Atlantis/issues/14)は別のSDK／監査責務として維持する。
