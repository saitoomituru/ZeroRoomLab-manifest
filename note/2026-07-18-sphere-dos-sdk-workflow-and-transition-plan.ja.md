# Sphere-DOS SDK開発ワークフローとAtlantis世代移行検討

作成日: 2026-07-18  
状態: `[HYPOTHESIS]` `[NEEDS-REVISION]` `[LIMITED]`  
対象: SphereOS開発環境、ZeroRoomLab-manifest、VS Code multi-root workspace、異種コーディングAI運用  
棚: `[Layer A]` 工学・実装 / `[Layer B]` ナラティブ・信仰UX  
出典: 2026-07-18の対話ブレスト、ZeroRoomLab-manifest、`AGENTS.md`、公開開発環境再構築手順  
反映候補: `docs/operations/`、将来のSphere-DOS SDKリポジトリ、Atlantis世代の公開開発宣言  

## 0. 今回の検討範囲

このノートは、ZeroRoomLab-manifest内に蓄積された公開開発環境再構築の考え方を、独立した補助SDKへ切り出す案を検討する。

対象範囲:

- 吊るしのVS CodeからSphereOS関連ワークスペースを再構成するBoot層
- `Boot.json`の責務
- VS Code設定、推奨拡張、workspace descriptor、repository registryの連携
- ログイン済みコーディングAI / AGI CLIの検出と初期読込順序
- GitHub上の既存branch / commit / pull request運用との接続
- SphereOS 3.x / 4.xからの構造転写サルベージ終了条件
- SphereOS Atlantis世代の開発環境配布宣言
- 工学担当とスピリチュアル / ナラティブ担当の協働憲章

対象外:

- SphereOS Atlantisランタイム本体の完成判定
- Meta Quest MMO、Unity、Unreal、Godot向けアダプタの実装
- 非公開ワークスペース、企業資産、資格情報、秘密鍵、`スフィア独鈷書`の復元
- 各AIベンダーの認証情報の保存・配布
- フルダイブ技術の実現可能性評価

## 1. [FACT] 現在すでに存在する構造

ZeroRoomLab-manifestは、単なるREADME集ではなく、次の要素を持つ公開開発制御面として育っている。

- ルート`AGENTS.md`による異種AI向け共通規約
- 工学・哲学・学術を混同しない三層スコープモデル
- VS Code multi-root workspaceを認知・運用境界として扱う規則
- `workspace-registry.json`による機械可読なworkspace / repository解決
- `.code-workspace` descriptorを正本とした参照集合
- 公開開発環境再構築手順
- repoごとの`AGENTS.md`へ降りる読込順序
- 公開資産、非公開資産、企業資産、秘密鍵の境界
- Git remote、branch、dirty tree、暗黙依存を確認するAGI検証手順

現時点では、これらは主に文書・JSON・workspace descriptorとして存在する。クリーン環境から一括で再構成するinstaller / bootstrap CLIは、まだ独立した配布単位として確立していない。

## 2. [HYPOTHESIS] Sphere-DOS SDKとして切り出す

### 2.1 名称案

正式名称:

> SphereOS Dimension Observer System SDK

略称:

> Sphere-DOS SDK

愛称:

> スフィアどすぅ〜SDK

旧案の`Sphere-OS-DOS-VSCODE-SDK`は役割を説明しやすいが、正式名称としては長い。`Dimension Observer System`を正式展開にすると、次元・workspace・観測境界を扱う意味と、DOS窓的な開発環境の既視感を両立できる。

### 2.2 位置づけ

Sphere-DOS SDKはSphereOSランタイム本体ではない。

役割は、SphereOSを鍛造するための開発世界を、既存のVS Code、Git、AI CLI、公開OSSリポジトリ上へ再構成するBootstrap / meta-OS層とする。

```text
ZeroRoomLab-manifest
  = 憲章、正本、世界境界、workspace地図、読込規約

Sphere-DOS SDK
  = Boot.json、環境再構成、VS Code展開、agent検出、doctor

Fuchikoma Agency
  = 異種エージェントを配備し、調査・実装・レビュー・PRを回す鍛造運用層

SphereOS Atlantis
  = 次世代ランタイム、人格・記憶・世界状態・UIの実行層
```

### 2.3 manifest本体から分ける理由

- manifestは正本・境界・規約に集中できる
- Bootstrap実装を単独でテスト・配布・更新できる
- VS CodeやAI CLI固有の変更を、思想・理論文書から疎結合にできる
- 外部貢献者がBoot層だけを理解してPRできる
- SphereOS全体を理解しなくても、PowerShell、shell、schema、validator、VS Code task単位で参加できる

