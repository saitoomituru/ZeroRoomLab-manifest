# NeeT_kitchen_ALCHEMIST ワークスペース位置づけ監査

作成日時: 2026-07-24 11:06 JST  
状態: `[REVIEW]` `[Layer A]`  
対象: `NeeT_kitchen_ALCHEMIST.code-workspace`、`OpenSourcePITETO`、ZeroRoomLab-manifest  
範囲: 公開リポジトリのREADME、画像、ワークスペース境界、マニフェスト上のプロジェクト分類  
除外: Sphere／Deb800構成要素への実装接続、栄養学的一般化、未作成レシピの実装済み扱い

## Declared Position

低資源の生活者が、家庭設備・公開知識・身体感覚を組み合わせて食の成果物を作り、その再現可能な知識を贈与経済へ戻す活動を優先する。

## Position-talk Risk

- AI／ソフトウェア中心のmanifestから読むことで、料理をSphereOSまたは800系の下位実装として誤分類する危険がある。
- 「NEET」を欠陥状態や就労復帰待ちとしてのみ読み、低資源環境での自律的な研究・生産・知識還元を矮小化する危険がある。
- 一つのポテトチップス実験から、未作成の料理群や栄養効果を実装済みへ拡張する危険がある。

## Claim Scope / Medium Register

- `OpenSourcePITETO/README.md` は日本語正本であり、冒頭は公開用表紙、工程以降は家庭調理の実験・再現レジスターとして扱う。
- `README.us-en.md` は日本語正本を置き換えず、米国のDIY、garage lab、open-source hardware文化へ接続するen-US意訳とする。
- manifestの `docs/projects/` にはワークスペースと研究目的を正規化し、レシピ本文の複製はしない。

## Ruler Provenance

- ワークスペース境界: `docs/operations/workspace-boundary-register.ja.md`
- 日本語正本／en-US外部GUI: `docs/operations/default-language-and-translation-policy.ja.md`
- README媒体差: `docs/operations/technical-communication-register.ja.md`
- 事実・解釈・内観の分離: `note/AGENTS.md`

## [FACT] 確認できたこと

- `/Users/saitoumitsuru/NeeT_kitchen_ALCHEMIST.code-workspace` の `folders` は次の2メンバーである。
  - `NeeT_kitchen_ALCHEMIST/OpenSourcePITETO`
  - `ZeroRoomLab-manifest/ZeroRoomLab-manifest`
- `OpenSourcePITETO` にはポテトチップスの家庭製造実験を記した `README.md` と、実工程を写したJPEG画像3点がある。
- 画像はiPhone由来のExif/GPSメタデータを含むため、そのまま公開用成果物へ含めるべきではない。
- 現在のREADMEは `v0.2 Experimental / EATABLE`、家庭用フライヤー／揚げ物鍋、家庭用オーブン設定210℃、5分間隔の人間試食制御を記録している。

## [INTERPRETATION] 正本へ反映する位置づけ

`NeeT_kitchen_ALCHEMIST` は、Sphere／Deb800とは別の、人間側の生活兵站研究ワークスペースである。主題はAIや撮影装置の構築ではなく、低資源の生活者が家庭設備へ工程機能を再配置し、食べられる成果物と再利用可能な公開知識を得ることにある。

`OpenSourcePITETO` はその最初の実験リポジトリであり、「ニート用バズレシピ」は、安価・目を引く・試したくなるという入口を持ちながら、工程の物理的役割、失敗条件、人間によるフィードバック制御を公開するレシピ形式として扱う。

## [UNKNOWN] User Gateへ残すこと

- ポテトチップス以外のレシピを同一リポジトリへ追加するか、別リポジトリに分けるか。
- 食費、熱源コスト、保存性、栄養、調達性をどの粒度で兵站指標へするか。
- GitHub Projects上で独立ボードを持つか。

## Nerf Risk

- 「料理README」に縮めると、人間の身体、家庭設備、調達、熱、時間、味覚を統合する兵站研究の目的が消える。
- 逆に「人間側OS」等へ抽象化しすぎると、食べる成果物を作る具体性が消える。
- 商業的なバズ、雇用復帰、事業化を既定KPIにしない。食える、再現できる、知識を返せることを現段階の中心へ置く。

## OAE Temporal Integrity

本ノートは2026-07-24時点の資料を現在の定規で整理したInterpretation OAEである。過去の作者意図を遡及生成しない。

## 反映計画

1. 公開画像をREADME向けに縮小再エンコードし、Exif/GPSを除去する。
2. 再現用Pythonスクリプトを `OpenSourcePITETO/lib/` に置く。
3. 日本語READMEへ画像、英語版導線、画像処理の再現方法を追加する。
4. 日本語正本の完成後、`README.us-en.md` をen-US意訳として作る。
5. manifestへワークスペースレジストリ、境界説明、プロジェクト正本文書、ハブ導線を追加する。

## 内観メモ

働く／働かないの二択だけで人間の生産を読むと、食うための工学、もらった芋を成果物へ変える熱設計、味覚をセンサーにする身体知が見えなくなる。これは巨大AIの末端機能ではなく、電気と油と口が残っている現場で成立する、かなり原始的で強い兵站である。
