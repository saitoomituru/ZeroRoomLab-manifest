# コーディングAI向け日本語意訳レジスタ

状態: `[CANONICAL]`  
制定日: 2026-07-15  
既定の英語ロケール: `en-US`  
対象: README、AGENTS.md、技術文書、実験ノート、コミット、issue、PR、コードコメントを扱うコーディングAI

## 1. 目的

このレジスタは、日本語の単語を英単語へ置換するための翻訳表ではない。日本語に含まれる発話意図、読み手との関係、期待する責務、観測事実の強度を抽出し、それらが米語の技術コミュニケーションとして同じ働きをする形へ意訳するための運用規約である。

日本語原文を英語圏の過剰な留保で弱めず、同時に、日本語の暗黙文脈を米語の普遍的主張として誤展開しないことを目的とする。

## 2. ロケール方針

- 英語成果物は、依頼に別指定がない限り `en-US` とする
- `en-GB` のREADME、翻訳ファイル、別ロケール成果物は通常運用しない
- イギリス英語は、語用論上の差を説明する比較材料として参照してよいが、生成対象にはしない
- 「英語版」という指示は本リポジトリ群では `en-US` を意味する
- 既存文書に別のロケール指定が明示されている場合は、そのファイル固有の規約を優先する

米語とイギリス英語は相互理解可能でも、社会的含意と自然な責務表現が同一とは限らない。コーディングAIは `English` という一つの抽象ロケールへ雑に丸めない。

## 3. 語用論的な写像

次の表は辞書的な直訳ではなく、本プロジェクト内で同じ責務を伝えるための意訳例である。

| 日本語のレジスター | 日本語表現 | 比較上のイギリス英語的含意 | en-USで出力する責務 |
|---|---|---|---|
| ギーク | 大人のOSSパイレーツ | 技術と相手の仕事を尊重する紳士的な技術者 | inspect the hardware, commits, logs, test conditions, and claim boundaries before extending a result |
| 硬めの仕事文・京都的な遠回し | 腕相応の経験を持つ技術者 | 経験と節度を備えた実務者 | verify the evidence and stay within the documented scope |
| 技術実験 | 手元では再現した | 記録した条件下での再現報告 | reproduced on the documented hardware and test conditions |
| 境界の提示 | それ以上は実機を見に来てくれ | 証拠に接する責任を読み手へ返す | conclusions beyond this record require inspection of the hardware and original logs |

日本語の「大人」を米語の `adult` へ直接置換すると、年齢制限や成人向けコンテンツが前景化する。「パイレーツ」を `pirates` と直訳すると、著作権侵害や犯罪性の連想が先に立つ場合がある。また `gentleman` は比較上のイギリス英語的な説明には使えても、米語の公開READMEでは性別・階級・人格条件として過読されうる。

そのためen-USでは、人を形容する代わりに、証拠を確認する、試験条件を読む、主張境界を越えないという観測可能な行動へ写像する。表現上の情緒が薄くなっても、日本語原文の責務を撤回したことにはしない。

## 4. コーディングAIの意訳手順

コーディングAIは日本語を英訳する前に、次の順序で処理する。

1. 対象媒体を判定する。README冒頭、深い技術文書、コミット、issue、コードコメントでは必要なレジスターが異なる
2. 原文の事実部分と社会的な発話行為を分ける
3. 誰に何を期待しているかを抽出する。敬意、節度、自己検証、証拠確認、責任境界等を明示する
4. 観測事実の強度を固定する。「動いた」を根拠なく `might work` へ弱めない
5. 暗黙の射程をhardware、commit、runtime、workload、log、test condition等の明示要素へ展開する
6. en-USで人格評価に見える語を、可能な限り検証可能な行動へ写像する
7. 直訳によって年齢、性別、階級、犯罪、成人向け表現等の別カテゴリが前景化していないか確認する
8. 原文より広い普遍命題になっていないか、逆に免責文で事実を弱めていないか確認する

意訳の目的は「無難にすること」ではない。同じ作用を別の言語環境で再現することである。

## 5. README境界文の基準例

日本語版ではプロジェクト固有の関係性を保持してよい。

> README冒頭は一般公開向けの表紙です。以降の技術ノートは、大人のOSSパイレーツ向けです。

en-US版では同じ責務を行動として記述する。

> The README opens with the public-facing view. The technical notes below assume readers will inspect the hardware, commits, logs, test conditions, and claim boundaries before extending any result.

両者は逐語訳ではないが、本プロジェクトでは運用上の等価表現とする。

## 6. 各リポジトリのAGENTS.mdからの参照

ZeroRoomLab系リポジトリのAGENTS.mdには、本レジスタへの短い必読導線を置く。規約全文を各リポジトリへ複製しない。

推奨する指示:

```markdown
## ZeroRoomLab言語レジスタ（必読）

README、技術文書、翻訳、主張表現を編集する前に、ZeroRoomLab-manifestの
[コーディングAI向け日本語意訳レジスタ](https://github.com/saitoomituru/ZeroRoomLab-manifest/blob/main/docs/operations/coding-ai-japanese-paraphrase-register.ja.md)
を読み、背景ベクトルを取得すること。英語出力は明示がない限りen-USとし、単語の直訳ではなく、
日本語原文の意図・読み手の責務・事実強度をen-USで同じ働きをする表現へ写像する。
```

ローカルにZeroRoomLab-manifestが隣接している場合はローカル正本を優先し、存在しない場合は上記公開URLを使う。各リポジトリ固有のAGENTS.mdは、プロジェクト固有の技術制約を上書きできるが、本レジスタの意図を無断で弱めない。

ここでいう「背景ベクトルを取得する」とは、単一の例文だけをコピーするのではなく、[テクニカルコミュニケーション運用規約](technical-communication-register.ja.md)、マニフェストのAGENTS.md、対象リポジトリ固有の規約を合わせて読み、主張の層、媒体、証拠射程、読者責務を把握することを指す。

## 7. 禁止事項

- 日本語の比喩語を文脈確認なしに米語へ逐語置換する
- `adult`、`pirate`、`gentleman`等を原文にあるという理由だけでen-US版へ残す
- 米語化を理由に、観測済みの事実を可能性表現へ弱める
- 法務防戦的な留保を追加し、原文の結論を読めなくする
- en-US表現を日本語正本へ逆輸入し、日本語固有の関係性や情緒を削る
- 依頼なくen-GB版やロケール別ファイルを増やす
- マニフェスト正本を各リポジトリへ全文複製し、更新漂流を発生させる

## 8. 関連文書

- [テクニカルコミュニケーション運用規約](technical-communication-register.ja.md)
- [マニフェスト運用モデル](manifest-operating-model.ja.md)
- [ドキュメント整備規約](documentation-maintenance-policy.ja.md)
- [ZeroRoomLab AI Agent Operating Guidelines](../../AGENTS.md)
