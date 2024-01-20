-- ---------------------------------------------------------------------
--
-- GL neovim run command file. It uses Lazy.nvim as the plugin manager.
-- Author: OctHe
-- Copyright (C): 2024
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
vim.g.maplocalleader = " "
-- }}}1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
    rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
            -- "gzip",
            -- "matchit",
            -- "matchparen",
            "netrwPlugin",
            -- "tarPlugin",
            -- "tohtml",
            -- "tutor",
            -- "zipPlugin",
            },
        },
    },
})
