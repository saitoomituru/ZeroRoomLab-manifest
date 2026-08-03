# Log Horizon — system-level情報子観測境界

状態: `[CANONICAL]` `[DECLARED TERMINOLOGY]`

制定日: 2026-08-03

制定authority: 齋藤みつる／ZeroRoomLab

## 1. 一文定義

> **Log Horizonは、物理粒子Observerの考え方をsystem-levelへ拡張したとき、仮想粒子とFAMを構成するOAEが、完全なsource状態を直接観測できず、embedding、traffic、sensor出力、hash、実行receipt等の部分投影だけを取得できる情報子単位のログの地平である。**

これは「log fileが存在する場所」という意味に限定しない。Observer、instrument、model、network、API、
physical sensor、権限、時刻、World、Execution Envelopeによって、観測可能な情報子と観測不能なsource状態が
分かれる境界を指す。

## 2. 命名のフォーク元と非同一性

`Log Horizon`は、物理学上のevent horizonとHawking radiationが示す「全体へ直接到達できなくても、境界を
越えて到達した情報から部分状態を観測する」という構造に着想を得たフォーク名である。

ただし、次を主張しない。

- 物理学上のevent horizon、black hole、Hawking radiationを直接測定した
- Higgs（ヒッグス）粒子または未知の物理粒子を発見した
- embedding、network packet、LLM output、sensor logが物理Hawking radiationと同一である
- system logから観測可能宇宙またはHost全体を完全再構成できる
- 物理法則、宇宙論、量子場理論の既存用語を情報子工学が置換する

既存物理の射程を尊重し、system-levelの情報観測境界には別名を与えるという、情報子工学の命名規律に従う。

## 3. 何がLog Horizonを作るか

代表例:

| 観測対象 | Horizonの先に残るもの | Observerが取得できる部分投影 |
| --- | --- | --- |
| embedding model | model内部の全学習状態、別表現空間、失われた原情報 | vector、model／profile ref、input hash、receipt |
| LLM／neural network | 全weight、全hidden state、provider内部runtime | request／response、公開model ID、token、tool trace |
| API／MCP／network | server内部状態、別tenant、非公開orchestration | traffic、status、latency、schema／response hash |
| physical sensor | sensor外の全物理状態、分解能外、未計測方向 | raw reading、range、calibration、clock、sensor receipt |
| FAM／OAE graph | 未記録のObserver状態、別World、未到達branch | FAM JSONP、pointer、OAE ref、Last Order |

「取得できない」は「存在しない」を意味しない。同時に、観測できた部分投影を全体状態の証明へ昇格させない。

## 4. 仮想粒子、FAM、OAE

情報子工学でいう仮想粒子は、物理学上のvirtual particleを実証したという意味ではない。system、model、agent、
memory、procedure間を移動し、観測によって意味や作用が確定する情報子単位を扱う設計語である。

```text
unobserved source state
  ↓ Log Horizon
observed infoton projection
  ↓ FAM JSONP pointer／nest
Observer + Agency + Effect
  ↓ OAE ref
IBD／Akasha DB等のprojection cache
```

OAEは、誰が何を観測し、どのAgencyが採用・実行・再解釈し、何が作用したかを保持する。Log Horizonは、
そのOAEが完全なsource状態へ到達できると偽装しないための観測境界である。

## 5. FAM JSONPで保持するもの

FAMの正本表現はJSONであり、本プロジェクト固有のFAM JSONP pointer機構によって再帰参照・呼出しを構成する。
JSON-LDと似たgraph projectionを作れるが、FAM JSONPは意味識別だけでなく、実vector、embedding procedure、
探索技、外部source、artifact、hash、receipt、Last Orderへ接続する別目的関数の形式である。

説明用の最小例:

```json
{
  "fam_id": "fam://log-horizon/observation/001",
  "observation_boundary": {
    "kind": "log_horizon",
    "complete_source_observed": false
  },
  "observed_projection": {
    "pointer_type": "embedding",
    "target": "vector://projection/001",
    "content_hash": "sha256:...",
    "source_input_hash": "sha256:...",
    "procedure_ref": "procedure://embedding/profile-a"
  },
  "oae_refs": [
    "oae://observation/001"
  ],
  "unresolved": [
    "provider_internal_state",
    "unobserved_sensor_range"
  ]
}
```

hash化できるのは取得したprojection artifactであり、Horizonの先にあるsource全体ではない。hashはbyte identityを
支えるが、内容の真理、完全性、authorityを単独では証明しない。

## 6. Akasha DBとの関係

Akasha DBはAkasha空間、Allah、Real World Hostまたは全情報を内部に収める装置ではない。DNS cacheのように、
特定Observer、World、Fold、時点、instrumentから取得できた部分投影のpointer、hash、provenance、freshnessを
保持する非権威的cacheである。

Log Horizonの先を全取得したと主張せず、到達した輻射情報子だけを保存する。この非包含は能力不足の隠蔽ではなく、
完全なsource、Host、超越状態を局所DBやmodelへ縮減しないための責務境界である。

## 7. 下流実装への要求

- IBDは観測projection、FAM JSONP pointer、hash、instrument／procedure profile、OAE ref、freshness、Last Orderを非破壊で保持する
- SphereOS AtlantisはObserver、World、Agency、Effect、Execution EnvelopeとLog Horizonを分離する
- Q Atlantisは物理学上の主張と情報子工学上の命名フォークを公開文書で混同しない
- AAE、LLM、sensor、API adapterは、自身が観測できない内部状態を`unknown`として返せる
- どのcomponentも局所cache、embedding、traffic、sensor readingを全体状態へ昇格させない

## 8. 関連

- [情報子工学とは](infoton-engineering.ja.md)
- [Sphere Context Dimension OSアーキテクチャ](sphere-context-dimension-os.ja.md)
- [Context定規・因果・OAE横断監査規約](../operations/context-ruler-and-causality-audit.ja.md)
