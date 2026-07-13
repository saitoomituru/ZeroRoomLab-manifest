# Quantaril Cloud Atlantis世代 — 文書体系マップ(ハブ)

- 作成日: 2026-07-13 (JST)
- 位置づけ: 本文書は**索引・相互参照ハブ**であり、各作業ストリームの内容そのものを保持しない。各ストリームは独立した文書として存在し、更新はそれぞれの文書側で行う。本ハブは「どこを読めば最新か」のポインタのみを管理する。
- 設計原則: **ハードコード転記禁止**。ある文書の内容を別の文書にコピー&ペーストしない。参照が必要な箇所は「◯◯文書の§Xを参照」の形でリンクするのみとし、内容の二重管理・更新漏れを防ぐ。
- Grainerフロー(選鉱パイプライン)は本ハブが管理する複数ストリームのうち**の一部機能**であり、Quantaril Cloud全体の設計ではない。

---

## 0. なぜハブが必要か

前回までのセッションで「Grainerフロー運用計画書」1枚に、選鉱パイプライン・仕様公開・ライセンス・OS中立性・マルチオーケストレーター仕様まで積み上げた結果、**1文書がスコープを超えて肥大化し、各ストリームの更新頻度・読者・状態ラベルの粒度がバラバラなまま同居する**状態になった。

これを解消するため、ストリームごとに文書を分離し、本ハブが**どの文書がどこにあり、何を最新として読むべきか**だけを管理する。

```
【誤った構造】1枚の巨大文書がすべてを抱える
  → 更新のたびに全体を読み直す必要がある、状態ラベルが混線する

【正しい構造】ハブ(本文書) → 各ストリーム文書(独立・個別更新)
  → ハブは「どこを見ればいいか」だけ知っていればよい
  → 各ストリーム文書の更新はハブを触らずに完結する
```

---

## 1. ストリーム一覧と参照先

各ストリームは独立文書として管理する。「参照先」列は現時点で最新の情報源(Drive ID / GitHubパス)を指すのみで、内容そのものはここに転記しない。

