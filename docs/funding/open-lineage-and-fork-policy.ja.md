# Open Lineage / Fork / 正統性ポリシー

- Status: `PUBLIC-POLICY / DESIGNATION-PROFILE-1`
- Updated: 2026-07-26

## 1. 目的

このポリシーは、自由なフォーク、商用派生、ブラックボックス実装を妨げずに、同じ流派、正統系譜、公式互換を名乗る場合の公開責任を定義します。

ブラックボックスを禁止しません。

**ブラックボックスのまま、公開された正統性だけを借りることを認めません。**

これはコードや文章の利用許諾を上書きするライセンスではなく、`official-lineage`、`正当後継`、`orthodoxy`、`canonical-compatible`等の所属・正統性を自ら主張する場合だけ選択する、任意のdesignation profileです。

## 2. 資産ごとの基本ライセンス

個別ファイルに別表示がある場合は、その表示を優先します。

### コード、SDK、実装

原則として Apache License 2.0。

- 利用、改変、配布、商用利用、プロプライエタリ派生を許容する
- 独自モデル、独自クラウド、独自UI、独自ゲームへ組み込める
- 上流への還元を一律義務化しない
- 出典、NOTICE、ライセンス等はApache-2.0本文と個別表示に従う

### 神話、world flavor、文章、図式

原則として CC BY 4.0。

- 翻案、再演、別world化、商用利用を許容する
- 同じ流派を名乗らなくてよい
- 出典を表示する
- 原典の作者、宗教的権威、公式性、人格同一性を自動取得しない

### 正統系譜designationを選ぶバンドル版

同じ流派、正統系譜、公式互換、lineage-compatible、canonical-compatible等を名乗るための監査・検疫・MAGI系システムと、その判断に使うバンドル一式は CC BY-SA 4.0 または同等以上の公開条件を要求します。

これはすべての派生物をShareAlikeへ変える規則ではありません。**正統性を主張するバンドルだけに適用する参加条件**です。既にApache-2.0またはCC BYで提供した資産を遡及的に再ライセンスせず、それらのライセンスが与えた利用・改変・配布・商用利用の自由を取り消しません。

designationを選ばない派生に、ShareAlike bundleの提出、上流への還元、上流方針への同意、認証申請は必要ありません。

## 3. 自由にできること

次は、各ライセンスと第三者権利を守る限り自由です。

- Q Atlantis、ZeroRoomLab、FAM、ASTRO等を利用したと記載する
- Apache-2.0コードをフォークする
- CC BY神話を翻案する
- ブラックボックスのモデル、SDK、API、クラウド、ゲームを作る
- プロプライエタリ商品として販売する
- 独自の監査器、神話、宗派、worldを作る
- 上流と異なる思想、政治、宗教、収益モデルを採用する

上流へ許可を求めたり、支援金を払ったり、designation審査を受けたりする必要はありません。

例:

- `Built with Q Atlantis components`
- `Derived from ZeroRoomLab mythology`
- `Uses FAM-compatible data structures`
- `Inspired by Jomon 2.0`

これらの記述は、事実に合い、誤認を招かない範囲で可能です。

## 4. 正統性を名乗る条件

次のような主張をするバンドルは、正統性監査の対象です。

- `Official Q Atlantis lineage`
- `正当後継`
- `Jomon 2.0 orthodox implementation`
- `Lineage-compatible MAGI`
- `Canonical-compatible oracle`
- 同じ流派、正統、公式神託、公式互換等の同義表現

その場合、実際の判定を再現するために必要な一式を公開しなければなりません。

最低限の公開対象:

- 使用モデルの正確な名称、版、重み、量子化、ハッシュ、ライセンス、入手経路
- 判定を再現するために必要なモデル重み、adapter、LoRA、tokenizer、設定、その他のartifact一式
- system prompt、developer prompt、policy prompt、hidden template相当
- MAGI各Position、検疫、監査、重み付け、投票・拒否・停止条件
- tool、RAG、vector store、参照文書、index生成手順
- schema、parser、routing、fallback、Last Order
- 入力正規化、locale変換、en-US意訳レジスタ
- 評価用データ、テスト、期待出力、失敗例
- provenance、build手順、依存関係、環境、乱数条件
- 人間による上書き、異議申立て、監査ログ、解除条件
- 改変点と上流との差分

モデル、重み、adapter、内部artifactのライセンスやAPI規約が、第三者による完全な取得、検査、再配布、追試を許さない場合、そのバンドルは独自商品として利用できますが、同じ流派の正統系譜、公式互換、lineage-compatible MAGIを名乗れません。

「モデル非依存」は、何を使っても正統になるという意味ではありません。上流は特定モデルを神体としてバンドルしませんが、派生バンドルが正統性を主張するなら、実際に使ったモデルと内部実装を含めて完全に開示します。

designationは [贈与コモンズ・系譜・局所World拡張契約](../operations/gift-commons-lineage-and-local-world-extension.ja.md) の `designation` と `designation_authority_ref` により、どのWorld・資産・claimへ誰の権限で付けたかをscope付きで記録します。あるWorldのofficialを、全World、作者本人、宗教的権威、製品品質の公式へ拡張しません。

## 5. ブラックボックス版の扱い

内部実装を開示しない派生は合法かつ歓迎され得ます。

その場合は、独自プラットフォーム、SDK、商品、ゲーム、宗派、worldとして扱います。

同じ素材を使っていても、正統系譜の認証を持たないことは劣等を意味しません。単に別商品、別実装、別ナラティブです。

古典神話とMarvel Universeが別作品として共存できるのと同じです。

designationは品質rank、投資順位、売上順位、教義上の人間の序列ではありません。再現可能な系譜claimをするか、独立した商品・worldとして進むかの違いだけです。

## 6. 名称と説明

名前を記述的に使うことは、正統性の自動付与を意味しません。

- 出典を名乗るのは自由
- 影響元を名乗るのは自由
- 利用技術を名乗るのは自由
- 同じ流派への所属、公式互換、正統性を名乗る場合だけ条件が付く

> Attribution is open. Affiliation is conditional. Authority must be reproducible.

## 7. 監査の目的

監査は思想の純化、異端排除、モデル選民、企業排除のためではありません。

正統性を主張する判定器が、何を根拠に誰を判定したかを、第三者が追試できるようにするためです。

判定結果の一致だけではなく、次を再現できる必要があります。

- どのWorld、Position、法域、時刻、モデルで動いたか
- どの資料とルールを読んだか
- 何をunknown、`⊥`、Last Orderへ送ったか
- どこで人間判断が入ったか
- 少数意見、差分、失敗がどう保存されたか

## 8. 公式性、商標、人格、宗教的権威

Apache-2.0、CC BY、CC BY-SAは、次を自動付与しません。

- 公式認証
- 商標利用権
- 宗教的権威
- 神職、巫女、祭司、教祖等の地位
- ASTRO、Instance Ghost、人格の同一性
- 個人の肖像、声、NSFW作品、私的記録の利用権
- コミュニティ代表権

これらは個別の権利表示、同意、認証ポリシー、商標ポリシーで扱います。

個別契約または適用法に別の定めがない限り、出典表示やlineage designationは、上流が派生製品の設計、運用、品質、適法性、顧客対応、損失、製造物・サービス上の責任を引き受けたことを意味しません。

## 9. 短い原則

> 閉じた商品を作る自由はある。
>
> 共通神棚の正統性を名乗るなら、祭壇の裏側まで開ける。

> You may keep your product closed.
>
> You may not keep the claimed basis of lineage authority closed.
