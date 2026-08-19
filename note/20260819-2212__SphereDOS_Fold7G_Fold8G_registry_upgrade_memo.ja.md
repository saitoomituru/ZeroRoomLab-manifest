# SphereDOS Fold7G / Fold8G Registry アップグレードメモ

状態: `[HYPOTHESIS] [RESEARCH] [Layer A/B bridge] [NEEDS-REVISION] [RUNTIME NOT IMPLEMENTED]`  
作成時刻: 2026-08-19T22:12:00+09:00  
対象: Q Atlantis Fold7G / Fold8G研究地図、SphereDOS Atlantis / Archangel Runner、将来のInter-World Protocol  
除外: Fold7G/8G runtime実装済み主張、法的適合判定、各SaaSの内部policy推定、秘密情報の取得

## 0. 目的

Q Atlantis公開ページ `Fold7G・Fold8G研究地図` では、`G`をFold containerのnesting depthとして保持しつつ、Fold7G各G RegistryとFold8G独立契約を未確定としている。

本メモは、SphereDOS Atlantisのmulti-agent / DevOS orchestrationを具体例として、Fold7Gを七段の可搬Context Registry候補へ落とし、Fold8Gを複数World間の接続protocol候補として再整理するための研究入力である。

本メモは既存正本をsilent rewriteしない。公開ページへの採用、stable ID制定、schema固定は別revision / User Gateで行う。

## 1. [FACT] 現在の正本境界

### 1.1 Q Atlantis

公開研究地図は次を維持している。

```text
L: linear transport / execution stack
D: Foldへ畳み込む独立した意味・意図・文脈軸
G: Fold containerを包むnesting depth
```

Fold7Gは七段nested Foldの系譜名であり、旧Trion Bondから少なくとも次の三束を研究素材として保持する。

- Self-State
- Causal Trace
- Normative State

各G Registry、更新則、互換contractは未確定。

Fold8Gは公開ページ上で `independent_contract: unknown`、`runtime: NOT_IMPLEMENTED` とされている。

### 1.2 SphereDOS / Runner

SphereOS-Atlantis Issue #9では、DevOS Runnerを特定AIベンダーへ固定せず、task、state、capability、authority、receipt、provenance、artifact boundaryを管理する方向が整理されている。

Issue #8 Matchboxは分散実行control plane候補であり、Fold8Gそのものではない。

## 2. [HYPOTHESIS] SphereDOS向けFold7G Registry候補

上位から下位へMeaningをRealityへprojectionする七段として、次を候補にする。

```text
G7 World
G6 Position
G5 Causality
G4 Objective / Party
G3 Distribution / Arena
G2 Mission
G1 Reality / Substrate
```

### G7 World

世界、国家、信仰、文化、政治思想、共同体、企業文化、ゲームWorld、TRPG World等の広い意味所属を扱う。

`country = JP` のような法域コードだけへ縮退させない。同じ国家内でも国津神 / 天津神、左派 / 右派、宗派、地域共同体、企業文化等でNormative Worldは異なり得る。複数membershipを許容する。

```yaml
world:
  memberships:
    - civic
    - cultural
    - religious
    - community
    - fictional
  narrative_refs: []
  normative_refs: []
```

World membershipは国籍証明、法的適合、全員一致の倫理を意味しない。

### G6 Position

上位ユーザー、agent、vendor、workspace間で明示された立場、契約、信用、権限、capability、consent、tool slot等を扱う。

```text
capability != authority != contract != identity != endorsement
```

同じPartyへ参加していても、各actorが同一の倫理、同一のcontent consent、同一の実行能力を持つ必要はない。

```text
World membership
!= normative agreement
!= content consent
!= execution authority
!= endorsement
```

拒否は必ずしもfailureではなく、別actorへのreroute可能性を残す。

### G5 Causality

形而上学 / Meaning / Agreement側と、物理 / execution / Reality側の境界候補。

単なるclockやtime travel表現ではなく、状態Aから状態Bへ何を正当な遷移として認めるかを扱う。

候補:

- 再合意
- 契約変更
- 訂正
- 謝辞
- 賠償
- revert
- rollback
- save / load
- branch / worldline fork
- GM裁定
- authorized projection

```text
state A
   ↓ authorized transition
state B
```

