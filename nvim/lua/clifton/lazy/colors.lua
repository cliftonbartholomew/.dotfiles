return {

	-- gruvbox
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	name = "gruvbox",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- change sign highlight with gruvbox defaults
	--
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },

	-- catppuccin
	-- {
	--     {
	--         "catppuccin/nvim",
	--         name = "catppuccin",
	--         priority = 1000,
	--         config = function()
	--             vim.cmd("colorscheme catppuccin")
	--         end,
	--     },
	-- },

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
