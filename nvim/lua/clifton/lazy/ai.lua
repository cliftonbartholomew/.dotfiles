return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		build = ":Copilot auth", -- login prompt after install
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true, -- suggestions show up automatically as you type
					debounce = 75,
					keymap = {
						accept = "<C-l>", -- Accept suggestion
						next = "<M-]>", -- Next suggestion
						prev = "<M-[>", -- Previous suggestion
						dismiss = "<C-]>", -- Dismiss suggestion
					},
				},
				panel = {
					enabled = true,
					auto_refresh = true, -- refresh panel as you type
					keymap = {
						open = "<M-CR>", -- open the panel manually
						accept = "<CR>", -- accept a suggestion
						refresh = "gr", -- reload suggestions
						jump_next = "]]",
					},
					jump_prev = "[[",
				},
			})
		end,
	},
	{
		"yetone/avante.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = { file_types = { "markdown", "Avante" } },
				ft = { "markdown", "Avante" },
			},
		},
		build = "make",
		opts = { provider = "copilot" },
	},
}
