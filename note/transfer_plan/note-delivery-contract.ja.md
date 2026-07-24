# Noteから公開先へのデータ配信契約

状態: `[DRAFT]` `[OPERATIONS CANDIDATE]`  
作成日: 2026-07-24

## 目的

生Noteを公開仕様へ自動昇格せず、観測、仮説、ポエム、unknownを失わずに、対象repositoryの文脈へ
配信する。

```text
note source
  -> transfer candidate
  -> target AGENTS / authority / license check
  -> target-native adaptation
  -> target validation
  -> commit / PR / Issue
  -> foldlog delivery receipt
```

## 配信単位

各転送票は次を持つ。

- source note pathとrevision
- 転送するsection／claim
- `[FACT]`／`[INTERPRETATION]`／`[HYPOTHESIS]`／`[POEM]`／`[UNKNOWN]`
- target repository、path、locale、license
- target側AGENTSと制定authority
- 原典からの意訳・圧縮・欠落差分
- validation
- commit／PR／Issue
- 未転送範囲

## 禁止

- Note全文を対象repositoryへ無差別copyしない
- `[DRAFT]`を`CANONICAL`へ自動昇格しない
- 日本語原典の物語、信仰、参加要請をen-USで黙って削らない
- targetのruntime、authority、licenseをManifest membershipから推定しない
- 転送成功をmerge、deploy、第三者受領と同一視しない

## 既知不具合の解決log

構文、path、既知依存、fixture、再現済みmachine errorを自動修復した場合は、対象commitとtestを
`foldlog/`へ残す。

logic、信念、architecture、license、権限の制定判断が必要な場合は転送を止め、
source差分を`foldlog/`へ記録し、対象repositoryのIssueへ返す。

## en-US

en-USは日本語原典の要約置場ではなく外部GUIである。全Noteの一対一翻訳を必須にしないが、
入口、Help、参加、試用、責務、重要な公開claimはcoverage registerで欠落を追跡する。
