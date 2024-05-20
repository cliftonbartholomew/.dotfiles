return {

    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },
        config = function()
            local cmp = require('cmp')
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())
            require("fidget").setup({})
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- language servers
                    "lua_ls", "pyright", "tsserver",
                },
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities
                        }
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = { version = "Lua 5.1" },
                                    diagnostics = {
                                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                                    }
                                }
                            }
                        }
                    end,
                }
            })
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                }),
                window = {
                    completion = {
                        border = "rounded",
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
                        max_height = 15,
                        max_width = 80,
                        zindex = 50,
                    },
                    documentation = {
                        border = "rounded",
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
                        max_height = 15,
                        max_width = 80,
                        zindex = 50,
                    },
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                })
            })
            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end
    },


    --treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all"
                ensure_installed = {
                    "bash", "c", "cpp", "css", "go", "html", "javascript",
                    "json", "lua", "python", "regex", "rust", "toml",
                    "typescript", "yaml", "jsdoc",
                },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
                auto_install = true,
                indent = {
                    enable = true
                },
                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = { "markdown" },
                },
            })
            local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            treesitter_parser_config.templ = {
                install_info = {
                    url = "https://github.com/vrischmann/tree-sitter-templ.git",
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "master",
                },
            }
            vim.treesitter.language.register("templ", "templ")
        end
    },

    -- mason tool installer (auto install formatters, linters, etc.)
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- formatters
                    "luaformatter", "black", "prettier",
                    -- linters
                    "luacheck", "pylint", "eslint_d",
                },
                auto_update = true,
                start_delay = 3000,
                run_on_start = true,
                integrations = {
                    ["mason-lspconfig"] = true,
                    ["mason-null-ls"] = true,
                    ["mason-nvim-dap"] = true,
                }

            })
        end
    }
}
