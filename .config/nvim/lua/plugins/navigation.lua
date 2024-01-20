-- ---------------------------------------------------------------------
--
-- Plugins for navigation in the project
-- Author: OctHe
-- Copyright (C): 2024
--
-- ---------------------------------------------------------------------

return {

    {
        "nvim-tree/nvim-tree.lua",
        -- nvim-web-devicons requires Hack Nerd font. Install it manual
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require'nvim-tree'.setup()
            -- Autoclose if tree window is the last window from the plugin's wiki
            -- It also works for floating window
            vim.api.nvim_create_autocmd("QuitPre", {
              callback = function()
                local tree_wins = {}
                local floating_wins = {}
                local wins = vim.api.nvim_list_wins()
                for _, w in ipairs(wins) do
                  local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                  if bufname:match("NvimTree_") ~= nil then
                    table.insert(tree_wins, w)
                  end
                  if vim.api.nvim_win_get_config(w).relative ~= '' then
                    table.insert(floating_wins, w)
                  end
                end
                if 1 == #wins - #floating_wins - #tree_wins then
                  -- Should quit, so we close all invalid windows.
                  for _, w in ipairs(tree_wins) do
                    vim.api.nvim_win_close(w, true)
                  end
                end
              end
            })
        end,
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
          require("which-key").setup{}
        end,
    },

    {
        "phaazon/hop.nvim",
        config = function() 
            local hop = require'hop'
            local hint = require'hop.hint'
            local directions = hint.HintDirection
            local positions = hint.HintPosition

            hop.setup{}

            vim.keymap.set('', 'f', function()
              hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end, {remap=true})
            vim.keymap.set('', 'F', function()
              hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end, {remap=true})
            vim.keymap.set('', 't', function()
              hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end, {remap=true})
            vim.keymap.set('', 'T', function()
              hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
            end, {remap=true})
            vim.keymap.set('', 'W', function()
              hop.hint_words({ direction = directions.AFTER_CURSOR })
            end, {remap=true})
            vim.keymap.set('', 'E', function()
              hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
            end, {remap=true})
            vim.keymap.set('', 'B', function()
              hop.hint_words({ direction = directions.BEFORE_CURSOR })
            end, {remap=true})
            vim.keymap.set('', 'gE', function()
              hop.hint_words({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
            end, {remap=true})
        end
    },

    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('bufferline').setup()
            vim.keymap.set('n', '<Leader>b', '<CMD>BufferLinePick<CR>')
        end,
    },

}
