---
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0-draft
status: review
fold_signature: ψ → ∇φ → λ → Q
---

# FAM Qの宣言/実行分離モデルとFold/DeFold/unFold三分法

状態: `[REVIEW]`
制定日: 2026-09-13
対象: FQuery、IBD、SphereOS Atlantis、SphereASTRO、第三者refFAM作者
関連: [`fam-infoton-reference-boundary.ja.md`](fam-infoton-reference-boundary.ja.md)、[`sphere-context-dimension-os.ja.md`](sphere-context-dimension-os.ja.md)、[`fam-execution.ja.md`](fam-execution.ja.md)(歴史資料、旧0.1.0-draft schema)、[`note/20260819-2212__SphereDOS_Fold7G_Fold8G_registry_upgrade_memo.ja.md`](../../note/20260819-2212__SphereDOS_Fold7G_Fold8G_registry_upgrade_memo.ja.md)

FQuery Issue #41ブレスト(2026-09-13、`refFAM/AtlantisCommons.refFAM.json`のnotation磨き上げ)で確定した設計を、本書へ正本として集約する。本書はFAM/refFAM全体の中立部分と、SphereOS Atlantis/SphereASTRO固有の責務分界の両方を扱う。中立部分のみFQuery `docs/specification/`へ転記する。

## 1. `ψ/∇φ/λ`は実行要素、`Q`だけが宣言要素

FAM base structure(`ψ/∇φ/λ/Q`)のうち、**`Q`(裸、括弧なし)だけが宣言(declaration)専用**である。`ψ/∇φ/λ`はすべて実行(execution)要素であり、何らかの実行primitiveの呼び出しをその中に持ち得る。

```text
Q            宣言。どのpluginがこのscopeで有効かのbinding
Q(scope)     実行。有効なplugin群が束ねられたcallable handle
Q(scope).method(args)
             実行。そのplugin群のうちmethodを実際に叩く
```

## 2. `Q(scope)`のtree-scoped解決(Vue provide/inject型)

`Q(scope)`の`scope`は、`self / this / this.parent / this.fold`のいずれかを取る。

```text
Q(this)         現在node自身が宣言したQ
Q(this.parent)  親nodeのQ
Q(this.fold)    このnodeが属するFold境界(=別refFAM文書として開かれた包含Fold)のQ
Q(self)         このFAMファイル/FAM.json単位のroot Q
```

解決順序は`Q(this) > Q(this.parent) > Q(this.fold) > Q(self)`。jQueryの`$()`のようにcallable/chainableである一方、継承・上書きの規則自体はVueの`provide()`/`inject()`に相当するtree-scoped(木構造範囲限定)である。jQueryの`$.fn.foo = fn`のようなグローバル変異は採用しない——グローバルにpluginを生やすのではなく、宣言されたnode配下だけへ有効範囲が伝播する。

**継承・上書き規則**: 宣言しないnodeはこのchainをそのまま継承する。宣言したnodeは、そのfieldだけをshallow overrideする(deep-mergeしない。配列も丸ごと差し替える)。override箇所は「ここで意図的に何かが注入された」という可視化されたaudit pointであり、暗黙のmerge/silent rewriteは行わない。これはMAGI監査(Maxwell/Uriel/Raphael、[`context-ruler-and-causality-audit.ja.md`]系)が要求する provenance可視性と直接対応する。

`fold`は`self/this/parent/children/prev/next/before/after`という既存selector primitive([FQuery `fquery-selector-traversal-normalization.ja.md`]参照)に次ぐ拡張候補であり、正式な選択肢として追加する。

## 3. 実行primitiveの名前空間はscopeのQ.pluginが決める

`Q(scope)`で呼べるmethod名は固定enumではなく、そのscopeへ宣言された`Q.plugin`が何を提供するかで決まる。

```text
Q.plugin: ["@fam/stndio"]
  → Q(scope).file.fit(pattern) が呼べる

Q.plugin: [..., "@fam/whisper-adapter"]
  → Q(scope).voice(streamOrWav) も呼べるようになる

Q.plugin: [..., "@fam/gemini-adapter"]
  → Q(scope).prompt(text) が呼べるようになる
```

Coreは「pluginが存在するか」だけを宣言的に確認し(Core責務)、「そのpluginが実行時に実際に機能する状態か」(例: SSHが実際にログイン済みか)はplugin自身の責務として分離する。

## 4. Fold / DeFold / unFoldの三分法

