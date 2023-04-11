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

    { "lukas-reineke/indent-blankline.nvim" },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require "lualine".setup({}) end,
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
            require"ui.noice"
        end,
    },

    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require('bufferline').setup() end,
    },

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },

    -- Search
    {
        "nvim-tree/nvim-tree.lua",
        config = function() require "nvim-tree".setup() end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
          { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
        },
    },

    {
        'nvim-telescope/telescope.nvim',
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
            -- Leave it empty to use the default settings
          })
        end,
    },

    -- Text
    {
        'numToStr/Comment.nvim',
        config = function() require('text.comment') end,
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    },

    {
        "phaazon/hop.nvim",
        config = function() require("text.hop") end
    },

    {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end,
    },

    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        'akinsho/toggleterm.nvim', 
        config = true,
    },

    -- Lint
    {
        'neovim/nvim-lspconfig',
        config = function() require 'lint.lspconfig' end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function() require 'lint.treesitter' end,
    },

    -- List to show the trouble in code.
    -- It relies on LSP
    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- leave it empty to use the default settings
        }
      end
    },

    -- Highlight other uses of word.
    -- It relies on treesitter and LSP
    { "RRethy/vim-illuminate" },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
        },
        config = function() require 'completion.cmp' end,
    },

    {
        "ray-x/lsp_signature.nvim",
        config = function() require 'lsp_signature'.setup() end,
    },

    -- Debug
    {
         'michaelb/sniprun',
        build = "bash ./install.sh",
    },

    -- VCS
    {
        'TimUntersberger/neogit',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    },

    {
        'sindrets/diffview.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

}, {
})