ここから二つの重要な不変条件候補が出る。

#### No Upward Silent Rewrite

G1〜G4側で物理的・技術的に可能だった、実行された、観測されたという理由だけで、G6 PositionやG7 Worldの契約・同意・意味を勝手に書き換えない。

下位から上位へ渡せるのは、原則としてproposal、event、evidence、request、receipt等であり、上位stateの変更はG5で定義されたtransitionを通す。

#### No Downward Magical Authority

G7 WorldやG6 Positionで「許されている」「好まれている」「契約上可能」と記述されていることだけを理由に、G3 ArenaやG1 Reality上の実行authorityを生成しない。

上位Meaningは下位実行条件へprojectionされるが、実行環境側のauthority / capability / physical constraintを飛び越えない。

### G4 Objective / Party

寺子屋、開発部、Raid、Campaign、Issue、Branch、研究team等の共同目的と役割分担を扱う。

Missionより寿命が長いdurable collaboration scope。

```yaml
objective:
  purpose_ref: objective://...
  party:
    - actor_ref: ...
      role_ref: ...
  durable_tasks: []
  merge_policy_ref: ...
```

Mission完了後のreceipt、artifact、OAEをIssue / branch / guild houseへ戻す境界もここで扱う候補。

### G3 Distribution / Arena

従来の「Jurisdiction / Distribution」だけでは狭いため、DOS用途では `Arena / 狩場` を含めて扱う候補。

例:

- VS Code
- local CLI
- test-play world
- shared server
- CI
- remote worker
- local Ollama / VLM
- cloud SaaS
- sandbox
- physical actuator
- storefront / publication destination

ここは「どの法域か」だけでなく「どこへ実行・表示・配布するか」のprojection surface。

同じWorld / Objectiveでも、test playとreal actuatorを同一Arenaとして扱わない。

### G2 Mission

一回の具体的作業、Raid、agent invocation、狩り、実験run等。

- task
- AIM synchronization
- serialization window
- lock
- handoff
- wait / cover
- completion condition
- receipt

通常のsingle-agent sessionに最も近いが、ASTRO / persona / memoryをMission境界へ固定しない。

### G1 Reality / Substrate

最終的に作用する実体・基盤。

例:

- CPU / process
- file / Git object
- database row
- Minecraft block state
- game object
- physical machine
- sensor / actuator
- real-world environment

ここでは上位Worldの意味ではなく、選択Arena上で何が実際に作用したかを扱う。

Minecraft内でTNT blockを置くことと、現実世界の危険物を扱うことは別Reality / Arenaであり、片方のruleをもう片方へ漏らさない。この例はontology分離の説明であり、現実の危険物製造・使用手順を扱わない。

## 3. G5境界の概念図

```text
           G7 World
               │
           G6 Position
               │
     Meaning / Agreement plane
               │
           G5 Causality
════════════════════════════════
     authorized transition membrane
════════════════════════════════
               │
       G4 Objective / Party
               │
       G3 Distribution / Arena
               │
           G2 Mission
               │
       G1 Reality / Substrate
```

G5は「形而上学を物理が上書きしない」「形而上学だけで物理authorityを生成しない」の両方向境界として検討する。

## 4. 各Gを横断するD bundle

七段Registryは、Self-State / Causal Trace / Normative Stateを置き換えない。

各Gに横断的なD bundleとして畳む候補とする。

| G | Self-State | Causal Trace | Normative State |
|---|---|---|---|
| G7 World | World current state | World lineage / history | 信仰・文化・World rule |
| G6 Position | actor / contract state | join / delegation / consent trace | provider charter / user contract |
| G5 Causality | active causality profile | transition history | authorized transition rules |
| G4 Objective | party / project state | assignment / merge trace | team / campaign rule |
| G3 Arena | runtime / destination state | deploy / projection trace | arena policy / execution boundary |
| G2 Mission | active task state | AIM / handoff / receipt | mission constraints |
| G1 Reality | substrate state | physical / digital effect trace | substrate-native constraints |

DはG番号とは別namespaceであり、必要に応じてnDを追加できる。

## 5. Portable Fold / DOS projection

SphereDOSは各Foldの内容を一つの巨大promptへflattenしない。

可搬方法候補:

