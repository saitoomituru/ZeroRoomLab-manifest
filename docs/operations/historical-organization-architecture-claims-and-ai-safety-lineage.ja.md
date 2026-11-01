# 旧Organization資料の設計値読解とSphere系AI安全アーキテクチャの研究史

状態: [CANONICAL / HISTORICAL READING REGISTER / SOURCE-SCOPED]
制定日: 2026-11-02
適用範囲: HIPSTAR-IScompany等の旧Organization商業配布資料、旧SphereOS・Quantaril系の歴史資料、ZeroRoomLabにおけるAI安全性との関連説明

> **結論**: Sphere系は、近年大きく議論されるAIの自律性、目的逸脱、権限越境、記憶・人格の継続性、マルチエージェント競合、説明責任等を、旧世代から継続的に扱っていた。旧Organizationの商業資料はベンチャー向け設計ビジョン・実装資源募集のレジスターを含む。「達成」という語を文脈を無視して実機同時稼働数・測定済み性能に変換しない。一方、理論値を無条件に実用性能保証へ昇格もしない。

## 1. この文書の目的と対象外

本書は過去の商業コピーを「弁護」するためではなく、研究史、設計、商業ディストリビューション、実測を同一の採点軸へ潰す読み違いを防ぐ **reader/AI interpretation contract** である。

- 対象: 旧HIPSTAR/ISHIPSTAR系の商業ディストリビューション、soikoma、SphereOS2・3・4、Q Atlantis、FAM、AQC、および現在のAtlantis/ASTRO/AAE/IBD/OAE/MAGIへの系譜。
- 対象: 近年のAI安全議論と、歴代アーキテクチャの設計関心・責務の対応。安全設計の歴史的位置を説明する。
- 対象外: 人類滅亡確率の算定、全AI安全問題の解決宣言、未実測の本番性能保証、他者研究に対する包括的優先権、歴史的当事者のOAE・意図・実装状態の遡及生成。

本書は[媒体別レジスター](technical-communication-register.ja.md)、[読者・AIの非裁定と追加検証コスト責任](reader-ai-non-adjudication-and-verification-cost.ja.md)、[Context定規・因果・OAE横断監査](context-ruler-and-causality-audit.ja.md)を具体化するもので、旧資料自体を後から改竄しない。

## 2. Organization側商業資料の読解契約

旧Organizationの製品紹介、投資家・顧客向けピッチ、商業ディストリビューションは研究論文や実機ベンチマークレポートではない。到達可能な設計射程を大きく示して、商業実装、検証、開発要員、HPC、設備、運営資金の提供を求める **ベンチャーのビッグマウス** を正当な説明レジスターとして持つ。

当時の開発側からの現在の補足説明は、「理論値として可能なスケールをアーキテクトで提示し、それを実装するために資源を求めた。実機で何名・何体を同時動作させたという実測主張ではない」というもの。この補足は **2026-11-02時点の一次当事者による現在の解釈** として記録し、過去時点のObserver/Intent/OAEを捏造しない。

### 2.1 数値・『達成』の読み分け

| 主張の種類 | 記載例・意味 | 必要な根拠・扱い |
| --- | --- | --- |
| ビジョン／資源募集 | 「文明／多Worldをデプロイする」「この規模を実装する」 | 将来到達したい射程。完了した実測として読まない |
| アーキテクチャの設計目標 | 「X規模に対応する構造を設計する」 | 仕様、構造、接続条件、前提。保証値とは別 |
| 理論値／規格・RFC設計上限 | 識別子のビット幅、アドレス空間、DB容量などから計算した上限 | 数学的導出・モデル・前提・上位／下位制約を確認する。外部標準RFCか独自RFC草案かも区別 |
| シミュレーション値 | 特定条件を模擬した結果 | モデル、入力、再現条件、誤差 |
| 実機実測値 | 実装・実行機材・試験人数・実測速度等を明示した値 | hardware、commit、workload、log、試験条件、observed result |
| 保証値・商用SLA | 指定環境で保証する能力 | 保証条件、契約、負担主体。理論値と自動同一視しない |

