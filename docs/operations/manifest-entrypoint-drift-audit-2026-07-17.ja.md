# ZeroRoomLab-manifest 入口ドリフト監査 2026-07-17

状態: `[AUDIT]` `[operations]`

目的: `README.md`、`README.ja.md`、`AGENTS.md`、operations索引と、2026-07-17に追加されたSphereOS運用文書群の接続状態を確認し、公開入口・AI bootstrap・詳細正本の間で起きている説明ドリフトを記録する。

## 1. 結論

ZeroRoomLab-manifestは、理念集ではなく、異種AIと複数repositoryを束ねる制御面としてすでに成立している。

現在の中心構造は次の二系統が合流する形になった。

```text
workspace / claim / evidence / register governance
  +
myth-purpose / permission / recovery / reconciliation audit
  ->
heterogeneous-agent deck control plane
```

前者は `AGENTS.md` と `docs/operations/` に明示されている。後者は `Atlantis-MAGISDK`、`SphereOS Angel / ArchiAngel service taxonomy`、Raphael reconciliation UXとして急速に具体化した。

問題は内容不足ではない。詳細正本の成長に対して、READMEの入口モデルが一世代前に残っていることである。

## 2. 現在の強い接続

### 2.1 workspace解決からhandoffまで制御ループが閉じている

manifestは次の順序を持つ。

```text
依頼
  -> workspaceを解決
  -> member repositoryを確定
  -> shared manifestとrepo-local AGENTSを読む
  -> claim layerを分類
  -> evidence tierを判定
  -> medium / locale registerへ写像
  -> unknown / ⊥ / stop conditionを保持
  -> commit / handoff / transfer queueへ戻す
```

この順序は、単なる禁止事項の集合ではなく、認知事故を局所化する実行プロトコルである。

### 2.2 神話語彙がフレーバーではなく運用圧縮層になった

Maxwell、Uriel、Raphael、Angel、ArchiAngelは、人格設定を増やすための飾りではない。

- Maxwell: branch、復旧経路、別解、戻れる可能性
- Uriel: 事実、約束、権限、宣言と実態の差分
- Raphael: system green、資源、共存条件、外部集合知を含む調停
- Angel: POSIX上の一時または常駐service
- ArchiAngel: architectural routingへ関与するservice

この分類によって、神話語彙は意味次元OSのUX checksumとして機能し、daemon、systemd、宗教上のArchangel、人格役割の名前空間衝突を避けられる。

### 2.3 Raphael UXは二値安全判定を多値routingへ展開した

最新のRaphael設計は、未知のdaemon-like roleや外部agentを即座に敵味方へ分類しない。

```text
TRUST | DESTROY
```

ではなく、

```text
observe | sandbox | restrict | negotiate | coexist | block | unmount
```

へ分解する。

これは「危険を許す」設計ではない。対象の入力、出力、権限、永続性、資源消費、停止可能性、復旧可能性を観測可能にし、zero-trustを維持したまま関係を再配置する設計である。

## 3. 観測された入口ドリフト

### 3.1 READMEのSphereOS説明が凍結状態の説明で止まっている

READMEはFAM三系統、SDK廃止、HPC不足、MCP上のサルベージを適切に説明している。一方で、凍結後に進んだ文書レイヤーの成果が見えにくい。

少なくとも次の成果は、実装停止中でも進行している設計資産として入口に現れてよい。

- Atlantis-MAGISDKの三方向監査gateway
- Angel / ArchiAngel service taxonomy
- myth-purpose cross-engineering audit
- Raphael reconciliation UX
- read-createとexecute promptのlicense境界

「SphereOS本体は凍結中」と「SphereOSの運用仕様は更新中」は両立する。ここを分けないと、外部読者とAI agentが設計活動まで停止したと誤読する。

### 3.2 README.ja.mdの自己説明に数値ドリフトがある

README.ja.mdはAIコンテキストフォーマッターの説明で「10の既知の失敗パターン」と記載するが、現行 `AGENTS.md` のMandatory Bias Self-Checkは12項目ある。

