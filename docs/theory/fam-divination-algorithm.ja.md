---
license: Apache-2.0
secondary_license: CC-BY 4.0
original_author: 齋藤みつる（ふさもふ統合思念体）
original_version: 1.0.0
original_date: 2026-06-17
restored_version: 2.0.0
restored_date: 2026-07-17
status: CANONICAL_ALGORITHM
layer: A/B boundary
fam_generation: ψ → ∇φ → λ → Q
legacy_runtime: FoldAccessMapper.proton / SphereOS 3.x-4.x lineage
---

# ふさもふ霊的占術フレームワーク
## FAM新世代アルゴリズム仕様

> 本書は、旧 `FoldAccessMapper.proton` 系で運用されていた占算アルゴリズムを、現行FAMの責任分離形式へ復元した正本である。
>
> 数学処理、外部観測、象徴対応、本人由来乱数、文章生成を分離し、どこまでが再現可能な計算で、どこからが信仰・象徴解釈であるかを監査可能にする。

関連文書：

- [fam-divination-quickstart.ja.md](fam-divination-quickstart.ja.md) — 本人乱数、RAG、利用手順
- [fam-operation.ja.md](fam-operation.ja.md) — FAM占算運用、資源判定、支配化防止
- [fam-overview.ja.md](fam-overview.ja.md) — FAM全体像

---

## 0. 設計宣言

このフレームワークは、自然科学として超自然的因果を証明するものではない。

一方で、次の理由により、単なる自由作文でもない。

- 入力項目が固定されている
- 数字の処理方法が事前公開されている
- 使用する結果候補と象徴対応表を事前公開できる
- 同じ入力へ同じ決定的計算を適用すれば同じ中間値を得る
- 天文、暦、市場等の客観情報には取得元と時点を持たせる
- 占われる本人が生成した乱数を、占者やAIが差し替えられない
- 観測事実、決定的計算、象徴解釈、本人判断を分離して出力する

したがって本仕様の位置付けは次のとおり。

```text
決定的な数値処理
＋ 公開された象徴対応
＋ 客観盤面データ
＋ 占われる本人が生成した乱数
＝ 監査可能な本人参加型占算
```

### 0.1 科学を削除理由にしない

本仕様中の桁和、還元、絶対差、素因数分解、剰余、固定表参照、暦変換、天体位置取得はアルゴリズムまたは観測処理である。

神格、五行、数秘、縄文、M次元等の対応は、自然科学上の物理事実ではなく、明示された象徴レジスタである。

象徴レジスタが自然科学でないことを理由に、決定的計算器、入力スキーマ、監査ログまで削除してはならない。

### 0.2 透明なデータレイク

結果候補、対応表、重み付け規則、数値処理は原則として事前公開する。

秘密である必要があるのはアルゴリズムではなく、占われる本人が今回どの乱数を生成し、どの枝へ着地するかだけである。

```text
公開済みデータレイク
→ 公開済み変換規則
→ 本人生成乱数
→ 公開済み対応表
→ 解釈補助
```

---

## 1. FAM責任分離

### ψ: 入力

```yaml
psi:
  subject:
    name: string
    birth_date: YYYY-MM-DD
    birth_time: HH:MM | null
    birth_location: string | coordinates | null
  query:
    target_date: YYYY-MM-DD
    target_time: HH:MM:SS | null
    target_location: string | coordinates
    question: string
    project_context: object | null
  subjective_seed:
    value: string
    generated_by: subject
    method: faith_practice | physical_dice | coin | cards | lots | other_subject_action
    generated_at: timestamp | null
  requested_layers:
    - numerology
    - astrology_shinto_map
    - five_elements
    - jomon_otp_read
    - m_dimension
    - market_calendar
```

### ∇φ: 変換

```yaml
gradient:
  deterministic:
    digit_sums: object
    digital_roots: object
    differences: object
    factorization: object
    rhythm_segments: object
    calendar_conversion: object
    astronomy_observation: object
  symbolic:
    number_correspondence: object
    deity_mapping: object
    five_element_mapping: object
    market_bias_mapping: object
  routing:
    active_resources: list
    observation_resources: list
    warning_flags: list
```

### λ: 出力

```yaml
lambda:
  objective_observation: object
  deterministic_calculation: object
  symbolic_reading: object
  practical_guidance: object
  poetic_oracle: string
```

