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

-- Install plugins
require("lazy").setup({

    -- UI
    { "catppuccin/nvim", name = "catppuccin" },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function() require "lualine".setup() end,
    },

    {
        'akinsho/bufferline.nvim', 
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function() require("bufferline").setup{} end,
    },

    {
        "folke/noice.nvim",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        
        },

        config = function()
            require("noice").setup({
              lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = true,
                  ["cmp.entry.get_documentation"] = true,
                },
              },
              -- you can enable a preset for easier configuration
              presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
              },        
          })
        end,
    },

    -- Search
    {
        "nvim-tree/nvim-tree.lua",
        config = function() require "nvim-tree".setup() end,
        dependencies = { "kyazdani42/nvim-web-devicons" },
        keys = {
          { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
        },
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end,
    },

    {
        "folke/which-key.nvim",
        config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          })
        end,
    },

    -- Text
    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end,
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end,
    },

    -- Lint
    { 
        'neovim/nvim-lspconfig',
        config = function() 
            require 'lint.lspconfig'
        end,
    },

    -- Completion
    
    -- Debug

    -- VCS
    { 
        'TimUntersberger/neogit', 
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    { 
        'sindrets/diffview.nvim', 
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

}, {
})
