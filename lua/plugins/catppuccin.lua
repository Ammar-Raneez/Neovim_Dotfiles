return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      terminal_colors = true,
      styles = {
        keywords = { "bold" },
        functions = { "italic" },
      },
    })

    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
}
