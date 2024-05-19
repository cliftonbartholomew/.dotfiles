-- move rows up and down
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "move selected lines down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "move selected lines up" })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "move current line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "move current line up" })
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { desc = "move current line down" })
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { desc = "move current line up" })

-- duplicate line
vim.keymap.set("", "<M-K>", ":t.<CR>k", { noremap = true, desc = "duplicate line above" })
vim.keymap.set("", "<M-J>", ":t-1<CR>j", { noremap = true, desc = "duplicate line below" })

-- center movements on screen
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, desc = "join lines, keep cursor position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "center half move down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "center half move up" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, desc = "center next search" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, desc = "center previous search" })

-- increase buffer size with alt-arrows
vim.keymap.set("n", "<M-Up>", ":resize -2<CR>", { noremap = true, desc = "decrease buffer size" })
vim.keymap.set("n", "<M-Down>", ":resize +2<CR>", { noremap = true, desc = "increase buffer size" })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { noremap = true, desc = "decrease buffer size" })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { noremap = true, desc = "increase buffer size" })

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { noremap = true, desc = "yank to clipboard" })

-- escape with jk
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "escape with jk" })

-- Easier windows navigations
vim.keymap.set({ "n", "x" }, "<C-w>", "<C-W><C-w>", { noremap = true, desc = "move to next window" })
vim.keymap.set({ "n", "x" }, "<C-h>", "<C-W><C-h>", { noremap = true, desc = "move to left window" })
vim.keymap.set({ "n", "x" }, "<C-j>", "<C-W><C-j>", { noremap = true, desc = "move to down window" })
vim.keymap.set({ "n", "x" }, "<C-k>", "<C-W><C-k>", { noremap = true, desc = "move to up window" })
vim.keymap.set({ "n", "x" }, "<C-l>", "<C-W><C-l>", { noremap = true, desc = "move to right window" })
