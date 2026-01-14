-- ---------------------------------------------------------------------
--
-- Plugins for help hints
-- Author: OctHe
--
-- ---------------------------------------------------------------------

return {

  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
      disabled_keys = {
        ["<Up>"] = false,
        ["<Down>"] = false,
      }
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
}
