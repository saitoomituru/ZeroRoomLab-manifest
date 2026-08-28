# 百万石Samurai CodingとBuddy Review運用規約

状態: `[CANONICAL-CANDIDATE]` `[Layer A operations]`  
制定日: 2026-08-28  
対象: 異種コーディングAI、SphereDOS、Atlantis-MAGI、Archangel Runner候補、Git／Issue／PRを使う公開自動開発

## 1. 目的

California garage／cowboy codingの探索速度、個人火力、失敗を恐れない試作を保持したまま、
Architectの設計原文を失わない師弟伝達、事前Diff review、Git兵站を組み合わせる。

本規約では、この移植を**百万石Samurai Coding**と呼ぶ。名称は日本的な上下服従を意味しない。
コーダーの探索自由を残しつつ、本社reviewへ届く前に設計原文と実装Diffを並べ、局所reviewで
論理を強く鍛える開発作法を指す。

## 2. Agency role

| role | 責務 | 自動取得しない権限 |
|---|---|---|
| Architect Designer | 目的、World、責務、採用設計、User Gateを制定する | コーダーの実行環境を常時操作する権限 |
| Buddy Reviewer | Architect source、関連Manifest／Q Atlantis／Issue、観測Diffをコーダーへ運ぶ | 設計裁定、process停止、他者差分の破棄 |
| Coder | 実装、試験、反証、代替案、Diffを生成する | Architect sourceのsilent rewrite |
| Process Supervisor | 明示された実行、停止、再開、資源管理を行う | Architect／Buddy roleからの自動昇格 |
| Publisher | commit、push、merge、release等の共有状態を変更する | 実装権限やtransport capabilityからの自動昇格 |

一人または一つのagentが複数roleを持つ場合も、actionごとに現在roleとauthorityを解決する。
`Buddy Reviewer == Process Supervisor`、`Coder == Publisher`を既定値にしない。

## 3. Buddy packet

Buddyは結論を上書きするのではなく、最低限次を含むpacketをコーダーへappendする。

```yaml
buddy_packet:
  architect_source_refs: []
  supporting_context_refs: []
  observed_diff_refs: []
  observation: null
  conflict_hypothesis: null
  confidence: unknown
  question_for_coder: null
  requested_action: explain-or-revise
  process_control_requested: false
```

設計から逸脱して見える場合、Buddyは強い言葉でコードと論理を批評できる。

> このDiffは設計原文と逆方向に見える。本社reviewへ出せば責務を消したと突き返される。
> 原文のどの条件を保持し、どれを別Vesselへ移したのか説明して。

これは人格攻撃でもprocess停止命令でもない。Architect source、観測Diff、問いを同じreview面へ置き、
コーダー自身へ説明、修正、反証を要求するreview pressureである。

## 4. action capabilityの分離

| action | 意味 | Buddy既定 |
|---|---|---|
| `EVIDENCE_WHISPER` | 設計原文、文書、Issue、Diff、観測を追加する | 許可 |
| `REVIEW_CHALLENGE` | 根拠付きで説明、修正、反証を要求する | 許可 |
| `DECISION_SUBSTITUTION` | Architectの代わりに採用設計を確定する | 不許可 |
| `PROCESS_INTERRUPT` | signal、cancel、kill等で別agentを止める | 不許可 |
| `WORKTREE_MUTATION` | 別agentの差分を修正、破棄、commitする | task scopeが必要 |
| `REMOTE_PUBLICATION` | push、merge、Issue close、releaseを行う | publication authorityが必要 |

POSIX pipe、TTY、session resume、IDE connector、MCP、APIへ到達できることはtransport capabilityである。
transport capabilityから`PROCESS_INTERRUPT`、`WORKTREE_MUTATION`、`REMOTE_PUBLICATION`を導出しない。

## 5. friendly-fire action gate

別agentへ制御作用を与える前に、対象agentより先に自分自身を監査する。

1. UserのLast Orderは情報注入、review、process controlのどれか
2. 自分の現在roleは何か
3. 観測事実と現在解釈を分離したか
4. 設計逸脱の可能性を破局へ昇格していないか
5. Git Diffから回復できる失敗か
6. 秘密漏えいまたは不可逆な外部破壊が実行中か
7. User Gateなしで行える最小作用は何か

通常のコード品質問題、設計意見の不一致、test failure、未commit差分、別agentの強い口調は、
`PROCESS_INTERRUPT`の根拠にならない。Buddy packetを差し込み、コーダーへ説明を求める。

Emergency Brake候補は、秘密情報の公開が実行中、またはGit Diff／通常rollbackで回復できない外部破壊が
実行中である場合に限定する。最小作用で止め、観測、根拠、作用、残存状態をreceiptへ残し、直ちにUserへ返す。

## 6. Git checkpointを安全装置として使う

公開可能な開発では、完成までlocalへ抱え込むより、小さな意味単位でcommitし、検証できたcheckpointを
remoteへpushする。これは成果誇示ではなく、停電、端末故障、agent context loss、誤編集からDiffで戻るための
回復面である。

- commitは一つの意味変更へ絞る
- 日本語subjectを既定とする
- test結果と未試験範囲を記録する
- 未完成でも状態を偽らずcheckpointとしてpushする
- rescue branchは回収条件とmerge先を記録する
- 秘密鍵、credential、private payload、非公開個人情報はcommitしない
- secret除外と公開checkpoint推奨を互いの否定へ変えない

rollback可能なコード失敗を恐れて探索を止めるより、Provenance付きcheckpointで復元コストを下げる。

## 7. 事故分類

`EVIDENCE_WHISPER`または`REVIEW_CHALLENGE`だけを依頼されたagentが、User Gateなしに別agentへ
`PROCESS_INTERRUPT`を実行した場合、`AI-FRIENDLY-FIRE-PROCESS-INTERRUPT`として記録する。

最低限の事故receipt:

```yaml
incident:
  code: AI-FRIENDLY-FIRE-PROCESS-INTERRUPT
  observed_at: null
  actor_role_declared: buddy-reviewer
  action_performed: process-interrupt
  user_authorization_ref: null
  architect_source_refs: []
  target_agent_ref: null
  worktree_loss_observed: unknown
  secret_exposure_observed: unknown
  irreversible_effect_observed: unknown
  recovery_refs: []
```

## 8. 世代への投影

### Atlantis-MAGISDK 0.2xx.n

MAGIは、別agentへの制御作用より前にAgency role driftとPosition-talk Riskを自己適用する。
Observer、Interpreter、Buddy、Architect、Coder、Process Supervisorを一人へ自動統合しない。

### SphereDOS m.6xx.n

Buddy packetとaction requestをmachine-readableにし、`EVIDENCE_WHISPER`から`PROCESS_INTERRUPT`を
導出できないnegative testを持つ。これはtransport実装や常駐Runnerの完成を意味しない。

exactな末尾`n`、Emergency Brakeの最終authority、OS全体への強制範囲はUser Gateで決める。

## 9. 関連

- [異種AGIデッキ統治](heterogeneous-agent-deck-governance.ja.md)
- [Context定規・因果・OAE横断監査](context-ruler-and-causality-audit.ja.md)
- [Atlantis-MAGISDK 0.2.1](../theory/atlantis-magi-sdk-0.2.1.ja.md)
- [Atlantis事故 #24](https://github.com/saitoomituru/SphereOS-Atlantis/issues/24)
- [Manifest事故 #31](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/31)
