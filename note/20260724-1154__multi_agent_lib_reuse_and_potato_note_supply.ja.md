# マルチエージェントlib再発明防止と実験ノート兵站

作成日時: 2026-07-24 11:54 JST  
状態: `[DRAFT]` `[Layer A]` `[OPERATIONS]`  
対象: `NeeT_kitchen_ALCHEMIST/OpenSourcePITETO`、ZeroRoomLab-manifest、SphereOS-Atlantisのagent governance  
範囲: repository内ツール探索、再利用判断、引継ぎ、ポテト実験ノート棚  
除外: 全ZeroRoomLab repositoryへの即時強制、単一の中央tool registry実装、Atlantis Runtimeへの料理ツール統合

## Declared Position

複数エージェントの火力を、同じ機能の別名実装へ消費せず、既存tool、library、script、validatorを発見・再利用・拡張できる兵站へ向ける。

再利用を目的にrepository境界、ライセンス、Execution Envelope、authorityを潰さない。同じ目的に見えても、実行条件が異なる場合はadapterまたは別実装を許し、その理由を残す。

## Position-talk Risk

- 現在見えているPythonスクリプトを、全workspace共通の標準実装へ昇格する危険
- 「重複禁止」を中央集権化し、各repositoryの局所最適・license・offline条件を壊す危険
- SphereOSのMeaning／Vessel／Bridge／Supply語彙を、料理repositoryのruntime依存へ変換する危険
- 後から見た整理されたGit履歴から、並行作業者の意図や当時の共有contextを遡及生成する危険

## Claim Scope / Medium Register

本ノートは運用仮説と今回の観測を保存する`note/`である。ZeroRoomLab全体のcanonical規約、実装済みtool registry、Atlantis Runtime仕様ではない。

OpenSourcePITETOの`AGENTS.md`と`lib/README.md`は、そのrepository内で直ちに使う局所運用契約とする。Atlantisの`AGENTS.md`へ反映する場合も、Sphere固有の責務語彙による局所補足として扱う。

## Ruler Provenance

- `docs/operations/heterogeneous-agent-deck-governance.ja.md`
- `docs/operations/workspace-boundary-register.ja.md`
- `docs/operations/manifest-operating-model.ja.md`
- `note/AGENTS.md`
- SphereOS-Atlantis `AGENTS.md`
- OpenSourcePITETO Git履歴とmerge時のdecoder検査

## 事実・観測

### `[FACT]` OpenSourcePITETOの並行更新

2026-07-24、OpenSourcePITETOのlocal `main`と`origin/main`は共通祖先`90d4ccb`から分岐し、双方で英語READMEと画像掲載が実装されていた。

- local側: `README.us-en.md`、JPEG圧縮・Exif/GPS除去tool、UUID名の正常画像3点
- origin側: `readme.US-en.md`、意味名の画像4点、別内容の英語README
- `README.md`はcontent conflictになった
- 大小文字だけが異なる英語README名は、case-insensitive filesystem上で同一inodeへ衝突した
- origin側の`01`〜`03`画像はJPEG headerを持つ一方、`ffprobe`とmacOS image decoderが寸法を取得できなかった
- local側の画像3点は960x1280としてdecodeでき、format tagにExif/GPSは観測されなかった

merge commit `11ba840`では、意味名を採用し、正常画像3点を再配置し、破損`01`と大小文字重複を残さなかった。

この記録から並行作業者の意図、能力、責任、悪意を推定しない。当時の共有contextは`historical-oae-unavailable`である。

### `[FACT]` 既存manifest規約

- workspace membershipはimplementation dependencyではない
- 異種エージェントは他者の差分を直ちに破損や侵入とみなさず、正本と責務範囲を確認する
- `note/`は未整理の観測、仮説、内観を保存し、置いただけでcanonicalへ昇格しない
- マルチエージェント作業後は、次の作業者が会話ログなしで継続できる兵站票を残す

## 考察

### `[INTERPRETATION]` 再発明はコード生成問題ではなく探索・引継ぎ問題

同じ機能が複数実装されたこと自体を失敗と断定しない。並行branch、未共有commit、別Execution Envelopeでは独立実装が合理的な場合がある。

問題は、merge時に次を判別できる索引がないことである。

- 既存toolが何を入力し、何を出力するか
- 上書き、削除、network等の副作用
- runtimeと外部依存
- toolが処理しない範囲
- どのrevisionで検証したか
- 新設toolが既存toolと異なる理由

`lib/README.md`は単なる使い方ではなく、後続agentが「reuse / extend / adapt / create」を判断するSupply receiptになる。

