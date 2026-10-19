# 商用電力切り離しとスニーカーグリッド0.1.x：生存・通信の縮小運転、研究設備は全面停止

初回報告：2026-10-15／構成・稼働状態の訂正：2026-10-19。既存リンクを保つためファイル名は維持する。

- Status: `FIELD REPORT / FIRST-PERSON OBSERVATION`
- Observation window: 2026-09-15 to 2026-10-15 (reported as one month)
- Site: ZeroRoomLab, rural Yamagata
- Trigger: unplanned loss of affordable commercial electricity due to cash constraints
- Configuration: **スニーカーグリッド0.1.x**。電動バイク用LiFePO4を自転車で運搬し、車両用電源を家庭向け縮小給電へ転用。既報の約 **980 Wh** は公称蓄電量であり、連続出力W・実効AC供給量・発電量Wh/dayではない。
- Source: operator's retrospective field report, 2026-10-15; configuration and current shutdown status corrected by the operator, 2026-10-19. Independent telemetry and complete load/time series not supplied.

## 2026-10-19訂正：現在のスニーカーグリッド電力

発電設備は**財布ペインで差し押さえられた後**であり、現在の給電を完成した自家発電型オフグリッド設備として記述するのは不正確だった。現状は、オフグリッド電力システムの急造初期版である**スニーカーグリッドシステム0.1.x**。

- 電動バイク「縄文エンジェル」用に用意していた**LiFePO4蓄電池**を転用する。
- ポリタンクのような容量単位で電気を持ち運び、**自転車で蓄電池を運搬**する。「ポリタンク」は可搬容量の比喩であり、容器の実装仕様ではない。
- プリウス／PHVの車両電源から家庭向け電力を取り出す発想にならい、車両用電源から**家庭電源を縮小して取り出す仕組みを急造**した。プリウス実車や市販V2H設備を導入したという意味ではない。
- 確保しているのは**生存用・通信用・ロビー活動用・NSFW動画配信用の縮小運転電力**。
- **研究設備は全面停止中**。X99・GPU等の研究計算環境は稼働していない。タブレット／スマートフォン経由の文書・GitHub作業が続くことと、研究設備の再稼働を区別する。

蓄電池は発電設備ではない。約980 Whは既報の公称蓄電量であり、1回の充電だけで1か月を賄ったという意味ではない。充電・補給先の詳細や運搬頻度は本報告では未記録で、エネルギーの補給・運搬と本人の労力に依存する。これは生存をつなぐ縮小運転の成立であり、研究用電力の復旧や資金問題の解消を意味しない。

## 結論 / Result

**生活と通信は継続した。現在はスニーカーグリッド0.1.xで生存・通信・ロビー・NSFW動画配信を縮小運転し、研究設備は全面停止している。**

これは計画的な停電耐久試験ではなく、資金不足によって発生した**非計画的な資源遮断の自然実験**。意図的に生活条件を危険にさらす再試験を勧めるものではない。

| Domain | Reported observation (30 days) | Claim boundary |
| --- | --- | --- |
| Life support / 日常生活 | 生存継続 | あらゆる季節・故障条件での自立性を保証しない |
| Water and bathing / 水・入浴 | 飲用水を確保し、入浴を継続 | 飲用水の継続的水質認証・試験結果を主張しない |
| Communications / 通信 | 接続を維持 | 通信費用・帯域・完全独立を意味しない |
| Lightweight expression / lobbying | ロビー活動・NSFW動画配信等に縮小運転電力を確保 | 文書・発信の継続を研究設備の再稼働と混同しない |
| Research equipment / 研究設備 | 全面停止。X99・GPU等の研究計算環境は稼働していない | 思考・文書・GitHub作業の継続と区別する |

## Falsifiable architecture finding

**電動バイク用LiFePO4の転用・自転車による蓄電池運搬・家庭向け縮小給電**で、生存・通信・ロビー・NSFW動画配信を維持する。研究設備は全面停止。約980 Whという公称蓄電量だけでは、この補給・運搬・負荷の構成を表現できない。

**Survival Independence != Productive Independence.**

物理インフラの所有だけでは、研究開発能力の可用性を担保できない。生活維持に成功しても、創造・探索・技術実装のスループットは別階層で停止し得る。これは `Life support is not civilization.` を現場運用の一側面から支持する実例である。

## 未測定・次の計測 / Evidence gaps

現時点で公開できる連続ログがないため、以下の閾値は未確定。

- 蓄電池の実効容量（Wh）、変換損失、充電・補給先、充電量（Wh/day）、自転車での運搬頻度と労力。現在の発電設備は差し押さえ後であり、自家発電量を仮定しない
- 瞬間出力上限（W）、DC/AC給電条件、負荷別の実消費（W, Wh）
- 生活・通信・編集・コンパイル・GPU/CPU・3DPそれぞれの稼働時間と停止理由
- 天候・季節・劣化・水系メンテナンスの影響、外部電力や外部サービスへの依存

次段では、通常の安全な運用範囲でload/energy ledgerを取り、`energy per reproducible experiment`、`sustained development hours/day`、`commits/benchmarks per day without household commercial-grid supply`などを比較する。Whだけから普遍的な研究可否を断定しない。

## Next resource gate / 実行可能条件

商用電力の利用可能性を回復する経路と、現在のスニーカーグリッド0.1.xから発電・充電・給電基盤を再構築して**Production / R&D Grid**へ拡張する経路は併存する。発電・充電、蓄電、出力、保護、配電、計測、機器の効率化は別の部材・責務。設備能力・安全条件・保守負債を公開できた範囲で記録する。

支援対象は「生存できる状態の証明」ではなく、**生存しながら技術アウトプットを継続できる電力容量・電力密度と、そのための安全な保守可能性の獲得**。資金、現物部材、計測、修理、現場技能、電力インフラ設計の協力が有効。既存の [資金と非独占的Steward方針](../../FUNDING.md) に従い、寄付が納期・研究成果・議決権を保証するわけではない。

関連: [Portable Civilization #47](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/47), [Infra-FIRE #48](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/48).
