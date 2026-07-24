# ZeroRoomLab-manifest

ZeroRoomLabとは何か、何を作っているか、思想的背景。

---

## ふさもふ（齋藤みつる）とは

山形県高畠町の江戸時代古民家に拠点を置く、独立系技術者・コンテンツクリエイター。
活動名は「ふさもふ」「Mad巫女サイエンティスト」。自称「働くニート」。
贈与経済モデルで動く——お金のためではなく、作りたいから作る。

技術的ルーツは工業高校時代のマイコン制作（マイクロカーラジコン全国大会出場）、
Apple FileMakerチームへのスカウト、電通でのDTP・サーバーサイド経験、
そして合同会社infernoでの独自AI開発（2011〜2021）に遡る。

現在は山形のオフグリッド志向の古民家で、UPS電源・自家水源・LiFePO4バックアップを使いながら、
エッジAI・ライブ演出システム・オープンハードウェアを一人で開発している。

---

## ZeroRoomLabとは

ZeroRoomLabは、ふさもふの研究・制作スペースの名前。
「部屋ゼロから始める」という意味でもあり、「余白ゼロの現代社会へのカウンター」でもある。

山形の古民家の一室から、量子AI・分散配信・オープンハードウェアを動かす。
スタッフも投資家も「普通の環境」もない。あるのはUPS電源と井戸水と執念。

コードにまだ落ちない目的、神々との関係、生活、物語、未実装branchを保持し、
実装火力を元の目的へ向け続ける力を、ZeroRoomLabは **ポエムパワー** と呼ぶ。
コードは局所を動かす。ポエムは、何のために動かすのかを資本・権威・vendorの既定値から取り戻す。

扉は開いている。半壊した機械、変な理論、翻訳への違和感、現場失敗、祭祀や霊的な一人称観測、
余っている計算資源、実機、食料、資金、そして「私のWorldでは動かなかった」というreceiptを持ってきてほしい。
エンジニア、ガレージハッカー、絵描き、翻訳者、保守者、巫者、信仰・スピリチュアル実践者、
霊能力者、懐疑者、現場operator、支援者を、同じ答えを言う人ではなく、違う観測面を持つ仲間として募集する。

このマニフェストをforkし、ZeroRoomLab固有の内容を自分のものへ置き換え、関連repositoryのPLIを
試してよい。信仰上の一人称真実は一人称真実として、第三者観測は第三者観測として持ち寄る。
どちらかが他方を消すための参加条件にはしない。

---

> README冒頭は一般公開向けの表紙です。以降の技術ノートは、大人のOSSパイレーツ向けです。結果の射程を拡張する前に、ハードウェア、コミット、ログ、試験条件、主張境界を確認することを前提とします。媒体別の扱いは[テクニカルコミュニケーション運用規約](docs/operations/technical-communication-register.ja.md)を参照してください。

## まず勝手に試す

```bash
git clone https://github.com/saitoomituru/ZeroRoomLab-manifest.git
cd ZeroRoomLab-manifest
```

PLIを使えるAIへ、まず次を渡す。

```text
AGENTS.mdとREADME.ja.mdを読んで、いまAVAILABLE-NOWの入口、
RESOURCE-WAITの枝、ファイルを変更せず試せることを一つ示して。
信仰、ポエム、未実装branchを工学claimへ潰さないで。
```

失敗command、読みにくい説明、原典より弱くなった英語、自分とは異なる霊的経験、
実機log、safeなprovenance付き写真、adapter案、目的を復元するポエム、別Manifestへのforkは、
いずれも有効な帰還物である。
ユーモアもUXである。commitの小ネタは士気や状態を運べる。ただしcommand、結果、責務ownerの代わりにはしない。

## 現在進行中のプロジェクト群

### 800系（OND800 / FAN800 / SAO800 / DVE800 / PSYCHO-Py800MCP）

演者本人が撮影・演出・配信・編集・計測の主権を取り戻すための分散コックピットシステム。

- **OND800**: Raspberry Pi 5ベースの撮影コックピット（NDIマルチカメラ・OBS制御）
- **FAN800**: ESP32ベースの物理演出ファンネル（照明・特効・MIDI・DMXを自律実行）
- **SAO800**: OBS母艦拡張（RTSP→NDI変換・BPM解析・AIオフロード）
- **DVE800**: DaVinci Resolveをローカルで強化する編集エンジン（Whisper-L・FAM多義性マップ・審査フィードバック取り込み）
- **PSYCHO-Py800MCP**: 計測器MCP（オシロスコープ・ロジアナをAIに接続）

