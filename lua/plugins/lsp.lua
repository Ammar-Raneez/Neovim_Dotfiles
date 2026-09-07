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
					"ts_ls",
					"pyright",
					"angularls",
					"cssls",
					"html",
					"jsonls",
					"yamlls",
					"prismals",
					"tailwindcss",
					"bashls",
					-- "gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Apply capabilities to every server by default
			vim.lsp.config("*", { capabilities = capabilities })

			vim.lsp.config("lua_ls", {})

			vim.lsp.config("ts_ls", {
				on_attach = function(client)
					-- Disable ts_ls's formatting in favor of null-ls
					client.server_capabilities.document_formatting = false
				end,
				settings = {
					javascript = {
						format = {
							enable = false, -- Disable in-built ts_ls formatting
						},
					},
					typescript = {
						format = {
							enable = false, -- Disable in-built ts_ls formatting
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

			vim.lsp.config("angularls", {})
			vim.lsp.config("cssls", {})
			-- vim.lsp.config("eslint", {})
			vim.lsp.config("html", {})
			vim.lsp.config("prismals", {})
			vim.lsp.config("tailwindcss", {})
			vim.lsp.config("pyright", {
				-- before_init = function(params)
				-- 	local venv = os.getenv("VIRTUAL_ENV") -- Get the venv path from the environment
				-- 	if venv then
				-- 		params.settings.python.pythonPath = venv .. "/bin/python"
				-- 	else
				-- 		params.settings.python.pythonPath = vim.fn.exepath("python3") -- Fallback to system Python
				-- 	end
				-- end,
			})
			vim.lsp.config("jsonls", {})
			vim.lsp.config("yamlls", {})
			vim.lsp.config("bashls", {})
			vim.lsp.config("gopls", {})

			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"angularls",
				"cssls",
				-- "eslint",
				"html",
				"prismals",
				"tailwindcss",
				"pyright",
				"jsonls",
				"yamlls",
				"bashls",
				"gopls",
			})

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