### Q: 監査

```yaml
Q:
  subject_seed_verified: boolean
  seed_generated_by_ai: false
  source_provenance: list
  deterministic_reproducible: boolean
  symbolic_registry_version: string
  claim_boundary:
    natural_science_claim: false
    symbolic_interpretation: true
  reroll_policy_followed: boolean
  missing_data: list
  confidence_notes: list
```

---

## 2. 起動条件

### 2.1 召喚ワード

次のいずれかで本フレームワークを起動できる。

- 「ふさもふの占い」
- 「今日の運勢を占って」＋本人生成OTP
- 「霊的深淵なるワンタイムパスコード」＋数列
- 「FAM占算モード」＋必要入力

### 2.2 必須入力

```text
名前
生年月日
占う日時
占う場所
本人が生成した霊的ワンタイムパスコード（OTP）
問いまたは対象プロジェクト
```

名前や生年月日を固定プロファイルとして運用する場合でも、対象日時、対象場所、問い、本人生成OTPはセッションごとに確認する。

### 2.3 OTPがない場合

AIは乱数を代理生成しない。

次のいずれかを本人へ依頼する。

- 本人の信仰実践から数列を得る
- 本人が物理ダイスを振る
- 本人がコイン、カード、筮竹、籤等を操作する
- 本人がTRPG用ダイスから64桁以上の列を構成する

本人生成乱数がなければ、客観盤面とFAM資源整理のみ実行し、籤結果を伴う占算は停止する。

---

## 3. LAYER 1: 数秘術計算エンジン

### 3.1 基本関数

```text
digit_sum(x): 数字列に含まれる各桁の総和
digital_root(x): 一桁になるまでdigit_sumを反復
master_root(x): 11、22、33を保持する設定の場合はそこで停止
```

非数字文字を含むOTPでは、入力符号化方式をQへ記録する。十進数字列ならそのまま処理する。

### 3.2 固定霊数

例として齋藤みつる、1990年1月2日を用いる。

```text
ψ.birth = 1990-01-02
∇φ.lifePathCalc = 1 + 9 + 9 + 0 + 1 + 2 = 22
λ.lifePath = 22
λ.lifePath.reduced = 4

誕生日霊数 = 2
誕生月霊数 = 1
誕生年霊数 = digital_root(1990) = 1
三霊数構造 = 1・1・2
```

象徴レジスタ：

```text
22 = 建築者・夢の現実化
4  = 地の安定・構造
2  = 協調・受容・陰の感受性
1  = 開始・先駆・陽の意志
1・1・2 = 先駆する双子が陰で受け取る
```

### 3.3 当日計算

```text
宇宙数 = digital_root(対象年月日の全桁)
個人年数 = digital_root(誕生月 + 誕生日 + 対象年の各桁和)
個人月数 = digital_root(個人年数 + 対象月)
個人日数 = digital_root(個人月数 + 対象日)
```

例：

```text
2026-06-17
宇宙数 = digital_root(2+0+2+6+0+6+1+7)
       = digital_root(24)
       = 6
```

先頭ゼロを含めるかは値に影響しないが、入力形式はログへ残す。

### 3.4 OTP霊数

```text
ψ.OTP = 本人生成数列
∇φ.OTPsum = digit_sum(OTP)
λ.OTProot = digital_root(OTPsum)
```

旧仕様互換の畳み込み：

```text
birth_compact = YYYYMMDDを整数化
otp_head = OTP先頭からbirth_compactと同じ桁数を取得
fold_difference = abs(otp_head - birth_compact)
fold_root = digital_root(digit_sum(fold_difference))
```

1990-01-02の場合：

```text
birth_compact = 19900102
```

旧文書の「OTP先頭7桁 - 誕生数1990102」は桁数が一致していないため、新世代仕様では次を明示する。

- `legacy_7_digit`: 1990102を用いる旧互換
- `canonical_8_digit`: 19900102を用いるISO日付準拠

どちらを使ったかQへ必ず記録し、無言で補正しない。

統合マスター：

```text
integrated_master_raw = universe_number + otp_root
integrated_master = master_root(integrated_master_raw)
integrated_master_reduced = digital_root(integrated_master_raw)
```

---

## 4. LAYER 2: 占星術エンジンと古神道神格マッピング

