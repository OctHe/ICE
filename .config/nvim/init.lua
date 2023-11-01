-- ---------------------------------------------------------------------
--
-- Neovim run command file
-- Author: OctHe
-- Copyright (C): 2023
--
-- ---------------------------------------------------------------------

-- View {{{1
vim.o.list = true   -- Show tabs as ">", trailing spaces as "-", and non-breakable space characters as "+". 

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
-- }}}1

-- Completion {{{1
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.undofile = true

vim.o.smartindent = true
-- }}}1

-- Keymapping {{{1
vim.g.mapleader = " "
vim.g.maplocalleader = "  "
-- }}}1

require "plugins"

-- Change colorscheme after loading plugins
vim.cmd [[colorscheme catppuccin]]