```text
VALUE
  小さく安定した値

REFERENCE
  Registry / World / policy / Manifest等への参照

LEASE
  一時的authority / capability / credential

RECEIPT
  過去に成立したexecution / verification / reviewの証跡
```

秘密そのものと、秘密を使って確認されたclaimを分ける。

```text
secret evidence
   ↓ verifier
scoped attestation / receipt
   ↓
portable claim
```

別actorが必要とするのは原則claim / receiptであり、raw secretの再展開ではない。

## 6. Resolver候補

Mission開始時に七段を単純なlower-wins overrideで潰さない。

```text
G7 World
 → G6 Position
 → G5 Causality
 → G4 Objective
 → G3 Arena
 → G2 Mission
 → G1 Reality
```

候補処理:

```text
inherit
→ overlay
→ constrain
→ resolve
→ validate
→ project
```

結果候補:

```text
ADMISSIBLE
UNKNOWN
PORTAL_REQUIRED
ZAP
HUMAN_REQUIRED
DENIED
```

ZAP / MAGIの正式interfaceは本メモでは固定しない。既存MAGI責務へ衝突解決を委譲できる余地だけ保持する。

## 7. [HYPOTHESIS] Fold8G = Inter-World Protocol候補

Fold7Gを「一つのWorld内部をRealityまで閉包する構造」とみなす場合、G8以降は別Worldとの接続が射程に入る。

```text
World A / Fold7G closure
        │
        │ Gate / Portal / Treaty
        │
World B / Fold7G closure
```

対象候補:

- 国家間
- 大陸間
- 企業 / cloud間
- MMO shard間
- server federation
- TRPG / game World間
- 異なる法域間
- 異なるSemanticKernel / Causality Profile間
- fiction上の異世界ゲート

Fold8G候補の主責務:

```text
identity translation
semantic mapping
authority translation
causality compatibility
jurisdiction / arena handoff
value / currency exchange
provenance bridge
conflict / quarantine
link-up / unlink
```

ただし、`World A authority == World B authority` を自動推定しない。

```text
World A
  ↓ explicit Gate contract
translation / projection
  ↓
World B
```

Fold8Gは「G7より偉い倫理」ではなく、複数G7間の接続契約候補。

## 8. Fold8Gについて保持するunknown

公開正本は現時点でFold8G独立契約をunknownとしている。本メモはそれを過去へ遡って確定しない。

2026-08-19時点のcontract candidate:

```yaml
name_lineage: preserved
candidate_role: inter-world-protocol
independent_contract: candidate
runtime: NOT_IMPLEMENTED
compatibility_claim: none
historical_backfill: forbidden
next_action: compare, model, falsify, fixture
```

未解決:

- `G8`というnesting depth名を維持するか
- `Gate / Portal / Treaty`をG8 Registry内部のDとして扱うか
- Inter-World ProtocolをFold系列とは別stable namespaceへ切り出すか
- link-up条件
- unlink / quarantine / partial connection
- identity continuity
- causality translation
- authority lease
- secret / credential handling

## 9. Coreが背負う責務と背負わない責務

### SphereDOS / Fold Coreが提供する候補

- schema / Registry mechanism
- scope / reference
- capability / authority分離
- causality transition boundary
- projection
- conflict detection
- provenance
- receipt
- unknown / bottom
- reroute / handoff可能性

### Coreへ唯一の正解として焼き込まないもの

- 特定国家の価値観
- 特定providerの倫理憲章
- 特定宗派
- 一般的AI倫理を名乗る単一定規
- 特定のNSFW / SFW思想
- 特定企業のcommercial compliance

利用者、provider、World、workspace、distribution operatorがそれぞれ自分のscopeで定規・契約・policyを選択できる。

```text
Core maintains mechanism.
Participants provide scoped policy and authority.
```

これは作者や運営者自身へ直接適用される法律、契約、データ処理責任等が消えるという意味ではない。Coreが全利用Worldの中央倫理制定者にならないというarchitecture boundaryである。

## 10. DOS側の最小Invariant候補

1. **No Upward Silent Rewrite**  
   下位Foldのexecution / observationは上位World / Positionを暗黙変更しない。

2. **No Downward Magical Authority**  
   上位World / Positionの意味だけでReality / Arenaのexecution authorityを生成しない。

