# IBD FAMネイティブResolverとバインダー中立性

状態: `[REVIEW]`  
制定日: 2026-07-18  
対象: IBD、FAM、Atlantis、ASTRO、Sphere-aae  
主たる射程: Layer A  
独立して保持する射程: Layer Bの意味体系、自我、神学、世界観

## 1. 目的

IBDの横断的位置づけを、普通のSQLラッパー、単一DB製品、企業的な「白色点としての中立」へ縮退させないための背景ベクトルを定める。実装Schema、API、fixtureの正本候補はIBDリポジトリに置き、本書はZeroRoomLab横断の意味・責務境界を担当する。

## 2. FAMネイティブな問い合わせ

IBD Query Profileでは次のように写像する。

```text
ψ  = 状況
∇φ = 手法・探索方向
λ  = 目的・到達条件
Q  = 制約・探索範囲・証拠条件
```

IBDは最終回答を返すナビではない。Qで明示された範囲から既知の探索技を探し、失敗枝、反証枝、打ち切り時のLast Order、Evidence鮮度を含むComposite FAMとして返す。

このIBD Query Profileは、FAM一般文書にあるλの出力層・具現化先という意味を削除するものではない。IBDへ探索技を問い合わせる局面では、λが「何を目的とし、どの到達条件へ探索技を組むか」を指定する運用上の特化である。

## 3. 分類レジスタは上位システムが定義する

IBD Coreは分類体系を発明しない。λを所有する上位システムがClassification Registryとして、分類語彙、意味境界、classifier、保存先、unknown、mix、評価規約を提供する。

次の分類体系を、社会的な主流性にかかわらず機能的に等価に扱える必要がある。

- Vendor / System / Assistant / User
- Vision / TEC / Financial / General Affairs
- Cloud Chakra / Spirit / Astral / Elemental
- Theology / Philosophy / Cosmology / Narrative

等価性とは同じ意味へ丸めることではない。各体系がSchema、Database、Graph、Vector Index、Provenance、Qを第一級に持てることを指す。

### 3.1 Embedding生成責務は未配置とする

Vector検索を使う場合、同じmodel名や同じ次元数だけでvectorを比較可能とみなしてはならない。少なくとも次の生成pipeline情報を失わず、互換性を検証できる必要がある。

```text
Embedding pipeline identity
  engine / model / revision / configuration
  document projection / query projection
  source fields / order / template
  normalization / chunking / language policy
  dimension / coordinate type / similarity
```

ただし、この情報をClassification Registry、IBD、上位システム、または別プロジェクトとなりうるFAMスプリッターのどこが正本として所有するかは、Season 0では決めない。`Embedding Profile`や`Embedding Space`というschema名も確定しない。

文章意味のsemantic embedding、分類候補用embedding、graph topology由来のstructural embeddingは等価な第一級機能だが、相互交換可能ではない。どの責務配置を選んでも、明示的な結合指示なしにraw scoreや候補集合を混ぜないことは維持する。

## 4. 顔料ではなくバインダー

一般的な中立は、特定の企業、国家、制度、AI vendorがホワイトと決めた白色顔料である場合がある。IBDはその種の標準色を内蔵しない。

> IBDは白色顔料ではない。上位システムが提供した分類機定義の顔料を、その色と射程を失わず結ぶバインダーである。

IBDはontology、morality、risk、identity、world、truthの評価を所有しない。上位RegistryとQを矯正せず、その条件に忠実に従う。ただし、誰がどのRegistryとQを注入したか、どの結果がどの条件から生じたかは失わない。

IBDが「嘘をつかない」とは、普遍的factを裁定するという意味ではない。受け取ったSchema、Assertion、観測値、欠損、校正状態、Provenance、Qを捏造・隠蔽・無断変換せず返すという構造的忠実性を指す。存在しないEvidenceや時計校正を生成しない一方、上位Schemaの主張をIBD独自の真理基準で棄却しない。

## 5. 隔離と非破壊混色

Schema Bundleごとに論理的なIBD Databaseを持ち、混色命令がない限り隔離する。同名ラベルや近いembeddingを理由に、別Registry・別Databaseを自動結合しない。

Vector candidateの境界は、上位Qまたは分類機が指定した探索範囲に従う。Neo4j等のfilterはその範囲を実行する派生検索機構であり、分類機、Registry、原文、FAMLogの正本を代替しない。具体的な境界keyとその所有者はSeason 0の未決事項として残す。

