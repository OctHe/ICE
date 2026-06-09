-- ---------------------------------------------------------------------
--
-- Lint and LSP plugins
-- Author: OctHe
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
