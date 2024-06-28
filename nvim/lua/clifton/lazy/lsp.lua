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
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "html", "tsserver", "cssls", "lua_ls" },
			})
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
		end,
	},

	-- null-ls for integrating linters and formatters
	{
		"nvim-tools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					-- Python
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.flake8,
					-- JavaScript/TypeScript
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
					-- HTML
					null_ls.builtins.formatting.prettier,
					-- CSS
					null_ls.builtins.formatting.prettier,
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
					"black",
					"flake8",
					-- JavaScript/TypeScript tools
					"prettier",
					"eslint_d",
					-- Django tools
					"djlint",
					-- Lua
					"stylua",
					"luacheck",
				},
				auto_update = true,
				run_on_start = true,
			})
		end,
	},
}
