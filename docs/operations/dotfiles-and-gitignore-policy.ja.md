# dotfiles・`.gitignore`運用規約

状態: `[CANONICAL]`

制定日: 2026-07-17

対象: ZeroRoomLabの公開OSSリポジトリ、VS Codeワークスペース、人間、コーディングAI、AGIオーケストレーター

## 1. 目的

dotfileは「隠しファイルだから無視するもの」ではない。ビルド、整形、CI、エージェント動作、ワークスペース再構築に必要な正本もあれば、端末固有状態、キャッシュ、秘密鍵、資格情報のようにGitへ入れてはならないものもある。

本規約は、再現性に必要なdotfileを追跡し、端末状態・生成物・秘密情報を除外するための共通判断基準を定める。各リポジトリの言語、SDK、実機条件に応じた追加規則は、各リポジトリの`.gitignore`で上書き・拡張する。

## 2. 最重要原則

1. **dotfileを一括無視しない。** `.gitignore`、`.gitattributes`、`.editorconfig`、`.github/`等は再現性の一部である。
2. **`.gitignore`を秘密保護機構として扱わない。** 追跡済みファイル、履歴、ログ、バックアップ、外部同期には効かない。
3. **秘密はリポジトリ外で生成・保存する。** ignoreは誤追加を減らす最後の補助線にすぎない。
4. **公開テンプレートと実値を分離する。** `.env.example`やschemaは追跡し、`.env`や鍵束は追跡しない。
5. **再現に必要な固定情報は追跡する。** lockfile、submodule定義、整形規則、共有タスク等を「自動生成だから」という理由だけで捨てない。
6. **実機ログと公開技術記録を分離する。** 生ログや個人・企業データは外部保管し、公開可能な条件・結果・境界だけを`docs/`や`notes/`へ正規化する。

## 3. 原則として追跡するdotfile

| 種類 | 例 | 条件 |
|---|---|---|
| Git規約 | `.gitignore`, `.gitattributes`, `.gitmodules` | リポジトリ再現に必要 |
| 編集規約 | `.editorconfig`, `.clang-format`, `.pylintrc` | チーム・AI間で共有する正本 |
| CI・自動化 | `.github/`, `.pre-commit-config.yaml` | 公開処理のみ。秘密値は参照名だけ置く |
| 環境テンプレート | `.env.example`, `.env.template`, `.env.sample` | 値は空または非秘密の例示値 |
| コンテナ境界 | `.dockerignore` | build contextから秘密・不要物を除外 |
| VS Code共有設定 | `.vscode/settings.json`, `extensions.json`, `tasks.json`, `launch.json` | 端末絶対パス、資格情報、個人アカウントを含めない |
| 配備用メタデータ | `.nojekyll`, `.gitkeep` | 役割が明確な場合だけ |

`.gitkeep`はGitの標準機能ではなく、空ディレクトリを保持する慣例である。実ファイルが入ったら不要性を再評価する。

## 4. 原則として追跡しないもの

### 4.1 OS・エディタの端末状態

- `.DS_Store`, `.AppleDouble`, `Thumbs.db`
- swap、backup、autosave
- `.idea/`、VS Codeのユーザー固有状態
- Xcodeの`xcuserdata/`、ユーザー固有state

### 4.2 依存・ビルド・キャッシュ

- `node_modules/`, `.venv/`, `venv/`
- `build/`, `dist/`, `DerivedData/`, CMake/Ninja生成物
- `__pycache__/`, `.pytest_cache/`, `.mypy_cache/`, `.ruff_cache/`
- coverage、Docusaurus、Sphinx等の生成物

生成物を配布する場合は、Git追跡ではなくRelease、パッケージレジストリ、コンテナレジストリ等を使う。例外的に生成物を追跡する場合は、理由と更新手順をREADMEへ記録する。

### 4.3 秘密・資格情報・個人／企業データ

- `.env`, `.env.*`の実値ファイル
- API token、SSH鍵、証明書秘密鍵、署名鍵、キーチェーン
- `credentials/`, `.secrets/`等の秘密格納場所
- 企業内部指示、現場労務、労基、医療情報
- 生の証拠ログ、HDF5、SQLite、顔データ、未匿名化画像

ファイル名や拡張子だけで秘密を完全判定できないため、コミット前に内容とデータ所有者を確認する。

## 5. `.env`規則

- `.env`と`.env.*`はignoreする。
- `.env.example`、`.env.template`、`.env.sample`は追跡してよい。
- テンプレートには変数名、用途、型、既定値、取得方法を記述する。
- 実token、実IP、実アカウント、個人パス、企業パスをテンプレートへ転記しない。
- 必須値が未設定なら、アプリは明示的エラーを返す。秘密の仮既定値を埋め込まない。

## 6. VS Code関連ファイル

### `.code-workspace`

