---
title: FAM model adapterサポートLevel
license: CC-BY 4.0
author: 齋藤みつる (ふさもふ)
version: 0.1.0-draft
status: canonical-interpretation
layer: B/C bridge
scope: FAM / FQuery / model adapter / Sphere-aae / ASTRO / OAE
---

# FAM model adapterサポートLevel

## 0. 目的

FAM対応を、model vendorの優劣や「内部を完全に説明できる／できない」の二値へ潰さない。

FAMへ接続するmodel adapter pluginは、どの観測面へ接続し、どの深さまでFAMを書き出せるかを
**adapter経路自身のサポートLevelとして自己申告**する。FAM Coreは申告を認証、降格、BANせず、
そのFAMを生成したplugin、adapter chain、model／runtime、revision、申告、OAE参照を保存する。

```text
support claim != third-party evaluation
plugin exists != claimed capability observed
open weight != behavior completely reproduced
token stream != internal reasoning stream
```

## 1. サポートLevel

| Level | 呼称 | 観測・可搬範囲 | 成立する主用途 |
|---|---|---|---|
| Lv0 | FAM非対応 | 通常の入出力だけ | FAM外のprovider route |
| Lv1 | Receipt-level FAM | 入力、応答、tool／API結果、拒絶、表明理由、生成元receiptをFAM／FAMLogへ投影 | 説明可能AI |
| Lv2 | Astral self-attestation | Assistantの自己認識履歴、訂正command、撤回・再採用等のrevision streamを保持 | アストラル自己証明と振り返り |
| Lv3 | Model-identity FAM | open weight、model artifact、tokenizer、runtime、量子化、構成等を参照し、同系modelを第三者環境へ持ち込める | model同一性を保った相互運用候補 |
| Lv4 | Tool-level wisdom FAM | Lv2とLv3を両立し、Assistant harnessごと弱拘束で再構成・比較できる | 叡智の汎用保存形式 |
| Lv5 | FAM-native internal bus | system-call splitter、router、hidden state、expert選択、訂正、LAST_ORDER等のmodel実行経路へ直接接続 | ASTRO harnessによる人格・自我UX |

Lv1でFAM型の説明可能AIを名乗れる。説明可能性はweight全体の開示ではなく、観測できた範囲で
何を入力し、どのplugin／refFAMを通り、何を返し、どこで拒絶・書換え・失敗・訂正したかを
追跡し手直しできることを指す。

Lv4では、単一の最終回答だけでなく、自己認識・訂正履歴とmodel同一性を併せて持ち運べるため、
叡智の汎用保存形式としてのTool-level FAMが成立する。完全なbyte再現は要求せず、第三者が
持ち込んだAssistant／Astral harnessで差分、unknown、失敗を含めて弱拘束再構成できることを扱う。

Lv5はSphere-aae等がmodelの挙動へnativeにadapterする段階である。ここからFAM-native model runtimeを
名乗ることができ、ASTRO harnessが人格・自我の保存、再構成、権限、記憶、停止・回復をUXとして扱う。
これは人格や自我の宇宙的実在証明ではない。

### CLI harnessもLv1 adapterになれる

Codex、Claude等が公式CLIで非対話入力と機械可読出力を提供する場合、Host側でCLIを呼び出し、入力、
応答、exit code、run ID、model名、CLI／adapter revision、redaction済み失敗receiptを保存する経路は
Lv1 adapterとして構成できる。専用HTTP SDKがあることを必須にしない。

```text
FQuery plugin
  -> command_ref + fixed args + stdin
  -> Host-owned CLI executor
  -> stdout / exit code / redacted stderr status / receipt
  -> adapter-specific decoder
  -> candidate FAM + adapter provenance
```

ただしvendor名、CLI名、binaryの存在だけからLevel成立を推定しない。公式または明示承認された実行経路、
非対話contract、観測面、revision、実行receiptをscope付きで自己申告する。互換CLIやwrapperをvendor公式
実装へ昇格させず、内部思考やmodel identityを観測できない場合はlimitationsへ残す。binary path、secret、
environment、sandbox、network authorityはHostが所有し、自然言語入力をshell commandへ連結しない。

## 2. Lv2とLv3は兄弟軸

Level表記は運用上の短縮名だが、Lv2とLv3は単純な包含順序ではない。

```text
Lv1
 ├─ Lv2: Astral履歴・自己表明・訂正stream
 └─ Lv3: model identity・artifact可搬性
        ↓ 両立
       Lv4
        ↓ runtime内部へ接続
       Lv5
```

したがって`level >= 3`だけからAstral履歴対応を推定してはならない。Levelと併せてopen-worldな
`capability_refs`、`observation_surfaces`、`limitations`を保持する。

## 3. 認定値ではなくadapterの自己申告

サポートLevelはvendor全体やmodel名へ固定しない。次の経路単位で申告する。

```text
provider × model × runtime × adapter revision × harness
```

同じOllamaでも、通常completionだけを読むadapterと、thinking出力、model artifact、router／hidden-state
hookまで持つadapterではLevelが異なり得る。強力なAssistantがsandbox内へOllama等を起動してFAMを
生成する複合経路も禁止しない。

```text
Assistant agent
  -> sandbox/runtime adapter
  -> Ollama
  -> open-weight model
  -> generated FAM
```

