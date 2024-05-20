require("clifton.set")
require("clifton.remap")
require("clifton.lazy_init")

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- reload module
function R(name)
    require("plenary.reload").reload_module(name)
end

-- add templ filetype
vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

-- highlight yanked text
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- remove trailing whitespace on save
autocmd({ "BufWritePre" }, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- auto format on save
autocmd({ "BufWritePre" }, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[lua vim.lsp.buf.format()]],
})

-- LSP keybindings
autocmd('LspAttach', {
    group = ThePrimeagenGroup,
    callback = function(e)
        local opts = { buffer = e.buf }

        -- navigation (either via gd or <leader>rf)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { noremap = true, silent = true, desc = "go to definition" })
        vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.definition() end,
            { noremap = true, silent = true, desc = "go to definition" })

        -- hover
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
            { noremap = true, silent = true, desc = "show hover" })

        -- diagnostics
        vim.keymap.set("n", "<leader>rd", function() vim.diagnostic.open_float() end,
            { noremap = true, silent = true, desc = "open diagnostics" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
            { noremap = true, silent = true, desc = "go to next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
            { noremap = true, silent = true, desc = "go to previous diagnostic" })

        -- references
        vim.keymap.set("n", "<leader>re", function() vim.lsp.buf.references() end,
            { noremap = true, silent = true, desc = "add references to quickfix" })

        -- refactor, format, and code action
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end,
            { noremap = true, silent = true, desc = "refactor identifier" })
        vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format() end,
            { noremap = true, silent = true, desc = "format buffer" })
        vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end,
            { noremap = true, silent = true, desc = "open code action" })
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
