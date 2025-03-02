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

-- Bootstrap mini.nvim
local package_path = vim.fn.stdpath("data") .. '/site/'
local minipath = package_path .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(minipath) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    vim.fn.system({ "git", "clone", "https://github.com/echasnovski/mini.nvim", minipath })
    vim.cmd(('packadd mini.nvim | helptags ALL'))
    vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

if vim.loop.fs_stat(minipath) then
    -- Set up 'mini.deps' (customize to your liking)
    require('mini.deps').setup({ path = { package = package_path } })

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

    MiniDeps.add({
        source = 'stevearc/conform.nvim',
    })

else
    vim.cmd [[ colorscheme peachpuff]]
end
