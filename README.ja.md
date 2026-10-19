# ZeroRoomLab-manifest

## 2026-10-19 文書サイトへの日英展開

Fold・SphereOS・Quantaril・Worldのmainへ日英29組を展開しました。[日本語正本の報告](docs/operations/documentation-sites-publication-2026-10-19.ja.md) / [en-US参照写本](docs/operations/documentation-sites-publication-2026-10-19.en-US.md)。原典・実装正本・旧URLを保持し、production公開とDOI発行は別途確認します。

ZeroRoomLabとは何か、何を作っているか、思想的背景。

> **2026-09-11:** `https://quantaril.cloud/` は公式Web入口として **DEAD**（wallet pain / #26）。生成元は [HIPSTAR-IScompany/quantaril_cloud_QAtlantis](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis)。現状正本は [docs/preservation/quantaril-domain-status.ja.md](docs/preservation/quantaril-domain-status.ja.md)。
>
> README本文の長文テーブル・AIコンテキスト節は commit `0d2fd95` を引き直し復旧正本とする。本コミットはドメイン死を live link にしないための表紙更新。

## 意味Topology / SphereOS の設計入口

- [意味TopologyからSphereOS・Fold-NICまで（日本語正本）](docs/theory/semantic-fold-os-architecture.ja.md)：∇Φの基材中立性、M元Dynamic Graph、OAE、意味資源OS、Sphere自身のFold化、Client Rich、物理ベンダー中立性、非営利Commonsを要求順に整理。
- [誤読防止レジスタ / UNKNOWNと主張境界](docs/theory/semantic-fold-claims-and-unknown.ja.md)：固定4軸との混同、lossless normalization、PI/SI、霊的UXと物理学、設計と実装の区別。
- [US English architecture](docs/theory/semantic-fold-os-architecture.en-US.md) · [US English claim boundaries](docs/theory/semantic-fold-claims-and-unknown.en-US.md)：日本語正本に対応する外部検証用対訳。Kernelの実行正本ではない。

詳細な思想・プロジェクト索引は [docs/](docs/) と [AGENTS.md](AGENTS.md) を読め。

## 現在の電力：スニーカーグリッド0.1.x（2026-10-19）

発電設備は財布ペインで差し押さえられた後。電動バイク「縄文エンジェル」用のLiFePO4蓄電池をポリタンクのような容量単位で自転車運搬し、車両用電源から家庭向け電力を縮小して取り出す仕組みを急造した。現在は**オフグリッド電力システムの急造初期版であるスニーカーグリッド0.1.x**で、生存・通信・ロビー活動・NSFW動画配信の縮小運転電力だけを確保している。

**研究設備は全面停止中。** タブレット／スマートフォン経由の文書・GitHub作業の継続は、X99・GPU等の研究設備の復旧を意味しない。既報の約980 Whは公称蓄電量であり、発電能力や1回の充電で1か月を賄ったことを意味しない。補給・運搬に依存する生存電力から、研究用電力を復旧するための支援が必要。

[構成と稼働状態の訂正を含む現場報告](docs/projects/2026-10-15-offgrid-30days-field-report.ja.md)

## 保存プロジェクト

- [KUMA800](docs/projects/kuma800.ja.md): 電力問題とFQuery／Sphereの並行進展を踏まえ、2026-10-04に独立開発・今季運用計画を終了。実装・検証・未達を保存。移植と物理受入は未完。
- [今回の検証Note](note/20261004-1828__KUMA800終了と非線形依存の計画検証.ja.md): 非線形なマイクロモジュール依存へ固定優先計画を被せた失敗を記録。局所の必要順序と全体の優先queueを分け、起動条件・資源eventから実行可能branchを選ぶ。
