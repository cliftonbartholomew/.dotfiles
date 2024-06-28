return {

    -- Treesitter for syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "python", "html", "javascript", "css", "lua" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
}
