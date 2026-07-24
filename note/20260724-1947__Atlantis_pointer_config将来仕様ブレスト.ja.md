# Atlantis pointer config将来仕様ブレスト

状態: `[DRAFT]` `[HYPOTHESIS]` `[FUTURE SPEC]` `[NOT IMPLEMENTED]`\
作成日: 2026-07-24\
対象: `Atlantis.json`、`ASTRO.json`、個人fold-vector `config.json`

## 内観メモ／ポエム

Manifestやrepositoryが増えれば、毎回長いpath listをAGENTS.mdへ書くより、World、Role、Flavor、
MAGI profile、foldlog destinationをpointerとして束ねたくなる。

しかし、いまpointer loaderを先に生やすと、まだ固まっていないauthority、priority、merge、
license、remote fetchの判断をJSONの見た目で採用済みにしてしまう。

## 現在採用する運用

[FACT] 現段階は、README／AGENTS.md／task promptから必要sourceを明示的に読む。

[FACT] Atlantis MAGI 0.2.1のcore/profile分離では、profile指定とrepository rootをcallerが明示する。

[FACT] Manifest固有assetは`assets/`へ置くが、repository scan、auto-mount、hot reloadは実装しない。

## 将来候補

```text
Atlantis.json
  system profile / MAGI core / resolver pointer

ASTRO.json
  role / entity / presentation / world binding pointer

personal fold-vector config.json
  individual fold preferences / local-only context pointer
```

名称、拡張子、schema、authorityは未採用である。`Atlantis.josn`等の過去表記揺れもSource Eventとして
残し、正式化時にsilent correctionしない。

## 未解決

- pointerのcanonical owner
- relative path、repository URL、content hashの優先順位
- offline／local-only／public sourceの分離
- asset競合時のpriorityとSemantic Stop
- third-party license／provenance
- 個人fold-vectorの秘密・医療・信仰情報境界
- signature、revision、migration
- FAM形式へ移行する時期

## 禁止する先回り

- pointer fileがあるだけでremoteを自動取得しない
- assetを自動的に安全・公式・互換と判定しない
- Flavorから権限や課金を生成しない
- personal configを公開repositoryへbackfillしない
- loader未実装を「Atlantisがscanして合わせる」と現在形で表示しない

## 昇格条件

stable ID、旧新定義、authority、scope、security boundary、license、priority、negative fixture、
migration receiptが揃い、User Gateを通過した後に仕様候補へ移す。

判断先: SphereOS Atlantis
[#10 明示profileからpointer config／asset loaderへ進むUser Gate](https://github.com/saitoomituru/SphereOS-Atlantis/issues/10)
