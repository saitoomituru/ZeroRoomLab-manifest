#!/usr/bin/env bash
# 「プロジェクト縄文ラボ：ハードウェア工房」作成スクリプト（仮称・要確認）
#
# スコープ: 800系（生産パイプライン）でもSphere系（エッジAI）でもない、
# 物理工作・OSHハードウェア案件をまとめる。
# 現状の対象: commonsATX（レーザーカッターOSHフレーム）、
#            Dr.SILICONシリーズ（レーザー加工機魔改造）、
#            EVバイク「縄文エンジェル」（V0.2.0開発中断）。
#
# 名称・スコープは提案段階。違う名前・違う切り分けにしたい場合は要修正。
#
# 前提:
#   - gh auth login 済み
#   - gh auth refresh -s project,read:org 済み（project スコープが必要）
#   - jq インストール済み
#
# 実行:
#   bash scripts/create_jomon_lab_project.sh

set -euo pipefail

OWNER="@me"
TITLE="プロジェクト縄文ラボ：ハードウェア工房"
LINK_REPO="ZeroRoomLab-manifest"

echo "== プロジェクト作成 =="
PROJECT_JSON=$(gh project create --owner "$OWNER" --title "$TITLE" --format json)
PROJECT_NUMBER=$(echo "$PROJECT_JSON" | jq -r '.number')
PROJECT_ID=$(echo "$PROJECT_JSON" | jq -r '.id')
echo "Project #$PROJECT_NUMBER 作成完了 (id=$PROJECT_ID)"

echo "== ZeroRoomLab-manifest にリンク =="
gh project link "$PROJECT_NUMBER" --owner "$OWNER" --repo "$LINK_REPO"

gh project edit "$PROJECT_NUMBER" --owner "$OWNER" \
  --description "800系（生産パイプライン）・Sphere系（エッジAI）に属さない物理工作・OSHハードウェア案件。ジャンク箱ガチャと縄文2.0（贈与経済・非収奪的秩序設計）が資金源。"

echo "== フィールド作成 =="

REPO_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "案件" --data-type SINGLE_SELECT \
  --single-select-options "commonsATX,Dr.SILICONシリーズ,EVバイク縄文エンジェル,その他" \
  --format json)
REPO_FIELD_ID=$(echo "$REPO_FIELD_JSON" | jq -r '.id')

BOTTLENECK_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "依存ボトルネック" --data-type SINGLE_SELECT \
  --single-select-options "資金(投げ銭),ジャンク箱ガチャ待ち,部材調達,協力者(町工場)待ち,なし" \
  --format json)
BOTTLENECK_FIELD_ID=$(echo "$BOTTLENECK_FIELD_JSON" | jq -r '.id')

STATUS_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "状態" --data-type SINGLE_SELECT \
  --single-select-options "構想,設計中,実装中,一時停止,完了" \
  --format json)
STATUS_FIELD_ID=$(echo "$STATUS_FIELD_JSON" | jq -r '.id')

MILESTONE_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "投げ銭マイルストーン" --data-type TEXT --format json)
MILESTONE_FIELD_ID=$(echo "$MILESTONE_FIELD_JSON" | jq -r '.id')

get_option_id() {
  local field_json="$1" option_name="$2"
  echo "$field_json" | jq -r --arg n "$option_name" '.options[] | select(.name==$n) | .id'
}

add_item() {
  local title="$1" body="$2" repo="$3" bottleneck="$4" status="$5" milestone="$6"
  local item_json item_id

  item_json=$(gh project item-create "$PROJECT_NUMBER" --owner "$OWNER" --title "$title" --body "$body" --format json)
  item_id=$(echo "$item_json" | jq -r '.id')

  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$REPO_FIELD_ID" --single-select-option-id "$(get_option_id "$REPO_FIELD_JSON" "$repo")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$BOTTLENECK_FIELD_ID" --single-select-option-id "$(get_option_id "$BOTTLENECK_FIELD_JSON" "$bottleneck")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$STATUS_FIELD_ID" --single-select-option-id "$(get_option_id "$STATUS_FIELD_JSON" "$status")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$MILESTONE_FIELD_ID" --text "$milestone" >/dev/null

  echo "  + $title"
}

echo "== カード追加 =="

add_item \
  "レーザー加工機ダクト板金" \
  "ジャンクの錆びた一斗缶を板金してμm精度レーザー加工機のハニカム下陰圧ドラフトチャンバー用ダクトを自作。町工場5人組コラボ。commonsATXと連携。" \
  "Dr.SILICONシリーズ" "協力者(町工場)待ち" "実装中" \
  "なし"

add_item \
  "EVバイク縄文エンジェル V0.2.0再開" \
  "V0.1.5急造→中華モーター完全故障で開腹測定済み。ステータ絶縁材の温度余裕不足が根本原因。中断理由は資金。" \
  "EVバイク縄文エンジェル" "資金(投げ銭)" "一時停止" \
  "モーター再調達費用（金額未確定）"

echo "== 完了 =="
echo -n "Project URL: "
gh project view "$PROJECT_NUMBER" --owner "$OWNER" --format json | jq -r '.url'