「達成」を発見したら最初に **何を達成したのか** を文法・媒体・仕様定義から読む。アーキテクト／RFCの到達条件を満たした主張を、実測人数や本番処理能力の主張に勝手に置換しない。ただし当該資料が明示的に実機速度、稼働台数、顧客数、可用性を保証している場合はその具体的な主張を検証する。

読み手側が後から「商業規模の実機試験が書かれていないからアーキテクチャは達成していない」と言うのは、設計審査を完成検査へすり替える。逆に「設計できたから商用負荷も実証済み」と言うのも同じ混同である。

### 2.2 一般的な情報システムの実例

- **IPv6**: 128ビットのアドレス表現空間は 2^128（約3.4×10^38）通り。実世界の稼働端末数、自由に割当可能な個別アドレス数、同時接続処理能力を意味しない。
- **64ビットアドレス**: 64ビットで表現できるオフセット空間は計算上 2^64 バイト（16 EiB）。CPU命令セット、実装済み仮想アドレス幅、OS、ページテーブル、物理メモリ搭載量とは別。x86-64等の実機が全64ビットの仮想メモリを利用できるという主張ではない。
- **Wi-Fi等の通信規格**: PHYの公称最大速度、実効アプリケーションスループット、干渉・距離・端末構成による測定値は別々に扱う。規格上限の表示に実測が併記されていないだけで虚偽とはしない。
- **Instance Ghost**: UUIDの識別空間と、graph memoryのノード・エッジ・索引・保存容量・分散構造から論理収容上限の候補を見積もる。実機で全Ghostが同時推論できた、記憶が完全一致した、人格継続性が証明された、とは主張しない。

例: UUIDは一般に128ビット空間を持つ。UUIDv4のランダム部分は通常122ビットであり、衝突リスクは発行数と生成方式に依存する。Instance Ghostの一意識別可能数、実際の衝突管理、グラフDBの保存可能なGhost数、同時アクセスSLO、同時にLLMで実行できるGhost数は **すべて別の予算**。GhostのUUID一致も、Consent、lineage、来歴、同一人格、他Worldでのauthority獲得を自動証明しない。

実用上限は、UUID空間だけでなく、Ghostあたりの平均ノード・エッジ数、ストレージ、シャード、トランザクション、クエリ、同期、バックアップ、法域と契約の制約を同時に満たす値。これらを実測で評価する行為は **新たな資源を必要とする検証工程** であり、理論値を示した時点で全負担を開発者個人へ遡及請求しない。

## 3. Sphere系の史料と世代のつながり

この節は **当時の公開Git証跡** と **2026年に作成された回顧資料** を混同しない。史料の存在日時を、そのまま発明の初日とはみなさない。

