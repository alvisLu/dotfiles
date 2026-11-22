# dotfiles

My Linux System Environment Configuration.

## 目錄

### bash

my `.bashrc`

### bash-git-prompt

- 需安裝 [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)

### diff-os-fancy

- 安裝 [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) 後並執行 `util.sh`。

### herdr

- [herdr](https://herdr.dev) 設定，按鍵跟 tmux 對齊（prefix `C-a`）。
- `local-plugins/notify-focus`: agent 完成或需要回應時發 macOS 通知，點了跳到該 pane。需 `brew install terminal-notifier`。
- `.tmux/open-fileref-herdr.sh`: herdr `prefix + g` 的 popup，用 fzf 選 pane 輸出裡的 `path:line`，用 VSCode 開。
- 安裝的 plugin 記在 herdr 自己管的 `plugins.json`，不進 repo，新機器要手動裝：

  ```sh
  herdr plugin link ~/.config/herdr/local-plugins/notify-focus
  herdr plugin install ChmaraX/herdr-nvim
  herdr plugin install kryptamine/herdr-auto-title
  herdr plugin install JonasBaeumer/herdr-file-annotator
  ```

### i3

- 安裝 `i3-gaps`, `i3lock`, `i3status`, `dmenu`, `playerctl`, `feh`, `powerline-fonts`, `speedtest-cli`, `lxappearance`, `gsimplecal`

AUR: `ttf-font-awesome-4`, `i3status-rust`,

### nvim

- 環境需先安裝

  - vim-fcitx
  - [ack!](https://beyondgrep.com/install/)
  - [FZF](https://github.com/junegunn/fzf/blob/master/README-VIM.md)

- 目錄圖示與語法套件: [NERDTree Syntax highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight):
  需安裝 [vim-devicons](https://github.com/ryanoasis/vim-devicons.git) 與 [nerd-fonts](https://github.com/ryanoasis/nerd-fonts#option-7-unofficial-arch-user-repository-aur)

- [rustfmt](https://github.com/rust-lang/rust.vim):
  Install: `cargo install rustfmt` and `rustup component add rustfmt-preview`

### scripts

- fzf-git.sh: [discription](https://junegunn.kr/2016/07/fzf-git/), [code](https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236)

  更多的參考: [junegunn.kr](https://junegunn.kr/)

- git-fuzzy/git-fuzzy-config.sh: [git-fuzzy](https://github.com/bigH/git-fuzzy) 的按鍵設定，把預設的 `Alt-*` 改成 `Ctrl-*`。

  需先 clone git-fuzzy 到 `~/git/git-fuzzy` 並將 `bin` 加入 `PATH`（見 `.zshrc`）。
  git-fuzzy 只會讀「當前工作目錄」下的 `.git-fuzzy-config`，所以這份設定是由 `.zshrc` source 進來以取得全域效果；
  若只想覆蓋單一 repo，可在該 repo 根目錄 symlink 成 `.git-fuzzy-config`。

### tumx

需安裝 [tmp](https://github.com/tmux-plugins/tpm)

### xfce4

- `/usr/share/xfce4/terminal/colorschemes/my-terminal.theme` 1s my XFCE4-terminal theme.
  It's based on Dark Pastels theme. Install to `/usr/share/xfce4/terminal/colorschemes`

### Xmodmap

`.Xmodmap`: 交換左 Ctrl 與 Caps Lock，並在 `.xinitrc` 中加入執行。

### xinit

my xinit config

### ThinkPad13

- `/etc/X11/xorg.conf.d/30-touchpad.conf`: Touchpad 配置
