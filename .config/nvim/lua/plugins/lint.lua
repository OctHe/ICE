-- ---------------------------------------------------------------------
--
-- Lint and LSP plugins
-- Author: OctHe
-- Copyright (C): 2024
--
-- ---------------------------------------------------------------------

return {

    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require'lspconfig'

            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua (LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {'vim'},
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },

                -- Coorperation with cmp.nvim
                capabilities = require'cmp_nvim_lsp'.default_capabilities()
            }

            lspconfig.clangd.setup{}
        end,
    },

    {
        "ray-x/lsp_signature.nvim",
        opts = {},
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },

    {
        "mfussenegger/nvim-lint",
        opts = {
            events = { "BufWritePost", "BufReadPost", "InsertLeave" },
            linters = {
                vim = { "vint" },
                sh = { "shellcheck" },
                gitcommit = { "gitlint" },
                -- Disable lints if LSP is available
                -- python = { "flake8" },
                -- cpp = { "cppcheck", "cpplint", "cspell" },
                -- ['*'] = { 'global linter' },
                -- ['_'] = { 'fallback linter' },
            }
        },
        config = function(_, opts)

            local lint = require'lint'
            lint.linters_by_ft = opts.linters

            vim.api.nvim_create_autocmd(opts.events, {
                group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
                callback = function()
                    -- Ignore errors when linter is not installed
                    lint.try_lint(nil, {ignore_errors = true})
                end,
            })
        end,
    },

    -- Dim inactive code with treesitter
    {
        "folke/twilight.nvim",
        keys = {
            { "<Leader>td", "<CMD>Twilight<CR>", mode = {"n", "v"}, desc = "Dim inactive code" },
        },
    },

    -- Highlight and search TODO comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            words = {"TODO", "BUG", "HACK", "FIXME"}
        },
        config = function(_, opts)
            local todo = require'todo-comments'.setup()
            local keymap = vim.keymap

            keymap.set({"n", "v"}, "<Leader>gn", function()
                todo.jump_next({keywords = opts.words})
            end, { desc = "Goto next TODO" })

            keymap.set({"n", "v"}, "<Leader>gp", function()
                todo.jump_prev({keywords = opts.words})
            end, { desc = "Goto previous TODO" })

        end,
    },

    -- List and goto symbol
    {
        'stevearc/aerial.nvim',
        config = function() require('aerial').setup() end,
        keys = {
            { "<Leader>ts", "<CMD>AerialToggle<CR>", mode = {"n", "v"}, desc = "Toggle symbol window" },
        },
    },


    -- Treesitter and its plugins {{{1
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five {c, lua, vim, vimdoc, query} parsers should always be installed)
                -- compilation of treesitter-bash requires g++. Install it via system-level package manager
                -- For example: sudo zypper install gcc-g++
                ensure_installed = { "cpp", "python", "lua", "bash", "vim", "vimdoc", "query", "regex", "markdown"},

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                -- List of parsers to ignore installing (for "all")
                ignore_install = { "javascript" },

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    enable = true,

                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    -- disable = { "c", "rust" },
                    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                    -- disable = function(lang, buf)
                        --     local max_filesize = 100 * 1024 -- 100 KB
                        --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        --     if ok and stats and stats.size > max_filesize then
                        --         return true
                        --     end
                        -- end,

                        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                        -- Using this option may slow down your editor, and you may see some duplicate highlights.
                        -- Instead of true it can also be a list of languages
                        additional_vim_regex_highlighting = false,
                    },
                }
            end,
        },
        -- }}}1

        -- List to show the trouble in code.
        {
            "folke/trouble.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
            config = function()
                local keymap = vim.keymap
                local trouble = require'trouble'

                trouble.setup()

                keymap.set({"n", "v"}, "<leader>tb", function() trouble.toggle() end, {desc = "Trouble"})
                keymap.set({"n", "v"}, "<leader>tw", function() trouble.toggle("workspace_diagnostics") end, {desc = "Workspace trouble"})
                keymap.set({"n", "v"}, "<leader>td", function() trouble.toggle("document_diagnostics") end, {desc = "Document trouble"})
                keymap.set({"n", "v"}, "<leader>tq", function() trouble.toggle("quickfix") end, {desc = "Quickfix list"})
                keymap.set({"n", "v"}, "<leader>tl", function() trouble.toggle("loclist") end, {desc = "Location list"})
                keymap.set({"n", "v"}, "<leader>tr", function() trouble.toggle("lsp_references") end, {desc = "LSP reference"})
            end
        },

        -- Highlight other uses of the word under the cursor
        { "RRethy/vim-illuminate" },

    }
