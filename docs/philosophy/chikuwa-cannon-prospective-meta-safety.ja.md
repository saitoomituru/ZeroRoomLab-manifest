# ちくわ砲 — 幻想化によるProspective Meta-Safety

状態: `[CANONICAL]` `[Layer B]`  
制定日: 2026-07-17  
対象: AI時代の測定、実験、産業GUI、組織的な安全資源配備

## 1. 上位命題

**安全は責任の押し付け先ではない。安全も工学であり、事故前に人、道具、時間、停止能力、復旧能力を
組み上げることで作る。**

AI時代のGUIは、起きた事故や現在進行中のincidentだけでなく、まだ実行していない作業のRiskとBenefitを
測定前に候補表示できる。この未来paneを、現在のwarningと同じ現実表示で描くと、projectionと事実が
混ざる。そこで未来側を意図的にアニメ、SF、ファンタジー、gaming metaphorへ倒す。

この幻想化による時間scope分離を、ZeroRoomLabでは**ちくわ砲**と呼ぶ。

## 2. 幻想だから軽いのではない

幻想化はriskを冗談にすることではない。gaming metaphorも現実を軽く見るためではなく、異なる種類の
情報を有限な人間へ直感的に届けるpresentation layerである。

- 幻想だから現実の危険が小さくなるわけではない
- 幻想だから現在進行中の課題、alarm、incidentが消えるわけではない
- 幻想paneはlive warning paneを覆わない、muteしない、置換しない
- 現実paneは幻想paneを「不真面目」として削除しない
- 二つは未来と今を別々に説明し、同じ現場へ並存する

幻想は現実逃避ではなく、**これはまだ未来projectionである**と身体的に分からせる型注釈である。

## 3. 三つの時間pane

| time scope | evidence state | presentation | 役割 |
|---|---|---|---|
| `LIVE` | `OBSERVED` | 枯れたwarning GUI | 現在の異常、停止、退避、incident対応 |
| `POST_RUN` | `OBSERVED / REPRODUCED` | 証拠・復旧GUI | 原ログ、部分成果物、復旧、再発防止 |
| `PROSPECTIVE` | `PROJECTED / INFERRED / UNKNOWN` | SF・アニメ・ファンタジー・gaming GUI | 未来のRisk／Benefit、必要人員・装備・時間の提示 |

同じ赤でも、`LIVE`の赤と`PROSPECTIVE`の赤は意味が違う。未来側には`測定前予告`、projection badge、
破線frame等を置き、現在事故のalarmと誤認させない。

## 4. ちくわ砲の機能

ちくわ砲は、未確定な未来へ明らかに幻想的な外皮を与え、現在事実とのcategory errorを防ぐ。

### 4.1 時間scopeの直感分離

文字を読まなくても、「これは現実のalarmではなく、これから踏む手順の未来走査だ」と分からせる。

### 4.2 注意の事前移動

事故が起きてから決裁者を呼ぶのでなく、RiskもBenefitも未確定な段階で現場へ注意を引き寄せる。

### 4.3 Risk Capacityの調達

黄なら追加確認員、赤なら停止権限と復旧対応能力を持つ体制を、実行前に要求する。金額査定を生成せず、
必要なrole、equipment category、effort、recovery readinessを提示する。

### 4.4 Benefitとの同時提示

危険だけを出すと「面倒ならやるな」へ倒れ、価値だけを出すと無謀な実行へ倒れる。未来paneはRiskと
Benefitを同じ強さで並べ、高Risk・高Benefitなら人員・装備・時間を足す会話へ変換する。

### 4.6 目的関数と資源安全率

未来paneは、RiskとBenefitだけでなく、原初の目的が各組織stageで矮小化されていないか、その目的を
安全に執行する資源余裕が残っているかを別軸で示す。神話があり資源がない状態を美談にせず、
やりがい搾取警報として扱う。詳細は
[神話的士気管理と目的関数矮小化連鎖](mythic-morale-and-purpose-attenuation.ja.md)を参照する。

### 4.5 anti-blame

係数、色、オーラは人間ではなく`operation_id + snapshot_id`へ付ける。個人別犯罪係数、顔の赤枠、
ランキング、賠償能力表示を作らない。赤は「エンジニアが責任を取れ」でなく「組織が停止・復旧能力を
配備せよ」を意味する。

## 5. 金勘定猫の本来role

金勘定側の仕事は、事故後に賠償主体を探すことだけではない。金と人と時間で塞げる事故を、実行前に
塞ぐためのresourceを調達・配備することでもある。

Prospective Meta-Safetyは、技術側が把握する「おっと香ばしい」を、決裁側が扱えるrole、equipment、
effort、schedule、quality、project optionへ翻訳する。ただし円、確率、損害額、ROI、企業価値は生成しない。

## 6. 幻想化の禁止事項

- live incidentをSF演出で隠す、弱める、muteする
- projectionを予知、確率、観測事実として表示する
- 高risk実行をrewardするpoint、badge、leaderboard
- countdown、FOMO等で承認を急がせるdark pattern
- 個人を赤く染め、責任や能力をscore化する
- themeから実機操作、承認、測定開始を直接行う
- 神話、使命、ロマンを賃金、人員、時間、設備、安全余裕の代用品にする

幻想は現場へ興味を持たせるが、現実のalarmより上位の権威を持たない。

## 7. Layer Aへの写像

本書はLayer Bの設計哲学である。実装済み機能や予測精度を主張しない。

Layer Aの設計契約はPSYCHO-Py800MCPの次を参照する。

- [Prospective Meta-Safety](https://github.com/saitoomituru/PSYCHO-Py800MCP/blob/main/docs/architecture/prospective-meta-safety.md)
- [産業ステータス核とSFメタGUI外皮](https://github.com/saitoomituru/PSYCHO-Py800MCP/blob/main/docs/architecture/industrial-sf-status-layer.md)
- [Risk × Benefit ガイダンス](https://github.com/saitoomituru/PSYCHO-Py800MCP/blob/main/docs/architecture/risk-benefit-guidance.ja.md)

実装側では`time_scope`、evidence state、RiskCapacityRequest、anti-blame schema、plain warningとSF themeの
非置換性を検証対象にする。

## 8. 主張境界

`[HYPOTHESIS]` alarm中心の運用では、表示が異常発生後の対応や責任線確認へ偏る場合がある。ちくわ砲は
その前段を補う哲学である。既存のすべての産業GUIが事後型、責任転嫁型であるとは主張しない。

本書は幻想化による時間scope分離と組織能力配備の哲学を正本化する。事故低減、資金調達、人員配備、
AI予測精度、規格適合、実機安全性の成立は、個別のLayer A証拠なしに主張しない。

## 9. 内観メモ

`[POEM]` ちくわの穴から未来を覗く。向こう側に見える火は、まだ燃えていない。だから軽いのではない。
燃える前に水と人を置ける、というだけだ。いま燃えている火は、ちくわの絵で隠さず非常灯で照らす。

### Machine-translation guardrail (en-US)

“Chikuwa Cannon” is a presentation-layer philosophy for separating prospective projections from live
conditions through an unmistakably fantastical visual register. Fantasy does not trivialize, hide, or
replace a real-time alarm. It marks uncertain future risk and benefit so organizations can allocate people,
equipment, time, stop authority, and recovery capability before measurement. The metaphor never assigns
personal blame or grants instrument authority.
