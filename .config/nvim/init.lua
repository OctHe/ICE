-- ---------------------------------------------------------------------
--
-- Neovim run command file. It uses Lazy.nvim.
-- Author: OctHe
-- Copyright (C): 2023-2024
--
-- ---------------------------------------------------------------------

-- Options
local opt = vim.opt

opt.list = true   -- Shoptw tabs as ">", trailing spaces as "-", and noptn-breakable space characters as "+". 
opt.number = true
opt.wrap = true
opt.linebreak = true
opt.showbreak = ">>"
opt.mouse = "a"
opt.termguicolors = true
opt.signcolumn = "yes" -- Always show the signcolumn
opt.cursorline = true -- Highlight the current line
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.expandtab = true -- Use space instead of tab
opt.softtabstop = 4
opt.shiftwidth = 4
opt.undofile = true
opt.smartindent = true
opt.autowrite = true
opt.hidden = true -- Hide unwriten buffer
opt.clipboard = "unnamedplus" -- Sync with system-level clipboard
opt.fileencodings = "utf-8,gb18030,latin1"

if vim.fn.has("nvim-0.10") == 1 then
    opt.smoothscroll = true
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Keymapping
local keymap = vim.keymap
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
-- Indent with visual mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
-- Window-level motion with <ctrl> hjkl in normal and terminal mode
keymap.set({"n", "t"}, "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
keymap.set({"n", "t"}, "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
keymap.set({"n", "t"}, "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
keymap.set({"n", "t"}, "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- Terminal
keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter normal mode" })

-- Command
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    group = vim.api.nvim_create_augroup("pl-help", { clear = true }),
    callback = function()
        if vim.bo.filetype == 'help' then
            opt.number = true
            if vim.fn.winwidth('%') > 180 then
                vim.cmd[[ wincmd L ]]
                vim.cmd[[ vertical resize 120 ]]
            end
        end
    end,
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
opt.rtp:prepend(lazypath)

if vim.loop.fs_stat(lazypath) then
    -- Toggle Lazy.nvim
    keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

    require("lazy").setup({
        spec = {
            { import = "plugins" },
        },
        -- Change the directory of the lazy-lock.json
        lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
        -- try to load one of these colorschemes when starting an installation during startup
        install = { colorscheme = { "tokyonight", "desert"} },
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
                    "tutor",
                    -- "zipPlugin",
                },
            },
        },
    })
end
