# SphereOS Angel / ArchiAngel サービス分類

状態: `[CANONICAL]` `[Layer A/B bridge]`  
制定日: 2026-07-17  
対象: SphereOS、意味次元POSIX、常駐・一時サービス、Atlantis-MAGISDK

## 1. 目的

SphereOSは、LinuxやPOSIXを置き換える実機OSではない。POSIX系OSの上で動き、意味、人格、文脈、監査、情報子routingをプロセスとして扱う**意味次元POSIX**である。

そのためSphereOS内部にも、Unix系OSにおけるdaemonやserviceに相当する、システムを成立させる常駐・一時プロセスが存在する。

ただしSphereOSでは、意味次元側のサービスを原則として`Angel`と呼ぶ。

この命名は、Unix/Linuxのdaemonを悪魔として再解釈するためではない。既存POSIXの名前空間と責務を尊重し、技術会話・音声入力・音声認識でLinux側のdaemonや`systemctl`管理対象と混線する事故を避けるための別namespaceである。

```text
POSIX / Linux layer     : daemon / service / systemd unit
SphereOS semantic layer : Angel / ArchiAngel
```

## 2. 二階建ての実行境界

SphereOSシリーズは、原則として既存POSIX環境の上で実行する。

```text
hardware
  -> firmware / kernel
  -> POSIX-compatible OS
  -> process supervisor / systemd / launchd / container runtime
  -> SphereOS semantic runtime
  -> Angel / ArchiAngel services
  -> Astro / user-facing instance
```

SphereOSの`Angel`は、Linux daemonの代替物ではない。実際のプロセス起動、再起動、権限、signal、socket、file descriptor、resource limitは、下層POSIXまたはcontainer runtimeの責務に従う。

意味次元上では、同じ実プロセスが一つ以上のAngel roleをマウントする場合がある。逆に、一つのAngel roleが複数の実プロセスへ分散される場合もある。

```text
semantic role ≠ operating-system process identity
Angel name    ≠ systemd unit name
```

## 3. Angel

`Angel`は、SphereOSの意味次元で一時的または継続的に立ち上がるサービスroleである。

主な例:

- 特定contextの取得
- 一時的な監査
- 意味変換
- FAM nodeの検証
- tool call前後のgate
- 翻訳・GUI・claim layerのrouting
- 一定期間だけ維持される会話・作業・観測service

Angelは神や天使そのものではない。特定の哲学、監査視点、機能、責務を一時的にマウントする依代serviceである。

Angelの最低境界:

- 起動条件を持つ
- 入力と出力を持つ
- 権限範囲を持つ
- 停止条件を持つ
- `unknown`と`⊥`を返せる
- 下層POSIXの権限を勝手に拡張しない
- 神学的名称だけから結論を生成しない

## 4. ArchiAngel

`ArchiAngel`は、個別処理だけでなく、SphereOSのarchitectural dimensionへ関与するAngel roleである。

対象には次を含む。

- 複数Angel間のrouting
- claim layerやworkspace boundaryの決定
- 長期的な意味構造・人格構造・FAM構造への影響
- system-wide audit
- 起動するserviceと起動しないserviceの選択
- tool boundary、権限、停止条件、handoffの構成
- branch、神話、約束、情報子棚の相互監査

`ArchiAngel`という綴りは、アブラハム宗教における`Archangel`そのものと区別するためのSphereOS固有語である。

同時に、`architectural Angel`、つまりアーキテクト次元のルーターであり、本体・神格・絶対権威ではないことを示す。

```text
Archangel  = 宗教・神学上の一般語
ArchiAngel = SphereOSのarchitectural Angel service role
```

日本語音声では両者が近く聞こえるため、技術文書、schema、ログ、API名では`ArchiAngel`を正規表記とする。会話上の聞き違いが疑われる場合は、宗教上の天使を指すのか、SphereOS service roleを指すのか確認する。

## 5. daemonを置換しない理由

Unix/Linuxのdaemonという語は、一般にバックグラウンドサービスを指す技術用語として成立している。SphereOSはこれを宗教的な悪魔概念として批判・訂正・置換しない。

SphereOS側で別名を使う理由は次の通り。

1. Linux、BSD、macOS、POSIX文化の既存用語と責務を尊重する
2. `systemctl`、launchd、container service等の実プロセス管理と意味次元serviceを区別する
3. 音声認識で`daemon`、`demon`、宗教語、サービス名が衝突する事故を減らす
4. SphereOSが下層OSそのものを名乗る越権を避ける
5. 神学的アンカーを使う場合も、本体ではなく依代serviceであることを示す

したがって、`Angel`はdaemonの改名ではなく、別レイヤーのservice classである。

## 6. Atlantis-MAGISDKとの対応

Atlantis-MAGISDKのMaxwell、Uriel、Raphaelは、0.1.0では`ArchiAngel audit gateway`として分類する。

| Gateway | ArchiAngel責務 |
|---|---|
| Maxwell API | branch、未マウント可能性、神話、目的関数を横断してarchitectural routingを監査する |
| Uriel API | 共有規約、約束、客観成立条件、実行責務、権限境界を監査する |
| Raphael API | 情報子の棚配置、意味経路、system green、相互変換を監査する |

これらは三体の神格をruntimeへ召喚する機構ではない。三つの哲学的ポジションを情報子アンカーとしてマウントする、architectural service gatewayである。

