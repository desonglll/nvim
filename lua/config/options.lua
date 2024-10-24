-- 行号设置
vim.wo.number = true -- 显示绝对行号
vim.wo.relativenumber = true -- 显示相对行号

-- 制表符设置
vim.o.tabstop = 4 -- 制表符占用的空格数
vim.o.shiftwidth = 4 -- 使用 << 和 >> 命令时的缩进空格数
vim.o.expandtab = true -- 将制表符转换为空格

vim.opt.iskeyword:append({ "-", "_" })
