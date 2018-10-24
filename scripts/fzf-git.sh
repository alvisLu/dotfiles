#
# ~/.bashrc
#
# GIT heart FZF

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 100% "$@" --border
}

gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' | cut -c4- | sed 's/.* -> //'
}

gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(bold dim blue)%cd %C(auto)%h %s%d %C(cyan)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview "echo {} | grep -o '[a-f0-9]\{7,\}' | head -1 | xargs -I % sh -c 'git show --color=always % | diff-so-fancy | head -5000'" | # fixbug: 使用參數 $LINES 行數顯示最多 50 行
    grep -o "[a-f0-9]\{7,\}"
}

gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

# key-binding
bind '"\er": redraw-current-line'
bind '"\C-f\C-f": "$(gf)\e\C-e\er"'
bind '"\C-f\C-b": "$(gb)\e\C-e\er"'
bind '"\C-f\C-h": "$(gh)\e\C-e\er"'
bind '"\C-f\C-r": "$(gr)\e\C-e\er"'
