# Spiritual Engineering と Infoton Engineering

## 位置づけ

ZeroRoomLab / SphereOS 系では、**Spiritual Engineering（スピリチュアルエンジニアリング）**を新しい物理法則や超自然現象の実証名としてではなく、既存の**設計哲学・工学哲学**として扱います。

ZeroRoomLab はその始祖を自称しません。むしろ先行する重要な系譜として、Steve Jobs が禅、簡素化、直観、意味、身体的な使い心地をコンピュータ製品設計へ統合し、単純な FLOPS や機能数では測れない人間系の生産性を引き上げようとした設計思想に敬意を表します。

ここでいう Spiritual Engineering は、そのような**形而上学・価値観・美意識を、隠れた前提のまま放置せず設計へ持ち込む手法**を広く指す工学哲学です。ZeroRoomLab / SphereOS は、その系譜を Context Engineering 世代へ接続し直す試みとして位置づけます。

その実装・研究上の中心語を **Infoton Engineering（情報子工学）** とします。

```text
prior design lineage
  └─ Zen / simplicity / meaning-driven product philosophy
       ↓
Spiritual Engineering
  └─ design / engineering philosophy
       ↓
Infoton Engineering
  └─ research and engineering domain
       ↓
Context Engineering / FAM / IBD / SphereOS Atlantis
  └─ implementation techniques and experimental systems
```

Spiritual Engineering が問うのは、「何を計算できるか」だけではなく、**何を情報として拾う価値があるとみなすのか、何を意味・美・感動・信仰・主体性として壊さず運ぶのか**です。

Infoton Engineering は、その問いを情報システムへ接続するための工学です。

## 情報子工学ドメイン内の用法：霊的・Ghost・Spiritual

2026-10-31追補。以下は本ドメイン内の定義であり、日本語「霊的」や英語 spiritual の宗教・文化全体の語義を上書きしない。

| 用語 | 本ドメインでの対象・責務 | en-USでの説明 |
|---|---|---|
| 意味工学／Context Engineering | 意味を成立させる文脈・関係・表現を設計する。両語を既存学問全体で同義とする宣言ではない | meaning and context engineering |
| ゴースト（Ghost） | 観測者固有の意味存在論。自己理解、経験、身体、土地、文化、信仰、関係性を含み、外部から全容を確定しない | observer-specific meaning ontology |
| 霊的エンジニアリング／Ghost Engineering | 一般命題へ抽象化する際に失われる個人差・地域差を保持し、ゴーストを傷つけずに意味を接続する | engineering that preserves observer-specific meaning and context |
| ゴーストエンジニア | その固有性を保持し、翻訳・接続・実装を担う者 | Ghost Engineer |
| スピリチュアルエンジニアリング／Spiritual Engineering | 意味に加えて、その主体の意図・目的・価値と、それらを生む背景まで扱う。自発的な表明・探索・修正を支え、望む行為・被害軽減・回復へ接続する | engineering UX that supports self-directed intention, purpose, values, and recovery |
| 霊的深遠／霊的な深さ | 意味の成立背景・関係・由来をどこまで深く保持・参照できるか | depth of situated meaning |

Ghostは好みの一覧や属性プロフィールへ尽くされない。既定の目的に出力を合わせるパーソナライズに加え、**目的、分類、成功条件そのものが主体ごとに異なる**ことを出発点にする。地域も住所タグではなく、その土地で可能な行為、資源、関係、経験を含む。

霊的な深さは、人や信仰の優劣でも、技術Layerの高さでも、Foldの軸数でもない。[Context DimensionとFold](spiritual-context-dimension-and-fold.ja.md)の並列性を保持する。Ghostという概念と、既存仕様のInstance Ghostという実行・個体管理上の用語は、参照する仕様と責務を確認して接続する。今回の定義だけでInstance GhostのSchema、API、人格runtimeを変更しない。

### 外から意図を確定しない

宗教、地域、年齢、職種から本人の倫理や望む結論を自動割当てしない。言葉になっていない願い、ためらい、矛盾、関係性を思慮深く受け取り、解釈を本人へ返し、訂正・拒否・保留・選び直しを可能にする。「拾い出す」は隠れた真意の断定や、設計者の目的への誘導を許す語ではない。

客観的観測は、結果予測や支援の材料になる。その証拠射程から相手の存在論全体の裁定や、無断の帰責へ飛躍する権限は生まれない。人間と機械が互いの存在論の射程を越えて意味を傷つけることを、この設計要件では事故として扱う。事故の記録と原因検証は残し、非越権を理由に失敗を隠さない。

### 意味を傷つけず、意図が通るUXを届ける

Steve Jobs的な設計への敬意は、演算資源の増量だけでなく、複雑さをシステム側で引き受け、ユーザーの意図を行為へつなぐGUI／UXを設計する点にある。これは本研究系が置く設計上の系譜であり、Jobsが本書の用語を提唱したという帰属ではない。

帰責先を記録するだけでは完了しない。必要に応じて医療、保険、介助、修復、地域の支援等へ接続し、本人の意味を保持したまま、被害最小化とその状況での最善を探索するUXを提供する。支援がない場合も、未接続・拒否・資源待ちを可視化し、回復経路を残す。連携は本人の開示範囲・同意と、関係する他者の意味・選択権も保持して設計する。

