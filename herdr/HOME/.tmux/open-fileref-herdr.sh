#!/usr/bin/env bash
# herdr 版的 open-fileref.sh。從當前 pane 撈出所有 `path:line` / `path:line:col`
# 參照,用 fzf 選一個,用 VSCode 開到那一行。由 herdr `prefix + g` 透過 popup 呼叫。
#
# 跟 tmux 版的差異:
#   tmux capture-pane -p -S -3000   ->  herdr pane read <id> --source recent --lines 3000
#   display-popup -d '#{pane_current_path}'  ->  自己從 API 讀 focused pane 的 cwd,
#   因為 herdr 的 popup 不保證繼承 focused pane 的目錄。

set -euo pipefail

snapshot=$(herdr pane list)
pane=$(printf '%s' "$snapshot" | jq -r '.result.panes[] | select(.focused) | .pane_id' | head -1)
cwd=$(printf '%s' "$snapshot" | jq -r '.result.panes[] | select(.focused) | .foreground_cwd' | head -1)

[ -n "$pane" ] || { echo "找不到 focused pane"; sleep 2; exit 1; }
[ -n "$cwd" ] && [ -d "$cwd" ] && cd "$cwd"

sel=$(
  herdr pane read "$pane" --source recent --lines 3000 --format text \
    | grep -oE '[[:alnum:]_./~-]+\.[[:alnum:]]+:[0-9]+(:[0-9]+)?' \
    | sort -u \
    | fzf --tac --layout=reverse --prompt='open> '
)

[ -n "$sel" ] && code -g "$sel"
