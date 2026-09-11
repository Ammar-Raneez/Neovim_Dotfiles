return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      update_focused_file = { enable = true },
      view = { adaptive_size = true, width = 32 },
      -- Show git-ignored files such as node_modules and .env.
      -- Toggle live from inside the tree with "I".
      filters = { git_ignored = false },
    })
    local tree_api = require("nvim-tree.api")
    vim.keymap.set("n", "<C-b>", tree_api.tree.toggle, {})
  end
}
