vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")


vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.pumheight = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fillchars = { eob = " " }
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Rounded borders on every floating window (LSP hover, diagnostics, ...).
-- Neovim 0.11 applies this globally, so plugins no longer each need their own.
vim.opt.winborder = "rounded"

-- Subtle translucency on the completion menu.
vim.opt.pumblend = 10

-- Scroll wrapped lines by screen line instead of jumping a whole buffer line.
vim.opt.smoothscroll = true
