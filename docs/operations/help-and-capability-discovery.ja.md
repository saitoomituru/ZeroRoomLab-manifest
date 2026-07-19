# Help／Capability Discovery共通契約

状態: `[CANONICAL-CANDIDATE]` `[Layer A/B bridge]`
制定日: 2026-07-19
ライセンス: `CC-BY-4.0`
対象: SphereOS Atlantis、Sphere-DOS、tutorial、SaaS AI、VS Code、Codespaces、非code参加者

## 1. 目的

repositoryまたはtutorialをロードしたAIが、利用者をManifest制定者、maintainer、熟練coding agentと
同じ背景知識を持つと仮定し、案内より先に実装を開始するcontext事故を防ぐ。

Helpはcommand一覧の別名ではない。プロジェクトの現在能力、未実装境界、参加入口、必要環境、権限、
変更の有無を利用者の言葉へ写像し、次の行動を本人が選ぶまでmutationを止める減圧室である。

## 2. persona、習熟度、意図を分離する

```yaml
help_context:
  personas: []
  proficiency: unknown
  intent: look-around
  requested_route: help
```

- `persona`: ゲーマー、神学者、巫女、工学者等の自己申告Presentation
- `proficiency`: `unknown | newcomer | explorer | contributor | maintainer`
- `intent`: `look-around | learn | write-note | report-experience | inspect | implement`

personaから習熟度、権限、信仰、職業、実装意図を推定しない。工学者にもHelp routeを残し、ゲーマー、
神学者、スピリチュアル実践者を初心者へ固定しない。初期値は`proficiency: unknown`、
`intent: look-around`とする。

## 3. Help開始時の不変条件

Help／tutorial開始要求だけでは、次を行わない。

- branch作成、file変更、commit、push、Issue／PR write
- dependency install、component clone、model call、外部network
- merge権限、code変更権限、World authorityの付与
- user memoryからのpersona、宗派、健康、属性、熟練度公開
- 未実装機能を実装済みまたは利用可能として案内

```yaml
help_receipt:
  mutation_performed: false
  network_access_performed: false
  permissions_granted: false
  identity_inferred: false
```

利用者が`implement`を明示した後も、AGENTS.md、Manifest、CORN、必要なMAGI、対象Schema／test、権限を
解決してから通常の実装routeへ遷移する。Help表示を実装承認へ変換しない。

## 4. 最初に返す内容

Helpは、少なくとも次を短く提示する。

1. このプロジェクトは何か
2. 現在できること
3. 足場だけ存在するもの
4. 未実装・未試験・資源待ち
5. codeを書かない参加方法
6. 開発環境と必要権限
7. mutationを伴わない次の選択肢

既定の選択肢例:

```text
1. プロジェクトの地図を見る
2. 実装済み機能だけを見る
3. 未実装Questを見る
4. Noteを書く方法を見る
5. Experience Receiptを送る方法を見る
6. 開発環境を確認する
7. branchを切って実装する手順へ進む
```

利用者が選ぶまで`7`を自動選択しない。

## 5. capability状態

Helpは、最低限次の状態を分ける。

| 状態 | 意味 |
|---|---|
| `AVAILABLE-NOW` | 現在の証拠範囲で利用・検証できる |
| `SCAFFOLDED` | 文書、Schema、CLI入口等の足場があるが本体ではない |
| `NOT-IMPLEMENTED` | 原案、契約、Questはあるが実装されていない |
| `NOT-TESTED` | 実装または足場はあるが対象環境で未試験 |
| `RESOURCE-WAIT` | 火力、実機、quota、第三者review等を待つ |
| `UNKNOWN` | 現在のsourceでは判断できない |

`SCAFFOLDED`を`AVAILABLE-NOW`へ、`UNKNOWN`を成功へ、Noteを実装へ昇格しない。各項目へ可能な範囲で
source、revision、test条件を添える。

## 6. 自然言語入口とmachine出力

次のような表現をHelp開始として扱える構造にする。

```text
このプロジェクトは何？
何ができる？
初心者向けHelpを開始して
ゲーマー向けに見学したい
コードを書かずに参加したい
実装済み機能だけ見せて
```

machine出力は最低限、次を持つ。

```json
{
  "status": "HELP-READY",
  "proficiency": "unknown",
  "intent": "look-around",
  "capabilities": [],
  "entry_options": [],
  "mutation_performed": false,
  "network_access_performed": false,
  "permissions_granted": false,
  "identity_inferred": false
}
```

CLI、VS Code task、SaaS AI、Codespacesのどの入口も同じ意味契約を使う。特定vendorのchat UIや
memory機能をHelp Coreへhardcodeしない。

### 6.1 PLI、CLI、Execution Envelopeを分離する

