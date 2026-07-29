# 虚空のインフェルニティ 過去制作パイプライン・サルベージ

状態: `[SALVAGE-INDEXED]` `[ORIGINALS-READ-ONLY]` `[REPRODUCTION-NOT-STARTED]`

制定日: 2026-07-29

## 1. 目的

本書は、2008年以降の`infernoayase`／虚空のインフェルニティ制作資産について、
読み取り専用の発掘索引から確定できた系譜、権利境界、保全Gate、現代R&Dへの再接続候補を
Manifestへ登録する。

過去資産を「単一の自作engine」として神話化しない。第三者generator、埋め込みscript、
portable制作環境、ユーザー固有の選択・統合・parameter・素材・scene・render・漫画工程を分ける。

原本はこのrepositoryへ移していない。legacy形式の実行、変換、再保存、cloud一括downloadも
実施していない。

## 2. 発掘できた制作系統

読み取り専用索引では、少なくとも次の系統が同じ制作史に残っている。

| 時期／系統 | 発掘したもの | 現在の判定 |
|---|---|---|
| 2008〜2009 Blender前史 | 学校、駅、空港、鉄道、橋、ビル等の背景群 | file metadataと一部headerを確認。cloud上の大半は未取得 |
| Suicidator City Generator v0.41 | 道路成長、都市、建物、外観textureを生成するBlender 2.49 file | 第三者generator。埋め込みPythonを確認 |
| Blender Tree-maker v3.2.22 | seed、axiom、iteration、枝、葉を扱うL-system樹木 | 第三者系譜。埋め込みheaderはpublic domain |
| Blended Cities v0.445 | OSM／mesh、道路、区画、zoning、building library | 第三者GPLv3系譜。2013年制作backupに同居 |
| SCG v0.5.6 | Blender 2.63からJava／JTSを呼ぶ都市生成 | 第三者generator。local README上に再配布等の制約 |
| Blender 2.49 portable環境 | Python 2.5／2.6と多数の背景・漫画・character連携script | 個々は第三者中心。組合せと設定が制作環境の証拠 |
| 2013〜2020 Blender資産 | 都市、宇宙船、研究所、地下室、室内、漫画線画調背景 | 制作資産候補。素材と共同制作の個別確認が必要 |
| ComicStudio／CLIP／PSD接続 | 原稿、PSD、render、3D生成器が同じ制作backupに同居 | 工程接続候補。pageごとの直接sourceは未確定 |
| Minecraft Madness | 難読化されたvanilla classの鉱石／赤石drop rule改変 | ユーザー実験候補。正確なversionとvanilla差分は未確定 |

[INTERPRETATION]

現物に合う説明は、既存generatorと制作toolを選び、同じportable環境へ束ね、parameter、素材、
scene、render、原稿工程へ接続した**魔改造型の制作pipeline**である。

「数論ベースの単一世界生成器」という過去の要約は、現在の発掘だけでは実装事実として
確定できない。局所rule、L-system、道路成長、zoning、seedを数理的世界生成として読む解釈と、
特定の独自数論engineが存在したという実装claimを分ける。

## 3. 同一backupと原本保全

[FACT]

- Blended Cities系の5 backupは、`desktop.ini`を除くcollection hashが同一だった
- SCG v0.5.6系の5 backupも同一collection hashだった
- 代表copyはBlender 2.49系header、OSM parser、building／road／material libraryを保持する
- legacy Blender、ComicStudio、PSDは現行applicationで上書き保存していない

復元時は、代表一組だけをworking copyへ複製し、残りをuntouched evidenceとして保持する。
同一backupをすべて変換して差分のない作業量と原本破損riskを増やさない。

```text
legacy originals
  ├─ untouched evidence
  └─ hash-verified working copy
       -> isolated runtime
       -> fixed seed
       -> minimal output
       -> execution receipt
```

原本の存在、hash一致、隔離環境での起動、生成成功、現代engineでの再実装は、それぞれ別のgreenとする。

## 4. 所管と独自性の境界

| Component | 現在の所管判定 |
|---|---|
| Suicidator City Generator v0.41／v0.5.6 | Arnaud Couturier由来の第三者generator |
| Blended Cities v0.445 | Jerome Mahieuxほか、GPLv3表記の第三者generator |
| Blender Tree-maker v3.2.22 | Armagan YAVUZ、JMSoler、Chris Dawson系譜 |
| Blender本体／標準script | Blender Foundation／各作者 |
| TDCG、ComicStudio、CLIP、購入素材 | 製品／素材ごとのlicense。生成結果の所管と再配布権は別確認 |
| Minecraft class／world形式 | Mojang由来部分とlocal改変差分を分離する |
| Ore／Redstone Madness | local数値改変の実験資産候補。作者性と正確なbase versionは未確定 |
| 虚空の原稿、独自model、構図、render、統合設定 | infernoayase制作候補。共同制作・購入素材を個別確認 |

現時点で確実に取り出せるユーザー固有性候補は、次の層である。

