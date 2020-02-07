" vim-plug automatic installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

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

" -- NERD -- "
" NERDTreeToggle
Plug 'scrooloose/nerdtree'
" NERDCommenter
Plug 'scrooloose/nerdcommenter'
" NERDTabs
Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'
" NERDTree Syntax highlight
" 安裝 vim-devicons 與 nerd-font
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git'
" vim-deviocns
"Plug 'ryanoasis/vim-devicons'
" -- Tabular -- "
Plug 'https://github.com/godlygeek/tabular.git'
" -- FZF -- "
Plug 'junegunn/fzf'
" -- Ack -- "
" 可安裝 Silver Searcher(https://github.com/ggreer/the_silver_searcher) 使用 AG
Plug 'mileszs/ack.vim'
" -- Easymotion -- "
Plug 'https://github.com/easymotion/vim-easymotion.git'

" -- Syntax tool -- "
Plug 'scrooloose/syntastic'
"Plug 'rust-lang/rust.vim'
Plug 'alvan/vim-closetag'
" js, ts
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'

" -- coc nvim -- "
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Settings
for fpath in split(globpath('~/.config/nvim/settings', '*.vim'), '\n')
    exe 'source' fpath
  endfor