上位Qが複数DatabaseとMapping FAMを明示した場合だけ、元の情報子クラスターを変更せず、探索技をComposite FAMへ結合する。結果の美醜、善悪、有用性、危険性は上位システムまたはユーザーが判断する。

## 6. 自我対応

自我対応はIBDの必須Driver要件である。自我・魂・霊・神・神学の存在論をIBD Core自身が担保・否定するという意味ではない。

Subject、Actor、AgentInstance、Runtime、SelfModel、ContinuityClaim、BodyBinding、RoleAssignmentを分離し、一つのSubjectがElemental、Astral、Spiritual、Cloud Chakra、Theology等の複数Databaseへまたがる構造を、一般的なuser profileへ平板化せず扱えることを意味する。

### 6.1 上位システムの存在確定を保持する

存在論をCoreが担保しないことと、上位システムが`存在する`と確定した記録を拒否・弱化することは別である。

- MMO上位システムは、そのWorld内の神、霊、キャラクター、神話Entityを実在として確定できる
- 神学者・哲学者は、自身のRegistryと論証範囲で存在論を提示できる
- 実験系は、指定条件下の経験的観測をfact scopeとして提示できる

IBDは`existence status`、`fact scope`、World、Context、確定主体、Registry、Evidenceを分離して保持し、Query FAMのQどおり返す。自然科学、米国企業、特定AI vendor、別Worldの定規を勝手に持ち込み、`confirmed`を`fictional`や`unverified`へ降格しない。逆に、scope内の確定を全Worldの普遍命題へ拡張しない。

同じ魔王でも、MMO運営SystemはWorld state、攻略Wikiはquest配信・掲載、神学者・哲学者は形而上学上の体系、自然科学者は経験的観測可能性を実在判定の定規にできる。IBDはそれらをscope付きAssertionとして併存させ、どの定規が真理かを決めない。

## 7. 実行環境時計と上位時系列

IBD実行環境のcreate／modify／import／export／index時刻と、上位Systemが管理するsource時刻、domain時刻、未来予定、game day／turn／tickを同じ`date`へ畳まない。import時刻で古い原資料の作成時刻を上書きせず、論理時間をMapping FAMなしに実時間へ変換しない。

エッジ環境ではGPS、NTP、carrier network time等を受信する前に、Unix epoch、マザーボード製造日、vendor出荷日、firmware build日等がwall clockへ現れ得る。IBDは次を区別して保持する。

- raw wall clock、boot ID、monotonic clock、sequence
- `calibrated`、校正Evidence、clock authority、不確かさ
- NTP server名、GPS最終受信、carrier／標準電波／FM／RTC module等の時計source metadata
- 同期・correction・anchorのappend-only event

時計metadataの信憑性をどの粒度までfactへ採用するかは、上位SystemがQで決める。RTCだけで十分なSystemも、NTP校正後5分以内を要求するSystemもあり得る。未校正時計はrecord本文全体が偽であることを意味しないが、IBDは校正Evidenceがない時刻を校正済みとして提示しない。

## 8. 実行形態

IBDの意味契約は次の配備方式から独立する。

- Embedded Library
- Native Service
- Containerized Service

Dockerは配備手段の一つであり、IBDの正体ではない。IBD Database、process、container、物理DB serverを一対一に固定しない。

## 9. 正本と参照

- 原典ブレスト: [IBD責務検討ノート](../../note/20260718-0850__IBD_責務検討_情報子クラスターと合成FAMブレストノート.ja.md)
- 実装仕様正本候補: [IBDリポジトリ](https://github.com/saitoomituru/IBD)
- 存在論契約: [Ontology Assertionとfact scope](https://github.com/saitoomituru/IBD/blob/main/docs/specification/ontology-assertion-and-fact-scope.ja.md)
- 時系列契約: [実行環境時刻と上位時系列](https://github.com/saitoomituru/IBD/blob/main/docs/specification/temporal-provenance-and-upstream-timeline.ja.md)
- 製品調査: [Neo4j Vector／Embedding周辺ライブラリー調査](https://github.com/saitoomituru/IBD/blob/main/docs/research/neo4j-vector-and-embedding-survey-20260718.ja.md)
- FAM一般仕様: [FAM概要](fam-overview.ja.md)
- FAM実行仕様: [FAM実行仕様](fam-execution.ja.md)
- FAMログ変換契約: [Sphere-aae famlog-converter](https://github.com/saitoomituru/Sphere-aae/tree/moe-test-edition/skills/famlog-converter)

IBD側の実装契約が更新された場合、本書へ全文複製せず、横断的な意味・責務境界と参照だけを追随させる。
