[about tab and buffer](https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/)

## Build latest neovim

[Build](https://github.com/neovim/neovim/blob/master/BUILD.md)

## Terminal environment initialization

```shell
apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # For zsh
```

### Install Nodejs

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash # Install nvm for nodejs
```

### Install repgrep

```
sudo apt install ripgrep
```

### Install Rust

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## neo-vim commands

- `:set paste` : For avoid wrong paste format when paste something.

## neo-vim hotkeys

### :help

**使用 `:helptags`**：如果你安装了额外的插件并且帮助文件没有自动更新，你可以运行 `:helptags` 命令来生成帮助标签。

- `gj/k`: Go to the next line in current line.
- `gi`: Go to previous insert place and turn into insert mode.
- `CTRL-]`：跳转到光标下的标签。
- `CTRL-o`：返回到上一个位置。
- `CTRL-i`：前进到下一个位置。
- `CTRL-^`：切换到最后一个访问的缓冲区。

### windows move

- `<C-w>L` 将当前窗口移动到右侧的窗口位置
