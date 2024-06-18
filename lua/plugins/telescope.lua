return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local tel_builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-l>", tel_builtin.find_files, {})
			vim.keymap.set("n", "<C-p>", tel_builtin.git_files, {})
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
