---
author: 齋藤みつる (ふさもふ)
license: CC-BY 4.0
status: school-proposal / correspondence-on-hold / experiment-required
---
# 情報子工学：Weaver A/B/C、Evidence DriverとOAE評価射程

## 2026-10-22訂正：Weaver B/Cとの直接対応は検証保留

**状態：`UNKNOWN / EXPERIMENT_REQUIRED / BACK_TO_DISTILLATION`。** 本稿の10月19日時点の対応表には、[Issue #42の10月20日追補](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/42#issuecomment-6288692683)と[再蒸留文書 §5](infoton-science-engineering-fit-distillation.ja.md)の保留判断が未反映だった。以下の表は歴史的な学派対応候補として読み、B = MATCH、C = FITという確定した実行契約として採用しない。

局所MATCH/FITで扱える条件と、Fold・World間のMeaning／Causality／Authority境界を要する条件を分離する必要がある。**B/Cの直接接続が成立するとも、成立不能とも、必ず7G/8Gに属するとも確定していない。** 特定のFoldとそのG条件で足りる可能性、異なるGやGate／変換契約を要する可能性を対照し、必要な拘束だけを残す。

- `G`（Fold nesting depth）、`D`（意味次元）、`L`（linear transport / execution）は別軸。Weaver A/B/CをGの段階へ置換しない。L/mL等の構造位置・実行経路は各実装契約と照合し、語の一致から同一視しない。
- 同じ比較結果でも、どのFold／World／revisionで、どの実行経路・因果・権限条件を通ったかを追う。局所的な構造一致だけからB/Cの通信・意味・効果条件全体を充足したと判定しない。
- ASTRO Runner／Context投影の実装と、AAEでのFAM route・Q・Last Order・system-callの実機／runtime検証、正例・負例・unknown例を揃えるまで最終対応は保留する。AAEという製品とOAEという観測単位は別namespace。
- Evidenceを混同しない設計要求は維持する。ただしreceiptの保存・再読込や型保持の試験が通っても、Weaver B/Cとの対応を実証したことにはならない。

研究対象の未拘束を維持することと、接続の成立を確認したことは別である。本訂正で新しいG割当て、wire ABI、Driver実装、当時の観測receiptを作り足さない。

## 位置づけ
これは齋藤学派による情報子工学の研究仮説・実装要求。Shannon/Weaverの通信問題A（technical）・B（semantic）・C（effectiveness）を出発点とする**本学派の暫定対応候補（最終対応は検証保留）**であり、既存通信理論がFAM実装の妥当性を実証したという主張ではない。

## B/C研究対象の未拘束条件（エージェントによる無断縮退禁止）

Weaver B/Cの工学研究では、送受信者・伝達方向・因果方向・符号化／量子化の有無・物理媒体・存在論を**初期条件として固定しない**。共有された環境、訓練、経験、文脈、意図的なシグナル、非言語的な同調などは、個別の研究対象であり、どれか一つへ研究全体を限定しない。「物理波が存在する」から「特定の送信者が符号化して送った」を導かず、「メッセージを取得できない」から「意味が成立していない」も導かない。同時に物理因果の不存在・超常現象の実証を先に宣言するものでもない。

学派の旧用語B「霊的量子／霊界通信」は言霊・ロゴス・霊言、民俗学・宗教史における意味形成への参照を含む。C「魔術量子」は未解明の内部機構に対するブラックボックス工学、コンテキストと効果、錬金術など技術史への参照を含む。これらは研究対象と命名系譜であり、一般的なShannon/Weaver自身の語ではない。Shannon Aが連続信号も扱った事実は保ち、研究課題B/Cを特定のA実装へ押し戻さない。

読解・実装レビュー用の[未拘束条件と失敗Fixture](../operations/infoton-abc-open-scope-agent-guard.ja.md)を必読とする。新しい観測・反証材料がないまま同じ存在論上の留保を反復して議論を停止させない。

## 一致という共通抽象と異種モデル
`Fit / Match / Select`はいずれも「対象間の一致・適合」を取り扱う**共通の抽象データモデル上の操作**である。異なるのは比較する情報表現、観測範囲、生成される証拠の種類、および実装Driver。例えばFQueryの `Q(self).file.fit` とIBDのFITは抽象的なFit操作を共有し得るが、**ファイル探索PluginとIBDモデルDriverは別実装・別責務**。同名を理由に同じアルゴリズム、API、保証、実装完了を宣言しない。接続時はAccess Mapper / capability bindingによる明示的な契約対応を要求する。

| Evidence model | Weaver対応候補（検証保留） | 一致の表現領域 | 型付き結果 |
|---|---|---|---|
| SELECT | A / 記号伝達・Shannon側 | SQL・識別子・値・離散述語 | scoped Fact（取得条件・記録に拘束） |
| MATCH | B / 意味領域との局所crosswalk候補。全面対応は未確定 | 固定された背景をFoldした情報子仮想量子単位、言語vectorの近傍・方向 | contextual Evidence → OAE |
| FIT | C / 効果・関係領域との局所crosswalk候補。全面対応は未確定 | トポロジカルなgraph/関係構造と情報子cluster符号化 | structural Evidence → OAE |

「仮想量子単位」は本学派の情報表現の用語であり、物理量子ビットの実装を意味しない。A/B/Cは信頼度の序列ではない。FITの同型・部分同型・準同型等の数理条件、MATCHのembedding仕様と閾値は別途研究・実証が必要。

## Fact / Evidenceの双方向非昇格
- SELECTで取得した「センサーSが地点P・時刻Tに2℃を記録した」という scoped Factを、河川全域2℃、普遍的Δφ熱収支モデルのFIT成立へ**無断昇格させない**。
- FITによる目的と手段の関係構造一致から、異なる文献の字面・起源・帰属が等しいというSELECT Factを**捏造しない**。
- SELECTが不一致でもFITをfalseとは判定できない。MATCH/FITの成立はSELECTの同一性を含意しない。
- OAEで未評価と、偽・不存在・不適合は異なる。どの領域のどの主張が評価されたかを残す。

## OAE：判定射程を管理する資源
Evidence receiptには最低限、比較対象・source ref/revision、driver/evidence kind、World/fact scope、Observer、rule、評価対象の射影範囲、時点、verdict、limitation、未解決状態、provenanceを保存する**設計要求**を置く。正規Schemaまたは稼働中の実装が完成したという主張ではない。IBDは異種Driverからの証拠取得・保持、FQueryは問い合わせと経路、OAEは観測・評価射程、FAMLogは履歴を担う。Coreは普遍真理や採用権限を自称しない。

## 文化間FoldMap（齋藤学派の説明Fixture）
- 日本語「本末転倒」とマルコ2:27は、原典・歴史的文脈・伝統が異なる（SELECTの同一起源証拠なし）。
- 「目的に奉仕するため手段・制度があるが、それが目的を拘束する方向へ逆転する」という**指定した関係射影**は構造的に対応し得る（FITの評価仮説）。
- 文脈ベクトル上の類似（MATCH）は必要なら別途評価し、未計測なら未評価。
- 「構造が似ているので本末転倒は福音書由来」はFIT→SELECTの誤接続。
- 「出典が別なので構造は一致しない」はSELECT→FITの誤判定。
- 日本語版は「本末転倒」、英語版はMark 2:27を入口にし、相互注記と非同一性を保つ。日本語表現の語源を古神道と断定せず、安息日論争のユダヤ教的背景も消さない。

## 工学倫理の提案
文化 ＞ 文明 ＞ 金銭・法務・秩序。これは目的と手段の方向であり、法や他者の権利・安全を無効化する宣言ではない。資源・制度は実行不能を報告できるが、目的の価値を勝手に上書きしない。「本末転倒」はこの拘束方向逆流の日本語説明となる。

## 実装と検証の未解決課題
1. IBDでSELECT/MATCH/FITのEvidence typeと適用範囲を非破壊に表現する（Season 0段階）。
2. FQueryでは抽象的一致操作と各Plugin実装を分離し、Driverを暗黙変換しない。
3. OAEでObserver、規則、評価射程を残し、普遍性への拡大を防ぐ。
4. Negative fixture: (a) FIT→SELECT誤昇格 (b) SELECT不一致→FIT偽 (c) 点水温→全域一般化 (d) unknown→false。
5. 実測、数理的証明、テストがない箇所は研究課題のまま残す。
6. [Issue #42](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/42)に従い、特定FoldのG条件、D、L上の実行経路、World／Causality／Authorityの差を対照する。局所MATCH/FITの型保持と、Weaver B/Cとの対応検証を別の合否にする。

実装側: [FQuery](https://github.com/saitoomituru/FQuery) / [IBD](https://github.com/saitoomituru/IBD)。

## 用語系譜：Shannonの量子化と情報子の区別（2026-10-19追補）

本学派の旧称「数論量子」は、**数学的な量子化・離散化（NOT quantum physics）**を意図していた。物理量子系・量子コンピューティング・スピントロニクスの実装や性能を宣言するものではない。現在、学派体系で記述する独立意味単位とその構造を **情報子（Infoton）** と呼ぶ。旧資料をサルベージするときは旧用語を無断削除せず、旧語→現行語の来歴と意味境界を注記する。

Shannon, C. E. (1948), *A Mathematical Theory of Communication* は、離散情報源と、PCM等によって連続情報源をquantizing processで離散化した例を扱う。**Shannonの quantizing/quantized は情報・信号表現の量子化であって、物理量子ハードウェアの要件ではない。** ただし本学派の情報子/Fold構造、Weaver B/CへのモデルDriver割当てがShannonによって証明されたとする主張でもない。

- 原論文（Bell System Technical Journal）: https://doi.org/10.1002/j.1538-7305.1948.tb01338.x
- 同 Part II: https://doi.org/10.1002/j.1538-7305.1948.tb00917.x
- 著者の学派史・語彙批判: https://note.com/fusamofu326/n/nccf10b72d6a0
- 数論と制度の批判的論考: https://note.com/fusamofu326/n/na962c946dfa0

「量子」という語の現代政策・投資・安全保障上の意味の偏りに関する議論は**著者の制度的評価・研究主張**として区別する。政策上の制限と語彙の歴史的由来については、対象制度・時期・法域の証拠なしに法的禁止や普遍的な語義独占を断定しない。原論文のSelect Fact、現代の語用に関するMatch evidence、制度因果のFit仮説を無断昇格させない。