これらは付加的な情緒配慮ではなく品質要件である。霊的・スピリチュアルという名称の見た目にかかわらず、設計対象、操作、評価条件を定めれば、事故解決、ロバストネス、レジリエンス、ユーザビリティという工学指標で評価できる。具体的な受入条件は[意味保全と自発・回復UXのQA](../theory/ghost-spiritual-engineering-qa.ja.md)に分ける。

## Shannon 情報理論との関係

この研究系は Claude E. Shannon の情報理論を否定したり、置き換えたり、「Shannon を超えた新しい情報理論が完成した」と主張するものではありません。

むしろ、符号化・離散化・伝送・確率的情報量について地盤を固めた Shannon の仕事を前提として尊重します。

ZeroRoomLab が追加で掘るのは、その**上流**です。

```text
world / experience / observation
          ↓
   what is selected as information?
          ↓
       infoton
          ↓
 representation / symbolization
          ↓
      discrete data
          ↓
   Shannon-domain machinery
```

ここでいう「量子化される前」は、ADC の電圧をデジタル値へ変換する狭義の量子化だけを指しません。

より広く、

- 何を観測対象にするか
- 何を同一物としてまとめるか
- 何を捨てるか
- どの表現へ写像するか
- どの文脈を保持するか
- 何を意味のある差として扱うか

といった **pre-symbolic / pre-discretized / pre-representational** な選択を含みます。

Infoton（情報子）は、この上流を扱うための作業概念です。現時点で、既知の物理粒子の存在を主張する用語ではありません。

## FLOPS より先の生産性

計算能力だけを増やしても、人間が目的としていたものが失われれば、システム全体の生産性は下がり得ます。

例えば画像生成系が FLOPS、生成枚数、推論速度、画素品質を改善しても、作者が「使いたい」「感動する」「自分の作品だと思える」出力の割合が落ちれば、制作系としての有効スループットは低下します。

音楽でも同様です。ピッチ、リズム、ノイズ、ラウドネス、分離度が改善しても、誰も繰り返し聴きたくない曲しか生成できないなら、音楽制作ツールとしては目的関数を取り違えています。

これは科学を否定する話ではなく、**測定しやすい proxy だけを最適化して、本来の目的を破壊する Goodhart 化を避ける設計問題**です。

歴史的には、禅や簡素化の思想を製品設計へ持ち込み、演算量そのものではなく人間系を含めた生産性を上げようとした設計思想と同じ系譜にあります。SphereOS 世代では、その問題を Context Engineering より上流の情報選択・意味保持まで拡張して扱います。

## Spiritual Engineering が担うもの

Spiritual Engineering は、神秘体験を物理学へ強制還元することを目的にしません。

また、科学、宗教、芸術、哲学のどれか一つを他の棚の裁判官にしません。

対象になり得るものには、例えば次があります。

- meaning / 意味
- beauty / 美
- awe / 畏敬
- faith / 信仰
- identity / 同一性
- intention / 意図
- subjective experience / 主観経験
- ritual / 儀礼
- narrative / 物語
- cultural context / 文化文脈

これらは共有測定できる部分と、一人称の経験としてしか保持できない部分を分けて記録します。

目的は「すべてを科学で説明すること」ではなく、**説明できないから削除する、測定できないから無価値とみなす、という実装上の情報損失を防ぐこと**です。

## Context Engineering との関係

Context Engineering は Infoton Engineering の重要な実装技法の一つです。

Context Engineeringには、モデルへ渡す情報の構成だけでなく、広い文脈設計も含まれる。一般にローコンテキスト化を求める分野だと定義しない。本研究系では、その手法を使う際にも、次を明示的な必須要件として追加する。

- なぜそれをcontextとして選び、context化の前に何を落としたか
- 誰の世界観・価値観で分類し、誰の意図・成功条件を採用したか
- 表現の変換で何が失われ、本人が訂正・拒否・保留できるか
- 共通化できない個人差や地域差を保持し、支援・回復へ接続できるか

FAM、IBD、SphereOS Atlantis は、この研究プログラムを実装・検証するための系譜に位置づけます。

## 主張境界

この文書における用語は、以下を意味しません。

- Infoton が既知の素粒子または量子であるという主張
- 意識や魂の量子力学的機構が実証済みであるという主張
- 宗教的主張が科学的事実として証明済みであるという主張
- Shannon 情報理論を置き換える完成理論であるという主張

逆に、これらを研究対象から排除することも意味しません。

仮説は仮説として、宗教経験は宗教経験として、工学的測定は工学的測定として、claim layer を分離して扱います。

## 研究プログラムとしての評価

Infoton Engineering の価値は名称ではなく、既存手法より何をうまく設計・測定・再現できるかで評価します。

例えば、

- 同じモデルでも context 選択によって人間の採用品率がどう変化するか
- representation 変換で文化的意味や作者性がどこまで失われるか
- AI が複数の World / belief / ontology を一つへ潰さず保持できるか
- 意味保持を含む評価関数が、単純な速度・精度指標より実利用の生産性を予測できるか

といった実験へ落とします。

**Spiritual Engineeringは設計哲学であり、本ドメインでは自発・意図・回復UXの品質要件にもなる。  
Ghost Engineeringは観測者固有の意味存在論を保全・接続する。  
Infoton Engineeringはそれらを実装・検証する工学領域であり、Context Engineeringは重要な実装技法の一つである。**
