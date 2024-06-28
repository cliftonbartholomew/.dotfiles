return {
	-- git
	{
		"tpope/vim-fugitive",
		config = function()
			-- pull
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gl",
				":Git pull<CR>",
				{ noremap = true, silent = true, desc = "git pull" }
			)
			-- push
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gp",
				":Git push<CR>",
				{ noremap = true, silent = true, desc = "git push" }
			)

			-- status
			vim.api.nvim_set_keymap("n", "<leader>gg", ":G<CR>", { noremap = true, silent = true, desc = "git status" })

			-- diff
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gd",
				":Gvdiffsplit<CR>",
				{ noremap = true, silent = true, desc = "git diff" }
			)
		end,
	},
}
