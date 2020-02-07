# dotfiles

My Linux System Environment Configuration.

## 目錄

### bash

my `.bashrc`

### bash-git-prompt

* 需安裝 [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)

### diff-os-fancy

* 安裝 [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) 後並執行 `util.sh`。

### i3

* 安裝 `i3-gaps`, `i3status-rust` ,`dmenu`, `lxappearance`, `gsimplecal`

### nvim

* 環境需先安裝

    * vim-fcitx
    * [ack!](https://beyondgrep.com/install/)
    * [FZF](https://github.com/junegunn/fzf/blob/master/README-VIM.md)

* 目錄圖示與語法套件: [NERDTree Syntax highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight):
    需安裝 [vim-devicons](https://github.com/ryanoasis/vim-devicons.git) 與 [nerd-fonts](https://github.com/ryanoasis/nerd-fonts#option-7-unofficial-arch-user-repository-aur)

* [rustfmt](https://github.com/rust-lang/rust.vim):
    Install: `cargo install rustfmt` and `rustup component add rustfmt-preview`

### scripts

* fzf-git.sh: [discription](https://junegunn.kr/2016/07/fzf-git/), [code](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236)

    更多的參考: [junegunn.kr](https://junegunn.kr/)

### tumx

需安裝 [tmp](https://github.com/tmux-plugins/tpm)

### xfce4

* `/usr/share/xfce4/terminal/colorschemes/my-terminal.theme` is my XFCE4-terminal theme.
It's based on Dark Pastels theme. Install to `/usr/share/xfce4/terminal/colorschemes`

### Xmodmap

`.Xmodmap`: 交換左 Ctrl 與 Caps Lock，並在 `.xinitrc` 中加入執行。

### xinit

my xinit config

### ThinkPad13

* `/etc/X11/xorg.conf.d/30-touchpad.conf`: Touchpad 配置


