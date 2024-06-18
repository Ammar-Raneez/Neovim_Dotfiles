return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "windwp/nvim-ts-autotag" }
  },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = { enable = true }
    })
  end,
}
