# AGENTS.md — foldlog

このディレクトリーは、ZeroRoomLab-manifest固有のMAGI監査結果と実行receiptを保持します。

## 明示include

監査を開始するときだけ、次を明示的に読みます。repository全体の暗黙scanは行いません。

1. repository rootの`AGENTS.md`
2. `/Users/saitoumitsuru/スフィア.code-workspace`または公開workspace記述から解決した
   `SphereOS-Atlantis`
3. Atlantisの`AGENTS.md`
4. Atlantisの`magi/*/bundle.json`を列挙し、採用版の`canonical_coordinate`、lineage、status
5. 採用版の`source-map.json`と三Position Skill
6. 対象変更に必要なManifest文書
7. Manifestが明示したZeroRoomLab固有asset

folder名の文字列比較だけで「最新版」を決めません。bundleの座標、lineage、statusを読み、
実装済みsurfaceと未実装runtimeを分けます。現在のMAGI resolverがprofile指定を提供する場合だけ
ZeroRoomLab profileを指定し、提供しない版へ未実装optionを捏造しません。

## 出力

- filename: `YYYYMMDD-HHMM__短い題名.ja.md`
- source revisionと観測時刻を必須にする
- Maxwell、Uriel、Raphaelを別節にし、多数決で一つへ丸めない
- ちくわ砲等のPresentation支援を第四票へしない
- `[FACT]`、`[INTERPRETATION]`、`[FIX]`、`[UNKNOWN]`、`[SEMANTIC-STOP]`を分離する
- 自動修復した既知不具合はcommandと検証結果を残す
- 判断が必要なlogic／信念／architecture conflictは修復せず、Issue参照を残す

## 責務境界

- MAGI core、Position Skill、resolver、validator、test: `SphereOS-Atlantis`
- ZeroRoomLab一般規約、公開主張、翻訳方針: repository root／`docs/`
- ZeroRoomLab固有Role／Flavor／Presentation: `assets/`
- 監査・実行Provenance: `foldlog/`
- 未採用の未来仕様: `note/`

`foldlog/`をMAGI runtime、daemon、FAMLog／OAE永続化の実装と呼びません。
