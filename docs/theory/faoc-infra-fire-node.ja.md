# FAOC / Infra-FIRE node architecture

- Status: `PUBLIC RESEARCH HYPOTHESIS / ARCHITECTURE MAP`
- Canonical context: ZeroRoomLab / 真ニートホワイトペーパー / Portable Civilization
- Updated: 2026-10-15

## 0. この文書の位置

真ニートホワイトペーパーが示す「ファンデーション型OSS文化圏」「祠単位のGit管理」「ラボ→部落→村→町」「コアはPatient Capital / Impact Patron、周辺は営利デプロイ可能」という社会・資本モデルを、ZeroRoomLabの既存実装へ接続するためのarchitecture mapである。

ここでいう **FAOC** は、中央DAOを一つ作るのではなく、自律した小単位がさらに小さな自律単位を内包し、必要な境界だけを相互接続する **fractal autonomous organization / community** の作業名である。法的な法人類型、金融商品、暗号資産DAO、完成済みprotocolを意味しない。

ZeroRoomLabはその最小実証nodeの一つとして、社会単位と物理インフラ単位を重ねて扱う。

```text
civilization commons / Jomon 2.0
  ├─ FAOC node: lab
  │    ├─ microgrid / water / compute / fabrication
  │    ├─ smaller autonomous components
  │    └─ commercial or cultural sidecars
  ├─ FAOC node: household / workshop / shrine / hamlet
  └─ FAOC node: village / later forks
```

## 1. 「Docker node」は比喩であり、境界設計でもある

各nodeをDocker/containerのように扱うとは、村や人間をsoftware containerへ還元することではない。意味は次の四点に限定する。

1. nodeごとにresource、authority、identity、failureを局所化する。
2. portableなmanifestとinterfaceを持ち、別の土地・文化・実装へfork可能にする。
3. 一つのnodeの停止を文明圏全体の停止へ直結させない。
4. 共通interfaceを使っても、内部の文化・法・所有・信仰・商売を同一化しない。

物理面ではmicrogrid、水、通信、compute、fabrication、住居等をnode内のserviceとして扱う。情報面ではWorld / Identity / Capability / provenanceを別層として運ぶ。

## 2. Infra-FIREとの接続

Infra-FIREはこのnodeを生存側から評価する指標である。金融資産だけを増やすのではなく、必須serviceに到達するまでの強制的な現金決済点とsingle point of failureを減らす。

したがって、ZeroRoomLab nodeは「完全自給を宣言する箱」ではない。各serviceについて外部依存、cash dependency、rights、品質、安全、修繕性、交換部材、failure modeを記録する。

法務・信用・決済railもnode外部依存である。専門家調査を要する未確定の法務tailは、金額を確定債務として先に固定せず、専門家稼働によって観測・分解・圧縮すべきUNKNOWNとして扱う。

## 3. 既存repositoryを同じ地図へ載せる

| Layer | Repository / system | 現在の役割 |
|---|---|---|
| Constitution / claims | `ZeroRoomLab-manifest` | World、主張強度、資本・文化・運用境界の正本 |
| Meaning / agent runtime | `SphereOS-Atlantis`, `FQuery`, `IBD` | 文脈、World、実行境界、状態・来歴の扱い |
| Network portability | `fold-nic` | Identity / World / Capabilityを特定cloud・DNSと分離し、transport adapterへ投影 |
| Recovery / exploration credit | `OpenFAPTA` | 回収可能性と未知コモンズの探索余地をM次元ポートフォリオとして扱う汎用マーチャントエンジン設計。現行codeはPython toy |
| Physical microgrid | sneaker-grid 0.1.x / well / water / fabrication | 電力・水・工作など、cash dependencyを物理serviceへ変換するfield layer |
| Open hardware | 3DP water parts, `commonsATX`, 800-series, future OSH | 修繕・再生産可能性とlocal fabrication |
| Media / human interface | OND800 / OpenRVC / 800-series | node内の表現、制作、身体・文化活動をlife supportから文明へ拡張 |
| Funding / legal | Non-Exclusive Seed Steward / Patient Capital | upstreamを囲い込まず、探索・法務・公開・物理基盤の条件を支える |

**2026-10-19現在：** 発電設備は財布ペインで差し押さえ後。電動バイク「縄文エンジェル」用LiFePO4を自転車運搬するスニーカーグリッド0.1.xで、生存・通信・ロビー・NSFW動画配信のみ縮小運転し、研究設備は全面停止中。microgrid・compute・fabricationを一体稼働済みとは扱わない。[訂正済み現場報告](../projects/2026-10-15-offgrid-30days-field-report.ja.md)。

