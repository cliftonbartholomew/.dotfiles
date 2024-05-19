-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "toggle NvimTree" })
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>",
    { noremap = true, silent = true, desc = "find file in NvimTree" })

-- keymap for help popup is: g?
