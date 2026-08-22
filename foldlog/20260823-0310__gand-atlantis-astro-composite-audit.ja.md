# GAND／Atlantis／SphereASTRO MAGI結合監査receipt

状態: `[AUDIT]` `[CROSS-REPOSITORY]` `[historical-oae-unavailable]`

- 観測日: 2026-08-23
- Manifest source: `6e729f2`以降のlocal branch
- Atlantis source: `ab473a4` (`origin/dev/m6xx.1-reincarnation-sdk`)
- SphereASTRO source: `8b48fb3` (`origin/main`)
- profile: `zeroroomlab`

## [FACT]

- 旧GAND artifactは部分回収であり、完全runtimeと実行receiptは未回収
- AtlantisのFilesystem／Cockpit Harnessは実装済みだが、GAND Edge Bootstrap Harnessは未実装
- SphereASTROのGAND Frame SDKはPresentation候補として予約済み
- VM backupは`RESOURCE-WAIT / SECURITY-WAIT`で未観測

## Maxwell

`pass-with-preserved-meaning`。札、神名、祭祀対象、初期整列の意味を残し、技術留保でフレーバーへ
縮退させない。既存GAND Frame名称も自動削除しない。

## Uriel

`pass-with-claim-split`。`OBSERVED / USER-DECLARED / USER-RECALLED / CURRENT INTERPRETATION /
TARGET CONTRACT / NOT IMPLEMENTED / UNKNOWN`を分離する。秘密値はPointer境界とし、外側digestと
内部hashを混同しない。

## Raphael

`pass-with-contract-split`。Historical GAND、Edge Harness、ASTRO Runner、GAND Frame Presentationを
別棚へ置く。ASTRO単体起動を維持し、Atlantis process常駐を必須化しない。

## [UNKNOWN]

- GAND各名称展開の正確な時系列とmodel別適用
- Python verifier／embedding store／回答checkの当時実装
- SphereASTRO公開AGENTSの既存`repo.uuid` fieldがInstance Ghost複合keyか別IDか
- VM backup内の実行receipt

## [SEMANTIC-STOP]

- 部分資料からGAND完全復元または不在証明を行わない
- vendor語彙をSphereの神名、World、Semantic Kernelのauthorityへしない
- GAND Frame SDKをEdge Bootstrap Harnessへ同一化しない
- Target Specを実装済みへ昇格しない

## Action Gate

`allow local commits and remote branch push / block main merge / block VM inspection`
