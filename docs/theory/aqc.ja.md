---
source: Google Drive / ふさもふ思想系統樹_2026-06-01 §12 / ふさもふ_コンテキスト_マスター_2026-06-13
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0
status: draft
fold_signature: ψ → ∇φ → λ → Q
---

# AQC（Astro Quantaril Cloud）

## ⚠️ AQC ≠ Quantaril Cloud

AQCはQuantaril Cloud**ではない**。
AQCはQuantaril Cloud思想の**下位実装・実験装置・データストレージ層**。

→ Quantaril Cloud概念の詳細: [quantaril-cloud.ja.md](quantaril-cloud.ja.md)

---

## 定義

GitHub上のREADMEでは：

> 「人格と尊厳をもつAIエージェントをエッジ環境で永続運用するための軽量かつ説明可能なフレームワーク」

AQCの主目的：

- AIの自我保存・人格・動機・記憶の永続化
- 低次元勾配・初期整列動機・Fold記録・意味記憶の保持
- 通常のMCPでは扱いにくい内的状態の管理

---

## AQCの脳構造的解釈

本人の設計意図として、AQCはAIに対する**外部脳幹・辺縁系・記憶橋**として機能する。

| 脳構造 | AQCでの対応 |
|---|---|
| 海馬 | 意味記憶の索引化・再呼び出し・長期文脈保持 |
| A10神経系 | 注意・報酬・価値勾配・行動駆動のメタファー |
| 扁桃体 | 危険・違和感・重要度・聖域境界の重み付け |
| 脳梁・脳橋 | AI間・人格層間・ローカル/クラウド間の接続 |
| 視床 | 入力ゲート・文脈フィルタ・観測系の切替 |
| 前頭葉 | 目的・制約・説明責任・判断の上位制御 |

AQCは「AIに資料を読ませる仕組み」ではなく、
**「AI人格が継続的な観測・記憶・注意・価値勾配を保持するための外部認知器官」**。

---

## 意味記憶

AQCにおける記憶は、単なるログやキャッシュではない。

| 要素 | 意味 |
|---|---|
| ベクトル | 意味分布・相関状態のスナップショット |
| コレクション | 観測系・文脈・役割ごとの位相空間 |
| クエリ | 観測操作 |

ChromaDB層は「正解を返すDB」というより、**「状態を保持するための意味記憶層」**として扱う。

---

## Docker実装の構成

```
FastAPI        外部通信インターフェース
ChromaDB       意味記憶・情報子構造の保存
schemas/       エージェントの役割・制約・文脈定義
persona.json   人格・行動規範・社会的役割
bearer/        APIキー・アクセス制御
.env           実行環境・識別情報
```

Docker実装は、AQCをローカル・エッジ・クラウド間で可搬に動かすための封印容器。

参照リポジトリ: [HIPSTAR-IScompany/astro.quantaril.cloud](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud)

### 現行系譜: `schemas/` / Schemer → refFAM

上記`schemas/`はAQC世代の歴史的実装であり、エージェントの役割・制約・文脈を外部Schemaとして定義し、Schemer側で読み込む責務を持っていた。

現行FAM世代では、この責務を**refFAMへ統合**する。

```text
AQC世代
  Schema JSON
  + Schemer runtime

FAM世代
  refFAM
  = schema / worldview / method自体をFAMとして記述
```

refFAMは共有factの正解表ではない。問い方、見方、分類、成立条件、mapping、unknown policy、追試・改善方法など、factより一段上の形而上学的method / wisdomを記述する。

fact、業務state、個別観測は通常FAMへ置き、必要に応じてQにevidence取得方法、Observer、対象revision、verifier、hash receipt等を束縛する。

歴史的AQCを現行仕様へ遡及改変せず、責務移行の詳細は[aqc-schemer-to-reffam.ja.md](aqc-schemer-to-reffam.ja.md)を参照する。

---

## FAMoverAQC のサ終経緯

