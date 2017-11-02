

hi clear
if exists("syntax_on")
    syntax reset
endif

runtime plugged/vim/colors/dracula.vim
let g:colors_name = "my-dracula"

hi Comment ctermfg=DarkGrey guifg=#608b41 guibg=NONE gui=italic
"green:#60b84e gray: #666666
hi Search ctermbg=160 guifg=#19191d guibg=#ff5555 gui=bold,underline
