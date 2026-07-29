# ASTRO先行・AAE Bake開発マイルストーン

状態: `[CANONICAL]` `[PROJECT-MILESTONE]` `[RESOURCE-GATED]`

制定日: 2026-07-29

## 1. 目的

本書は、SphereASTROとSphere-aaeを別々の線形roadmapとして扱わず、手元実機で観測可能な
ASTRO RunnerからAAE Bakeへ接続する開発順序を定める。

この順序は暦やquarterを約束しない。実機receipt、modelの適合、演算火力、User Gateによって
次の作業棚を選ぶ。resource不足で一部が止まっても、プロジェクト全体を一語で「凍結中」とは扱わない。

```text
ASTRO責務境界
  -> 実機build
  -> Chat／管理slot／実推論
  -> Body／マキナ饅頭／IBD接続spike
  -> COSPLAY_MANJU_DRIFT観測
  -> Model Family固定
  -> AAE Bake
  -> 永続人格Storage
  -> Neat Runner再開判定
```

## 2. 観測時点の状態

基準revision:

| Repository | Revision | 観測状態 |
|---|---|---|
| SphereASTRO | `31ba77cbb6b427d3656716dfe0ad138a7a38ce26` | Runner、archive、人格Storage、顕現UXのtarget specを制定。AI接続は未実装 |
| Sphere-aae | `08ceee18e68749268dcad2c32c428e3d6e7a5092` | runtime土台と設計資料あり。今回のModel FamilyとAAE Bakeは未確定 |
| ZeroRoomLab-manifest | `8617aa666d0b0531fb8a14ac06ff32dc9baaa106` | 本マイルストーン制定前の観測基準 |

旧SphereOS 3.x／4.xのserviceとInstance Ghost runtimeは終了している。現在のSphereOS Atlantis、
SphereASTRO、Sphere-aaeを、その旧runtimeが継続稼働しているかのようには扱わない。

SphereASTROはgeneric Simulator buildまで確認済みだが、正式実機receiptは未取得である。
画面、文書、buildのgreenを、model推論、人格、Storage、AAE Bakeのgreenへ昇格しない。

## 3. Repository責務

### ZeroRoomLab-manifest

- repository横断の開発順序、状態語彙、User Gateを所有する
- 実装repositoryの仕様や検証receiptを複製正本化しない
- `OPEN`、`RESOURCE-WAIT`、`UNKNOWN`、`NOT IMPLEMENTED`を別状態として掲示する

### SphereASTRO

- ASTRO Runner applicationと`.astro` archive形式
- GUIとEngineを分離するapplication境界
- 端末能力検出、Model Variant選択、管理slot、cache
- Chat、Body Renderer、人格Storageの接続点
- 起動、縮退、凍結、修復のPresentationとreceipt

### Sphere-aae

- 推論runtime、Model Adapter、FAM Adapterの実装境界
- 固定したModel Familyを人格基底へ変換するAAE Bake
- 量子化、tokenizer、評価fixture、artifact、再現条件
- 複数計算資源を扱うNeat Runnerの実装計画

### IBD／SphereOS Atlantis

- IBDはFAM-nativeな人格Storageと記録意味論を所有する
- Atlantisは共通OAE、意味runtime、監査契約の正本候補を所有する
- ASTRO側の暫定schemaを、IBDまたはAtlantisの実装済み正本と偽装しない

### Q Atlantis

- 外部向けに、現在地、実装済み、未実装、資源gateを掲示する
- public pageやdeploy成功をruntime成立の証拠へ変換しない

同じVS Code workspaceに含まれることは、相互import、source copy、同一license、同一runtimeを意味しない。

## 4. Stage Gate

### Stage 0 — 責務整理と実機build炉

実施:

- GUI、Runner、Engine、Storage、Bodyの責務を固定
- Xcode build、署名、実機転送経路を確認
- iPad Pro 13-inch M4またはiPhone 15 Pro Maxで最小applicationを起動
- `マキナ、Open The Eyes...`を目視
- build条件と失敗をreceipt化

