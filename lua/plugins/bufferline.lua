return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        -- Bufferline sets its highlights with `default = true` when themable,
        -- which cannot overwrite existing groups -- so its ColorScheme refresh
        -- silently no-ops and the startup palette sticks. Turning this off lets
        -- it re-derive from the active colorscheme on every switch.
        themable = false,
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true },
        },
      },
    })
  end,
}
