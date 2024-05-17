require('copilot').setup({
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
    copilot_node_command = 'node', -- Node.js version must be > 16.x
    server_opts_overrides = {},
})

local prompts = require('CopilotChat.prompts')
local select = require('CopilotChat.select')

require("CopilotChat").setup({
    debug = true,
    system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
    model = 'gpt-4',                              -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
    temperature = 0.1,                            -- GPT temperature
    window = {
        layout = 'float',                         -- 'vertical', 'horizontal', 'float', 'replace'
        width = 1,                                -- fractional width of parent, or absolute width in columns when > 1
        height = 0.4,                             -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = 'cursor',                      -- 'editor', 'win', 'cursor', 'mouse'
        border = 'single',                        -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = 1,                                  -- row position of the window, default is centered
        col = nil,                                -- column position of the window, default is centered
        title = 'Copilot Chat',                   -- title of chat window
        footer = nil,                             -- footer of chat window
        zindex = 1,                               -- determines if window is on top or below other floating
    },

    show_help = false,
    auto_insert_mode = true,
    question_header = "## User",
    answer_header = "## Copilot",
    error_header = "## Error",
    separator = "---",

    prompts = {
        Explain = {
            prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.',
        },
        Review = {
            prompt = '/COPILOT_REVIEW Review the selected code.',
            callback = function(response, source)
                -- see config.lua for implementation
            end,
        },
        Fix = {
            prompt = '/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.',
        },
        Optimize = {
            prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
        },
        Docs = {
            prompt = '/COPILOT_GENERATE Please add documentation comment for the selection.',
        },
        Tests = {
            prompt = '/COPILOT_GENERATE Please generate tests for my code.',
        },
        FixDiagnostic = {
            prompt = 'Please assist with the following diagnostic issue in file:',
            selection = select.diagnostics,
        },
        Commit = {
            prompt =
            'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            selection = select.gitdiff,
        },
        CommitStaged = {
            prompt =
            'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            selection = function(source)
                return select.gitdiff(source, true)
            end,
        },
    },

    mappings = {
        complete = {
            detail = 'Use @<Tab> or /<Tab> for options.',
            insert = '<Tab>',
        },
        close = {
            normal = 'q',
            insert = '<C-c>',
        },
        reset = {
            normal = '<C-l>',
            insert = '<C-l>',
        },
        submit_prompt = {
            normal = '<CR>',
            insert = '<C-s>',
        },
        accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>',
        },
        yank_diff = {
            normal = 'gy',
        },
        show_diff = {
            normal = 'gd',
        },
        show_system_prompt = {
            normal = 'gp',
        },
        show_user_selection = {
            normal = 'gs',
        },
    },

    selection = function(source)
        return select.visual(source) or select.line(source)
    end,


})

-- set mapping to open chat window
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { noremap = true, silent = true })
