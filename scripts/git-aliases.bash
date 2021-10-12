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

# 中文顯示
git config --global core.quotepath false
# use nvim editor
git config --global core.editor "nvim"
