# 2026-08-31 さくら不正アクセス事案に伴う旧ODM／hosted成果物への公開通知

状態: `[INCIDENT-NOTICE]` `[CONFIRMED-IN-SCOPE / ACTUAL-COMPROMISE-UNKNOWN]`

作成日: 2026-08-31

関連追跡:
- Q Atlantis Issue #16: https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/issues/16
- さくらインターネット公式FAQ: https://help.sakura.ad.jp/unauth-access-faq/
- 2026-08-31 サーバーパスワード変更案内: https://help.sakura.ad.jp/notification/n-2692/

## 1. この通知の目的

2026年8月にさくらインターネットが公表した、レンタルサーバ環境および販売管理システムへの不正アクセス事案について、ZeroRoomLab / 旧 infinite synthesis / HIP STAR 系で過去にODM的に開発・構築し、第三者が現在もホストまたは運用している成果物にも影響可能性があるため、公開の確認窓口を置く。

これは「過去案件が侵害された」と断定する通知ではない。

**provider incident の影響範囲へ入る条件と、実際の account compromise を分離して確認するための通知**である。

## 2. 現時点で確認できたこと

maintainer は、さくらインターネットから販売管理システム上の「影響を受けた可能性がある対象」に含まれる旨の個別本人通知を受領した。

また、Q Atlantis の Sakura Matchbox 系で利用していたサーバーパスワードについて、**2026-08-17以前に会員メニューから再発行したもの**であることを確認した。この条件は、さくらインターネットが2026-08-31に公表したサーバーパスワード変更対象条件と一致する。

そのため現在の判定は次の通りとする。

```text
sales-management-system exposure scope:
  CONFIRMED IN SCOPE

server-password credential scope:
  CONFIRMED SCOPE MATCH

actual production/account compromise:
  UNKNOWN / NOT YET CONFIRMED
```

公開文書には会員ID、住所、電話番号、メールアドレス、サービス識別子、passwordその他のcredentialを掲載しない。原本通知は非公開evidenceとして保全する。

## 3. まだ確定していないこと

現時点で次を確定事実として扱わない。

- 個別のレンタルサーバアカウントへ第三者が実際にログインしたか
- `www`、home、mail、config、backup等を実際に閲覧・取得したか
- ファイル改ざん、未知ファイル追加、マルウェア設置があったか
- 対象passwordが第三者に実際に取得・利用されたか
- 外部API、DB、旧store、別providerへ二次侵害したか
- データが外部へ持ち出されたか

`CONFIRMED IN SCOPE` は `COMPROMISED` と同義ではない。

## 4. 過去ODM／hosted成果物で確認してほしい条件

過去にZeroRoomLab / infinite synthesis / HIP STAR等へ開発・構築を依頼し、その成果物を現在も運用しているoperatorは、次のいずれかに該当する場合、今回の確認対象になり得る。

- さくらのレンタルサーバまたはVPSを利用していた／利用している
- 2026-08-17以前に会員メニューから発行・再発行したサーバーパスワードを使っていた
- 旧案件と別案件の間でSSH key、API key、DB credential、暗号鍵、recovery token等を再利用した可能性がある
- backup、archive、migration residue、古い`.env`、設定ファイル等がさくら側ホストへ残っている
- 当時のWeb、mail、DB、cron、FTP/SFTP/SSH運用経路が現在も生きている

該当しても侵害確定ではない。まず契約・credential provenance・login history・remote treeを確認する。

## 5. 最低限の切り分け

可能なら、削除・再配置より先に現状を保存する。

1. さくらから届いた本件関連通知を確認する。
2. 対象契約のサーバーパスワードが「いつ」「どの画面／経路から」発行または再発行されたか確認する。
3. サーバーログイン履歴に心当たりのない接続がないか確認する。
4. home以下のfile list、mtime、size、hashを可能な範囲で採取する。
5. `.ssh/authorized_keys`、cron、`.htaccess`、PHP/CGI、dotfile、backup、archive、mail/configを確認する。
6. 当時の成果物から外部サービスへ到達できるcredentialが残っていないかinventory化する。
7. 不明点が残る場合は、対象契約を特定できる情報をpublic repositoryへ出さず、さくらインターネットへ個別照会する。

## 6. 贈与経済と保守責任の境界

ZeroRoomLabの既定はgift commons / non-exclusiveであり、今回の公開通知、既知情報の共有、最低限の影響切り分けについて、**過去のODM／贈与的な開発先へ本件を理由とした遡及請求を行わない**。

一方で、贈与は「上流maintainerが無期限・無条件で全downstreamの保守、監視、復旧、migrationを無料で引き受け続ける」という意味ではない。

既存成果物を継続運用するoperatorには、少なくとも次の選択肢がある。

```text
self-maintain
  自身で更新・監視・credential rotationを行う

contribute-back
  調査結果、修正、資源、検証時間、host費、hardware等をcommonsへ戻す

request-maintenance
  upstreamへ具体的な保守を依頼し、scope・優先度・資源負担を改めて合意する

retire / migrate
  維持できない旧成果物を停止・移行する
```

**利用だけを継続し、保守負担を恒常的にupstreamへ片寄せするfree rideをZeroRoomLabの既定契約とはしない。**

金銭だけが貢献ではない。ログ提供、検証、再現条件、修正PR、host資源、物資、レビュー等もSupplyになり得る。ただし、どの形の協力も個人情報、credential、第三者の秘密をpublicへ出すことを要求しない。

## 7. Evidenceとプライバシー

公開側に必要なのは判定根拠であって、本人確認情報そのものではない。

- 会員ID、住所、電話、メール、サービスコード、credentialは公開しない
- 原本メールやprovider responseは非公開保全する
- 公開する場合はredacted copyを用い、必要なら原本hashを別管理する
- 不審IP、domain、account等を見つけても、公開情報だけで攻撃主体を断定しない
- 第三者案件の名前、顧客情報、NDA対象情報を勝手に公開しない

## 8. 次回更新

さくらインターネットは調査継続中であり、新しい対象条件、侵入期間、IOC、個別対応等が公表された場合、この通知または関連Issueを更新する。

本書は2026-08-31時点の公開情報とmaintainerが受領した個別通知から切れる範囲だけを記録したincident receiptである。