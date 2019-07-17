##
# ~/.bashrc
#
# basic
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.cm "commit -m"
git config --global alias.st status
git config --global alias.undo "reset --soft HEAD~1"
git config --global alias.df diff
git config --global alias.last "log -1 HEAD"
git config --global alias.dflast "diff --cached HEAD^"

# git config --global alias.dsf '!f() { [ -z "$GIT_PREFIX" ] || cd "$GIT_PREFIX"'\
# ' && git diff --color "$@" | diff-so-fancy  | less --tabs=4 -RFX; }; f'

git config --global alias.tree2 "log --graph --abbrev-commit --decorate "\
"--pretty=oneline"

git config --global alias.tree "log --graph --abbrev-commit --decorate "\
"--format=format:'%C(bold yellow)%h %C(dim cyan)%cd %C(auto)%s %Creset"\
"%C(dim white) (%an) %C(auto)%d' --date=format:%Y-%m-%d"




# 中文顯示
git config --global core.quotepath false
# use nvim editor
git config --global core.editor "nvim"
