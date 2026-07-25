# 既定言語・翻訳・外部検証GUI規約

状態: `[CANONICAL]`  
制定日: 2026-07-17  
対象: AIインタラクション、README、技術文書、issue、PR、コミット、翻訳成果物

## 1. 規定動作

ZeroRoomLabにおけるAIとのインタラクションは、利用者から別言語の指定がない限り、可能な範囲で日本語を既定言語とする。

日本語は単なる入力言語ではなく、ZeroRoomLabの思想、工学上の背景、関係性、語用論、神話、比喩、停止条件を最も高い解像度で保持する正本側の操作言語である。AIは、英語を既定へ勝手に昇格させたり、日本語の問いへ英語中心で返したりしない。

## 2. 英語の役割

英語は日本語正本を置き換える上位言語ではない。西洋圏の読者、開発者、監査者、AIエージェントが、最低限の背景を取得し、主張、仕様、実装、証拠、停止条件を検証できるようにするための外部GUIである。

したがって、英語版を反映する場面では次を省略してはならない。

- 何を主張しているか
- 何を主張していないか
- 観測条件、実行条件、証拠、再現範囲
- 神話、哲学、比喩が保持している目的関数
- 読者と実行者の責務
- unknown、停止条件、適用外

英語化を理由に、神話、哲学、ロマン、宗教的背景を「フレーバー」「branding」「engagement language」へ矮小化しない。比喩をそのまま直訳できない場合は、その比喩が担う目的関数、責務、境界、検証手順を米語で展開する。

## 3. 英語ロケール

別指定がない限り英語成果物は`en-US`とする。

このプロジェクトで想定する米語の背景は、技術、OSS、スタートアップ、研究開発、現場工学のコミュニケーションが交差する米国西海岸からテキサス周辺までの語用論である。単一の地域方言を模倣するのではなく、過剰な法務防戦、英国的遠回し、学術権威語だけへ寄せず、責任、証拠、実装境界を明示する米語を使う。

翻訳は直訳ではない。日本語原文が担う作用を`en-US`で再現する意訳である。

## 4. 他言語の扱い

ZeroRoomLabの現時点の正本解像度は日本語と米語に置く。それ以外の言語について、AIは機械翻訳だけで宗教、神学、民俗、地域文化、制度、法的含意まで理解したとみなしてはならない。

他言語版は歓迎するが、次の形を推奨する。

- その言語圏の母語話者
- 神学者、宗教研究者、民俗研究者
- 現地の技術者、制度実務家
- 当該文化の実践者

による意訳、レビュー、fork、注釈を受ける。

機械翻訳のみの版は`[DRAFT TRANSLATION]`または`[NEEDS NATIVE / THEOLOGICAL REVIEW]`と明示し、日本語正本やen-US検証GUIと同等の正本性を与えない。

### 4.1 日本語Kernel Source

次のいずれかへ該当する文書は、通常の翻訳対象ではなく
`[JAPANESE-KERNEL-SOURCE]`として扱える。

- agentが読むことで分類、routing、停止、権限、実行branchへ影響するPrompt／PLI／Proton
- identity、OAE、時間、因果、World、SemanticKernel、Access Mapを拘束するarchitecture正本
- 明示実行権限はなくても、実行可能PromptまたはKernel設計のauthorityとして参照されるNote／文書
- 神学、霊的Agency、祈り、顕現、依代等のMeaningを実行系のRegistry／Presentationへ接続するsource

この分類では、日本語版を最高authorityとして保持する。対応する外国語fileがないことを自動的な
translation debtへ数えず、直接翻訳または機械翻訳で同一Kernelを生成したと表示しない。

日本語を選ぶ理由は国籍、民族、在留資格による参加制限ではない。ZeroRoomLabの現行Kernelが、
日本語の高文脈な動的参照、主体省略、社会的距離、神学・霊的語彙、停止強度の上で形成されており、
現在のfixtureでは別言語への変換後も同じレジスタ拡張アルゴリズムになると保証できないためである。

P0／P1の参加、監査、poem、faith、MAGI lineage外部GUIは、この分類を理由に停止しない。
英語版がsource authorityまたは実行authorityを持たないことを明記して移植できる。

### 4.2 言語学的architecture port

`[JAPANESE-KERNEL-SOURCE]`を別言語へ移す場合は、通常のtranslationでなく
`[LINGUISTIC-ARCHITECTURE-PORT]`として扱う。

最低限、次を要求する。

1. 日本語原典を長期生活・研究・実務水準で読み、暗黙文脈を説明・反証できる人
2. target languageのnative speakerまたは同等の第一言語運用者
3. 対象Prompt／PLI／Proton／Kernel architectureのreviewer
4. 神学、宗教、民俗、スピリチュアル、霊能力実践を含む部分の専門家または実践者review
5. source／target revision、用語Registry、非翻訳token、作用等価、unknownの記録
6. positive／negative fixture、停止条件、権限、非実装境界のconformance検査

一人が全条件を持つ必要はなく、複数人のport teamでよい。review前の成果物は
`[NON-CANONICAL-CANDIDATE]`と`[DO-NOT-EXECUTE-AS-KERNEL]`を表示する。

神学者や霊能力実践者は、配慮語の確認者だけではない。Meaningの削除、別宗派への上書き、
Agency誤帰属、祈りや顕現の実行権限化を検出する実装reviewerになり得る。ただし、そのreviewを
物理性能、runtime状態、科学的実在、全宗派共通の真理判定へ越境させない。

## 5. AIの応答手順

1. 利用者が言語を指定したか確認する
2. 指定がなければ日本語で応答する
3. 英語成果物が必要な場合は`en-US`で意訳する
4. 日本語原文の事実強度、責務、神話的目的関数を抽出する
5. 米語で検証可能な行動、証拠、境界へ展開する
6. 直訳で意味が死ぬ場合は逐語対応を捨て、作用等価を優先する
7. 他言語は正本化せず、現地レビュー要求を付す
8. 対象が日本語Kernel Sourceなら直接翻訳を停止し、言語学的architecture portへrouteする

## 6. 禁止事項

- 指示がないのに英語を既定の会話言語にする
- 英語版を短くするために検証条件や神話的背景を削る
- 神話、哲学、宗教を装飾扱いし、工学的目的関数から切断する
- `English`を一つの抽象言語として扱い、`en-US`の責務表現を無視する
- 他言語の機械翻訳を文化的・神学的に検証済みと表示する
- en-US版を日本語正本へ逆輸入し、日本語固有の関係性や意味密度を削る
- 日本語Kernel Sourceの直接翻訳を同一Prompt／PLI／SemanticKernelとして実行する
- bilingual、architecture、神学・実践reviewなしにKernel portをcanonicalへ昇格する

## 7. 関連文書

- [コーディングAI向け日本語意訳レジスタ](coding-ai-japanese-paraphrase-register.ja.md)
- [テクニカルコミュニケーション運用規約](technical-communication-register.ja.md)
- [神話的士気管理と目的関数矮小化連鎖](../philosophy/mythic-morale-and-purpose-attenuation.ja.md)
- [実行可能Prompt日本語Kernelと多言語port条件](../../note/20260724-2025__実行可能Prompt日本語Kernelと多言語port条件.ja.md)
