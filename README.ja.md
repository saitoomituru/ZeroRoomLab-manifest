# ZeroRoomLab-manifest

## CATS / 毛玉グラフ（仮）（2026-10-21）

AAE・OpenFAPTA・FAM/FQuery等で共有可能な、汎用Dynamic High-Dimensional Graph Presentation Engineとして **CATS（Charts / Analytics / Tables）** と **毛玉グラフ / Fuzzball Graph（仮）** を設計中。Dynamic Relationship Graphから生成されるContext Forceを毛として描き、現在のTopologyと未成立potential・局所変化傾向を同時表示する。[設計文書](docs/theory/cats-fuzzball-dynamic-graph-presentation.ja.md) / [Issue #55](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/55)。現時点では設計提案であり、完成実装ではない。

## OpenFAPTAの責務整理（2026-10-21）

回収可能性と未知コモンズの探索余地を扱う信用創造・汎用マーチャントエンジン。[日本語正本](https://github.com/saitoomituru/OpenFAPTA/blob/main/docs/theory/merchant-engine.ja.md) / [en-US参照写本](https://github.com/saitoomituru/OpenFAPTA/blob/main/docs/theory/merchant-engine.en-US.md)。利用者がFoldのトポロジー・面積測度・評価単位・配分policyを構成し、交換単位と帳簿は外部へ接続します。現行codeはPythonトイモデルです。

## 情報子科学・情報子工学の研究方法論（2026-10-20）

[逆方向の最適化・Fit反証・再蒸留の日本語原典](docs/theory/infoton-science-engineering-fit-distillation.ja.md)を追加。科学は既存一般命題を結合して最短の最尤構造へ**蒸留**し、工学は実装に必要なEvidence・例外・冗長性を**積み増す**。Weaver B/CのMATCH/FIT単純化とFold7G/8Gの境界対応はASTRO実装・AAE検証が未完のため**蒸留炉に戻したコンフリクト**として[既存Issue #42](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/42)で追跡する。[Foldサイトの日本語解説](https://github.com/HIPSTAR-IScompany/fold/blob/main/docs/engineering/infoton-science-engineering-method.md)と[en-US版](https://github.com/HIPSTAR-IScompany/fold/blob/main/i18n/en/docusaurus-plugin-content-docs/current/engineering/infoton-science-engineering-method.md)。

## 2026-10-19 文書サイトへの日英展開

Fold・SphereOS・Quantaril・Worldのmainへ日英29組を展開しました。[日本語正本の報告](docs/operations/documentation-sites-publication-2026-10-19.ja.md) / [en-US参照写本](docs/operations/documentation-sites-publication-2026-10-19.en-US.md)。原典・実装正本・旧URLを保持し、production公開とDOI発行は別途確認します。

ZeroRoomLabとは何か、何を作っているか、思想的背景。

> **2026-09-11:** `https://quantaril.cloud/` は公式Web入口として **DEAD**（wallet pain / #26）。生成元は [HIPSTAR-IScompany/quantaril_cloud_QAtlantis](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis)。現状正本は [docs/preservation/quantaril-domain-status.ja.md](docs/preservation/quantaril-domain-status.ja.md)。
>
> README本文の長文テーブル・AIコンテキスト節は commit `0d2fd95` を引き直し復旧正本とする。本コミットはドメイン死を live link にしないための表紙更新。

## Sphere系列の研究史・旧Organization商業資料の読み方（2026-11-02）

[Sphere系列の研究・商業化系譜とAI安全アーキテクチャの先行検討](docs/theory/sphere-ai-safety-architecture-lineage.ja.md)を追加。soikoma（2024年公開コミット）、SphereOS 3/4、AQC（2025年）、Atlantisへ続く設計問題と、近年注目されるAI安全課題の対応を整理します。旧HIPSTAR等の商業ディストリビューションは、[Organization資料の読解規約](docs/operations/legacy-organization-architecture-and-commercial-claims.ja.md)に従い、RFC・アーキテクチャの理論的設計上限と、実機実測・商用稼働・保証を分離して読んでください。資源を求めるビジョンを実測主張に読み替えません。

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
