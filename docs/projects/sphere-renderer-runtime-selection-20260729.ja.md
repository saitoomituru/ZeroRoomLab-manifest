# Sphere Renderer／World Runtime横断選定 2026-07-29

> Status: `[TARGET-SPEC]` `[ALPHA-CANDIDATE]` `[CROSS-REPOSITORY]`
>
> 制定日: 2026-07-29
>
> 対象: ZeroRoomLab-manifest、SphereOS-Atlantis、SphereASTRO

## 1. 決定

Alpha実装へ入る前提の第一候補を、次のように分離する。

```text
SphereASTRO
  = GodotをReference Presentation Runtimeとする

SphereOS Atlantis
  = UPBGEをWorld／物理／scene投影のReference Driver対象とする

交換境界
  = GLB／VRM／ASTRO拡張 + engine-neutral event／state契約
```

これは、GodotまたはUPBGEをSphere全体の普遍的正本へ昇格する決定ではない。ASTROはGUI／身体／AR／XRの実装正本、AtlantisはWorld／Driver契約の正本候補であり、rendererとWorld engineを別責務として扱う。

## 2. Declared Position

本選定は、次を優先する。

- SphereASTROをDesktop、mobile、AR／XRへ展開できるOSS系Reference Runtimeへ収束させる
- AtlantisのWorld Stateをsource of truthとし、UPBGE sceneをprojection／cacheとして扱う
- Blender／UPBGEのasset制作、physics、animation、scene authoring能力をAtlantis側の研究炉として使う
- GLB／VRM資産を特定engineへ囲い込まず、別rendererへ移送できるようにする
- proprietary engineの契約変更や終了で地域World、avatar、assetを同時に失わない
- すべてのengine adapterを同時実装して何も完成しない状態を避ける

## 3. 役割境界

```text
ZeroRoomLab-manifest
  └─ 横断方針、claim boundary、運用・ライセンス・資源制約

SphereOS Atlantis
  ├─ World State
  ├─ World／Entity／scene projection契約
  ├─ USAD SDK
  └─ UPBGE adapter／service境界

SphereASTRO
  ├─ Godot Reference Presentation Runtime
  ├─ Chat／Voice／GUI
  ├─ VRM／GLB／ASTRO Avatar拡張
  ├─ Resource-aware manifestation LOD
  ├─ AR／XR presentation
  └─ GAND Frame SDK仮予約
```

Atlantisは描画engineではない。SphereASTROはWorld Stateのsource of truthではない。UPBGE sceneまたはGodot sceneの描画成功を、World、人格、推論、因果の成功証明へ使用しない。

## 4. SphereASTROのGodot選定

GodotはSphereASTROにおいて、次の理由でReference Runtime第一候補とする。

- OSS runtimeとして配布・改変・fork経路を確保できる
- GLB／glTFを中心としたavatar／scene asset pipelineを構成しやすい
- Desktop、mobile、Web、XR系を一つのPresentation実装から狙える
- 2D PNG、3D饅頭、SD、人型VRMを一つのscene graphで扱える
- resource pressureに応じた意味論的LODをPresentationとして実装しやすい
- proprietary engineを正本に置かず、Unity等は互換adapterとして後置できる

現行Swift／SwiftUI実装を即時廃棄する決定ではない。Alpha移行では、既存iOS fixture、Runner要求、責任境界を保持したまま、Godot Reference Runtimeの最小縦切りを追加して比較する。

## 5. AtlantisのUPBGE選定

UPBGEはAtlantisにおいて、World／scene／physics DriverのReference対象とする。

Atlantis World Stateを正本とし、UPBGEは次を担当する。

- rendering
- physics
- animation
- input
- scene object lifecycleのprojection
- Blender asset authoringからの短い試験経路

UPBGE内sceneをWorld Stateの唯一正本へしない。scene変更をAtlantisへ反映する場合は、Driver契約、authority、receipt、conflict policyを通す。

## 6. USAD SDK

`USAD SDK`の現行展開名は次とする。

> **UPBGE SphereOS Atlantis Driver SDK**

Alpha設計では次に分離する。

```text
USAD Core SDK
  license: Apache-2.0候補
  responsibility:
    - World State projection contract
    - Entity／component mapping
    - command／event／receipt envelope
    - async loader abstraction
    - capability negotiation
    - asset／World manifest参照

USAD for UPBGE
  license: GPL-compatible境界候補
  responsibility:
    - bge／scene／Collection／GameObject binding
    - transform／animation／physics projection
    - input／collision event adapter
    - UPBGE service lifecycle
```

USAD CoreをUPBGEの内部APIへ固定しない。UPBGE adapterが終了しても、Atlantis World StateとCore契約を別engineへ移せることを不変条件とする。

## 7. GAND Frame SDK仮予約

SphereASTRO側のGodot Presentation pipeline名として、過去の式神format／GAND系名称を引き継ぐ候補を予約する。

> **GAND Frame SDK**

現時点の意味は、Godot上でASTROのBodyEvent、Avatar representation、expression、viseme、gaze、gesture、manifestation、diagnostic effectをsceneへ写像するPresentation SDK候補である。

ただし、過去のGAND／式神formatの詳細仕様は未発掘であり、現在の推論から遡及生成しない。

```text
status: HISTORICAL-DATA-MINING-WAIT
historical_oae: historical-oae-unavailable
alpha_action: namespace／interface reservation only
```

過去資料が回収された時点で、名称、field、意味、互換、migrationを比較し、silent rewriteせず採用票を作る。

## 8. AssetとPresentationの交換境界

Alphaでは次を優先する。

```text
canonical transport
  = GLB／glTF 2.0

humanoid semantic profile
  = VRM 1.0

ASTRO extension
  = manifestation LOD／attachment／filling／diagnostic presentation
```

普通のVRM対応環境では標準人型avatarとして読み、ASTRO対応runtimeでは人型、SD、3D饅頭、PNG fallbackを同一character stateから選択できる方向を維持する。

## 9. Alpha縦切り

### SphereASTRO

1. Godot project bootstrap
2. GLB表示
3. VRM互換loaderまたは変換経路のfixture
4. BodyEvent最小bus
5. 人型／3D饅頭／PNG representation切替
6. thermal／KV／context diagnostic fixture
7. mobileまたはdesktop実機1系統
8. AR placementの最小fixture

### SphereOS Atlantis

1. USAD Core contract draft
2. explicit World fixture
3. UPBGE scene projection
4. entity transform round trip
5. command／event／receipt記録
6. authority不明時のwrite停止
7. GLB asset参照
8. adapter停止後もWorld fixtureを読めることの確認

## 10. 未制定・未試験

- Godotの採用version、addon、VRM loader
- mobile／iOS exportの実機条件
- OpenXR／AR adapterの採用範囲
- GAND Frame SDKのhistorical field互換
- USAD wire protocolとprocess境界
- UPBGE adapterの具体的license package境界
- physics stateをAtlantisへ戻すauthorityとconflict resolution
- ASTRO拡張の正式glTF Extension名

これらを実装済みまたは検証済みとして表示しない。

## 11. Position-talk Risk

GodotをOSSだから自動的に正しいと評価せず、UPBGEをGPLだから劣位へ置かない。選定は、SphereASTROの配布PresentationとAtlantisのWorld研究炉で必要な責務が異なることに基づく。

同様に、Unity、Unreal、Web renderer等を禁止しない。将来のadapter候補として残すが、Alpha本線と同時に全対応を要求しない。
