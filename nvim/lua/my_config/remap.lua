-- move highlighted rows up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center movements on screen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>c", "<cmd>e ~/.config/nvim/lua/my_config/packer.lua<CR>");

-- terminal mode remap Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><cmd>FloatermToggle<CR>")
