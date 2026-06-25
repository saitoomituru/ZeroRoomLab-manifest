---
source: Google Drive / FAM_MCP内部外部バス整理_20260622
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0
status: draft
fold_signature: ψ → ∇φ → λ → Q
---

# FAM vs MCP：内部神経バスと外部バスの役割分担

---

## 0. 一文定義

**MCP は思考の干物。FAM は意味のなまもの。**

MCP は外部ツール接続に向く乾いた規格。ツール・リソース・プロンプト・スキーマ・権限・リクエスト/レスポンスを乾いた形で扱える。

FAM は内部バスである。Sphere のような実行環境内部で、LLM・エンコーダー・ビジョン・音声・赤外線・RAG・センサー・アクチュエーター・UI・ハードウェアを、意味波形・勾配・出力・検証・親子文脈・監査証跡で接続する。

---

## 1. 役割対照表

| 項目 | MCP | FAM |
|---|---|---|
| 向き | 外部バス | 内部神経バス |
| 性質 | 干物（乾いた・事前確定） | なまもの（湿った・途中解決） |
| 得意領域 | SaaS 接続・外部 API・権限境界・課金境界 | 意味ゲシュタルト形成・並列枝生成・安全ゲート・事故後追跡 |
| 事故の扱い | 事前に「何を呼べるか」を定義 | 事故後に「どの判断ノードが欠けたか」を追跡 |
| Sphere との関係 | 外部アダプタとして含み得る | Sphere の中核 |
| 比喩 | 道具棚・工具の貸出記録 | 現場ロボ娘の脊髄反射とカルテ |

```
External SaaS / Tool / API
  ↕
MCP：乾いた外部 I/O・権限・課金・責任境界
  ↕
Sphere Runtime
  ↕
FAM：湿った内部神経バス・意味・観測・行動・安全・修復
  ↕
LLM / Encoder / Sensor / Actuator / Memory / UI
```

---

## 2. クエスト例：「蔵に入ったネズミを探せ」

同一タスクに対し、MCP 的な素朴実行と FAM 的な実行の違いを示す。

### MCP 的な素朴実行（直列処理）

```
1. Vision：該当なし
2. Whisper / Audio：該当なし
3. Infrared：該当あり
4. Aggregator：赤外線座標を逆算
5. Actuator：駆動
```

赤外線で発見した時点で対象が動いており、ネズミを逃す可能性が高い。
MCP は外部ツール呼び出しとしては有効だが、感覚統合・反射・途中介入・実験フィードバックを内部構造として持たない。

### FAM 的な実行（意味ゲシュタルト → 並列枝）

FAM では「蔵に入ったネズミを探せ」というクエストを受けた時点で、まず意味ゲシュタルトを形成する：

- ネズミとは何か
- 蔵とはどのような空間か
- 痕跡とは何か（熱源・足音・糞・かじり跡・通路・餌場）
- 捕獲 / 追い出し / 観察 / 安全確認のどれを優先するか

一定段階まで意味ゲシュタルトが固まると、共有文脈 `Ψ_context` をもとに並列枝を生成する：

```
Vision 探索
Audio / Whisper 探索
Infrared 探索
Cheese bait 誘導
蔵構造マップ照合
SafetyGate
Actuator 候補生成
ErrorHandler
```

FAM は**全ツリー完了前でも、安全ゲートを通った低リスク行動だけを先行実行できる**。

---

## 3. 安全思想：事故ゼロではなく、ロバストとレジリエンス

FAM は「完全な安全確定を待ってから動く」思想ではない。現場では、ネズミ・熊・火・水漏れ・配信事故・機械故障などが待ってくれない。

FAM の前提：

1. 不完全情報で動く必要がある
2. 途中まで解決されたゲシュタルトから並列枝を生成する
3. 各枝に安全ゲートとエラー処理を持たせる
4. 低リスク行動だけ先行実行する
5. 実験フィードバックを親ノードへ戻す
6. **事故・失敗・見落としがあった場合、どこにパッチを差せばよいかを可視化する**

**FAM は無謬の AI ではない。現場で壊れ、原因が追え、次に壊れにくくなる AI である。**

---