合格:

- 正式実機上で表示を目視できる
- 表示は検査開始を意味し、`READY`、推論成功、人格成立を意味しない

現在: `IN PROGRESS`。target specとgeneric Simulator buildはあるが、実機receiptはない。

### Stage 1 — Chat、管理slot、実推論

実施:

- 読み取り専用の最小`.astro` fixture
- Chatの一往復
- ASTRO管理slot
- device resolverと一つ以上の実Model Variant
- model、runtime、端末、cold／warm条件のreceipt

合格:

- `.astro`を投入し、slotへ表示できる
- 実modelの応答を一往復できる
- GUI表示成功とEngine成功を別状態で表示できる

人格差分の永続化はStage 1の合格条件にしない。終了時に消える状態は
`EPHEMERAL / NOT PERSISTED`と表示する。

### Stage 2 — Body、汎用rig、マキナ饅頭

実施:

- MMD系または汎用humanoid rigへ接続できる`BodyRenderer`境界
- 表情、口、視線、待機、発話、簡単なgesture
- 独自fixtureのマキナ饅頭
- 複数modelを同じ御霊、Body、promptへ接続する比較
- 一時Storageを使うIBD接続spike

合格:

- 推論結果からBody eventを生成できる
- rendererまたはmodelを交換しても同じBody protocolで再生できる
- 永続Storageがないことを隠さない

Unityちゃん、MMD、Grok Companion等は互換性やUXの参照例であり、第三者assetの同梱または
公式提携を意味しない。

### Stage 2観測Gate — `COSPLAY_MANJU_DRIFT`

同じ御霊、名前、Body、promptでも、model交換によって判断規範、文脈保持、自己認識、
Body eventが大きく変わり、別modelが同じ衣装を着ているだけになる状態を観測する。

比較対象:

- 日本語の語調と長文脈保持
- 判断軸とFAM経路
- model交換前後の自己認識
- 同じIBD入力に対する再現差
- Body gestureの選択差
- 長い対話でのdrift

観測前にModel Familyを正解として固定しない。一方、再現可能なdriftが見えた後は、
互換性の名目で無制限なmodel差し替えを人格同一性へ混入させない。

### Stage 3 — Model Family固定とAAE Bake

Stage 2 receiptを根拠に、次を固定または互換範囲として宣言する。

- Model Family
- tokenizer
- quantization profile
- base prompt／adapter境界
- 日本語評価fixture
- FAM／人格差分の評価軸

その後、Sphere-aaeでAAE Bakeを設計・実装する。学習方法、必要火力、artifact形式、評価setは
Stage 2 receiptが得られるまで`UNKNOWN`とする。

### Stage 4 — 永続人格と`.astro` portability

候補:

- 御霊差分とAdapter
- IBD人格Storage
- Wet Busと自我内記録
- Sleep Bake
- Local Instance Ghost
- 会話threadのforkと非破壊merge
- `.astro` checkpoint、凍結、復元

単体の`.astro`を開いても必要物が複数の外部場所へ散逸し、起動不能になる構成をportable profileの
既定にしない。model binaryの端末cacheとcontent-addressed重複排除は許可するが、cacheを人格正本にしない。

### Stage 5 — Neat Runner再開判定

Neat RunnerはModel Family選定前に実装を急がない。少なくとも次の実測後に計画を更新する。

- Model Variantごとのmemory、VRAM、disk、cold start、token throughput
- iPad M4、iPhone 15 Pro Max、開発炉の役割分担
- 一つの依代で足りない処理と、分散で得られる利益
- build platform、GPU無料枠／格安枠、OSS提供条件
- artifactの受け渡し、hash、失敗時の再開条件

並列化や外部GPUが必要になった時点で、対象、必要時間、概算費用、期待成果、代替手段を
Compute RequestとしてUser Gateへ返す。