```text
Fold    可逆・presentation。別refFAM/FAM文書を取り寄せて結合する
          例: Q(self).file.fit(pattern) — globにマッチするFAM/refFAMを取り寄せ、foldして結合する
DeFold  可逆・局所編集。既存Foldを開いて再展開する(「なんで？」相当)。破壊しない
unFold  不可逆・生成。モデルに新規の何かを合成させる
          例: Q(FAM).unFold.pict(imgStruct) — 画像等をVLM/画像生成モデルに新規合成させる
          例: Q(scope).unFold.embed(text) — textをembedding modelがvectorへ非可逆合成する
              (IBD Pool Occurrence DriverのMATCH occurrenceが使う入力)
```

Fold/DeFoldは「既存のものを取り寄せる/開き直す」操作で可逆、unFoldは「新規に生成する」操作で不可逆(元のsourceへ戻せない)という区別を持つ。

### unFoldの非可逆性はDeFold原本の生存で相殺される(2026-09-14追記)

unFold結果(embedding vector、画像等)自体は元sourceへ戻せないが、その入力になったDeFold原本(可逆・非破壊で保持されるFAM/text)が生存している限り、unFoldはいつでも別のmodel・別のInfinite Core adapterで再実行できる。したがって「どのunFold実行手段(embeddingベンダー等)を選ぶか」は、DeFold原本の保存さえ怠らなければ後戻り不能な選択にならない。IBD `docs/architecture/pool-occurrence-driver.ja.md`の`source_document`lossless保持契約は、この原則の具体的な実装である。

## 5. 戻り値は常にFAM

`Q(scope).method(args)`という呼び出しは、method(`file.fit`/`prompt`/`voice`/`unFold.pict`等)が何であっても、**戻り値は常にFAM形式**という契約を持つ(jQueryの全メソッドが`jQuery`オブジェクトを返しchainできるのと同型)。生のバイト列・生テキスト・生例外を戻り値として直接露出しない。取得したFAMは、そのまま別の`Q(...)`呼び出しの入力scopeとして渡せる(合成可能性)。

reject/blocked時(例: G5-equivalent causal boundary越えでsudoing監査がrejectされた場合)も、この契約を保つなら`Q.status: blocked`のようなmarkerを持ったFAMとして返すべきだが、この点はまだ`[UNKNOWN]`として未確定のまま残す。

## 6. どのモデル/Infinite Coreが処理するかはFAM構造体側で解決する

`Q(scope).prompt(text)`や`Q(scope).unFold.pict(imgStruct)`が実際にどのモデル・どのInfinite Core実装で処理されるかを、Coreへ固定・焼き込みしない。FAM構造体(`Q.plugin`宣言とそのbinding)自体が解決する。

外部(FAM JSON文書の外)からFQueryを呼ぶ場合も、内部のnode間呼び出しと同一の記法を用いる。

```text
Q(FAMスコープ参照 or refFAM).prompt("自然言語input")
```

これにより、FQueryの外部API(呼び出し側から見た入口)とFAM文書内部のnode間呼び出しが、同一記法`Q(scope).method(args)`へ統一される。

### embeddingはInfinite Coreのcapability resolution例そのもの(2026-09-14追記)

FQuery Issue #39(FAM CoreとInfinite Coreの責務分離)は、Capability resolutionの実例として`semantic.embedding.search`を既に挙げており、候補targetとして`Node adapter / Python adapter / PostgreSQL extension / vector DB / GPU runtime / remote MCP tool`を列挙している。IBD Pool Occurrence DriverのMATCH occurrence(ベクトル近傍)が必要とするembedding計算は、この`semantic.embedding.search`capability resolutionそのものであり、IBD自身がembeddingベンダー・実行媒体を決定するのではなく、Infinite Coreのcapability/protocol解決へ委譲する(詳細: IBD `docs/architecture/pool-occurrence-driver.ja.md`)。

## 7. `⊥`(Last Order)とOAE記録(2026-09-13追記、Issue #50由来)

ψ/∇φ/λの3軸だけでFoldを再帰的に辿ると、無限/循環参照は構造的に必然発生する(奇数次元的な特異点。ポアンカレ–ホップの定理=毛玉定理を着想源とする、詳細は[`infoton-engineering.ja.md`] 6.1節)。これを「防ぐ」のではなく、**どこで・なぜ探索を打ち切ったかを記録して非破壊的に停止する**、というのが`⊥`の役割。`⊥`は[`infoton-engineering.ja.md`]第4節が既に定義している概念(「⊥を返せることが工学であるための否定射程になる」)であり、FQuery Core `ControlStatus`の`"bottom"`とも対応する。本節はこれをrefFAMの`Q`語彙自体、およびOAE記録側へ正式に橋渡しする。

