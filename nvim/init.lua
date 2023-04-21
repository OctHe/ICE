-- Edit
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.undofile = true
vim.o.list = true
vim.o.smartindent = true

-- Search
-- vim.o.ignorecase = true
-- vim.o.smartcase = true

-- UI
vim.o.number = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = ">>"
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5

-- Keymapping
vim.g.mapleader = " "
vim.g.maplocalleader = "  "

require "plugins"

-- Change colorscheme after loading plugins
vim.cmd [[colorscheme catppuccin]]
