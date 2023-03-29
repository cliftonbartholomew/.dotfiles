-- terminal mode remap Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><cmd>FloatermToggle<CR>")

-- toggle terminal
vim.keymap.set("n", "<leader>t", "<cmd>FloatermToggle<CR>")
