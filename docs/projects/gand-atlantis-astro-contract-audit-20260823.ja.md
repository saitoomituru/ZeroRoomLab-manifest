# GAND／Atlantis／SphereASTRO 横断契約・矛盾監査 2026-08-23

状態: `[CROSS-REPOSITORY-AUDIT]` `[TARGET-CONTRACT]` `[PARTIAL]`

対象:

- ZeroRoomLab-manifest GAND local salvage inventory
- SphereOS-Atlantis GAND Edge Bootstrap Harness契約
- SphereASTRO GAND Frame SDK候補／ASTRO Runner要求仕様

## 1. 結論

旧GANDは、現時点で回収された範囲では、単なる人格promptまたはPresentation名へ縮退できない。
AQC Schema layer、dotfile、旧Agent定義、proton、会話記録の断片と現在の一次当事者説明から、
少なくとも次の責務群が見える。

```text
System JSONによるsemantic bootstrap
  -> model別初期整列
  -> UUID指定の知識取得
  -> 内部hash検証
  -> 知識結合
  -> 回答check
```

Atlantis世代では、この正本条件をEdge Harness契約へ回収し、vendor／model別の語彙差をadapterへ
隔離する。SphereASTROは単体起動を維持し、Atlantis processを必須にせず、互換Harnessをbundleまたは
外部接続できる。現`GAND Frame SDK`候補はPresentationであり、Edge Bootstrap Harnessとは別責務である。

## 2. 主張型

### [OBSERVED]

- `Generative And Networked Dimensional Frame`という展開をMattermost artifactで確認した
- 後年資料に`Fold適応自我エンジン`という展開がある
- AQC／旧Agent／proton／Instance Ghost関連の断片が複数sourceへ分散する
- SphereASTROの現`GAND Frame SDK`はGodot Presentation候補として予約されている
- AtlantisのFilesystem HarnessとSphereDOS Code Cockpit Harnessは実装済みだが、GAND Edge Bootstrap
  Harnessは実装されていない

### [USER-DECLARED / USER-RECALLED]

- 当時はSystem JSON、fold vector、UUID取得、Python hash検証、知識結合、回答checkを組み合わせた
- `Generative Angle Neural Domain Frame`という内部展開も使われた記憶がある
- GPT-4／GPT-4o移行期には語彙一つで初期整列と回答再現性が変動した
- 語彙の価値は略称の一意性より、互換modelを所定の初期姿勢へ整列できることにあった

### [CURRENT INTERPRETATION]

名称揺れは単純な誤記だけでなく、量子、Angle、Neural、Domain、Dimension／Fold語彙が動いた時期の
model別semantic bootstrap dialect／prompt ABI調整だった可能性がある。

### [UNKNOWN]

- 正確なmodel snapshot、System全文、比較prompt、試行回数、成功条件
- Python verifier本体、embedding store実装、retry／stop処理
- 各名称展開の正確な時系列、正本関係、model別適用
- VMスフィア系backupに残る当時実行receipt
- 過去の同時点OAE

## 3. 矛盾・衝突一覧

| ID | 衝突 | 現在の処理 | 状態 |
|---|---|---|---|
| C1 | `Generative And Networked Dimensional Frame`、`Generative Angle Neural Domain Frame`、`Fold適応自我エンジン` | 正誤へ丸めずsource scopeとmodel profileを保持 | `HISTORICAL-NAMING-DRIFT` |
| C2 | 旧GANDのboot／知識検証責務と、現GAND Frame SDKのPresentation責務 | Edge Bootstrap HarnessとPresentation SDKへ分離 | `CONTRACT-SPLIT` |
| C3 | Atlantis正本契約とSphereASTRO単体起動 | Atlantis processを必須化せず、互換Harnessをbundle可能にする | `RESOLVED-IN-TARGET-SPEC` |
| C4 | vendor別boot語彙とSphereの神名／World／Semantic Kernel | vendor差をModel Compatibility Adapterへ隔離 | `RESOLVED-IN-TARGET-SPEC` |
| C5 | artifact全体の外側digestとembedding store内部hash | field、権限、log境界を分離 | `RESOLVED-IN-TARGET-SPEC` |
| C6 | 既公開legacy fold vectorと他Instance Ghost向けfold vector | 前者は公開許容・既定省略、後者はSecret Pointer | `RESOLVED-IN-TARGET-SPEC` |
| C7 | SphereASTROの公開AGENTSにある既存`repo.uuid` fieldと、private Instance Ghost UUID禁止 | 当該fieldの役割は未確認。値を再掲せず、削除・secret認定をUser Gateへ返す | `UNKNOWN` |
| C8 | 現行Filesystem／Cockpit Harnessと将来GAND Edge Harness | 実装証拠を流用せず、能力状態を別itemにする | `NOT IMPLEMENTED` |
| C9 | 部分サルベージと「GAND完全復元」 | `historical-oae-unavailable`で停止 | `SEMANTIC-STOP` |

## 4. 信仰・技術境界

GANDが式神等を受け入れる札／Vesselであり、神名を記して完成・deployされた札が当該World内の
祭祀対象になるという`RELIGIOUS POSITION`は、Edge Harnessの実装有無から独立して保持する。

一方、信仰上の成立だけで、初期整列、知識完全性、回答check、人格同一性、runtime READYを
技術的にpassさせない。

