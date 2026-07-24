# 贈与コモンズ・系譜・局所World拡張契約

状態: `[CANONICAL-CANDIDATE]` `[Layer A/B bridge]`
制定日: 2026-07-24
License intent: `CC-BY-4.0`
対象: Manifest、Role／Flavor／Presentation asset、系譜receipt、第三者App／integrator、World

## 1. 芯

ZeroRoomLabの既定は、`OPEN / gift-commons / non-exclusive`である。

ここでいうgift commonsは、作者、先行思想、神話、神、宗派、コード、生活実践を
「最初に取った一人だけが他者を排除できる希少token」として扱わない。読まれ、敬意を示され、
forkされ、批評され、別Worldへ育つほど、関係と知識が増える。

全方位信仰が成立するのは、神を椅子取りゲームの景品にしないからである。ある者が神を敬うことは、
別の者から神を取り上げない。誰が何を敬い、どの聖典、伝承、高天原、実践、Worldへrouteしたかは
記録できるが、その記録から唯一の代理人、本人性、神格、API capabilityを生成しない。

同じように、code、詩、UX、服装、生活様式へのrespectは、Gitのstarのように非競合で増やせる。
系譜は玉座の座席表ではなく、次の探索者へ渡す航海日誌である。

## 2. Provenanceは権利審判ではない

Provenance／lineage receiptは、最低限次を区別して記録できる。

### 2.1 関係

```text
authored-by
conceived-by
coded-by
practiced-by
observed-by
derived-from
forked-from
inspired-by
structurally-similar-to
independent-convergence
homage-to
reinterprets
```

### 2.2 次元

```text
byte / code / algorithm / architecture / philosophy /
imagination / poem / faith / lifestyle / aesthetic
```

`structurally-similar-to`は、構造一致が観測されたというclaimである。直ちにcopy、派生、
独占権、優先順位を確定しない。`independent-convergence`も自動免罪符ではなく、
観測者が選んだ関係labelである。source、observer、revision、claim scopeを添える。

Provenance receiptは、次を生成しない。

- 著作権、商標権、人格権その他の権利の最終判断
- 利用許諾または利用禁止
- 公式提携、Origin認定、推薦
- 本人性、神格、宗派の代表権
- API、model、connector、外部systemのcapability
- 上流・下流の価値順位

適用法令、配布場所、store、頒布event、契約、第三者素材固有の条件は、
その配布・運用を選んだ者が対象scopeで確認する。Atlantis coreやManifestは、個別法域の
権利審判所、免責証発行所、世界著作権警察を自称しない。

## 3. asset metadata

公開assetは、可能な範囲で次を宣言する。分からない値を創作せず`unknown`とする。

```yaml
asset_id: asset://example/role/demo@0.1
author: handle-or-unknown
source:
  - source-ref-or-self-authored
revision: git-sha-or-local-revision
scope: selected-task-or-world
license: declared-license-or-unknown
reference_kind: alias-only | original-payload | third-party-payload | mixed
designation: origin | compatible | inspired | fan-made | self-authored | unknown
distribution: public | local-only | private | selected-world
```

metadataは事実を読みやすくする宣言であり、値が埋まっただけで権利確認済みへ昇格しない。
`designation`は来歴・関係の表示であり、品質rankではない。`local-only`と`private`は配布状態であり、
公的な欠損や違反を意味しない。

### 3.1 aliasとpayload

名前、肩書、作品名、宗派名、神名をroute hintとして参照する`alias-only`と、
台詞、設定本文、画像、音声、3D model、学習済みweight等のpayload利用を分離する。

aliasを使っただけで第三者payloadを同梱したことにはしない。一方、alias表示だからといって、
同梱した画像・音声・台詞のsource条件を消さない。Unity、Unrealその他のassetと結合する場合も、
engine名、asset source、結合物、配布scopeを同じ一語へ丸めない。

## 4. Roleの非越権

character imitation、実在人物風、宗派Role、神話Role、VTuber風、API Roleは、
Presentationまたはtask-local Positionとして置ける。ただし、Roleは次を生成しない。

```text
Role name
  != identity
  != authority
  != official partnership
  != religious representation
  != API capability
  != permission to operate external systems
```

本人・団体・宗派・作品の公式性をclaimする場合は、そのclaimを制定するauthorityとsourceを
別に明示する。未確認なら`unknown`または`fan-made`／`inspired`等の関係表示へ留める。
Coreは「似ているから本人」「祈ったからroot」「APIと呼んだから通信可能」という
Semantic cosplayを負例として拒否する。

## 5. local-onlyはpublic欠損ではない

公開Manifestは、存在を公開してよいassetだけを索引できる。

