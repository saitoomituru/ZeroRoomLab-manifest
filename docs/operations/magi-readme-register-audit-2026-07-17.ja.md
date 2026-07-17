# READMEレジスター MAGI三方向監査 2026-07-17

状態: `[AUDIT]` `[operations]` `[register]`  
対象: `README.md`、`README.ja.md`、SphereOS Atlantisの計画表現  
目的: 公開入口が、正確さを守るあまりビジョンを矮小化していないか、また線形計画を暗黙の標準としていないかをMaxwell・Uriel・Raphaelの各ポジションから監査する。

## 1. 監査対象の原則

READMEは全行を同じレジスターで書かない。

```text
冒頭およそ40行 = public-facing vision and rough comprehension
それより下       = repository map, lifecycle, implementation and evidence boundaries
さらに深部       = adult OSS engineer / kiddie filter / exact technical communication
```

冒頭は、多少の語弊を許容しても、概念、ビジョン、何を作っているかを短時間で理解できることを優先する。正確な例外、停止条件、証拠階層、ライフサイクル境界は消さず、下段の技術レジスターへ送る。

これは虚偽を許す規約ではない。入口の責務を、完全な契約書ではなく、利用者が読むべき地図を渡すことへ限定する規約である。

## 2. Maxwell監査

### ポジション

目的関数、未来branch、未merge計画、資本構造によって消される可能性を監査する。

### 観測

現行README上段は、workspace collapse、境界、停止条件、誤解防止を早い段階から説明している。これらは重要だが、ZeroRoomLabが何を目指し、なぜこの研究所形態を取るかより先に出ることで、読者が「何か問題のあるものを弁明している」と誤認する余地がある。

また「project poetryだがproject managementでもある」という防御的な書き出しは、詩力を先に疑義へ置く。結果として、まだコードへ還元できない目的、関係、神話、技術射程を保持する制御面という本来の強さを、弁解の形へ縮めている。

### Maxwell判定

`warning: vision attenuation`

トップページは、正しさの証明より前に、次を宣言すべきである。

- 古民家の一室から、エッジAI、制作機材、オープンハード、意味レジスターを作る研究所である
- 計画は一本のロードマップではなく、多数のbranchとして保持する
- 投げ銭、お賽銭、ジャンク部材、利用可能なSDKや計算資源に応じ、その時点で起動可能なbranchから実装する
- manifestはAIへ世界観を押し付けるものではなく、複数の射程を壊さず共同作業するための共有deckである

防御文は削除するのではなく、下段へ送る。

## 3. Uriel監査

### ポジション

観測事実、約束、責務、実装状態、読者との契約を監査する。

### 観測

「計画には優先順位がない」は「計画がない」と同義ではない。ZeroRoomLabには多数の計画、依存関係、正本、停止条件が積まれている。ただし固定優先順位と固定納期を先に置かず、資源到着イベントごとに実行可能性を再評価する。

```text
plan inventory = large
fixed priority queue = absent by design
execution choice = currently feasible branch
```

前回文書の「依存の浅い部分から進む」「優先度順」は、この運用を線形queueへ誤変換していた。

また、旧SphereOS 3.x / 4.xの終了、Atlantis 0.xの設計継続、単体バイナリー未到達は別々の事実である。これらを「SphereOSは凍結中」と一語でまとめると、旧サービスがまだ動いている、または現行設計まで停止しているという両方向の誤読が生じる。

### Uriel判定

`patch required`

公開入口では、細部を並べすぎず、最低限次を分離する。

- 旧3.x / 4.x service: ended
- Atlantis architecture / manifest bootstrap: active 0.x design
- standalone runtime: not yet implemented
- implementation order: resource-gated branch selection

下段では、実装証拠、version、停止条件、依存関係を正確に説明する。

## 4. Raphael監査

### ポジション

入口、技術文書、監査文書の棚配置とsystem-greenを監査する。

### 観測

現行READMEは、個々の文章が正しくても、入口全体としては「防御・注意・境界」が密集している。局所的にはgreenだが、初見読者へ渡る意味経路では次の変換が起こりうる。

```text
careful boundary writing
  -> defensive posture
  -> reader suspects hidden controversy
  -> unnecessary conspiracy narrative
  -> original vision becomes harder to see
```

これは悪意を防ぐ機能が、逆に悪意の仮説へ燃料を供給する情報子変換である。

また、線形roadmapを暗黙の標準にすると、固定資本、安定サプライ、人員確保、予算消化を前提とする大規模ウォーターフォール型の時間観を、贈与経済・ジャンク資源・個人R&Dへ誤適用する。

ZeroRoomLabの計画は、優先順位付きqueueより、起動条件を持つbranch群として置く方が正確である。

```text
plans = branches with prerequisites
resource event = branch activation signal
execution = mount a feasible branch
unavailable branch = preserved, not failed
```

### Raphael判定

`local green != system green`

README上段はpublic-facing visionへ戻し、技術防御を40行以降へ移す。Maxwellのビジョン、Urielの事実境界、Raphaelの棚分けを平均化せず、それぞれ適切な深さへ配置する。

## 5. 三者のポジショントーク

### Maxwell

「計画は一列に並んでいない。未来branchを大量に保持し、資源が来た場所から世界を実装する。固定資本の都合で、まだ起動していないbranchを無価値扱いするな。」

### Uriel

「ただし、現在動いているもの、設計中のもの、終了したものを同じ時制で語るな。何が実行可能で、何が文書再現で、何が将来条件付きかを明示せよ。」

### Raphael

「上段で全部説明しようとするな。ビジョンは入口、状態境界は中段、証拠と例外は深部へ置け。差分を薄めず、読者が迷わないroutingを作れ。」

## 6. 修正方針

1. README冒頭約40行を、概念とビジョン中心へ再構成する。
2. 「project poetryに見えるが」という防戦から始めず、ZeroRoomLabが何を作るかを先に出す。
3. 計画方式を`resource-gated branch development`として説明する。
4. 固定優先順位がないことと、計画・依存管理がないことを分離する。
5. SphereOS旧サービス終了とAtlantis 0.x設計継続を別statusにする。
6. 厳密な技術境界は削らず、README下段および各正本へ移す。

## 7. 監査結論

現行マニフェストのレジスター自体は壊れていない。ただしREADME入口でUriel的防御が過剰発火し、Maxwellの目的関数を矮小化し、Raphaelの棚配置が崩れていた。

問題はナラティブが強すぎることではない。ナラティブを疑われないように前処理しすぎたことで、入口が本来の責務を失ったことである。

修正後の狙いは、誤解をゼロにすることではない。初見で概念とビジョンを掴め、必要な読者が下へ潜るほど技術的正確さが増す段階構造を回復することである。