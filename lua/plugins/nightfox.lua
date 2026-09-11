return {
  "EdenEast/nightfox.nvim",
  name = "nightfox",
  lazy = false,
  priority = 1000,
  config = function()
    -- The active variant (duskfox / dawnfox) is chosen by lua/theme.lua
    -- based on the macOS system appearance.
    require("theme").setup()
  end,
}
