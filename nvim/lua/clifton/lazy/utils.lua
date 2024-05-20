return {

    -- copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<M-CR>"
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4
                    },
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<M-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
                copilot_node_command = 'node', -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end,
    },

    -- copiliot chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
        opts = {
            debug = false,                                                   -- Enable debug logging
            proxy = nil,                                                     -- [protocol://]host[:port] Use this proxy
            allow_insecure = false,                                          -- Allow insecure server connections
            model = 'gpt-4',                                                 -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
            temperature = 0.1,                                               -- GPT temperature
            question_header = '## User ',                                    -- Header to use for user questions
            answer_header = '## Copilot ',                                   -- Header to use for AI answers
            error_header = '## Error ',                                      -- Header to use for errors
            separator = '---',                                               -- Separator to use in chat
            show_folds = true,                                               -- Shows folds for sections in chat
            show_help = false,                                               -- Shows help message as virtual lines when waiting for user input
            auto_follow_cursor = true,                                       -- Auto-follow cursor in chat
            auto_insert_mode = true,                                         -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
            clear_chat_on_new_prompt = false,                                -- Clears chat on every new prompt
            context = 'buffers',                                             -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
            history_path = vim.fn.stdpath('data') .. '/copilotchat_history', -- Default path to stored history
            callback = nil,                                                  -- Callback to use when ask response is received
            -- default window options
            window = {
                layout = 'float',       -- 'vertical', 'horizontal', 'float', 'replace'
                width = 0.5,            -- fractional width of parent, or absolute width in columns when > 1
                height = 0.5,           -- fractional height of parent, or absolute height in rows when > 1
                -- Options below only apply to floating windows
                relative = 'editor',    -- 'editor', 'win', 'cursor', 'mouse'
                border = 'rounded',     -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
                row = nil,              -- row position of the window, default is centered
                col = nil,              -- column position of the window, default is centered
                title = 'Copilot Chat', -- title of chat window
                footer = nil,           -- footer of chat window
                zindex = 1,             -- determines if window is on top or below other floating windows
            },
            -- default mappings
            mappings = {
                open_prompt = {
                    normal = '<leader>cc',
                },
                complete = {
                    detail = 'Use @<Tab> or /<Tab> for options.',
                    insert = '<Tab>',
                },
                close = {
                    normal = 'q',
                    insert = '<C-c>'
                },
                reset = {
                    normal = '<C-l>',
                    insert = '<C-l>'
                },
                submit_prompt = {
                    normal = '<CR>',
                    insert = '<C-m>'
                },
                accept_diff = {
                    normal = '<C-y>',
                    insert = '<C-y>'
                },
                yank_diff = {
                    normal = 'gy',
                },
                show_diff = {
                    normal = 'gd'
                },
                show_system_prompt = {
                    normal = 'gp'
                },
                show_user_selection = {
                    normal = 'gs'
                },
            },
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
    },

    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    -- undotree
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'undo tree toggle' })
        end
    },

    -- terminal
    {
        "voldikss/vim-floaterm",
        config = function()
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
        end
    },


    -- git
    {
        "tpope/vim-fugitive",
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>',
                { noremap = true, silent = true, desc = "git push" })
            vim.api.nvim_set_keymap('n', '<leader>gg', ':G<CR>', { noremap = true, silent = true, desc = "git status" })
            vim.api.nvim_set_keymap('n', '<leader>gd', ':Gvdiffsplit<CR>',
                { noremap = true, silent = true, desc = "git diff" })
        end
    },
}