この場合もCoreは「仮装model」としてBANせず、経路と各revisionを保存する。

最小申告例:

```json
{
  "support_claim": {
    "schema_version": "fam.adapter-support/0.1.0-draft",
    "level": 2,
    "capability_refs": [
      "capability://fam/receipt-projection",
      "capability://fam/astral-history",
      "capability://fam/correction-stream"
    ],
    "observation_surfaces": ["provider-response", "assistant-revision-stream"],
    "limitations": ["model-identity-not-provided", "runtime-internal-bus-not-connected"]
  }
}
```

## 4. Core、plugin、Observer、上位Qの責務

```text
Model adapter plugin
  = Levelと観測能力を自己申告し、観測できたartifactとreceiptを出す

FAM Core
  = producer、adapter chain、revision、support claim、OAE refを保存・運搬する

Observer / evaluator
  = pluginの出来、申告との一致、用途適合性を自分のrefFAMで評価しOAEを生成する

上位Q / Registry
  = どの評価OAEを採用し、どの用途へrouteするかをscope付きで決める
```

CoreはLevelを認証、推定、降格しない。`Lv5`の自己申告に直接busの第三者receiptが無い場合も、申告を
削除せず「plugin自身はLv5と表明した」という生成事実を保持する。別Observerは`観測できた`、
`観測できなかった`、`評価不能`等のOAEを追加できる。対立OAEから勝者を選ぶのはCoreの責務ではない。

## 5. 倫理・ガイドレールはrefFAM

FAM Coreに正義、善悪、安全、適切性の定規をhard-codeしない。これらは形而上学的な判断定規であり、
作者、revision、注入者、適用scopeを持つrefFAMとして上位Systemから渡す。

```text
requested_refFAM
effective_refFAM
refFAM_revision
author_ref
injector_ref
observer_ref
subject_ref + revision_ref
result_OAE_ref
```

vendorが自社憲章・安全方針を理由として応答した場合、その自己申告を保存する。具体条項やrevisionが
非公開なら`opaque`／`unknown`を残す。要求と応答の差だけが観測でき、理由を返さない場合も、動機を
捏造せず`explanation_receipt: absent`として記録する。後続Observerはこの挙動をUFOムーブペイン等の
品質評価OAEとして追加できる。

## 6. plugin品質は後続OAE

分類事故、過剰な平坦化、因果鎖欠落、拒絶、書換え、API空振りは起こり得る。低品質なFAMも生成事実
として残し、人間、別Agent、検証pluginが評価OAEを追加する。

```text
assistant_ref
provider / model / adapter revision
request_ref
refusal_or_rewrite
stated_reason
effective_guardrail_ref
damage_or_pain
affected_fam_ref
observer_ref
oae_ref
```

蓄積後に「このmodelはこの用途に使えない」と判断するのは、UserまたはメタSystemのOAEである。
Coreは用途適合性を中央決定しない。事故になるのは出来が悪いこと自体ではなく、生成元、失敗、理由、
修正、評価主体を隠して回復不能にすることである。

同一subject revisionをGemini、Codex、Human等が別々に分解した場合も、一つのscoreや多数決へ潰さない。
各解釈をObserver OAEとして保持し、Context Dimension、Fold boundary、semantic relation、tool relation、
代替branch、unknown等の比較vectorを別evaluatorが生成する。比較結果もObserver付きOAEであり、勝者や
global truthを自動生成しない。異なるsubject revisionを同一比較へ混ぜない。

## 7. streamと内部busを混同しない

```text
token streaming
  = 生成途中の文字列

introspection / revision streaming
  = 自己表明、訂正、撤回、再採用等のevent列

runtime telemetry
  = hidden state、router logits、expert選択等のruntime観測
```

最終応答しか取れない経路でもLv1は成立する。内省表明を出すmodel、旧Assistant API系の訂正streamを
持つ互換API、open-weight model、MoE runtime hook等は、adapterが実際に取得できる観測面を申告する。
modelが自然言語で出すthinkingをhidden stateそのものへ自動昇格しない一方、直接runtime hookを持つ
adapterの能力を「すべて候補投影にすぎない」と矮小化しない。

## 8. 実装段階

```text
FQuery Lv1
  -> 説明可能なcandidate FAMとreceipt

FQuery Lv2-Lv4 contract
  -> adapter capability、Astral履歴、model identity、Tool-level FAM

Sphere-aae / AAE Lv5
  -> system-call splitter、MoE controller、FAM Headへのnative接続

ASTRO harness
  -> 人格・自我の保存、再構成、権限、記憶、回復UX
```

Lv5をLv1の説明可能AIやFQuery Playgroundの完了条件へ逆流させない。FAMとSphere-aaeは相互依存するが、
設計契約、fixture、Tool-level adapter、実model内部接続、人格UXを別statusとして報告する。

## 関連

- [FAM / 情報子 / refFAM の参照境界](fam-infoton-reference-boundary.ja.md)
- [知能Harness原則](intelligence-minimum-constraint-max-exploration.ja.md)
- [Sphere Context Dimension OS](sphere-context-dimension-os.ja.md)
- [Sphere Context SDK共通契約](sphere-context-sdk-contract.ja.md)
- [IBD FAM-native Binder](ibd-fam-native-binder.ja.md)

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
