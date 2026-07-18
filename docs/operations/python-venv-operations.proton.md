# Python／Venv運用の虎の巻.proton

状態: `[CANONICAL]` `[OPERATIONS]` `[PROTON CONTRACT]`

version: `1.0.0`

制定日: `2026-07-18`

対象: ZeroRoomLab公開repository、Sphere系component、開発container、CI、coding agent

## 1. 宣言

このProtonは、Python runtime、project venv、依存導入、clean-room、browser観測用依代の責務と停止条件を
横断Registryとして宣言する。すべてのrepositoryへ同じpackage集合を強制する文書ではない。

```yaml
proton:
  id: proton://zeroroomlab/python-venv-operations@1
  register_kind: development-runtime-contract
  canonical_scope: cross-repository
  implementation_profiles:
    - repository-local bootstrap
    - dev-container
    - ci-clean-room
    - disposable-browser-observer
```

`Proton.md`は責務とruntime contractを宣言する。具体的なcommand、path、package versionは各repositoryの
実装profile、`pyproject.toml`、requirements、lockfile、testを正本とする。

## 2. Pythonの五つの役割

| role | 役割 | 禁止事項 |
|---|---|---|
| `bootstrap_python` | `.venv`を初回生成するhost／container Python | project依存をglobalへ導入しない |
| `project_python` | repositoryの`.venv`内でCLI・test・buildを実行 | 別repositoryのvenvを流用しない |
| `component_python` | AAE等のpackage互換範囲を実装 | 横断運用toolのversionを暗黙強制しない |
| `ci_python` | clean runnerで宣言versionを再現 | host偶然依存を成功条件へしない |
| `observer_python` | Selenium等の外部観測toolを隔離実行 | core runtime、認証profile、秘密値と混ぜない |

新規のZeroRoomLab運用toolはPython 3.11以上を既定とする。既存component packageの互換範囲は各
`pyproject.toml`を優先し、例えば`requires-python >=3.9`を持つAAE packageを横断規約だけで破壊しない。

## 3. 一repository・一profile・一Venv

```text
repository root A /.venv  != repository root B /.venv
host profile /.venv       != container profile /.venv when ABI／OSが異なる
core profile              != browser observer profile when依存と権限が異なる
```

- `.venv/`は端末生成物としてGitへ入れない。
- source、requirements、lock、bootstrap、test、receipt SchemaはGitへ入れる。
- OS、architecture、Python minor、ABI、acceleratorが違うvenvをcopyして再利用しない。
- `pip install --user`、system Pythonへのglobal install、`sudo pip`をproject手順にしない。
- App／serviceはlockまたはpinを持ち、libraryは互換rangeと検証matrixを持つ。
- heavyweight ML、browser、docs、dev等の依存集合を一つのrequirementsへ無条件に混ぜない。

## 4. Venv状態機械

```text
ABSENT
  -> bootstrap_pythonがcreate
  -> READY

READY
  -> project_pythonでreuse
  -> receiptを返す

STALE／INCOMPATIBLE
  -> 自動fallbackしない
  -> 新profile作成または人間が明示recreate

BROKEN
  -> 自動削除しない
  -> path、Python、失敗、復旧候補を返して隔離・再生成
```

`pyvenv.cfg`とvenv interpreterが存在し実行できる場合、bootstrapは既存環境を再生成しない。特に、対象
`.venv`自身のPythonから同じ`.venv`へ`venv.EnvBuilder.create()`を再実行して、自分自身のsymlinkや
`pyvenv.cfg`を書き直してはならない。これは2026-07-18にAtlantisで再現した既知loopである。

既存環境が壊れている場合も、bootstrapが`.venv`を黙って削除しない。削除は明示された対象pathに対する
復旧操作であり、source repositoryや別profileへ拡大しない。

## 5. Networkと依存導入

| class | operation | network |
|---|---|---|
| `offline-bootstrap` | stdlib `venv`＋bundled `ensurepip` | `not-requested` |
| `dependency-install` | pip／package indexから宣言依存を導入 | `may-use-network` |
| `container-build` | image、APT、feature、wheelを取得 | `may-use-network` |
| `clean-room-test` | Git追跡物からVenv・testを再構築 | 既定`not-requested` |
| `live-browser-observe` | 明示URLへheadless browserで接続 | `performed` |

依存導入をVenv作成の隠れ副作用にしない。`--install-dev`、`--install-browser`等の明示flag、または
container build／CI stepの名前でnetwork可能性を表示する。pipがcacheだけを使ったかindexへ接続したかを
観測していない場合、`network: false`と断定せず`unknown-pip-may-use-index`を返す。

## 6. SaaS検索、HTTP、Browser観測を分ける