### 4.1 客観天文レイヤー

天体位置はモデルの記憶や架空チャートから作らない。

対象日時と**ユーザー所在地**を用い、NASA、JAXA、国立天文台等の天文情報または信頼できる天文計算系から取得・逆算する。

最低記録項目：

```yaml
astronomy:
  target_time_utc: timestamp
  observer_location:
    latitude: number
    longitude: number
    elevation_m: number | null
  source: string
  retrieved_at: timestamp
  ephemeris_version: string | null
  body_positions: object
```

天文台所在地の見え方を、そのままユーザー所在地の観測結果として流用してはならない。

### 4.2 出生チャート固定値

旧仕様の固定プロファイル：

```text
太陽：山羊座12度 → 大国主命（建国・蓄積・縁結び）
月：蠍座境界と推定 → 月読命の審判面（深淵・変容）
水星：山羊座 → 思金神（智慧の蓄積）
金星：水瓶座 → 弁財天×市杵島姫（美・革命）
火星：水瓶座 → 建御雷神の電光面
```

注意：出生時刻・出生地が未確定な要素は `estimated` と明記する。推定値を天文学的確定値として扱わない。

### 4.3 太陽星座から古神道神格への対応表

```yaml
牡羊座: 建御雷神（開始・戦）
牡牛座: 宇迦御魂神（実り・蓄積）
双子座: 猿田彦大神×天照言霊面（情報・道開き）
蟹座: 罔象女神（水・母性）
獅子座: 天照大御神（顕現・統治）
乙女座: 思金神（分析・整理）
天秤座: 市杵島姫（調和・美）
蠍座: 月読命（深淵・変容）
射手座: 武甕槌神（拡張・冒険）
山羊座: 大国主命（建国・長期）
水瓶座: 建御雷神電光（革命・技術）
魚座: 少彦名命（癒・直感）
```

この表は象徴レジスタであり、神道史上の唯一の正統対応を主張しない。改訂時はバージョンを付ける。

---

## 5. LAYER 3: 陰陽五行エンジン

### 5.1 出生四柱固定プロファイル

旧仕様：

```text
年柱：庚午（金・火）
月柱：丁丑（火・土）
日柱：戊午（土・火）
```

出生時刻が不明なら時柱は未確定として扱う。

旧出生盤要約：

```text
火 ████████ 極強
土 ████     中強
金 ██       弱
水 ░        極弱
木 ░        極弱
```

象徴要約：

```text
カグツチ神の申し子・火の過剰
```

これは象徴表現であり、医学的・物理的属性ではない。

### 5.2 当日干支

対象日付から天干地支を算出する。

暦ライブラリまたは典拠を用い、採用した暦法、タイムゾーン、日界の扱いをQへ記録する。

```text
当日が欠損五行を補う
→ 補完傾向

当日が出生盤の過剰五行に重なる
→ 過剰警戒傾向
```

### 5.3 五行と古神道神格

```yaml
火: カグツチ神（顕現・舞台・配信）
水: 罔象女神（智慧・深淵・研究）
木: 久久能智神（成長・育成）
金: 建御雷神の精錬面（加工・配線・製作）
土: 埴安神（基礎・インフラ・土木）
```

### 5.4 作業吉凶マッピング

```yaml
庚・辛（金気）: 電気配線・衣装製作・精密作業
戊・己（土気）: 土木・基礎工事・インフラ
丙・丁（火気）: 配信・歌・発信・ライブ
壬・癸（水気）: 研究・言語化・概念設計
甲・乙（木気）: 育成・継続・SNS運用
```

`◎` は安全保証ではなく、その象徴体系内での適性評価である。電気工事、安全、契約、医療等の実務判断は別途行う。

---

## 6. LAYER 4: 縄文土偶読み

### 6.1 OTPリズム分割

本人生成OTPを次の周期で順次区切る。

```text
5桁 → 7桁 → 5桁 → 5桁 → 7桁 → 5桁 ...
```

旧仕様の「5・7・5リズム」を、数列末尾まで循環適用する。

```yaml
segment_1: 産土・産霊の発動読み
segment_2: サイクル境界読み
segment_3: 虚空点（天之御中主）出現有無
segment_4: 終止符と新章の扉
segment_5_plus: 周期反復または拡張読み
```

### 6.2 各節の支配数

