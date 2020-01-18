# dotfiles

My Linux System Environment Configuration.

## 目錄

### nvim

1. Searching Tool:
    * [ack!](https://beyondgrep.com/install/)
    * [FZF](https://github.com/junegunn/fzf/blob/master/README-VIM.md)

1. 目錄圖示與語法套件: [NERDTree Syntax highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight):
    需安裝 [vim-devicons](https://github.com/ryanoasis/vim-devicons.git) 與 [nerd-fonts](https://github.com/ryanoasis/nerd-fonts#option-7-unofficial-arch-user-repository-aur)

1. [rustfmt](https://github.com/rust-lang/rust.vim):
    Install: `cargo install rustfmt` and `rustup component add rustfmt-preview`


### diff os fancy

1. [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)

### xfce4

1. `terminal/my-terminal.theme` is my XFCE4-terminal theme. It's based on Dark Pastels theme.

    Install to `/usr/share/xfce4/terminal/colorschemes`

### i3

1. ~/.config/i3/config.toml: 需安裝 [i3status-rust](https://github.com/greshake/i3status-rust)

### scripts

1. `git-prompt-colors.sh`: 安裝 bash-git-prompt，並加入到 HOME/
1. fzf-git.sh: [discription](https://junegunn.kr/2016/07/fzf-git/), [code](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236)

    更多的參考: [junegunn.kr](https://junegunn.kr/)

### ThinkPad13

* /etc/X11/xorg.conf.d/30-touchpad.conf: Touchpad 配置
* ~/.Xmodmap: 修改 `CapsLock` => `Ctrl`, `Shift + CapsLock` => `CapsLock`