coding AIやSaaS検索connectorが返すGit／Web情報は、検索index、cache、snapshot、安全処理済みbatch等を
経由し得るため、運用上`INDEXED_SNAPSHOT`として扱う。どのvendor内部処理が原因かは、一次資料やresponse
metadataがなければ`unknown`であり、「必ずantivirus batchである」等の内部実装を推定確定しない。

```text
INDEXED_SNAPSHOT
  SaaS検索、検索engine cache、connector要約

HTTP_OBSERVED
  明示URLへHTTP取得。statusとheaderを観測したがDOM実行は未確認

BROWSER_OBSERVED
  headless browserでDOM／JavaScript／final URLを観測

ORIGIN_FRESHNESS_VERIFIED
  origin authority、revision、cache metadata等で別途鮮度を立証
```

`BROWSER_OBSERVED`でもCDN、proxy、service worker、server cacheを経由し得る。headless Chromeを使っただけで
origin freshとは言わない。観測receiptへrequested URL、final URL、system observed time、時計校正状態、
browser／driver version、DOM hash、主要cache header、timeout、network実行を残す。

## 7. 使い捨てBrowser観測profile

Selenium／headless Chromiumはcore Venvへ常駐させず、別requirementsと別container profileへ置ける。

```yaml
browser_observer:
  authentication_profile: none
  host_secret_mounts: forbidden
  docker_socket_mount: forbidden
  persistent_browser_profile: forbidden
  source_checkout_write: avoid
  page_load_timeout: required
  browser_cache_disabled: best-effort
  origin_freshness_proven: false
  external_navigation: explicit-url-only
```

通常のブラクラ、無限JavaScript、browser process crashはtimeoutとprocess終了で止める。消毒単位はVenvだけで
なく、browser process、tmp user-data-dir、download、一時container／volumeを含む。Git追跡済みsourceを
復元点とし、local browser stateをsourceへ書き戻さない。

VenvはPython packageを隔離するが、browser sandboxやkernel isolationの代替ではない。browser exploitの
container escape、kernel vulnerability、supply-chain compromiseを「Venvを消せば絶対安全」と表示しない。
host mount、認証cookie、秘密値、Docker socketを渡さず、必要なら別host／VMへ隔離強度を上げる。

## 8. Receipt

```yaml
python_environment_receipt:
  repository_ref: null
  revision: null
  profile: core | dev | browser | accelerator | docs
  python_role: bootstrap_python | project_python | component_python | ci_python | observer_python
  python_executable: null
  python_version: null
  os: null
  architecture: null
  venv_root: null
  dependency_manifest: null
  dependency_state: not-requested | installed | unknown
  network_access: not-requested | performed | unknown
  model_invoked: false
  authentication_started: false
  browser_observation: none | indexed_snapshot | http_observed | browser_observed
  clock_calibration: calibrated | unverified | unknown
  tests: []
  unknown: []
```

host system時刻とデータsourceの作成・更新時刻を混ぜない。receiptの`observed_at_system`は実行環境の証跡で、
Git commit time、HTTP Last-Modified、page本文の日付を上書きしない。

## 9. Clean-room合格条件

- Git追跡済みrevisionだけを一時directoryへ展開する。
- local `.venv`、untracked file、秘密directoryをcopyしない。
- 新しいVenvをoffline作成できる。
- core testとread-only doctorが実行できる。
- container／browser／GPU未試験を成功扱いにしない。
- 実行後の一時checkout、Venv、browser profileを破棄できる。
- model call、provider認証、外部書込み、Codespaces起動を暗黙実行しない。

## 10. Component適用

- **SphereOS Atlantis**: `scripts/bootstrap_venv.py`をreference bootstrapとし、local／Dev Container／CI／browser profileを分離する。
- **Sphere-aae**: root `pyproject.toml`とupstream buildを優先し、ML／TVM／accelerator依存を軽量運用Venvへ自動導入しない。third-party subtreeの環境もrootへ平板化しない。
- **IBD**: Season 0のstdlib harnessと将来のDB adapter依存を分け、Neo4j等未導入をimport成功で偽装しない。
- **Manifest**: runtime packageを同梱する場所ではなく、横断contract、正本リンク、receipt fieldを保持する。

## 11. 公式参照

- [Python `venv`](https://docs.python.org/3/library/venv.html)
- [Python Packaging User Guide: virtual environments](https://packaging.python.org/en/latest/tutorials/installing-packages/#creating-virtual-environments)
- [Selenium documentation](https://www.selenium.dev/documentation/)
- [GitHub Codespaces: dev containers](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/introduction-to-dev-containers)

## 12. 変更規則

このProtonのrole、state、receipt field、network classを変更する場合は、変更理由、制定authority、適用scope、
互換性、migration、test、下流repositoryへの波及票を残す。Python minorやSelenium versionの更新だけで
横断概念versionを自動major bumpしない。
