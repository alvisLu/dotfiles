"------------------------------------------------------------------------------"
" Plugins
"------------------------------------------------------------------------------"
call plug#begin()
" -- Colors themes -- "
" hybrid-theme
Plug 'kristijanhusak/vim-hybrid-material'
" tomorrow
Plug 'https://github.com/chriskempson/vim-tomorrow-theme'

" -- Airline and themes -- "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" -- Sensible -- "
Plug 'tpope/vim-sensible'

" -- Fugitive" -- "
Plug 'https://github.com/tpope/vim-fugitive.git'

" -- NERDTreeToggle -- "
Plug 'scrooloose/nerdtree'

" -- NERDCommenter -- "
Plug 'scrooloose/nerdcommenter'

" -- NERDTabs -- "
Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'

" -- NERDTree Syntax highlight -- "
" 使用 NerdTree syntax highlight 時需安裝 vim-devicons 與 nerd-font
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git'
" -- Vim Dev Iocns -- "
"Plug 'https://github.com/ryanoasis/vim-devicons.git'

" -- Tabular -- "
Plug 'https://github.com/godlygeek/tabular.git'

" -- FZF -- "
Plug 'junegunn/fzf'

" -- Ack -- "
Plug 'mileszs/ack.vim'
" 可安裝 [Silver Searcher](https://github.com/ggreer/the_silver_searcher) 使用 AG

" -- Easymotion -- "
Plug 'https://github.com/easymotion/vim-easymotion.git'

" -- Syntax tool -- "
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'

" -- Formatter -- "
Plug 'https://github.com/Chiel92/vim-autoformat.git'
Plug 'prettier/vim-prettier', {
            \ 'do': 'npm install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" -- Markdown -- "
" Markdown Syntax
Plug 'https://github.com/plasticboy/vim-markdown.git'
" Markdown Preview
Plug 'iamcco/markdown-preview.vim'

" -- Easy Align -- "
Plug 'junegunn/vim-easy-align'

" -- Indent Line -- "
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'

" -- Auto Pairs -- "
Plug 'https://github.com/jiangmiao/auto-pairs.git'

" -- Deoplete -- "
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()


"------------------------------------------------------------------------------"
" Generally setting
"------------------------------------------------------------------------------"
set hlsearch                "高亮度反白
set autoindent              "自動縮排
set nu                      "顯示行號
syntax on                   "語法檢驗
filetype plugin indent on
set tabstop=4               "使用 4 個 spaces 來顯示 tab
set shiftwidth=4            "使用 4 個 spaces 來縮排
set expandtab               "按下 tab 時，使用 4 個 spaces
set smartindent             "Autotabs for certain code
set ignorecase              "忽略大小寫
set mouse=a                 "可以使用滑鼠
set guifont=monaco\ 13      "font: monospace or monaco, size: 13
set fileencodings=utf8,big5 "可以使用 utf8 或是 big5 編碼
set cursorline              "顯示當前游標的行列
set splitright


" -- 顯示 tab, space -- "
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:⎵
" -- Colorscheme setting -- "
set background=dark
set t_Co=256
set t_ut=

colorscheme hybrid_reverse
let g:enable_bold_font = 1
if has ("gui_running")
    let g:enable_italic_font = 1
endif

" -- useing ctrl+[shift]+(x/c/v) -- "
vmap <C-S-x> "+x
vmap <C-S-c> "+y
imap <C-S-v> <Esc> "+gP

" -- leader anc localleader -- "
let mapleader = ','
let maplocalleader='z'

" -- Highlight -- "
let &colorcolumn=81

"------------------------------------------------------------------------------"
" Mapping and Setting
"------------------------------------------------------------------------------"
" -- map F1~F12 function -- "
" switch hlsearch
nmap <F2> :set hlsearch!<CR>
" check format
nmap <F3> :Autoformat<CR>
" switch tab or satpce
nmap <F4> :set expandtab!<CR>
" switch NERDTree
nmap <F8> :NERDTreeToggle<CR>


" -- NerdTree -- "
" window traversal
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
" NerdTree-tab
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_console_startup = 0
" NerdTree syntax highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" Enables folder icon and folder name highlighting
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1


" -- Indent Line -- "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


" -- Syntastic -- "
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_javascript_standard_generic = 1
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exec = 'eslint'


" -- vim-airline -- "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" theme
let g:airline_theme='tomorrow'


" -- Buffer management --"
set hidden
nmap <leader>m :bprevious<CR>
nmap <leader>. :bnext<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>b :ls<CR>:b<Space>

" -- Fugitive --"
set diffopt+=vertical


" -- FZF --"
nmap <leader>f :FZF<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~30%' }


" --  Vim Prettier -- "
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#parser = 'babylon'


" -- Ack -- "
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nmap <leader>a :Ack<Space>
" 指定收尋 eiffel 檔
nmap <leader>e :Ack -G '\.e'<Space>


" -- Vim Markdown -- "
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
" Tabularize
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t; :Tabularize /:<CR>
vmap <leader>t; :Tabularize /:<CR>
nmap <leader>t;; :Tabularize /:\zs<CR>
vmap <leader>t;; :Tabularize /:\zs<CR>
nmap <leader>t, :Tabularize /,<CR>
vmap <leader>t, :Tabularize /,<CR>
nmap <leader>t :TableFormat<CR>
vmap <leader>t :TableFormat<CR>


" -- Easy Motion -- "
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" use hjkl motion and line mtion
map <Localleader>l <Plug>(easymotion-lineforward)
map <Localleader>j <Plug>(easymotion-j)
map <Localleader>k <Plug>(easymotion-k)
map <Localleader>h <Plug>(easymotion-linebackward)
" 'f' for Search first 2 characters
nmap f <Plug>(easymotion-overwin-w)
" 's' for Word motion
nmap s <Plug>(easymotion-overwin-f2)
" search motion
map / <Plug>(easymotion-sn)


" -- Use deoplete -- "
if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif

"------------------------------------------------------------------------------"
" Auto fcitx
" 需安裝 vim-fcitx
"------------------------------------------------------------------------------"
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

function! Fcitx2zh()
    let s:input_status = system("fcitx-remote")
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx-remote -o")
        let g:input_toggle = 0
    endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"進入插入模式
autocmd InsertEnter * call Fcitx2zh()
"------------------------------------------------------------------------------"


