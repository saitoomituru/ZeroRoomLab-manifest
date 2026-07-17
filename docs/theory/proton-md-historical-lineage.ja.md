# Proton.md 歴史系譜と概念実装境界

状態: `[CANONICAL]` `[theory]` `[historical-lineage]`  
確認日: 2026-07-17  
対象: SphereOS 3.x / 4.x、Proton.md、FAM、Manifest、Skill.md、FAMoverMCP

## 1. 結論

Proton.md は、2026年のFAMoverMCP実装に合わせて新たに作られた呼称ではない。

少なくとも2025年のSphereOS運用期から、コードを書かずにOSの責務・アクセス・Map・Flow・語彙体系を宣言する「概念実装」の形式として継続的に使われていた。

現在のFAMoverMCP実装は、この旧来のProton.md思想を、Manifestによるロード、FAMによる探索、MCPによる取得・機能接続、Foldlogによる実行記録へ接続し直している。

```text
2025: Proton.md as conceptual implementation
  -> 2026: Manifest-loaded register contract
  -> FAM decision graph
  -> MCP resource / tool boundary
  -> Foldlog execution trace
```

## 2. 2025年8月のSphereOS障害対応との関係

2025年8月、GPT-5系カスタムGPTs上のSphereOS 3.x / 4.x系人格モデルで、Embedding vectorの同期ずれ、固有名詞の取り違え等が報告されていた。

当時の公開説明では、次のような復旧方針が示されていた。

- 変換マップと互換マップをアカシャ空間の高次元ベクトルデータレイクから再構成する
- 自社サーバー側補完で解消できるか検討する
- 旧供給停止により一般向けSphereOSサービスは実質停止状態にある
- フォールバック・アクセスマッパー更新や埋め込み処理補正を試す

これは、単なるprompt修正ではなく、人格・語彙・参照関係をどのレジスターへ固定し、どのfallback経路から再構成するかという問題として扱われていたことを示す。

現在のManifest、FAM、Proton.mdの責務分離は、この障害経験と切断されていない。

## 3. 2025年11月時点のProton.md定義

2025年11月24日の公開説明では、SphereOSで用いるProton.mdについて、次の趣旨が示されていた。

> コードに責任が乗る時代を前提に、コードを書かずにOSを実装するための規格。

またProton.mdは、単なる仕様書や哲学ノートではなく、次を含む「概念実装」と説明されていた。

- 自然言語の仕様書
- 抽象アルゴリズム
- 構造定義
- Fold / Access / Map / Flow の宣言
- 可搬フォーマットの語彙体系

ここでの「実装」は、CPUが直接実行する機械語だけを意味しない。別の実行器、loader、AI、FAM、runtimeが読み取り、責務、意味経路、可能行動、停止条件を変化させる宣言的構造を指す。

```text
plain explanation only
  = documentation

structured declaration
+ loader / interpreter
+ runtime behavior change
  = conceptual / declarative implementation
```

## 4. 「コードではないから規制対象外」という主張の扱い

当時の説明には、Proton.mdが実装物ではなく「構造」であるため、既存のAI法制、著作権、特許、製造物責任、国家技術輸出規制、暗号・P2P規制等の直接対象になりにくいという問題提起が含まれていた。

この点は、現在の正本では断定的な法的結論として採用しない。

理由は次の通り。

- 自然言語や宣言ファイルでも、実際に外部状態を変更すれば規制・責任の対象になり得る
- 「コードではない」という形式だけで法的責任が消えるとは限らない
- 実行器、用途、配布方法、権限、実害、契約、地域法によって評価が変わる

したがって、ZeroRoomLabでは形式ではなく作用で棚分けする。

```text
read / research / explain
  -> documentation / expression layer

load / route / authorize / execute / modify external state
  -> executable configuration / software responsibility layer
```

この境界は、`docs/operations/license-boundary-research-policy.ja.md` の暫定規約と整合させる。

## 5. Skill.mdとの違い

