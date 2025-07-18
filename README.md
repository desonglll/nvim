## Requirement

- nodejs

```shell
sudo apt update

sudo apt update && sudo apt upgrade -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.12 python3.12-venv python3.12-dev -y

sudo apt install git build-essential unzip
```

## Rust snippets

```rust
fn main(){
    println!("hello world")
}
```

## Utils

Go to `keymaps.lua` to enable cowboy discipline.

## Keymap

### Editor

`s` Delete the character under the cursor and enter Insert mode

`cl` Delete the character under the cursor and enter Insert mode

`S` Delete the entire line and enter Insert mode

`cc` Delete the entire line and enter Insert mode

`c$` Change from the cursor position to the end of the line and enter Insert mode

`c0` Change from the cursor position to the beginning of the line and enter Insert mode

`ciw` Change the entire word under the cursor and enter Insert mode

`cw` Change from the cursor position to the end of the current word and enter Insert mode

`ci"` Change the text inside double quotes and enter Insert mode

`ci'` Change the text inside single quotes and enter Insert mode

`ci(` Change the text inside parentheses and enter Insert mode

`ci[` Change the text inside square brackets and enter Insert mode

`ci{` Change the text inside curly braces and enter Insert mode

`caw` Change the word under the cursor and the space after it and enter Insert mode

`c3w` Change the next 3 words and enter Insert mode

`c}` Change from the cursor to the end of the paragraph and enter Insert mode

`cG` Change from the cursor to the end of the file and enter Insert mode

`cgg` Change from the cursor to the beginning of the file and enter Insert mode

`cfx` Change from the cursor to before the next occurrence of character `x` and enter Insert mode

`d` Delete text (without entering Insert mode)

`x` Delete single character under the cursor (without entering Insert mode)

`C` Change to the end of the line (equivalent to `c$`)

`S` Change the whole line (equivalent to `cc`)

`dd` Delete the current line (without entering Insert mode)

`dw` Delete from the cursor to the end of the current word (without entering Insert mode)

`d$` Delete from the cursor to the end of the line (without entering Insert mode)

`d0` Delete from the cursor to the beginning of the line (without entering Insert mode)

`d^` Delete from the cursor to the first non-blank character of the line (without entering Insert mode)

`dgg` Delete from the cursor to the beginning of the file (without entering Insert mode)

`dG` Delete from the cursor to the end of the file (without entering Insert mode)

`d}` Delete from the cursor to the end of the paragraph (without entering Insert mode)

`diw` Delete the entire word under the cursor (without entering Insert mode)

`di"` Delete inside double quotes (without entering Insert mode)

`di'` Delete inside single quotes (without entering Insert mode)

`di(` Delete inside parentheses (without entering Insert mode)

`di[` Delete inside square brackets (without entering Insert mode)

`di{` Delete inside curly braces (without entering Insert mode)

`daw` Delete the word under the cursor including trailing space (without entering Insert mode)

`yy` Yank (copy) the current line

`yw` Yank from the cursor to the end of the current word

`y$` Yank from the cursor to the end of the line

`y0` Yank from the cursor to the beginning of the line

`p` Paste after the cursor

`P` Paste before the cursor

`>>` Indent the current line to the right

`<<` Indent the current line to the left

`~` Toggle case of the character under the cursor

`u` Undo the last change

`Ctrl-r` Redo undone changes

`.` Repeat the last change

`>>` Indent current line (normal mode)

`<<` Un-indent current line (normal mode)

`=` Auto-indent current line or selection

`ci(` Change inside parentheses and enter Insert mode (already listed but common)

`viw` Visual select inner word

`vaw` Visual select a word including spaces

`gg` Go to beginning of file

`G` Go to end of file

`H` Go to top of screen

`M` Go to middle of screen

`L` Go to bottom of screen

`^` Go to first non-blank character of line

`0` Go to beginning of line

`$` Go to end of line

`w` Move to start of next word

`b` Move to start of previous word

`%` Jump between matching parentheses, brackets, or braces

`/pattern` Search forward for pattern

`?pattern` Search backward for pattern

`n` Repeat last search in same direction

`N` Repeat last search in opposite direction

`za` Toggle folding at cursor

`zf` Create fold (visual select lines then `zf`)

`zR` Open all folds

`zM` Close all folds

`:w` Write (save) file

`:q` Quit

`:wq` Write and quit

`:q!` Quit without saving

`ZZ` Write and quit (shortcut)

`Ctrl-o` Jump back in jump list

`Ctrl-i` Jump forward in jump list

`m{a-z}` Mark current position with letter {a-z}



### Windows Buffers Tabs

`:new` Create a new horizontal window

`:vnew` Create a new vertical window

`<C-w>s` Create a new horizontal window

`<C-w>v` Create a new vertical window

`<C-w>T` Make a new tab and display current buffer full screen

`:close` Close a window

`:tabnew` Create a new tab

`:tabe` Edit a file in a new tab

`gt` Go to next tab

`gT` Go to previous tab

`:bprevious` Go to previous buffer

`:bnext` Go to next buffer

`:bNext` Go to next buffer

`:bdelete` Delete buffer

`<Tab>` Next Buffer

`<S-Tab>` Next Buffer

`<leader>e` Neotree toggle