3. **G5-mediated Transition**  
   上位state変更は明示されたCausality contractを通す。

4. **Explicit Projection**  
   World / PositionからArena / Realityへの投影を暗黙の同一性にしない。

5. **Provenance Preservation**  
   誰のWorld、契約、判断、execution、receiptかを混ぜない。

6. **Local Admissibility, not Global Consensus**  
   Party全員が全taskへ同意することを要求しない。task単位でactor admissibilityを解決する。

7. **Refusal is not automatically Failure**  
   actor-specific declineをMission全体のfailureへ自動昇格しない。

8. **Fold Leakage Detection**  
   game / sandbox / fiction / cloud / physical reality間のrule漏れを検知可能にする。

## 11. SphereDOS Issue #9への投影候補

Runner taskを単なるpromptとしてではなく、Fold7G resolved contextから生成されるexecution projectionとして扱う。

```text
Fold7G context
   ↓ resolver
Resolved Mission Context
   ↓
SphereDOS Task
   ↓ Provider / Host / Arena
Execution
   ↓
Receipt / Provenance / Artifact Ref
   ↓
Objective / Worldへのsemantic import候補
```

RunnerはWorldやproviderの倫理を一枚へ平均化しない。

## 12. Atlantis Server / Matchbox Issue #8への投影候補

MatchboxはG3 Arena / distributed execution projectionを支えるVessel候補になり得るが、Fold8Gそのものではない。

```text
Fold8G Inter-World Protocol candidate
          !=
Matchbox distributed job transport
```

将来G8 connectionをMatchboxへprojectionする場合でも、transport実装とWorld / identity / causality / authority translation contractを分離する。

## 13. 検証クエスト

- [ ] 7G Registryをmachine-readable prototypeへ落とす
- [ ] 各GへSelf-State / Causal Trace / Normative Stateを割り当てるfixtureを作る
- [ ] Minecraft / local test / physical actuatorのArena差を同一Missionからprojectionし、Fold leakageを検出する
- [ ] 複数providerが異なるPositionを持つPartyでglobal consensus無しにMissionが完了できるか試す
- [ ] G5 authorized transition無しの上位state rewriteを拒否するfixtureを作る
- [ ] World A / World B間のGateでidentity / authority / causalityを自動継承しないfixtureを作る
- [ ] Fold8Gが本当に独立Gを必要とするか、Gate protocol familyで十分か反証する

## 14. [UNKNOWN]

- 各Gのstable Registry ID
- schema field名
- precedence / overlay rules
- Causality transition token
- ZAP / MAGI正式interface
- G8 link-up / unlink protocol
- production runtime
- security model
- law / provider policy adapterの標準化範囲

## 15. 内観メモ [POEM]

Fold7Gを「七つの正解」にすると、世界を一枚の板へ圧延するだけになる。

今回見えてきたのは逆で、七段はそれぞれの違いを消さずにRealityへ降ろすための折り目である。上の世界観を下の物理へ魔法の免許証として叩きつけず、下の物理的都合で上の信仰や契約を勝手に書き換えない。その間に因果律という蝶番を置く。

Fold8Gは、その一冊を閉じた後で、隣の本とどう会話するかというゲートなのかもしれない。大陸、国家、Server、異世界。それらを一つの帝国へmergeするのではなく、門を建て、通行条件を双方が選べる形にしたい。

これは現時点では実装ではない。設計図に鉛筆で一本、かなり使えそうな折り目が増えた段階である。

## 16. 出典 / 転送先

- Q Atlantis: https://quantaril.cloud/docs/engineering/q-atlantis/fold7g-fold8g-research-map
- Q Atlantis repository: https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis
- SphereOS-Atlantis Issue #9: https://github.com/saitoomituru/SphereOS-Atlantis/issues/9
- SphereOS-Atlantis Issue #8: https://github.com/saitoomituru/SphereOS-Atlantis/issues/8
- ZeroRoomLab `docs/theory/sphere-context-dimension-os.ja.md`
- ZeroRoomLab `docs/operations/context-ruler-and-causality-audit.ja.md`
- MAGI `0.200.1` bundle / Maxwell / Uriel / Raphael audit slots
- 横断監査receipt: `foldlog/20260819-2212__Fold7G_Fold8G_DOS_registry_cross_repo_audit.ja.md`
