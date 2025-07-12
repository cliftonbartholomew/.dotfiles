return {

	-- tokyonight colorscheme
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				transparent = true, -- Enable transparent background
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})

			vim.cmd.colorscheme("tokyonight-night")
		end,
	},

	-- neoscroll
	{
		"karb94/neoscroll.nvim",
		opts = {
			mappings = {
				"<C-u>", -- Scroll up half a page
				"<C-d>", -- Scroll down half a page
				"<C-b>", -- Scroll up a full page
				"<C-f>", -- Scroll down a full page
				"<C-y>", -- Scroll up one line
				"<C-e>", -- Scroll down one line
				"zt", -- Scroll to the top of the screen
				"zz", -- Scroll to the center of the screen
				"zb", -- Scroll to the bottom of the screen
			},
			hide_cursor = true, -- Hide the cursor while scrolling
			respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			duration_multiplier = 1.0, -- Global duration multiplier
			easing = "linear", -- Default easing function
			pre_hook = nil, -- Function to run before the scrolling animation starts
			post_hook = nil, -- Function to run after the scrolling animation ends
			performance_mode = false, -- Disable "Performance Mode" on all buffers.
			ignored_events = { -- Events ignored while scrolling
				"WinScrolled",
				"CursorMoved",
			},
		},
	},

	-- which-key.nvim
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VeryLazy", -- Sets the loading event to 'VimEnter'
		opts = {
			-- delay between pressing a key and opening which-key (milliseconds)
			-- this setting is independent of vim.o.timeoutlen

			delay = 0,

			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = {},
			},
		},
		-- Document existing key chains
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add({
				{ "<leader>g", group = "[G]it" },
				{ "<leader>a", group = "[A]vante" },
				{ "<leader>c", group = "[C]opilot" },
				{ "<leader>n", group = "[N]vim-tree" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
			})
		end,
	},

	-- used for modern folding functionality
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "lsp", "indent" }
				end,
			})
		end,
	},
}
