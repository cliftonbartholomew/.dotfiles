local lsp = require("lsp-zero")

lsp.preset("recommended")

-- lsp.ensure_installed({ 'tsserver', })

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done() -- configure autopairs with cmp
)

-- setup autocompletion
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
})


lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({})


lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { noremap = true, silent = true, desc = "go to definition" })
    vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.definition() end,
        { noremap = true, silent = true, desc = "go to definition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
        { noremap = true, silent = true, desc = "show hover" })
    vim.keymap.set("n", "<leader>rd", function() vim.diagnostic.open_float() end,
        { noremap = true, silent = true, desc = "open diagnostics" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
        { noremap = true, silent = true, desc = "go to next diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
        { noremap = true, silent = true, desc = "go to previous diagnostic" })
    vim.keymap.set("n", "<leader>re", function() vim.lsp.buf.references() end,
        { noremap = true, silent = true, desc = "add references to quickfix" })
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end,
        { noremap = true, silent = true, desc = "refactor identifier" })
    vim.keymap.set("n", "<F3>", function() vim.lsp.buf.rename() end,
        { noremap = true, silent = true, desc = "format buffer" })
    vim.keymap.set("n", "<F4>", function() vim.lsp.buf.rename() end,
        { noremap = true, silent = true, desc = "open code action" })
end)

lsp.setup()
