# git-fuzzy 按鍵設定：把預設的 Alt-* 全部改成 Ctrl-*
#
# ref: https://github.com/bigH/git-fuzzy
#
# 用法一（全域，目前採用）：由 .zshrc source 這個檔
# 用法二（單一 repo 覆蓋）：symlink 成該 repo 的 ./.git-fuzzy-config
#   git-fuzzy 的 lib/load-configs.sh 只讀「當前工作目錄」下的 .git-fuzzy-config，
#   所以放在 $HOME 是沒有用的。
#
# 已被 git-fuzzy 自己佔走、不要碰的鍵（lib/core.sh 的 FZF_DEFAULT_OPTS）：
#   Ctrl-Space 開關 preview   Ctrl-J/K 上下      Ctrl-D/U 翻頁
#   Ctrl-S     切換排序       Ctrl-E/Y preview 捲動
# 終端機層級不可用：
#   Ctrl-I ≡ Tab   Ctrl-M ≡ Enter   Ctrl-C = abort   Ctrl-= / Ctrl-- 送不出來
# -------------

# -- 全域（所有畫面共用） --

export GIT_FUZZY_SELECT_ALL_KEY=Ctrl-A     # Alt-A；覆蓋 fzf 的 beginning-of-line
export GIT_FUZZY_SELECT_NONE_KEY=Ctrl-X    # Alt-D；Ctrl-D 已是 half-page-down
export GIT_FUZZY_PREVIEW_WRAP_KEY=Ctrl-W   # Alt-W；覆蓋 fzf 的 delete-word
export GIT_FUZZY_INSPECT_KEY=Ctrl-V        # Alt-I；V = view，因為 Ctrl-I 是 Tab

# Alt-= / Alt-- 無法轉成 Ctrl（終端機不送這兩個組合），維持原狀
# export GIT_FUZZY_PREVIEW_SIZE_INCREASE_KEY=Alt-=
# export GIT_FUZZY_PREVIEW_SIZE_DECREASE_KEY=Alt--

# -- branch （gf branch） --

# Ctrl-P 本來就是 working copy diff，不動；Ctrl-N 配成一對＝ merge-base diff
export GIT_FUZZY_BRANCH_WORKING_COPY_KEY=Ctrl-P
export GIT_FUZZY_BRANCH_MERGE_BASE_KEY=Ctrl-N    # Alt-P
export GIT_FUZZY_BRANCH_COMMIT_LOG_KEY=Ctrl-L    # Alt-L
export GIT_FUZZY_BRANCH_CHECKOUT_KEY=Ctrl-B      # Alt-B
export GIT_FUZZY_BRANCH_CHECKOUT_FILE_KEY=Ctrl-F # Alt-F
export GIT_FUZZY_BRANCH_DELETE_BRANCH_KEY=Ctrl-R # Alt-D；R = remove

# -- status （gf status） --

export GIT_FUZZY_STATUS_ADD_KEY=Ctrl-T           # Alt-S；sTage，Ctrl-S 是切換排序
export GIT_FUZZY_STATUS_ADD_PATCH_KEY=Ctrl-P     # Alt-P；此畫面沒用到 Ctrl-P
export GIT_FUZZY_STATUS_COMMIT_KEY=Ctrl-O        # Alt-C；cOmmit，因為 Ctrl-C 是 abort
export GIT_FUZZY_STATUS_AMEND_KEY=Ctrl-N         # Alt-M；ameNd，因為 Ctrl-M 是 Enter
export GIT_FUZZY_STATUS_RESET_KEY=Ctrl-R         # Alt-R
export GIT_FUZZY_STATUS_EDIT_KEY=Ctrl-B          # Alt-E；e/d/i/t 全被佔，任選一個空鍵

# discard 是這裡唯一不可復原的操作，刻意留在 Alt 避免和 Ctrl-R (reset) 誤按
# export GIT_FUZZY_STATUS_DISCARD_KEY=Alt-U

# -- log / reflog （gf log、gf reflog） --

export GIT_FUZZY_LOG_WORKING_COPY_KEY=Ctrl-P
export GIT_FUZZY_MERGE_BASE_KEY=Ctrl-N           # Alt-P（log 專用，無 LOG_ 前綴）
export GIT_FUZZY_LOG_COMMIT_KEY=Ctrl-O           # Alt-D；單一 commit 的 patch

export GIT_FUZZY_REFLOG_WORKING_COPY_KEY=Ctrl-P
export GIT_FUZZY_REFLOG_MERGE_BASE_KEY=Ctrl-N    # Alt-P
export GIT_FUZZY_REFLOG_COMMIT_KEY=Ctrl-O        # Alt-D

# -- stash （gf stash） --

export GIT_FUZZY_POP_KEY=Ctrl-P                  # Alt-P
export GIT_FUZZY_APPLY_KEY=Ctrl-T                # Alt-A；Ctrl-A 是全選
export GIT_FUZZY_DROP_KEY=Ctrl-R                 # Alt-D；同 branch delete 的 R = remove
