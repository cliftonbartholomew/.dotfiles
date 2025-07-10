return {
	-- ~/.config/nvim/lua/plugins/copilot.lua
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
						jump_prev = "[[",
					},
				},
			})
		end,
	},
	--
	-- ~/.config/nvim/lua/plugins/copilot-chat.lua
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		cmd = { "CopilotChat", "CopilotChatToggle" },
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- required backend
			{ "nvim-lua/plenary.nvim" }, -- utility
		},
		opts = {
			window = {
				layout = "vertical", -- or 'float' or 'horizontal'
				width = 0.5,
			},
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
			{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
			{ "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Fix code" },
			{ "<leader>cr", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor code" },
			{ "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
		},
	},
}
