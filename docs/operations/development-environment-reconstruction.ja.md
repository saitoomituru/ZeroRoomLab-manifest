# ZeroRoomLab公開開発環境 再構築手順

状態: `[CANONICAL]`  
制定日: 2026-07-17  
対象: 新しい開発端末、人間の協力者、コーディングAI、AGIオーケストレーター

## 1. この手順書の役割

ZeroRoomLab-manifestは思想・公開仕様の集積だけでなく、公開OSSリポジトリを集め、正しい疎結合境界でVS Codeワークスペースを再構築するためのブートストラップでもある。

この手順はソースと文書の参照集合を再現する。ハードウェア、SDK、秘密鍵、企業データ、ローカル専用資料まで自動復元するものではない。

## 2. 先に読むもの

1. ルートの`AGENTS.md`
2. [workspace-boundary-register.ja.md](workspace-boundary-register.ja.md)
3. [workspace-registry.json](workspace-registry.json)
4. 選択したワークスペースに含まれる各リポジトリの`AGENTS.md`

## 3. 再構築の原則

- ワークスペース単位で親ディレクトリを分ける必要はないが、`.code-workspace`の参照集合は混ぜない。
- clone先の絶対パスは端末ごとに決める。レジスタは絶対パスを強制しない。
- descriptorを現行構成と同じ表示順で復元する場合は、レジスタの`descriptor_member_order`に従う。
- 同名リポジトリの二重cloneがある場合、`.code-workspace`が指す実体を先に確認する。
- branch、submodule、Git LFS、生成物、ローカル差分は各リポジトリで個別確認する。
- cloneできたことと、実機で動作することを同一視しない。

## 4. Deb800の再構築

レジスタの`deb800.expected_repositories`にある6リポジトリをcloneし、次の参照集合を持つ`Deb800.code-workspace`を作る。

```json
{
  "folders": [
    { "path": "DVE800/DVE800" },
    { "path": "FAN800/FAN800" },
    { "path": "OND800/OND800" },
    { "path": "ZeroRoomLab-manifest/ZeroRoomLab-manifest" },
    { "path": "PSYCHO-Py800MCP/PSYCHO-Py800MCP" },
    { "path": "SAO800/SAO800" }
  ]
}
```

ここで再現できるのはコードと文書の集合である。Pi 5、ESP32、DaVinci Resolve、OBS、NDI SDK、GStreamer、計測器等の実行条件は各リポジトリの実機記録に従う。

## 5. スフィアの再構築

レジスタの`sphere.expected_repositories`にある公開Gitリポジトリをcloneし、次の参照集合を基本形とする。

```json
{
  "folders": [
    { "path": "IBD/IBD" },
    { "path": "quantaril_cloud_Q3/quantaril_cloud_Q3" },
    { "path": "ZeroRoomLab-manifest/ZeroRoomLab-manifest" },
    { "path": "AQC/astro.quantaril.cloud" },
    { "path": "pain-scouter-assessment/pain-scouter-assessment" },
    { "path": "Sphere-aae/Sphere-aae" },
    { "path": "Sphere-aae/SphereASTRO/SphereASTRO" }
  ]
}
```

実運用ワークスペースには`スフィア独鈷書`も含まれる。これはスフィアOSがワールドデータの境界を認識するための、エドワーズ系暗号チェーンの秘密鍵構造体・秘密鍵束であり、公開Gitから復元する対象ではない。内容を走査、表示、ログ出力、Git登録、アップロード、配布してはならない。公開開発環境ではこのfolderを欠損エラーにせず、descriptorから省略する。

将来キーチェーン仕様が固まった場合は、SDK利用者が各自のワールド境界用の鍵を新規生成・保存する独鈷書生成ライブラリを公開対象にできる。既存の`スフィア独鈷書`をコピーして第三者環境を作る手順は設けない。

SphereOS本体や関連実装の稼働状態は、clone可否とは別に各リポジトリのREADME、AGENTS.md、実機・HPC記録で確認する。

## 6. 企業・サードパーティワークスペース

企業ワークスペースは公開OSSのclone手順へ展開しない。manifestに記録できるのは、名称、公開可能な目的、ZeroRoomLabとの関係、抽象化済み成果への導線までとする。

株式会社寺徳の検証環境については、会社資産、現場労務、労基、医療情報、企業向けエージェント指示、資格情報、内部パスを再構築資料へ含めない。一般化された成果をOSS化するときは、新しい公開リポジトリまたは公開ワークスペースへ切り出し、権利とデータ境界を再検証する。

将来サードパーティ用ワークスペースを追加するときは、[workspace-registry.json](workspace-registry.json)へ次を登録する。

- 正式名とdescriptor名
- 公開／非公開／混在の区分
- リポジトリのclone元またはローカル専用指定
- ライセンスとデータ所有者
- 再構築可能範囲
- 保護対象カテゴリ
- 他ワークスペースへの暗黙依存を許すか

## 7. AGIによる検証

再構築後、AGIは変更を始める前に次を確認する。

```text
[ ] descriptorの名前がレジスタと一致する
[ ] foldersが意図した参照集合だけを含む
[ ] 各folderが実在する
[ ] 各Git remoteがレジスタのclone元と一致する
[ ] 各リポジトリのbranchと未コミット差分を確認した
[ ] ローカル専用・企業資産を欠損扱いしていない
[ ] スフィア独鈷書を走査・複製・公開対象にしていない
[ ] 別ワークスペースの実装を暗黙依存へ追加していない
[ ] 実行環境の未確認項目を動作済みとしていない
```

差分がある場合は自動修正せず、descriptor、レジスタ、現物の三者を提示して人間へ返す。
