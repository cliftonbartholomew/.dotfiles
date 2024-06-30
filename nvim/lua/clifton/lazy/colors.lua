function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
		end,
	},

	-- rose-pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
		end,
	},

	-- gruvbox
	{
		"npxbr/gruvbox.nvim",
		requires = { "rktjmp/lush.nvim" },
		config = function()
			vim.g.gruvbox_contrast_dark = "hard"
			vim.g.gruvbox_contrast_light = "hard"
			vim.g.gruvbox_italic = 1
			vim.g.gruvbox_invert_selection = 0
			vim.g.gruvbox_invert_tabline = 0
			vim.g.gruvbox_invert_signs = 0
			vim.g.gruvbox_invert_indent_guides = 0
			vim.g.gruvbox_italicize_strings = 0
			vim.g.gruvbox_italicize_comments = 0
			vim.g.gruvbox_italicize_variables = 0
			vim.g.gruvbox_transparent = 0
			vim.g.gruvbox_undercurl = 1
			vim.g.gruvbox_underline = 1
			vim.g.gruvbox_bold = 1
			vim.g.gruvbox_hide_inactive_statusline = 0
			vim.g.gruvbox_hide_end_of_buffer = 0
			vim.g.gruvbox_dark_sidebar = 1
			vim.g.gruvbox_dark_float = 1
			vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }

			vim.cmd("colorscheme gruvbox")

			ColorMyPencils()
		end,
	},
}
