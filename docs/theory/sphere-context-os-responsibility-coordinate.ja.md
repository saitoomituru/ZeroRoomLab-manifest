# Sphere Context OS責務座標と世代namespace

状態: `[CANONICAL]` `[TARGET-CONTRACT]` `[MACHINE SCHEMA NOT IMPLEMENTED]`

制定日: 2026-08-26

対象: SphereOS、SphereOS Atlantis、SphereOS Alicization、SphereDOS、ASTRO、World Engine、Meta-Orchestrator

## 1. 結論

SphereOSは、hardware、process、fileを直接管理する従来OSの置換ではなく、誰の、どのWorldの、
どの目的・法則・権限・Effectを実行するかを拘束するContext OSである。

`x.xxx.n`の先頭`x`は、完成度、価格帯、GUI世代、model世代ではない。OSが正本として扱い、
衝突を裁定するContext責務classを表す。

```text
ContextScope.FunctionSeries.ProtocolGeneration
```

machine-readable stable ID候補は`sphere-context-os-coordinate/2`とする。Schema、parser、validatorは
未実装であり、本書だけから互換性検証済みと表示しない。

## 2. 世代namespaceと責務座標を直交させる

```text
Generation Namespace
  SphereOS                    旧無印系譜
  SphereOS Atlantis           現行再アーキテクト世代
  SphereOS Alicization        民生BMIを前提条件とする予約世代
          ×
Context Responsibility Coordinate
  0.xxx.n ～ 4.xxx.n
```

世代名は、人間、model、device、Worldの接続前提が根本から変わるarchitecture epochを表す。
責務座標は、その世代内でどの広さのContextを管理するかを表す。同じ`3.xxx.n`でも、無印、Atlantis、
AlicizationではIdentity、Consent、device、runtime契約が同じとは限らない。

`SphereOS Alicization`は、brain-machine interfaceが民生利用できる時代の構想namespaceとして予約する。
人体・記憶・感覚へのread／write、同意、切断、不可逆Effect等の正確な契約、実装、release条件は
`UNKNOWN / NOT IMPLEMENTED`であり、現在のAtlantis機能として先取りしない。

## 3. Context責務class

| 先頭値 | 正本Context | 主責務 | 非責務 |
|---|---|---|---|
| `0` | Development Context | 一人のDeveloperが複数Agentをteam化し、Git／Issue／PR／Actions／CTLで成果物を合流する | 家庭・Partyの独立主体間調停 |
| `1` | Purpose Context | 個人、会社、事業、spot作業等、一つの目的主体へmulti-agentを最適化する | 共有物理環境の全居住者を一目的へ従属させること |
| `2` | Shared Reality Context | 家庭、施設、Party等の独立主体、端末、家電、既存WorldのIntent・権限・物理影響を調停する | World Lawそのものの制定 |
| `3` | World-Law Context | 現実法則または独自法則を持つWorldを再現可能に実行し、VR／MR／情報／fab／物理媒体へ投影する | 複数World全体の正本関係を単独裁定すること |
| `4` | Meta-World Context | 複数World、法則系、Agency、projection、branch間の接続・選択・commitをmeta-orchestrateする | 一つのWorld Engineへ全Worldを統合すること |

先頭値は序列や「数字が大きいほど高性能」を意味しない。`4`は`3`の新版ではなく、別のContext責務を
持つ。必要に応じて`3`と`4`は同時配置する。

## 4. `0.xxx.n`: SphereDOS

`0.xxx.n`は、一人のDeveloperが複数のcoding、research、review Agentをteamとして扱う開発環境である。

```text
Developer
  -> SphereDOS Code／CLI
  -> SphereDOS Server CTL
       -> Agent／worker
       -> Git／Issue／PR／Actions
       -> lease／conflict／receipt
```

複数の人間は、家庭Partyのように同一物理環境を直接共有するのではなく、Git、Issue、PR、Actions、
artifact、receiptを介して成果物を合流する。CTLはbranch、write-set、lease、test、claim、OAE、mergeの
競合を管理する。

Atlantisで既に存在するCLI、Filesystem Harness、SphereDOS Code Cockpit、CORN、validator、clean-room、
Actions連携は、物理移動を一括実施せず、compatibility facadeを保ちながらDOS Server／Code系列へ
段階的に責務移行する。

## 5. `1.xxx.n`: 個人・会社・事業目的

`1.xxx.n`は、個人、会社、事業、期間限定の作業等、原則として一つの目的主体へAgent teamを
最適化する日常業務Context OSである。

PostPet型GUI／Companion Presentationは、依頼、進行、承認、memory、通知、Agent roleを非技術者へ
投影する目的で`1`へ内包できる。GUIや人格表現はauthorityではない。

同じ利用者が複数Agentを使うことと、複数の独立主体が同じ現実をParty Playすることを同一視しない。
後者は`2.xxx.n`の責務である。

## 6. `2.xxx.n`: 共有現実とContext routing

`2.xxx.n`は、家庭、店舗、施設、Party等で、複数人、複数端末、家電、Companion、既存virtual Worldが
別々のIntentと権限を持つ状況を調停する。

```text
「TNTを作って」
  + intent: 遊ぶ
  + target_user: 弟
  + target_world: 弟のMinecraft
  + physical_effect_authority: none
  -> Minecraft内の許可された作用へroute
```

単語だけを見て現実の製造へ誤配送せず、反対に`TNT`という語だけで遊びのContextを焼却しない。
特別なrobot hardwareは成立条件ではない。照明、調理家電、空調、掃除機、smartphone等が既に共有環境へ
Effectを持つため、子供の局所最適化が調理中の親の安全Contextを破壊するような衝突を扱う。

