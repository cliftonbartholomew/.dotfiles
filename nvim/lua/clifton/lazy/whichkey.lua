return {
    --which key (mapping navigation)
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            require("which-key").add({
                { "<leader>f", group = "telescope" },
                { "<leader>c", group = "copilot" },
                { "<leader>g", group = "git" },
                { "<leader>r", group = "lsp" },
                { "<leader>n", group = "nvim-tree" },
            })
        end,
        opts = {
            plugins = {
                marks = true, -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in normal or <C-r> in insert mode
                spelling = {
                    enabled = false, -- enabling this will show WhichKey for spell checking
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true, -- adds help for operators like d, y, ... and registers for them
                    motions = true, -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = false, -- default bindings on <c-w>
                    z = true, -- bindings for folds, spelling and others prefixed with z
                    g = true, -- bindings for prefixed with g
                },
            },
            motions = {
                count = true, -- show the count for the motion
                jump = true, -- jump to the position of the key. This is the same as group
            },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },
            popup_mappings = {
                scroll_down = "<c-d>", -- binding to scroll down inside the popup
                scroll_up = "<c-u>", -- binding to scroll up inside the popup
            },
            window = {
                border = "single", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
                zindex = 1000, -- positive value to position WhichKey above other floating windows.
            },
            layout = {
                height = { min = 4, max = 25 },                                                         -- min and max height of the columns
                width = { min = 20, max = 50 },                                                         -- min and max width of the columns
                spacing = 3,                                                                            -- spacing between columns
            },
            ignore_missing = false,                                                                     -- enable this to hide mappings for which you didn't specify a label
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "<Plug>", "<SID>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
            show_keys = true,                                                                           -- show the currently pressed key and its label as a message in the command line
            show_help = true,                                                                           -- show help message on the command line when the popup is visible
            triggers = "auto",                                                                          -- automatically setup triggers
            triggers_nowait = {
                -- marks
                "`",
                "'",
                "g`",
                "g'",
                -- registers
                '"',
                "<c-r>",
                -- spelling
                "z=",
            },
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for keymaps that start with a native binding
                i = { "j", "k" },
                v = { "j", "k" },
            },
        },
    },
}
