# ASTRO／AAE開発順序 User Gate監査

状態: `[AUDIT]` `[USER-GATE-RESOLVED]` `[IMPLEMENTATION-IN-PROGRESS]`
観測時刻: `2026-07-29T13:39:13+09:00`
Manifest source revision: `8617aa666d0b0531fb8a14ac06ff32dc9baaa106`
SphereASTRO source revision: `31ba77cbb6b427d3656716dfe0ad138a7a38ce26`
Sphere-aae source revision: `08ceee18e68749268dcad2c32c428e3d6e7a5092`
SphereOS Atlantis source revision: `ca5abe9223561cfa1a47625c3771e760e6aa9b21`
MAGI bundle: `SphereOS-Atlantis/magi/0.2.1/bundle.json`、canonical coordinate `0.200.1`

## 1. User Gate

[FACT] Userは、SphereASTRO、ZeroRoomLab-manifest、Sphere-aae、Q Atlantisの順に、
仕様整理、開発マイルストーン掲示、開発状況告知を進める権限を付与した。

[FACT] Q Atlantisは既存`dev`で作業し、`main`との合流とdeployは、localhost:3000を
Userが目視確認した後の別指示まで停止する。

[FACT] 競合しない既決仕様は自動実装し、曖昧でも他を進められる事項は`UNKNOWN`のまま保持する。
曖昧かつ全体を停止するcritical issueだけをIssue化してUserへ返す。

[INTERPRETATION] 今回の現在時点の主経路は、GUIだけを先に作ることでも、巨大MoEの調達だけを
待つことでもない。ASTRO Runnerで最小の実行断面を作り、実機receiptと人格崩れの観測から
Model Familyを固定し、その後にAAE Bakeと永続Storageへ進む経路である。

## 2. source解決receipt

最初にManifestの既存例へ合わせて`--profile zeroroomlab`を渡したが、現在のresolverには
そのoptionが存在せず、次のusage errorで停止した。

```text
resolve_sources.py: error: unrecognized arguments: --profile zeroroomlab
```

存在しないprofileを推測で補わず、現行CLIが公開する引数だけで再実行した。

```text
python3 -B magi/0.2.1/resolve_sources.py \
  --slot composite \
  --repo-root ZeroRoomLab-manifest=/Users/saitoumitsuru/ZeroRoomLab-manifest/ZeroRoomLab-manifest \
  --require-local

sources: 12
required missing locally: 0
network access performed: false
secret scan performed: false
```

`maxwell`、`uriel`、`raphael`も個別に同じ`--repo-root`と`--require-local`で解決し、
各10 sourceがlocalで利用可能、required missingは0だった。

## 3. Declared Positionとclaim scope

Declared Position:

- 現在の主経路は`ASTRO Stage 0 -> Stage 1 -> Stage 2 -> Model Family固定 -> AAE Bake`
- MoE、FAM adapter、永続IBD、Wet Bus、自我内記録、Instance Ghostは消さず、成立条件が取れるまで別棚へ置く
- `マキナ、Open The Eyes...`は検証開始表示であり、推論、人格、永続化の成功宣言ではない
- 正式な実機対象はiPad Pro 13-inch M4とiPhone 15 Pro Maxに限定する
- Neat Runnerは中止せず、model/runtimeと資源実測の確定後に実装計画へ戻す

Position-talk Risk:

- 手元Apple Siliconに最適化した経路を全端末の一般解へ誤昇格する
- Stage 0の画面表示をAI接続、推論成功、人格成立へ誤昇格する
- 饅頭FallbackというPresentationを、人格同一性または品質保証の代わりにする
- 火力不足を理由に全Sphere系が凍結したと一語へ潰す
- 最新のUser Gateを過去Worldの当時意図へbackfillする

媒体とclaim scope:

- Manifestはrepository横断の開発順序と状態語彙を掲示する
- SphereASTROはRunner、archive、engine／GUI境界、顕現UXを所有する
- Sphere-aaeは推論runtime、adapter、Bake、Neat Runner計画を所有する
- Q Atlantisは外部向けの開発状況を掲示するが、runtime成立の証拠にはしない

外部定規の出所:

