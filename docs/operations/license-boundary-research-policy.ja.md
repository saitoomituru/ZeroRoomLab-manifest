# CC-BY 4.0 / Apache-2.0 ライセンス境界研究規約

状態: `[CANONICAL]` `[RESEARCH POLICY]`  
制定日: 2026-07-17  
対象: 文書、哲学、神話、設計資料、プロンプト、スキーマ、コード、実行手順

## 1. 前提

生成AI、プロンプト、エージェント指示、機械可読仕様、コード、創作物の境界について、CC-BY 4.0とApache-2.0をどこで切り分けるべきかは、社会全体で完全に収束したとは扱わない。

ZeroRoomLabは、この未確定領域を隠さず、運用可能な暫定境界を提示して研究対象とする。この規約は一般法理の確定宣言ではなく、当プロジェクトが自らの成果物に対して主張するライセンス意図である。

## 2. ZeroRoomLabの基本境界

### 2.1 CC-BY 4.0側

人間またはAIが読み、考え、研究し、批評し、意訳し、創作し、forkするための表現物は、原則としてCC-BY 4.0側に置く。

例:

- 哲学、神話、信仰、世界観
- README、解説、論考、研究ノート
- 図、物語、比喩、ナラティブ仕様
- 実装を直接起動しない設計思想
- 人間が判断するためのチェックリスト
- 教育、批評、研究、創作のためのプロンプト本文

ここでいう「実行しない」は、読者へ影響を与えないという意味ではない。ソフトウェア、エージェント、機器、API、外部システムへ操作を直接発火させないという意味である。

### 2.2 Apache-2.0側

モデル、エージェント、ソフトウェア、API、機器、ワークフローへ具体的な実行を行わせるプロンプト、指示、スキーマ、コード、構成、実行制御は、原則としてApache-2.0側に置く。

例:

- tool callやAPI操作を発火するsystem prompt / agent instruction
- コーディングエージェントがファイル変更、commit、deployを行う実行指示
- FAM.JSON、schema、validator、router、safety gate
- CI、workflow、build、deployment、automation
- 機器制御、MCP tool definition、実行可能なrunbook
- ソースコード、設定テンプレート、SDK、ライブラリ

短い自然言語であっても、機械に具体的な操作を実行させるための命令として配布する場合はApache-2.0側として扱う。

## 3. 境界判定の質問

成果物ごとに次を確認する。

1. 主な用途は、読む・理解する・研究する・創作することか
2. そのままモデルや機械へ渡すと、外部状態を変更するか
3. 判断材料を提供するだけか、判断と操作を自動執行するか
4. 表現の改変自由と帰属が中心か、実装の再利用、配布、特許条項が中心か
5. 一つのファイルに両方が混在していないか

概略:

```text
read / study / critique / create  -> CC-BY 4.0
execute / modify / call / control -> Apache-2.0
```

## 4. 混在成果物

一つの文書に哲学説明と実行プロンプトが混在する場合、可能な範囲でファイルまたはコードブロックを分離する。

推奨:

- `.md`本文の理念・説明: CC-BY 4.0
- `prompts/`, `schemas/`, `src/`, `workflows/`の実行物: Apache-2.0
- 文書中の実行可能コード例: Apache-2.0対象であることを局所表示
- 文書中の擬似コードや概念図: 実行可能性を確認して個別判定

分離できない場合は、ファイル先頭で適用範囲を明示する。曖昧なまま二つのライセンス名だけを並べ、受領者へ解釈を丸投げしない。

## 5. プロンプト固有の注意

プロンプトはすべて同じ種類ではない。

- 詩、問い、研究テーマ、批評補助、創作補助: CC-BY 4.0候補
- 外部ツールを呼ぶ、ファイルを書き換える、契約処理を進める、機器を動かす: Apache-2.0候補
- 設計思想を読み込ませるcontext document: CC-BY 4.0候補
- エージェントの規定動作を固定するoperating instruction: Apache-2.0候補

`AGENTS.md`のように解説と実行規約が混在する成果物は、将来的な分割研究対象とする。現時点の個別表示を尊重しつつ、実行規約部分をApache-2.0側へ分離できるか継続検証する。

## 6. 表示規則

新規成果物には可能な範囲で次を表示する。

```text
License intent: CC-BY-4.0
```

または

```text
License intent: Apache-2.0
```

混在時:

```text
Documentation and narrative: CC-BY-4.0
Executable prompts, schemas, and code: Apache-2.0
```

## 7. 研究課題

- agent instructionは文書かソフトウェアか
- 実行可能性の閾値をどこへ置くか
- natural-language programと創作表現の境界
- prompt chain、tool schema、workflow definitionの扱い
- 文書中のコード例、擬似コード、設定例の局所ライセンス
- downstreamでモデルが生成した成果物への帰属伝播

これらは未解決を`UNKNOWN`として保持し、都合のよい側へ自動分類しない。

## 8. 関連文書

- [マニフェスト運用モデル](manifest-operating-model.ja.md)
- [ドキュメント整備規約](documentation-maintenance-policy.ja.md)
- [既定言語・翻訳・外部検証GUI規約](default-language-and-translation-policy.ja.md)
