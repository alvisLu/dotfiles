#!/usr/bin/env bash
# 從當前 pane 撈出所有 `path:line` / `path:line:col` 參照,用 fzf 選一個,
# 用 VSCode 開到那一行。由 tmux `prefix + g` 透過 display-popup 呼叫。
# cwd 由 display-popup 的 -d '#{pane_current_path}' 帶入,所以相對路徑
# 會相對於你跑 claude 的目錄(通常是 repo root)解析。

sel=$(
  tmux capture-pane -p -S -3000 \
    | grep -oE '[[:alnum:]_./~-]+\.[[:alnum:]]+:[0-9]+(:[0-9]+)?' \
    | sort -u \
    | fzf --tac --layout=reverse --prompt='open> '
)

[ -n "$sel" ] && code -g "$sel"
