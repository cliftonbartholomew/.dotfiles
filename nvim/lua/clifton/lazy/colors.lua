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
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})

			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
