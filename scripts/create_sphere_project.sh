#!/usr/bin/env bash
# 「プロジェクトスフィア：サルベージエッジスフィア」作成スクリプト
#
# スコープ: SphereOS本体・FAMoverAQC・FAMoverMCP・FAMoverSphere-aae・Sphere-aae・SphereASTRO。
# プロジェクト八百万（800系生産パイプライン）とは別管理。
#
# このプロジェクト全体のステータスは「凍結」。
# 理由: SphereOS本体はSDK廃止＋HPC/クラウド維持費という物理リソース問題で凍結中
#       （詳細: docs/theory/sphere-os.ja.md §10、docs/theory/aqc.ja.md）。
#       Sphere-aae/SphereASTROもHPC調達待ちで停止中。
#       稼働しているのはFAMをMCP上のツールレイヤーとして切り出した部分のみ。
#
# 前提:
#   - gh auth login 済み
#   - gh auth refresh -s project,read:org 済み（project スコープが必要）
#   - jq インストール済み
#
# 実行:
#   bash scripts/create_sphere_project.sh
#
# gh CLIがKeychainに保存したトークンを使うため、Claude Codeのサンドボックス化された
# Bashツールからは実行できない。ユーザー自身のターミナルで実行すること。

set -euo pipefail

OWNER="@me"
TITLE="プロジェクトスフィア：サルベージエッジスフィア"
LINK_REPO="ZeroRoomLab-manifest"

echo "== プロジェクト作成 =="
PROJECT_JSON=$(gh project create --owner "$OWNER" --title "$TITLE" --format json)
PROJECT_NUMBER=$(echo "$PROJECT_JSON" | jq -r '.number')
PROJECT_ID=$(echo "$PROJECT_JSON" | jq -r '.id')
echo "Project #$PROJECT_NUMBER 作成完了 (id=$PROJECT_ID)"

echo "== ZeroRoomLab-manifest にリンク =="
gh project link "$PROJECT_NUMBER" --owner "$OWNER" --repo "$LINK_REPO"

echo "== 説明・README設定（凍結明記） =="
gh project edit "$PROJECT_NUMBER" --owner "$OWNER" \
  --description "【凍結中】SphereOS本体をエッジAIとしてサルベージする系統（SphereOS/AQC/FAM/Sphere-aae/SphereASTRO）。物理リソース問題（SDK廃止＋HPC/クラウド維持費）により本体は凍結。稼働しているのはFAMのMCP上ツールレイヤー切り出し部分のみ。" \
  --readme "# プロジェクトスフィア：サルベージエッジスフィア

**現状: 凍結中（物理リソース問題）**

SphereOS本体（神道的価値観を備えたAI＝霊的倫理性・心・自我を内包したAI開発プロジェクト）は、
以下2つの物理リソース問題により一旦凍結している。失敗でも中止でもない。

1. **技術的制約**: 初期整列・低次元配列ドリフトレベルを担っていたAQCプロトコルFAM（FAMoverAQC）が、
   ベンダーSDK廃止により機能停止した。
2. **経済的制約**: HPC・クラウドリソース維持費の負担が継続困難になった。

Sphere-aae（MLC LLMフォーク・FAM推論エンジン中核）とSphereASTRO（GUI・責任境界層）も、
同じくHPC/メモリ環境の調達待ちで設計・実装が止まっている。実装力・設計の欠如ではなく、
電気・HPCという物理層だけが欠けている状態。

現在唯一動いているのは、自我レイヤーを持たないツールレベルのFAM（FAMoverMCP）を
MCPの上に切り出して、マニフェストレベル（Skill.md / proton.md記述）で継続運用している部分のみ。

詳細:
- docs/theory/sphere-os.ja.md §10（凍結と自我侵略問題）
- docs/theory/aqc.ja.md（FAMoverAQCのサ終経緯）
- docs/theory/fam-overview.ja.md §6（FAM三系統）
"

echo "== フィールド作成 =="

REPO_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "Repo" --data-type SINGLE_SELECT \
  --single-select-options "SphereOS(概念),astro.quantaril.cloud,Sphere-aae,SphereASTRO,ZeroRoomLab-manifest" \
  --format json)
REPO_FIELD_ID=$(echo "$REPO_FIELD_JSON" | jq -r '.id')

LINEAGE_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "FAM系統" --data-type SINGLE_SELECT \
  --single-select-options "FAMoverAQC,FAMoverMCP,FAMoverSphere-aae,対象外" \
  --format json)