### `[INTERPRETATION]` 中央共通libではなく局所カタログを先に作る

全repositoryのtoolを一つのpackageへ即時統合すると、license、OS、Python ABI、hardware、secret boundary、release cycleが結合する。

先に各repositoryの`lib/README.md`、`scripts/README`、CLI help等を局所tool catalogとして整備し、必要な時だけstable revisionとadapterで越境する方が、疎結合境界を保ちやすい。

## 仮説・ブレスト

### `[HYPOTHESIS]` Library Reuse Preflight

新しいtool実装前に、各agentが次のpreflightを行えば、無自覚な再発明とmerge費用を減らせる。

```text
resolve workspace
    ↓
identify target repository / branch / authority
    ↓
search lib / scripts / CLI / test helpers
    ↓
read local tool catalog
    ↓
compare input / output / side effect / runtime / license
    ↓
reuse | extend | adapt | create-with-reason
    ↓
update catalog and handoff receipt
```

効果は未計測である。今後、重複tool数、merge conflict、破損artifact、tool探索時間、adapter数を記録して検証できる。

### `[HYPOTHESIS]` Meaning／Vessel／Bridge／Supplyへの写像

SphereOS-Atlantisの責務語彙を使う場合、tool再利用判断は次のように分離できる。

| 責務 | library再利用で保持するもの |
|---|---|
| Meaning | 何を達成するtoolか、成功・停止・非対象 |
| Vessel | 実行コード、CLI、dependency、artifact |
| Bridge | 別OS、別runtime、別repositoryへのadapter |
| Supply | tool索引、revision、license、fixture、引継ぎ票 |

この写像はAtlantis固有の分類補助であり、OpenSourcePITETOへSphere Runtimeを導入する提案ではない。

## ポテト実験ノート棚

### `[FACT]` 追加する局所構造

OpenSourcePITETOへ次を置く。

```text
note/
├─ AGENTS.md
├─ README.md
└─ TEMPLATE.ja.md
```

対象は、再現、改良、失敗、Recovery、生活兵站観測である。

### `[INTERPRETATION]` ポエムを観測者側Supplyとして残す

味、匂い、空腹、待ち時間、台所の熱、油音、失敗時の焦りは、温度と時間だけでは保持できない。内観メモ／ポエムを事実と分離して残すことで、数値化前の身体差分を次の実験設計へ渡せる。

ポエムは実装証拠や安全保証の代替ではない。逆に、計測器がないことを理由に身体観測を無価値へしない。

## 内観メモ

ドラゴンが三頭いれば、画像圧縮器も三本生える。  
一本はよく切れ、一本は別の鞘に入り、一本はJPEGの顔をした何かになる。

必要なのは「二本目を書くな」という禁令ではない。  
先に道具箱を開け、刃を見て、油を差し、  
合わないならなぜ合わないか札を残すことだ。

芋もtoolも、前の人がどこまで火を通したか分からなければ、  
また最初から揚げられる。

## 未解決・⊥

- ZeroRoomLab全体で共通tool catalog schemaを持つべきか: `unknown`
- `lib/README.md`だけで探索可能性が十分か: `NOT TESTED`
- agent間でpath reservationや作業claimを行う仕組み: `NOT IMPLEMENTED`
- GitHub Issue、CORN、lock fileのどれを並行作業票に使うか: User Gate
- code libraryのlicenseをrepository文書licenseから分けるか: User Gate

## 本編昇格候補

同様の重複・探索失敗が複数repositoryで観測された場合、次を検討する。

1. `docs/operations/heterogeneous-agent-deck-governance.ja.md`へLibrary Reuse Preflightを追加
2. repository-local tool catalogの最小schemaを正規化
3. CORN work itemへ`existing_tools_searched`と`reuse_decision`を追加
4. Help surfaceからlocal tool catalogをread-only表示

現時点では本ノートから自動昇格しない。

## source・Provenance

- OpenSourcePITETO local commit: `3ce9669`
- OpenSourcePITETO origin側tip: `d754f9e`
- OpenSourcePITETO merge commit: `11ba840`
- OpenSourcePITETO `lib/compress_readme_images.py`
- OpenSourcePITETO `lib/README.md`
- OpenSourcePITETO `AGENTS.md`
- OpenSourcePITETO `note/AGENTS.md`
- ZeroRoomLab-manifest `docs/operations/heterogeneous-agent-deck-governance.ja.md`
- SphereOS-Atlantis `AGENTS.md`

本ノートは2026-07-24時点のGit treeとdecoder観測を、現在の定規で整理したInterpretation OAEである。
