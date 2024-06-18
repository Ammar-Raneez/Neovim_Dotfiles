return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup()
    local tree_api = require("nvim-tree.api")
    vim.keymap.set("n", "<C-b>", tree_api.tree.toggle, {})
  end
}
