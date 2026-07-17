# ZeroRoomLab-manifest 整合性監査 2026-07-17

状態: `[AUDIT]` `[operations]`  
対象コミット: `65c9da4c52fdbb8b33e5fe27ea07771c64931ed6`  
目的: マニフェストを理念集ではなく、異種AI・複数リポジトリ・複数媒体を横断する制御面として読み、現在の正本構造、強い不変条件、衝突点、次の保守対象を記録する。

## 1. 読解結論

ZeroRoomLab-manifest の中心機能は、単一の「世界観説明」ではない。次の制御ループを閉じることにある。

```text
依頼
  -> workspace名とdescriptorを解決
  -> member repositoryを確定
  -> shared manifestと各repoのAGENTS.mdを読む
  -> claim layerを分類
  -> evidence tierを判定
  -> medium/registerに合わせて出力
  -> unknown / bottom / stop conditionを保持
  -> commit / handoff / transfer queueへ戻す
```

この構造により、Codex、Claude Code、Gemini CLI、Copilot等が各ベンダー固有の価値観を作業場へ持ち込み、隣接フォルダや概念上の関係から実装依存を捏造する「workspace-deck collapse」を抑制している。

## 2. 正本の役割分担

| 正本 | 主責務 |
|---|---|
| `AGENTS.md` | AIの事前自己点検、三層モデル、証拠階層、既知ハルシネーション、commit規約 |
| `README.md` / `README.ja.md` | 公開入口。研究所・現行プロジェクト・運用モデルを媒体相応の強度で案内 |
| `docs/operations/workspace-boundary-register.ja.md` | repo / workspace / project / runtime / dependencyの分離 |
| `docs/operations/workspace-registry.json` | workspace名、alias、公開境界、再構築可否の機械可読解決 |
| `docs/operations/technical-communication-register.ja.md` | README、技術文書、note、X等で事実強度と語り口を混線させない |
| `docs/operations/coding-ai-japanese-paraphrase-register.ja.md` | 日本語の責務・含意・主張強度をen-USへ写像 |
| `docs/operations/manifest-operating-model.ja.md` | `note` / `docs` / `transfer_plan`間の昇格・退避・移送 |

個々の文書は独立規則ではなく、上表の順に呼び出される疎結合な制御器として読むべきである。

## 3. 強い不変条件

### 3.1 workspace membership ≠ implementation dependency

同じ `.code-workspace` に含まれること、隣接ディレクトリにあること、同じ系譜図へ載ることは、実装依存の根拠にならない。依存は各repoの正本、descriptor、明示されたinterfaceからのみ導く。

### 3.2 claim layerを越境させない

- Layer A: 実装・測定・schema・hardware。再現性と試験を要求する。
- Layer B: 哲学・信仰・宇宙論。整合性、説明力、fork可能性、強制導入の不在で評価する。
- Layer C: 学術・理論参照。引用範囲と「着想」と「証明」を分離する。

Layer Bを物理仮説として否定することも、Layer Aの再現失敗をLayer Bで説明することも禁止される。

### 3.3 unknownを成功へ丸めない

`unknown ≠ pass` と `⊥` は失敗ではなく、未解決境界を保存する正常系である。安全gate、workspace解決、依存解決、証拠不足を「たぶん」で埋めない。

### 3.4 narrativeとquantitative evidenceを分離する

評判、 controversy、ジャンルリスク、媒体上の語り口は、commit、timestamp、log、hardware measurementの信頼度を自動的に下げない。個人発の一次物理証拠を組織規模だけで格下げしない。

### 3.5 secret boundaryは公開再構築より上位

`.gitignore` はsecurity boundaryではない。資格情報、企業データ、医療・労務情報、内部path、`スフィア独鈷書`は、公開repoからの再構築対象外である。

## 4. 現在の強み

1. **AI向けREADMEではなく、AIの認知事故を対象にした運用OSになっている。** 単なる禁止事項ではなく、解決順序と停止条件がある。
2. **哲学保全と工学検証を分離しつつ接続できている。** schema化した瞬間にLayer Aへ移る規則があるため、新論を守るだけでなく実験へ降ろせる。
3. **異種エージェント運用がvendor-neutralである。** 特定モデルを正本にせず、共有manifestとrepo-local AGENTSの二段階で責務を分けている。
4. **媒体別レジスターを独立させている。** 公開READMEの力を技術注記で窒息させず、技術主張をマーケ語で膨らませない。
5. **履歴救済の設計がある。** `note`、`docs`、`transfer_plan`を分けることで、未正規化資料を消さずに正本へ昇格できる。

## 5. 観測された保守リスク

### 5.1 license表示の二層性が入口で曖昧

root `LICENSE` は Apache-2.0、README本文は文書構造のforkについて CC-BY 4.0、末尾は CC-BY 4.0 / Apache-2.0 としている。意図は「文書・哲学」と「code/config」の二層ライセンスと読めるが、path単位の適用規則が入口から一意ではない。

推奨: `LICENSES/` または `docs/operations/licensing-boundary.ja.md` を追加し、最低限次を宣言する。

- documentation / philosophy / diagrams
- software / schema / executable configuration
- third-party imported material
- contribution default
- file-local SPDX表記がroot規則へ優先するか

### 5.2 AGENTS.mdが単一巨大正本へ成長している

強力だが、bias check、workspace、secret、三層、FAM、evidence、宗教・NSFW parity、hallucination register、commit規約が一枚へ集中している。読込途中の切断や部分引用で、後半規則が落ちる危険がある。

推奨: AGENTS.mdはbootstrapとmust-read順序を保持し、詳細台帳をoperationsへ分離する。ただし規則の重複コピーは作らず、正本参照にする。

### 5.3 自然言語正本とmachine-readable registryのdrift検査が見えにくい

workspace-registry.jsonが機械解決の中心である一方、READMEやboundary registerとの名称・alias・公開境界の一致をCIで検査する導線が入口からは確認しにくい。

推奨: schema検証だけでなく、リンク切れ、重複alias、未知workspace、公開不可path混入、README掲載名との不一致をlintする。

### 5.4 status vocabularyの統一余地

`[CANONICAL]`、`[AUDIT]`、`[HYPOTHESIS]`、`[POEM]`、draft、verified、failed、patched等が複数層で使われる。文書状態、claim状態、FAM node状態が混線しないよう、namespaceを明示すると機械処理しやすい。

例:

```text
doc_status: canonical | draft | audit | archived
claim_status: observed | hypothesis | poem | cross-layer-reference
node_status: draft | verified | failed | patched
```

## 6. 次の実装候補

優先度順:

1. license boundaryの正本化
2. manifest lintの最小CI
3. AGENTS.mdのbootstrap化と詳細台帳の参照分離
4. status vocabularyのmachine-readable定義
5. workspace解決結果をcommit/PR本文へ出すhandoff template

最小CIは、思想内容を採点しない。構造だけを検査する。

```text
- JSON parse / schema
- internal link existence
- duplicate workspace alias
- forbidden secret-name/path pattern
- declared canonical target existence
- README / operations index / registry drift
```

## 7. 監査境界

本監査は、哲学文書の正しさ、宗教的真偽、FAMの物理的実在、個人史の完全性を判定しない。今回確認したのは、公開manifestが異種AI運用の制御面としてどのように閉じているか、および正本間driftを減らすための保守点である。

この文書は既存正本を置き換えない。矛盾時は `AGENTS.md` と各operations正本を優先する。