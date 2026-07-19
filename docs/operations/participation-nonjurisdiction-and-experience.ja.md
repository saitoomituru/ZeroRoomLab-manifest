# 異棚参加・相互非越権・Experience Receipt共通契約

状態: `[CANONICAL-CANDIDATE]` `[Layer A/B bridge]`
制定日: 2026-07-19
ライセンス: `CC-BY-4.0`
対象: Note、tutorial、CORN、Issue、review、World、Meta Engine Core、利用者体験

## 1. 目的

Sphere系repositoryへ、コードを書かない哲学者、神学者、宗教実践者、スピリチュアル実践者、
ゲーマー、ゲーム開発者、物語制作者と、工学者、法務、ガバナンス担当が、それぞれの言葉を
捨てずに参加できる境界を定める。

入口を広げることと、すべての主張をruntime仕様へ採用することは別である。Noteへ保存すること、
議論へ載せること、横断契約へ昇格すること、実装すること、特定Worldへ配信することを分離する。

```text
expression
  -> Note／Experience Receipt
  -> shelf-local review
  -> optional Bridge／CORN
  -> implementation proposal
  -> test／integration
  -> scoped distribution
```

## 2. 棚localの軽い入口

神学棚、スピリチュアル棚、ゲーム棚、哲学棚、物語棚のNote受付へ、工学、法務、医学、
ガバナンスの長い防戦文を既定で置かない。入口では、最低限次だけを確認する。

- 本人が提出権限を持つ文章・素材か
- secret、個人情報、第三者の非公開物を含まないか
- どの棚、World、positionから書いたか
- 原案、体験報告、実装claimのどれか
- 他者への具体的な危害命令または無断の実世界操作を含まないか

Noteのmergeは、positionを保存したというreceiptであり、全宗派、全World、Sphere Core、Originが
内容を普遍的真理として承認したことを意味しない。

工学、runtime、release、他棚の正本へ昇格するとき、対象scopeに必要なSchema、test、権利、
安全、運用、review gateを追加する。深いgateを入口へ逆流させない。

## 3. positionの自己申告

信仰、宗派、プレイスタイル、思想、persona、文化的立場は本人の自己申告を基本とする。文章の
語彙、行動、ユーザーmemory、過去会話からagentが推定しない。

宗教実践者または特定伝統の実践者として解釈をcommitする場合、公開を選んだ範囲で次を添える。

```yaml
declared_position:
  tradition_or_profile: self-declared
  statement: 本人が公開を選んだ信仰告白または立場
  claim_scope: このNoteが扱う範囲
  non_authority_scope: 裁定しない伝統、World、対象
  cross_tradition_bridge: opt-in | none
```

実名、戸籍上の宗教、所属団体、洗礼・入信記録等を必須にしない。匿名・handle・World内personaでも、
claim scopeを明示できる。信仰告白を要求されていない一般利用者へ公開を強制しない。

## 4. 相互非越権

- CatholicのNoteはLutheran、Sunni、律令神道、ゲーミング宇宙論を自動的に裁定しない
- Sunniの解釈は、明示的Bridgeなしに別宗派またはゲームWorldへ適用しない
- ゲーミング宇宙論は各宗教の教義正誤を裁定しない
- 工学者は神学的実在をruntime権限で否定または承認しない
- 神学・スピリチュアル側は性能、build、権限、試験結果を啓示で上書きしない
- Sphere Coreはどの宗派、ゲーム、プレイスタイルが正しいかを決めない

別伝統をつなぐBridgeはopt-inとし、両側のsource、変換範囲、失われる意味、reviewerを記録する。
相手伝統のreviewerが不在の場合、`cross-tradition-review-wait`として保持し、代理で承認しない。

## 5. user memory境界

会話AIのuser memoryは、本人向けtutorialの語彙や入口候補を一時的に選ぶために利用できる。ただし、
memoryにある宗派、健康、属性、過去発言を、Note、CORN、Issue、commit、PRへ自動公開しない。

公開前に、生成予定diffへ含まれるposition、名前、信仰告白、体験を本人が確認できる状態にする。
明示同意がなければ`not-published-from-memory`を返す。

## 6. 任意persona tutorial

次の自然言語入口を受け付けられる構造とする。

```text
このリポジトリーの<X>向けチュートリアル開始して
```

`X`は巫女、serverless engineer、哲学者、ゲーマー、艦隊運用ゲームの提督、Catholic、Lutheran、
Sunni、律令神道、陰陽師、MADカエル医者、MAD巫女等に限定しない。

- persona profileはdeclarative registryで追加する
- coreへ全personaをhardcodeしない
- 本人が複数profileを選べる
- 未登録profileは拒否せず`provisional-profile`としてUser Gateへ返す
- profileはpresentation選択であり、実装権限または真理判定権ではない
- 第三者作品名は参照aliasとして扱い、素材、ロゴ、公式提携を複製・主張しない

Noteだけを提出するrouteはVS Codeを必須としない。full development routeはGit、test、Sphere-DOS、
必要に応じてVS Codeまたは互換editorへ案内する。

## 7. Experience Receipt

利用者の次の表現を、有効な体験報告として受け付ける。

- 波動が合わない
- 何かズレる
- 面白くない
- クソゲフラグを感じる
- 説明が重い、怖い、薄い、退屈
- 操作が分からない
- 自分の宗派・プレイスタイルでは入れない

