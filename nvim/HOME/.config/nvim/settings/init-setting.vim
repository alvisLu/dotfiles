" -- Generally setting -- "
set hlsearch
set autoindent
set nu
set ruler
syntax on
set splitright

set ignorecase
set smartcase
set mouse=a "可以使用滑鼠
set fileencodings=utf8,big5
set cursorline

" Indent and tab/sapce
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cindent

" Show the tab and space
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:⎵

" Colorscheme
set background=dark
colorscheme hybrid_reverse
"set termguicolors

" ctrl+shift+(x/c/v)
vmap <C-x> "+x
vmap <C-c> "+y
imap <C-s-v> <Esc> "+gP

" Copy to clipboard
vnoremap <leader>y  "+y
nnoremap <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Leader anc Localleader
let mapleader = ','
let maplocalleader='z'
" Highlight column
let &colorcolumn="80,100"

" -- Mapping -- "
" Switch hlsearch
nmap <F2> :set hlsearch!<CR>
" Switch tab or satpce
nmap <F4> :set expandtab!<CR>
" Switch NERDTree
nmap <F8> :NERDTreeToggle<CR>

" -- Buffer management --"
nmap <leader>m :bprevious<CR>
nmap <leader>. :bnext<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>s :ls<CR>:b<Space>

" -- NerdTree -- "
" Window traversal
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
" NerdTree-git
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusWithFlags = 1
" -- NERDCommenter -- "
let g:NERDCustomDelimiters={
  \ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
  \ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
  \}

" -- vim-airline -- "
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='tomorrow'

" -- Indent Line -- "
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" -- closetag -- "
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.mjs,*.ts,*.vue,*.html.erb,*.md'

" -- Fugitive --"
set diffopt+=vertical

" -- FZF --"
nmap <C-p> :FZF<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~30%' }
" should be install [The Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher)
nmap <leader>s :Ag<Space>

" -- Ack -- "
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nmap <leader>a :Ack -i<Space>

" -- Vim Markdown -- "
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

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

" Terraform auto FMT
let g:terraform_fmt_on_save=1

let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_sign_column_always = 1
"let g:gitgutter_eager = 1
autocmd BufRead,BufNewFile * setlocal signcolumn=yes
autocmd FileType tagbar,nerdtree setlocal signcolumn=no

" COC
" -- coc nvm -- "
"autocmd CursorHold * silent call CocActionAsync('highlight')
let g:coc_global_extensions = [
  "\ 'coc-highlight',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  "\ 'coc-yank',
  \ ]

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>z  <Plug>(coc-codeaction-selected)
nmap <leader>z  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
