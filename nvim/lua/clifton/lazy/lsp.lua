return {
	-- LSP configuration using nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			require("fidget").setup({})
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					-- language servers
					"lua_ls",
					"pyright",
					"tsserver",
					"html",
					"cssls",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					-- lua handler (rest use default)
					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = { version = "Lua 5.1" },
									diagnostics = {
										globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
									},
								},
							},
						})
					end,
				},
			})

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
					["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
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
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
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
		end,
	},

	-- null-ls for integrating linters and formatters
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Python
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.flake8,
					-- JavaScript/TypeScript, HTML, CSS
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
					-- Django
					null_ls.builtins.formatting.djlint,
					-- Lua
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.luacheck,
				},
			})
		end,
	},

	-- Mason tool installer for managing external tools
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Python tools
					"black", -- formatter
					"flake8", -- linter
					"debugpy", -- debugger
					-- JavaScript/TypeScript tools
					"prettier", -- formatter
					"eslint_d", -- linter
					-- Django tools
					"djlint", -- linter
					-- Lua
					"stylua", -- formatter
					"luacheck", -- linter
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
}
