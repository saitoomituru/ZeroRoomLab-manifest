# FAM model adapterサポートLevel横断監査

- 観測時刻: `2026-09-10T01:44:40Z`
- source revision: `ZeroRoomLab-manifest@179493b`
- 対象: FAM / FQuery / Sphere-aae / model adapter / OAE / refFAM
- 実行権限: UserがIssue・Manifest・Milestone反映と実装、small commit、remote pushを明示承認

## Maxwell

- `[FACT]` adapterごとに取得できる観測面は異なり、最終応答、訂正stream、open-weight artifact、MoE runtime telemetry、native internal busを一つへ潰せない。
- `[FIX]` Lv1を説明可能AI、Lv4を叡智の汎用保存形式、Lv5を人格・自我UXへ接続する段階として分離した。
- `[INTERPRETATION]` Lv2とLv3は兄弟軸であり、Lv4で合流する。数値だけでcapabilityを推定しない。

## Uriel

- `[FACT]` FAM Coreがmodel adapterのサポートLevelやplugin品質を認証する必要はない。
- `[FIX]` Core責務をproducer、adapter chain、revision、自己申告、OAE refの保存・運搬へ限定した。
- `[FIX]` 倫理、ガイドレール、正義、善悪の定規はrefFAMへ置き、適用結果をObserver OAEとして残す。
- `[UNKNOWN]` vendor内部の非公開policy revisionやmodel内部状態は、対応adapterからreceiptが無い限り不明のまま保持する。

## Raphael

- `[FACT]` Manifest現作業treeには未追跡User noteがあるため変更していない。`origin/main@179493b`から隔離worktreeを作成した。
- `[FIX]` 低品質な分類、拒絶、サイレント書換え、理由欠損も削除せず、後続Observerが品質OAEを追加できる回復経路を定義した。
- `[SEMANTIC-STOP]` Lv5をFQuery Lv1またはBrowser Playgroundの完了条件へ逆流させない。Sphere-aae実接続とASTRO人格UXは別statusである。

## Claim scope

この監査は現時点のInterpretation OAEであり、個別adapterのLevel認証、model品質評価、Lv5実装完了を意味しない。