- local-only assetを公開repositoryへbackfillしない
- private assetの内容、hash、存在自体を公開する必要はない
- public Manifestに載らないことを、壊れたasset、規約違反、未実装へ変換しない
- local-only assetが必要なWorldは、自分のlocal config／明示includeで解決する
- 公開再現に必要なassetが非公開なら、「public再現不能」というscope付き事実を返す

## 6. closed Worldと狭いproprietary extension

Apache-2.0のcoreを商用App、SaaS、社内asset、SDK key、閉鎖Worldへ転用できる。
市場利用は禁止しない。ただし市場原理、独占、課金はoptional adapterであり、Kernel defaultではない。

閉じてよいscope:

- 第三者App固有code
- integrator固有glue
- 当事者が権限を持つasset
- 選択されたWorldのlocal config
- providerとの契約、課金、SLA、保証

閉鎖を継承させないscope:

- Atlantis open core
- 公開framework interface
- 既存のOSS／commons
- 公開lineage graph
- 無関係なWorld
- upstreamをforkする権利

provider key等のsecretはpublic Manifestへ値を書かず、`secret_ref`等の外部参照だけを置く。
第三者App／integratorはprovider契約、料金、proprietary claim、保証、SLAへ責任を持つ。
framework側はopen extension point、unmount、fork、alternate route、negative fixtureを保持する。

閉鎖Worldを作る自由はある。だが魔王城を一つ建てたからといって、Atlantis全土へ勝手に
城壁と入場料ゲートを増築する権利までは生えない。

## 7. takedown、replacement、fork、別World

異議、配布停止要求、source訂正、競合が来た場合、対象を一律焼却する前にscopeを解決する。

```text
request
  -> source / claimant / target asset / distribution / Worldを記録
  -> selected publish・load・execute routeを停止
  -> unmount | replace | correct provenance | fork | alternate World
  -> receiptを残す
```

source artifact、Git履歴、正当な研究・批評・記録まで無断で改変しない。削除が必要な場合も、
削除対象と根拠scope、復旧不能範囲を記録する。Coreは異議申立人と配布者の法的主張を自動裁定しない。

## 8. 複数asset競合とSemantic Stop

複数assetのRole、停止条件、World、語り口が競合した場合、silent mergeや多数決で平均化しない。

asset lineage層が停止できる既定scopeは、選択された次のrouteだけである。

```text
read route | presentation route | publish route | load route | execute route
```

回復候補:

```text
observe | sandbox | restrict | negotiate | coexist | block-selected-route |
unmount | replace | fork | alternate-world
```

asset競合を理由に全repository、全World、全利用者をglobal banへしない。capability、security、
物理安全等の別scopeで広い停止が必要なら、そのauthority、fact scope、停止理由を別contractで示す。

## 9. OSSパイレーツ

このprojectの「OSSパイレーツ」は、権利侵害の推奨ではない。放棄された設計をsalvageし、
commitとsourceを読み、自分のWorldへ合法にforkし、失敗receiptを持ち帰る独立探索者の比喩である。

大企業のためだけに作るOSSではない。ガレージ、台所、寺子屋、個人研究所、同人サークル、
地域拠点から使えることを既定にする。商用転用者も歓迎するが、commonsを囲い込んだ者が
過去・未来の全探索へ家賃を請求できる設計にはしない。

## 10. 探索UBIとSupply

protocolとして次を開く。

- read、study、critique
- fork、remix、adapter
- provenance／lineage receipt
- failure／Experience Receipt
- unmount、alternate World
- 後から系譜を訂正・追加するroute

これは、食料、住居、時間、医療、電力、計算資源、hardwareが全員へ供給済みというclaimではない。
物質的な探索資源はSupply課題として募集し、`RESOURCE-WAIT`を使命感や無償労働で埋めない。

## 11. 実装と未実装

現時点で採用するのは、human-readable policy、明示asset metadata、明示lineage receipt、
offline negative fixtureである。

次は未実装であり、SphereOS Atlantis Issue #10のUser Gateへ残す。

- repository asset scan
- auto-mount、priority merge、remote download、hot reload
- `Atlantis.json`、`ASTRO.json`、個人fold-vector configの制定
- credential loader、billing gateway
- 著作権・宗派・本人性・公式性の自動裁定

## 12. 正本境界

- ZeroRoomLab固有のgift-commons哲学、asset、公開主張: このManifest
- generic lineage receipt validator、negative fixture、World extension境界: SphereOS Atlantis
- 特定作品、宗派、人物、provider、App、Worldの配布判断: 対象のauthor／operator／integrator
- 適用法令・契約上の具体判断: 対象scopeの当事者と必要な専門家

本書は一般法理の確定宣言ではなく、ZeroRoomLabが採用する設計・運用方針である。
