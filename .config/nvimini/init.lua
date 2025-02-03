-- ---------------------------------------------------------------------
--
-- A minimum Neovim run command file. It uses Lazy.nvim and mini.nvim
-- Author: OctHe
-- Copyright (C): 2024
--
-- ---------------------------------------------------------------------

-- Options
local opt = vim.opt

opt.showbreak = ">>"
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.expandtab = true -- Use space instead of tab
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autowrite = true
opt.clipboard = "unnamedplus" -- Sync with system-level clipboard
opt.fileencodings = "utf-8,gb18030,latin1"

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

-- Keymapping
local keymap = vim.keymap
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
-- Indent with visual mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Terminal
keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter normal mode" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
opt.rtp:prepend(lazypath)

if vim.loop.fs_stat(lazypath) then

    require("lazy").setup({
        {
            'echasnovski/mini.nvim', version = '*',
            config = function()
                -- require('mini.animate').setup()
                require'mini.basics'.setup({
                    mappings = {
                      basic = true,
                      option_toggle_prefix = [[\]],
                      windows = true,
                      move_with_alt = true,
                    }
                })
                require'mini.bufremove'.setup()
                require'mini.clue'.setup()
                require'mini.colors'.setup()
                require'mini.comment'.setup()
                require'mini.completion'.setup()
                require'mini.cursorword'.setup()
                -- require'mini.extra'.setup()
                require'mini.files'.setup()
                require'mini.fuzzy'.setup()
                require'mini.hipatterns'.setup()
                require'mini.indentscope'.setup()
                require'mini.jump'.setup()
                require'mini.jump2d'.setup()
                require'mini.move'.setup()
                require'mini.pairs'.setup()
                require'mini.pick'.setup()
                require'mini.splitjoin'.setup()
                require'mini.starter'.setup()
                require'mini.statusline'.setup()
                require'mini.surround'.setup()
                require'mini.tabline'.setup()
                require'mini.trailspace'.setup()

                vim.cmd [[ colorscheme minicyan ]]
            end
        },
        {
            'stevearc/conform.nvim',
            opts = {},
        }
    },
    {
        -- Change the directory of the lazy-lock.json
        lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
        -- try to load one of these colorschemes when starting an installation during startup
        install = { colorscheme = {"minicyan", "peachpuff"} },
        checker = { enabled = true }, -- automatically check for plugin updates
    })
end
