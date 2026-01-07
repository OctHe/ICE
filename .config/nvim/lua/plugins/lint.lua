-- ---------------------------------------------------------------------
--
-- Lint and LSP plugins
-- Author: OctHe
-- Copyright (C)
--
-- ---------------------------------------------------------------------

return {

    {
        "neovim/nvim-lspconfig",
        config = function()
            -- vim.lsp.config('lua_ls', {})
            vim.lsp.enable('lua_ls')

            vim.lsp.enable('clangd')

            vim.lsp.enable('pyright')
        end,

        keys = {
            { "gf", "<CMD>lua vim.lsp.buf.definition()<CR>", mode = { "n", "v" }, desc = "Goto file" },
        },
    },

    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },

    {
        "ray-x/lsp_signature.nvim",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
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
            },
        },
        config = function(_, opts)
            local lint = require("lint")
            lint.linters_by_ft = opts.linters

            vim.api.nvim_create_autocmd(opts.events, {
                group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
                callback = function()
                    -- Ignore errors when linter is not installed
                    lint.try_lint(nil, { ignore_errors = true })
                end,
            })
        end,
    },

    -- Dim inactive code with treesitter
    {
        "folke/twilight.nvim",
        keys = {
            { "<Leader>td", "<CMD>Twilight<CR>", mode = { "n", "v" }, desc = "Dim inactive code" },
        },
    },

    -- Highlight and search TODO comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            words = { "TODO", "BUG", "HACK", "FIXME" },
        },
        config = function(_, opts)
            local todo = require("todo-comments").setup()
            local keymap = vim.keymap

            keymap.set({ "n", "v" }, "<Leader>gn", function()
                todo.jump_next({ keywords = opts.words })
            end, { desc = "Goto next TODO" })

            keymap.set({ "n", "v" }, "<Leader>gp", function()
                todo.jump_prev({ keywords = opts.words })
            end, { desc = "Goto previous TODO" })
        end,
    },

    -- List and goto symbol
    {
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup()
        end,
        keys = {
            { "<Leader>ts", "<CMD>AerialToggle<CR>", mode = { "n", "v" }, desc = "Toggle symbol window" },
        },
    },

    -- Treesitter and its plugins {{{1
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all" (the five {c, lua, vim, vimdoc, query} parsers should always be installed)
                -- compilation of treesitter-bash requires g++. Install it via system-level package manager
                -- For example: sudo zypper install gcc-g++
                ensure_installed = { "cpp", "python", "lua", "bash", "vim", "vimdoc", "query", "regex", "markdown" },

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
                })
            end,
        },
        -- }}}1

        -- List to show the trouble in code.
        {
            "folke/trouble.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
            config = function()
                local keymap = vim.keymap
                local trouble = require("trouble")

                trouble.setup()

                keymap.set({ "n", "v" }, "<leader>tbw",
                function() trouble.toggle("workspace_diagnostics") end,
                { desc = "Workspace trouble" }
            )
            keymap.set({ "n", "v" }, "<leader>tbd",
            function() trouble.toggle("document_diagnostics") end,
            { desc = "Document trouble" }
        )
        keymap.set({ "n", "v" }, "<leader>tbq",
        function() trouble.toggle("quickfix") end,
        { desc = "Quickfix list" }
    )
    keymap.set({ "n", "v" }, "<leader>tbl",
    function() trouble.toggle("loclist") end,
    { desc = "Location list" }
)
keymap.set({ "n", "v" }, "<leader>tbr",
function() trouble.toggle("lsp_references") end,
{ desc = "LSP reference" }
                )
            end,
        },

        -- Highlight other uses of the word under the cursor
        { "RRethy/vim-illuminate" },

        -- Format code
        {
            "mhartington/formatter.nvim",
            config = function()
                -- Utilities for creating configurations
                local util = require("formatter.util")

                -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
                require("formatter").setup({
                    -- Enable or disable logging
                    logging = true,
                    -- Set the log level
                    log_level = vim.log.levels.WARN,
                    -- All formatter configurations are opt-in
                    filetype = {
                        -- formatter.nvim provides default config for each formatter
                        lua = { require("formatter.filetypes.lua").stylua, },
                        c = { require("formatter.filetypes.c").uncrustify, },
                        cpp = { require("formatter.filetypes.cpp").uncrustify, },
                        python = { 
                            require("formatter.filetypes.python").black, 
                            require("formatter.filetypes.python").isort, 
                        },

                        -- Use the special "*" filetype for defining formatter configurations on any filetype
                        -- ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace, },
                    },
                })

                -- Uncomment the follows to format after saving the buffer
                -- vim.api.nvim_create_autocmd('BufWritePost', {
                    --     pattern = '*',
                    --     callback = function()
                        --         vim.cmd([[Format]])
                        --     end,
                        -- })
                    end,
                },
            }
