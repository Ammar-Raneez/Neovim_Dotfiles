return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      styles = {
        keywords = { "bold" },
        functions = { "italic" },
        comments = { "italic" },
        conditionals = { "italic" },
      },
    })

    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
