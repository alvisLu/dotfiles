" Vundle settings
" install plugins :`PluginInstall`
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" syntax tool
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
" theme
Plugin 'tomasiser/vim-code-dark'
" Boshiamy Input
Plugin 'pi314/boshiamy.vim'

Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'L9'
"Plugin 'FuzzyFinder'
Plugin 'ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'taglist.vim'
Plugin 'tagbar'
Plugin 'mileszs/ack.vim'
"Plugin 'eugen0329/vim-esearch'
call vundle#end()
filetype plugin indent on


" Generally set
set hlsearch              "高亮度反白
set autoindent            "自動縮排
set nu                    "顯示行號
syntax on                 "語法檢驗
set tabstop=4             "使用 4 個 spaces 來顯示 tab
set shiftwidth=4          "使用 4 個 spaces 來縮排
set expandtab             "按下 tab 時，使用 4 個 spaces
set smartindent           "Autotabs for certain code
set ignorecase            "忽略大小寫
set mouse=a               "在Terminal 可以使用滑鼠
set guifont=monospace\ 15 "gvim font size
" Color setting
set t_Co=256
set t_ut=
colorscheme codedark


" Boshiamy
"set statusline=%<%{boshiamy#status()}%f\ %h%m%r%=%y\ %-14.(%l,%c%V%)\ %P
"let g:boshiamy_toggle_english = ',,'
"let g:boshiamy_select_mode = ',m'
"let g:boshiamy_cancel_input = '<C-h>'


" map F1~F12 function 
nmap <F2> :set hlsearch!<CR> " no hlsearch
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>


" vim-airline 
set hidden
" theme
let g:airline_theme = 'codedark'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" Buffer management
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
nmap <leader>bs :CtrlPMRU<cr>


" Ack
cnoreabbrev Ack Ack!
nmap <leader>a :Ack<Space>


" Markdown preview 
let g:instant_markdown_autostart = 0  " manually trigger preview via the command `:InstantMarkdownPreview`


" Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable defautl mappings
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature
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
map  / <Plug>(easymotion-sn)
