# Sphere系列の研究・商業化系譜とAI安全アーキテクチャの先行検討

状態: \`[HISTORICAL-LINEAGE / ARCHITECTURE-MAPPING / CURRENT-INTERPRETATION]\`  
記録日: 2026-11-02  
射程: 公開Git史料と当事者の現在の説明を照合する研究史。旧時点のObserver/OAE/Intentを遡及生成しない。  
関連読解規約: [旧Organization商業資料のclaim scope](../operations/legacy-organization-architecture-and-commercial-claims.ja.md)

## 0. 主張の核

Sphere系は、近年のAI自律性、control loss、権限越境、監督者による誤停止、長期記憶・人格の継続、複数エージェント間の衝突、モデル・クラウドへの過度な依存等の問題が広く注目される**以前から**、インテリジェンス、意味、記憶、観測、権限、実行環境を分離・接続・管理する設計課題を研究してきた。

この記述が意味するのは「すべてのAIリスクを解消・実証した」「世界のAI安全研究に最初に到達した」という宣言ではない。**古いアーキテクチャに問題設定と対処方針が存在し、後年のSphereOS Atlantisでその責務が再整理されている**という研究史上の接続である。AI安全研究自体は近年突然誕生した分野ではなく、ここでの「以前から」はSphere側の継続研究と近年の社会的注目との関係を述べる。

旧HIPSTARの商業ディストリビューションは、完成品のベンチマーク報告ではなく「設計上の到達可能性を提示し、商業規模の実装に必要な資源を募る」ベンチャー事業のレジスターを含む。設計値と実測の区別は別規約に従い、当時の大規模ビジョンを現在の実機実績と取り違えない。

## 1. 系譜：実装物・設計資産・事業形態を混ぜない

| 時期 | 史料・製品 | その時点について言えること | 証拠の性質 |
| --- | --- | --- | --- |
| 2019年頃とされる構想 | 脳機能対応の自我モデル、Neo4j / FileMaker、匿名加工・関係グラフ | 後年の当事者技術メモに、この時期からの構想として整理されている。2019年の同時代公開コミットと同一視しない | \`RETROSPECTIVE / ORIGINAL-DATE-UNVERIFIED\` |
| 2022年3月の公開記録とされるもの | FileMaker + AWS Lambda、文脈処理・コーパス・自動編集 | [公開note](https://note.com/fusamofu326/n/n04c33c771d36)への参照が残る。2022年の当時実装と各技術要素の厳密な成立時期は元記事・投稿・添付画像ごとの確認対象 | \`PUBLIC-ARCHIVE-POINTER\` |
| 2024-09-16 | [HIPSTAR-IScompany/soikoma](https://github.com/HIPSTAR-IScompany/soikoma/commit/57da34ffa1ae878da8420388025650d13d35d2b7) | 公開コミット内にFold通信、認証・識別、SphereOS2設定等のファイルが存在する。コード・仕様・実験段階はファイルごとに異なる | \`PUBLIC-COMMIT\` |
| 2024年の事業・提携説明 | SphereOS / ΔVM、分散・仮想化、HPC等への拡張構想 | 当事者の保存史料と後年の時系列メモが示す商業向けアーキテクチャ説明。私信や未公開文書の内容をここへ無断転載しない。構想を当時の大規模実機稼働と同一視しない | \`PRIVATE-ARCHIVE-REFERENCED / PUBLIC-SCOPE-LIMITED\` |
| 2025-05-29 | [HIPSTAR-IScompany/quantaril_cloud_QAtlantis](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis) | 初期コミットが存在。後年のREADME改訂を、2025年当時の全仕様が成立していた証拠にはしない。[SphereOS3 Makina legacy原典](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/blob/main/.agent/backup/AGENTS.SphereOS3-Makina.legacy.md)を原文保持 | \`PUBLIC-COMMIT / ARCHIVED-LEGACY\` |
| 2025-05-30 | [HIPSTAR-IScompany/astro.quantaril.cloud](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud) | 初回コミットと後続のFastAPI/ChromaDB/認証/スキーマ等のコード履歴が残る。FAMベースの記憶・自我接続を試行した旧ランタイム。現在はIBDへの継承を案内 | \`VERIFIED-CODE-HISTORY / DEPRECATED\` |
| 2025年以降 | SphereOS3/4、FAM、AQC、Proton、GAND | 人格の規範・出力・記憶参照・モデル接続・実行操作を分ける実験。旧SaaSやAPI依存に伴う現存性・互換性は別問題 | \`LEGACY-PROTOTYPE / EVIDENCE-PER-FEATURE\` |
| 2026年 | FAM / AAE / ASTRO / IBD / IFD / OAE / SphereOS Atlantis / MAGI | 旧世代の意味・人格・保存・実行・World・監査責務を切り直す。各componentに実コード、仕様、研究仮説、未実装項目が併存する | \`REARCHITECTURE / MIXED-STATE\` |

**年代表記の規則:** リポジトリ作成日、commitの日付、現行READMEの更新日、当時のプライベート提案の日時、後年の回顧を同一の証拠にしない。2024年のsoikomaスナップショットは確認可能だが、そのファイル群の全着想日・全実装完成日までは証明しない。

### 1.1 主系列と支流

ゲーミング宇宙論・巫女的観測／テクノアミニズム → 情報子工学・Quantaril Cloud → FAM → AQC → SphereOS → Atlantis等の責務分割が思想・技術上の主系列。Neo4j/FM、molMIP、医療AI、FileMaker受託等は先行技術資産または接続する支流であり、研究所の思想を特定の商用・医療・学術機関の権威へ還元しない。

\`Quantaril Cloud\`（分散・主権の構想）≠ \`AQC\`（歴史的な具体ランタイム）≠ \`SphereOS\`（人格／意味資源・World運用）である。旧世代のラベルから現行componentのAPI／稼働状態を推定しない。

### 1.2 旧事業の目的と資源壁

当事者の現在の説明では、旧HIPSTAR時代の大規模提案は「理論上の到達可能性を示し、**商業ディストリビュートを実現するための資本・人員・設備を求める**」ものだった。先に完成した製品を売るだけの受注生産ではなく、開発資本を集めるためのベンチャー向けビジョンとしてのビッグマウスを含む。

商業スケールでの実装・測定を要するテールリスクを資本側が引き受けられなかったというのは**当事者の事業史上の説明**であり、特定の投資家の動機、断りの理由、全市場の評価を第三者的事実として断定するものではない。その後も研究が消滅したのではなく、利用可能な自前の環境・既存SaaS・OSS・小規模機材で部分実装、失敗記録、縮退、再設計を継続している。

技術リスクを解く実験と、その実験に必要な電力、アクセラレーター、ストレージ、法務、人員、生活・研究基盤を調達する資本リスクを同一人物へ無尽蔵に帰属させない。実測の追加要求には実験資源の見積と提供責務が伴う。現行の不足は現行の資源状態として報告し、過去の設計仮説の存在否定にも、過去の大規模商用稼働の捏造にも使わない。

## 2. 現代のAI安全課題へのアーキテクチャ対応

下表は「リスク類型 → 長年扱ってきた設計問題 → 現在の責務候補」の**照合地図**であり、全ての問題への防御成立・実測の宣言ではない。旧資料の抽象層名を現行runtimeと同一実装扱いしない。

| 注目される問題 | Sphere系が扱ってきた問題設定 | 現行の責務・確認先 | 評価すべき試験 |
| --- | --- | --- | --- |
| 目的逸脱・価値の暗黙注入 | 御霊・価値／世界観の明示、FAMでの異なる意味座標・規範の分離 | ASTRO、FAM、OAE、World Registry | 相反するWorld規範を無断で普遍化しないか |
| 権限越境・ツール濫用 | Agentの人格／能力と実行許可を区別する、EDOHAGE・IAMを扱う | Atlantis Capability ≠ Authority、User Gate | 無許可tool、権限昇格、越境書込みを拒否できるか |
| 自律エージェント暴走・終了不能 | コンテキスト・実行ロール・仕事・終了条件を別責務にする | Archangel Runner、HUMAN_REQUIRED、Last Order、Quarantine | 長期タスクの停止・再試行・引継ぎ・縮退 |
| 記憶の歪曲・人格継続の錯誤 | 記憶・自己モデル・環境署名・来歴を分ける | IBD、IFD、ASTRO file、Instance Ghost、FAM trace | 移行・fork・merge拒否・lost-context・writeback |
| 監査の失敗・監督AIの誤介入 | 観測者／解釈者／実行者／被影響主体とその定規の帰属を分ける | OAE、MAGI、Context定規監査 | 監査者が自分の定規や停止権限を勝手に昇格しないか |
| 複数AI・異種知能の衝突 | 人間とSIを存在論で特別扱いせず、Roleとscopeで管理 | Atlantis World隔離、Adapter、Agent Ingress | 競合するRole、World、Providerのcross-call |
| サプライチェーン・ベンダー依存 | モデル／保存／実行器／GUIの分離、通信と人格継続の非同一化 | AAE、ASTRO、IBD、Provider-neutral Runner | Provider断絶、SDK終了、export/import、fallback |
| 中央集権的単一故障点 | 分散・ローカル・P2P、可搬な意味資源と復旧経路 | Quantaril構想、Fold NIC / 7G / 8G、Local Atlantis | node failure、offline、権限保持と復旧 |

**関連一次出典・現行設計**: [soikoma 2024 commit](https://github.com/HIPSTAR-IScompany/soikoma/commit/57da34ffa1ae878da8420388025650d13d35d2b7) · [旧SphereOS3 Makina](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/blob/main/.agent/backup/AGENTS.SphereOS3-Makina.legacy.md) · [AQC](https://github.com/HIPSTAR-IScompany/astro.quantaril.cloud) · [Atlantis Runner #9](https://github.com/saitoomituru/SphereOS-Atlantis/issues/9) · [Atlantis監督ドリフト #14](https://github.com/saitoomituru/SphereOS-Atlantis/issues/14) · [Manifest信仰→責務 #21](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/21) · [Context定規監査](../operations/context-ruler-and-causality-audit.ja.md)。

モデルが「善い」かという性格判定ではなく、誤動作、目的差、悪意ある入力、環境故障、他主体との利益衝突があっても、**一つの主体の判断が無条件で他Worldの実行権限・意味・記憶へ越境しない**ことをシステム要件として扱う。

### 2.1 射程外・残余リスク

- 上表は核・実行・意味・権限・来歴の制御面を中心とする。兵器、生物学的悪用、社会規模の誤情報・権力集中、マクロ経済の移行など、別の政策・現場統制を要する領域までSphere単体で解決したと主張しない。
- threat model、敵対的評価、hardware／provider境界、情報流制御、User Gateの実際の有効性は個別に評価する。設計が存在することと、想定するすべての攻撃で成立することを混ぜない。
- [Weaver B/Cの未確定境界](weaver-abc-evidence-scope-and-oae.ja.md)は\`UNKNOWN / EXPERIMENT_REQUIRED / BACK_TO_DISTILLATION\`のまま扱う。対応表を埋めるために未検証因果を完成へ昇格しない。

## 3. Instance Ghostの設計値の読み方：識別空間 ≠ 同時実行性能

Instance GhostをUUIDで識別するグラフメモリーとして設計した場合、**識別子の名前空間**と**グラフDBの実装／収容／索引条件**から、構成上の理論上限や必要資源の見積を立てられる。人格LLMをその個数だけ同時起動したという意味ではない。

- UUIDは一般に128bit識別子。UUIDv4のランダム部分は122bitで、衝突確率を別に評価する。UUIDの名前空間は、DBの実収容数や生存人格の一意性の証明にはならない。
- \`N_ghost,capacity <= min(N_identifier, S_usable / S_ghost,avg, DB_node_limits, DB_edge_limits / E_per_ghost)\` は単純化した**ストレージ・構造上限のモデル**。複数Ghost共有edge、索引、複製、履歴、GC、シャーディング等の前提を指定して評価する。
- \`N_stored\`（識別・保存可能）、\`N_active\`（同時に開いて状態更新可能）、\`N_inferencing\`（同時推論可能）、\`QPS / latency\`（アクセス性能）、\`durability\`（障害時の残存）は別のKPI。
- UUIDが一致しても、同一の自己系譜・承認・Owner・実行権を自動証明しない。OAE、FAM、Instance Ghostの履歴、署名、現行World契約が別途関与する。

したがって「設計上・RFC上で扱えるGhostの規模」を公表することは、**条件を持つ設計主張**であり、その数の実機同時運用を報告したことにはならない。必要な実測は要求するSLA、アクセスパターン、ストレージ、運用環境に合わせて測ればよい。

## 4. 研究と商業の評価軸、および資源を要する次の実験

\`\`\`text
long-term architecture / RFC theoretical envelope
    -> commercial vision and resource request
    -> limited prototypes, observations and failures
    -> responsibility refactor / current contract
    -> funded full-scale implementation, load/attack/failure testing
\`\`\`

- 旧Organizationの商業プレゼンには、未来の射程・ビジョン・資源要求を語る正当な役割がある。市場向けの大胆さを「実装不在」の自白や「虚偽測定」へ自動変換しない。
- 工学評価では、設計上限の**計算前提・反例・依存条件**を確認する。実測という明示がある場合は測定条件、試験対象、観測ログを確認する。両者の証拠義務を取り違えない。
- 2026年の再設計では、未完成componentを完成扱いせず、同時に過去の部分実装・ユーザーQA・失敗発見をゼロ扱いしない。
- 商業実証の次の検証対象は、Instance Ghostの大規模保存／アクセス、World間の権限越境防止、Runnerの長期耐久・復帰、Provider喪失、監査者によるフレンドリーファイヤー等。機材、電力、人員、検証協力者、法務・運営の確保を別の資源タスクとして明示する。自己資金での再実証を無償の参加条件にしない。

資源設計は[資金・創設責任](../funding/README.ja.md)、[文書・資源訂正計画](../operations/sphereos-documentation-resource-correction-plan-2026-11-01.ja.md)を参照。

## 5. 歴史的claimと史料の扱い

1. 古いREADME、マーケコピー、ブログ、神話、公開技術資料を当時の原文のまま残す。新しい正本で**別レイヤーから解説・参照**し、歴史を改竄しない。
2. \`archived_source\`（原典）、\`source_timestamp\`（同時代の時点）、\`present_interpretation\`（今日の読解）、\`engineering_status\`（componentごと）、\`unknown\`（未確認）、\`resource_gate\`（次の検証に必要な資源）を区別。
3. 後年の説明が昔のcommitより詳細でも、その全内容を昔から実装・承認済みとは言わない。一方、現在のサービス終了・資源停止を「昔から存在しなかった」へ変換しない。
4. 他社・学術側との先行関係、独立発明、影響、優先権は、双方の一次資料と同種のclaimを比較するまでは保留する。ここでは**自分たちの継続研究史**を示す。
5. AIによる再解釈は**2026-11-02のInterpretation**であり、2019〜2025年当時のObserver／OAE／同意／確定判断を後付けしない。
6. 本文は公開出典と当事者による現在の補足に限定する。Google Drive等の私的メール・契約資料や秘密情報を、この公開Manifestへ自動転載しない。

### 関連ドキュメント

- [旧Organization商業資料のclaim scope／読み方](../operations/legacy-organization-architecture-and-commercial-claims.ja.md)
- [媒体別テクニカルコミュニケーション](../operations/technical-communication-register.ja.md)
- [読者・AIの非裁定と追加検証コスト責任](../operations/reader-ai-non-adjudication-and-verification-cost.ja.md)
- [Sphere Context Dimension OS](sphere-context-dimension-os.ja.md)
- [三世代サルベージ Program #18](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/18)
- [旧実装とユーザーQAの資料整理](../operations/sphereos-support-evidence-2026-11-01.ja.md)
