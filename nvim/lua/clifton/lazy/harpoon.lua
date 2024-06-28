return {
	-- harpoon (quick mark)
	{
		"ThePrimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			vim.keymap.set(
				"n",
				"<leader>a",
				mark.add_file,
				{ noremap = true, silent = true, desc = "add file to harpoon" }
			)
			vim.keymap.set(
				"n",
				"<C-f>",
				ui.toggle_quick_menu,
				{ noremap = true, silent = true, desc = "toggle harpoon files" }
			)
			require("harpoon").setup({})
		end,
	},
}