提出者へ技術的原因の特定を要求しない。raw expressionを保持し、工学側の仮説と分ける。

```yaml
experience_receipt:
  raw_expression: 利用者の原文
  reporter_position: self-declared | unknown
  world_ref: null
  presentation_ref: null
  observed_at: null
  impact: self-described | unknown
  hypotheses: []
  handling_state: collecting
```

Experience Receiptはbugの確定証拠ではないが、原因不明を理由に無効化しない。

## 8. 工学側の仮説分離

同じreceiptから、次を別branchとして検討できる。

- Core defect
- Presentation mismatch
- World／meta-algorithm mismatch
- tutorial不足
- player-skill／前提知識差
- cohort固有の摩擦
- intentional friction
- 未知の要因

採用可能な処理は一つに限定しない。

```text
fix implementation
change presentation
add option／accessibility profile
split World／meta-algorithm
collect peer-cluster review
adopt scoped no-change
wait for evidence／resources
```

`by design`はscope付きの設計判断として返せるが、報告者を黙らせる終了語にしない。少なくとも
受領、適用scope、判断理由、代替route、再検討triggerを返す。

## 9. cluster保持

ゲーマーを一群へ平均化しない。RTA、TAS、縛り、効率、エンジョイ、ネタプレイ、PvP、PvE、
modder、game developer等を自己申告clusterとして並存させる。宗教・神学側も宗派内差、地域差、
個人実践を一枚へ潰さない。

- multi-membershipを許す
- `unknown`と未申告を保持する
- 行動だけから宗派・属性を推定しない
- 母数と分布を示し、単純平均または多数決で少数clusterを消さない
- 小さいclusterを異常値として自動除外しない
- clusterはForge labelではなく専用registryを正本にできる

peer review待ちは放置ではなく`collecting`／`review-wait`という状態である。回答が集まらないことを
reporterの誤りへ変換しない。

## 10. Meta Engine Coreの非裁定

Meta Engine Coreがゲームcontent、宗教、Flavor、プレイスタイルを直接filterすると、複数Worldを
運ぶengineとして破局する。

```yaml
last_order:
  code: CORE-CONTENT-NONADJUDICATION
  action: require-explicit-scoped-authority
  recoverable: true
```

filterまたは制限が必要な場合は、次のどのauthorityによるかを明示する。

- World author
- user-selected profile
- server／community operator
- distributor
- applicable jurisdiction
- capability／security boundary

filterは可能な限り非破壊とし、sourceを保持し、別Presentationまたは別Worldを選べるようにする。
Coreが持つsecret、capability、scope、resource、実行安全のgateと、contentの正誤裁定を混ぜない。

## 11. Forge MapとQuest Map

同じstable IDへ二つの表示を接続する。

### Forge Map

工学者向けに、原案、契約候補、実装中、実装済み、test済み、integration済み、release済み、
resource waitを表示する。

### Quest Map

Meaning contributor向けに、原案、議論中、採用候補、Worldへ組込み済み、配信済み、遊べる状態、
別World分岐を表示する。

Flavor textや倫理探究束が積まれているだけの場合、実装済みquestに見せない。実装されていても
未配信なら、利用可能と表示しない。工学者が「次に何を実装できるか」を失わない状態表示を保つ。

## 12. Note pull request

codeを書かない参加者は、fork／branch／pull requestまたは接続済みSaaS AIのGit機能からNoteを
提出できる。merge権限はForge側policyに従い、AIやSphere-DOSが生成しない。

Note PRの最低検査は次とする。

- 許可path内だけを変更している
- provenanceと第三者素材の権利が記載されている
- secret、token、個人情報を含まない
- positionと非射程が必要な範囲で記載されている
- Noteを実装済み、canonical、配信済みへ誤昇格していない
- Markdownと必須sectionが成立する

runtime test、全宗派review、全World整合をNote入口の必須条件にしない。

## 13. 安全floorとappeal

genreの評判ではなく、具体的行為へ適用する最低floorを置く。

- doxxing、targeted harassment、脅迫
- 違法または物理的危害の実行指示
- 子どもの搾取
- 特定人物の犯罪を根拠なく事実断定する行為
- careの代替として提示される危険な医療指示
- 無権限のactuator、system、第三者data操作

拒否またはscope制限には、対象箇所、適用authority、理由、修正可能性、appeal／別World routeを返す。
神話、儀式、宗教、オカルト、陰謀テーマのfiction、NSFW-adjacent culture、制度批判というgenreだけで
最低floor違反へ分類しない。

## 14. 受入条件

- Note保存とruntime採用を区別できる
- positionを本人の自己申告として扱い、memoryから公開しない
- arbitrary personaとmulti-profileを拒否しない
- raw Experience Receiptを原因仮説から分離する
- cluster別分布と少数意見を保持する
- `by design`応答にscopeと再検討triggerがある
- Core content filterに明示的なscoped authorityが必要になる
- Forge MapとQuest Mapで実装・配信状態を誤表示しない
- merge権限なしをNote提出失敗へ変換しない

## 15. 正本境界

本書は横断運用契約を定める。Atlantisのpersona registry、tutorial resolver、Note template、
Experience Receipt Schema、validator、testはSphereOS Atlantis repositoryを実装正本とする。
特定宗派、ゲーム、Worldの内容は、それぞれのauthor／communityが制定する局所正本へ委ねる。