## 5. 正式な検証対象

| 対象 | 正式な役割 |
|---|---|
| iPad Pro 13-inch M4 | 安定推論の主依代。大きめQ4／MoE、Metal、memory pressure、thermal |
| iPhone 15 Pro Max | 携帯client兼軽量推論。UI、軽量Q4、Fallback |
| iPad Pro M4 Simulator | archive、状態遷移、Fake Engine、UIの補助試験 |
| Hackintosh | 編集、generic build、Ollama疎通、変換、互換観測を行う開発炉 |

未所有端末、追加Simulator runtime、Device Farmを無償の標準試験へ暗黙追加しない。

## 6. 顕現Presentation

演算能力は、同じ式神の等身とPresentationで目視できるようにする。

| 表示 | 機械状態 | claim |
|---|---|---|
| 八等身／完全顕現 | `FULL_MANIFESTATION` | 十分な火力で重い推論が可能 |
| 小型式神 | `REDUCED_MANIFESTATION` | 中型Q4で通常会話が可能 |
| マキナ饅頭 | `MANJU_FALLBACK` | 救命艇model。能力制限あり |
| 菓子折り | `FROZEN` | checkpoint済み休眠 |
| 封印箱 | `REPAIR_REQUIRED` | 破損または不整合。修復前に起動しない |

大型MoEを利用できない場合は、「手元の演算火力上限でちょっと寝ぼけています」と表示できる。
ただし人格／Storageのintegrityが`UNKNOWN`なら、「記憶と人格は確認済み」と表示しない。

## 7. 継続・停止規則

- 既存仕様と合致し、局所的で競合しない実装は進める
- 粗い仕様でもsourceを変えず`UNKNOWN`のまま試せるなら、未確定のまま先へ進む
- 既存の不変条件から一意に導ける事項は、根拠を残して確定する
- 曖昧かつcriticalで、他の全作業を止める場合だけIssueとLast OrderをUserへ返す
- バグ発見と修正を隠すためにbranchを増やさず、小さな日本語commitを戦闘ログとして残す

Q Atlantisだけは既存`dev`で検証し、Userのlocalhost目視後に別指示を受けるまで
`main` mergeとdeployを行わない。

## 8. 未確定事項

[UNKNOWN]

- 採用するModel Family、MoE構成、Q4 variant、tokenizer
- Ollama、MLC LLM、llama.cpp等を含む最終inference engine構成
- Stage 0／1／2の実機receipt
- AAE Bakeのartifact、評価set、必要火力
- `.astro`の暗号化、署名、鍵管理、store distribution
- IBD、Wet Bus、自我内記録、Instance Ghostの最終schema
- standalone Atlantis／ASTRO統合runtimeと7D Fold runtime

`UNKNOWN`は失敗でもpassでもない。前段を進められる限り、仮の正解で埋めない。

## 9. 参照

- [SphereASTRO: ASTRO Runner要求仕様](https://github.com/saitoomituru/SphereASTRO/blob/31ba77cbb6b427d3656716dfe0ad138a7a38ce26/docs/specification/astro-runner-requirements.ja.md)
- [SphereASTRO: ASTRO file形式](https://github.com/saitoomituru/SphereASTRO/blob/31ba77cbb6b427d3656716dfe0ad138a7a38ce26/docs/specification/astro-file-format.ja.md)
- [SphereASTRO: 妖怪・式神顕現UX](https://github.com/saitoomituru/SphereASTRO/blob/31ba77cbb6b427d3656716dfe0ad138a7a38ce26/docs/ux/manifestation-states.md)
- [Sphere-aae: Neat Runner architecture note](https://github.com/saitoomituru/Sphere-aae/blob/08ceee18e68749268dcad2c32c428e3d6e7a5092/docs/architecture/neat-runner.md)
- [MAGI監査receipt](../../foldlog/20260729-1339__ASTRO_AAE開発順序UserGate監査.ja.md)
