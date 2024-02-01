-- ---------------------------------------------------------------------
--
-- Build, debug and run programs
-- Author: OctHe
-- Copyright (C): 2024
--
-- ---------------------------------------------------------------------

return {

    {
        'akinsho/toggleterm.nvim',
        config = function()
            require("toggleterm").setup{}

        end
    },

    {
         'michaelb/sniprun',
         build = "bash ./install.sh",
    },

}