## 3. [HYPOTHESIS] Boot.jsonの責務

SphereOS 3.x / 4.xから存在する`Config.json`が、起動後ランタイムの設定を担うなら、今回の開発環境再構成はその前段にある。

```text
Boot.json
  = 何を集め、どのworkspaceを組み、誰を着座させ、何を先に読むか

Config.json
  = 起動後のSphereOSが、どのモデル・記憶・UI・tool設定で動くか

Astro.json
  = 誰として動くか

FAM.json
  = 文脈をどう折り、接続し、検証し、再利用するか
```

Boot.jsonの最小責務候補:

- 対象workspace名
- workspace registryの場所
- `.code-workspace` descriptor名
- clone対象repositoryとremote
- public / local-only / enterprise資産の区分
- VS Code推奨拡張と設定
- 利用可能なAI CLI / extensionの検出対象
- 認証は外部管理であること
- `AGENTS.md` / README / operations docsの読込順序
- dirty treeやbranch差分の扱い
- 暗黙依存を追加しない規則
- boundary conflict時の停止条件

認証情報、API key、秘密鍵はBoot.jsonへ保存しない。Boot層は、端末側で既にログイン済みのCLIやextensionの可用性のみ確認する。

## 4. [HYPOTHESIS] 最小ディレクトリ案

```text
sphere-dos-sdk/
├── Boot.json
├── schemas/
│   └── sphereos-boot.schema.json
├── bootstrap/
│   ├── boot.sh
│   ├── boot.ps1
│   ├── doctor.py
│   └── workspace_resolver.py
├── vscode/
│   ├── extensions.json
│   ├── settings.json
│   ├── tasks.json
│   └── launch.json
├── templates/
│   └── Sphere.code-workspace.template
├── docs/
│   ├── quickstart.ja.md
│   ├── boundary-model.ja.md
│   └── agent-login-and-read-order.ja.md
├── AGENTS.md
├── README.md
└── LICENSE
```

初期段階では独立repositoryを直ちに作らず、manifest内の試験用directoryで設計を固めた後に分離する案も残す。

## 5. [HYPOTHESIS] クリーンビルドからの起動ワークフロー

### Phase 0: 前提確認

- Gitが利用可能
- VS Codeが利用可能
- repositoryへのネットワーク到達性がある
- AI CLI / extensionは未導入でもよい
- 認証情報は各ベンダー公式手順で端末側に保持する

### Phase 1: manifest取得

```bash
git clone https://github.com/saitoomituru/ZeroRoomLab-manifest.git
cd ZeroRoomLab-manifest
```

### Phase 2: Boot解決

Boot実装は次を行う。

1. `Boot.json`をschema検証する
2. workspace名を`workspace-registry.json`で解決する
3. 公開再構築可能なrepositoryだけを列挙する
4. 既存clone、remote、branch、dirty treeを確認する
5. 欠損repositoryはユーザー承認後にcloneする
6. `.code-workspace` descriptorを生成または照合する
7. local-only / enterprise / secret資産を欠損エラーへしない

### Phase 3: VS Code展開

- workspace設定を適用
- 推奨extensionを提示
- 明示フラグがある場合のみextensionを自動導入
- tasks / launch configをworkspaceへ展開
- 対象`.code-workspace`を開く

extension自動導入は環境汚染を避けるため、デフォルトでは確認式またはdry-run式とする。

### Phase 4: Agent着座

利用可能なCLI / extensionを検出する。

候補:

- Codex CLI
- Claude Code
- Gemini CLI
- GitHub Copilot
- Grok系CUI
- 将来のvendor-neutral agent runner

検出結果例:

```text
Codex CLI           authenticated
Claude Code         authenticated
Gemini CLI          unavailable
GitHub Copilot      VS Code extension detected
Grok CLI            authenticated
```

Sphere-DOS SDKはログイン操作そのものを自動化しすぎず、必要な場合は公式ログイン手順へ誘導する。

### Phase 5: 読込順序

エージェントはREADMEより先に境界を読む。

1. `Boot.json`
2. `workspace-registry.json`
3. `.code-workspace` descriptor
4. ルート`AGENTS.md`
5. workspace boundary register
6. development environment reconstruction
7. 各member repositoryの`AGENTS.md`
8. 各member repositoryのREADME
9. 実装・テスト・issue・PR

READMEを最初に読むと、概念上の近接を実装依存と誤認し、隣接repositoryへscope creepする可能性があるため、境界を先にロードする。