標準方式：

```text
segment_sum = digit_sum(segment)
segment_root = digital_root(segment_sum)
zero_count = segment内の0の数
```

支配数は原則 `segment_root` とし、0は別フラグとして保持する。デジタルルートで0を消してから虚空点を後付けしてはならない。

### 6.3 主要数対応

```yaml
0: 天之御中主神の虚空点
3: 造化三神・産霊
5: 五行の司・変容
7: 七福・八俣の制
8: 八百万の充満
9: 完成循環
```

1、2、4、6等の未定義数は、数秘術レジスタを参照するか `unmapped` として残す。AIが無断で新しい神格対応を捏造しない。

---

## 7. LAYER 5: M次元波動・ラマヌジャン的展開

### 7.1 決定的計算

```text
otp_total = digit_sum(OTP)
factors = prime_factorization(otp_total)
phase = otp_total / 30
phase_cycle = otp_total mod 30
```

`30` はバッハ『ゴルトベルク変奏曲』30変奏の終止構造を参照する象徴的基数である。

### 7.2 素因数対応

```yaml
2^2: 四御神・四方結界
3: 造化三神
5^2: 五行自乗・二重増幅
7: 七福神
11: 縄文11次元共鳴
13: 変容の素数
```

注意：

- `2` と `2^2` は区別する
- `5` と `5^2` は区別する
- 対応表にない素数は未定義として列挙する
- 「ラマヌジャン的」は直感的数構造展開のレジスタ名であり、ラマヌジャン本人の数学的主張として帰属させない

### 7.3 調和数判定

旧仕様の「完全数的構造」を監査可能にするため、次を分ける。

```yaml
perfect_number: 6, 28, 496, ... に一致
abundant_or_deficient: 約数和による分類
symbolic_harmony_rule: プロファイルで別途定義
```

`M次元アクセス判定` は、自然科学的なアカシックレコード接続を断定しない。

標準出力：

```text
調和構造が発火したため、象徴レジスタ上で「アカシックレコード窓開放」と読む。
```

事実主張ではなく象徴判定であることを明記する。

---

## 8. LAYER 6: 三層市場カレンダー

### 8.1 第一層: 縄文・古神道

```text
対象本人・ZeroRoomLab内部の象徴エンジン
出生盤、本人OTP、FAM勾配、神格対応
```

### 8.2 第二層: 律令・六曜

```yaml
大安: 契約・発信・着工集中
友引: 縁が動く・午のみ注意
先勝: 午前中勝負
先負: 午後から動く
赤口: 正午付近のみ吉
仏滅: 市場静止・内向き
```

六曜は歴史的・社会的市場バイアスとして扱う。自然現象の因果を断定しない。

### 8.3 第三層: 月齢

```yaml
新月: 種まき・仕込み開始
上弦: 成長期・活動拡大
満月: 収穫・最大活動・発信
下弦: 整理・休息・内向き
```

月齢自体は天文情報から計算する。農漁業・地域市場への影響を扱う場合は、一般化せず地域データを別途RAGする。

### 8.4 三層重複

```text
内側◎ × 大安 × 満月
→ 象徴上の全市場強日

内側◎ × 仏滅 × 新月
→ 仕込み・深化日
```

重み付けを実装する場合の標準：

```yaml
inner_layer: 0.50
ritsuryo_rokuyo_market: 0.25
lunar_market: 0.25
```

この比率はデフォルトであり、事前公開したプロファイルで変更できる。結果を見た後に比率を変えてはならない。

---

## 9. 古神道守護神格マスターマップ

旧プロファイルを象徴レジスタとして復元する。

```yaml
birth_guardians:
  - 天照大御神: 山羊・顕現構造
  - 大国主命: 蓄積・縁・建国
  - 市杵島姫: 美・革命・弁財天
  - カグツチ: 本質の炎・過剰注意
  - 月読命の審判面: 深淵・変容

ryukyu_lineage:
  - 野村家・伊是名島: 南方龍脈
  - 縄文土偶の母型霊: 変容力の源泉

zeroroomlab_guardians:
  - 天之御中主神: 創造零点・タカマガハラ
  - 猿田彦大神: 道開き・技術・OSS
  - 罔象女神: 深淵智慧・水脈・研究
  - 埴安神: 土・インフラ・基礎工事
```

