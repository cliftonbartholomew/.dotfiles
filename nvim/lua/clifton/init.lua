require("clifton.set")
require("clifton.remap")
require("clifton.lazy_init")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local FormatOnSave = augroup("FormatOnSave", {})
local YankGroup = augroup("HighlightYank", {})
local CopilotGroup = augroup("Copilot", {})
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

-- remove relative line numbers and line numbers in copilot
autocmd("BufEnter", {
	group = CopilotGroup,
	pattern = "copilot-chat",
	command = [[set norelativenumber nonu]],
})

-- LSP keybindings
autocmd("LspAttach", {
	group = LspGroup,
	callback = function(e)
		-- navigation
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, { noremap = true, silent = true, desc = "go to definition" })

		-- hover
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { noremap = true, silent = true, desc = "show hover" })

		-- diagnostics
		vim.keymap.set("n", "<leader>rd", function()
			vim.diagnostic.open_float()
		end, { noremap = true, silent = true, desc = "open diagnostics" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, { noremap = true, silent = true, desc = "go to next diagnostic" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, { noremap = true, silent = true, desc = "go to previous diagnostic" })

		-- references
		vim.keymap.set("n", "<leader>re", function()
			vim.lsp.buf.references()
		end, { noremap = true, silent = true, desc = "add references to quickfix" })

		-- refactor, format, and code action
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, { noremap = true, silent = true, desc = "refactor identifier" })
		vim.keymap.set("n", "<F3>", function()
			vim.lsp.buf.format()
		end, { noremap = true, silent = true, desc = "format buffer" })
		vim.keymap.set("n", "<F4>", function()
			vim.lsp.buf.code_action()
		end, { noremap = true, silent = true, desc = "open code action" })
	end,
})
