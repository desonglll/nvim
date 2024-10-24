local current_hour = tonumber(os.date("%H")) -- 获取当前小时
if current_hour >= 5 and current_hour < 12 then
	vim.cmd([[colorscheme tokyonight-moon]])
elseif current_hour >= 12 and current_hour < 18 then
	vim.cmd([[colorscheme tokyonight-moon]])
else
	vim.cmd([[colorscheme tokyonight-moon]])
end
