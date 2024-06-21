return {
	"Bekaboo/dropbar.nvim",
	config = function()
		require("dropbar").setup({
			dependencies = {
				"nvim-telescope/telescope-fzf-native.nvim",
			},
		})
	end,
}