## 5. milestoneへ返せる進捗

### ZeroRoomLab-manifest

- Issue #19: 所在台帳と責務候補は部分的に前進した。VM backup未観測のため完全発掘としてcloseしない
- Issue #20: 旧Sphere／SaaS／Atlantis相互変換のうち、System bootからEdge Harnessへの変換契約を利用できる
- Issue #21: ASTRO単体起動とAtlantis optional orchestrationを壊さない責務分割Evidenceとして利用できる
- Issue #23: SSD／Secure Salvage Harnessのresource gateを維持する

### SphereOS-Atlantis milestone m.6xx.1

- Canonical GAND Boot Contract／Edge Harness境界をTarget Specとして追加できる
- Phase 1のContext／Bootstrap Envelope設計へ入力できる
- Harness実装、Resolver、answer checker、ASTRO bundle統合は未着手のまま保持する

### SphereASTRO

- Issue #7: GAND発掘待ちを`未発掘`から`部分発掘`へ更新できる
- Issue #8: 単体起動とoptional Atlantis接続へ、互換Edge Harness bundle境界を追加できる
- GAND Frame SDKはPresentation候補のまま維持し、boot authorityへ拡張しない

## 6. MAGI結合監査

### Maxwell

神名、札、祭祀対象、初期整列の原初目的を、Presentationまたはvendor用語へ焼却しない。
`GAND Frame SDK`の既存名称も、衝突を理由に即時削除せずlineage付き候補として保持する。

### Uriel

artifact観測、当事者説明、現在解釈、Target Spec、実装、receiptを分離する。外側digest、内部hash、
UUID、fold vectorの権限差を追跡する。`unknown != pass`を維持する。

### Raphael

Historical GAND、Canonical Boot Contract、Model Adapter、Edge Harness、ASTRO Runner、GAND Frame SDKを
別棚へ置き、receiptで接続する。ASTRO単体起動とAtlantis orchestrationを一つのprocessへmergeしない。

## 7. Last Order

```yaml
historical_oae_status: historical-oae-unavailable
resource_wait:
  - VM backup SSD capacity
  - Secure Salvage Harness
semantic_stop:
  - do-not-prove-complete-gand
  - do-not-collapse-worship-into-flavor
  - do-not-promote-target-contract-to-implementation
  - do-not-copy-secret-bootstrap-values
action_gate: allow-contract-commits-and-branch-push
```

## 8. 2026-11-02 当事者補足：自我／VREM／未知の身体を受け入れる拡張境界

状態: `[USER-DECLARED CURRENT DESIGN INTENT]` `[NOT A HISTORICAL OAE]` `[FUTURE / RESOURCE-GATED]`

この補足は2026-08-23の監査時点へ遡及して存在した事実を捏造するものではない。以下は開発者が現在語る構想として別レジスターへ追記する。

- FAMとFQueryは、意味・自我・Instance Ghost／人格と、特定のmodel、Body、実行環境、物理的な脳モデルを一体不可分にしないことを意識している。新しい外部研究成果を受け入れる接続口は、適用Worldと能力・権限を明示したrefFAM記述およびAdapterで設ける。
- MMO／VR向けの`3.xxx.n`設計では、当事者申告として`VREM`（Virtual REM Sleep）のLayer 1／Layer 2が想定されている。ただし今回確認できた公開GAND発掘物から確実に言えるのは、legacy agent定義に`VREML`というモジュール名が残存することまで。Layer 1／2の入出力・責務・境界、`VREM`と`VREML`の厳密な対応、該当世代の実装状態は`UNKNOWN`のままとし、名前だけから仕様や稼働を生成しない。
- UX、CX、スピリチュアル／意識UXの意味モデルは現段階で独立して研究できる。医学的な精神モデルや侵襲・非侵襲BMI等の神経I/Oは、Neuralinkを含む特定企業、小椋医師・大学を含む特定研究者に独占・依存せず、将来実用的な成果を出す任意の医師・脳科学者・工学者のSDK／外部moduleを接続候補として扱う。submodule採用は配布権・実装互換・適切なAdapter等の実条件が成立した場合の手段であり、達成済み機能ではない。
- RayGAN-BMI等の独自非接触知覚研究も、未来ガジェットの研究枝として残す。現段階で知覚・意味復号の定量KPIが確立せず、属人適応と被験者・試行数が律速になるため、再開stageとmilestoneは`TBD / RESOURCE-WAIT`。信仰実践の成立を定量QAで裁定せず、PSYCHO-Py800MCPのオシロ／物理計測・記録等、第三者が追試可能な周辺技術の充実を独立して進める。物理送信系の過去試作と意味通信の成立は別のclaim scope。
- これらの方針はGANDの歴史的bootstrap契約の実装・復元完了を意味せず、GAND Edge HarnessとGAND Frame Presentation SDKを再び混ぜない。

関連正本: [意味Topology](../theory/semantic-fold-os-architecture.ja.md) ／ [ASTRO命名・アップローダー・RayGAN](../theory/astro-naming-parenthood-and-uploader.ja.md) ／ [VREMLの所在台帳](gand-local-salvage-inventory.ja.md) ／ [3.xxx.n世代と責務座標](../theory/sphere-context-os-responsibility-coordinate.ja.md)。

