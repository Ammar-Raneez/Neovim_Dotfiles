return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "",
      "   ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "   ████╗  ██║██║   ██║██║████╗ ████║",
      "   ██╔██╗ ██║██║   ██║██║██╔████╔██║",
      "   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰱼  Find file", "<cmd>Telescope find_files<cr>"),
      dashboard.button("g", "󰈬  Live grep", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("r", "󰋚  Recent files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("e", "  File explorer", "<cmd>NvimTreeToggle<cr>"),
      dashboard.button("n", "  New file", "<cmd>enew<cr>"),
      dashboard.button("q", "󰈆  Quit", "<cmd>qa<cr>"),
    }

    dashboard.section.footer.val = "Duskfox • ready when you are"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#c4a7e7" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#6e6a86", italic = true })

    alpha.setup(dashboard.config)
  end,
}