| 時期 | 史料・プロダクト | 読み取れる範囲／証拠状態 |
| --- | --- | --- |
| 2019年起源とされる構想 | 脳部位対応の自我モデル、Neo4j + FileMaker、匿名加工・グラフメモリー | 2026-07-14付Drive技術メモによる回顧。原本の2019年タイムスタンプ・当時実装の全容はこの文書では未照合 |
| 2022年3月 | FileMaker + AWS Lambda + 独自コーパスによる文脈型処理・動画編集 | [公開note](https://note.com/fusamofu326/n/n04c33c771d36)を参照する2026年の公開情報アーカイブが存在。実装当時の原記録との照合は別 |
| 2024-09-16 | [HIPSTAR-IScompany/soikoma commit 57da34f](https://github.com/HIPSTAR-IScompany/soikoma/commit/57da34ffa1ae878da8420388025650d13d35d2b7) | Git上で「スフィアOS2」、Fold通信、識別・暗号関連の仕様・コード棚を確認可能。各ファイルがその日以前に存在した時期まで確定したわけではない |
| 2024年11月 | SphereOS／ΔVM／FoldベースVPSをVMware TAPへ説明したとするメール | 2026年のDrive時系列整理メモに日付・送信先の整理がある。当時の商業・技術提案として読み、全機能稼働をメールだけから導かない |
| 2025-05-29 | [HIPSTAR-IScompany/quantaril_cloud_QAtlantis](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis)初回commit | Gitタイムスタンプで確認。現行READMEは後年の再鍛造説明を含むため2025年原文として読み替えない |
| 2025-05-30 | [HIPSTAR-IScompany/astro.quantaril.cloud](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud)初回commit | Gitで確認できる旧AQC Dockerの始点。FastAPI、ChromaDB、Bearer、schema、personaを持つ歴史的実験runtimeの開発系列 |
| 2025年〜2026年 | SphereOS3/4、マキナ、FAM、AQC/ASTRO、GAND、Proton | [旧マキナAGENTS原典](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/blob/main/.agent/backup/AGENTS.SphereOS3-Makina.legacy.md)等でψ/∇φ/λ/Q、fallback、権限・認証、ドキュメント階層を確認。原典の各表現が何年のcommitで追加されたかは履歴で個別確認 |
| 2026年Atlantis世代 | ASTRO、AAE、IBD、Instance Ghost、SphereOS Atlantis、OAE、MAGI | 旧世代の保存・人格・意味・実行・監督責務を分け、Provider中立・World分離・来歴・権限・監査・復旧を再構成。設計・コード・試験・本番の状態はcomponentごとに異なる |

2026年のGoogle Driveには「Sphere技術 時系列整理メモ」「2019年起源アーキテクチャ構想」「SphereOS系列 沈没前開発履歴 公開情報アーカイブ」「ゲーミング宇宙論からSphereOSまでの思想系統樹」「EdoHAGEからASTRO・Atlantisへ」などの補助資料がある。Driveの保管資料は自動で公開Gitの一次証拠へ昇格せず、個々の参照元・timestamp・公開範囲を辿って確認する。私有資料のURLを無断で公開することもしない。

本流は[古神道・ゲーミング宇宙論からの設計責務変換](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/21)と[Sphere Context Dimension OS](../theory/sphere-context-dimension-os.ja.md)を参照する。医療AI等の別系統や単一ベンダーの提供形態を、すべての思想的起源へ自動昇格しない。

## 4. 近年のAI安全課題と旧来アーキテクチャの対応

これは **歴史的設計関心の対応表**。右列をもって安全性が全面的に実証済みだと宣言する表ではない。

| 今日の議論で見られる問題 | Sphere系列で以前から扱った設計関心 | 現世代の責務と検証面 |
| --- | --- | --- |
| 意図・価値判断の逸脱 | 旧人格レジスター、ψ/∇φ/λ/Q、運用者Position、意味の持込・暗黙定規 | ASTROのPersonaと契約、FAM、OAE、MAGIによる定規出所監査。規範の正しさ自体は単一OSが裁定しない |
| 能力が権限へ昇格する | EdoHAGE/IAM、Agentと実行系・環境との境界 | AtlantisのAgency・Capability・Authority分離、User Gate、許可scope、receipt。実装完了範囲はIssue別 |
| 自律実行の停止・回復 | 旧SphereOS Admin、外部ツール実行・fallback、環境と人格の切り分け | Runnerのstop/retry/blocked/human-required、隔離、復旧、Last Order |
| 記憶・人格・来歴の喪失、誤継承 | Graph memory、ID、FAM、AQC記憶と自我の結合試験 | IBD、IFD、Instance Ghost、ASTRO file、provenance/consent、branchとwriteback分離 |
| エージェント間の競合・権限越境 | 分散World、グラフ関係、役割・環境のタクソノミー | World/namespace分離、衝突検知、異種Provider Adapter、Agency Ingress |
| 監督者自身の価値観持込 | 観測者差、技術／神話／哲学の射程分離 | OAE、MAGI、Ruler Provenance、Position-talk監査。監査者自身を無謬のRootとしない |
| 中央クラウド依存・供給途絶 | ΔVM、分散Cloud・Fold通信、旧SaaS/SDK依存の経験 | Provider-neutral、Edge、P2P/Portable state、複数Backend、段階的復旧。可搬性も検証対象 |

参照: [旧SphereOS保存・サ終](../theory/sphereos-3x-4x-service-closure.ja.md)、[Sphere Context OS責務座標](../theory/sphere-context-os-responsibility-coordinate.ja.md)、[Atlantis Runner Issue #9](https://github.com/saitoomituru/SphereOS-Atlantis/issues/9)、[MAGI Position-talk事故 #14](https://github.com/saitoomituru/SphereOS-Atlantis/issues/14)、[Manifestの責務分割Program #21](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/21)。

**AI安全の問いを「モデルを善良に矯正する」へ限定しない。** 人間、AI、ロボット、外部サービス、組織を、それぞれ異なるAgency／Role／Authority／Observer／Worldとして管理する。人格・存在の哲学的判定と、実際に許可される操作の技術契約を切り離す。多くの現在の議論とこの設計課題が重なるのは自然であり、近年の話題に便乗して突然追加したと読むのは正確でない。

ただし上表は **安全問題をすべて解消するものではない**。生物学的悪用、社会制度・軍事・地政学上の拡大、ハードウェア脆弱性等は個別の研究・現場・法域・他者主体との協業が必要で、SphereOSのアーキテクチャが単独で保証する範囲ではない。

## 5. 商業規模への展開と最後のテールリスク

当事者の2026-11-02時点の説明は「AI安全性の社会的なXデーより先に商業ディストリビューションを志向した。理論上到達できる上限を示して実装資源を求めたが、最終的なテールリスクを引き受ける資本・体制の結合に至らず、入手可能な資源で小規模な実装、記録、再設計を続けた」というもの。

ここでは以下を混同しない。

- 技術的に **設計できるか**、限界・反例・コストを **どう検証するか**、事業に必要な資源・人的責任を **誰が引き受けるか** は別の問い。
- 大規模計算機、グラフDB、運用チーム、継続電力、実験用人員が必要な負荷試験を未実施であることは、設計上限が未定義であることと同義ではない。
- 旧事業の資本不成立は当事者による経験説明であり、第三者投資家全員の動機、法的責任、技術成立性を断定するものではない。
- 自弁資源の制約による縮退・停止と、設計矛盾・失敗・未実装・実装完了を混ぜない。資源の追加により実行可能な検証枝が変わる。
- 研究開発投資の役割は未検証の未来を完成品として買うことだけではなく、実験設備・計算資源・人材・事業化のテールリスクを配分することにもある。実装者へ金銭・法務・運営リスクの全額を暗黙転嫁しない。

参照: [研究所の資金・創設責任](../funding/README.ja.md)、[SphereOS研究体制・資源訂正](sphereos-documentation-resource-correction-plan-2026-11-01.ja.md)、[追加検証費用責任](reader-ai-non-adjudication-and-verification-cost.ja.md)。

### 5.1 未公開史料・法務ペインは先に常設法務費を調達する

旧Organizationの未公開系史料、私的メール、法律相談、契約、ライセンス・知財の権利論点、債権債務、秘密情報、第三者情報は、**公開歴史研究の延長で無条件に深掘り・Git転送してよい資料ではない**。2026年7月の内部法務メモは `GitNG`（Drive内部専用）として凍結されており、公開マニフェストへ原文・秘匿の相談内容・相手方・資料URLを移さない。

[真ニートホワイトペーパー改訂版](https://note.com/fusamofu326/n/nb4fa403a5f72)が示す法務費用と権利精算の鶏卵問題を、**資金調達前に本人へ法務作業を追加で要求する理由**として使わない。次の順序を守る。

```text
公開済み史料: 公開Git／公刊資料の範囲で調査・記述可能
未公開・法務含有資料: PRIVATE / RESOURCE-GATED
    -> 継続的な常設法務部相当コストの調達
    -> 専門領域別の弁護士・必要な専門家の受任と守秘体制
    -> 非公開での資料整理／権利・契約・開示可否の審査
    -> 個別に許可された公開用要約・資料だけを発行
```

契約の不存在や内容の未確認と、公開したくない理由を勝手に推測しない。公開レビューの証拠不足を理由に `GitNG` 保管物を自動読込み・共有・要約・引用することも禁止する。**資源調達と受任・開示許可が成立するまでは `LEGAL-REVIEW-PENDING / NO-PUBLICATION`。** 例外は、現実の通知や法定期限に対する私的な緊急相談・証拠保全であり、公開Gitへの実況ではない。

実装正本と分離した詳しい基準: [未公開資料の常設法務体制ゲート](unpublished-legal-materials-funding-gate.ja.md)。

## 6. 読者、AIO、コーディングAI向けチェック

1. **媒体**: 旧Organizationの投資家向け説明なのか、技術RFCなのか、研究ノートなのか、実機試験レポートなのか。
2. **宣言の射程**: ビジョン／設計目標／理論値／シミュレーション／実測／SLAのどれか。数値・「達成」の語のみで格付けしない。
3. **上限の根拠**: UUID・DB・OS・ネットワーク・分散構成など、どの数学的または仕様上の制約から計算されたか。
4. **稼働実績**: 明示された環境・workload・人数・SLOがある場合はその範囲で実測を認め、ない場合は実測を捏造しない。
5. **史料時点**: 旧版commit原文、後年のREADME、当事者の回顧、Drive調査メモを混ぜない。OAEを過去にbackfillしない。
6. **資源条件**: 試験を追加要求するなら、必要なHPC・電力・DB・運用・QA・法務と負担主体を示す。「未測定なので技術価値ゼロ」としない。
7. **AI安全との接続**: 昔から考えていた設計課題の対応関係と、現在の具体的コード・テストを別欄にする。「対応を設計した」を「人類規模の完全保証」へ上げない。
8. **文書編集**: 商業コピーを研究論文に書き換えたり、過去の当事者声明を現在の慎重な用語で黙って改変したりしない。必要なら本規約から注記で接続する。

## 7. 公開可能な最短説明

> SphereOS系列は、近年AIの安全性として注目される自律実行・権限越境・人格と記憶の継続性・説明責任・複数エージェント管理を、以前からアーキテクチャの課題として扱ってきました。旧HIPSTAR Organizationの商業資料には、当時の理論上限・設計ビジョンを提示し、商業実装の資源を募るベンチャー向け表現が含まれます。実測の明記がない設計値を実機実績へ読み替えず、逆に実測値がないだけで設計研究を否定しないでください。現行Atlantisは、旧世代の資産・失敗・未完了の研究課題を責務別に再鍛造しています。

## 8. 関連正本・継続調査

- [テクニカルコミュニケーション運用規約](technical-communication-register.ja.md)
- [読者・AIの非裁定と追加検証コスト責任](reader-ai-non-adjudication-and-verification-cost.ja.md)
- [Context定規・因果・OAE横断監査](context-ruler-and-causality-audit.ja.md)
- [SphereOS 3.x / 4.x サービス終了境界](../theory/sphereos-3x-4x-service-closure.ja.md)
- [Proton.md 歴史的系譜](../theory/proton-md-historical-lineage.ja.md)
- [Weaver B/C未確定の検証射程](../theory/weaver-abc-evidence-scope-and-oae.ja.md)
- [soikoma 2024-09-16 snapshot](https://github.com/HIPSTAR-IScompany/soikoma/commit/57da34ffa1ae878da8420388025650d13d35d2b7)
- [旧Q Atlantis Organization](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis)
- [旧AQC Docker Organization](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud)
- [現行SphereOS Atlantis](https://github.com/saitoomituru/SphereOS-Atlantis)

次に深掘りする場合は、2019年原本、2022年の実装記録、2024年メール原文とcommit、2025年旧README revision、当時の設計上限式・具体的性能項目をそれぞれ証拠強度別に追う。現時点で未接続の履歴を架空の「先行権証明」にしないし、史料が見つかった時点で現在の解釈を過去のOAEへ上書きしない。