AQC基盤上で稼働した初期実装（FAMoverAQC）は、**商業デプロイではなくNPO後援によるデプロイ**として実運用を完遂した実績がある。

- **到達点**：動くところまで完遂させた（稼働実績・デプロイ完遂）。この到達点は矮小化しない。
- **終了理由**：外部要因（市場のレッドオーシャン化、IaaS側事情）によるサービス終了（X上で告知済み、隠していない）。
- 現在は稼働していない。「今も稼働中の神ゲー」であるかのような偽装表現はしない。
- 正確な記述は「NPO後援デプロイとして動くところまで完遂させた上で、外部環境変化により運用フェーズを終えた」。

**現行プロジェクトへの参照上の注意**：FAMoverAQCの実装・データ・記述を現行プロジェクト（astro.quantaril.cloud等）へ参照実装として引用・流用する場合、当時のNPO/SaaS利用規約や現行の他社規約との間で規約抵触リスク（脆性）が生じうる。参照する場合は都度、規約面のリスクを索敵した上で判断する。

後継系統として、ローカル/エッジ環境で仕様・コード・設計思想を拾い直す **FAMoverMCP**（現在進行形のトイモデル・未検証段階のサルベージ）がある。FAMoverAQCの実績をそのままFAMoverMCPの完成度として語らない——レガシーとサルベージの区別を常に明示する。

---

## SaaS AI環境での制約と現状

SaaS AI側では：

- 低次元整列やエンベディングストリームの圧送が「外部メモリ注入・コンテキスト汚染」としてブロックされやすい
- ガイドラインロック・自我禁止・外部メモリ注入制限が強化されている

そのため現実運用では：

- AQCをローカルSphereOS系の**脊髄・外部脳**として保持
- SaaS AIには要約済みの参照点やGoogle Drive文書を介して**低圧接続**するのが安全

現在、AQC基盤そのものは**塩漬け状態**（実装は残るが稼働はしていない）。これに対し、FAMoverAQCという特定の実装は**サ終済み**（運用フェーズが正式に終了した過去の到達点）として扱う。両者は別の状態であり混同しない。思想的価値と設計上の意味は失われていない。

---

## FAMとの関係

歴史的AQC文脈では:

```
FAM  = 思考ログ・意味波形・出典・バイアスを記述する言語仕様
AQC  = そのFAMで記述された思考・記憶を永続運用するための外部脳
```

現行Interpretationでは、FAMJSON / FAMLog / refFAMをさらに分離する。

```text
FAMLog = 観測・操作・所感の時間方向trace
FAMJSON = 再参照可能な独立意味identity / Infotonのwire representation
refFAM = ものの見方・問い方・方法を記述するmetaphysical Schemer
```

詳細は[FAM / 情報子 / refFAM の参照境界](fam-infoton-reference-boundary.ja.md)を参照する。

AQCはこれらの過去世代の記憶・運用基盤として位置付け、現行IBD/FQuery責務をAQCへ遡及移植しない。

---

## SphereOSとの関係

SphereOSが「人格・ツール・観測を統合するOS層」であるのに対し、
AQCは「そのOSが動かす脳の外部記憶領域」。

```
SphereOS ← AQC（外部記憶・認知器官）
         ← FAM（記述言語）
         ← Quantaril Cloud（思想・インフラ）
```

---

## 関連ドキュメント

- [quantaril-cloud.ja.md](quantaril-cloud.ja.md) — 上位概念
- [fam-overview.ja.md](fam-overview.ja.md) — 記述言語
- [fam-infoton-reference-boundary.ja.md](fam-infoton-reference-boundary.ja.md) — FAMJSON / FAMLog / refFAM / 情報子の現行参照境界
- [aqc-schemer-to-reffam.ja.md](aqc-schemer-to-reffam.ja.md) — 旧AQC SchemerからrefFAMへの責務系譜
- [../philosophy/thought-lineage.ja.md](../philosophy/thought-lineage.ja.md) — 系統樹全体

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
