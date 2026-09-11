-- Follows the macOS system appearance and swaps the colorscheme live.
local M = {}

M.dark = "duskfox"
M.light = "dawnfox"

local current = nil

-- Rainbow indent guides. Each accent is blended toward its background to land
-- near 2.2:1 contrast -- visible, but not competing with the code itself.
local rainbow = {
  dark = { "#814661", "#67544b", "#515a55", "#4b5a6b", "#3b5c74", "#5f5377" },
  light = { "#ce99a5", "#ea9d34", "#97ad9e", "#84afb5", "#8dacb6", "#b2a1bf" },
}

-- The active scope sits brighter than the guides so it reads as the focus.
local scope = { dark = "#8c78a9", light = "#907aa9" }

local function set_indent_hl(mode)
  for i, colour in ipairs(rainbow[mode]) do
    vim.api.nvim_set_hl(0, "SnacksIndent" .. i, { fg = colour })
  end
  vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = scope[mode] })
end

local function refresh_lualine()
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    return
  end
  -- Re-run setup with the existing config so the "auto" theme is rebuilt
  -- against the highlight groups of the colorscheme we just loaded.
  lualine.setup(lualine.get_config())
end

function M.apply(mode, force)
  if mode == current and not force then
    return
  end
  current = mode
  vim.o.background = mode
  local scheme = mode == "dark" and M.dark or M.light
  local ok = pcall(vim.cmd.colorscheme, scheme)
  if ok then
    -- Must follow the colorscheme: loading one clears custom highlights.
    set_indent_hl(mode)
    refresh_lualine()
  end
end

-- `defaults read -g AppleInterfaceStyle` prints "Dark" in dark mode and exits
-- non-zero (with no output) in light mode. It takes <10ms, so the initial
-- read is done synchronously to avoid a flash of the wrong colorscheme.
local function detect_sync()
  local out = vim.fn.system({ "defaults", "read", "-g", "AppleInterfaceStyle" })
  return out:lower():find("dark") and "dark" or "light"
end

local function detect(cb)
  vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }, function(res)
    local mode = ((res.stdout or ""):lower():find("dark")) and "dark" or "light"
    vim.schedule(function()
      cb(mode)
    end)
  end)
end

function M.sync(force)
  detect(function(mode)
    M.apply(mode, force)
  end)
end

function M.setup()
  M.apply(detect_sync(), true)

  -- Catch changes made while nvim was in the background or unfocused.
  vim.api.nvim_create_autocmd({ "FocusGained", "VimResume" }, {
    group = vim.api.nvim_create_augroup("SystemTheme", { clear = true }),
    callback = function()
      M.sync()
    end,
  })

  -- Cheap async poll so the switch also lands on a visible, unfocused window.
  local timer = vim.uv.new_timer()
  timer:start(2000, 2000, function()
    vim.schedule(function()
      M.sync()
    end)
  end)
end

return M
