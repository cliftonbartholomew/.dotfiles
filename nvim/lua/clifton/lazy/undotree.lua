return {
	-- undotree
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undo tree toggle" })
		end,
	},
}
