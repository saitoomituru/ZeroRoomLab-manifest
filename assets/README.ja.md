# ZeroRoomLab assets

このディレクトリーは、ZeroRoomLab-manifest固有のRole、Flavor、Presentationを保持します。
SphereOS AtlantisのMAGI core、resolver、validator、Position Skillはここへ置きません。

## 現在の読込方法

現段階は明示includeだけです。AGENTS.md、README、または対象taskが必要なasset pathを指定し、
agentがそのファイルを読むことで適用します。

```text
Atlantis MAGI core
  + --profile zeroroomlab
  + Manifestが明示したasset file
  -> 対象taskの監査deck
```

repository全体の暗黙scan、優先順位merge、remote download、hot reload、常駐daemonは
`NOT IMPLEMENTED`です。assetを置いただけで自動的に人格、権限、外部操作、課金、model call、
永続stateが生えるとは記述しません。

## Proton.mdの扱い

初版は`*.proton.md`を、概念register、責務、入力、出力、禁止操作、fallbackを人間とagentが読む
宣言形式として使います。現時点では専用parser／loaderのmachine schemaではありません。

FAM形式、pointer config、machine validationへ移行するときは、旧Protonを消さず、migration receiptと
compatibilityを残します。

## 棚

- `flavor/`: ZeroRoomLabのWorld、語り口、神話・工学の共存条件
- `presentations/`: 読者別の表現surface
- `roles/`: task上の役割、観測角度、禁止越権

RoleとFlavorはcoreのfact、権限、停止条件、実装状態を上書きしません。coreもRoleとFlavorを
「不要な飾り」として自動削除しません。

## 第三者asset

第三者developerは、自分のManifestまたはrepositoryへ独自assetを置けます。特定作品、実在人物、
宗派、ブランドを参照する場合、そのManifest側でlicense、provenance、名称利用、適用scopeを判断します。

ZeroRoomLab assetは、Origin認定、公式コラボ、第三者作品の利用許諾を生成しません。
