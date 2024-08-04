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
            { "<Leader>e", "<CMD>NvimTreeToggle<CR>", mode = {"n", "v"}, desc = "File Explorer" },
        },
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require'telescope'.setup()
            local builtin = require('telescope.builtin')
            local keymap = vim.keymap
            keymap.set({'n', 'v'}, '<leader>fb', builtin.buffers, {desc = "Buffers"})
            keymap.set({'n', 'v'}, '<leader>fc', builtin.command_history, {desc = "Command history"})
            keymap.set({'n', 'v'}, '<leader>fs', function() builtin.colorscheme({enable_preview = true}) end, {desc = "Colorscheme"})
            keymap.set({'n', 'v'}, '<leader>ff', builtin.find_files, {desc = "Files"})
            keymap.set({'n', 'v'}, '<leader>fgc', builtin.git_commits, {desc = "Git commits"})
            keymap.set({'n', 'v'}, '<leader>fgs', builtin.git_status, {desc = "Git statuss"})
            keymap.set({'n', 'v'}, '<leader>fh', builtin.help_tags, {desc = "Help"})
            keymap.set({'n', 'v'}, '<leader>fk', builtin.keymaps, {desc = "Keymaps"})
            keymap.set({'n', 'v'}, '<leader>fm', builtin.marks, {desc = "Marks"})
            keymap.set({'n', 'v'}, '<leader>fM', builtin.man_pages, {desc = "Man pages"})
            keymap.set({'n', 'v'}, '<leader>fo', builtin.vim_options, {desc = "Options"})
            keymap.set({'n', 'v'}, '<leader>fO', builtin.oldfiles, {desc = "Old files"})
            keymap.set({'n', 'v'}, '<leader>fr', builtin.registers, {desc = "Registers"})
            keymap.set({'n', 'v'}, '<leader>fT', builtin.current_buffer_fuzzy_find, {desc = "Text in current buffer"})
            keymap.set({'n', 'v'}, '<leader>ft', builtin.live_grep, {desc = "Text"})
            keymap.set({'n', 'v'}, '<leader>f:', builtin.commands, {desc = "Commands"})
        end,
    },

    {
        "phaazon/hop.nvim",
        config = function()
            local hop = require'hop'
            local hint = require'hop.hint'
            local directions = hint.HintDirection
            local positions = hint.HintPosition

            hop.setup()

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
        end,
        keys = {
            { "<Leader>b", "<CMD>BufferLinePick<CR>", mode = {"n", "v"}, desc = "Buffer switch"},
        },
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
}
