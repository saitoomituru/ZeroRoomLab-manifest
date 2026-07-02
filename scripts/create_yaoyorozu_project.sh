#!/usr/bin/env bash
# ZeroRoomLab 800系（生産パイプライン）専用ボード「プロジェクト八百万」作成スクリプト
#
# スコープ: OND800 / FAN800 / SAO800 / DVE800 / PSYCHO-Py800MCP のみ。
# Sphere-aae / SphereASTRO / FAM(AQC/MCP)サルベージ系は対象外
# （→ scripts/create_sphere_project.sh 側で「凍結」プロジェクトとして分離管理する）。
#
# 前提:
#   - gh auth login 済み
#   - gh auth refresh -s project,read:org 済み（project スコープが必要）
#   - jq インストール済み
#
# 実行:
#   bash scripts/create_yaoyorozu_project.sh
#
# gh CLIがKeychainに保存したトークンを使うため、Claude Codeのサンドボックス化された
# Bashツールからは実行できない（認証情報の取り扱いとしてブロックされる）。
# ユーザー自身のターミナルで実行すること。

set -euo pipefail

OWNER="@me"
TITLE="ZeroRoomLab 800系プロジェクト八百万"
LINK_REPO="ZeroRoomLab-manifest"

echo "== プロジェクト作成 =="
PROJECT_JSON=$(gh project create --owner "$OWNER" --title "$TITLE" --format json)
PROJECT_NUMBER=$(echo "$PROJECT_JSON" | jq -r '.number')
PROJECT_ID=$(echo "$PROJECT_JSON" | jq -r '.id')
echo "Project #$PROJECT_NUMBER 作成完了 (id=$PROJECT_ID)"

echo "== ZeroRoomLab-manifest にリンク =="
gh project link "$PROJECT_NUMBER" --owner "$OWNER" --repo "$LINK_REPO"

gh project edit "$PROJECT_NUMBER" --owner "$OWNER" \
  --description "800系（OND800/FAN800/SAO800/DVE800/PSYCHO-Py800MCP）の生産パイプライン依存関係ボード。Sphere系（Sphere-aae/SphereASTRO/FAMサルベージ）はプロジェクトスフィアで別管理。"

echo "== フィールド作成 =="

REPO_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "Repo" --data-type SINGLE_SELECT \
  --single-select-options "OND800,FAN800,SAO800,DVE800,PSYCHO-Py800MCP,ZeroRoomLab-manifest" \
  --format json)
REPO_FIELD_ID=$(echo "$REPO_FIELD_JSON" | jq -r '.id')

LAYER_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "Layer" --data-type SINGLE_SELECT \
  --single-select-options "撮る(OND800),流す(SAO800),刻む(FAN800),編む(DVE800),計測(PSYCHO-Py800MCP)" \
  --format json)
LAYER_FIELD_ID=$(echo "$LAYER_FIELD_JSON" | jq -r '.id')

BOTTLENECK_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "依存ボトルネック" --data-type SINGLE_SELECT \
  --single-select-options "資金(投げ銭),規約リスク,実機検証待ち,設計待ち,置き場所未確定,なし" \
  --format json)
BOTTLENECK_FIELD_ID=$(echo "$BOTTLENECK_FIELD_JSON" | jq -r '.id')

STATUS_FIELD_JSON=$(gh project field-create "$PROJECT_NUMBER" --owner "$OWNER" \
  --name "状態" --data-type SINGLE_SELECT \
  --single-select-options "構想,設計中,実装中,検証待ち,一時停止,完了" \
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
  local title="$1" body="$2" repo="$3" layer="$4" bottleneck="$5" status="$6" milestone="$7"
  local item_json item_id

  item_json=$(gh project item-create "$PROJECT_NUMBER" --owner "$OWNER" --title "$title" --body "$body" --format json)
  item_id=$(echo "$item_json" | jq -r '.id')

  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$REPO_FIELD_ID" --single-select-option-id "$(get_option_id "$REPO_FIELD_JSON" "$repo")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$LAYER_FIELD_ID" --single-select-option-id "$(get_option_id "$LAYER_FIELD_JSON" "$layer")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$BOTTLENECK_FIELD_ID" --single-select-option-id "$(get_option_id "$BOTTLENECK_FIELD_JSON" "$bottleneck")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$STATUS_FIELD_ID" --single-select-option-id "$(get_option_id "$STATUS_FIELD_JSON" "$status")" >/dev/null
  gh project item-edit --id "$item_id" --project-id "$PROJECT_ID" \
    --field-id "$MILESTONE_FIELD_ID" --text "$milestone" >/dev/null

  echo "  + $title"
}

echo "== 依存ボトルネックカード追加 =="

add_item \
  "OND800 Season3再開" \
  "HyperPixel 4.0破損によりSeason3一時停止中。液晶再調達・保護筐体試作が先決。詳細: OND800/notes/2026-06-26_hyperpixel-breakage-season3-pause.md" \
  "OND800" "撮る(OND800)" "資金(投げ銭)" "一時停止" \
  "液晶再調達・筐体試作・防御パネル・固定具・FAN800連携プロトまで目安8〜12万円"

add_item \
  "FAMoverMCP: DVE800 Module5 (mcp_server) 着手" \
  "PSYCHO-Py800MCP統合口。Module3 (aqc_local) の設計見直しが完了してから着手する依存関係。FAM本体の系統整理はプロジェクトスフィア側を参照。" \
  "DVE800" "編む(DVE800)" "設計待ち" "構想" \
  "なし（設計完了後に着手）"

add_item \
  "DVE800 Module8 (mosaic_detection) 実装" \
  "AGPL-3.0ライセンスモデル資産への依存可能性あり。ライセンス隔離方針(別venv/別requirements)のみ確定、実装は未着手。" \
  "DVE800" "編む(DVE800)" "設計待ち" "構想" \
  "なし"

add_item \
  "800系横断ドキュメント整備（current_status.md等）" \
  "GitHubリポジトリ横断レビューの提案。置き場所（各リポジトリ個別 or manifest集約）・正本の位置が未確定。詳細: OND800/notes/2026-07-03_800-series-cross-repo-docs-proposal.md" \
  "ZeroRoomLab-manifest" "撮る(OND800)" "置き場所未確定" "構想" \
  "なし"

echo "== 完了 =="
echo -n "Project URL: "
gh project view "$PROJECT_NUMBER" --owner "$OWNER" --format json | jq -r '.url'