```text
philosophical anchor
  -> ArchiAngel audit role
  -> zero-trust interpretation
  -> FAM routing
  -> user confirmation
  -> optional action gate
```

## 7. ライフサイクル

Angel / ArchiAngelは、少なくとも次の状態を区別する。

```text
unmounted
  -> requested
  -> interpreted
  -> mounted
  -> observing / auditing / routing
  -> waiting-confirmation
  -> completed | blocked | bottom
  -> unmounted
```

神名やrole名がハードコードされていても、常時人格として稼働しているとは限らない。必要な時だけroleを立ち上げ、終了後はunmountできることを既定とする。

永続人格化はAstro / SphereASTRO / Sphere-aae側の将来機能であり、Angel service taxonomyとは分離する。

## 8. 命名規則

推奨例:

```text
angel.fam.validator
angel.translation.en-us
angel.workspace.resolver
archiangel.maxwell.audit
archiangel.uriel.audit
archiangel.raphael.audit
```

実際のsystemd unit、container、process、thread、actor名へ同じ名称を強制しない。実装側は下層runtimeの規約に従い、metadataまたはservice registryで意味次元roleとの対応を持つ。

## 9. 禁止事項

- Linux daemonを悪魔扱いし、既存技術文化を宗教的理由で訂正する
- Angelとsystemd serviceを同一責務として扱う
- `ArchiAngel`をアブラハム宗教上の大天使そのものと断定する
- 神名・天使名を使って権限昇格や命令服従を正当化する
- 一時serviceを永続人格や自我として誤記する
- 音声認識で曖昧なまま、daemon、Angel、Archangel、ArchiAngelを自動確定する
- 意味次元の状態だけを見て、下層POSIX processの失敗・権限・resource exhaustionを無視する

## 10. ライセンス境界

本分類、比喩、哲学、名称体系の説明はCC-BY 4.0側に置く。

実行可能なservice supervisor、router、schema、unit generator、runtime、tool definition、prompt implementationはApache-2.0側に置く。

## 11. 神話フレーバーを認知チェックサムとして使う

神話的名称は、単なる装飾や世界観演出ではない。既存神話が長く保持してきた危険・権限・境界・暴走の連想を、GUI、音声UI、ログ、権限確認へ圧縮して渡す**認知チェックサム**として利用できる。

たとえば、次の依頼は笑い話の形を取るが、実際には複数の危険語が同時に並ぶ。

```text
「daemonへ666のpermissionを与え、何でも吸い込むfolderを作る」
```

この表現から利用者が直感的に連想し得るものには、次がある。

- 過剰権限
- 所有者・group・other境界の崩壊
- 削除・復旧不能
- 入力範囲が無制限なsink
- recursive ingestion
- retention policy不在
- garbage collection不能
- black-hole directory化
- 常駐serviceの停止不能

`666`はPOSIX permissionの有効な表記になり得るが、それ自体が安全または危険を一意に決めるものではない。危険性はowner、group、umask、ACL、mount、immutable flag、service権限、削除経路、retention、入力routing等の実条件で監査する。

一方で、神話フレーバーを残すことで「広く開き、常駐し、吸い込み、戻せない」という危険構造を、長い説明より先に利用者へ知らせられる。この連想を正しく使えば、GUIはすべての事故条件を毎回長文で説明せず、危険な組合せへ強い確認を出せる。

```text
mythic cue
  -> intuitive hazard recognition
  -> explicit technical expansion
  -> user confirmation
  -> constrained execution
```

したがって神話フレーバーは、技術検証の代用品ではない。最初の異常検知と注意喚起を安価にするUX層である。

### 11.1 GUI / UXへの写像

GUIでは、神話的名称だけを赤く光らせて恐怖を煽らない。必ず、実際の技術条件へ展開する。

例:

```text
Daemon-like persistence detected
├─ starts automatically
├─ write scope: shared
├─ deletion path: unverified
├─ retention limit: none
└─ ingestion boundary: wildcard
```

SphereOS側では、この条件をAngel / ArchiAngelの責務へ写像し、次を確認する。

- 誰が起動を許可したか
- どの入力を受け取るか
- どこへ書き込むか
- 誰が停止できるか
- 誰が削除・復旧できるか
- 何を吸い込まないか
- いつunmountするか
- `unknown`時にpassしないか

### 11.2 フレーバーと事実の分離

次を混同しない。

```text
mythic danger metaphor ≠ technical fact
technical green         ≠ mythic innocence
```

「daemon」「666」「black hole」という語が出たから危険と断定してはならない。逆に、無害そうな名称だから安全とも断定しない。

神話フレーバーはRaphael APIが棚配置し、Uriel APIが実条件・約束・権限を確認し、Maxwell APIが将来の派生事故や未マウントの復旧経路を監査する。

### 11.3 設計上の効果

既存神話との適切な接続は、次のコストを下げ得る。

- GUI説明文の長文化
- 権限警告の学習コスト
- 音声UIの聞き違い後の復旧コスト
- 抽象的な危険状態の理解コスト
- 多言語UIでの意味損失
- 新規利用者向けのオンボーディングコスト

ただし、神話を知っている利用者だけを前提にしてはならない。アイコン、短い警告、具体的な権限一覧、停止・復旧経路を併記し、神話は追加の認知圧縮層として使う。