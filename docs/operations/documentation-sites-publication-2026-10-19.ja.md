# 文書siteへの日英展開（2026-10-19）

著者: 齋藤みつるSaitooMituru-Fusamofu-ふさもふ  
日本語正本 / [en-US参照写本](documentation-sites-publication-2026-10-19.en-US.md)

Manifestは理論・運用・生Noteの原典を保持します。公開文書siteは読者に必要な解説を編集して持ち、componentの実装正本を所有しません。

| 公開解説のrepository | 日英組数 | 入口 | 本文commit |
| --- | ---: | --- | --- |
| [Fold（情報子工学・protocol）](https://github.com/HIPSTAR-IScompany/fold) | 10 | [日本語](https://github.com/HIPSTAR-IScompany/fold/blob/main/README.md) / [en-US](https://github.com/HIPSTAR-IScompany/fold/blob/main/README.en-US.md) | [source 021aa5d](https://github.com/HIPSTAR-IScompany/fold/commit/021aa5dd4e0b59f1b0cb1bf168fe69ca3663d455) |
| [SphereOS（SDK・開発制御面）](https://github.com/HIPSTAR-IScompany/sphereos) | 7 | [日本語](https://github.com/HIPSTAR-IScompany/sphereos/blob/main/README.md) / [en-US](https://github.com/HIPSTAR-IScompany/sphereos/blob/main/README.en-US.md) | [source 065020b](https://github.com/HIPSTAR-IScompany/sphereos/commit/065020ba369675caf5a120e7cc236e7a3af6b2d4) |
| [Quantaril（分散接続）](https://github.com/HIPSTAR-IScompany/quantaril) | 6 | [日本語](https://github.com/HIPSTAR-IScompany/quantaril/blob/main/README.md) / [en-US](https://github.com/HIPSTAR-IScompany/quantaril/blob/main/README.en-US.md) | [source 492aa63](https://github.com/HIPSTAR-IScompany/quantaril/commit/492aa63602540f6e197924aeedbcdf11e56a945e) |
| [World（世界観・実践）](https://github.com/HIPSTAR-IScompany/i-s-world) | 6 | [日本語](https://github.com/HIPSTAR-IScompany/i-s-world/blob/main/README.md) / [en-US](https://github.com/HIPSTAR-IScompany/i-s-world/blob/main/README.en-US.md) | [source fb7835f](https://github.com/HIPSTAR-IScompany/i-s-world/commit/fb7835fbb8b12ac615fbed069789b77a03ccabf8) |

今回の29組は、情報子、候補の束・動的関係、ABC証拠射程、FAM参照境界、SDK、P2P構想、World・実践の最初の編集batchです。日本語を正本とし、英語は直接作成した参照写本として対応を示しました。解釈競合は日本語へ戻し、英語を経由して日本語を上書きしません。実行Kernelは日本語のままで、英語解説を実行可能な同値物としません。

## 来歴と検証の境界

- 原典採用: Manifest `139cc619fcdd62f254074e655ad3fb04e190322d`、Atlantis `bd8c7a807d5f016eb244c9ffbf39a62cee5e2d65`（公開main）。
- Atlantisの同内容だったIssue受付枝は[系譜統合commit](https://github.com/saitoomituru/SphereOS-Atlantis/commit/8385b3b0e34f02f1adfc2a9733a40863c55eb507)でmainへ統合しました。treeは不変でありfuture枝は含めていません。
- 各siteの`sources/publication-batch-2026-10-19.json`が日英path、source path、exact SHAとlicense欄を保持します。
- 4siteとも本文とtoolchain・日英SEO・receipt修正後のCIが成功しました。各Actionsと既存build Issueにexact commitとartifact digestを記録します。
- [Q側の時系列報告](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/blob/main/docs/operations/migration/publication-2026-10-19.ja.md)と[v2全path台帳](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/blob/main/migration/content-ledger-v2.json)を参照してください。314件の原典所在と保存理由を記録し、権利・asset参照の未精査を残しています。
- GitHub上のsource反映、build、production deploy、DOI公開は別状態です。4siteのproduction・公開receiptは未確認です。旧Q domainを現役入口へ戻すものでもありません。

今回の作業ではMAGI sourceと三Positionを手動照合しました。Python resolverやlocal shellは実行していません。GitHub Actionsの実行結果だけを機械検証として扱い、過去OAEを後から生成しません。

## 時系列と残る判断

2026-08-31の[#20最終回答](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/issues/20#issuecomment-5479450957)により、SphereOSは`sphere.i-s.dev`、topの将来slugは`infinite-synthesis`に確定しています。top renameは4siteの公開確認後です。2026-10-19のUser指示により、編集・main反映・buildはproduction設定より先行します。

情報子工学の原典では定理の偶奇の誤記を出典付きで訂正しました。数学的な定理からFoldの3軸／Q／Last Orderへの適用が導けるか、隣接分野の引用が何を支持するかは[Manifest #42](https://github.com/saitoomituru/ZeroRoomLab-manifest/issues/42)へ残します。概念の開放性と、特定の定理の前提を満たすことを混同しません。

Qのdevにだけある用途未確認の画像は[#25](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/issues/25)、全資料の履歴抽出・asset・URL切替は[#26〜29](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/issues/26)、Environment／DNS／TLS／既存サイト退避は[#24](https://github.com/HIPSTAR-IScompany/quantaril_cloud_QAtlantis/issues/24)へ集約します。新規Issue・branchは作らず、Atlantis future枝を保持します。Zenodoのrelease・metadata・DOI発行は未完了です。

## 検証したmain

| repository | 検証commit | CI |
| --- | --- | --- |
| HIPSTAR-IScompany/fold | [cb26233](https://github.com/HIPSTAR-IScompany/fold/commit/cb26233d28b9085d5b6b45a6191564a3f191c720) | [成功](https://github.com/HIPSTAR-IScompany/fold/actions/runs/39251366067) |
| HIPSTAR-IScompany/sphereos | [4876f79](https://github.com/HIPSTAR-IScompany/sphereos/commit/4876f791865b5815121afa4cf8d984ed2463f80e) | [成功](https://github.com/HIPSTAR-IScompany/sphereos/actions/runs/39251374433) |
| HIPSTAR-IScompany/quantaril | [c21e062](https://github.com/HIPSTAR-IScompany/quantaril/commit/c21e0621d7bbef377a4deaeb24e595338419b132) | [成功](https://github.com/HIPSTAR-IScompany/quantaril/actions/runs/39251382452) |
| HIPSTAR-IScompany/i-s-world | [3f7bcf6](https://github.com/HIPSTAR-IScompany/i-s-world/commit/3f7bcf69773e267af075fb9ba2469488b7a2ec97) | [成功](https://github.com/HIPSTAR-IScompany/i-s-world/actions/runs/39251391168) |
