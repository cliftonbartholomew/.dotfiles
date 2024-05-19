local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { noremap = true, silent = true, desc = "add file to harpoon" })
vim.keymap.set("n", "<C-f>", ui.toggle_quick_menu,
    { noremap = true, silent = true, desc = "toggle harpoon files" })

-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
