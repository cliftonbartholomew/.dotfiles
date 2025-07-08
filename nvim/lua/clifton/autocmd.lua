-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local FormatOnSave = augroup("FormatOnSave", {})
local YankGroup = augroup("HighlightYank", {})
local LspGroup = augroup("Lsp", {})

-- highlight yanked text
autocmd("TextYankPost", {
	group = YankGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- remove trailing whitespace on save
autocmd({ "BufWritePre" }, {
	group = FormatOnSave,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- auto format on save
autocmd({ "BufWritePre" }, {
	group = FormatOnSave,
	pattern = "*",
	command = [[lua vim.lsp.buf.format()]],
})
