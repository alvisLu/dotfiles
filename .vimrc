call plug#begin()

" vim-colors-themes
" -- vim-code-dark
Plug 'tomasiser/vim-code-dark'
" -- vim-hybrid-theme
Plug 'kristijanhusak/vim-hybrid-material'
" -- vim tomarrow
"  install to vim/colors
" https://github.com/chriskempson/vim-tomorrow-theme

" vim-airline and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim-sensible
Plug 'tpope/vim-sensible'

" vim-fugitive"
Plug 'https://github.com/tpope/vim-fugitive.git'

" NERDTreeToggle
Plug 'scrooloose/nerdtree'

"TagbarToggle
Plug 'https://github.com/majutsushi/tagbar.git'

" vim-ctrlp
Plug 'https://github.com/kien/ctrlp.vim.git'

" FZF
Plug 'junegunn/fzf'

" vim-ack
Plug 'mileszs/ack.vim'

" vim-easymotion
Plug 'https://github.com/easymotion/vim-easymotion.git'

" Syntax tool
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'

" formatter
Plug 'https://github.com/Chiel92/vim-autoformat.git'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" vim-Markdown
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/JamshedVesuna/vim-markdown-preview.git'
Plug 'https://github.com/suan/vim-instant-markdown.git'

" markdown tabular
Plug 'https://github.com/godlygeek/tabular.git'

" vim-easy-align
Plug 'junegunn/vim-easy-align'

" indentLine
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'

" Autocomplete plugin
Plug 'https://github.com/Shougo/neocomplete.vim.git'

call plug#end()


" Generally settings
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
" 顯示 tab, space
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:⎵

" Colorscheme settings
set background=dark
set t_Co=256
set t_ut=
" -- Tomorrow
"colorscheme Tomorrow-Night
" -- vim-code-dark
"colorscheme codedark
" --hybrid
"colorscheme hybrid_reverse
let g:enable_bold_font = 1
colorscheme hybrid_material
if has ("gui_running")
    let g:enable_italic_font = 1
endif

set background=dark
set t_Co=256
set t_ut=


" useing ctrl+[shift]+(x/c/v)
vmap <C-S-x> "+x
vmap <C-S-c> "+y
imap <C-S-v> <Esc>"+gp


" Indent Line
" -- vim-indent-guides
nmap <leader>ig :IndentGuidesToggle<cr>
let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" Syntastic
" Default setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" map F1~F12 function
" -- switch hlsearch
nmap <F2> :set hlsearch!<CR>
" -- check format
nmap <F3> :Autoformat<CR>
" -- switch tab or satpce
nmap <F4> :set expandtab!<CR>
" -- switch NERDTree
nmap <F8> :NERDTreeToggle<CR>
" -- switch TagbarToggle
nmap <F9> :TagbarToggle<CR>


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" -- theme
let g:airline_theme='tomorrow'
"let g:airline_theme = 'hybrid'
"let g:airline_theme ='codedark'

" Buffer management
set hidden
nmap <C-n><C-n> :bnext<cr>
nmap <C-n>n :bnext<cr>
nmap <leader>] :bnext<CR>
nmap <leader>[ :bprevious<CR>
nmap <leader>q :bp <BAR> bd #<CR>


" Ctrl P
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
	\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
	\}
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs f:CtrlPMRU<cr>


" vim-prettier
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 4
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'


" Ack
cnoreabbrev Ack Ack!
nmap <leader>a :Ack -i<Space>


" Markdown preview
" -- vim-instant-markdown
let g:instant_markdown_autostart = 0 " manually trigger preview via the command `:InstantMarkdownPreview`
" -- vim-markdown
let g:instant_markdown_open_to_the_world = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1


" Easy Motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" jk motion and line mtion
let mapleader='z'
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" 'f' for Search first 2 characters
nmap f <Plug>(easymotion-overwin-w)
" 's' for Word motion
nmap s <Plug>(easymotion-overwin-f2)
" search motion
map / <Plug>(easymotion-sn)


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
"
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


" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
