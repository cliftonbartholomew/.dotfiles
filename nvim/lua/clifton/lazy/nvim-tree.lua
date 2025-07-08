return {
	-- nvim tree (file/folder navigation)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
			vim.keymap.set(
				"n",
				"<leader>nn",
				":NvimTreeToggle<CR>",
				{ noremap = true, silent = true, desc = "toggle [N]vimTree" }
			)
		end,
	},
}
