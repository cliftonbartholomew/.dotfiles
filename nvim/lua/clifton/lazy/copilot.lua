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
                        open = "<M-CR>",
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4,
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
                copilot_node_command = "node", -- Node.js version must be > 18.x
                server_opts_overrides = {},
            })
        end,
    },

    -- copiliot chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        opts = {
            allow_insecure = true,                                  -- Allow insecure server connections
            model = "gpt-4",                                        -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
            temperature = 0.1,                                      -- GPT temperature
            question_header = "",                                   -- Header to use for user questions
            answer_header = "",                                     -- Header to use for AI answers
            error_header = "",                                      -- Header to use for errors
            show_help = false,
            context = "buffers",                                    -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
            history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
            window = {
                layout = "vertical",                                -- 'vertical', 'horizontal', 'float', 'replace'
                relative = "editor",                                -- 'editor', 'win', 'cursor', 'mouse'
                title = "Copilot Chat",                             -- title of chat window
            },
            -- default mappings
            mappings = {
                open_prompt = {
                    normal = "<leader>cc",
                },
                reset = {
                    normal = "",
                    insert = "",
                },
                submit_prompt = {
                    normal = "<CR>",
                    insert = "<C-m>",
                },
                accept_diff = {
                    normal = "<C-y>",
                    insert = "<C-y>",
                },
                yank_diff = {
                    normal = "gy",
                },
                show_diff = {
                    normal = "gd",
                },
                show_info = {
                    normal = "gp",
                },
                show_context = {
                    normal = "gs",
                },
            },
        },
    },
}