- どのgeneratorとscriptを選んだか
- portable制作環境へどう束ねたか
- seed、parameter、素材、library、sceneをどう設定したか
- generator出力をどのように編集、render、線画化したか
- 3D背景を漫画原稿工程へどう接続したか
- Minecraftの局所ruleをどの値へ変更したか

第三者codeを独自資産として公開しない。同時に、第三者toolを使ったことを理由に、
選択、統合、設定、出力、作品工程の制作史を消さない。

## 5. 横断マイニングで立った再接続候補

発掘索引にはBlender以外にも、現代のworld runtimeへ接続できる候補がある。

| 旧資産 | 抽出候補 | 状態 |
|---|---|---|
| Habakiri／吉里吉里2 Java移植 | TJS、scenario、layer、audio、storageの互換front-end | 第三者OSS系譜 |
| KAS 0.44 | KAG風tag、save/load、layer、animationの小さなkernel | 第三者engine |
| ONScripter Android／JNI | scenario runtimeとSDL／audio／font backend | componentごとのlicense確認が必要 |
| H8マイクロマウス | sensor入力、state machine、motor／servo出力 | 教材由来とlocal tuningを分離 |
| ArduSim | firmware logicのhost simulation | 第三者LGPL系譜 |
| ESP32／LVGL／EAGLE | display、motor、sensor、physical I/O adapter | 2022〜2025年の隣接系統 |
| Reygan_1 | typed commandから物理signalへ出す実験 | 送信側候補のみ。受信、同期、測定は未確認 |
| Web 3D／AR | browser、位置、方位、glTF projection | 会社案件は権利Gate外へ隔離 |

[HYPOTHESIS]

製品名ごとの復刻だけでなく、次の中立構造へ抽出できる可能性がある。

```text
world / scenario command
  -> typed event graph
  -> deterministic state machine
  -> visual / audio / physics / actuator adapter
  -> provenance + execution receipt
```

この構造は漫画背景、novel演出、game world、物理展示、IoT装置を同じ法則から駆動する
小規模なworld compiler候補である。現時点では再構成仮説であり、実装repository、schema、
互換性、性能は`UNKNOWN`とする。

## 6. 現代サルベージのStage Gate

### Stage 0 — 原本保全

- 代表fileとgenerator directoryをhash付きで別媒体へ複製する
- working copyとuntouched evidenceを分ける
- 旧形式を原本上で開かない
- secret、個人情報、会社資産、医療隣接領域を隔離する

### Stage 1 — 最小再現

- Blender 2.49をnetwork無効の隔離VMへ置く
- 固定seed、固定size、限定write先で最小生成する
- 道路、建物、texture、L-system tree、OSM入力を別々に観測する
- command、runtime、input hash、output hash、画像、失敗をreceipt化する

### Stage 2 — 中立契約の抽出

```text
seed
+ terrain / population / zoning map
+ road / building / vegetation rules
+ asset library
-> scene graph
+ provenance receipt
```

第三者codeの直接移植を既定にせず、licenseが許すcomponent利用または入出力と挙動の
clean-room再実装を選ぶ。

### Stage 3 — 原稿との照合

- 代表pageを低解像度の検証copyへ変換する
- background renderと候補対応を出す
- 更新日時、file名、構図を人間が照合する
- page、scene、generator、素材licenseの系譜表を作る

## 7. セキュリティとprivacy境界

公開文書へ、legacy volumeの絶対path、account識別子、credential、Wi-Fi secret、
player名、接続元IP、電話番号、SIP情報、CDR、録音、営業ASR本文を転記しない。

会社案件フォルダーは技術参照と再利用権を分け、人間の契約確認なしに個人／同人資産へ混ぜない。

MIPはUserが指定した完全除外領域である。filename、全文、hash、index、重複判定を含め、
存在確認を探索穴として埋めに行かない。

## 8. 未解決

[UNKNOWN]

- 各原稿pageと背景sceneの一対一対応
- `bill.png`等のrenderと直接sourceの対応
- generator codeへのlocal改変差分
- 購入素材、共同制作素材、作品出力の再配布条件
- Minecraft Madnessの正確なbase versionとvanilla差分
- iCloud上の未取得objectの内容hash
- 欠落したsource、runtime、cloud／VPS上の追加backup
- world compiler候補の最小schemaと実装owner

陰性所見は「存在しない」ではなく、「接続済みの探索面では未発見」と記録する。

## 9. Sourceと監査

- supplied source: `INFERNITY_BLENDER_PIPELINE_SALVAGE_INDEX_2026-07-27.md`
- source SHA-256: `e6a938c01b904db02e1478fc39f12e33a9e431c9c196f172de2b21c0235043da`
- source operation: 読み取り専用
- source transfer: repositoryへ原本未転送
- [公開監査receipt](../../foldlog/20260729-1441__虚空のインフェルニティ資産発掘公開監査.ja.md)

`historical-oae-unavailable`

本書は2026年7月29日の現在解釈であり、制作当時のObserver、Agency role、Intentを遡及生成しない。