- 実在descriptorの`folders`が作業スコープの一次資料である。
- 公開用descriptorまたは生成テンプレートは相対パスを使い、資格情報や企業内部パスを含めない。
- 端末固有版はリポジトリ外に置ける。
- ローカル派生版は`*.local.code-workspace`としてignoreする。
- `${env:NAME}`等の環境変数参照は使用できるが、実値はdescriptorへ書かない。
- ワークスペースの意味と参照集合は[workspace-registry.json](workspace-registry.json)を正本索引とする。

### `.vscode/`

共有価値のある`settings.json`、`extensions.json`、`tasks.json`、`launch.json`だけを明示的に追跡する。最近開いたファイル、ユーザーUI状態、端末絶対パス、個人アカウント設定は追跡しない。

## 7. AIエージェント関連dotfile

`.claude/`、`.agent/`、`.codex-*`等は名前だけで一括判定しない。

- 公開AGENTS、共有コマンド、再現可能な設定は追跡候補
- worktree、stage、cache、session、個人メモ、認証状態は追跡しない
- エージェント設定に外部送信先や権限が含まれる場合はREADMEとAGENTS.mdで境界を明示する
- 別AI用設定を相互変換するとき、権限や禁止事項を弱めない

## 8. 暗号鍵とスフィア独鈷書

`スフィア独鈷書`は、スフィアOSがワールドデータ境界を認識するためのエドワーズ系暗号チェーンの秘密鍵束である。これはignore対象というより、公開リポジトリの外に置く秘密鍵資産である。

- 内容を走査、要約、ログ出力、Git登録、LFS登録、アップロード、配布しない
- `.gitignore`へ名前を書いたことを安全保証にしない
- ファイルシステム権限、鍵管理、ワークスペース境界で保護する
- 将来のSDKは、第三者が自分のワールド境界鍵を新規生成する
- 現存鍵束をサンプル、fixture、テンプレート、seedに使わない

## 9. ログ・証拠・大型ファイル

- Git LFSは大型ファイルの輸送手段であり、秘密保管庫ではない。
- 公開可能な画像、モデル、検証アセットをLFSへ置く場合はライセンスと再現手順を記録する。
- 実機ログは`hardware/runtime → commit/version → command/workload → observed result → test boundary`へ正規化して公開する。
- 生ログに資格情報、顔、医療、労務、企業情報が含まれる場合は公開しない。
- `*.log`の一括ignoreで公開すべき一次証拠まで消さず、公開用ログの置き場所と匿名化工程を個別設計する。

## 10. lockfile・生成設定

- アプリ、サービス、再現実験ではlockfileを原則追跡する。
- 複数環境へ配布するライブラリでは、パッケージ管理系ごとに判断し理由を記録する。
- lockfileをignoreする場合は、依存解決の再現方法と検証範囲をREADMEへ残す。
- `.python-version`、toolchain version、SDK versionは、再現性を高める場合は追跡してよい。

## 11. 追跡済みファイルをignoreへ移す場合

`.gitignore`を追加しても、すでに追跡済みのファイルは追跡解除されない。

1. `git ls-files`で追跡状態を確認する。
2. 内容が秘密なら作業を止め、鍵・tokenを失効／再発行する。
3. 通常の端末生成物なら、ローカル実体を残してindexだけ外す。
4. 履歴からの削除が必要な場合は、影響範囲と共同作業者を確認して人間承認を取る。
5. `git check-ignore -v`で適用規則を確認する。

履歴書き換えは通常のignore整備とは別作業であり、自動実行しない。

## 12. リポジトリ作成・監査チェック

```text
[ ] .gitignoreは言語・SDK・実機生成物に合っている
[ ] .gitattributesでテキスト改行とバイナリを区別した
[ ] .editorconfigで最低限の文字コード・改行・インデントを共有した
[ ] .env実値、鍵、資格情報、企業・個人データが追跡されていない
[ ] .env.example等に実値が混入していない
[ ] .code-workspaceと.vscodeに絶対パス・秘密がない
[ ] lockfileの追跡／非追跡に理由がある
[ ] Git LFSを秘密保管に使っていない
[ ] git status --ignoredとgit check-ignore -vで規則を確認した
[ ] 追跡済みOSメタデータやキャッシュが残っていない
```

## 13. 適用方針

本規約追加時点で各リポジトリのignore構成は統一されていない。既存リポジトリを一括機械置換せず、各ワークスペースと実行環境を確認したうえで個別に移行する。既存の未コミット差分やローカル設定を、共通テンプレート適用のために削除してはならない。

## 14. 関連文書

- [workspace-boundary-register.ja.md](workspace-boundary-register.ja.md)
- [development-environment-reconstruction.ja.md](development-environment-reconstruction.ja.md)
- [technical-communication-register.ja.md](technical-communication-register.ja.md)
- [documentation-maintenance-policy.ja.md](documentation-maintenance-policy.ja.md)
