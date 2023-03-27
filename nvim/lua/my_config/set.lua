-- vim.opt and vim.o access vim options 
-- see :help options for option list
-- vim.g is global variables 
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. ".vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 2
vim.opt.colorcolumn = "80"

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.cmd("colorscheme gruvbox")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- transparent background
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- plugin jianmiao/auto-pairs
-- and remaps for auto-pairs
-- plugin prettier
-- plugin nerdtree
-- learn last remaps in remap folder
-- learn autocomplete and language server detault rempas. add as comments in remap
-- remaps resize using alt and arrow keys