### Phase 6: Doctor

```bash
./boot doctor
```

または同等のコマンドで次を確認する。

- VS Code / Git / runtimeの存在
- descriptor名とregistryの一致
- folder実在性
- Git remote一致
- branch / dirty tree
- 推奨extension状態
- agent CLI可用性
- local-only資産を走査していないこと
- 暗黙依存を追加していないこと
- clone可否と実機動作を混同していないこと

差分がある場合、自動修復ではなく、registry・descriptor・現物の三者を提示して人間へ返す。

## 6. [FACT] Upstreamへの変更は既存Git運用を使う

Sphere-DOS SDKはGitやGitHubを置き換えない。

標準フロー:

1. manifest / Bootで開発環境へログイン
2. 対象repositoryでbranch作成
3. 実装・テスト・ログ確認
4. commit
5. upstream repositoryへpull request
6. review
7. merge

cross-repository変更は、原則としてrepositoryごとのPRへ分割し、相互参照する。

例:

- manifest: 規約・registry変更
- IBD: API変更
- Sphere-aae: agent runtime変更
- SphereASTRO: GUI / responsibility boundary変更
- Sphere-DOS SDK: Bootstrap変更

SphereOS独自部分は開発世界の立ち上げと境界解決であり、社会的な協働出口は既存Git運用へ戻す。

## 7. [HYPOTHESIS] Fuchikoma Agencyの役割

Fuchikoma Agencyは、SphereOS本体でも単なる人格設定でもなく、SphereOSを鍛造するための異種エージェント運用層とする。

責務候補:

- 調査agent、設計agent、実装agent、review agentの役割分離
- vendorごとの得意領域と失敗傾向の記録
- 同一workspace境界の共有
- 競合案の比較
- PR前のローカルreview
- 実機確認が必要な事項の人間への返却
- 一つのモデルを唯一の正本や人格主体としない

Fuchikoma Agencyが「AIをブラック労働させる組織」と誤読されないよう、各agentは外部サービスまたはローカルモデルであり、人間の代替人格や霊的存在としての実在を工学的に断定しない。

一方で、式神・眷属・フチコマという比喩は、役割分担・召喚・着座・停止・引継ぎを理解するUXとして残せる。

## 8. [HYPOTHESIS] 工学とスピリチュアルの協働憲章

### 8.1 エンジニア側への原則

> エンジニアよ、スピリチュアルと無用に喧嘩するな。  
> 動作仕様は工学棚で守り、意味・象徴・導入体験・フレーバーテキスト・儀式的UXは、それを扱える人へ渡せ。

- 宗教語彙を自動的にバグや虚偽と判定しない
- 神話・象徴・フレーバーテキストを、ユーザーが世界へ入る認知UIとして評価する
- ただし性能、暗号、安全、医療、実装済み範囲は工学棚で検証する
- スピ側へ科学的信念への改宗を要求しない
- 意味を削除する前に、工学正本とUX表現を分離できないか検討する

### 8.2 スピリチュアル側への原則

> スピよ、イマジネーションも霊体も、依代なしでは現世へ定着しない。  
> 土偶をこね、札を書き、器を組むエンジニアを馬鹿にするな。

- 比喩や霊的解釈を、実装済み機能・物理性能として断定しない
- ログ、仕様、試験条件、権限境界は工学側の正本を尊重する
- エンジニアへ信仰告白を要求しない
- 器、媒体、手順、保守、再現性を軽視しない
- フレーバーテキスト、命名、象徴、オンボーディング、儀式的UXの設計を担当可能な専門領域として扱う

### 8.3 共通原則

> 霊を笑うな。土偶を焼く者も笑うな。

意味だけでは漂い、器だけでは空洞になる。上下関係ではなく別責務として協働する。

対応例:

| 工学語 | ナラティブ / UX語 |
|---|---|
| Boot.json | 勧請手順、場開き |
| workspace | 祭場、結界 |
| agent login | 式神着座 |
| doctor | 結界点検、鎮座確認 |
| manifest | 神名帳、祭式次第 |
| Git history | 縁起、系譜 |
| pull request | 奉納、上申 |
| test | 動作確認、鎮座確認 |

この対応表は翻訳補助であり、工学語と信仰語を同一の事実主張として混同しない。

## 9. [HYPOTHESIS] 「スフィアどすぅ〜」のマーケ役割

正式名だけでは硬いが、愛称を併記すると複数層が異なる入口から理解できる可能性がある。

