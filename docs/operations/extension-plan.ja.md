# 拡張計画（Native / Server / App-layer / Edge-algo 棚）

作成日: 2026-07-13

## 1. 背景

Custom GPTs の前提が崩れつつあるため、ZeroRoomLab-manifest / Quantaril Cloud 系の知識基盤は、単一のチャットUI依存ではなく、複数の実装層へ分散して扱う必要がある。

## 2. 棚の分割方針

- Native: ローカル実行・オフライン・自律性を重視する層
- Server: 共有インフラ・API・配信・運用を担う層
- App-layer: UI / Agent / Workflow / Notion 代替を担う層
- Edge-algo: ローカル推論・センサ・計測・実機制御を担う層

## 3. 既存資産の再配置

- 既存の 108 ファイル相当の素材は、内容ごとに上記4層へ振り分ける。
- ただし、哲学・思想・神話の文書は技術実装へ吸収せず、独立した文書として保持する。
- どの文書がどの棚に属するかは、README もしくはハブ文書に明示する。

## 4. 優先度

1. 既存の文書を棚ごとに一覧化する
2. 重要な技術文書を docs/theory / docs/projects へ再配置する
3. 転送候補は note/transfer_plan へ移す