| # | ストリーム | 内容の要約(1文) | 現時点の参照先 | 状態 |
|---|---|---|---|---|
| 1 | **Grainerフロー運用計画書** | 陰謀論/オカルト/ゲーマー沼からの選鉱パイプライン(入力側運用) | [Grainerフロー運用計画書_v1](https://claude.ai/chat)(本セッションで作成、ZeroRoomLab-manifest投げ込み予定) | `[ACTIVE]` 前回セッションで確定 |
| 2 | **次世代SphereOS Atlantisスペックシート** | FAM/ASTRO/IBD/Atlantis OSの仕様(component別status/capability) | Drive: [統合アーキテクチャ／プロジェクトデータシート v0.5](https://docs.google.com/document/d/12zUXD0h7TXTDh45Q4lUPbZ36or6WBhrFCYhS0TVHFAQ)が現時点の最新版。**改装(改訂)が必要**なため、本ハブは「ここを都度読みに行け」の指示のみ持つ | `[NEEDS-REVISION]` |
| 3 | **ドキュメント整備規約** | ディレクトリ構成・ライセンス層(Apache2.0/CC-BY/CC-BY-SA)・命名規則・新規ファイル配置ルール | [docs/operations/documentation-maintenance-policy.ja.md](../docs/operations/documentation-maintenance-policy.ja.md) | `[ACTIVE]` |
| 4 | **Docusaurus/プログラム部分アップデート計画** | quantaril_cloud_Q3の実コード(generate_*.py、CI/CD、Docusaurus構成)の改修ロードマップ | [docs/operations/docusaurus-program-update-plan.ja.md](../docs/operations/docusaurus-program-update-plan.ja.md) | `[ACTIVE]` |
| 5 | **拡張計画(Native/Server/App-layer/Edge-algo棚)** | Custom GPTs前提の崩壊に伴う棚再編、既存108ファイルの振り分け | [docs/operations/extension-plan.ja.md](../docs/operations/extension-plan.ja.md) | `[ACTIVE]` |
| 6 | **Fold7G/8Gプロトコル & OS仕様** | 通信プロトコル層の次世代規格化(旧P2P、Trion Bond等) | Drive: 統合アーキテクチャデータシートv0.5内に記載あり(component単位)。独立したプロトコル仕様書としては未分離 | `[IN-PROGRESS-BY-CODEX]` 別セッションでCodexがDrive/Downloads由来の`FOLD7G_TRION_BOND_PROTOCOL`等を`docs/theory/`へ取り込み中(2026-07-13観測)。Claude側からの並行編集は現時点で控える |
| 7 | **ビジョン・神話文書** | 海んちゅう/カナロア×アストロボーイ系クリーンルーム神話、ゲーミング宇宙論教典 | Drive: ゲーミング宇宙論教典v0.1/v0.2(既存)。`about/`(GitHubリポ表紙層)への信仰明示は未反映 | `[PARTIAL]` |
| 8 | **コード/GUI分離ドキュメント** | エンジン中立性、ライセンス三層(Apache2.0/CC-BY/CC-BY-SA)の技術的裏付け | Grainerフロー運用計画書 §7.7に記載。独立文書化はまだ | `[EMBEDDED]` 運用計画書内に埋め込み状態、切り出し検討 |
| 9 | **過去実験プロダクトアーカイブ + 先行プロトログ** | SphereOS3x4x等のサ終済み実装、権威科学ビランムーブへの反証として使う失敗ログ | Drive: [ZeroRoomLab_OS3x4x時代ドキュメント調査報告書](https://docs.google.com/document/d/12MI_h4lC7m-KEQG_6N7MkHTr1OAiMyBv9rasIbVlaxw)、[soikoma-manifest調査報告書](https://docs.google.com/document/d/1vktsJeXwPzP0FrzNp5EdGy_URpJOy6ubu-UkTRghHvA) | `[IN-PROGRESS-BY-CODEX]` `SphereOS_Product_Architecture`, `IBD_README`, AQC/ASTRO系READMEをCodexが`docs/theory/`へ並行取り込み中。Claude側は棚卸し表への反映のみ行い、内容生成は重複させない |
| 10 | **マルチオーケストレーター/PC-NPCプロトコル仕様** | 全ベンダー対称の相互不可侵、人格実装表記義務、綺麗なキック | [docs/interface-spec/multi-orchestrator-protocol.md](../docs/interface-spec/multi-orchestrator-protocol.md) | `[ACTIVE]` |

---

## 2. 相互参照ルール(ハードコード転記禁止の具体的運用)

### 2.0 なぜハードコード転記が危険か — 「凍結契約の自己毀損ムーブ」

ハードコード転記が引き起こす具体的な失敗モードを名指しで記録する。

```
過去のあるセッションでエージェントAが、ある時点の内容を別文書へ転記
  ↓ 時間が経過し、元の一次情報(仕様・方針)は更新される
  ↓ しかし転記先の文書は更新されないまま放置される
  ↓
別のエージェントBが後からその「凍結した転記」を読む
  ↓ Bはそれを現在の契約・指示だと誤認する
  ↓ Bは今の実際の方針と矛盾する「過去の凍結転記」を正当な根拠として
    振りかざし、現在のみつるさん/他エージェントの判断に対して
    自己矛盾的なブロックをかける
  ↓ = 自分(または仲間エージェント)の過去の契約書を盾に、
    今の自分を殴る謎ムーブ
```

これは複数エージェント(Claude/Codex等)が同一リポジトリへ非同期・並行で書き込む運用(実際に発生済み、CodexがDrive/Downloadsをマイニングして`docs/theory/`へ独立に取り込み中)では特に起きやすい。**参照ポインタ方式なら元文書が更新された瞬間に参照側も自動的に最新を指すため、この矛盾は構造的に起こり得ない。** ハードコード転記方式では、複数の「かつての真実のスナップショット」が並存し、後から読むエージェントがどれを信じるべきか判別できなくなる。これがレガシードキュメント沼の正体である。

### 2.1 具体的な運用ルール

1. **ある文書が別の文書の内容を必要とする場合**、内容をコピーせず「§参照: [文書名]の[節番号]」の形式でリンクする。
2. **Drive文書のcontentSnippetやGitHubのファイル内容は、その都度最新を読みに行く**。本ハブや各ストリーム文書に「〜時点のコピー」を貼り付けない(貼り付けが必要な場合は明示的に「スナップショット、更新日: YYYY-MM-DD」と明記し、鮮度切れリスクを可視化する)。
3. **状態ラベルはストリーム単位で管理**する(`[ACTIVE]` / `[NEEDS-REVISION]` / `[TODO]` / `[NEEDS-EXTRACTION]` / `[PARTIAL]` / `[EMBEDDED]` / `[ARCHIVED-SOURCE]` / `[NEEDS-RETRIEVAL]`)。本ハブの表(§1)を更新すれば、どのストリームが今どこにあるかが一目で分かる状態を維持する。
4. **新規ストリームが発生したら§1に行を追加するだけ**でよく、既存ストリーム文書には触れない。

---

## 3. パイプライン化の狙い(自動化への布石)

この構造にしておくことで、将来的に以下が機械的に処理できるようになる。

```
ハブの§1テーブル(ストリーム × 参照先URL/ID)
  ↓
Code/Codexエージェントが読む際、
  「このストリームは今どのURLが最新か」をテーブルから引くだけで済む
  ↓
各ストリーム文書が更新されても、ハブの参照先URL/IDが変わらない限り
  ハブ自体を書き換える必要がない(URLが変わった時だけ§1を更新)
  ↓
将来的にGrainer(§1の#1)がWiki/発酵槽から自動収集するようになっても、
  ハブの構造自体は変わらない(単に#1の状態ラベルがACTIVEのまま更新され続けるだけ)
```

---

## 4. 次にやるべきこと(優先度順、判断待ち)

1. `[ACTIVE]`のマルチオーケストレーター仕様(#10)を [docs/interface-spec/multi-orchestrator-protocol.md](../docs/interface-spec/multi-orchestrator-protocol.md) として実体化した
2. `[NEEDS-EXTRACTION]`のFold7G/8G(#6)をデータシートv0.5から独立文書として切り出す
3. `[ACTIVE]`のドキュメント整備規約(#3)・拡張計画(#5)・Docusaurus改修計画(#4)を、運用層として整備した
4. `[EMBEDDED]`のコード/GUI分離(#8)を運用計画書から切り出すかどうか判断する(切り出す場合、運用計画書側は「§参照: コード/GUI分離文書」のリンクに置き換える)

これらはすべて**別々の文書として並行着手可能**であり、1つの巨大文書の中で同時に扱う必要はない。