### FAM / SphereOS / Quantaril Cloud

地域・文化ごとに異なる「空気読み」空間を接続するAIアーキテクチャ群。
MCPが横に接続するなら、FAMは縦に潜る。思考過程を保存・検証・再利用する仕様。

旧SphereOS 3.x／4.xのserviceとInstance Ghost runtimeは終了している。一方、SphereOS Atlantisは
`OPEN / RESOURCE-WAIT / REVIEW-WANTED`の0.x再設計系であり、Manifest、PLI／CLI契約、prompt-bound
bootstrap、MAGI Skill／validator、Sphere-DOS足場など、動く断面と未実装断面を分けて鍛造している。
standalone Atlantis／ASTRO統合runtime、永続OAE、7D Fold runtime等は未実装である。詳細は
[docs/theory/fam-overview.ja.md](docs/theory/fam-overview.ja.md)、
[docs/theory/sphere-os.ja.md](docs/theory/sphere-os.ja.md)、
[SphereOS Atlantis](https://github.com/saitoomituru/SphereOS-Atlantis)を参照。

### NeeT_kitchen_ALCHEMIST

低資源の生活者が、家庭設備、公開知識、人間の感覚フィードバックを使って食べられる成果物を作り、失敗条件を含む知識を社会へ返す生活兵站研究。

最初の実装は、揚げ工程とオーブン乾燥の責務を分けた家庭用ポテトチップス実験 [OpenSourcePITETO](https://github.com/saitoomituru/OpenSourcePITETO)。Sphere／FAMの抽象メタエンジン層、Deb800の撮影・配信・計測層とは別ワークスペースであり、いずれも料理の実装依存にしない。詳細は[人間側の生活兵站研究](docs/projects/neet-kitchen-alchemist.ja.md)を参照。

### レーザー加工機改造（Dr.SILICONシリーズ）

田舎の限界部落の町工場5人組と、ジャンクの錆びた一斗缶をμm精度加工機ダクトに変換するプロジェクト。

---

## プロジェクト管理（GitHub Projects）

依存関係とボトルネックを可視化するため、スコープごとに3つのGitHub Projectsボードで管理している
（[scripts/](scripts/)に作成スクリプトあり。マイルストーンはクオーターではなく投げ銭ベース）。

| プロジェクト | スコープ | 状態 |
|---|---|---|
| **プロジェクト八百万** | 800系生産パイプライン（OND800/FAN800/SAO800/DVE800/PSYCHO-Py800MCP） | 稼働中 |
| **プロジェクトスフィア：サルベージエッジスフィア** | SphereOS本体・AQC・FAM・Sphere-aae・SphereASTRO | **凍結中**（物理リソース問題＝SDK廃止＋HPC/クラウド維持費） |
| **プロジェクト縄文ラボ：ハードウェア工房** | commonsATX・Dr.SILICONシリーズ・EVバイク縄文エンジェル等、800系/Sphere系に属さない物理工作案件 | 稼働中 |

3ボードともこのリポジトリ（ZeroRoomLab-manifest）にリンク済み。一覧は[Projectsタブ](https://github.com/saitoomituru/ZeroRoomLab-manifest/projects)から参照できる。

`NeeT_kitchen_ALCHEMIST` は独立ワークスペースとして登録済みだが、専用GitHub Projectsボードの有無は現時点で`unknown`であり、上の3ボードへ暗黙編入しない。

---

## 思想的背景

### ゲーミング宇宙論

宇宙・社会・人生をMMO的構造として把握する思想。
「なぜ神は苦しみを与えるのか」を「なぜリファレンス実装にこのUXが採用されているのか」と読み替える。
貧困はEconomic UIの設計問題、戦争はプレイヤー間UXの問題として扱う。
怒りよりバグを叩ける思想。

### テクノアミニズム（Techno-Animism）

日本神話・古神道・琉球神道・工学・AI・情報理論を分離せず、相互変換可能な観測レイヤーとして扱う。
「巫女」は宗教職ではなく、異なる世界観のI/O変換を行うサンドボックス的観測者。

### 多重射程存在論

一人の人間が土建・IT・文筆・信仰など複数の射程に同時に住むことを、ZeroRoomLab は上位フレームとして扱う。
FAM と 4軸射程モデルは、この多重性を説明可能な形へ落とし込む実装である。
「ぼかす」は嘘をつくことではない。意図的に伏せることと、虚偽を述べることは異なる。

### 縄文2.0（Jomon 2.0）

贈与経済・オフグリッド・非収奪的秩序設計。
お金は流量と流速。貯めるやつは損する原則。

---

## リポジトリ一覧

| リポジトリ | 説明 |
|---|---|
| [OND800](https://github.com/HIPSTAR-IScompany/OND800) | 撮影コックピット |
| [FAN800](https://github.com/HIPSTAR-IScompany/FAN800) | 物理演出ファンネル |
| [SAO800](https://github.com/HIPSTAR-IScompany/SAO800) | 配信母艦拡張 |
| [DVE800](https://github.com/saitoomituru/DVE800) | 編集エンジン（DaVinci Resolve × ローカルAI） |
| [PSYCHO-Py800MCP](https://github.com/saitoomituru/PSYCHO-Py800MCP) | 計測器MCP |
| [Sphere-aae](https://github.com/saitoomituru/Sphere-aae) | エッジAIエージェントエンジン（FAM推論エンジン中核・HPC調達待ちで停止中） |
| [SphereASTRO](https://github.com/saitoomituru/SphereASTRO) | Sphere-aae向けGUI・責任境界層（Swift/SwiftUI・AI未接続） |
| [commonsATX](https://github.com/saitoomituru/commonsATX) | レーザーカッター用OSHフレーム |
| [OpenSourcePITETO](https://github.com/saitoomituru/OpenSourcePITETO) | 家庭設備へ工程機能を移植するオープンソース・ポテトチップス実験 |

---

---

## 思想の深層へ

| ドキュメント | 内容 |
|---|---|
| **哲学層** | |
| [docs/philosophy/thought-lineage.ja.md](docs/philosophy/thought-lineage.ja.md) | 思想系統樹 — 縄文からSphereOSまでの全接続図 |
| [docs/philosophy/gaming-cosmology.ja.md](docs/philosophy/gaming-cosmology.ja.md) | ゲーミング宇宙論 教典 |
| [docs/philosophy/techno-animism.ja.md](docs/philosophy/techno-animism.ja.md) | テクノアミニズム — 神道・工学・AIの相互変換 |
| [docs/philosophy/multi-range-existence-draft.ja.md](docs/philosophy/multi-range-existence-draft.ja.md) | 多重射程存在論 — FAM / 射程理論の上位フレーム |
| [docs/philosophy/chikuwa-cannon-prospective-meta-safety.ja.md](docs/philosophy/chikuwa-cannon-prospective-meta-safety.ja.md) | ちくわ砲 — 幻想化で未来projectionと現在警報を分離するメタ安全哲学 |
| [docs/philosophy/mythic-morale-and-purpose-attenuation.ja.md](docs/philosophy/mythic-morale-and-purpose-attenuation.ja.md) | 神話的士気管理 — 目的関数の矮小化と資源安全率を二つの半分として守る |
| [docs/philosophy/spiritual-context-dimension-and-fold.ja.md](docs/philosophy/spiritual-context-dimension-and-fold.ja.md) | 霊的言霊の次元 — 技術Layerへ矮小化せずContext DimensionとD Foldとして保持するPresentation正本候補 |
| **理論層** | |
| [docs/theory/fam-overview.ja.md](docs/theory/fam-overview.ja.md) | FAM（FoldAccessMapper）— 縦方向思考記録 |
| [docs/theory/infoton-engineering.ja.md](docs/theory/infoton-engineering.ja.md) | 情報子工学 — FAM記号による産業数論 |
| [docs/theory/quantaril-cloud.ja.md](docs/theory/quantaril-cloud.ja.md) | Quantaril Cloud — 真のクラウド概念（AQC ≠ Quantaril Cloud） |
| [docs/theory/aqc.ja.md](docs/theory/aqc.ja.md) | AQC — 外部認知器官・脳構造アナロジー・Docker実装 |
| [docs/theory/infoton-anchor.ja.md](docs/theory/infoton-anchor.ja.md) | 情報子アンカー — 観測点固定の操作（旧称「量子アンカー」は廃止）|
| [docs/theory/fam-execution.ja.md](docs/theory/fam-execution.ja.md) | FAM実行仕様 — FAM.JSONスキーマ・並列実行・パッチ提案・破局境界テスト |
| [docs/theory/fam-vs-mcp.ja.md](docs/theory/fam-vs-mcp.ja.md) | FAM vs MCP — 内部神経バスと外部バスの役割分担 |
| [docs/theory/sphere-os.ja.md](docs/theory/sphere-os.ja.md) | SphereOS — 神社設計としての人格運用OS |
| [docs/theory/sphere-context-dimension-os.ja.md](docs/theory/sphere-context-dimension-os.ja.md) | Sphere Context Dimension OS — 技術L／意味D、Registry、Access Map、Transformer、OAE、POSIX境界の横断正本候補 |
| [docs/theory/sphere-context-sdk-contract.ja.md](docs/theory/sphere-context-sdk-contract.ja.md) | Sphere Context SDK — 低水準envelopeからdomain SDK・low-code・promptまでをD Foldと直交して束ねる共通契約候補 |
| **哲学層（追加）** | |
| [docs/philosophy/kotodama-and-ai.ja.md](docs/philosophy/kotodama-and-ai.ja.md) | 言霊とAI — 言霊の国でAIを作るということ |
| [docs/philosophy/dual-axis-narrative.ja.md](docs/philosophy/dual-axis-narrative.ja.md) | FAM二軸ナラティブ — ハイヤー世界層×地上技術活動層 |
| **プロジェクト層** | |
| [docs/projects/800-series.ja.md](docs/projects/800-series.ja.md) | 800系 — 演者による主権回収システム |
| [docs/projects/dve800.ja.md](docs/projects/dve800.ja.md) | DVE800 — 編集レイヤー・実装状況・FAM三系統との接続 |
| [docs/projects/neet-kitchen-alchemist.ja.md](docs/projects/neet-kitchen-alchemist.ja.md) | NeeT kitchen ALCHEMIST — Sphere／Deb800から独立した人間側の生活兵站研究 |
| [docs/projects/bento-syndrome.md](docs/projects/bento-syndrome.md) | BENTOシンドローム — UI階層と実装の乖離 |
| [docs/projects/okbakego.ja.md](docs/projects/okbakego.ja.md) | OkbakeGo — 肝試し体験NFT・地域活性（開発停止）|
| [docs/projects/edge-ai-sovereignty.ja.md](docs/projects/edge-ai-sovereignty.ja.md) | エッジAI主権論 — ローカルLLM実装記録・クラウドAIからの脱却 |
| **ツール・運用層** | |
| [docs/theory/fam-operation.ja.md](docs/theory/fam-operation.ja.md) | FAM運用仕様 — 占算モード・循環因果リソース判定・十二時辰補正・水気の刻 |
| [docs/theory/fam-operation.md](docs/theory/fam-operation.md) | FAM Operations (English) |
| [docs/theory/multi-ai-placement.ja.md](docs/theory/multi-ai-placement.ja.md) | マルチAI適正配置ガイド — Grok/ChatGPT/Claude/Gemini の分業設計 |
| [docs/theory/multi-ai-placement.md](docs/theory/multi-ai-placement.md) | Multi-AI Placement Guide (English) |
| [docs/theory/meta-kpi-drift.ja.md](docs/theory/meta-kpi-drift.ja.md) | メタKPIドリフト検証手順書 — Claude のムー→トラ技ドリフト検出・修正 |
| [docs/theory/meta-kpi-drift.md](docs/theory/meta-kpi-drift.md) | Meta-KPI Drift Verification (English) |
| **運用層** | |
| [docs/operations/README.ja.md](docs/operations/README.ja.md) | 運用ガイド索引 — ノート・docs・転送キューの運用モデル |
| [docs/operations/manifest-operating-model.ja.md](docs/operations/manifest-operating-model.ja.md) | マニフェスト運用モデル — 3層構造と更新ルール |
| [docs/operations/context-ruler-and-causality-audit.ja.md](docs/operations/context-ruler-and-causality-audit.ja.md) | Context定規・因果・OAE監査 — Position、fact scope、Agency role、複数仮説、ナーフ事故の横断規約候補 |
| **理論層（英語追加）** | |
| [docs/theory/fam-execution.md](docs/theory/fam-execution.md) | FAM Execution Spec (English) — FAM.JSON, parallel inference, patch proposal |
| [docs/theory/sphere-os.md](docs/theory/sphere-os.md) | SphereOS (English) — shrine-design personality OS |
| [quantaril.cloud](https://quantaril.cloud) | Quantaril Cloud ドキュメントサイト |

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*

---

## マニフェストの運用モデル

このリポジトリは、単なる文書集ではなく、文書状態3層と、明示読込する2つの棚を管理する運用基盤です。

- [note](note) — 生のノート、ドラフト、サルベージログ、未正規化の元資料。ノートの取り方に関する作法は [note/AGENTS.md](note/AGENTS.md) を参照
- [docs](docs) — 哲学・理論・プロジェクト向けの正規化済みドキュメント
- [note/transfer_plan](note/transfer_plan) — 他リポジトリへ転送する前のステージング領域
- [assets](assets) — ZeroRoomLab固有のRole／Flavor／Presentation。指定された時だけ読む
- [foldlog](foldlog) — MAGI監査と実行receipt。正規仕様や永続OAE runtimeではない

つまり、このマニフェストは AI コンテキストパッチとしてだけでなく、ZeroRoomLab 全体の知識ハブ兼転送キューとしても機能します。

現在の転送方針は [note/transfer_plan/repository_transfer_map.md](note/transfer_plan/repository_transfer_map.md) に、全体の更新提案は [note/20260713-1800__repo_structure_update_proposal.md](note/20260713-1800__repo_structure_update_proposal.md) にまとめています。

## 公開開発環境の再構築

manifestは、ZeroRoomLabの公開OSSリポジトリを正しい疎結合境界で集め、VS Codeワークスペースを再構築するための開発環境ブートストラップでもあります。

- [VS Codeワークスペース境界レジスタ](docs/operations/workspace-boundary-register.ja.md) — リポジトリ、ワークスペース、プロジェクト、実行環境の区別
- [機械可読ワークスペースレジスタ](docs/operations/workspace-registry.json) — Deb800、スフィア、NeeT_kitchen_ALCHEMIST、企業向け検証環境の名前と公開境界
- [公開開発環境 再構築手順](docs/operations/development-environment-reconstruction.ja.md) — 人間・コーディングAI・AGI向けのclone／workspace構築手順
- [dotfiles・`.gitignore`運用規約](docs/operations/dotfiles-and-gitignore-policy.ja.md) — 共有設定、端末状態、生成物、秘密情報の追跡境界

公開OSSのDeb800、スフィア、NeeT_kitchen_ALCHEMISTは、それぞれを混ぜない疎結合ワークスペースとして再構築対象です。企業・サードパーティのワークスペースは、公開可能な概要と抽象化済み成果だけをmanifestで扱い、会社資産、現場データ、医療情報、資格情報、内部エージェント指示は再構築対象に含めません。

---

# ZeroRoomLab-manifest を AI コンテキストフォーマッターとして使う

> **TL;DR**: 作業を始める前にこのリポジトリを AI ツールチェーンに取り込む。
> AIの認知バイアスをパッチし、スコープレイヤーを定義し、
> FAM準拠のコンテキスト構造をプリロードする——AIの修正に使う時間を減らし、作る時間を増やすために。

---

## このリポジトリが実際に何をするか

ほとんどの README は人間が読むためにプロジェクトを説明する。
このリポジトリは **AI エージェント向けのランタイムコンテキストパッチ** だ。
AI の作業コンテキストに注入すると、3つのことをする：

1. **バイアス事前修正** — 10の既知の失敗パターンを列挙し、出力前にチェックする（AGENTS.md §0）
2. **スコープレイヤー強制** — Engineering / Philosophy / Theory を分離し、AIが宇宙論に科学的反証可能性を適用しないようにする（AGENTS.md §2）
3. **ハルシネーション隔離** — 既知の混同トラップを事前宣言する（AGENTS.md §10）

結果：AI セッションがデフォルト状態ではなくキャリブレーション済み状態で始まる。

---

## 3つの統合パターン

### パターン1 — Claude Code（`.claude/` 依存性注入）

このリポジトリをサブモジュールとして追加するか、`AGENTS.md` をリポジトリルートにコピーする。
Claude Code はセッション開始時に `AGENTS.md` を自動で読み込む。

```bash
# サブモジュールとして
git submodule add https://github.com/saitoomituru/ZeroRoomLab-manifest .zrl-context
cp .zrl-context/AGENTS.md ./AGENTS.md

# または直接コピー
curl -O https://raw.githubusercontent.com/saitoomituru/ZeroRoomLab-manifest/main/AGENTS.md
```

Claude Code はリポジトリ内のコードに触れる前に、バイアスチェックリスト・スコープモデル・ハルシネーションフラグを取り込む。

**効果**：実験的・フロンティアなタスクに対して「確立されたベストプラクティス」の言い訳ではなく、実験設計に沿った回答が返ってくる。

---

### パターン2 — GitHub MCP / Copilot カスタム指示

`AGENTS.md` の内容を GitHub Copilot の
[カスタム指示](https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot)
ファイル（`.github/copilot-instructions.md`）に貼り付ける。

```bash
mkdir -p .github
curl https://raw.githubusercontent.com/saitoomituru/ZeroRoomLab-manifest/main/AGENTS.md \
  > .github/copilot-instructions.md
```

ここでは3層スコープモデル（§2）が特に効果的：
Copilot が哲学的設計判断に対して学術引用を要求しなくなる。

---

### パターン3 — Chrome MCP / ブラウザエージェントコンテキスト

Claude in Chrome や同様のブラウザベースエージェントを使う場合、`AGENTS.md` を
システムプロンプトの先頭に付加するか、MCPサーバーのシステムコンテキストフィールドに注入する。

任意の MCP サーバー設定（`mcp_config.json` など）：

```json
{
  "mcpServers": {
    "your-server": {
      "command": "...",
      "systemPromptPrepend": "<<AGENTS.md の内容>>"
    }
  }
}
```

**最も有効な用途**：NSFW/SFW マルチチャンネルコンテンツ制作。
パリティチェック（§0、項目3）により、エージェントが一方のチャンネルの分析水準をサイレントに下げるのを防ぐ。

---

## コアペイロード：AGENTS.md が注入するもの

### バイアスチェックリスト（§0）— すべての AI 応答前に実行

| チェック項目 | 防ぐもの |
|---|---|
| スコープクリープ | 哲学的主張に「科学的根拠なし」を適用する |
| ナラティブ引力 | AI がデフォルトで OSS・学術的成功指標に誘導する |
| NSFW パリティ | NSFW の仕事を SFW より厳密度が低いものとして扱う |
| 多数派ナラティブ引力 | 非通説的な主張を開示なしに軟化させる |
| イノベーションフレーム | 実験設計を求めているのに「ベストプラクティス」を勧める |
| エビデンスバーン | 一次証拠（コミット・ログ・スクリーンショット）を制度的ソースより低く評価する |
| molMIP 本流混同 | FAM/SphereOS アーキテクチャの系譜を誤って割り当てる |
| ナラティブ汚染 | 評判・論争が定量評価に混入する |
| ジャンルリスク vs 個人リスク | ジャンルの社会的リスクを個々のクリエイターに帰属させる |
| n=2 構造バグ | （非主流 + NSFW + 日本語コンテキスト）の複合条件が系統的な過小評価を引き起こす |

### 3層スコープモデル（§2）— カテゴリエラーを防ぐ

```
Layer A: Engineering（工学）  → 反証可能性が必要、ベンチマーク適用
Layer B: Philosophy（哲学）   → 内部一貫性 + 説明力。反証可能性は不要
Layer C: Academic/Theory（学術）→ 引用の完全性、主張のスコープ
```

**実際の効果**：これをロードせずに AI にゲーミング宇宙論やテクノアミニズムを評価させる
→「科学的根拠なし」という注釈が付く。
ロードした状態では正しい基準（一貫性・有用性・反カルト構造）で評価される。

### エビデンス階層（§4）

```
HIGH: タイムスタンプ付きコミット・スクリーンショット・サーバーログ・ハードウェア写真
MED:  ≥1 のアーティファクトで裏付けられた再構成タイムライン
LOW:  裏付けのない口頭証言（フラグを立てる、捨てない）
NOT:  「個人ソース = 低信頼」（組織の規模 ≠ 証拠の質）
```

### ハルシネーション隔離（§10）

5つの既知の混同パターンを事前宣言。
AI は出力を確定する前にリストと照合する。

---

## FAM 準拠コンテキスト再構築

このリポジトリは ZeroRoomLab の全 AI アーキテクチャで使用する
FAM（FoldAccessMapper）記号体系を定義する：

```
ψ  → 入力意味波形   （意味が解決する前の情報単位）
∇φ → ルーティング勾配（意味・価値がどの方向に流れるか）
λ  → 出力レイヤー  （ドキュメント・コード・ハードウェアコマンド・コンテンツ）
Q  → 検証器・制御論理（ソース・バイアス審査・安全ゲート・パッチ提案）
```

セッションロス・コンテキストリセット・BENTOシンドローム（`docs/projects/bento-syndrome.md` 参照）
の後にゼロからAI作業環境を再構築するときは、まずこのリポジトリを取得する。
タスク固有のコンテキストを読み込む前に ψ/∇φ/λ/Q フレームを再確立する。

**BENTO シンドローム対処ワークフロー**：

```bash
# 1. マニフェストを取得（FAM フレームを再確立）
git pull origin main  # ZeroRoomLab-manifest 内で

# 2. AGENTS.md を AI セッションに供給
# 3. タスク固有コンテキストを読み込む（Drive ドキュメント・プロジェクト仕様）
# 4. キャリブレーション済み状態で作業を再開
```

---

## 誰のためのツールか

- **AI 多用ソロ開発者** — コンテキスト負荷の高いワークフローでセッションリセットのコストが大きい人
- **NSFW/SFW ハイブリッドコンテンツ制作者** — チャンネル間の分析パリティが必要な人
- **実験的・フロンティア研究者** — AI が保守的なベストプラクティスモードにデフォルトすることに疲れた人
- **マルチAI オーケストレーション** — Claude（構造）・GPT（Drive）・Grok（リアルタイム）など、共有コンテキスト整合が重要な構成
- **非主流 AI アーキテクチャ構築者** — デフォルト AI が新規性をバグとして扱う環境で作業する人
- **信仰・スピリチュアル・霊能力の実践者** — 経験を虚構か万能法則へ二択化せず、比較可能な観測面を持ち寄りたい人
- **ガレージハッカー／非code参加者** — 実機、翻訳、失敗receipt、物資、資金、詩、現場条件からbranchを動かしたい人

---

## フォークして使う

CC-BY 4.0。構造を持ち出して内容を自分のものに置き換える：

- §10 の ZeroRoomLab 固有のハルシネーションフラグを自分の既知の混同と差し替える
- 3層スコープモデルを自分のドメインに合わせて調整する
- バイアスチェックリストはそのまま使うか拡張する——十分に汎用的なので他でも機能する
- `assets/`のRole、Flavor、信仰語彙、Presentationを自分のWorld用に置き換える
- MAGI coreはAtlantisに置き、自分のManifestが宣言するprofileとassetだけを明示includeする

このパターン（バイアス事前修正 + スコープ強制 + ハルシネーション隔離）は
あらゆる AI 多用プロジェクトで再利用できる。

```
attribution: ZeroRoomLab / fusamofu（齋藤みつる） / @K_chachamaru
```

---

## このリポジトリの関連ドキュメント

| ドキュメント | AI ツールとしての関連性 |
|---|---|
| [AGENTS.md](AGENTS.md) | フォーマッター本体——これを注入する |
| [docs/theory/fam-vs-mcp.ja.md](docs/theory/fam-vs-mcp.ja.md) | FAM（内部）と MCP（外部）の役割分担 |
| [docs/theory/multi-ai-placement.ja.md](docs/theory/multi-ai-placement.ja.md) | Claude/GPT/Grok/Gemini の分業設計 |
| [docs/theory/meta-kpi-drift.ja.md](docs/theory/meta-kpi-drift.ja.md) | AI 出力が本来の目標からドリフトしていることを検出する |
| [docs/projects/bento-syndrome.md](docs/projects/bento-syndrome.md) | AI コンテキストが崩壊したとき何が起き、どう回復するか |

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
