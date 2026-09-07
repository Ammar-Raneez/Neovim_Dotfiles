return {
	{
		"nvim-telescope/telescope.nvim",
		-- Use the current release for Neovim 0.11 compatibility.
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local tel_builtin = require("telescope.builtin")
			telescope.setup({
				defaults = {
					prompt_prefix = "    ",
					selection_caret = "  ❯ ",
					path_display = { "smart" },
					layout_strategy = "flex",
					layout_config = { horizontal = { preview_width = 0.55 } },
					file_ignore_patterns = { "node_modules", ".git/" },
				},
			})
			vim.keymap.set("n", "<C-l>", tel_builtin.find_files, {})
			vim.keymap.set("n", "<C-p>", tel_builtin.git_files, {})
			vim.keymap.set("n", "<leader>ff", tel_builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", tel_builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", tel_builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", tel_builtin.help_tags, { desc = "Help tags" })
			vim.keymap.set("n", "<C-k>", function()
				tel_builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
