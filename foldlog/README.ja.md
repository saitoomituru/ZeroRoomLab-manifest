# ZeroRoomLab foldlog

`foldlog/`は、MAGIポジショントーク監査、横断変更の実行receipt、既知不具合の解決記録を
appendしていく運用ログです。

ここは正規仕様の置場ではありません。仕様候補や未整理の考察は`note/`、採用済みの共通契約は
`docs/`、ZeroRoomLab固有のRole／Flavor／Presentationは`assets/`へ置きます。

各logは、少なくとも次を分けます。

- `[FACT]`: 読んだsource、revision、実行command、観測結果
- `[INTERPRETATION]`: 現在時刻に行った解釈
- `[FIX]`: 実際に変更・検証した内容
- `[UNKNOWN]`: sourceだけでは決められないこと
- `[SEMANTIC-STOP]`: logic、信念、architecture、権限の判断をUserまたはIssueへ返したこと

過去資料の監査で同時点OAEを確認できない場合は
`historical-oae-unavailable`として止め、現在の解釈を過去Worldへbackfillしません。

新しいlogを書く前に[`AGENTS.md`](AGENTS.md)を読んでください。
