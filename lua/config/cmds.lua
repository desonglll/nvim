vim.api.nvim_create_user_command("QuitAll", function()
	vim.api.nvim_command("qa!")
end, { nargs = 0 })
