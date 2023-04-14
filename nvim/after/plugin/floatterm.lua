vim.keymap.set("n", "<F7>", "<cmd>FloatermNew<CR>")
vim.keymap.set("t", "<F7>", "<C-\\><C-n><cmd>FloatermNew<CR>")
vim.keymap.set("t", "<F8>", "<C-\\><C-n><cmd>FloatermPrev<CR>")
vim.keymap.set("t", "<F9>", "<C-\\><C-n><cmd>FloatermNext<CR>")
vim.keymap.set("t", "<F10>", "<C-\\><C-n><cmd>FloatermKill<CR><cmd>FloatermToggle<CR>")
vim.keymap.set("n", "<F12>", "<cmd>FloatermToggle<CR>")
vim.keymap.set("t", "<F12>", "<C-\\><C-n><cmd>FloatermToggle<CR>")