`Q.⊥`はFQuery Core既存の`LastOrder`(`{code, reason, requestedNext, resumeWhen}`)をそのまま再利用する。新しい打ち切り語彙を独自発明しない。

```json
"Q": {
  "⊥": {
    "code": "FQUERY-FOLD-CYCLE-DETECTED",
    "reason": "Pool Occurrence Driverが無関係なdomainへ流れたため他の枝をlast-orderした",
    "requestedNext": "select-another-branch-or-widen-scope",
    "resumeWhen": "explicit-scope-widening"
  }
}
```

発火条件: fold-chain解決(`this.fold`等)での循環参照検出、Pool Occurrence Driver(旧スプリッター、2026-09-13改称。詳細はIBD `docs/architecture/pool-occurrence-driver.ja.md`)が分解結果を無関係なdomainへ流し込んだ際の兄弟枝への発行(枝は削除せず非ゼロサムで保持したまま「これ以上進めない」と明示する)、`QueryPolicy.limits`超過。

`⊥`の発火は、`OaeConstraintEvaluationReceipt`と同じ設計思想(Coreはdomain固有の成立条件を裁定せず、参照束縛と確定可能性だけを保持する)に沿った、fold last-order専用のOAE receipt型として記録する。

### 記号としてのψ/∇φ/λ/Q/⊥

これらが単語(`psi`/`lambda`/`bottom`等)ではなく単一unicode記号である理由: LLM tokenizerにとって、希少な単一記号は最小・安定したtoken単位になりやすく、既存語彙(英単語)が持つsubword分割の揺れや意味的connotationを引きずらない。表記の趣味ではなく、token境界を制御するための設計判断である。

## 8. Sphere/ASTROの責務分界

この構造体全体(Fold/DeFold/unFold、Q resolution、plugin binding)をmanagementするOSがSphereOSである。自我(ego/selfhood)・persona・ロボット等の用途(SphereASTRO)は、その**一consumer**に過ぎず、構造上の特権を持たない。[`no-generic-ego-denial-bias`]の原則通り、FAM/OAEは用法非依存のframework/言語であり、自我系だからといって特別な構造や特別な慎重さを追加しない。

## 9. FQuery `docs/specification/`への転記範囲

本書のうち、以下は**中立(SphereOS非依存)**であり、FQuery `docs/specification/`へ転記する:

- 第1節(Q宣言/実行分離)
- 第2節(tree-scoped解決chain、`fold` primitiveの追加提案)
- 第3節(実行primitiveの名前空間がpluginで決まる、というCore設計原則)
- 第4節(Fold/DeFold/unFold三分法、一般形)
- 第5節(戻り値は常にFAM、という契約)
- 第6節前半(モデル/Infinite CoreをCoreへ焼き込まない、という原則)
- 第7節(`⊥`/Last Order、OAE記録、symbol選択理由)

以下は**SphereOS Atlantis/ASTRO固有**であり、本書(manifest)側にのみ残す:

- Fold7G(G7 World〜G1 Reality)固有vocabulary — [`note/20260819-2212__SphereDOS_Fold7G_Fold8G_registry_upgrade_memo.ja.md`]参照
- 第6節後半・第8節(SphereOS/ASTROの責務分界そのもの)

## 10. 未確定 (`[UNKNOWN]`)

- ~~reject/blocked時の戻り値がFAM形式を保つか~~ → 2026-09-13の実装調査で解消。FQuery `packages/core/src/types.ts`の`CapabilityResult`(`pluginStatus?: "resolved"|"rejected"`、`candidate?`、`reason?`)が、例外を投げずrejectでも構造化状態とlosslessなcandidateを保持する契約を既に実装済み。`Q(scope).method(args)`の戻り値契約はこの既存ABIを土台にできる(詳細: FQuery `docs/specification/fam-q-declaration-execution.ja.md` §3.1、§5)。残るのは`CapabilityResult.value`がFAM型として型強制されていない点のみ
- ~~循環/無限参照をどう扱うか~~ → 2026-09-13、第7節`⊥`/Last Order + OAE記録として解消
- `Q(this.fold)`の具体的な解決アルゴリズム(別refFAM文書を開いた際、その文書内から見た「fold」が指す実体をどう識別するか、循環検出時に`⊥`を発行することとは別に、fold境界自体の識別・profileBindingsとの関係はまだ未確定)
- G5-equivalent causal boundary越えの`transition_ref`/OAE記録の具体的schema
