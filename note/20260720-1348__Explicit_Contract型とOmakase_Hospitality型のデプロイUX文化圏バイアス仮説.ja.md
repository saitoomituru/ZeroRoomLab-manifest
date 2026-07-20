# Explicit Contract型とOmakase Hospitality型のデプロイUX文化圏バイアス仮説

状態: `[DRAFT] [HYPOTHESIS]`
棚: `design-philosophy / cross-shelf`
種別: `brainstorm`

## 作成メタ

```yaml
created_at_system: 2026-07-20T13:48:10+09:00
timezone: Asia/Tokyo
clock_source: host_system_clock
clock_calibration: unverified
declared_position:
  - お手軽デプロイにおける「勝手にしない」と「よしなにする」の設計傾向を比較する
  - 文化的比喩を人間集団の本質認定ではなく、製品UXと責務分配の監査定規として保存する
claim_scope:
  - installer、deploy action、CLI、運用UIの初回導入と失敗案内
  - 責務内の自己治癒、確認flag、receipt、責務外分類
non_authority_scope:
  - 西洋人、東洋人、日本人、組織または利用者個人の本質、能力、人格の分類
  - あらゆる製品文化、地域文化、法域、開発組織への一般化
  - 特定UXが普遍的に優れているという裁定
historical_oae: historical-oae-unavailable
interpretation_oae: current-session
```

システム作成時刻は、対象World内の時刻、出来事の発生時刻、原資料の作成時刻を意味しない。

## 対象・範囲

Quantaril Cloud Q Atlantisを、GitHub Actionsからさくらの共有hostingへ配置する検討中に、次のUX差が見えた。

- 指定されたdeploy先directoryが存在しない場合、errorで止まり「先に作成してください」と返す
- deploy actionの責務内としてdirectoryを作成し、作成不能な場合だけ権限errorを返す
- 既存directoryに何か入っている場合、無条件上書き、常時停止、target identityを照合して確認のいずれを選ぶ
- 転送成功を完了とするか、公開URLから同じreceiptを取得できるまでを完了とするか

これらはアルゴリズムの正誤だけでは決まらない。利用者が期待する「気が利く」「勝手にするな」「簡単」
「玄人向け」の境界に関わる。

## 事実・観測 `[FACT]`

1. 対象の静的site deploymentでは、鍵認証SSH、SFTP、SCPの接続と往復を限定条件で観測した。
2. 当初指定されたdeploy先directoryは存在せず、転送は`No such file or directory`で停止した。
3. 親directoryへの書込みは可能であり、installerまたはdeploy actionが対象directoryを作る技術的余地があった。
4. directory作成、既存物の上書き判断、DNS、TLS、document root、cache確認は、同じ「deploy」の中でも
   異なる責務境界を持つ。
5. この限定観測だけから、地域別利用者全体の期待や文化差を実証したとは扱わない。

## 二つの設計傾向 `[HYPOTHESIS]`

### Explicit Contract型

利用者が明示した操作だけを実行し、不足物や次の判断を利用者へ返す。

長所:

- surprise mutationを避けやすい
- componentごとの責務が明確になりやすい
- 自動修復が別systemを壊すriskを抑えやすい
- automationを機械的に監査しやすい

破局候補:

- 想定可能な初期不足まで利用者へ押し戻し、指示待ちUIになる
- error handlingとrunbook読解の工数を利用者側へ集中させる
- アルゴリズムは正しくても、同じsetupを何度も手で直すdebug沼になる
- 「仕様です」がExperience painを閉じる防戦になる

### Omakase Hospitality型

目的と許可scopeから不足を推定し、責務内の可逆な補修を「よしなに」行う。

長所:

- 初回導入の認知負荷を下げる
- directory作成等の定型作業をinstaller側へ回収できる
- 成功地点までの案内が一つの体験として連続する
- errorを次の行動へ翻訳するおもてなしを組み込みやすい

破局候補:

- component同士が同じ不足を直そうとして責務が重なる
- 「どうぞどうぞ」でauthority、所有者、cleanup担当が不明になる
- 善意の自動選定が利用者の意図しない上書きやvendor default固定を生む
- 失敗を隠す過剰fallbackになり、何が起きたか分からなくなる

`西洋型`、`東洋型`、`日本型`という言い方は、設計会話の短い比喩として現れることがある。しかし本Noteでは、
地域、人種、国籍、言語共同体の本質へ固定しない。西洋圏にもHospitality型はあり、日本製品にもExplicit型はある。
実際の採用判断は、対象利用者、変更risk、可逆性、運用権限、製品Positionごとに行う。

## Atlantis型の合成候補

二つを平均化せず、操作ごとに次の契約を持つ。

```text
safe default
  -> 責務内か
  -> 可逆か
  -> target identityを確認できるか
  -> 自動補修
  -> receipt

uncertain or irreversible
  -> dry-run / preview
  -> -y相当の明示flag
  -> authority確認
  -> 実行またはrefuse

out of scope
  -> 勝手に直さない
  -> どこまで成功したかを返す
  -> DNS / TLS / docroot / cache等の候補へ分類
```

### deploy actionへの写像例