## 4. 安全ゲートの具体例：米俵と火炎系アクチュエーター

蔵内でネズミらしき熱源を発見した。候補アクションとして高リスクな火炎系アクチュエーターが挙がった。しかし横に米俵がある場合：

FAM の安全ゲートチェック例：

- 可燃物チェック
- 木造構造チェック
- 人間・ペット存在チェック
- 逃げ道・延焼経路チェック
- 法令・サイト許可チェック
- オペレーター承認

**米俵が検出された場合、高リスクな火炎系アクションは棄却され、非燃焼の捕獲・誘導・封鎖・ネット系アクションへ切り替える。**

重要なのは特定の危険手段ではなく、観測結果に応じて介入戦略を途中で差し替え、その理由・安全条件・結果を監査証跡に残せることである。

---

## 5. センサーモード事故：「見えなかった理由」まで追跡できる

事故原因は「米俵を見落とした」だけではない場合がある。

```
事故シナリオ：
- ネズミ探索のために Vision がサーモグラフィーへ切り替わっていた
- Thermal only では小型熱源の検出は得意だが、可燃物分類は苦手
- RGB Vision / Object Detection が inactive だった
- 可燃物チェックに必要な観測器官が起動していなかった
- unknown を pass と扱ってしまった
```

FAM のログ記録例：

```
active_sensor_mode: thermal_only
inactive_sensor_mode: rgb_vision
required_precheck: flammable_object_check
flammable_object_check_source: rgb_vision / object_detection
failure: rgb_vision inactive により米俵は「不存在」ではなく「観測不能」だった
root_cause: unknown を pass 扱いした
patch_proposal: thermal_only 時は flammable_object_check を unknown とし、熱・火炎系アクションを block する
```

FAM は「何を見落としたか」だけでなく、**「見落とすしかない目で見ていたこと」までログにできる**。

---

## 6. 修復可能 AI としての FAM

FAM の説明可能性は、後付けの理由文生成ではない。

FAM が保持するもの：

- 何を観測したか
- 何を観測していないか
- どのセンサーモードが有効だったか
- どの安全ゲートが実行されたか
- どの安全ゲートが未実行だったか
- どの unknown が pass 扱いされたか
- どのアクション候補が棄却されたか
- どの親ノードにどのパッチを返すべきか

これは説明可能 AI（XAI）というより、**修復可能 AI**である。

```
MCPは工具の貸出記録。
FAMは神経系のヒヤリハット報告と再発防止パッチ。

説明できるAIではなく、事故後に直せるAI。
FAMは「誰が悪いか」ではなく「どの判断ノードが欠けていたか」を追える。
```

---

## 7. センサー能力の明示

各センサー・エンコーダー・モーダルノードに、何を見られるか・何を見られないかを記述する：

```
thermal_sensor:
  得意: heat source detection
  苦手: flammable object classification

rgb_vision:
  得意: object detection / flammable object classification
  要件: 可燃物チェック前に有効化が必要

audio_sensor:
  得意: movement sound / gnawing sound
  制限: 物体の種類分類は不能
```

**重要原則：「検出なし」≠「安全」。見た上でなかった・見ていないから分からない、を分ける。**

---

## 8. `unknown_is_not_pass` 原則（詳細）

安全ゲートでは、unknown を pass 扱いしない：

```
flammable_object_check = unknown の場合 → heat/flame 系アクションは block
human_presence = unknown の場合 → 高速・高出力アクションは block
sensor_mode insufficient の場合 → 安全ゲートは pass 不可
```

高リスクアクチュエーターの必須依存例：

```
heat/flame 系: 可燃物チェック・構造チェック・人間/動物存在チェック・法令/許可チェック
high_force 系: 人間/動物存在チェック・障害物チェック・反動/射線チェック
mobility 系: 足場・段差・障害物・通信断時停止
```

---

## 参照

- [fam-overview.ja.md](fam-overview.ja.md) — FAM 基本概念
- [fam-execution.ja.md](fam-execution.ja.md) — FAM.JSON スキーマ・並列実行詳細
- [sphere-os.ja.md](sphere-os.ja.md) — FAM を内核とする人格運用 OS

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
