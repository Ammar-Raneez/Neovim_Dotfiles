return {
  "folke/snacks.nvim",
  priority = 900,
  lazy = false,
  opts = {
    -- Rainbow indent guides. The SnacksIndent1..6 groups are defined in
    -- lua/theme.lua so they follow the light/dark switch.
    indent = {
      indent = {
        char = "│",
        hl = {
          "SnacksIndent1",
          "SnacksIndent2",
          "SnacksIndent3",
          "SnacksIndent4",
          "SnacksIndent5",
          "SnacksIndent6",
        },
      },
      scope = {
        char = "│",
        hl = "SnacksIndentScope",
      },
      animate = {
        enabled = true,
        style = "out",
        easing = "linear",
        duration = { step = 20, total = 400 },
      },
    },

    -- Animated scrolling.
    scroll = { enabled = true },
  },
}