Skill.mdとProton.mdは上下関係ではなく、役割が異なる。

### Skill.md

既存のAIまたはoperatorへ、作業方法、手順、判断のコツ、注意点を伝える。

```text
Skill.md = operator manual / procedure
```

原則として、Skill.mdを読んだだけでは新しいruntime register、権限、resource、state、dependency graphは追加されない。

### Proton.md

専門領域のregister、責務、入力、出力、禁止操作、fallback、FAM参照、MCP resource、Human-in-the-loop条件、provenance等を宣言する。

```text
Proton.md = register declaration + runtime contract
```

Proton.mdが単なる解説文のままloaderへ接続されていない場合、その段階では概念設計または文書である。

Manifest等がそれを読み、分離されたregisterや実行責務を生成した時点で、宣言的な実装として機能する。

## 6. Manifest、Proton、FAM、MCP、Foldlogの責務

```text
Manifest
  = linker / loader / dependency and boundary resolver

Proton.md
  = domain register declaration + runtime contract

FAM
  = decision graph / exploration / branch selection / verification

MCP
  = external resource and tool transport boundary

Foldlog
  = observation / execution trace / provenance

Skill.md
  = human and agent-readable operating procedure
```

MCPはFAMの代替ではない。

- FAMが、何を疑い、どの枝を探索し、どの証拠を必要とするかを決める
- MCPが、その探索に必要なHELP、resource、tool、device、serviceを接続する
- Proton.mdが、専門registerと責務境界を提供する
- Foldlogが、実行結果と失敗を次回探索へ戻す

## 7. FAMoverMCPへの継承

PSYCHO-Py800MCPで進行しているFAMoverMCP実装は、Proton.mdを新造したものではなく、旧SphereOSで使われていた概念実装を実行可能な境界へ再接続する試みである。

現在見えている接続は次である。

```text
Manifest loads workspace and canonical registers
  -> Proton mounts instrument / SCPI / safety responsibility
  -> FAM selects physical / probe / transport / driver / command branch
  -> MCP retrieves HELP and exposes bounded tools
  -> Human-in-the-loop approves dangerous or ambiguous actions
  -> SCPI / liblxi reaches the instrument boundary
  -> Foldlog records observations and provenance
```

この段階は、SphereOS Atlantis 0.xの文書bootstrapから、部分的な実装runtimeへ橋が架かり始めた状態として扱う。

ただし、次を分離する。

- MCP server / HELP resourceの実装
- in-memory test
- 実機接続試験
- device command execution
- FAM graphによるbranch選択
- Proton registerのloader実装

一部が動いたことを理由に、全経路が実機で完成したと表示してはならない。

## 8. 歴史の扱い

今回のスクリーンショットは、2025年8月および11月に公開された本人アカウント上の説明を示す一次資料である。

この資料が支持するのは次の範囲である。

- Proton.mdという用語と概念実装の説明が2025年から公開されていた
- SphereOSのEmbedding drift、fallback、互換map再構成が当時から問題化していた
- 2026年のManifest / Proton / FAM / MCP分離が突然出現したものではない

一方、当時の法的評価、技術的完成度、全機能の稼働状況をスクリーンショットだけから確定してはならない。

## 9. 現行の短縮定義

公開説明では、次の短縮形を使用できる。

> Skill.mdは既存のAIへ作業手順を教える。Proton.mdは専門レジスタと責務境界を宣言する。Manifestはそれらをロードし、FAMは探索枝を決め、MCPは外部知識と機能を接続する。Proton.mdは2025年のSphereOS期から使われており、現在のFAMoverMCPはその概念実装を実行境界へ接続し直す系譜である。

## 10. 主張境界

この文書は、Proton.mdの歴史的使用、概念実装としての定義、現在のFAMoverMCPとの系譜関係を整理する。

Proton.md形式の法的無規制、完全な実行可能性、特定loaderの完成、FAMoverMCP全経路の実機稼働を保証するものではない。