-- ---------------------------------------------------------------------
--
-- Let nvim looks better
-- Author: OctHe
-- Copyright (C): 2024
--
-- ---------------------------------------------------------------------

return {
    -- colorscheme tokyonight, tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
    {
        'folke/tokyonight.nvim',
        -- Change colorscheme after loading plugins
        config = function() vim.cmd [[colorscheme tokyonight]] end,
    },

    -- colorscheme nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
    {
        "EdenEast/nightfox.nvim",
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
    },

    {
        "ellisonleao/gruvbox.nvim",
    },

    {
        'navarasu/onedark.nvim',
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require'ibl'.setup()
        end,
    },

    {
        "folke/which-key.nvim",
        config = function()
            local opt = vim.opt
            local wk = require('which-key')
            opt.timeout = true
            opt.timeoutlen = 300

            wk.register({
              ["<leader>c"] = { name = "+Comment" },
              ["<leader>f"] = { name = "+Find" },
              ["<leader>fg"] = { name = "+Git" },
              ["<leader>g"] = { name = "+Goto" },
              ["<leader>s"] = { name = "+Treesitter" },
              ["<leader>t"] = { name = "+Toggle" },
            })
            wk.setup()
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require'lualine'.setup() end,
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
            require'noice'.setup({
              lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = true,
                  ["cmp.entry.get_documentation"] = true,
                },

                -- Set to false when uses lsp_signature
                signature = { enabled = false },
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

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },

}
