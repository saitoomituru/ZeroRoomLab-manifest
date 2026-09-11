# FQuery OAE拘束とWorld境界監査

- 観測時刻: 2026-09-09 09:08:47 +0900
- source revision: `7fa42361463568cbe706830488d50dbf705fc030`
- observation mode: `current-interpretation-of-current-design`
- 対象: FQuery `main@17d96ae`、FQuery Issue #35／#41、ManifestのOAE／Context規約
- claim scope: Layer A/B bridge

## [FACT]

- FQueryはrevision固定ref FAMをprovider前へ配送し、同じrevisionをpost-validationとGUI projectionへ通すseamを`6ffc6e2`までに実装した。
- FQuery `17d96ae`は自然言語のsubstring／言語純度をFAM validityとする判定を外し、OAE拘束評価receiptをrecord integrity、rule conformance、observer verdictへ分離した。
- Issue #41には、semantic topologyとexecution topologyを分離し、並列dispatchをsemantic parentageのflat化へ逆輸入しない要件が追記された。
- Chrome／SafariのHuman Testは合格しておらず、長文fan-out、局所編集後のlambda伝播、nested Fold操作はHuman確認待ちである。

## [INTERPRETATION]

FQuery Coreへ自然言語の絶対的な正しさ、byte一致、世界の真偽を背負わせると、repairable AIのvalidatorが
暗黙の神託機になる。Core責務をshape、lineage、revision、change／no-op、rule bindingへ限定し、
意味一致やdomain完了をObserver OAEへ戻すことで、分類事故を許容しつつ説明と修正の回路を保持できる。

## Maxwell

モデルの分類失敗を禁止するのではなく、どのref FAMとrevisionでどのtopologyを生成し、どこを人間が
直したかを追跡可能にする。実行並列化は許すが、resource配置をcanonical semantic parentageへ焼き戻さない。

## Uriel

`record_integrity`、`rule_conformance`、`observer_verdict`を別状態にする。hash一致、人間review、embedding、
科学追試、game-system receipt、霊的／first-person attestationは別ruleであり、Coreはどれが普遍的に偉いかを裁定しない。

## Raphael

現実のpublisher／developer、公開行為、製品、作品World、game build、作中Event、audience心象を別棚に置く。
監督interviewの「制作の苦労」と「主人公の苦労」を同じWorld Eventへ潰さず、relationで接続する。

## [FIX]

- FAMの修復可能性へ非byte一致、非truth-machine、混在言語保持の境界を追記した。
- Context Dimension OSへOAE拘束成立の三状態と複数観測者の並存を追記した。
- 制作主体と作品Worldを分離するref／relation例を追記した。
- Context定規監査へ外部rule ref、検証方式、World出所の最低検査を追加した。

## [UNKNOWN]

- domainごとの`oae_rule_ref`最終SchemaとRegistry authority
- FQueryからIBDへ渡すOAE alpha FoldLogの永続化／index実装
- 長文sourceの正しいsemantic topologyに対するHuman observer verdict
- Chrome／Safariでの修正後Human Test結果

## [SEMANTIC-STOP]

現在の設計解釈を過去時点OAEへ遡及生成しない。FQueryの自動test結果をHuman Test合格へ昇格せず、
一つのObserver verdictをglobal truthへmergeしない。domain rule未確定部分はCore固定enumで埋めない。