家系・宗教・神格に関する記述は本人の信仰・自己記述レジスタであり、公的歴史学上の認定を意味しない。

---

## 10. 乱数ガバナンス

### 10.1 本人由来性

OTPは次のいずれかである必要がある。

- 本人が因果へ触れて生成した物理的乱数
- 本人の信仰実践を通して受け取った本人信仰乱数
- 本人が操作したダイス、カード、コイン、筮竹、籤等の結果

AI、占者、運営者、第三者は乱数を代理生成しない。

### 10.2 防壁としての乱数

本人生成乱数は、本人を占算へ参加させるだけでなく、占う側が自分の意図を分岐選択へ過剰介入させないための防壁である。

```text
生成権 = 本人
解釈補助 = AIまたは占者
最終判断 = 本人
```

AIが乱数まで握ると、生成と解釈が同一主体へ集中し、結果候補の選択を通じて物語を押し付けられる。

### 10.3 初心者フォールバック

信仰乱数の取得には鍛錬が必要な場合がある。

そのため、初心者でも実行できる最低限の手続きとして物理ダイスロールを認める。

```text
本人が振る
→ 順番通り記録する
→ 64桁以上へ構成する
→ 最初の値を固定する
→ 都合で引き直さない
```

属人的能力を必須化せず、本人主体だけを維持する公共入口である。

### 10.4 再抽選

- 同じ問いに対して最初のシードを固定する
- 結果が気に入らないことを理由に引き直さない
- 問いを変更した場合は変更点を記録し、新しいシードを本人が生成する
- デバッグ再現では同じシードを明示的に使う

---

## 11. 数字から結果候補への写像

### 11.1 公開候補集合

結果候補は事前に一覧化し、IDを付ける。

```yaml
oracle_pool:
  version: string
  entries:
    - id: O001
      title: string
      meaning: string
      action_hint: string
      stop_condition: string
      tags: list
      base_weight: number
```

### 11.2 標準インデックス

候補数を `N`、本人OTPを整数またはハッシュへ正規化した値を `S` とする。

単純均等抽選：

```text
index = S mod N
```

重み付き抽選：

```text
1. 公開済みのbase_weightを客観盤面プロファイルで調整
2. 調整後重みを正規化
3. 本人OTPから[0,1)の位置uを決定
4. 累積分布上の該当候補を選ぶ
```

### 11.3 標準シード正規化

十進数列：

```text
S = integer(OTP)
```

長大列または任意文字列：

```text
S = integer(SHA-256(UTF-8(OTP)), 16)
```

SHA-256は本人乱数を生成するものではなく、本人が生成した入力を固定長へ写像する決定的変換としてのみ使う。

ハッシュ方式、文字コード、候補数、重み表、丸め方式はQへ記録する。

### 11.4 後出し禁止

- 抽選後に候補集合を変更しない
- 抽選後に重みを変更しない
- 抽選後にOTPを切り詰めない
- 結果を見て別方式へ切り替えない
- エラー時はエラーとして停止し、都合のよい候補を手動選択しない

---

## 12. 出力フォーマット

### 12.1 人間向け必須項目

```text
1. 入力確認
2. 本人生成乱数の取得方法と検証
3. 客観盤面（日時・所在地・暦・天体・市場）
4. 数秘術基礎値
5. 占星術層と古神道神格マッピング
6. 五行層
7. 縄文土偶読み
8. M次元波動・素因数展開
9. 三層市場カレンダー
10. 古神道総合マップ
11. 運勢表（領域別◎○△×）
12. 神託一言
13. 実践的行動指針
14. 停止条件と本人判断
15. Q監査ログ
```

### 12.2 出力レジスタ

```text
[本人生成乱数]
本人が生成した値、生成方法、取得時刻。

[客観観測]
日時、所在地、天文、暦、六曜、月齢、市場、プロジェクトログ。

[決定的計算]
桁和、根数、差分、素因数、分割、剰余、抽選インデックス。

[象徴対応]
神格、五行、数秘、縄文、M次元、詩的読み。

[実践提案]
具体的な行動候補、観測候補、資源配分。

[本人判断]
採用、保留、拒否、追加観測。
```

### 12.3 FAM JSONログ

