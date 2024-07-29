return {
	--telescope (file searching)
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
					layout_strategy = "flex",
					layout_defaults = {
						horizontal = {
							preview_width = 0.55,
						},
					},
					file_sorter = require("telescope.sorters").get_fzy_sorter,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search file names" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep file contents" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help docs" })
			vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Search registers" })
			vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Search commands" })
			-- while in telescope <C-q> will add search to quickfix list
		end,
	},
}
