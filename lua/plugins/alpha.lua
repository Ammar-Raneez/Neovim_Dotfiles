return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "",
      " ██████╗ ███████╗████████╗   ███████╗██╗  ██╗██╗████████╗   ██████╗  ██████╗ ███╗   ██╗███████╗",
      "██╔════╝ ██╔════╝╚══██╔══╝   ██╔════╝██║  ██║██║╚══██╔══╝   ██╔══██╗██╔═══██╗████╗  ██║██╔════╝",
      "██║  ███╗█████╗     ██║      ███████╗███████║██║   ██║      ██║  ██║██║   ██║██╔██╗ ██║█████╗  ",
      "██║   ██║██╔══╝     ██║      ╚════██║██╔══██║██║   ██║      ██║  ██║██║   ██║██║╚██╗██║██╔══╝  ",
      "╚██████╔╝███████╗   ██║      ███████║██║  ██║██║   ██║      ██████╔╝╚██████╔╝██║ ╚████║███████╗",
      " ╚═════╝ ╚══════╝   ╚═╝      ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝",
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

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Loading a colorscheme clears custom highlights, so these are re-derived
    -- on every switch instead of being hardcoded to one theme's palette.
    -- Title tracks the accent in both duskfox and dawnfox at ~6.5:1 contrast.
    local function restyle()
      vim.api.nvim_set_hl(0, "AlphaHeader", { link = "Title" })
      local comment = vim.api.nvim_get_hl(0, { name = "Comment", link = false })
      vim.api.nvim_set_hl(0, "AlphaFooter", { fg = comment.fg, italic = true })
      dashboard.section.footer.val = (vim.g.colors_name or "nvim") .. " • ready when you are"
      pcall(vim.cmd.AlphaRedraw)
    end

    restyle()
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("AlphaTheme", { clear = true }),
      callback = restyle,
    })

    alpha.setup(dashboard.config)
  end,
}
