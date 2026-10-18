---
author: 齋藤みつる (ふさもふ)
license: CC-BY 4.0
status: school-proposal / design-contract / not-empirically-validated
---
# 情報子工学：Weaver A/B/C、Evidence DriverとOAE評価射程

## 位置づけ
これは齋藤学派による情報子工学の研究仮説・実装要求。Shannon/Weaverの通信問題A（technical）・B（semantic）・C（effectiveness）を出発点とする**本学派の対応モデル**であり、既存通信理論がFAM実装の妥当性を実証したという主張ではない。

## 一致という共通抽象と異種モデル
`Fit / Match / Select`はいずれも「対象間の一致・適合」を取り扱う**共通の抽象データモデル上の操作**である。異なるのは比較する情報表現、観測範囲、生成される証拠の種類、および実装Driver。例えばFQueryの `Q(self).file.fit` とIBDのFITは抽象的なFit操作を共有し得るが、**ファイル探索PluginとIBDモデルDriverは別実装・別責務**。同名を理由に同じアルゴリズム、API、保証、実装完了を宣言しない。接続時はAccess Mapper / capability bindingによる明示的な契約対応を要求する。

| Evidence model | Weaver対応（学派提案） | 一致の表現領域 | 型付き結果 |
|---|---|---|---|
| SELECT | A / 記号伝達・Shannon側 | SQL・識別子・値・離散述語 | scoped Fact（取得条件・記録に拘束） |
| MATCH | B / 意味領域 | 固定された背景をFoldした情報子仮想量子単位、言語vectorの近傍・方向 | contextual Evidence → OAE |
| FIT | C / 効果・関係領域 | トポロジカルなgraph/関係構造と情報子cluster符号化 | structural Evidence → OAE |

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

実装側: [FQuery](https://github.com/saitoomituru/FQuery) / [IBD](https://github.com/saitoomituru/IBD)。
