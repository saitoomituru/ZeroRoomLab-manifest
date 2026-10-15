# 30日間の商用電力切り離し: 生存は継続、研究開発は電力不足 (2026-10-15)

- Status: `FIELD REPORT / FIRST-PERSON OBSERVATION`
- Observation window: 2026-09-15 to 2026-10-15 (reported as one month)
- Site: ZeroRoomLab, rural Yamagata
- Trigger: unplanned loss of affordable commercial electricity due to cash constraints
- Configuration: approximately **980 Wh** nominal off-grid storage system (user-reported). Nominal Wh is not continuous output W, available AC Wh, or generation Wh/day.
- Source: operator's retrospective field report, 2026-10-15. Independent telemetry and complete load/time series not supplied.

## 結論 / Result

**生活と通信は継続した。しかし、同じ電力構成では研究開発の通常負荷を維持できなかった。**

これは計画的な停電耐久試験ではなく、資金不足によって発生した**非計画的な資源遮断の自然実験**。意図的に生活条件を危険にさらす再試験を勧めるものではない。

| Domain | Reported observation (30 days) | Claim boundary |
| --- | --- | --- |
| Life support / 日常生活 | 生存継続 | あらゆる季節・故障条件での自立性を保証しない |
| Water and bathing / 水・入浴 | 飲用水を確保し、入浴を継続 | 飲用水の継続的水質認証・試験結果を主張しない |
| Communications / 通信 | 接続を維持 | 通信費用・帯域・完全独立を意味しない |
| Lightweight expression | 動画、広報・マーケティング、アカペラ、ダンス等のアウトプット可能 | 軽量な活動と高負荷技術開発を混同しない |
| High-load R&D | 通常の研究開発・計算資源を継続運用できず、技術実装の前進が制約された | 全ての思考・文書・小規模コミットが停止したわけではない |

## Falsifiable architecture finding

```text
off-grid reserve (~980 Wh nominal)
  ├─ survival / water / bathing / communications: continued
  ├─ light media / outreach: continued
  └─ high-load compute / experimentation / fabrication: resource-gated
```

**Survival Independence != Productive Independence.**

物理インフラの所有だけでは、研究開発能力の可用性を担保できない。生活維持に成功しても、創造・探索・技術実装のスループットは別階層で停止し得る。これは `Life support is not civilization.` を現場運用の一側面から支持する実例である。

## 未測定・次の計測 / Evidence gaps

現時点で公開できる連続ログがないため、以下の閾値は未確定。

- 蓄電池の実効容量（Wh）、変換損失、充電源と発電量（Wh/day）
- 瞬間出力上限（W）、DC/AC給電条件、負荷別の実消費（W, Wh）
- 生活・通信・編集・コンパイル・GPU/CPU・3DPそれぞれの稼働時間と停止理由
- 天候・季節・劣化・水系メンテナンスの影響、外部電力や外部サービスへの依存

次段では、通常の安全な運用範囲でload/energy ledgerを取り、`energy per reproducible experiment`、`sustained development hours/day`、`commits/benchmarks per external-grid-free day`などを比較する。Whだけから普遍的な研究可否を断定しない。

## Next resource gate / 実行可能条件

商用電力の利用可能性を回復する経路と、オフグリッド電源を**Production / R&D Grid**へ増強する経路は併存する。発電・充電、蓄電、出力、保護、配電、計測、機器の効率化は別の部材・責務。設備能力・安全条件・保守負債を公開できた範囲で記録する。

支援対象は「生存できる状態の証明」ではなく、**生存しながら技術アウトプットを継続できる電力容量・電力密度と、そのための安全な保守可能性の獲得**。資金、現物部材、計測、修理、現場技能、電力インフラ設計の協力が有効。既存の [資金と非独占的Steward方針](../../FUNDING.md) に従い、寄付が納期・研究成果・議決権を保証するわけではない。

関連: [Portable Civilization #47](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/47), [Infra-FIRE #48](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/48).