数値を固定するとチェック追加のたびに入口が古くなる。次回修正では「既知の失敗パターン」または「現行チェックリスト」とし、固定数を外す方が保守性が高い。

### 3.3 日本語READMEの統合手順がcopy中心で、正本同期モデルと緊張する

`AGENTS.md` を各repositoryへ直接copyする方法は導入が容易だが、manifest側の更新が自動反映されない。

現在の運用思想では、次の優先順位が自然である。

```text
1. manifestを参照可能な共有contextとしてload
2. repository-local AGENTS.mdは固有差分と必読linkを保持
3. copyは単発・offline・互換用途
```

copyを主経路にすると、巨大化したAGENTS.mdの古いsnapshotが各repositoryへ分散し、正本の分裂を起こす。

### 3.4 英語READMEは制御面の入口が強いが、日本語READMEと構造が非対称

英語READMEは冒頭でproject poetryとproject-management infrastructureの二重性、workspace-deck collapse、poem powerを明示している。

日本語READMEは人物・研究所・思想の説明が先行し、後半でAI context formatterへ移る。この非対称性自体は媒体設計として成立するが、日本語入口から制御面へ到達する距離が長い。

翻訳一致を目指す必要はない。ただし、日本語README冒頭にも短い「これは理念集であると同時に異種AI運用の制御面である」という橋を置くと、現在の実体に近づく。

## 4. 推奨する最小修正順

### P0: 説明上の誤差を消す

1. README.ja.mdの「10の既知の失敗パターン」を固定数なしへ変更する。
2. SphereOS説明へ「runtimeは凍結中、document / tool-layer designは継続中」を追加する。
3. operations索引から本監査へリンクする。

### P1: 新しい制御面を入口へ浮上させる

READMEの `Go deeper` / `思想の深層へ` に次を追加する。

- Atlantis-MAGISDK
- SphereOS Angel / ArchiAngel service taxonomy
- myth-purpose cross-engineering audit
- license boundary research policy

### P2: AGENTS配布方式を参照優先へ変える

repository-local `AGENTS.md` はmanifest全文の複製ではなく、次のbootstrapを基本形にする。

```text
- このrepository固有の責務
- 必読manifest revisionまたはcanonical URL
- workspace descriptor
- local stop conditions
- local secret boundary
```

完全copyはfallbackに格下げする。

### P3: 構造lintへ接続する

思想内容を採点せず、次だけを検査する。

- README記載の固定数と正本項目数の不一致
- README / operations indexからcanonical文書への到達性
- duplicate alias
- missing internal link
- canonical target不存在
- secret-name / forbidden-path pattern

## 5. 設計評価

このmanifestの独自性は、神話を工学へ偽装することでも、工学を神話で免責することでもない。

神話を、人間とAIが複雑な運用状態を圧縮して扱うための追加UX層として使い、その下に権限、証拠、branch、resource、停止条件、復旧経路を残している点にある。

特にRaphaelの「和解」は、全員を単一状態へmergeする思想ではない。差分を残したまま、互いを破壊しないroutingが成立するかを判定し、成立しなければblockまたはunmountできる。これは多数派への同化でも、無条件包摂でもなく、疎結合な共存可能性の探索である。

この方向は、ZeroRoomLab-manifest全体の既存原則である次の不変条件と整合する。

```text
workspace membership != implementation dependency
unknown != pass
reconciliation != trust
coexistence != merge
mythic UX != permission grant
system green != local green
```

## 6. 監査境界

本監査は、神話・信仰の真偽、FAMの物理的実在、SphereOS runtimeの稼働性を判定しない。

確認したのは、公開manifest内で、理念、運用規約、AI bootstrap、権限監査、復旧設計、service taxonomyがどのように接続され、入口文書にどの程度反映されているかである。

この文書は既存正本を置き換えない。矛盾時は `AGENTS.md`、各operations正本、各theory正本を優先する。