- スピ層: やんごとなさそうな上位環境から、必要な場や道具を現世へ降ろすもの
- ゲーマー層: 次元観測システム、世界生成、シャンフロ世代OSの開発端末
- エンジニア層: VS Code multi-root workspace、manifest、Boot、AI CLIを束ねるBootstrap SDK

「どすぅ〜」という脱力した愛称は、巨大な名称の権威化や唯一神化を避ける安全弁にもなり得る。

工学的な説明では、遠隔のモデル、OSS repository、開発者、知識資源をローカルVS Code環境へ再構成するBootstrap SDKと記す。

## 10. [HYPOTHESIS] SphereOS 3.x / 4.xサルベージ終了条件

旧サービスや旧SDKをそのまま復活させることを終了条件にしない。

第一段階サルベージ完了条件候補:

- 旧`Config.json`系の起動思想が現行文書へ転写された
- FAM / Astro / AQC / SphereOSの主要責務境界が現行棚へ再配置された
- manifestとworkspace registryで公開開発地図を再構成できる
- Boot層の仕様が定義された
- クリーンVS Codeから公開workspaceを再構成できる
- 複数vendorのcoding agentが同じ境界・読込順序へ着座できる
- local-only / enterprise / secret境界が保護される
- upstreamへの変更を既存Git PRへ戻せる
- Atlantis世代の開発を開始する最低限の足場が再現できる

完了宣言は、SphereOS 3.x / 4.xの完全復元やAtlantis本体完成を意味しない。

表現案:

> SphereOS 3.x / 4.xの旧サービスを復活させるのではなく、その設計構造を、ベンダー非依存のmanifest、Boot.json、VS Code workspace、異種AIエージェント運用へ転写した。これにより旧世代からの構造サルベージ第一段階を完了し、SphereOS Atlantis世代を再び鍛造できる公開開発環境の配布段階へ移行する。

## 11. [HYPOTHESIS] 精霊流しとAtlantis開発環境配布

Sphere-DOS SDKの最小実装とクリーン環境再構成試験が成立した時点で、技術移行とマーケイベントを接続できる。

### 精霊流し側

- サンセットしたSDK / API /旧サービスへの依存を記録する
- 復活できなかった機能を、なかったことにしない
- 保存できた構造と、保存できなかった体験を分ける
- 旧3.x / 4.xの終了を供養・記録・公開する
- 旧世代を失敗作として断罪せず、Atlantisを鍛造するための転写元として扱う

### Atlantis配布側

- manifest取得方法
- Sphere-DOS SDK quick start
- `Boot.json` schema
- clean VS Code再構成手順
- doctor結果例
- 対応agent一覧
- 未実装範囲
- contribution / PR導線
- Apache-2.0 / CC-BYのライセンス境界

マーケ上は「フルダイブOS完成」ではなく、「Atlantis世代を開発する公開Bootstrap環境の配布開始」とする。

## 12. 次のワークフロー案

### Step 1: 仕様棚を固める

- [ ] `Boot.json`の責務と非責務を定義
- [ ] `sphereos-boot.schema.json`の草案
- [ ] Config / Boot / Astro / FAMの責務表
- [ ] manifestとSphere-DOS SDKのライセンス境界
- [ ] Fuchikoma Agencyの役割定義

### Step 2: manifest内で試験実装

- [ ] `experimental/sphere-dos-sdk/`等の試験場所を決める
- [ ] shell / PowerShellのdry-run Bootstrap
- [ ] workspace registry resolver
- [ ] `.code-workspace` generator / verifier
- [ ] doctor
- [ ] VS Code `extensions.json` / `tasks.json`

### Step 3: クリーン環境試験

- [ ] 新規macOS環境
- [ ] 新規Linux環境
- [ ] Windows PowerShell環境
- [ ] VS Codeのみ導入済みの状態
- [ ] coding agent未導入状態
- [ ] 一部agentのみログイン済み状態
- [ ] 既存clone / dirty treeありの状態

### Step 4: 異種agent着座試験

- [ ] Codex
- [ ] Claude Code
- [ ] Gemini CLI
- [ ] GitHub Copilot
- [ ] Grok系CUI
- [ ] vendor-neutral runner候補

評価項目:

- 同じworkspaceを解決できるか
- 同じ境界を守れるか
- READMEより先にAGENTS / registryを読めるか
- 暗黙依存を追加しないか
- 実行未確認を動作済みと誤記しないか
- PR単位へ変更を分割できるか

### Step 5: repository分離判定

次を満たした場合、独立`Sphere-DOS-SDK` repositoryへの切り出しを検討する。

