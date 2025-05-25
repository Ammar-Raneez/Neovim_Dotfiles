return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"black",
					"debugpy",
					"flake8",
					"isort",
					"mypy",
					"pylint",
					-- "eslint_d",
				},
			})

			vim.api.nvim_command("MasonToolsInstall")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"pyright",
					"angularls",
					"cssls",
					"html",
					"jsonls",
					"yamlls",
					"prismals",
					"tailwindcss",
					"bashls",
          "gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = function(client)
					-- Disable tsserver's formatting in favor of null-ls
					client.server_capabilities.document_formatting = false
				end,
				settings = {
					javascript = {
						format = {
							enable = false, -- Disable in-built tsserver formatting
						},
					},
					typescript = {
						format = {
							enable = false, -- Disable in-built tsserver formatting
						},
					},
				},
			})

			-- Null-ls Setup (for formatting)
			require("null-ls").setup({
				sources = {
					require("null-ls").builtins.formatting.prettierd,
					require("null-ls").builtins.formatting.black,
				},
			})

			lspconfig.angularls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			-- lspconfig.eslint.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.prismals.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })

			-- Hover information
			vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, {})

			-- Go to definition
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})

			-- Go to declaration
			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})

			-- Autocomplete code action
			vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, {})

			vim.keymap.set({ "n", "i" }, "<C-Space>", "<cmd>vim.lsp.buf.completion()<CR>")

			-- Set popup to rounded borders
			local open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or "rounded"
				return open_floating_preview(contents, syntax, opts, ...)
			end
		end,
	},
}