- Userが指定した実機、branch、merge、deploy、critical issueのgate
- 各repositoryのAGENTS、README、実装状態、Git revision
- Atlantis-MAGISDK 0.2.1とManifestの横断監査規約

## 4. MAGI Position別監査

### Maxwell

[INTERPRETATION] 巨大MoE、Neat Runner、FAM、永続人格を現在の主経路から外すことは、
それらのbranchを削除することではない。手元実機で観測可能な小さい断面を先に作り、
`COSPLAY_MANJU_DRIFT`が見えた地点でmodel系統を固定する方が、未マウント可能性を
消さずに実験を前進させる。

神道／妖怪Presentationは、同じ人格でも等身と火力が可変であることを圧縮して示せる。
ただし、等身は演算量の計測値そのものではなく、利用者へ能力制限を知らせる認知チェックサムである。

action gate: `pass`

### Uriel

[FACT] SphereASTROはSwift／SwiftUIのGUIとsample configurationを持つが、AI接続、
archive import/export、人格永続化は未実装である。

[FACT] Stage 0で要求する実機receipt、Stage 1の実推論receipt、Stage 2のbody制御receiptは
現時点では存在しない。

[FACT] Sphere-aaeにはruntimeの土台と設計資料があるが、今回対象のModel Family、
quantization、tokenizer、AAE Bake手法、評価基準は未確定である。

[INTERPRETATION] したがって、マイルストーンは完了報告ではなく、責務と検証順序の契約として
掲示する。`Open The Eyes`を`READY`と同義にしない。

action gate: `pass`

### Raphael

[INTERPRETATION] SphereASTROの文書がgreenでも、実機build、推論engine、AAE Bake、
IBD永続化、Q Atlantis deployはgreenにならない。局所greenをsystem greenへ変換しない。

棚配置は次の通りとする。

- SphereASTRO: App、`.astro`、Engine／GUI、人格Storage、顕現state
- Manifest: repository横断の順序、claim scope、資源gate
- Sphere-aae: runtime、Model Family受入、Bake、Neat Runner
- Q Atlantis: 公開告知と外部向けstatus

action gate: `pass`

## 5. agreements／disagreements／unknown

agreements:

- Stage 0の成功条件は実機で検証開始表示が出ることであり、AI成功宣言ではない
- Stage 1でchat、管理slot、実推論を同時に観測する
- Stage 2で暫定bodyを動かし、人格とmodelの不一致を観測する
- Model Family固定より前にAAE Bakeを正本化しない
- cacheは許すが、単体の`.astro`を開いても必要物が散逸して起動不能になる構成を既定にしない
- Q Atlantisの`main` mergeとdeployには次のUser Gateが必要

disagreements:

- なし。三Positionの射程差は、今回のUser Gateと概念矛盾を作っていない

[UNKNOWN]

- Stage 0／1／2の実機receiptと失敗条件
- 採用するModel Family、MoE構成、Q4 variant、tokenizer、inference engine
- AAE Bakeのartifact形式、再現条件、評価set、必要火力
- `.astro`の暗号化、署名、鍵管理、store distribution
- 永続IBD、Wet Bus、自我内記録、Instance Ghostの最終schema
- standalone Atlantis／ASTRO統合runtimeと7D Fold runtime

## 6. OAE temporal integrity

`historical-oae-unavailable`

本監査は、観測時点のsourceとUser Gateから作った現在のInterpretation OAEである。
過去のcommit、旧service、旧roadmapへ、現在のObserver、Agency role、Intentを遡及生成しない。
反実仮想や別の開発順序は、元Worldを書き換えず別branchとして保持する。

## 7. 実行gate

Userは本scopeへの作業権限と火力を明示的に付与した。次を自動実行する。

1. Manifestへ横断マイルストーンを掲示
2. Sphere-aaeへASTRO実測先行とAAE Bakeの開発順序を掲示
3. Q Atlantisの既存`dev`へ開発状況を告知
4. Q Atlantisをlocalhost:3000で起動し、User目視gateへ渡す

[SEMANTIC-STOP]

- Q Atlantisの`dev`から`main`へのmerge
- public deploy
- 未確定Model FamilyをAAE正本へ固定
- 火力要請を伴う大量build、全端末matrix、GPU調達