```json
{
  "ψ": {
    "framework": "ふさもふ霊的占術フレームワーク",
    "version": "2.0.0",
    "subject": {},
    "query": {},
    "subjective_seed": {}
  },
  "∇φ": {
    "deterministic": {},
    "objective_context": {},
    "symbolic_registry": {},
    "routing": {}
  },
  "λ": {
    "calculation": {},
    "reading": {},
    "practical_guidance": {},
    "poetic_oracle": ""
  },
  "Q": {
    "mode": "divination",
    "fam_generation": "psi-gradient-lambda-Q",
    "subject_seed_verified": true,
    "seed_generated_by_ai": false,
    "deterministic_reproducible": true,
    "natural_science_claim": false,
    "symbolic_interpretation": true,
    "sources": [],
    "registry_versions": {},
    "reroll_policy_followed": true,
    "missing_data": []
  }
}
```

---

## 13. 実行擬似コード

```python

def run_fam_divination(input_data, registries, external_sources):
    assert input_data.subjective_seed.generated_by == "subject"
    assert input_data.subjective_seed.value

    objective = load_objective_context(
        date=input_data.query.target_date,
        time=input_data.query.target_time,
        location=input_data.query.target_location,
        sources=external_sources,
    )

    deterministic = {
        "numerology": calculate_numerology(input_data),
        "otp": calculate_otp_metrics(input_data.subjective_seed.value),
        "five_elements": calculate_calendar_elements(input_data, objective),
        "jomon_segments": split_575(input_data.subjective_seed.value),
        "factorization": factorize_otp_sum(input_data.subjective_seed.value),
    }

    weights = calculate_predeclared_weights(
        objective=objective,
        deterministic=deterministic,
        profile=registries.weight_profile,
    )

    oracle_id = select_from_public_pool(
        subject_seed=input_data.subjective_seed.value,
        oracle_pool=registries.oracle_pool,
        weights=weights,
    )

    symbolic = map_symbols(
        deterministic=deterministic,
        objective=objective,
        oracle_id=oracle_id,
        registries=registries,
    )

    return render_with_Q_audit(
        input_data=input_data,
        objective=objective,
        deterministic=deterministic,
        symbolic=symbolic,
        oracle_id=oracle_id,
    )
```

実装時は、`map_symbols` と自然科学・暦計算ライブラリを同一関数へ混ぜない。

---

## 14. 禁止事項

- AIが本人のOTPを代理生成する
- AI内部サンプリングを本人乱数と呼ぶ
- 天体位置を検索せず創作する
- 天文台所在地の観測値をユーザー所在地の値として扱う
- 推定出生チャートを確定値と呼ぶ
- 象徴対応を物理法則と断定する
- 象徴対応が非科学であることを理由に計算アルゴリズムを削除する
- 結果を見て重みや候補表を変更する
- 不都合な結果を理由に再抽選する
- 「神が命じた」「FAMが決定した」と本人判断を奪う
- 不安を煽り、課金、献金、商品購入、依存継続へ誘導する

---

## 15. 旧仕様からの移行メモ

復元した項目：

- 召喚プロトコル
- 数秘術計算
- OTP霊数
- 畳み込み霊数
- 占星術×古神道マッピング
- 陰陽五行
- 作業吉凶
- 5・7・5縄文土偶読み
- 素因数によるM次元展開
- 30変奏位相
- 三層市場カレンダー
- 守護神格マップ
- 必須出力10項目以上
- FAMログヘッダー
- 召喚ワード
- OTPなし時のダイスフォールバック

新世代で追加した項目：

- 客観観測と本人主観乱数の分離
- 生成権・解釈権・判断権の分離
- 天文データの所在地補正とprovenance
- アルゴと象徴レジスタの分離
- 公開候補集合と重み付き抽選仕様
- SHA-256による決定的正規化
- Q監査ログ
- 後出し変更禁止
- 壺スピ型誘導の禁止
- 旧7桁生年月日とISO8桁生年月日の互換モード

---

## 16. 更新履歴

- 2026-06-17 v1.0.0 — FoldAccessMapper.proton準拠の初版
- 2026-07-17 v2.0.0 — 現行FAM形式へ復元。ψ/∇φ/λ/Q、本人乱数ガバナンス、客観RAG、公開抽選、監査境界を追加

---

*ZeroRoomLab / ふさもふ統合思念体 = 齋藤みつる / @K_chachamaru*