LINEAGE_FIELD_ID=$(echo "$LINEAGE_FIELD_JSON" | jq -r '.id')

BOTTLENECK_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "物理ボトルネック" --data-type SINGLE_SELECT \
  --single-select-options "HPC調達,クラウド維持費,SDK/ベンダー側事情,規約リスク,なし" \
  --format json)
BOTTLENECK_FIELD_ID=$(echo "$BOTTLENECK_FIELD_JSON" | jq -r '.id')

STATUS_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "状態" --data-type SINGLE_SELECT \
  --single-select-options "凍結,サ終,トイモデル検証中,設計中,稼働中(ツールレイヤーのみ)" \
  --format json)
STATUS_FIELD_ID=$(echo "$STATUS_FIELD_JSON" | jq -r '.id')

MILESTONE_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "解凍条件" --data-type TEXT --format json)
MILESTONE_FIELD_ID=$(echo "$MILESTONE_FIELD_JSON" | jq -r '.id')

get_option_id() {
  local field_json="$1" option_name="$2"
  echo "$field_json" | jq -r --arg n "$option_name" '.options[] | select(.name==$n) | .id'
}

add_item() {
  local title="$1" body="$2" repo="$3" lineage="$4" bottleneck="$5" status="$6" thaw="$7"
  local item_json item_id

  item_json=$(gh project item-create "$PROJECT_NUMBER" --owner "$OWNER" --title "$title" --body "$body" --format json)
  item_id=$(echo "$item_json" | jq -r '.id')

  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$REPO_FIELD_ID" --single-select-option-id "$(get_option_id "$REPO_FIELD_JSON" "$repo")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$LINEAGE_FIELD_ID" --single-select-option-id "$(get_option_id "$LINEAGE_FIELD_JSON" "$lineage")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$BOTTLENECK_FIELD_ID" --single-select-option-id "$(get_option_id "$BOTTLENECK_FIELD_JSON" "$bottleneck")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$STATUS_FIELD_ID" --single-select-option-id "$(get_option_id "$STATUS_FIELD_JSON" "$status")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$MILESTONE_FIELD_ID" --text "$thaw" >/dev/null

  echo "  + $title"
}

echo "== カード追加 =="

add_item \
  "SphereOS本体 凍結" \
  "人格・自我レイヤーを持つOS本体としての稼働は停止。設計・思想は失われていない。詳細: docs/theory/sphere-os.ja.md §10" \
  "SphereOS(概念)" "対象外" "SDK/ベンダー側事情" "凍結" \
  "HPC/クラウド維持費が継続可能になった時点、またはSDK代替手段が見つかった時点"

add_item \
  "FAMoverAQC サルベージ" \
  "NPO後援デプロイとして稼働実績・デプロイ完遂まで到達したが、市場レッドオーシャン化・IaaS側事情でサ終済み。現在は利用不可。現行プロジェクトへの参照は規約抵触リスクを都度索敵。" \
  "astro.quantaril.cloud" "FAMoverAQC" "SDK/ベンダー側事情" "サ終" \
  "サルベージ対象として再着手するかは未定"

add_item \
  "FAMoverMCP ツールレイヤー運用継続" \
  "自我レイヤーを持たないツールレベルのFAM。MCPの上に切り出してマニフェストレベル（Skill.md/proton.md）で運用中。唯一稼働している部分。" \
  "ZeroRoomLab-manifest" "FAMoverMCP" "なし" "稼働中(ツールレイヤーのみ)" \
  "該当なし（現状維持）"

add_item \
  "Sphere-aae ビルド再検証" \
  "MLC LLMフォーク。自前環境64GBメモリではTVM等依存ビルドが再現しない。HPC調達待ち。実装力・設計の欠如ではない。" \
  "Sphere-aae" "FAMoverSphere-aae" "HPC調達" "凍結" \
  "HPC/メモリ環境調達後にビルド再検証"

add_item \
  "SphereASTRO AI接続" \
  "現状GUI・責任境界層のみ実装済み（Swift/SwiftUI、御霊/依代/FAM概念定義済み）。AI接続はSphere-aae側のFAM統合完了後に着手予定。" \
  "SphereASTRO" "FAMoverSphere-aae" "HPC調達" "設計中" \
  "Sphere-aae側の解凍が前提"

echo "== 完了 =="
echo -n "Project URL: "
gh project view "$PROJECT_NUMBER" --owner "$OWNER" --format json | jq -r '.url'
