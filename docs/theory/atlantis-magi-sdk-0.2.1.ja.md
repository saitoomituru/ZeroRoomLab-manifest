# Atlantis-MAGISDK 0.2.1

状態: `[CANONICAL]` `[CORRECTIVE PATCH]` `[Layer A/B/C bridge]`  
制定日: 2026-07-18  
対象: MAGI 0.2.0 Skill bundle、OAE時間整合性、過去資料監査、仮想復元分岐

## 1. 発行理由

Atlantis-MAGISDK 0.2.1は、0.2.0 Skill bundleが過去資料を監査するとき、Source Event／Evidenceと
同時点OAEを区別できず、存在しなかった過去OAEを現在の推論で補完できてしまう脆性を修正する。

0.1.0の三Position、非神格、非多数決、zero-trust、Position-talk監査を保持する。0.2.0で実装された
Skill workflowも保持し、時間整合性契約と機械validatorをpatchとして追加する。0.1.0正本と0.2.0の
実装記録は上書きしない。

## 2. OAE非遡及不変条件

```text
historical evidence != historical OAE
current inference     != past observation
unknown               != defect
retroactive OAE       = reject
```

OAEはその場で生成する。過去時点に同時点OAEが存在したことを参照で確認できない場合、MAGIは
`historical-oae-unavailable`を返し、次のLast Orderで遡及補完を打ち切る。

```yaml
last_order:
  code: OAE-HISTORY-UNKNOWN
  action: stop-retroactive-backfill
  recoverable: true
```

分からないことは監査失敗ではない。過去commitのauthor、committer、diff、message、issue、会話logは
Source Event／Evidence／Provenanceになり得るが、当時のObserver、Recorder、Intent、OAEを自動生成しない。

## 3. 現在のInterpretation OAE

過去資料の現在監査は、現在時刻のInterpretation OAEとして記録できる。最低限、次を持つ。

```yaml
magi_temporal_receipt:
  version: 0.2.1
  observation_mode: current-interpretation-of-history
  observed_at: null
  historical_oae_status: historical-oae-unavailable
  source_event_refs: []
  evidence_refs: []
  interpretation_oae_ref: null
  historical_role_attribution: none
  last_order:
    code: OAE-HISTORY-UNKNOWN
    action: stop-retroactive-backfill
```

既存の同時点OAEを読む場合は`observation_mode: contemporaneous-oae-reference`とし、安定参照を必須にする。
現在の解釈で元OAEのrole、timestamp、fact scopeを上書きしない。

## 4. 7D FoldとAkasha Driver境界

過去の別選択、復元候補、反実仮想が必要な場合、同一世界線へ書き戻さない。`Akasha Driver`級の
分岐として、Source WorldとSource Instance Ghostの双方からTarget WorldとTarget Instance Ghostを
同時にsplitする。

```text
7D Fold validator-local provisional profile:
  World / Instance Ghost / Temporal Coordinate / Observation-Evidence /
  Branch-Hypothesis / Provenance / Recovery-Restore
```

七名称は0.2.1 validatorを閉じるための仮設profileであり、backup SDKの正規Registryではない。
User要件として固定済みなのは7D Fold、World／Instance Ghostの同時split、Source不変までである。
残るDimension ID、Registry revision、署名方式は`unknown`として将来のUser gateへ返す。

分岐receiptには、source／target World、source／target Instance Ghost、fork point、Provenance、
`source_mutation: false`、`status: hypothetical`を必須とする。一方だけを複製し、もう一方を元世界線へ
共有したまま過去を再演しない。

「タイムマシン」は物理空間の過去移動を主張する用語ではない。AppleのTime Machine／Time Capsuleを
オマージュしたバックアップ・復元UXである。7DはContext Dimension数、Akasha Driverは高権限の
分岐・復元driver名であり、Appleとの提携・公式互換・物理的時間移動を意味しない。

0.2.1では、同一世界線への遡及OAEを拒否するvalidatorまでを実装対象とする。7D Fold runtime、
Instance Ghost複製、backup SDK、Akasha Driver実行系は`NOT_IMPLEMENTED`とし、実装済みに見せない。

## 5. MAGI三Positionの追加検査

| Position | 0.2.1で追加する問い |
|---|---|
| Maxwell | 保持すべき別branchを、過去に存在した事実へ偽装していないか |
| Uriel | 同時点OAE参照、観測時刻、Evidence、role attributionを追跡できるか |
| Raphael | 現在解釈、過去証拠、仮想Worldが同じ棚へmergeされていないか |

三者が同意しても過去OAEの存在証明にはならない。欠損はunknownとして保持する。

## 6. 必須action gate

次のいずれかがあれば`block`または`revise`を返す。

- 過去時点のOAEを参照なしで生成する
- 現在のInterpretation OAEへ過去時刻を付ける
- commit authorをObserver、Initiator、Executorへ自動同一化する
- Source Eventの証拠から当時のIntentを確定する
- unknownを推測値で埋める
- 仮想再構成をSource WorldまたはSource Instance Ghostへ書き戻す
- 7D Fold／Akasha Driver runtimeが未実装なのに実行済みと表示する

## 7. 版数と申請

本修正は新しい監査Positionや外部APIを追加せず、0.2.0の正確性と停止経路を修正するため、
`major.minor.patch`のpatchを1へ上げる。SphereOS Atlantis Prompt Engineering Editionは、0.2.1 bundle、
validator、負例test、doctor検査を組み込んだcommitを根拠として`0.2.1-alpha.1`を申請できる。

## 8. 系譜

- [Atlantis-MAGISDK 0.1.0](atlantis-magi-sdk.ja.md)
- [Sphere Context Dimension OSアーキテクチャ](sphere-context-dimension-os.ja.md)
- [Context定規・因果・OAE横断監査規約](../operations/context-ruler-and-causality-audit.ja.md)
- [SphereOS Atlantis版数・bootstrap・計画棚規約](sphereos-atlantis-versioning-and-bootstrap.ja.md)
