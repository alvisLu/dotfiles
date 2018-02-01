"--------------------------------------------------------------------------------------"
" Plugins
"--------------------------------------------------------------------------------------"
call plug#begin()
" -- Colors themes -- "
" hybrid-theme
Plug 'kristijanhusak/vim-hybrid-material'
" tomarrow
" Manul install to vim/colors
" color scheme git: https://github.com/chriskempson/vim-tomorrow-theme

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

" -- Tabular -- "
Plug 'https://github.com/godlygeek/tabular.git'

" -- FZF -- "
Plug 'junegunn/fzf'

" -- Ack -- "
Plug 'mileszs/ack.vim'

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

" -- Autocomplete -- "
Plug 'https://github.com/Shougo/neocomplete.vim.git'


" -- Deoplete -- "
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()


"--------------------------------------------------------------------------------------"
" Generally settings
"--------------------------------------------------------------------------------------"
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
set mouse=a                 "在Terminal 可以使用滑鼠
set guifont=monospace\ 13   "font: monospace/monaco, size: 13
set fileencodings=utf8,big5 "讓檔案可以使用 utf8 或是 big5 編碼來開啟
set cursorline              "顯示當前指標的行例

" -- 顯示 tab, space -- "
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:⎵
" -- Colorscheme settings -- "
set background=dark
set t_Co=256
set t_ut=

"colorscheme Tomorrow-Night
"colorscheme hybrid_reverse
colorscheme hybrid_material
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


"--------------------------------------------------------------------------------------"
" Mapping and Plugin set
"--------------------------------------------------------------------------------------"
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
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
" NerdTree-tab
let g:nerdtree_tabs_open_on_console_startup = 1


" -- Indent Line -- "
nmap <leader>ig :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


" -- Syntastic -- "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" -- vim-airline -- "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" theme
let g:airline_theme='tomorrow'
"let g:airline_theme = 'hybrid'


" -- Buffer management --"
set hidden
nmap <C-n><C-n> :bnext<CR>
nmap <leader>r :bnext<CR>
nmap <leader>e :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>


" -- Fugitive --"
set diffopt+=vertical


" -- FZF --"
nmap <C-t> :FZF<CR>
nmap <leader>f :FZF<CR>
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'


" --  Vim Prettier -- "
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'


" -- Ack -- "
cnoreabbrev Ack Ack!
nmap <leader>a :Ack -i<Space>


" -- Vim Markdown -- "
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1


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


" -- Auto complete -- "
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
	\ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] ='\h\w*'
" <TAB> completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" -- Use deoplete -- "
if has('nvim')
	let g:deoplete#enable_at_startup = 1
endif

"--------------------------------------------------------------------------------------"
" Auto fcitx
" 需安裝 vim-fcitx
"--------------------------------------------------------------------------------------"
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
"--------------------------------------------------------------------------------------"

