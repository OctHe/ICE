-- ---------------------------------------------------------------------
--
-- Plugins for version control system
-- Author: OctHe
--
-- ---------------------------------------------------------------------

return {

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

}
