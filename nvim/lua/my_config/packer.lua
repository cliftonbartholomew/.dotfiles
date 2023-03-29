vim.cmd "packadd packer.nvim"

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- A fancy colour-scheme (set background to transparent)
    use { "ellisonleao/gruvbox.nvim" }

    -- Treesitter breaks files into tokens that are used for better colouring
    -- See :TSPlaygroundToggle
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- autopairs
    use('windwp/nvim-autopairs')

    -- floaterm
    use('voldikss/vim-floaterm')

    -- grep and find files
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- mark and quickly move between files
    use('ThePrimeagen/harpoon')

    -- see past state of a file for days
    use('mbbill/undotree')

    -- git wrapper for nvim
    use('tpope/vim-fugitive')

    -- LSP manager
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Tool to install LSP use :Mason
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional
            { "zbirenbaum/copilot.lua" },   -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
end)
