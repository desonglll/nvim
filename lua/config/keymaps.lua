local opts = { noremap = true, silent = true, desc = "Uncomment" }
local keymap = vim.keymap

-- visual模式下缩进代码
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
-- 上下移动选中文本
keymap.set("v", "J", ":move '>+1<cr>gv-gv", opts)
keymap.set("v", "K", ":move '<-2<cr>gv-gv", opts)
