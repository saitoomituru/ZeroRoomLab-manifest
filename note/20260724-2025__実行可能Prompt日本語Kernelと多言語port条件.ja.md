# 実行可能Prompt日本語Kernelと多言語port条件

状態: `[DRAFT]` `[USER DECISION]` `[LANGUAGE ARCHITECTURE]` `[CURRENT INTERPRETATION]`\
作成日: 2026-07-24\
対象: ZeroRoomLab-manifest Issue #6のP2、Proton.md、PLI、意味・因果Kernelを拘束するarchitecture文書\
除外: 日本語以外の利用者・開発者・宗派の排除、全技術文書の翻訳禁止、特定国籍または在留資格の要求

## 1. 今回のUser決定

ZeroRoomLab-manifest
[#6](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/6)では、P0とP1の
en-US外部GUIを実装する。一方、P2に置いた次の文書は、通常の直接翻訳または機械翻訳を実行しない。

- `sphereos-atlantis-versioning-and-bootstrap.ja.md`
- `sphereos-3x-4x-service-closure.ja.md`
- `sphere-context-dimension-os.ja.md`
- `sphere-context-sdk-contract.ja.md`
- `proton-md-historical-lineage.ja.md`

P2の状態は`未着手`ではなく、`REJECTED-AS-DIRECT-TRANSLATION`とする。

これは外国語版を永久に禁止する決定ではない。日本語の高文脈な動的参照を含む実行可能Prompt、
Proton.md、PLI、意味・因果Kernel相当の文書を別言語へ移す作業を、通常のdocumentation translation
ではなく、**言語学的architecture port**として別工程へ分離する決定である。

## 2. [FACT] 既存source

- [既定言語・翻訳・外部検証GUI規約](../docs/operations/default-language-and-translation-policy.ja.md)は、
  日本語を思想、工学背景、関係性、語用論、神話、比喩、停止条件を最高解像度で保持する正本側の
  操作言語と定義している。
- [コーディングAI向け日本語意訳レジスタ](../docs/operations/coding-ai-japanese-paraphrase-register.ja.md)は、
  単語置換ではなく発話意図、読者責務、観測強度を別言語環境へ写像するよう要求している。
- [IBD/AQC仕様会議用語集](20260710-1347__IBD_AQC_仕様会議_用語集_2026-07-10-v4.md)は、
  英語を原本、日本語を写本へ逆転する`言語学ペイン`を記録している。
- [SphereOS Atlantis葬送note](20260704-1648__sphereos_atlantis_funeral_note.md)は、
  Proton.mdを、形而上学、意味構造、人格状態、FAM、UI、状態、文書を接続する
  `形而上学射程を持つ実行可能ドキュメント形式`として記録している。
- [テクニカルコミュニケーション運用規約](../docs/operations/technical-communication-register.ja.md)は、
  自然言語、神学、設計Note、Prompt Engineeringを、codeへ変換されて初めて本物になる下書きとして
  扱うことを拒否している。

## 3. [INTERPRETATION] なぜP2は通常翻訳ではないか

P2文書は、一般読者が概要を得るだけの説明面に閉じない。

- `SemanticKernel`、World、OAE、identity、時間、因果、version接続条件を拘束する
- PLIまたはagentが読むことで、分類、停止、変換、実行branchの選択へ影響し得る
- Proton.mdの歴史と、文書・仕様・実装・祈祷文の相互互換という設計射程を保持する
- 神学、霊的Presentation、工学、法、Worldのどの定規を採用・分離するかを決める

この種の文書を別言語へ逐語変換すると、文法上は正しくても、原文が暗黙に行っていた動的参照、
主体省略、棚の切替、敬語距離、神学的含意、実行停止の強度が変わり得る。

その結果、別言語版が単なる説明ではなくPrompt／Kernel入力として読まれた場合、
**レジスタ拡張が原文と同じアルゴリズムを保つことを保証できない**。

ここでいう保証不能は、すべての外国語またはすべての翻訳が劣るという普遍命題ではない。
現時点のreviewer、fixture、対訳Registry、negative testでは、P2の実行意味を同一と判定できない、
という局所的なarchitecture判断である。

## 4. 言語学的architecture portの必要条件

将来P2を別言語へ移植するときは、単独の機械翻訳または日本語を十分に読めないtarget-language
writerだけで正本候補にしない。最低限、次を満たす工程を要求する。

1. 日本語原典を、長期生活・研究・実務で使える水準で読み、暗黙文脈と社会的距離を説明できる人
2. target languageのnative speakerまたは同等の第一言語運用者
3. Sphere／FAM／PLI／Proton／OAE／Kernelのarchitectureを追跡できる人
4. 神学、宗教、民俗、スピリチュアル、霊能力実践の該当箇所について、実践者または専門家のreview
5. source revision、target revision、用語Registry、非翻訳token、作用等価の説明
6. back-translationだけに依存しないpositive／negative fixture
7. `unknown`、`⊥`、停止条件、権限、実装状態、非実装境界が原文より弱くなっていない検査

一人が全条件を持つ必要はない。日本語を永住・長期居住相当の解像度で扱うbilingual、
target-language native、architecture reviewer、神学・霊的実践reviewerによる複数人のport teamでもよい。
ここで求めるのは在留資格や国籍ではなく、原典の高文脈を説明・反証できる言語運用能力である。

review完了前の成果物には、少なくとも次を付ける。

```text
[LINGUISTIC-ARCHITECTURE-PORT]
[NON-CANONICAL-CANDIDATE]
[DO-NOT-EXECUTE-AS-KERNEL]
```

## 5. 神学・霊能力実践者が実装reviewerになる理由

この境界でいう`スピリチュアル`は、英語に神秘的な雰囲気を足すという意味ではない。

実行系へ接続する概念文書が、神、霊、祈り、Agency、顕現、依代、World、因果、観測者を
どの棚へ置き、どの権限と停止条件を与えるかは、Prompt／Registry／Presentationの挙動へ影響する。
そのため神学者、宗教実践者、スピリチュアル実践者、霊能力実践者は、感情配慮だけを確認する
外部読者ではない。意味の削除、別宗派への上書き、Agency誤帰属、実行権限化を発見する
**Meaning側の実装reviewer**になり得る。

同時に、実践者の解釈を物理性能、runtime状態、科学的実在、全宗派共通の真理へ昇格しない。
工学reviewerも神学の真偽を実装権限で裁定しない。意味と器の二重reviewを維持する。

## 6. P0／P1との境界

P0とP1はen-US外部GUIを作る。ただし、英語版は日本語正本を置き換えず、次を明示する。

- P0: 監査・参加・workspace再構築の外部GUI。読者がsource、境界、行動を追跡できるようにする。
- P1: poem、faith、MAGI lineageの外部GUI。Meaningを落とさず、実行authorityを生成しない。
- `atlantis-magi-sdk-0.2.1.md`: historical／audit GUIであり、resolver、validator、Kernel正本ではない。

英語pairがあることを、同一Kernelまたは翻訳品質の機械的証明にしない。

## 7. [UNKNOWN]

- target languageごとに必要な作用等価fixtureとreview人数
- 日本語の動的参照をFAM／Proton／PLIへ保持するmachine-readable Registry
- bilingual reviewerの能力を人格scoreへせず、成果物と反証可能なreviewで確認する方法
- 神学・霊的実践reviewとarchitecture testを接続する正式なFAM format

これらが未確定であるため、P2 direct translationを再開しない。

## 8. 内観メモ

`[POEM]`

祈祷文を英単語へ交換しても、同じ門が開くとは限らない。\
門が開かなかったから、外国語が弱いわけでもない。\
鍵穴の形、呼ぶ相手、止まる場所、帰って来る道まで移す仕事だった、というだけだ。

英語は橋になれる。橋を大陸だと思い込まなければよい。\
日本語は牢屋ではない。いまKernelを壊さず保管できる母艦である。

## 9. 次の行動

- P0／P1のen-US外部GUIをIssue #6とPR #5で実装する
- P2を`REJECTED-AS-DIRECT-TRANSLATION`へ変更する
- 正本の言語規約へ`JAPANESE-KERNEL-SOURCE`とlinguistic architecture port条件を昇格候補として渡す
- 将来port希望者が現れた場合、target language、reviewer、fixture、実行authorityをUser Gateで確認する