| 状態 | 既定動作 |
|---|---|
| deploy先directoryがない | 許可されたroot配下なら作成 |
| directoryを作成できない | 権限問題として停止 |
| directoryが空 | 初回installとして続行 |
| 同一製品のreceiptがある | 旧versionとして上書き |
| receiptなしで既存fileがある | 停止し、内容確認後の`-y`を要求 |
| 別製品のreceiptがある | 汎用`-y`では貫通せず、migrationへ分離 |
| file転送に成功 | まだ完了としない |
| 公開URLから今回のreceiptを取得 | `PUBLICATION_OBSERVED` |
| 公開URLで取得できない | DNS、TLS、HTTP、docroot、cache候補を返す |

「公開されない原因を全部deploy actionが修理する」ことは要求しない。責務外を`知らんがな`とする自由はある。
ただし、単に切り捨てるのではなく、観測済み境界と次の担当候補を返すところまでをUX責務とする。

## 暗黙をWorld Configへ告白する

Atlantisは、地域文化、作者の好み、maintainerの善意、AIの推測をOS全体の暗黙defaultへ置かない。
そのWorldが何を「よしなに」行い、何を必ず尋ね、何を拒否するかは、World Config、SDK profile、installer
contract等へ宣言する。

短い原則:

> お前のスピリチュアリティは、お前が告白して実装しろ。

ここでいうスピリチュアリティは、宗教・霊的実践だけを指さない。製品が大切にする気遣い、驚かせない約束、
自動補修の美学、失敗時の礼儀、利用者との距離等を含む。AIやOSが作者に代わって勝手に発見・認定するものでは
なく、作者、World builder、運営者が責任とともに表明する。

```yaml
hospitality_policy:
  create_missing_deploy_directory: true
  overwrite_same_product_revision: true
  adopt_unknown_directory: explicit-confirmation
  overwrite_foreign_receipt: forbidden
  verify_publication_receipt: true
  repair_dns_or_tls: out-of-scope
  report_observed_boundary: required
```

これは固定schemaではなく、現在のSakura Matchbox profileを説明する擬似例である。stable field、default、継承、
override、互換性、署名、migrationは未制定である。

World Configへ書いたから何でも許可されるわけではない。利用者の同意、host権限、外部service契約、法律、
不可逆操作のUser Gateは別軸で保持する。また、別Worldへ接続する際に一方のHospitality policyを相手へ暗黙継承
させない。互換しない場合はPortal、adapter、別profileまたは明示的な拒否へ分ける。

## KPIと検証の射程

次は観測できる。

- 初回成功率
- 手動介入回数
- directory不足等の自動修復率
- rollback率
- target identity conflict検出数
- buildから公開receiptまでの時間
- error分類後に解決まで到達した割合

ただしKPIだけで「気が利く」「安心」「勝手にされた」「玄人向け」等のExperienceを裁定しない。初心者、運用者、
security担当、共有hosting利用者等のreviewをclusterとして保持し、単一平均へ潰さない。

## MAGIポジショントーク監査

```yaml
declared_position: reversible-self-healing-with-explicit-boundaries
position_talk_risks:
  - western-users-as-command-only-stereotype
  - japanese-users-as-implicit-consent-stereotype
  - automation-convenience-as-universal-good
  - security-rigor-as-hostility
  - hospitality-as-permission-to-overwrite
  - maintainer-preference-as-world-default
preserved_unknowns:
  - user-cluster-expectations
  - legal-and-organizational-differences
  - optimal-default-per-product
  - hospitality-policy-schema
user_gate_required:
  - irreversible-overwrite
  - foreign-deployment-adoption
  - public-product-positioning
```

Explicit Contract型を冷たいと断罪せず、Omakase Hospitality型を曖昧と断罪しない。双方の長所と破局を保持し、
操作単位で責務、可逆性、authority、receiptを選ぶ。

## 内観メモ `[POEM]`

気が利くdeploy toolは、利用者の心を読む超能力者ではない。

玄関に靴がなければ勝手に他人の靴を捨てず、空の靴箱なら一段だけ棚を作る。
先客の札があれば名前を読み、読めなければ家主へ聞く。

よしなには魔法ではなく、境界を覚えたおもてなしである。

## 未解決・⊥

- `Explicit Contract`と`Omakase Hospitality`をstableな横断語彙にするか
- `-y`、confirmation、Environment approval、migration ticketの使い分け
- 自動修復してよい操作の可逆性分類
- 複数componentが同じ補修権限を主張した場合のownership resolution
- 公開観測のretry、cache、DNS伝播待ちをどこまでdeploy時間へ含めるか

## 転送候補

- Q Atlantis: Sakura Matchbox deployment運用契約
- SphereOS Atlantis: installer／Server profile／Exit ContractのUX設計
- 各CLI／scheduler: safe default、dry-run、`-y`、receiptの共通規約

転送は本Note作成だけでは実行しない。各repositoryの正本とUser Gateを確認して別作業とする。

## source・Provenance

- 2026-07-20のユーザーとのdeployment UX設計会話
- Quantaril Cloud Q Atlantis `.github/workflows/deploy.yml`の設計・限定検証
- ZeroRoomLab-manifest `AGENTS.md` §0.4
- Atlantis-MAGISDK 0.2.1
- Context定規・因果・OAE横断監査規約