この表はruntime dependency graphではない。各repositoryのREADMEに記載された実装状態を優先し、未実装機能を上位narrativeからbackfillしない。

## 4. Fold NIC

Fold NICはFAOC node間の「誰 / どのWorld / 何ができる / どこへ運ぶ」を、単一cloudやDNS authorityと同一視しないnetwork境界として位置づける。

現状はStage 0 partialであり、`.fold` resolver、公開P2P discovery、複数node replication等は完成扱いしない。FAOCの完成networkであるとは主張しない。

## 5. OpenFAPTA

OpenFAPTAは、回収可能性と未知コモンズの探索フロンティアを発見・登録・試行・再評価して信用創造を支える、オープンで汎用的なマーチャントエンジンである。利用者がFoldの接続・分離・階層、面積測度、評価単位、配分policyを選び、個人・共同体・発行母体へ同じ構成原理を展開する。

2026-10-21に作者が用途を明確化した。未来予測だけでなく、実際のリトライで未知を埋め、新たな未知・回収経路・探索範囲を発見するポートフォリオ管理として位置付ける。探索範囲の拡大・ボラの変化と、他Foldの資源消耗・重複計上を別軸で追う。交換単位、通貨、残高、決済、帳簿は外部実装へ委ねる。

責務・用語の日本語正本は[OpenFAPTAマーチャントエンジン設計](https://github.com/saitoomituru/OpenFAPTA/blob/main/docs/theory/merchant-engine.ja.md)、[en-US参照写本](https://github.com/saitoomituru/OpenFAPTA/blob/main/docs/theory/merchant-engine.en-US.md)。本mapは接続要約だけを持つ。現行Pythonは資源activation、台帳可視性、未知benefit・探索状態のtoyであり、汎用チャート／永続リトライ管理／決済adapterは設計・実装課題である。

```text
FIAT balance != whole resource state
accounting zero != physical absence
unknown benefit != zero
belief != physical proof
```

井戸、土地、修繕技能、余剰電力、遊休設備、贈与、地域の実行力などは「円換算不能だからゼロ」とはしない。一方、それらが存在するだけで利用可能・安全・合法・十分とも判定しない。`activation`の考え方を使い、物理在庫、利用許可、維持者、変換路、時期が交差して初めてusable resourceとして観測する。

## 6. 資本の流れ

真ニートホワイトペーパーの二層モデルをnode architectureへ写像する。

```text
Patient Capital / Impact Patron
  -> legal discovery / commons / field infrastructure / OSH publication
  -> FAOC node gains reproducible capability
  -> node can fork / apprentice / noren-wake
  -> commercial sidecars may deploy around the commons
  -> upstream commons is not purchased by downstream capital
```

支援額はupstreamの票ではない。法務tailの調査費用、OSHのCAD/large-file公開、試験、microgrid、水、通信、compute等は「研究の外側の雑費」ではなくnodeを成立させる研究インフラとして扱う。

## 7. Sponsor milestoneとの接続

GitHub Sponsorsの月額合計 `$1,000` は、完成したFAOCを販売する価格ではなく、OSH公開能力を一段上げるresource gateとして扱う。CAD/STL/3MF、試験receipt、revision、large-file storage / delivery等へ予算を割り当てられる状態を目標にする。

従量課金serviceは利用可能な決済railを別途要求する場合があるため、cash fundingとpayment capabilityは別gateである。カード取得や法務tail解消を成果保証しない。固定価格、prepaid、self-host、donated capacity等のbranchも残す。

## 8. 次の実証単位

最初から「村OS完成」をclaimしない。小さいreceiptを積む。

- water node: eligibleな3DP部品のinventory、CAD source、用途境界、material/process、failure receipt
- power node: generation / storage / load / autonomy window / external dependency map
- network node: Fold NIC Stage 0の二process object exchangeとprovenance
- resource / credit node: OpenFAPTAのresource activation toyを入口に、回収候補の再試行・探索フロンティア・他Fold資源消耗の比較fixtureを設計する
- governance node: 祠単位Git管理 / 暖簾分け時のauthority、license、provenance境界
- legal node: UNKNOWNを専門家相談で一件ずつ確定状態へ落とす

## 9. 成功条件

成功は「金を使わないこと」でも「中央組織を破壊すること」でもない。

**一つの市場、一つの雇用主、一つのutility、一つのcloud、一つの決済rail、一つのauthorityが落ちても、局所nodeが安全に縮退し、修繕・fork・再接続できること。**

それを、物理・情報・文化・資本の各layerで検証可能なreceiptとして残すことが、このarchitectureの研究目的である。
