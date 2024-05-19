vim.keymap.set("n", "<F7>", "<cmd>FloatermNew<CR>", { noremap = true, desc = "open a new terminal" })
vim.keymap.set("t", "<F7>", "<C-\\><C-n><cmd>FloatermNew<CR>",
    { noremap = true, desc = "open a new terminal" })
vim.keymap.set("t", "<F8>", "<C-\\><C-n><cmd>FloatermPrev<CR>",
    { noremap = true, desc = "go to previous terminal" })
vim.keymap.set("t", "<F9>", "<C-\\><C-n><cmd>FloatermNext<CR>",
    { noremap = true, desc = "go to next terminal" })
vim.keymap.set("t", "<F10>", "<C-\\><C-n><cmd>FloatermKill<CR><cmd>FloatermToggle<CR>",
    { noremap = true, desc = "kill terminal" })
vim.keymap.set("n", "<F12>", "<cmd>FloatermToggle<CR>", { noremap = true, desc = "toggle terminal" })
vim.keymap.set("t", "<F12>", "<C-\\><C-n><cmd>FloatermToggle<CR>",
    { noremap = true, desc = "toggle terminal" })