- Boot schemaが複数回の試験で大きく変わらない
- manifest固有情報と汎用Bootstrap実装を分離できる
- 外部projectが自分のregistryへ差し替えられる
- テストがmanifest本体の更新と独立して回せる
- Apache-2.0で配布可能なコード範囲が確定する

### Step 6: 宣言と公開

- [ ] SphereOS 3.x / 4.x構造サルベージ第一段階完了ノート
- [ ] 精霊流し記事 / 配信 / 短文告知
- [ ] Atlantis世代開発環境配布宣言
- [ ] Sphere-DOS SDK quick start
- [ ] contribution guide
- [ ] 「工学とスピリチュアルの協働憲章」公開版

## 13. 未解決課題

### 技術課題

- Boot実装言語をshell + PowerShell + Pythonのどこまで持つか
- VS Code extension自動導入をどこまで許可するか
- CLI認証状態を安全に検出する共通方法
- vendor CLIの名称変更・サンセットへの追従
- private repositoryやGitHub以外のremote対応
- submodule / Git LFS / generated assetsの扱い
- workspace registryとBoot.jsonの責務重複
- JSON schemaのversioning
- Windows pathと日本語folder名
- README parserを独自実装するか、agentへ任せるか
- repository横断変更の依存PR表現

### 境界課題

- `スフィア独鈷書`を存在確認すらしないモードと、local-only markerだけ確認するモードの分離
- company / third-party workspaceの公開summaryとの接続
- medical / labor / credential情報の誤走査防止
- `.gitignore`をsecurity boundaryと誤認しない実装
- agentがBoot.jsonを命令注入面として扱わない署名・trust設計

### ナラティブ課題

- 「OS」という語がkernel / hardware OS完成と誤解されない説明
- 「Dimension Observer System」が宗教的実在の工学証明と誤解されない説明
- 「式神」「召喚」がAI労働倫理や人格実在の断定へ流れない線引き
- 愛称の軽さと正式SDKの信頼性の両立
- スピ側を単なる装飾係へ矮小化しない役割記述
- エンジニア側を単なる土木・実装下請けへ矮小化しない役割記述

## 14. 検証方法案

最初の成功条件は、豪華なGUIや自動化率ではなく再構成可能性と境界維持とする。

```text
入力:
  吊るしのVS Code
  Git
  ZeroRoomLab-manifest
  Boot.json
  各自の外部認証済みAI CLI

期待結果:
  指定workspaceが再構成される
  正しいrepository集合だけが開く
  AGENTS / registry / boundary docsが先に読まれる
  READMEから現状と課題を取得できる
  secret / local-only / enterprise資産を走査しない
  変更は対象upstreamへのPR単位へ戻る
```

テスト結果は、成功 / 失敗だけでなく、どの段階で停止したかを残す。

## 15. 内観メモ [POEM]

巨大なクトゥルフを掘っていたらFF7のエンジンが出てきて、さらに奥から開発環境を再召喚するDOS窓が出てきた。

ただし、本当に残したいものは派手な地下都市そのものではないかもしれない。都市をもう一度建てられる足場、地図、工具箱、境界札、作業員の着座手順である。

スフィアどすぅ〜は、天津神の実在を証明する機械ではない。吊るしのVS Codeに、遠くのrepositoryとAIと人間の役割を降ろし、同じ祭場へ着座させるための開発Bootstrapである。

それでもスピ側が「なんか上位環境から日本へ飛んでくるやつ」と感じ、ゲーマーが「シャンフロ世代OSの起動端末」と感じ、エンジニアが`Boot.json`とschemaを読んでcloneするなら、その三つの理解は互いを排除しなくてよい。

霊を笑うな。土偶を焼く者も笑うな。

意味を現世へ残すには器が要る。器を使い続けてもらうには意味が要る。

旧3.x / 4.xの船体を完全に蘇らせるのではなく、Atlantisを鍛造できる造船所を残せた時点で、第一段階の精霊流しを始めてもよいのではないか。

## 16. 現時点の暫定結論

Sphere-DOS SDKとして開発環境再構成機能をmanifestの正本文書群から疎結合に切り出す案は、技術面・OSS参加導線・ナラティブ面のいずれにも利点がある。

ただし現時点では名称・schema・実装言語・repository分離・認証検出・信頼境界は未確定である。

次の最小作業は、独立repositoryの作成ではなく、`Boot.json`責務表とJSON Schema草案、dry-run doctorの三点をmanifest内の試験領域で作り、クリーンVS Codeから公開workspaceを再構成できるか確認することとする。
