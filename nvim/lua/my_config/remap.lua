-- move highlighted rows up and down
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", {})
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", {})
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", {})
vim.keymap.set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", {})
vim.keymap.set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", {})

-- duplicate line
vim.keymap.set("", "<M-K>", ":t.<CR>k", { noremap = true })
vim.keymap.set("", "<M-J>", ":t-1<CR>j", { noremap = true })

-- center movements on screen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- close windows
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { noremap = true })

-- increase buffer size with alt-arrows
vim.keymap.set("n", "<M-Up>", ":resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<M-Down>", ":resize +2<CR>", { noremap = true })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { noremap = true })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { noremap = true })

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>c", "<cmd>e ~/.config/nvim/lua/my_config/packer.lua<CR>");

-- Save
vim.keymap.set({ "", "!" }, "<C-s>", "<ESC>:w<CR>", { noremap = true })

-- Easier windows navigations
vim.keymap.set({ "n", "x" }, "<C-w>", "<C-W><C-w>", { noremap = true })
vim.keymap.set({ "n", "x" }, "<C-h>", "<C-W><C-h>", { noremap = true })
vim.keymap.set({ "n", "x" }, "<C-j>", "<C-W><C-j>", { noremap = true })
vim.keymap.set({ "n", "x" }, "<C-k>", "<C-W><C-k>", { noremap = true }) -- Careful of conflict with LSP (implemented in LSP section)
vim.keymap.set({ "n", "x" }, "<C-l>", "<C-W><C-l>", { noremap = true })
