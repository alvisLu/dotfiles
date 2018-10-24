# Linux System Environment Configuration

My Linux System Environment Configuration.


## 參考

### Thinkpad13

* 30-touchpad.conf: Touchpad 設定 (path: /etc/X11/xorg.conf.d/30-touchpad.conf)

### vim

1. Plugin Manager: [Vim-plugin](https://github.com/junegunn/vim-plug)
1. Searching tool:
    * [ack!](https://beyondgrep.com/install/)
    * [FZF](https://github.com/junegunn/fzf/blob/master/README-VIM.md)
1. 目錄圖示與語法套件: [NERDTree Syntax highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight):
    需安裝 [vim-devicons](https://github.com/ryanoasis/vim-devicons.git) 與 [nerd-fonts](https://github.com/ryanoasis/nerd-fonts#option-7-unofficial-arch-user-repository-aur)

1. [rustfmt](https://github.com/rust-lang/rust.vim):
    Install: `cargo install rustfmt` and `rustup component add rustfmt-preview`


### tmux

使用套件:

1. Plugin Manager: [tpm](https://github.com/tmux-plugins/tpm)

如果懶的了解設定與配置方式，可以使用 [.tmux](https://github.com/gpakosz/.tmux) 的設定與配置。

### tmuxifier

1. [tmuxifier](https://github.com/jimeh/tmuxifier.git)

### diff os fancy

1. [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)

### xfce4

1. terminal/my-terminal.theme is my XFCE4-terminal theme. It's based on Dark Pastels theme.

    Install to `/usr/share/xfce4/terminal/colorschemes`

### scripts

1. fzf-git.sh: [discription](https://junegunn.kr/2016/07/fzf-git/), [code](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236)
    
    更多的參考: [junegunn.kr](https://junegunn.kr/)
