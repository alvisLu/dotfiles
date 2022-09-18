" vim-plug automatic installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

" -- Color Themes -- "
" color themes
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'EdenEast/nightfox.nvim'

" -- Airline and themes -- "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" -- NERD -- "
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"  使用 vim-devicons 系統需安裝 nerd-font
"Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" -- Indent Line -- "
Plug 'Yggdroot/indentLine'
" -- FZF -- "
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" -- Ack -- "
" 可安裝 Silver Searcher(https://github.com/ggreer/the_silver_searcher) 使用 AG
Plug 'mileszs/ack.vim'

" -- Easymotion -- "
Plug 'easymotion/vim-easymotion.git'
" -- show git blame message --"
Plug 'rhysd/git-messenger.vim'

" -- tmux -- "
Plug 'christoomey/vim-tmux-navigator'


" -- Syntax tool -- "
Plug 'pangloss/vim-javascript'
" Markdown "
Plug 'plasticboy/vim-markdown.git'


" -- Tabular -- "
Plug 'godlygeek/tabular.git'
" -- Easy Align -- "
Plug 'junegunn/vim-easy-align'
" -- vim closetag -- "
Plug 'alvan/vim-closetag'
" -- Markdown Preview -- "
Plug 'iamcco/markdown-preview.vim'


" -- coc nvim -- "
Plug 'neoclide/coc.nvim'
Plug 'honza/vim-snippets'

"Plug 'dense-analysis/ale'
"Plug 'Shougo/deoplete.nvim'

call plug#end()

" Settings
for fpath in split(globpath('~/.config/nvim/settings', '*.vim'), '\n')
    exe 'source' fpath
endfor

