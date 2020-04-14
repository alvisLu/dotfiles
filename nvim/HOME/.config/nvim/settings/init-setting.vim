" -- Generally setting -- "
set hlsearch
set autoindent
set nu
set ruler
syntax on
"set termguicolors
set ignorecase
set smartcase
set mouse=a "可以使用滑鼠
set fileencodings=utf8,big5
set cursorline

" Indent
filetype plugin indent on
set tabstop=4    "使用 4 個 spaces 來顯示 tab
set shiftwidth=4 "使用 4 個 spaces 來縮排
set expandtab    "按下 tab 時，使用 4 個 spaces
set smartindent  "Autotabs for certain code

" Show the tab and space
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:⎵

" Colorscheme
set background=dark
colorscheme hybrid_reverse

" ctrl+shift+(x/c/v)
vmap <C-S-x> "+x
vmap <C-S-c> "+y
imap <C-S-v> <Esc> "+gP

" Leader anc Localleader
let mapleader = ','
let maplocalleader='z'
" Highlight column
let &colorcolumn="80,100"

" -- Mapping -- "
" Switch hlsearch
nmap <F2> :set hlsearch!<CR>
" Check format
nmap <F3> :Autoformat<CR>
" Switch tab or satpce
nmap <F4> :set expandtab!<CR>
" Switch NERDTree
nmap <F8> :NERDTreeToggle<CR>


" -- NerdTree -- "
" Window traversal
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


" -- NERDCommenter -- "
let g:NERDCustomDelimiters={
  \ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
  \ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
  \}

" vue commenter
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction

function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

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


" -- closetag -- "
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.ts,*.vue,*.html.erb,*.md'


" -- vim-airline -- "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='tomorrow'


" -- Buffer management --"
set hidden
nmap <leader>m :bprevious<CR>
nmap <leader>. :bnext<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>s :ls<CR>:b<Space>


" -- Fugitive --"
set diffopt+=vertical


" -- FZF --"
nmap <C-p> :FZF<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~30%' }


" -- coc nvm -- "
"autocmd CursorHold * silent call CocActionAsync('highlight')


" -- typescript-vim -- "
let g:typescript_ignore_browserwords = 1


" -- Vim Prettier -- "

nmap <leader>[ :Prettier<CR>
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#parser = 'flow'
autocmd BufWritePre *.vue,*.js,*.jsx,*ts,*tsx,*.json,*.css,*.scss,*.sass,*.html,*.yaml,*.graphql Prettier


" -- Ack -- "
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nmap <leader>a :Ack -i<Space>
" 指定收尋 xxx 檔
" :Ack -G '\.xxx'


" -- Vim Markdown -- "
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0



" -- Tabularize -- "
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
" search motion
map / <Plug>(easymotion-sn)

" -- vimux -- "
 map <Leader>vp :VimuxPromptCommand<CR>
 map <Leader>vl :VimuxRunLastCommand<CR>
 map <Leader>vi :VimuxInspectRunner<CR>
 map <Leader>vq :VimuxCloseRunner<CR>
 map <Leader>vx :VimuxInterruptRunner<CR>
 map <Leader>vz :call VimuxZoomRunner()<CR>

" -- Use deoplete -- "
let g:deoplete#enable_at_startup = 1

" -- neosnippet -- "
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
