# GIT heart FZF
# 
# ref:
# 1. https://junegunn.kr/2016/07/fzf-git/
# 2. https://cocktailmake.github.io/posts/improvement-of-git-commands-with-fzf/
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 100% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always | diff-so-fancy -- {-1} | sed 1,4d; cat {-1})' |
  cut -c4- | sed 's/.* -> //'
}

_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show | diff-so-fancy --color=always {}'
}

_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
  cut -d$'\t' -f1
}

_gs() {
  is_in_git_repo || return
  git stash list | fzf-down --reverse -d: --preview 'git show --color=always {1}' |
  cut -d: -f1
}

_gh() {
    is_in_git_repo || return

    _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
    _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

    git log --graph --color=always --date=short \
        --format="%C(cyan)%cd %C(auto)%h%d %C(auto)%s%+b %C(black)(%an)" "$@" |
    fzf-down --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --preview="$_viewGitLogLine" \
    --bind "enter:execute:
        (grep -o '[a-f0-9]\{7\}' | head -1 |
        xargs -I % sh -c 'git show --color=always % | diff-so-fancy | less -R ') << 'FZF-EOF'
        {}
        FZF-EOF" \
    --bind "ctrl-c:execute:$_gitLogLineToHash | pbcopy"
    # copy command: Mac OSX used `pbcopy`, Linux used `xclip -r -selection clipboard`
}

alias gdf=_gf
alias gbr=_gb
alias gtag=_gt
alias grb=_gr
alias gs=_gs
alias gh=_gh
