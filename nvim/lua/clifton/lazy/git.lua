return {
	-- fugitive
	{
		"tpope/vim-fugitive",
		config = function()
			-- pull
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gl",
				":Git pull<CR>",
				{ noremap = true, silent = true, desc = "[G]it pul[L]" }
			)
			-- push
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gp",
				":Git push<CR>",
				{ noremap = true, silent = true, desc = "[G]it [P]ush" }
			)

			-- status
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gs",
				":G<CR>",
				{ noremap = true, silent = true, desc = "[G]it [S]tatus" }
			)

			-- diff
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gd",
				":Gvdiffsplit<CR>",
				{ noremap = true, silent = true, desc = "[G]it [D]iff" }
			)
		end,
	},

	-- See `:help gitsigns` to understand what the configuration keys do
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
