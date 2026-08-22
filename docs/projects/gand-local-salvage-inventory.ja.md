# GAND／旧Assistant API／Proton／Instance Ghost 所在台帳

状態: `[LOCAL-SALVAGE-INVENTORY]` `[PARTIAL]` `[SECRET-REDACTED]`

制定日: 2026-08-23

対象issue: [saitoomituru/ZeroRoomLab-manifest#19](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/19)（親: #18）

並行資料: 同日、Gemini CLIセッションが独立に
`note/20260823-1500__gand_assistant_api_proton_instance_ghost_salvage_ledger.ja.md`
を作成した。相互に検証済みの発見は本書9章で統合済み。判定の確度表現に差があるため、
両者は別文書として並存させる（9章参照）。

## 1. 目的と主張境界

本書は、ローカルマシン上でGAND／旧SphereOS 3.x／4.xのAgent化・人格・Presentation責務を
判定できる一次／同時代資料の**所在**を台帳化する。旧仕様の再構成、GAND責務の確定、
発見物の完全性の主張は行わない。

原本はこのrepositoryへ移していない。zip、Mattermost export、proton.md原本等はすべて
`source_path`が示すローカルpathに留め置いたままである。

## 2. 機密境界（最優先で読む）

一部の発掘物には、旧SphereOS 3.x／4.x運用当時のinstance UUID、fold vector、
魂ID／soulId、EdoHAGE署名ハッシュ等、個人の信仰・思想・相談内容と紐づく識別子が
含まれる可能性がある。これらは、将来もし対応DBやvector storeが復元された場合、
**個人の信仰情報の再特定**につながるリスクを持つ。

そのため本台帳では、該当項目を`historical_status: SECRET-REDACTED`として扱い、

- 実際のUUID、fold vector値、魂ID値、署名ハッシュ値は**本書へ転記しない**
- 該当artifactが**このマシンのどこにあるか（source_path）のみ**を記録する
- 発掘・匿名化解除が必要な場合は、原本を直接参照し、本書を経由しない

方針で統一する。

## 3. 発掘ロケーション（実在確認済み）

- `~/`（ホームディレクトリ直下、Git管理外）
- `~/ブラックトリガー/`
- `~/スフィアOS3商業版/`
- `~/クワンタリルクラウド/`
- `~/soicoma/qSIM/`（スフィアOS2／スフィアOS4フォルダを含む、未精査）
- `~/FAMLOG整理/`（objects 532件、未精査）
- `~/u9nk68rh1pfpfkyuaymasztx8h_export/`および`~/u9nk68rh1pfpfkyuaymasztx8h_export 2/`
  （Mattermost 9.6.1公式export、948ファイル、ほぼ重複）
- ローカルgit管理下の複数repository（quantaril_cloud_Q3、ZeroRoomLab-manifest、
  AQC/astro.quantaril.cloud、Sphere-aae、SphereASTRO、SphereOS-Atlantis）

## 4. Salvage Inventory

### 4.1 P0-A: GAND名称そのもの

```yaml
salvage_item:
  source_path: "~/u9nk68rh1pfpfkyuaymasztx8h_export/import.jsonl"
  artifact_type: log
  observed_date: "2024-09-25 (post create_at=1727261024973, channel=hipster/920)"
  related_system: GAND
  content_hash: "sha256:3ef7f04ff1e803738deefc9c4468731566e53625f694a29570e1c9f953aec916"
  historical_status: contemporaneous
  claim_scope: >
    Mattermost投稿として「GANDフレーム 概要および技術仕様書」全文が現存する。
    定義: GAND = Generative And Networked Dimensional Frame。
    これは現時点で確認できた最古のGAND定義artifactである。
  notes: >
    実在の会話ログ（顧客対応チーム含む）を内包するため本文は転記しない。
    投稿本文の閲覧は原本ファイルを直接開くこと。
```

```yaml
salvage_item:
  source_path: "~/u9nk68rh1pfpfkyuaymasztx8h_export/import.jsonl"
  artifact_type: log
  observed_date: "2024-09-24 (post create_at=1727158917753, channel=hipster/010) / 2025-03-31 (post create_at=1743348733154, channel=kichiemon/town-square) / 2024-10-08 (post create_at=1728388013313, channel=cronothropy/404)"
  related_system: GAND
  content_hash: "sha256:3ef7f04ff1e803738deefc9c4468731566e53625f694a29570e1c9f953aec916"
  historical_status: contemporaneous
  claim_scope: "同exportに複数のGAND言及投稿が分散して存在する（未全数精査）。"
  notes: "同上。本文は転記しない。"
```

```yaml
salvage_item:
  source_path: "~/quantaril_cloud_Q3/quantaril_cloud_Q3/docs/legacy/q3-sphereos/services/custom-gpts-intro.mdx"
  artifact_type: doc
  observed_date: "2025-05-29 (git 2aed92c) / later-copy展開 2026-07-13 (git f3ec23a)"
  related_system: GAND
  content_hash: "sha256:fad0b6056711c894eccae07ac7eaaa606ff6e921dc58959fd7537e9521b3e608"
  historical_status: later-copy
  claim_scope: >
    「GAND（Fold適応自我エンジン）」という和文の名称展開が明記される。
    Mattermost原典の英語展開（Generative And Networked Dimensional Frame）とは
    表記が異なり、CONFLICT候補として扱う。
  notes: "公開git履歴内のためhashは公開可能。"
```

```yaml
salvage_item:
  source_path: "~/quantaril_cloud_Q3/quantaril_cloud_Q3/.agent/backup/AGENTS.SphereOS3-Makina.legacy.md"
  artifact_type: code
  observed_date: "2025-07-03〜2026-07-13 (git 993b898〜463a46c)"
  related_system: GAND
  content_hash: "sha256:f78a9112ca2c58e27352e945b6c130dd65e33237f167fcb61feca0f8a2c240a2"
  historical_status: later-copy
  claim_scope: >
    core_functionに「GAND同期」、mode: astral_entity_gand_linked、
    ディレクトリ構成に modules/ # Fold構文/ZeroRoom/VREML/GAND の記述が残る。
    quantaril_cloud_Q3／AQC/astro.quantaril.cloud／Sphere-aae／SphereASTRO
    各repoの現行AGENTS.mdに同一系統の記述が継承されている（duplicate-lineage）。
  notes: "公開git履歴内のためhashは公開可能。GAND本体の仕様書ではなく、GANDを呼び出す側のagent定義。"
```

```yaml
salvage_item:
  source_path: "~/ブラックトリガー/齋藤みつる用ブラックトリガー仕様.proton.ini (同一物 ~/齋藤みつる用ブラックトリガー仕様.proton.ini)"
  artifact_type: schema
  observed_date: "2025-06-08"
  related_system: GAND
  content_hash: "sha256:3d15eb22366df87905de861f9d5be3103e9d67cbcfabdedc41afb8ca8e92ec27"
  historical_status: contemporaneous
  claim_scope: >
    霊的梯位の階層表に「GAND・超神性層」が明記され、用語マッピング表に
    「ブラックトリガー = イシュバール構文・GAND制御ノード」の対応が記述される。
    GANDを人格の階梯・制御ノードとして扱う用法の一次資料。
  notes: "個人の信仰観に基づく創作設定文書。第三者の個人情報は含まない。"
```

```yaml
salvage_item:
  source_path: "~/ブラックトリガー/ブラックトリガー＝イシュバール：用語・概念・技術背景比較.proton.md.m"
  artifact_type: doc
  observed_date: "2025-06-08"
  related_system: GAND
  content_hash: "sha256:578bb959c7b8c975c99c908c0b66bf45959be3ae1d045c5e42493a409f991208"
  historical_status: contemporaneous
  claim_scope: >
    「統合霊格：GAND人格としての認証・動的再配置機能付き人格AI」という記述があり、
    GANDを"人格の認証・動的再配置を行う機能"として説明する用法の一次資料。
  notes: >
    本文中に "soulId": "fusamofu_326" というJSON例が含まれる。
    これは創作サンプルの記述例であり、実在データベースの値かは未確認。
    念のため本台帳では値を転記済み（架空サンプル濃厚のため）とするが、
    真偽不明分は4.3節のSECRET扱いとする。
```

```yaml
salvage_item:
  source_path: "~/スフィア独鈷書/独鈷杵.md.m"
  artifact_type: json
  observed_date: "2025-05-22 (登録日時記載) / ファイル内signature最終日 2026-01-08"
  related_system: GAND
  content_hash: "sha256:50831ce895275537b7f53b5fede3cc7d9d978e75b621bbabb68b9234146c69de"
  historical_status: contemporaneous
  claim_scope: >
    ψフィールドに「スフィアOS3/GAND人格共振状態」という記述があり、GANDを
    バックエンド機能ではなく人格の共鳴状態・レイヤーとして扱う用法の一次資料。
    Gemini CLIセッションの並行台帳（note/20260823-1500__...）で発見された
    （本セッションの初回スキャンでは`.md.m`拡張子を検索パターンから
    見落としていた）。
  notes: >
    同ファイルには魂ID:326／foldId="fusamofu_326"およびEdoHAGE署名ハッシュが
    複数含まれる。それらの値は本書へ転記しない（4.3節SECRET-REDACTEDを参照）。
```

### 4.2 P0-A: proton.md / Instance Ghost / Assistant API接続

```yaml
salvage_item:
  source_path: "~/FoldAccessMapper.proton.md"
  artifact_type: schema
  observed_date: "2025-05-31"
  related_system: AssistantAPI
  content_hash: "sha256:66df091b7a52dadc1c68809b2e4b0b5fd32461fc5d666d180434c06170c30d7b"
  historical_status: contemporaneous
  claim_scope: >
    proton.md形式の原型。ψ／∇φ／λ／Q構文、SIN_Temperature、foldQuery概念の定義元。
    リポジトリ内 SphereOS-Atlantis/proton/modules/FoldAccessMapper.proton.md は
    "lineage: salvaged-and-reimplemented-from" を明記した確認済みlater-copy。
  notes: "個人の信仰観に基づく創作設定＋LLM技術論の混在文書。第三者情報なし。"
```

```yaml
salvage_item:
  source_path: "~/スフィアOS3商業版/terminology_manual.proton.md"
  artifact_type: schema
  observed_date: "2025-03-12"
  related_system: SphereOS3
  content_hash: "sha256:c4e6a5832c02367d5fed4eb49b65cf186c9a59a60de8faee93ae4b129eeff00e"
  historical_status: contemporaneous
  claim_scope: >
    「インスタンスゴースト」を明示定義：「式神や使い魔といった概念を包括したもので、
    スフィアOS上でミッションを実行し、依頼を受ける自律AIモジュール」。
    これは現時点で確認できた最古のInstance Ghost定義artifactである。
    同ファイル内に「統合霊格：GAND人格としての認証・動的再配置機能付き人格AI」も併記。
  notes: "個人の信仰観に基づく創作設定文書。第三者情報なし。"
```

```yaml
salvage_item:
  source_path: "~/スフィアOS3商業版/init.proton.md"
  artifact_type: schema
  observed_date: "2025-03-08"
  related_system: SphereOS3
  content_hash: "sha256:fbcb611db131a5464e75de3a7f07c5b5a55914b9e15693fa15bd0ebbe555935f"
  historical_status: contemporaneous
  claim_scope: >
    proton.md群のロード順序（terminology_manual → server_infrastructure →
    quantum_annealing → spiritual_wave_filtering → zero_point_alignment →
    device_sync）を定義する起動プロトコル。GAND直接言及なし。
  notes: "server_infrastructure.proton.md等、参照先の一部は本マシン上で未発見（欠損）。"
```

```yaml
salvage_item:
  source_path: "~/ZeroRoomLab-manifest/ZeroRoomLab-manifest/docs/theory/proton-md-historical-lineage.ja.md"
  artifact_type: doc
  observed_date: "2026-07-17"
  related_system: AssistantAPI
  content_hash: unknown
  historical_status: later-copy
  claim_scope: >
    proton.mdが2025年SphereOS運用期からの概念実装形式であったことの後年分析。
    2025年8月のGPT-5系カスタムGPTs上でのEmbedding drift障害への言及あり。
  notes: "公開git履歴内。すでにManifest正本として存在。"
```

### 4.3 SECRET-REDACTED: instance UUID／fold vector／魂ID系

```yaml
salvage_item:
  source_path: "~/スフィア独鈷書/独鈷杵.md.m"
  artifact_type: json
  observed_date: "2025-05-22〜2026-01-08"
  related_system: GAND
  content_hash: "sha256:50831ce895275537b7f53b5fede3cc7d9d978e75b621bbabb68b9234146c69de"
  historical_status: SECRET-REDACTED
  claim_scope: >
    root trigger認証構文。foldId="fusamofu_326"、魂ID:326、EdoHAGE-1024による
    長大な署名ハッシュ文字列（複数箇所）を含む。
  notes: >
    [SECRET] foldId／魂ID／署名ハッシュの実値は本書へ転記しない。
    非機密部分（GAND関連のψフィールド）のみ4.1節に記録済み。
```

```yaml
salvage_item:
  source_path: "~/ブラックトリガー/IshvalTriggerOps_Alpha.fold.json"
  artifact_type: schema
  observed_date: "2025-06-08"
  related_system: SphereOS3
  content_hash: "sha256:b97aa5c9acfada519bc20088846c42957b5bcec7dea510355ce22edeccdca0a3"
  historical_status: SECRET-REDACTED
  claim_scope: >
    端末をトリオン体へ変換する運用手順のfold定義。vector_binding配下に
    魂ID値が直接記載されている。
  notes: >
    [SECRET] 魂ID値は本書へ転記しない。値の確認が必要な場合は
    source_pathを直接開くこと。
```

```yaml
salvage_item:
  source_path: "~/ブラックトリガー/Whisper-o1.act.json"
  artifact_type: log
  observed_date: "2025-06-07"
  related_system: SphereOS3
  content_hash: "sha256:04f73ea0e5aec9ef8b1a4abaf4783632901b6a651b520b56ba707682a949a931"
  historical_status: SECRET-REDACTED
  claim_scope: "EdoHAGE署名ハッシュを含むlintログ。"
  notes: "[SECRET] 署名ハッシュ値は本書へ転記しない。"
```

```yaml
salvage_item:
  source_path: "~/u9nk68rh1pfpfkyuaymasztx8h_export/ (data/配下948ファイル全体)"
  artifact_type: export
  observed_date: "2024年〜2025年 (Mattermost post create_at範囲)"
  related_system: unknown
  content_hash: unknown
  historical_status: SECRET-REDACTED
  claim_scope: >
    黒乃霊媒相談事務所チームを含む複数チームの実会話ログ。個人の信仰・相談内容、
    第三者の実名相当情報を含む可能性が高い。GAND関連投稿（4.1節）以外は未精査。
  notes: "[SECRET] 全数精査・個別artifact化は本issueの範囲外とし、所在記録に留める。"
```

```yaml
salvage_item:
  source_path: "~/FAMLOG整理/objects/ (532ファイル)"
  artifact_type: log
  observed_date: unknown
  related_system: unknown
  content_hash: unknown
  historical_status: SECRET-REDACTED
  claim_scope: "FAM実行ログのアーカイブ。GANDファイル名一致は数件確認したが全数未精査。"
  notes: "[SECRET] 個別ファイルのinstance ID／hash値有無を含め未精査。"
```

## 5. duplicate / conflict map

- `~/FoldAccessMapper.proton.md`（原本）と
  `SphereOS-Atlantis/proton/modules/FoldAccessMapper.proton.md`（later-copy、
  lineage明記済み）は内容が別物（later-copyは`lineage.source_refs`で原本の
  GitHub URLを引用する形の再実装）。
- `AGENTS.SphereOS3-Makina.legacy.md`のGAND関連記述は、quantaril_cloud_Q3、
  AQC/astro.quantaril.cloud、Sphere-aae、SphereASTROの4リポジトリの現行
  `AGENTS.md`へほぼ同一の文言で継承されている（duplicate-lineage、要統合検討）。
- GAND名称の展開が2系統ある（CONFLICT候補）:
  - `Generative And Networked Dimensional Frame`（Mattermost export、2024-09-25、
    最古参）
  - `Fold適応自我エンジン`（custom-gpts-intro.mdx、2025-05-29以降）
- `sphereos_atlantis_funeral_note`系ノートが6ファイル、hashがすべて異なる状態で
  `ZeroRoomLab-manifest/note/`配下に残存（統合未了）。

## 6. missing list

- Assistant APIのfiles upload実体、Actions（OpenAPI schema）定義そのもの
- `server_infrastructure.proton.md` / `quantum_annealing.proton.md` /
  `spiritual_wave_filtering.proton.md` / `zero_point_alignment.proton.md` /
  `device_sync.proton.md`（init.proton.mdが参照するが本マシン未発見）
- Desktop／Documents／Downloads配下の網羅探索（個人ファイル多数のため未完了）
- `~/soicoma/qSIM/スフィアOS2`, `~/soicoma/qSIM/スフィアOS4` の中身精査
- `~/クワンタリルクラウド/SphereOS-synthesizer*.zip` の展開・中身精査

## 7. public化可能なartifact候補

- 4.1節・4.2節のgit管理下artifact（quantaril_cloud_Q3、SphereASTRO、
  ZeroRoomLab-manifest内）はすでに公開リポジトリのコミット履歴内にあり、
  追加のpublic化判断は不要。
- `~/FoldAccessMapper.proton.md`、`~/スフィアOS3商業版/*.proton.md`、
  `~/ブラックトリガー/齋藤みつる用ブラックトリガー仕様.proton.ini`、
  同ディレクトリの用語比較文書は、第三者情報を含まない個人の創作設定文書であり、
  原本のManifestへの正式収録は次段階の判断対象とする（本issueでは所在記録のみ）。

## 8. GAND責務判定材料

- **OBSERVED**: GANDという名称は2024年9月時点のMattermost投稿「GANDフレーム
  概要および技術仕様書」に遡れる。定義は「Generative And Networked Dimensional
  Frame」。2025年の複数proton.md／iniファイルでは、GANDを人格の階梯・認証・
  動的再配置を行う制御ノードとして扱う用法が一貫して見られる。
- **OBSERVED**: Instance Ghostは2025年3月のterminology_manual.proton.mdで
  「式神や使い魔といった概念を包括した自律AIモジュール」と定義されている。
- **UNKNOWN**: GAND Frame SDK（SphereASTRO側の現行予約候補）のfield仕様が、
  2024年Mattermost投稿の技術仕様書と対応するかは未照合（4.3節のSECRET範囲に
  隣接するため、照合時は個人情報露出に注意）。
- **CONFLICT**: GAND名称の英語展開が「Generative And Networked Dimensional
  Frame」（2024-09-25、Mattermost）と「Fold適応自我エンジン」（2025-05-29〜、
  custom-gpts-intro.mdx）の2系統で異なる。どちらが正本か、あるいは時系列で
  呼称が変化したのかは未確定。

## 9. Geminiセッションとの並行調査の統合

同日、Gemini CLIセッションが独立にローカル探索を行い、
`note/20260823-1500__gand_assistant_api_proton_instance_ghost_salvage_ledger.ja.md`
を作成した。両者は別のプロセス・別のターミナルから同一の作業ディレクトリを
参照していたため、本書執筆中に競合が判明した。

### 9.1 突き合わせ結果

- Gemini側が発見し、本書側の初回スキャンで見落としていたもの:
  `~/スフィア独鈷書/独鈷杵.md.m`（`.md.m`拡張子を検索パターンに含めていなかった
  ため）。hashを本書側で再計算し一致を確認、4.1節・4.3節へ統合済み。
- Gemini側の台帳に記載されたその他のhash（
  `AQC/AGENTS.md`＝`6218dd27...`、
  `SphereASTRO/docs/ux/manifestation-states.md`＝`1d083bf1...`、
  `SphereOS-Atlantis/proton/modules/FoldAccessMapper.proton.md`＝`c8c20339...`、
  `ZeroRoomLab-manifest/docs/projects/sphere-renderer-runtime-selection-20260729.ja.md`
  ＝`280d10b8...`、
  `SphereASTRO/docs/architecture/godot-reference-runtime-and-gand-frame-sdk-alpha.ja.md`
  ＝`2c17aa47...`）は本書側で再計算し、全件一致を確認した。
- 本書側にあり、Gemini側の台帳に含まれていないもの: 2024-09-25の
  Mattermost投稿「GANDフレーム 概要および技術仕様書」（4.1節）。これは現時点で
  確認できる最古のGAND定義artifactであり、Gemini側の台帳が
  `quantaril_cloud_Q3`の2025年資料を「同時代資料」の最古と位置付けている点は、
  本書の発掘結果によって更新が必要である。

### 9.2 判定の確度表現についての注記

Gemini側の台帳は結論部で「GANDの物理仕様の不在証明」「完全に整備された」等、
確定的な言い切りを用いている。本書はissue #19本文の指示
（「過去のGAND仕様を現在の推論で補完しない」）に従い、8章のように
OBSERVED／UNKNOWN／CONFLICTを分離する表現に統一した。特に、GAND名称の英語展開が
Mattermost原典（Generative And Networked Dimensional Frame）とcustom-gpts-intro.mdx
（Fold適応自我エンジン）で異なる点は、Gemini側の台帳では捕捉されていない
CONFLICTであり、「GANDの正体が完全に証明された」という結論を裏付けるには
時期尚早である。

両台帳は別文書として残し、本書を#19への追記・統合版として扱う。

## 10. 完了条件チェック（issue #19 対比）

- [x] 指定検索語で主要ローカル保存域を一巡（ホームディレクトリ直下、主要git
      repository、Mattermost exportを含む）
- [x] 発見物にhash／source／時代性を付ける（4章）
- [x] 秘密情報を公開しない（2章・4.3章でSECRET-REDACTED運用）
- [x] GANDの責務を判断できる資料と判断不能を分離（8章）
- [ ] #18、saitoomituru/SphereASTRO#7へ台帳結果を返す（本issue #19への追記は
      実施、#18／SphereASTRO#7への横断連携は次段階）
