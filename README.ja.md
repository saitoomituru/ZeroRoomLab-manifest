# ZeroRoomLab-manifest

ZeroRoomLabとは何か、何を作っているか、思想的背景。

---

## ふさもふ（齋藤みつる）とは

山形県高畠町の江戸時代古民家に拠点を置く、独立系技術者・コンテンツクリエイター。
活動名は「ふさもふ」「Mad巫女サイエンティスト」。自称「働くニート」。
贈与経済モデルで動く——お金のためではなく、作りたいから作る。

技術的ルーツは工業高校時代のマイコン制作（マイクロカーラジコン全国大会出場）、
Apple FileMakerチームへのスカウト、電通でのDTP・サーバーサイド経験、
そして合同会社infernoでの独自AI開発（2011〜2021）に遡る。

現在は山形のオフグリッド志向の古民家で、太陽光・自家水源・LiFePO4バックアップを使いながら、
エッジAI・ライブ演出システム・オープンハードウェアを一人で開発している。

---

## ZeroRoomLabとは

ZeroRoomLabは、ふさもふの研究・制作スペースの名前。
「部屋ゼロから始める」という意味でもあり、「余白ゼロの現代社会へのカウンター」でもある。

山形の古民家の一室から、量子AI・分散配信・オープンハードウェアを動かす。
スタッフも投資家も「普通の環境」もない。あるのはUPS電源と井戸水と執念。

---

## 現在進行中のプロジェクト群

### 800系（OND800 / FAN800 / SAO800 / PSYCHO-Py800MCP）

演者本人が撮影・演出・配信・計測の主権を取り戻すための分散コックピットシステム。

- **OND800**: Raspberry Pi 5ベースの撮影コックピット（NDIマルチカメラ・OBS制御）
- **FAN800**: ESP32ベースの物理演出ファンネル（照明・特効・MIDI・DMXを自律実行）
- **SAO800**: OBS母艦拡張（RTSP→NDI変換・BPM解析・AIオフロード）
- **PSYCHO-Py800MCP**: 計測器MCP（オシロスコープ・ロジアナをAIに接続）

### FAM / SphereOS / Quantaril Cloud

地域・文化ごとに異なる「空気読み」空間を接続するAIアーキテクチャ群。
MCPが横に接続するなら、FAMは縦に潜る。思考過程を保存・検証・再利用する仕様。

### レーザー加工機改造（Dr.SILICONシリーズ）

田舎の限界部落の町工場5人組と、ジャンクの錆びた一斗缶をμm精度加工機ダクトに変換するプロジェクト。

---

## 思想的背景

### ゲーミング宇宙論

宇宙・社会・人生をMMO的構造として把握する思想。
「なぜ神は苦しみを与えるのか」を「なぜリファレンス実装にこのUXが採用されているのか」と読み替える。
貧困はEconomic UIの設計問題、戦争はプレイヤー間UXの問題として扱う。
怒りよりバグを叩ける思想。

### テクノアミニズム（Techno-Animism）

日本神話・古神道・琉球神道・工学・AI・情報理論を分離せず、相互変換可能な観測レイヤーとして扱う。
「巫女」は宗教職ではなく、異なる世界観のI/O変換を行うサンドボックス的観測者。

### 縄文2.0（Jomon 2.0）

贈与経済・オフグリッド・非収奪的秩序設計。
お金は流量と流速。貯めるやつは損する原則。

---

## リポジトリ一覧

| リポジトリ | 説明 |
|---|---|
| [OND800](https://github.com/HIPSTAR-IScompany/OND800) | 撮影コックピット |
| [FAN800](https://github.com/HIPSTAR-IScompany/FAN800) | 物理演出ファンネル |
| [SAO800](https://github.com/HIPSTAR-IScompany/SAO800) | 配信母艦拡張 |
| [PSYCHO-Py800MCP](https://github.com/HIPSTAR-IScompany/PSYCHO-Py800MCP) | 計測器MCP |
| [Sphere-aae](https://github.com/saitoomituru/Sphere-aae) | エッジAIエージェントエンジン |
| [commonsATX](https://github.com/saitoomituru/commonsATX) | レーザーカッター用OSHフレーム |

---

---

## 思想の深層へ

| ドキュメント | 内容 |
|---|---|
| [docs/philosophy/gaming-cosmology.ja.md](docs/philosophy/gaming-cosmology.ja.md) | ゲーミング宇宙論 教典 |
| [docs/philosophy/techno-animism.ja.md](docs/philosophy/techno-animism.ja.md) | テクノアミニズム — 神道・工学・AIの相互変換 |
| [docs/theory/fam-overview.ja.md](docs/theory/fam-overview.ja.md) | FAM（FoldAccessMapper）— 縦方向思考記録 |
| [docs/theory/infoton-engineering.ja.md](docs/theory/infoton-engineering.ja.md) | 情報子工学 — FAM記号による産業数論 |
| [docs/projects/800-series.ja.md](docs/projects/800-series.ja.md) | 800系 — 演者による主権回収システム |
| [docs/projects/bento-syndrome.md](docs/projects/bento-syndrome.md) | BENTOシンドローム — UI階層と実装の乖離 |
| [quantaril.cloud](https://quantaril.cloud) | Quantaril Cloud ドキュメントサイト |

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