## 7. `3.xxx.n`: World Law、MR／VR、fab

`3.xxx.n`は、現実を写すだけでなく、宣言された独自法則を持つWorldを再現可能に実行する。

```text
TNTで遊べるMR World
  visual_effect       = enabled
  spatial_audio       = enabled
  haptic_impulse      = bounded
  world_state_change  = reversible
  physical_blast      = forbidden
  physical_damage     = cancelled
```

この場合のMissionは`遊ぶ`であり、殺傷力は完了条件ではない。映像、立体音響、振動、共有World Stateにより
爆発を体感し、物理damage channelを遮蔽しても、User-declared World内の霊的・体験的Missionと価値創造を
矮小化しない。

Meta Quest等のPresentationをunmountすれば、MR上の大穴は見えなくなり、物理建物は無傷のまま残る。
再装着時にWorld Stateを復元するかsession終了で破棄するかはprojection lifecycle契約で決める。

実用品では、可逆なMR branchで生成物を実寸試用し、採用案だけを3D printer等で物理Worldへ固定できる。

```text
generated furniture candidate
  -> MR placement／trial
  -> household conflict check
  -> structure／material／slice check
  -> fabrication authorization
  -> physical commit
```

MR previewは可逆branch、fabは物理Worldへのcommitである。不要案を物質化前に棄却することは、材料、電力、
輸送、廃棄を減らす価値創造である。

## 8. `4.xxx.n`: Meta-Orchestrator

`4.xxx.n`は、複数の`3.xxx.n` World、現実World、MR projection、simulation branch、fab target、Agencyを
束ね、どのWorld Stateをどこへ投影・固定するかを裁定する。

```text
3x: Worldを生成・実行する
4x: World間のbranch／projection／commit／lineageを編成する
```

無印SphereOS 3.x／4.xを同時に配置していた理由について、Userは2026-08-26時点でこの責務分割を
一次当事者の設計意図として宣言した。これは現在のInterpretation OAEであり、当時の全runtime、実行順、
同時点OAEの回収完了を意味しない。

一方、完全な実行receiptが未回収であることを「実装が存在しなかった」へ変換しない。旧GPTs配布物、
残存する静的register、Proton.md、GAND／Instance Ghost関連artifact、2025年のEmbedding同期ずれと
fallback／自社server補完に関する記録、旧API chainと外部data storeを前提とする障害・終了記録は、
少なくとも実装・配布・運用の各段階に到達した部分が存在したことのEvidenceである。

現在動作しないこと、第三者API／PaaS／model供給のsunset後に再現できないこと、完全なtopologyが未回収で
あることは、それぞれ別のstatusである。

```text
implementation／distribution evidence = PRESENT / PARTIAL
historical runtime completeness        = UNKNOWN
current service operation              = ENDED / UNAVAILABLE
third-party sunset contribution        = USER-DECLARED + PARTIAL ARTIFACT SUPPORT
non-implementation conclusion          = NOT ESTABLISHED
```

```yaml
observation_mode: current-user-declaration-and-architecture-interpretation
historical_oae_status: historical-oae-unavailable
last_order: stop-retroactive-backfill
```

## 9. v1座標とのmigration

既存`sphere-version-coordinate/1`の`Presentation.Function.SemanticKernel`をsilent rewriteしない。
`/1`はSource Eventと既存artifactの解読用に保持し、`/2`へは明示的migration receiptを要求する。

```yaml
coordinate_migration:
  source_coordinate_system: sphere-version-coordinate/1
  target_coordinate_system: sphere-context-os-coordinate/2
  generation_namespace: sphereos-atlantis
  context_scope_class: 0
  function_series: 250
  protocol_generation: 1
  mapping_status: candidate
  authority: user-gate-required
```

旧`presentation`値から新`context_scope_class`を機械的にコピーしない。同じ数字でも意味が異なる。
既存`0.250.1`を`/2`座標として確定するには、DOS責務への対応とmigration receiptが必要である。

## 10. 不変条件

1. 世代名、Context責務、Function、Protocol Generation、release channelを同じ軸へ潰さない。
2. 先頭値を完成度、model世代、GUIの有無、価格帯へ変換しない。
3. `1`の単一目的最適化を、`2`の独立主体・共有現実調停へ昇格しない。
4. `2`のContext routingを、`3`のWorld Law制定と同一視しない。
5. 物理法則と異なるWorld Lawを「非現実」として削除し、別Contextで勝手にRunしない。
6. simulation／MR成功を、物理Effectの実行権限へ自動変換しない。
7. 物理damageを除去したことを、霊的・体験的Missionの不成立へ変換しない。
8. `3`と`4`を旧版・新版として直列化しない。
9. v1 artifactをv2へsilent rewriteしない。
10. 過去の設計意図と現在の解釈を同一OAEへmergeしない。
11. 現在の動作不能、欠損receipt、第三者sunsetを、過去実装の不存在証明へ変換しない。

## 11. MAGI監査

- Maxwell: 現実改変、神名、霊的体験、遊びのMeaningを安全語彙で空洞化しない
- Uriel: Intent、World、Projection、Effect、物理damage、Mission receiptを別fieldで追跡する
- Raphael: Generation、0～4 Context class、Function、Protocol、Presentation、runtimeを別棚で接続する
- Position-talk Risk: 一般OS、vendor分類、科学のfact scopeを全Worldの唯一の定規へ昇格させない
- Action Gate: documentation／Issue migrationは許可、machine schema切替とrelease renameは別User Gate