自然言語からHelp、設計、Note、review、実装引渡しへ進むSurfaceを、本契約では
`Prompt Line Interface`（PLI）と呼ぶ。PLIはChat bubble、特定vendor UI、Assistant人格、LLM driverの
別名ではない。目的、問い、制約、Context、希望する結果を提示し、意味とrouteを対話的に解決する
`S4: prompt`入口である。

```text
PLI   Prompt Line Interface
      主にD軸のContext Dimension、nD Fold、World、意味、目的、unknownの探索へ向く

CLI   Command Line Interface
      主にL軸のruntime、library、SDK、applicationをcommandとargumentで高強度に拘束する

LLMI  Large Language Model Interface
      model、provider、inference driverを接続するExecution Envelope側の境界
```

この区分は絶対的な能力階級ではない。PLIもSchema、tool contract、approval gateで拘束を強められ、CLIも
DSL、script、compositionで抽象構造を扱える。CLIの実行可能性をD軸上の意味妥当性へ、PLIの説明可能性を
L軸上の実装・再現・実行保証へ昇格しない。

PLIからLLM、provider、model、Assistant／Persona／NPC role、repository権限、Python process、
standalone runtimeの有無を推定しない。これらは必要に応じて、次の独立fieldへ記録する。

```json
{
  "interface": {
    "id": "prompt-line",
    "display_name": "Prompt Line Interface",
    "scoped_alias": "Atlantis PLI"
  },
  "interaction_profile": "assistant",
  "bindings": {
    "persona": null,
    "world": null,
    "entity": null
  },
  "execution_envelope": {
    "inference_driver": "unknown",
    "local_process": "unknown"
  }
}
```

`PLI`は既存略称と衝突し得るため、実行command、package名、file extensionの既定値にしない。
machine IDは`prompt-line`、従来CLIは`command-line`とする。Prompt Engineering EditionをCLIの模倣、
再現物、偽物、非正規経路と表示しない。

### 6.2 Interface差を真贋差へ変換しない

repository内の文書またはcodeが正本sourceであることは、そこへ接続する一つのInterfaceだけが本物で
あることを意味しない。次を分離する。

```text
Authenticity       署名、出所、改ざん、なりすまし
Provenance         repository、revision、契約、観測の来歴
Interface          PLI、CLI、GUI、API、IDE等の相互作用面
Execution Envelope model推論、local process、connector、container、bare metal等
Capability         読む、生成する、試験する、commitする、deployする等
Authority          read、write、push、merge、device control等の権限
Engineering State  AVAILABLE、SCAFFOLDED、NOT IMPLEMENTED、NOT TESTED等
Receipt            実際に行った処理、観測条件、結果
```

`Python process unavailable`はExecution Envelopeの情報であり、PLIの真贋判定ではない。
`standalone runtime: NOT IMPLEMENTED`も特定capabilityの状態であり、Prompt Engineering Edition全体を
未実装へ丸めない。境界説明は関連する操作が要求された時に遅延表示し、Help冒頭では現在利用できる入口と
選択肢を先に示す。

## 7. 棚別Presentation

共通能力mapを棚ごとに言い換えてよい。

- ゲーム棚: World Map、Quest、実装済み機能、Portal、未攻略、クソゲーフラグ報告
- 神学・スピリチュアル棚: Meaning、World、Agency、非越権、Note、観測記録
- 工学棚: architecture、Schema、test、runtime、未実装、resource、branch
- 情報子工学棚: FAM、Registry、OAE、provenance、探索技、変換境界

Presentation差によって基礎状態、権限、実装証拠を変えない。ゲーマー向け説明で未実装を配信済みQuestに
せず、工学向け説明でMeaningを不要なFlavorへ縮退させない。

## 8. 実装routeへの遷移

実装へ進むには、少なくとも次を満たす。

```text
intent == implement
target selected
context closure complete
write scope known
required hook complete
```

不足時は`HELP-READY`または`CONTEXT-INCOMPLETE`へ戻し、勝手に最小実装を始めない。merge権限がない
参加者はfork／PR routeへ案内し、`PR_SUBMITTED`を正常終了として扱う。

## 9. 受入条件

- Help要求だけではmutation、network、権限付与を行わない
- persona指定だけで習熟度または実装意図を推定しない
- proficiency不明をexpert／maintainerへ補完しない
- AVAILABLE、SCAFFOLDED、NOT IMPLEMENTED、NOT TESTED、RESOURCE WAIT、UNKNOWNを分離する
- codeを書かないNote／Experience入口を提示する
- 工学者にも見学・Help routeを残す
- machine出力をSaaS AIが再提示できる
- CLIやVS Codeがなくても文書から開始できる

## 10. 正本境界

本書は横断Help契約を定める。Atlantisのcapability registry、persona／proficiency resolver、CLI、
human／JSON renderer、fixture、testはSphereOS Atlantis repositoryを実装正本とする。
